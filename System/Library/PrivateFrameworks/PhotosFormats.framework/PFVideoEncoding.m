@interface PFVideoEncoding
+ (BOOL)deviceSupportsHardwareHEVCEncoding;
@end

@implementation PFVideoEncoding

+ (BOOL)deviceSupportsHardwareHEVCEncoding
{
  return +[PFMediaCapabilities currentDeviceHEVCCapabilities] & 1;
}

@end