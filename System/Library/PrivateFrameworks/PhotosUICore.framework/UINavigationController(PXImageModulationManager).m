@interface UINavigationController(PXImageModulationManager)
- (double)px_HDRFocus;
- (double)px_imageModulationIntensity;
- (uint64_t)px_isImageModulationEnabled;
@end

@implementation UINavigationController(PXImageModulationManager)

- (double)px_imageModulationIntensity
{
  v2 = objc_msgSend(a1, "px_topViewController");
  objc_msgSend(v2, "px_imageModulationIntensity");
  double v4 = v3;

  if (px_imageModulationIntensity_onceToken != -1) {
    dispatch_once(&px_imageModulationIntensity_onceToken, &__block_literal_global_301_149093);
  }
  if (!px_imageModulationIntensity_hookExists) {
    return v4;
  }
  objc_msgSend(a1, "px_imageModulationIntensityWithProposedValue:", v4);
  return result;
}

- (double)px_HDRFocus
{
  v1 = objc_msgSend(a1, "px_topViewController");
  objc_msgSend(v1, "px_HDRFocus");
  double v3 = v2;

  return v3;
}

- (uint64_t)px_isImageModulationEnabled
{
  v1 = objc_msgSend(a1, "px_topViewController");
  uint64_t v2 = objc_msgSend(v1, "px_isImageModulationEnabled");

  return v2;
}

@end