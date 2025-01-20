@interface PBCoreImageContext
- (BOOL)render9Up;
- (BOOL)renderForSave;
- (CGSize)outputSize;
- (PBCoreImageContext)initWithOptions:(id)a3;
- (_CAImageQueue)outputImageQueue;
- (__CVBuffer)createCVPixelBufferForFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5;
- (__CVBuffer)inputPixelBuffer;
- (__CVBuffer)outputPixelBuffer;
- (__CVPixelBufferPool)largePool;
- (__CVPixelBufferPool)smallPool;
- (id)ciContext;
- (unsigned)inputTexture;
- (unsigned)outputTexture;
- (void)_createPixelBuffer:(__CVBuffer *)a3 withSize:(CGSize)a4;
- (void)dealloc;
- (void)renderFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4;
- (void)renderFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5;
- (void)renderNineUp:(id)a3 inputPixelBuffer:(__CVBuffer *)a4;
- (void)renderNineUp:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5;
- (void)setInputPixelBuffer:(__CVBuffer *)a3;
- (void)setInputPixelBuffer:(__CVBuffer *)a3 mapTexture:(BOOL)a4;
- (void)setLargePool:(__CVPixelBufferPool *)a3;
- (void)setOutputImageQueue:(_CAImageQueue *)a3;
- (void)setOutputPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputPixelBuffer:(__CVBuffer *)a3 mapTexture:(BOOL)a4;
- (void)setOutputSize:(CGSize)a3;
- (void)setRender9Up:(BOOL)a3;
- (void)setRenderForSave:(BOOL)a3;
- (void)setSmallPool:(__CVPixelBufferPool *)a3;
@end

@implementation PBCoreImageContext

- (void)setSmallPool:(__CVPixelBufferPool *)a3
{
  smallPool = self->_smallPool;
  if (smallPool != a3)
  {
    if (smallPool) {
      CVPixelBufferPoolRelease(smallPool);
    }
    self->_smallPool = CVPixelBufferPoolRetain(a3);
    CFDictionaryRef PixelBufferAttributes = CVPixelBufferPoolGetPixelBufferAttributes(a3);
    p_smallPoolSize = &self->_smallPoolSize;
    CGFloat v8 = (double)objc_msgSend((id)-[__CFDictionary valueForKey:](PixelBufferAttributes, "valueForKey:", @"Width"), "unsignedIntValue");
    unsigned int v9 = objc_msgSend((id)-[__CFDictionary valueForKey:](PixelBufferAttributes, "valueForKey:", @"Height"), "unsignedIntValue");
    p_smallPoolSize->width = v8;
    p_smallPoolSize->height = (double)v9;
  }
}

- (void)setLargePool:(__CVPixelBufferPool *)a3
{
  largePool = self->_largePool;
  if (largePool != a3)
  {
    if (largePool) {
      CVPixelBufferPoolRelease(largePool);
    }
    self->_largePool = CVPixelBufferPoolRetain(a3);
    CFDictionaryRef PixelBufferAttributes = CVPixelBufferPoolGetPixelBufferAttributes(a3);
    p_largePoolSize = &self->_largePoolSize;
    CGFloat v8 = (double)objc_msgSend((id)-[__CFDictionary valueForKey:](PixelBufferAttributes, "valueForKey:", @"Width"), "unsignedIntValue");
    unsigned int v9 = objc_msgSend((id)-[__CFDictionary valueForKey:](PixelBufferAttributes, "valueForKey:", @"Height"), "unsignedIntValue");
    p_largePoolSize->width = v8;
    p_largePoolSize->height = (double)v9;
  }
}

- (__CVPixelBufferPool)smallPool
{
  return self->_smallPool;
}

- (__CVPixelBufferPool)largePool
{
  return self->_largePool;
}

- (PBCoreImageContext)initWithOptions:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PBCoreImageContext;
  v4 = [(PBContext *)&v11 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F146E8]) initWithAPI:2];
    v4->_glesContext = (EAGLContext *)v5;
    [MEMORY[0x263F146E8] setCurrentContext:v5];
    CVReturn v6 = CVOpenGLESTextureCacheCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v4->_glesContext, 0, &v4->_textureCache);
    v4->_inputPixelBuffer = 0;
    v4->_outputPixelBuffer = 0;
    v4->_inputTexture = 0;
    v4->_outputTexture = 0;
    if (v6) {
      NSLog(&cfstr_Cvopenglestext.isa);
    }
    uint64_t v7 = *MEMORY[0x263F00858];
    if (![a3 objectForKey:*MEMORY[0x263F00858]])
    {
      a3 = (id)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
      objc_msgSend(a3, "setValue:forKey:", objc_msgSend(MEMORY[0x263EFF9D0], "null"), v7);
    }
    CGFloat v8 = (CIContext *)[MEMORY[0x263F00628] contextWithEAGLContext:v4->_glesContext options:a3];
    v4->_ciContext = v8;
    unsigned int v9 = v8;
  }
  return v4;
}

- (void)dealloc
{
  inputTexture = self->_inputTexture;
  if (inputTexture)
  {
    CFRelease(inputTexture);
    self->_inputTexture = 0;
  }
  outputTexture = self->_outputTexture;
  if (outputTexture)
  {
    CFRelease(outputTexture);
    self->_outputTexture = 0;
  }
  CVOpenGLESTextureCacheFlush(self->_textureCache, 0);
  CFRelease(self->_textureCache);
  [MEMORY[0x263F146E8] setCurrentContext:0];

  [(PBCoreImageContext *)self setSmallPool:0];
  [(PBCoreImageContext *)self setLargePool:0];

  inputPixelBuffer = self->_inputPixelBuffer;
  if (inputPixelBuffer)
  {
    CVPixelBufferRelease(inputPixelBuffer);
    self->_inputPixelBuffer = 0;
  }
  outputPixelBuffer = self->_outputPixelBuffer;
  if (outputPixelBuffer)
  {
    CVPixelBufferRelease(outputPixelBuffer);
    self->_outputPixelBuffer = 0;
  }
  if (self->_outputImageQueue)
  {
    CAImageQueueConsumeUnconsumedInRange();
    CAImageQueueCollect();
  }
  v7.receiver = self;
  v7.super_class = (Class)PBCoreImageContext;
  [(PBCoreImageContext *)&v7 dealloc];
}

- (id)ciContext
{
  return self->_ciContext;
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3
{
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3 mapTexture:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    objc_super v7 = CVPixelBufferRetain(a3);
    self->_inputPixelBuffer = v7;
    CVPixelBufferLockBaseAddress(v7, 0);
    if (v4)
    {
      [MEMORY[0x263F146E8] setCurrentContext:self->_glesContext];
      CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      textureCache = self->_textureCache;
      GLsizei Width = CVPixelBufferGetWidth(a3);
      GLsizei Height = CVPixelBufferGetHeight(a3);
      p_inputTexture = &self->_inputTexture;
      if (CVOpenGLESTextureCacheCreateTextureFromImage(v8, textureCache, a3, 0, 0xDE1u, 6408, Width, Height, 0x80E1u, 0x1401u, 0, p_inputTexture))
      {
        NSLog(&cfstr_Cvopenglestext_0.isa);
        *p_inputTexture = 0;
      }
      else
      {
        GLuint Name = CVOpenGLESTextureGetName(*p_inputTexture);
        glBindTexture(0xDE1u, Name);
        glTexParameteri(0xDE1u, 0x2801u, 9729);
        glTexParameteri(0xDE1u, 0x2800u, 9729);
        glTexParameteri(0xDE1u, 0x2802u, 33071);
        glTexParameteri(0xDE1u, 0x2803u, 33071);
        glFlush();
      }
    }
  }
  else
  {
    CVPixelBufferUnlockBaseAddress(self->_inputPixelBuffer, 0);
    CFRelease(self->_inputPixelBuffer);
    self->_inputPixelBuffer = 0;
    if (v4)
    {
      [MEMORY[0x263F146E8] setCurrentContext:self->_glesContext];
      GLuint v13 = CVOpenGLESTextureGetName(self->_inputTexture);
      glBindTexture(0xDE1u, v13);
      CFRelease(self->_inputTexture);
      self->_inputTexture = 0;
      v14 = self->_textureCache;
      CVOpenGLESTextureCacheFlush(v14, 0);
    }
  }
}

- (__CVBuffer)inputPixelBuffer
{
  return self->_inputPixelBuffer;
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3
{
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3 mapTexture:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    objc_super v7 = CVPixelBufferRetain(a3);
    self->_outputPixelBuffer = v7;
    CVPixelBufferLockBaseAddress(v7, 0);
    if (v4)
    {
      [MEMORY[0x263F146E8] setCurrentContext:self->_glesContext];
      CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      textureCache = self->_textureCache;
      GLsizei Width = CVPixelBufferGetWidth(a3);
      GLsizei Height = CVPixelBufferGetHeight(a3);
      p_outputTexture = &self->_outputTexture;
      if (CVOpenGLESTextureCacheCreateTextureFromImage(v8, textureCache, a3, 0, 0xDE1u, 6408, Width, Height, 0x80E1u, 0x1401u, 0, p_outputTexture))
      {
        NSLog(&cfstr_Cvopenglestext_0.isa);
      }
      else
      {
        GLuint Name = CVOpenGLESTextureGetName(*p_outputTexture);
        glBindTexture(0xDE1u, Name);
        glTexParameteri(0xDE1u, 0x2801u, 9729);
        glTexParameteri(0xDE1u, 0x2800u, 9729);
        glTexParameteri(0xDE1u, 0x2802u, 33071);
        glTexParameteri(0xDE1u, 0x2803u, 33071);
        glFlush();
      }
    }
  }
  else
  {
    CVPixelBufferUnlockBaseAddress(self->_outputPixelBuffer, 0);
    CFRelease(self->_outputPixelBuffer);
    self->_outputPixelBuffer = 0;
    if (v4)
    {
      [MEMORY[0x263F146E8] setCurrentContext:self->_glesContext];
      GLuint v13 = CVOpenGLESTextureGetName(self->_outputTexture);
      glBindTexture(0xDE1u, v13);
      CFRelease(self->_outputTexture);
      self->_outputTexture = 0;
      v14 = self->_textureCache;
      CVOpenGLESTextureCacheFlush(v14, 0);
    }
  }
}

- (__CVBuffer)outputPixelBuffer
{
  return self->_outputPixelBuffer;
}

- (unsigned)inputTexture
{
  inputTexture = self->_inputTexture;
  if (inputTexture) {
    LODWORD(inputTexture) = CVOpenGLESTextureGetName(inputTexture);
  }
  return inputTexture;
}

- (unsigned)outputTexture
{
  outputTexture = self->_outputTexture;
  if (outputTexture) {
    LODWORD(outputTexture) = CVOpenGLESTextureGetName(outputTexture);
  }
  return outputTexture;
}

- (void)setRender9Up:(BOOL)a3
{
  self->_render9Up = a3;
}

- (BOOL)render9Up
{
  return self->_render9Up;
}

- (void)setRenderForSave:(BOOL)a3
{
  self->_renderForSave = a3;
}

- (BOOL)renderForSave
{
  return self->_renderForSave;
}

- (void)setOutputSize:(CGSize)a3
{
  self->_outputSize = a3;
}

- (CGSize)outputSize
{
  double width = self->_outputSize.width;
  double height = self->_outputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (_CAImageQueue)outputImageQueue
{
  return self->_outputImageQueue;
}

- (void)setOutputImageQueue:(_CAImageQueue *)a3
{
  outputImageQueue = self->_outputImageQueue;
  if (outputImageQueue) {
    BOOL v6 = outputImageQueue == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    CAImageQueueConsumeUnconsumedInRange();
    CAImageQueueCollect();
  }
  self->_outputImageQueue = a3;
}

- (__CVBuffer)createCVPixelBufferForFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5
{
  return 0;
}

- (void)renderFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4
{
}

- (void)renderFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5
{
  if (a4)
  {
    if (self->_outputImageQueue)
    {
      BOOL v6 = a5;
      size_t Width = CVPixelBufferGetWidth(a4);
      size_t Height = CVPixelBufferGetHeight(a4);
      double v11 = (double)CAImageQueueGetWidth();
      double v12 = (double)CAImageQueueGetHeight();
      CVPixelBufferRef pixelBuffer = 0;
      -[PBCoreImageContext _createPixelBuffer:withSize:](self, "_createPixelBuffer:withSize:", &pixelBuffer, v11, v12);
      if (pixelBuffer)
      {
        CVPixelBufferGetIOSurface(pixelBuffer);
        [(PBCoreImageContext *)self setInputPixelBuffer:a4];
        [(PBCoreImageContext *)self setOutputPixelBuffer:pixelBuffer];
        [(PBCoreImageContext *)self setRender9Up:0];
        [(PBCoreImageContext *)self setRenderForSave:0];
        objc_msgSend(a3, "renderWithContext:inputSize:outputRect:mirrored:", self, v6, (double)Width, (double)Height, 0.0, 0.0, v11, v12);
        [(PBCoreImageContext *)self setInputPixelBuffer:0];
        [(PBCoreImageContext *)self setOutputPixelBuffer:0];
        [(PBCoreImageContext *)self setRender9Up:0];
        [(PBCoreImageContext *)self setRenderForSave:0];
        if (CAImageQueueCollect())
        {
          CAImageQueueRegisterIOSurfaceBuffer();
          CAImageQueueInsertImage();
        }
        CVPixelBufferRelease(pixelBuffer);
      }
    }
  }
}

- (void)renderNineUp:(id)a3 inputPixelBuffer:(__CVBuffer *)a4
{
}

- (void)renderNineUp:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5
{
  if (a4)
  {
    if (self->_outputImageQueue)
    {
      BOOL v6 = a5;
      size_t Width = CVPixelBufferGetWidth(a4);
      size_t Height = CVPixelBufferGetHeight(a4);
      CVPixelBufferRef pixelBufferOut = 0;
      CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], self->_largePool, &pixelBufferOut);
      if (pixelBufferOut)
      {
        double v11 = (double)Height;
        double v12 = (double)CVPixelBufferGetWidth(pixelBufferOut);
        double v13 = (double)CVPixelBufferGetHeight(pixelBufferOut);
        CVPixelBufferGetIOSurface(pixelBufferOut);
        int v14 = [a3 count];
        [(PBCoreImageContext *)self setInputPixelBuffer:a4];
        [(PBCoreImageContext *)self setOutputPixelBuffer:pixelBufferOut];
        [(PBCoreImageContext *)self setRender9Up:1];
        [(PBCoreImageContext *)self setRenderForSave:0];
        -[PBCoreImageContext setOutputSize:](self, "setOutputSize:", v12, v13);
        uint64_t v15 = 0;
        for (uint64_t i = 0; i != 3; ++i)
        {
          for (uint64_t j = 0; j != 3; ++j)
          {
            if (v15 + j < v14) {
              objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:"), "renderWithContext:inputSize:outputRect:mirrored:", self, v6, (double)Width, v11, v12 / 3.0 * (double)(int)j, v13 / 3.0 * (double)(2 - (int)i), v12 / 3.0, v13 / 3.0);
            }
          }
          v15 += 3;
        }
        [(PBCoreImageContext *)self setInputPixelBuffer:0];
        [(PBCoreImageContext *)self setOutputPixelBuffer:0];
        [(PBCoreImageContext *)self setRender9Up:0];
        [(PBCoreImageContext *)self setRenderForSave:0];
        if (CAImageQueueCollect())
        {
          CAImageQueueRegisterIOSurfaceBuffer();
          CAImageQueueInsertImage();
        }
        CVPixelBufferRelease(pixelBufferOut);
      }
    }
  }
}

- (void)_createPixelBuffer:(__CVBuffer *)a3 withSize:(CGSize)a4
{
  smallPool = self->_smallPool;
  if (*(_OWORD *)&self->_smallPool == 0)
  {
    *a3 = 0;
  }
  else
  {
    if (a4.width == self->_largePoolSize.width && a4.height == self->_largePoolSize.height) {
      smallPool = self->_largePool;
    }
    CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], smallPool, a3);
  }
}

@end