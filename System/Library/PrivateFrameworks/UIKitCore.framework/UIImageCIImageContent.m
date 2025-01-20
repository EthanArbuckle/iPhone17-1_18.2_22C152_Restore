@interface UIImageCIImageContent
@end

@implementation UIImageCIImageContent

void __34___UIImageCIImageContent__context__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v1 = *MEMORY[0x1E4F1E1D8];
  v4[0] = *MEMORY[0x1E4F1E210];
  v4[1] = v1;
  v5[0] = DeviceRGB;
  v5[1] = MEMORY[0x1E4F1CC38];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)qword_1EB25B1C8;
  qword_1EB25B1C8 = v2;

  CGColorSpaceRelease(DeviceRGB);
}

@end