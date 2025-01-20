@interface VGHRTFEarCaptureUpdateData
- (NSDictionary)leftEarStatusList;
- (NSDictionary)rightEarStatusList;
- (VGHRTFEarCaptureProcessedData)trackedData;
- (VGHRTFEarsFrameData)result;
- (float)progress;
- (id)initEmpty;
- (unint64_t)progressType;
- (void)setLeftEarStatusList:(id)a3;
- (void)setProgress:(float)a3;
- (void)setProgressType:(unint64_t)a3;
- (void)setResult:(id)a3;
- (void)setRightEarStatusList:(id)a3;
- (void)setTrackedData:(id)a3;
@end

@implementation VGHRTFEarCaptureUpdateData

- (id)initEmpty
{
  v6.receiver = self;
  v6.super_class = (Class)VGHRTFEarCaptureUpdateData;
  v2 = [(VGHRTFEarCaptureUpdateData *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (unint64_t)progressType
{
  return self->_progressType;
}

- (void)setProgressType:(unint64_t)a3
{
  self->_progressType = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (NSDictionary)leftEarStatusList
{
  return self->_leftEarStatusList;
}

- (void)setLeftEarStatusList:(id)a3
{
}

- (NSDictionary)rightEarStatusList
{
  return self->_rightEarStatusList;
}

- (void)setRightEarStatusList:(id)a3
{
}

- (VGHRTFEarCaptureProcessedData)trackedData
{
  return self->_trackedData;
}

- (void)setTrackedData:(id)a3
{
}

- (VGHRTFEarsFrameData)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_trackedData, 0);
  objc_storeStrong((id *)&self->_rightEarStatusList, 0);

  objc_storeStrong((id *)&self->_leftEarStatusList, 0);
}

@end