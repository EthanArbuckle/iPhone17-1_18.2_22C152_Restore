@interface SSChromeHelper
+ (CGRect)availableRectForFullscreenContent:(CGRect)result layoutBounds:(CGRect)a4 bleedToBottom:(BOOL)a5 topBarHeight:(double)a6 bottomBarHeight:(double)a7 userInterfaceIdiom:(int64_t)a8 multipleScreenshots:(BOOL)a9;
+ (double)barButtonItemsLeftOfOpacitySlider;
+ (double)barSeparatorSize;
+ (double)contentSwitcherPadding;
+ (double)countIndicatorOffset;
+ (double)cropsCornerLength;
+ (double)cropsCornerWidth;
+ (double)cropsHandleOutset;
+ (double)defaultBarButtonSpacing;
+ (double)defaultBarButtonWidth;
+ (double)screenshotTopBottomMargin:(int64_t)a3;
+ (double)screenshotTopBottomMarginPad;
+ (double)screenshotTopBottomMarginPhone;
+ (double)widthForContentSwitcher:(id)a3 forView:(id)a4;
+ (double)widthForOpacityControlInView:(id)a3 withContentSwitcher:(id)a4;
+ (id)barSeparatorColor;
+ (id)createFixedSpaceBarButtonItemWithWidth:(double)a3;
+ (id)separatorView;
+ (int)statusBarVisibilityForTraitCollection:(id)a3 isPortrait:(BOOL)a4;
+ (int64_t)backgroundBlurEffectStyle;
+ (int64_t)statusBarStyle;
+ (void)configureNavigationBarAppearance:(id)a3;
@end

@implementation SSChromeHelper

+ (void)configureNavigationBarAppearance:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F1C240];
  v3 = (void *)MEMORY[0x263F1C550];
  id v4 = a3;
  v5 = [v3 whiteColor];
  v13[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v4 setTitleTextAttributes:v6];

  v7 = objc_opt_new();
  v8 = objc_opt_new();
  [v4 setShadowImage:v8];

  v9 = [MEMORY[0x263F1C480] effectWithStyle:1102];
  v11 = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  [v4 setBackgroundEffects:v10];

  [v4 setAlpha:1.0];
  [v4 setBarTintColor:0];
  [v4 setOpaque:0];
  [v4 setTranslucent:1];
  [v4 setBackgroundImage:v7 forBarMetrics:0];
}

+ (id)createFixedSpaceBarButtonItemWithWidth:(double)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:6 target:0 action:0];
  [v4 setWidth:a3];
  return v4;
}

+ (double)defaultBarButtonSpacing
{
  return 20.0;
}

+ (double)defaultBarButtonWidth
{
  return 44.0;
}

+ (id)barSeparatorColor
{
  return (id)[MEMORY[0x263F1C550] separatorColor];
}

+ (id)separatorView
{
  id v2 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v2 _setOverrideUserInterfaceStyle:2];
  v3 = +[SSChromeHelper barSeparatorColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

+ (double)barSeparatorSize
{
  return 1.0;
}

+ (double)cropsCornerWidth
{
  return 4.0;
}

+ (double)cropsCornerLength
{
  return 20.0;
}

+ (double)cropsHandleOutset
{
  return 0.0;
}

+ (CGRect)availableRectForFullscreenContent:(CGRect)result layoutBounds:(CGRect)a4 bleedToBottom:(BOOL)a5 topBarHeight:(double)a6 bottomBarHeight:(double)a7 userInterfaceIdiom:(int64_t)a8 multipleScreenshots:(BOOL)a9
{
  double width = result.size.width;
  if (!a5)
  {
    BOOL v10 = a9;
    double height = a4.size.height;
    double v13 = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    double v26 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    double v25 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v16 = *MEMORY[0x263F1D1C0] + a6;
    double v17 = *(double *)(MEMORY[0x263F1D1C0] + 16) + a7;
    +[SSChromeHelper screenshotTopBottomMargin:a8];
    double v19 = v18;
    if (!a8 && v10)
    {
      [(id)objc_opt_class() countIndicatorOffset];
      double v19 = v19 + v20 * 2.0;
    }
    double v21 = v16 + v19;
    if (a8 == 1) {
      double v22 = width * 0.115;
    }
    else {
      double v22 = v26;
    }
    if (a8 == 1) {
      double v23 = width * 0.115;
    }
    else {
      double v23 = v25;
    }
    result.origin.double x = x + v23;
    result.origin.double y = y + v21;
    double width = v13 - (v23 + v22);
    result.size.double height = height - (v21 + v17 + v19);
  }
  double v24 = width;
  result.size.double width = v24;
  return result;
}

+ (double)countIndicatorOffset
{
  return 8.0;
}

+ (double)screenshotTopBottomMargin:(int64_t)a3
{
  if (a3 == 1) {
    +[SSChromeHelper screenshotTopBottomMarginPad];
  }
  else {
    +[SSChromeHelper screenshotTopBottomMarginPhone];
  }
  return result;
}

+ (double)screenshotTopBottomMarginPad
{
  return 20.0;
}

+ (double)screenshotTopBottomMarginPhone
{
  return 30.0;
}

+ (double)widthForContentSwitcher:(id)a3 forView:(id)a4
{
  return 114.0;
}

+ (double)widthForOpacityControlInView:(id)a3 withContentSwitcher:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[SSChromeHelper barButtonItemsLeftOfOpacitySlider];
  double v9 = v8;
  +[SSChromeHelper defaultBarButtonWidth];
  double v11 = v10;
  +[SSChromeHelper widthForContentSwitcher:v6 forView:v7];
  double v13 = v12;

  +[SSChromeHelper contentSwitcherPadding];
  double v15 = v13 + v11 * v9 + v14;
  [a1 defaultBarButtonSpacing];
  double v17 = v15 + v16 * 2.0;
  +[SSVellumOpacityControl preferredWidth];
  double v19 = v18;
  [v7 bounds];
  double v21 = v20;

  return fmin(v19, v21 * 0.5 - v17);
}

+ (double)barButtonItemsLeftOfOpacitySlider
{
  return 2.0;
}

+ (double)contentSwitcherPadding
{
  return 16.0;
}

+ (int)statusBarVisibilityForTraitCollection:(id)a3 isPortrait:(BOOL)a4
{
  if (a4) {
    int v4 = 2;
  }
  else {
    int v4 = 1;
  }
  if ([a3 userInterfaceIdiom]) {
    return 2;
  }
  else {
    return v4;
  }
}

+ (int64_t)statusBarStyle
{
  return 1;
}

+ (int64_t)backgroundBlurEffectStyle
{
  return 2;
}

@end