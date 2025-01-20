@interface CALayer(UIStackedImageContainerLayer)
+ (double)smu_scaledSizeForSize:()UIStackedImageContainerLayer selectionStyle:;
+ (uint64_t)smu_scaledSizeForSize:()UIStackedImageContainerLayer focusSizeIncrease:selectionStyle:;
@end

@implementation CALayer(UIStackedImageContainerLayer)

+ (double)smu_scaledSizeForSize:()UIStackedImageContainerLayer selectionStyle:
{
  v8 = (void *)[MEMORY[0x263F830F0] newStandardConfiguration];
  [v8 scaleSizeIncrease];
  objc_msgSend((id)objc_opt_class(), "smu_scaledSizeForSize:focusSizeIncrease:selectionStyle:", a5, a1, a2, v9);
  double v11 = v10;

  return v11;
}

+ (uint64_t)smu_scaledSizeForSize:()UIStackedImageContainerLayer focusSizeIncrease:selectionStyle:
{
  return objc_msgSend(MEMORY[0x263F830F8], "_scaledSizeForSize:focusSizeIncrease:selectionStyle:");
}

@end