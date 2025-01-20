@interface VGHRTFFaceCaptureUpdateData
- (NSArray)poseStatusList;
- (NSArray)result;
- (VGHRTFFaceCaptureProcessedData)trackedData;
- (float)progress;
- (id)initEmpty;
- (unint64_t)progressType;
- (void)setPoseStatusList:(id)a3;
- (void)setProgress:(float)a3;
- (void)setProgressType:(unint64_t)a3;
- (void)setResult:(id)a3;
- (void)setTrackedData:(id)a3;
@end

@implementation VGHRTFFaceCaptureUpdateData

- (id)initEmpty
{
  v6.receiver = self;
  v6.super_class = (Class)VGHRTFFaceCaptureUpdateData;
  v2 = [(VGHRTFFaceCaptureUpdateData *)&v6 init];
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

- (NSArray)poseStatusList
{
  return self->_poseStatusList;
}

- (void)setPoseStatusList:(id)a3
{
}

- (VGHRTFFaceCaptureProcessedData)trackedData
{
  return self->_trackedData;
}

- (void)setTrackedData:(id)a3
{
}

- (NSArray)result
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

  objc_storeStrong((id *)&self->_poseStatusList, 0);
}

@end