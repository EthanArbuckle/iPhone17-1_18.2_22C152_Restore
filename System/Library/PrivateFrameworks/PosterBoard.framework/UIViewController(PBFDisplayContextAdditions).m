@interface UIViewController(PBFDisplayContextAdditions)
- (id)pbf_displayContext;
- (uint64_t)pbf_layoutOrientation;
@end

@implementation UIViewController(PBFDisplayContextAdditions)

- (uint64_t)pbf_layoutOrientation
{
  if ([a1 isViewLoaded]
    && ([a1 view],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 window],
        v3 = objc_claimAutoreleasedReturnValue(),
        v2,
        v3))
  {
    uint64_t v4 = objc_msgSend(v3, "pbf_layoutOrientation");

    return v4;
  }
  else
  {
    v6 = [a1 parentViewController];

    if (v6)
    {
      v7 = [a1 parentViewController];
      uint64_t v8 = objc_msgSend(v7, "pbf_layoutOrientation");

      return v8;
    }
    else
    {
      return PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
    }
  }
}

- (id)pbf_displayContext
{
  v2 = [a1 _screen];
  if (!v2)
  {
    v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  }
  v3 = [a1 traitCollection];
  uint64_t v4 = +[PBFGenericDisplayContext displayContextForScreen:v2 traitCollection:v3];

  v5 = objc_msgSend(v4, "displayContextWithUpdatedInterfaceOrientation:", objc_msgSend(a1, "pbf_layoutOrientation"));

  return v5;
}

@end