@interface GrayPlaceholderColor
@end

@implementation GrayPlaceholderColor

void ___GrayPlaceholderColor_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  long long v1 = xmmword_191675300;
  qword_1EB403420 = (uint64_t)CGColorCreate(DeviceGray, (const CGFloat *)&v1);
  CGColorSpaceRelease(DeviceGray);
}

@end