@interface BMSyncDevice
+ (id)currentDevice;
- (int64_t)platform;
@end

@implementation BMSyncDevice

+ (id)currentDevice
{
  if (qword_100080320 != -1) {
    dispatch_once(&qword_100080320, &stru_10006D410);
  }
  v2 = (void *)qword_100080318;

  return v2;
}

- (int64_t)platform
{
  return self->_platform;
}

@end