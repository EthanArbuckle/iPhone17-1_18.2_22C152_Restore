@interface VGHRTFEarCaptureProcessedData
- (IOSurface)rectifiedColorBuffer;
- (VGHRTFEarCaptureDetectionData)detectionData;
- (id)initEmpty;
- (unint64_t)error;
- (void)setDetectionData:(id)a3;
- (void)setError:(unint64_t)a3;
- (void)setRectifiedColorBuffer:(id)a3;
@end

@implementation VGHRTFEarCaptureProcessedData

- (id)initEmpty
{
  v6.receiver = self;
  v6.super_class = (Class)VGHRTFEarCaptureProcessedData;
  v2 = [(VGHRTFEarCaptureProcessedData *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (VGHRTFEarCaptureDetectionData)detectionData
{
  return self->_detectionData;
}

- (void)setDetectionData:(id)a3
{
}

- (IOSurface)rectifiedColorBuffer
{
  return self->_rectifiedColorBuffer;
}

- (void)setRectifiedColorBuffer:(id)a3
{
}

- (unint64_t)error
{
  return self->_error;
}

- (void)setError:(unint64_t)a3
{
  self->_error = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectifiedColorBuffer, 0);

  objc_storeStrong((id *)&self->_detectionData, 0);
}

@end