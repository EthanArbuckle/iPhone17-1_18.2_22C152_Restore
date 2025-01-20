@interface PhotosFullscreenPlaybackOverlayController
- (BOOL)providesContentSizeForMeasurements;
- (CGSize)effectiveContentSize;
- (UIViewController)containerViewController;
- (void)setContainerViewController:(id)a3;
@end

@implementation PhotosFullscreenPlaybackOverlayController

- (UIViewController)containerViewController
{
  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore41PhotosFullscreenPlaybackOverlayController_containerViewController;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (UIViewController *)v3;
}

- (void)setContainerViewController:(id)a3
{
}

- (BOOL)providesContentSizeForMeasurements
{
  return 0;
}

- (CGSize)effectiveContentSize
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end