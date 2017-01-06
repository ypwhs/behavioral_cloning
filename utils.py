import cv2
import numpy as np
import random

class Smooth:
    def __init__(self, windowsize=50):
        self.window_size = windowsize
        self.data = np.zeros(self.window_size, dtype=np.float32)
        self.index = 0
    
    def __iadd__(self, x):
        self.data[self.index % self.window_size] = x
        self.index += 1
        return self

    def __str__(self):
        return str(self.data[:self.index].mean())
    
    def __float__(self):
        return float(self.data[:self.index].mean())

class BatchGenerator:
    def __init__(self, df, batch, image_shape):
        self.df = df
        self.batch = batch
        self.image_shape = image_shape
        self.num = len(self.df.index)
    
    def next(self):
        X = np.ndarray((self.batch, self.image_shape[1], self.image_shape[0], 3), dtype=np.float32)
        y = np.ndarray((self.batch, 1), dtype=np.float32)
        image_shape = self.image_shape
        
        for i, index in enumerate(random.sample(self.df.index, self.batch)):
            img = cv2.imread(self.df.loc[index]['filename'])
            img = cv2.resize(img, image_shape)
            X[i] = img
            y[i] = self.df.loc[index]['dir']

        return X, y
