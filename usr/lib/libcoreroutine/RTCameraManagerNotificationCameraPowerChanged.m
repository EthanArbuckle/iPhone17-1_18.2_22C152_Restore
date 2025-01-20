@interface RTCameraManagerNotificationCameraPowerChanged
- (RTCameraManagerNotificationCameraPowerChanged)initWithCameraType:(int64_t)a3 powerState:(int64_t)a4;
- (int64_t)cameraType;
- (int64_t)powerState;
@end

@implementation RTCameraManagerNotificationCameraPowerChanged

- (RTCameraManagerNotificationCameraPowerChanged)initWithCameraType:(int64_t)a3 powerState:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RTCameraManagerNotificationCameraPowerChanged;
  result = [(RTNotification *)&v7 init];
  if (result)
  {
    result->_cameraType = a3;
    result->_powerState = a4;
  }
  return result;
}

- (int64_t)powerState
{
  return self->_powerState;
}

- (int64_t)cameraType
{
  return self->_cameraType;
}

@end