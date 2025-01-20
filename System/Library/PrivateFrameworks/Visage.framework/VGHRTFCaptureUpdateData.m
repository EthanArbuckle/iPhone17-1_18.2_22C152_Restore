@interface VGHRTFCaptureUpdateData
- (VGHRTFCaptureData)captureData;
- (VGHRTFEarCaptureUpdateData)earCaptureUpdateData;
- (VGHRTFFaceCaptureUpdateData)faceCaptureUpdateData;
- (VGHRTFFaceData)faceData;
- (id)initEmpty;
- (unint64_t)state;
- (void)setCaptureData:(id)a3;
- (void)setEarCaptureUpdateData:(id)a3;
- (void)setFaceCaptureUpdateData:(id)a3;
- (void)setFaceData:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation VGHRTFCaptureUpdateData

- (id)initEmpty
{
  v6.receiver = self;
  v6.super_class = (Class)VGHRTFCaptureUpdateData;
  v2 = [(VGHRTFCaptureUpdateData *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (VGHRTFCaptureData)captureData
{
  return self->_captureData;
}

- (void)setCaptureData:(id)a3
{
}

- (VGHRTFFaceData)faceData
{
  return self->_faceData;
}

- (void)setFaceData:(id)a3
{
}

- (VGHRTFFaceCaptureUpdateData)faceCaptureUpdateData
{
  return self->_faceCaptureUpdateData;
}

- (void)setFaceCaptureUpdateData:(id)a3
{
}

- (VGHRTFEarCaptureUpdateData)earCaptureUpdateData
{
  return self->_earCaptureUpdateData;
}

- (void)setEarCaptureUpdateData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earCaptureUpdateData, 0);
  objc_storeStrong((id *)&self->_faceCaptureUpdateData, 0);
  objc_storeStrong((id *)&self->_faceData, 0);

  objc_storeStrong((id *)&self->_captureData, 0);
}

@end