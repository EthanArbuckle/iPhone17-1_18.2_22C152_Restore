@interface PFParallaxColor(PhotosUI)
+ (id)pu_parallaxColorWithHue:()PhotosUI chroma:lumaVariation:;
+ (id)pu_parallaxColorWithHue:()PhotosUI toneVariation:;
+ (id)pu_parallaxColorWithLuma:()PhotosUI hue:chromaVariation:;
+ (id)pu_parallaxColorWithUIColor:()PhotosUI;
- (uint64_t)pu_UIColor;
- (uint64_t)pu_chromaVariation;
- (uint64_t)pu_lumaVariation;
- (uint64_t)pu_toneVariation;
@end

@implementation PFParallaxColor(PhotosUI)

- (uint64_t)pu_chromaVariation
{
  [MEMORY[0x1E4F8A308] lowKeyTone];
  [MEMORY[0x1E4F8A308] highKeyTone];
  [a1 chroma];
  PXMapValueFromRangeToNewRange();
  return PXClamp();
}

- (uint64_t)pu_lumaVariation
{
  [MEMORY[0x1E4F8A308] lowKeyTone];
  [MEMORY[0x1E4F8A308] highKeyTone];
  [a1 luma];
  PXMapValueFromRangeToNewRange();
  return PXClamp();
}

- (uint64_t)pu_toneVariation
{
  [MEMORY[0x1E4F8A308] lowKeyTone];
  [MEMORY[0x1E4F8A308] highKeyTone];
  [a1 tone];
  PXMapValueFromRangeToNewRange();
  return PXClamp();
}

- (uint64_t)pu_UIColor
{
  v1 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v2 = [a1 CGColor];
  return [v1 colorWithCGColor:v2];
}

+ (id)pu_parallaxColorWithLuma:()PhotosUI hue:chromaVariation:
{
  [MEMORY[0x1E4F8A308] lowKeyTone];
  [MEMORY[0x1E4F8A308] highKeyTone];
  PXMapValueFromRangeToNewRange();
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F8CC78]) initWithLuma:a1 hue:a2 chroma:v4];
  return v5;
}

+ (id)pu_parallaxColorWithHue:()PhotosUI chroma:lumaVariation:
{
  [MEMORY[0x1E4F8A308] lowKeyTone];
  [MEMORY[0x1E4F8A308] highKeyTone];
  PXMapValueFromRangeToNewRange();
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F8CC78]) initWithLuma:v4 hue:a1 chroma:a2];
  return v5;
}

+ (id)pu_parallaxColorWithHue:()PhotosUI toneVariation:
{
  [MEMORY[0x1E4F8A308] lowKeyTone];
  [MEMORY[0x1E4F8A308] highKeyTone];
  PXMapValueFromRangeToNewRange();
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F8CC78]) initWithHue:a1 tone:v2];
  return v3;
}

+ (id)pu_parallaxColorWithUIColor:()PhotosUI
{
  if (a3)
  {
    double v4 = objc_msgSend(MEMORY[0x1E4F8CC78], "colorWithCGColor:", objc_msgSend(a3, "CGColor"));
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

@end