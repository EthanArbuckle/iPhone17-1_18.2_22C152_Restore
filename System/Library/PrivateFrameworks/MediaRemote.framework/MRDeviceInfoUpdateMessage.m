@interface MRDeviceInfoUpdateMessage
- (unint64_t)type;
@end

@implementation MRDeviceInfoUpdateMessage

- (unint64_t)type
{
  return 37;
}

@end