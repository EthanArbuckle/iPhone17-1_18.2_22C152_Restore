@interface GrayGamma2
@end

@implementation GrayGamma2

CGColorSpaceRef __GrayGamma2_2ColorSpace_block_invoke()
{
  if (dyld_program_sdk_at_least()) {
    CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]);
  }
  else {
    CGColorSpaceRef result = CGColorSpaceCreateDeviceGray();
  }
  qword_1EB25E428 = (uint64_t)result;
  return result;
}

@end