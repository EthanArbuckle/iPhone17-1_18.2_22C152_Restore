@interface UIImageCIImageRenderer
@end

@implementation UIImageCIImageRenderer

CGColorSpaceRef __51___UIImageCIImageRenderer__targetColorSpaceForHDR___block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC50]);
  qword_1EB25B1D8 = (uint64_t)result;
  return result;
}

CGColorSpaceRef __51___UIImageCIImageRenderer__targetColorSpaceForHDR___block_invoke_2()
{
  v0 = +[UIDevice currentDevice];
  int v1 = [v0 _supportsDeepColor];

  v2 = (CFStringRef *)MEMORY[0x1E4F1DBE8];
  if (!v1) {
    v2 = (CFStringRef *)MEMORY[0x1E4F1DC98];
  }
  CGColorSpaceRef result = CGColorSpaceCreateWithName(*v2);
  qword_1EB25B1E8 = (uint64_t)result;
  return result;
}

@end