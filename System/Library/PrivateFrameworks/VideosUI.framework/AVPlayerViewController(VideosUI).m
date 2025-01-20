@interface AVPlayerViewController(VideosUI)
- (id)vui_viewControllerForFullScreenPresentation;
@end

@implementation AVPlayerViewController(VideosUI)

- (id)vui_viewControllerForFullScreenPresentation
{
  uint64_t v2 = [a1 viewControllerForFullScreenPresentation];
  v3 = (void *)v2;
  if (v2) {
    v4 = (void *)v2;
  }
  else {
    v4 = a1;
  }
  id v5 = v4;

  objc_msgSend(v5, "setVui_requiresLegacyPresentation:", 1);
  return v5;
}

@end