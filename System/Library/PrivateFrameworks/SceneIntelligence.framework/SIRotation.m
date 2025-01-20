@interface SIRotation
- (BOOL)rotateAndCropImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4;
- (BOOL)rotateImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4;
- (CGRect)getCenterCropSrcSize:(CGSize)a3 dstSize:(CGSize)a4;
- (OpaqueVTPixelRotationSession)_createRotationSessionByRotationDegree:(int)a3;
- (__CVBuffer)_createCVPixelBufferWithResolution:(CGSize)a3 pixelFormat:(unsigned int)a4;
- (__CVBuffer)rotateAndCropImage:(__CVBuffer *)a3;
- (__CVBuffer)rotateImage:(__CVBuffer *)a3;
- (id)getInputRotateOrientation;
- (id)initForRotationDegree:(int)a3 resolution:(CGSize)a4 pixelFormat:(unsigned int)a5 algorithmKey:(id)a6;
- (void)dealloc;
@end

@implementation SIRotation

- (CGRect)getCenterCropSrcSize:(CGSize)a3 dstSize:(CGSize)a4
{
  CGFloat v4 = (a3.width - a4.width) * 0.5;
  CGFloat v5 = (a3.height - a4.height) * 0.5;
  double v6 = floor(v4 + 0.0);
  double v7 = floor(v5 + 0.0);
  double v8 = floor(a3.width - v4 * 2.0);
  double v9 = floor(a3.height - v5 * 2.0);
  double v10 = v6;
  double v11 = v7;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)initForRotationDegree:(int)a3 resolution:(CGSize)a4 pixelFormat:(unsigned int)a5 algorithmKey:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v9 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SIRotation;
  v12 = [(SIRotation *)&v20 init];
  v13 = v12;
  if (!v12)
  {
LABEL_6:
    v15 = 0;
    goto LABEL_10;
  }
  v12->_outputResolution.CGFloat width = width;
  v12->_outputResolution.CGFloat height = height;
  v12->_outputPixelFormat = v6;
  v12->_sessionRotate = [(SIRotation *)v12 _createRotationSessionByRotationDegree:v9];
  v13->_rotationDegree = v9;
  if (SIPixelBufferPoolCreate((int)v13->_outputResolution.width, (int)v13->_outputResolution.height, v6, &v13->_pixelBufferCreatePool))
  {
    v14 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      __int16 v22 = 1025;
      int v23 = 65;
      _os_log_impl(&dword_21B697000, v14, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to create pixel buffer pool for rotation ***", buf, 0x12u);
    }

    goto LABEL_6;
  }
  *(void *)buf = 0;
  id v16 = v11;
  int v17 = objc_msgSend(v16, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v16, "length"), 0);

  unint64_t v18 = *(void *)buf;
  if (!v17) {
    unint64_t v18 = 0;
  }
  v13->_algorithmKey = v18;
  v15 = v13;
LABEL_10:

  return v15;
}

- (OpaqueVTPixelRotationSession)_createRotationSessionByRotationDegree:(int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  VTPixelRotationSessionRef pixelRotationSessionOut = 0;
  if (!VTPixelRotationSessionCreate(0, &pixelRotationSessionOut)) {
    return pixelRotationSessionOut;
  }
  v3 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136380931;
    double v7 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
    __int16 v8 = 1025;
    int v9 = 73;
    _os_log_impl(&dword_21B697000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to create vtImageRotationSession ***", buf, 0x12u);
  }

  return 0;
}

- (BOOL)rotateImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    double v7 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136380931;
      v14 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      __int16 v15 = 1025;
      int v16 = 79;
      _os_log_impl(&dword_21B697000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Recieved null image ***", (uint8_t *)&v13, 0x12u);
    }
    goto LABEL_8;
  }
  double v7 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 v8 = [(SIRotation *)self getInputRotateOrientation];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F1E9D0]];

  OSStatus v9 = VTPixelRotationSessionRotateImage(self->_sessionRotate, a3, a4);
  BOOL v10 = v9 == 0;
  if (v9)
  {
    id v11 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136380931;
      v14 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      __int16 v15 = 1025;
      int v16 = 83;
      _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to perform rotation via pixel transfer ***", (uint8_t *)&v13, 0x12u);
    }

LABEL_8:
    BOOL v10 = 0;
  }

  return v10;
}

- (__CVBuffer)rotateImage:(__CVBuffer *)a3
{
  v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3)
  {
    CVPixelBufferRef pixelBufferOut = 0;
    if (CVPixelBufferPoolCreatePixelBuffer(0, self->_pixelBufferCreatePool, &pixelBufferOut))
    {
      CGFloat v5 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        id v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
        __int16 v12 = 1025;
        int v13 = 96;
        _os_log_impl(&dword_21B697000, v5, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to create pixel buffer for rotation ***", buf, 0x12u);
      }
    }
    else
    {
      CGFloat v5 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v6 = [(SIRotation *)self getInputRotateOrientation];
      [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F1E9D0]];

      if (!VTPixelRotationSessionRotateImage(self->_sessionRotate, v3, pixelBufferOut))
      {
        v3 = pixelBufferOut;
        goto LABEL_10;
      }
      double v7 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        id v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
        __int16 v12 = 1025;
        int v13 = 101;
        _os_log_impl(&dword_21B697000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to perform rotation via pixel transfer ***", buf, 0x12u);
      }
    }
    v3 = 0;
LABEL_10:
  }
  return v3;
}

- (__CVBuffer)rotateAndCropImage:(__CVBuffer *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  double Width = (double)CVPixelBufferGetWidth(a3);
  -[SIRotation getCenterCropSrcSize:dstSize:](self, "getCenterCropSrcSize:dstSize:", Width, (double)CVPixelBufferGetHeight(a3), self->_outputResolution.width, self->_outputResolution.height);
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(0, self->_pixelBufferCreatePool, &pixelBufferOut))
  {
    uint64_t v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      __int16 v12 = 1025;
      int v13 = 124;
      double v7 = " %{private}s:%{private}d *** Failure to create pixel buffer for rotation ***";
LABEL_8:
      _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (VTPixelRotationSessionRotateSubImage())
  {
    uint64_t v6 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      __int16 v12 = 1025;
      int v13 = 127;
      double v7 = " %{private}s:%{private}d *** Failure to perform rotation and crop via pixel transfer ***";
      goto LABEL_8;
    }
LABEL_9:

    return 0;
  }
  return pixelBufferOut;
}

- (BOOL)rotateAndCropImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  double Width = (double)CVPixelBufferGetWidth(a3);
  -[SIRotation getCenterCropSrcSize:dstSize:](self, "getCenterCropSrcSize:dstSize:", Width, (double)CVPixelBufferGetHeight(a3), self->_outputResolution.width, self->_outputResolution.height);
  if (v8 != self->_outputResolution.width || v7 != self->_outputResolution.height)
  {
    OSStatus v9 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      return 0;
    }
    int v12 = 136380931;
    int v13 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
    __int16 v14 = 1025;
    int v15 = 143;
    BOOL v10 = " %{private}s:%{private}d *** Wrong crop size for rotation ***";
LABEL_6:
    _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x12u);
    goto LABEL_7;
  }
  if (VTPixelRotationSessionRotateSubImage())
  {
    OSStatus v9 = __SceneIntelligenceLogSharedInstance();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v12 = 136380931;
    int v13 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
    __int16 v14 = 1025;
    int v15 = 149;
    BOOL v10 = " %{private}s:%{private}d *** Failure to perform rotation and crop via pixel transfer ***";
    goto LABEL_6;
  }
  return 1;
}

- (__CVBuffer)_createCVPixelBufferWithResolution:(CGSize)a3 pixelFormat:(unsigned int)a4
{
  double height = a3.height;
  double width = a3.width;
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v16 = *MEMORY[0x263F04130];
  v17[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)width, (unint64_t)height, a4, v7, &pixelBufferOut))
  {
    double v8 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      __int16 v14 = 1025;
      int v15 = 164;
      _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not create pixel buffer for rotation ***", buf, 0x12u);
    }

    OSStatus v9 = 0;
  }
  else
  {
    OSStatus v9 = pixelBufferOut;
  }

  return v9;
}

- (id)getInputRotateOrientation
{
  id v3 = (id)*MEMORY[0x263F1EBE8];
  int rotationDegree = self->_rotationDegree;
  switch(rotationDegree)
  {
    case 90:
      CGFloat v5 = (id *)MEMORY[0x263F1EC00];
      break;
    case 270:
      CGFloat v5 = (id *)MEMORY[0x263F1EBF8];
      break;
    case 180:
      CGFloat v5 = (id *)MEMORY[0x263F1EBF0];
      break;
    default:
      goto LABEL_8;
  }
  id v6 = *v5;

  id v3 = v6;
LABEL_8:
  return v3;
}

- (void)dealloc
{
  VTPixelRotationSessionInvalidate(self->_sessionRotate);
  CFRelease(self->_sessionRotate);
  self->_sessionRotate = 0;
  CVPixelBufferPoolRelease(self->_pixelBufferCreatePool);
  v3.receiver = self;
  v3.super_class = (Class)SIRotation;
  [(SIRotation *)&v3 dealloc];
}

@end