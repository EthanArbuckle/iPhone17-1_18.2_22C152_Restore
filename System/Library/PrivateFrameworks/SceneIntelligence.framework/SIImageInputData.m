@interface SIImageInputData
- (BOOL)copyDataTo:(id)a3;
- (NSString)identifier;
- (SIImageInputData)init;
- (__CVBuffer)inputDepthBuffer;
- (__CVBuffer)inputImageBuffer;
- (__CVBuffer)inputNormalBuffer;
- (__n128)deviceFromCamera;
- (__n128)deviceTransform;
- (__n128)setDeviceFromCamera:(__n128)a3;
- (__n128)setDeviceTransform:(__n128)a3;
- (__n128)setWorldFromDevice:(__n128)a3;
- (__n128)worldFromDevice;
- (double)timestamp;
- (int)inputImageLuxValue;
- (void)setIdentifier:(id)a3;
- (void)setInputDepthBuffer:(__CVBuffer *)a3;
- (void)setInputImageBuffer:(__CVBuffer *)a3;
- (void)setInputImageLuxValue:(int)a3;
- (void)setInputNormalBuffer:(__CVBuffer *)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation SIImageInputData

- (SIImageInputData)init
{
  v11.receiver = self;
  v11.super_class = (Class)SIImageInputData;
  v2 = [(SIImageInputData *)&v11 init];
  if (v2)
  {
    v3 = [[SIPixelBuffer alloc] initWithCVPixelBuffer:0];
    inputImageBuffer = v2->_inputImageBuffer;
    v2->_inputImageBuffer = v3;

    v5 = [[SIPixelBuffer alloc] initWithCVPixelBuffer:0];
    inputNormalBuffer = v2->_inputNormalBuffer;
    v2->_inputNormalBuffer = v5;

    v7 = [[SIPixelBuffer alloc] initWithCVPixelBuffer:0];
    inputDepthBuffer = v2->_inputDepthBuffer;
    v2->_inputDepthBuffer = v7;

    v2->_inputImageLuxValue = -1;
    v9 = v2;
  }

  return v2;
}

- (BOOL)copyDataTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self)
  {
    [(SIImageInputData *)self worldFromDevice];
    objc_msgSend(v4, "setWorldFromDevice:");
    [(SIImageInputData *)self deviceTransform];
    objc_msgSend(v4, "setDeviceTransform:");
    if (![v4 inputImageBuffer]
      || (SIPixelBufferHasSameAttr(-[SIImageInputData inputImageBuffer](self, "inputImageBuffer"), (__CVBuffer *)[v4 inputImageBuffer]) & 1) == 0)
    {
      size_t Width = CVPixelBufferGetWidth([(SIImageInputData *)self inputImageBuffer]);
      size_t Height = CVPixelBufferGetHeight([(SIImageInputData *)self inputImageBuffer]);
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType([(SIImageInputData *)self inputImageBuffer]);
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface([(SIImageInputData *)self inputImageBuffer]);
      v9 = SIPixelFormatToStr(PixelFormatType);
      int v10 = [v9 isEqualToString:@"444f"];
      objc_super v11 = [(SIImageInputData *)self inputImageBuffer];
      if (v10) {
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v11, 0);
      }
      else {
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(v11);
      }
      uint64_t v15 = BytesPerRowOfPlane;

      v16 = SICreateCVPixelBufferWithCustomStride(Width, Height, PixelFormatType, v15, IOSurface != 0);
      [v4 setInputImageBuffer:v16];
      CVPixelBufferRelease(v16);
    }
    if (!SIPixelBufferCopy(-[SIImageInputData inputImageBuffer](self, "inputImageBuffer"), (__CVBuffer *)[v4 inputImageBuffer]))
    {
      if ([(SIImageInputData *)self inputDepthBuffer])
      {
        if (![v4 inputDepthBuffer]
          || (SIPixelBufferHasSameAttr(-[SIImageInputData inputDepthBuffer](self, "inputDepthBuffer"), (__CVBuffer *)[v4 inputDepthBuffer]) & 1) == 0)
        {
          size_t v19 = CVPixelBufferGetWidth([(SIImageInputData *)self inputDepthBuffer]);
          size_t v20 = CVPixelBufferGetHeight([(SIImageInputData *)self inputDepthBuffer]);
          OSType v21 = CVPixelBufferGetPixelFormatType([(SIImageInputData *)self inputDepthBuffer]);
          BOOL v22 = CVPixelBufferGetIOSurface([(SIImageInputData *)self inputDepthBuffer]) != 0;
          size_t BytesPerRow = CVPixelBufferGetBytesPerRow([(SIImageInputData *)self inputDepthBuffer]);
          v24 = SICreateCVPixelBufferWithCustomStride(v19, v20, v21, BytesPerRow, v22);
          [v4 setInputDepthBuffer:v24];
          CVPixelBufferRelease(v24);
        }
        if (SIPixelBufferCopy(-[SIImageInputData inputDepthBuffer](self, "inputDepthBuffer"), (__CVBuffer *)[v4 inputDepthBuffer]))
        {
          v13 = __SceneIntelligenceLogSharedInstance();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
          int v31 = 136380931;
          v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageInputData.m";
          __int16 v33 = 1025;
          int v34 = 76;
          v14 = " %{private}s:%{private}d *** Failed to copy image depth for SIImageInputData ***";
          goto LABEL_13;
        }
      }
      else
      {
        [v4 setInputDepthBuffer:0];
      }
      if ([(SIImageInputData *)self inputNormalBuffer])
      {
        if (![v4 inputNormalBuffer]
          || (SIPixelBufferHasSameAttr(-[SIImageInputData inputNormalBuffer](self, "inputNormalBuffer"), (__CVBuffer *)[v4 inputNormalBuffer]) & 1) == 0)
        {
          size_t v25 = CVPixelBufferGetWidth([(SIImageInputData *)self inputNormalBuffer]);
          size_t v26 = CVPixelBufferGetHeight([(SIImageInputData *)self inputNormalBuffer]);
          OSType v27 = CVPixelBufferGetPixelFormatType([(SIImageInputData *)self inputNormalBuffer]);
          BOOL v28 = CVPixelBufferGetIOSurface([(SIImageInputData *)self inputNormalBuffer]) != 0;
          size_t v29 = CVPixelBufferGetBytesPerRow([(SIImageInputData *)self inputNormalBuffer]);
          v30 = SICreateCVPixelBufferWithCustomStride(v25, v26, v27, v29, v28);
          [v4 setInputNormalBuffer:v30];
          CVPixelBufferRelease(v30);
        }
        if (SIPixelBufferCopy(-[SIImageInputData inputNormalBuffer](self, "inputNormalBuffer"), (__CVBuffer *)[v4 inputNormalBuffer]))
        {
          v13 = __SceneIntelligenceLogSharedInstance();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
          int v31 = 136380931;
          v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageInputData.m";
          __int16 v33 = 1025;
          int v34 = 96;
          v14 = " %{private}s:%{private}d *** Failed to copy image depth for SIImageInputData ***";
          goto LABEL_13;
        }
      }
      else
      {
        [v4 setInputNormalBuffer:0];
      }
      BOOL v17 = 1;
      goto LABEL_15;
    }
    v13 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136380931;
      v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageInputData.m";
      __int16 v33 = 1025;
      int v34 = 60;
      v14 = " %{private}s:%{private}d *** Failed to copy image input for SIImageInputData ***";
      goto LABEL_13;
    }
  }
  else
  {
    v13 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136380931;
      v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageInputData.m";
      __int16 v33 = 1025;
      int v34 = 41;
      v14 = " %{private}s:%{private}d *** Trying to copy a nil SIImageInputData ***";
LABEL_13:
      _os_log_impl(&dword_21B697000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v31, 0x12u);
    }
  }
LABEL_14:

  BOOL v17 = 0;
LABEL_15:

  return v17;
}

- (void)setInputImageBuffer:(__CVBuffer *)a3
{
}

- (__CVBuffer)inputImageBuffer
{
  return [(SIPixelBuffer *)self->_inputImageBuffer pixelBuffer];
}

- (void)setInputDepthBuffer:(__CVBuffer *)a3
{
}

- (__CVBuffer)inputDepthBuffer
{
  return [(SIPixelBuffer *)self->_inputDepthBuffer pixelBuffer];
}

- (void)setInputNormalBuffer:(__CVBuffer *)a3
{
}

- (__CVBuffer)inputNormalBuffer
{
  return [(SIPixelBuffer *)self->_inputNormalBuffer pixelBuffer];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)inputImageLuxValue
{
  return self->_inputImageLuxValue;
}

- (void)setInputImageLuxValue:(int)a3
{
  self->_inputImageLuxValue = a3;
}

- (__n128)deviceTransform
{
  return a1[4];
}

- (__n128)setDeviceTransform:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  result[7] = a5;
  return result;
}

- (__n128)worldFromDevice
{
  return a1[8];
}

- (__n128)setWorldFromDevice:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

- (__n128)deviceFromCamera
{
  return a1[12];
}

- (__n128)setDeviceFromCamera:(__n128)a3
{
  result[12] = a2;
  result[13] = a3;
  result[14] = a4;
  result[15] = a5;
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_inputNormalBuffer, 0);
  objc_storeStrong((id *)&self->_inputDepthBuffer, 0);
  objc_storeStrong((id *)&self->_inputImageBuffer, 0);
}

@end