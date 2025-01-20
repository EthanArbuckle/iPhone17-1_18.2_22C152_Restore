@interface CAFilter(MobileSafariExtras)
+ (id)safari_gaussianBlurWithRadius:()MobileSafariExtras normalizeEdges:;
+ (uint64_t)safari_gaussianBlurWithRadius:()MobileSafariExtras;
@end

@implementation CAFilter(MobileSafariExtras)

+ (id)safari_gaussianBlurWithRadius:()MobileSafariExtras normalizeEdges:
{
  v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  v7 = [NSNumber numberWithBool:a4];
  [v6 setValue:v7 forKey:*MEMORY[0x1E4F3A1B8]];

  v8 = [NSNumber numberWithDouble:a1];
  [v6 setValue:v8 forKey:*MEMORY[0x1E4F3A1D8]];

  return v6;
}

+ (uint64_t)safari_gaussianBlurWithRadius:()MobileSafariExtras
{
  return objc_msgSend(a1, "safari_gaussianBlurWithRadius:normalizeEdges:", 0);
}

@end