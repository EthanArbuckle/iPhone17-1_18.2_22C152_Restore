@interface UIGraphicsImageRendererFormat(SeymourMedia)
+ (id)smu_formatForImage:()SeymourMedia;
+ (id)smu_preferredRendererFormat;
+ (uint64_t)smu_canDecodeOnRenderThread;
@end

@implementation UIGraphicsImageRendererFormat(SeymourMedia)

+ (uint64_t)smu_canDecodeOnRenderThread
{
  return 1;
}

+ (id)smu_preferredRendererFormat
{
  v0 = [MEMORY[0x263F82B60] mainScreen];
  v1 = (void *)MEMORY[0x263F827B0];
  v2 = [v0 traitCollection];
  v3 = [v1 formatForTraitCollection:v2];

  return v3;
}

+ (id)smu_formatForImage:()SeymourMedia
{
  id v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "smu_preferredRendererFormat");
  v5 = [MEMORY[0x263F82B60] mainScreen];
  v6 = [MEMORY[0x263F82670] currentDevice];
  int v7 = objc_msgSend(v6, "smu_supportsDeepColor");

  if (v7)
  {
    v8 = [v3 imageRendererFormat];

    [v5 scale];
    objc_msgSend(v8, "setScale:");
    v4 = v8;
  }

  return v4;
}

@end