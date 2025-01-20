@interface PhotosDynamicTitleOverlayController
- (BOOL)providesContentSizeForMeasurements;
- (CGSize)effectiveContentSize;
- (UIViewController)containerViewController;
- (void)setContainerViewController:(id)a3;
@end

@implementation PhotosDynamicTitleOverlayController

- (UIViewController)containerViewController
{
  v2 = &self->containerViewController[7];
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (UIViewController *)v3;
}

- (void)setContainerViewController:(id)a3
{
}

- (CGSize)effectiveContentSize
{
  sub_1AB22F8DC();
  double v2 = sub_1A9FB655C();
  double v4 = v3;
  swift_release();
  double v5 = v2;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)providesContentSizeForMeasurements
{
  sub_1AB22F8DC();
  BOOL v2 = sub_1A9FB6888();
  swift_release();
  return v2;
}

@end