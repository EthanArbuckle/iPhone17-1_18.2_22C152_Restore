@interface PUSlideshowSettingsViewControllerSpec
- (BOOL)shouldShowNavigationBar;
- (BOOL)shouldUseBlurredBackground;
- (UIColor)cellBackgroundColor;
- (UIColor)tableViewBackgroundColor;
- (UIView)tableViewHeaderView;
- (id)currentChange;
- (id)newSpecChange;
- (unint64_t)rectEdgeForExtendedLayout;
@end

@implementation PUSlideshowSettingsViewControllerSpec

- (unint64_t)rectEdgeForExtendedLayout
{
  if ([(PUSlideshowSettingsViewControllerSpec *)self shouldUseBlurredBackground]) {
    return 0;
  }
  else {
    return 15;
  }
}

- (UIView)tableViewHeaderView
{
  if ([(PUSlideshowSettingsViewControllerSpec *)self shouldUseBlurredBackground])
  {
    v3 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PUViewControllerSpec *)self layoutReferenceSize];
    v3 = objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, v5, 44.0);
  }
  return (UIView *)v3;
}

- (UIColor)tableViewBackgroundColor
{
  if ([(PUSlideshowSettingsViewControllerSpec *)self shouldUseBlurredBackground])
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  return (UIColor *)v2;
}

- (UIColor)cellBackgroundColor
{
  if ([(PUSlideshowSettingsViewControllerSpec *)self shouldUseBlurredBackground]) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  }
  return (UIColor *)v2;
}

- (BOOL)shouldUseBlurredBackground
{
  return !UIAccessibilityIsReduceTransparencyEnabled()
      && [(PUViewControllerSpec *)self currentLayoutStyle] == 4;
}

- (BOOL)shouldShowNavigationBar
{
  return [(PUViewControllerSpec *)self currentLayoutStyle] != 4;
}

- (id)currentChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowSettingsViewControllerSpec;
  v2 = [(PUViewControllerSpec *)&v4 currentChange];
  return v2;
}

- (id)newSpecChange
{
  return objc_alloc_init(PUSlideshowSettingsViewControllerSpecChange);
}

@end