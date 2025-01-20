@interface UIWindow(PBFDisplayContextAdditions)
- (id)pbf_displayContext;
- (uint64_t)pbf_layoutOrientation;
@end

@implementation UIWindow(PBFDisplayContextAdditions)

- (uint64_t)pbf_layoutOrientation
{
  v1 = [a1 windowScene];
  uint64_t v2 = [v1 interfaceOrientation];

  if (v2) {
    return v2;
  }
  return PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
}

- (id)pbf_displayContext
{
  uint64_t v2 = [a1 _screen];
  v3 = [a1 _screen];

  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1BA8] mainScreen];

    uint64_t v2 = (void *)v4;
  }
  v5 = [a1 traitCollection];
  v6 = +[PBFGenericDisplayContext displayContextForScreen:v2 traitCollection:v5];

  v7 = objc_msgSend(v6, "displayContextWithUpdatedInterfaceOrientation:", objc_msgSend(a1, "pbf_layoutOrientation"));

  return v7;
}

@end