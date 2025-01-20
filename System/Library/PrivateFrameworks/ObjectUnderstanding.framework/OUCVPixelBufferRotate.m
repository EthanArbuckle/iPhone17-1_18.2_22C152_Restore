@interface OUCVPixelBufferRotate
- (OpaqueVTPixelRotationSession)_createRotationSessionByRotationDegree:(int)a3;
- (__CVBuffer)rotateImage:(__CVBuffer *)a3;
- (id)initForRotationDegree:(int)a3 resolution:(CGSize)a4 pixelFormat:(unsigned int)a5;
- (void)dealloc;
@end

@implementation OUCVPixelBufferRotate

- (id)initForRotationDegree:(int)a3 resolution:(CGSize)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v8 = *(void *)&a3;
  v20[4] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)OUCVPixelBufferRotate;
  v9 = [(OUCVPixelBufferRotate *)&v18 init];
  v10 = v9;
  if (v9)
  {
    v9->_outputResolution.CGFloat width = width;
    v9->_outputResolution.CGFloat height = height;
    v9->_outputPixelFormat = v5;
    v9->_sessionRotate = [(OUCVPixelBufferRotate *)v9 _createRotationSessionByRotationDegree:v8];
    v19[0] = *MEMORY[0x263F04180];
    v11 = [NSNumber numberWithUnsignedInt:v5];
    v20[0] = v11;
    v19[1] = *MEMORY[0x263F04240];
    v12 = [NSNumber numberWithDouble:v10->_outputResolution.width];
    v20[1] = v12;
    v19[2] = *MEMORY[0x263F04118];
    v13 = [NSNumber numberWithDouble:v10->_outputResolution.height];
    v19[3] = *MEMORY[0x263F04130];
    v20[2] = v13;
    v20[3] = MEMORY[0x263EFFA78];
    CFDictionaryRef v14 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

    if (!CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v14, &v10->_pixelBufferCreatePool))
    {
      v16 = v10;
      goto LABEL_8;
    }
    v15 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]();
    }
  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (OpaqueVTPixelRotationSession)_createRotationSessionByRotationDegree:(int)a3
{
  if (VTImageRotationSessionCreate())
  {
    v3 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[OUCVPixelBufferRotate _createRotationSessionByRotationDegree:]();
    }
  }
  return 0;
}

- (__CVBuffer)rotateImage:(__CVBuffer *)a3
{
  if (!a3) {
    return 0;
  }
  p_rotatePixelBuffer = &self->_rotatePixelBuffer;
  if (!self->_rotatePixelBuffer
    && CVPixelBufferPoolCreatePixelBuffer(0, self->_pixelBufferCreatePool, p_rotatePixelBuffer))
  {
    v6 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[OUCVPixelBufferRotate rotateImage:]();
    }
    goto LABEL_10;
  }
  if (MEMORY[0x237E2C000](self->_sessionRotate, a3))
  {
    v6 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[OUCVPixelBufferRotate rotateImage:]();
    }
LABEL_10:

    return 0;
  }
  return *p_rotatePixelBuffer;
}

- (void)dealloc
{
  MEMORY[0x237E2BFF0](self->_sessionRotate, a2);
  CFRelease(self->_sessionRotate);
  self->_sessionRotate = 0;
  CVPixelBufferPoolRelease(self->_pixelBufferCreatePool);
  rotatePixelBuffer = self->_rotatePixelBuffer;
  if (rotatePixelBuffer)
  {
    CVPixelBufferRelease(rotatePixelBuffer);
    self->_rotatePixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OUCVPixelBufferRotate;
  [(OUCVPixelBufferRotate *)&v4 dealloc];
}

- (void)initForRotationDegree:resolution:pixelFormat:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_237C17000, v0, OS_LOG_TYPE_ERROR, "Create pixelbufferPool for image rotation failed.", v1, 2u);
}

- (void)_createRotationSessionByRotationDegree:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "Failure to create vtImageRotationSession", v2, v3, v4, v5, v6);
}

- (void)rotateImage:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "Failure to perform rotation via pixel transfer", v2, v3, v4, v5, v6);
}

- (void)rotateImage:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "Failure to create pixel buffer for rotation", v2, v3, v4, v5, v6);
}

@end