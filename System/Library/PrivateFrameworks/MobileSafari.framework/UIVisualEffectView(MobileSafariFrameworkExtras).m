@interface UIVisualEffectView(MobileSafariFrameworkExtras)
+ (id)safari_statusBarGradientBlurEffectView;
+ (id)sf_startPageBackgroundTraits;
+ (id)sf_startPageCellBackgroundEffectViewWithShadow:()MobileSafariFrameworkExtras shadowRadius:;
+ (id)sf_startPageLabelVibrancyEffectView;
+ (uint64_t)sf_startPageCellBackgroundEffectViewWithShadow:()MobileSafariFrameworkExtras;
- (void)sf_configureAsStartPageBackground;
- (void)sf_configureAsStartPageBackgroundIgnoringVibrancy;
- (void)sf_configureAsStartPageBackgroundIgnoringVibrancyWithBackgroundColor:()MobileSafariFrameworkExtras;
- (void)sf_configureAsStartPageBackgroundWithNonVibrantBackgroundColor:()MobileSafariFrameworkExtras;
- (void)sf_configureAsStartPageForegroundWithEffectStyle:()MobileSafariFrameworkExtras;
- (void)sf_setHighlighted:()MobileSafariFrameworkExtras cellState:;
- (void)sf_setHighlighted:()MobileSafariFrameworkExtras cellState:nonVibrantBackgroundColor:;
@end

@implementation UIVisualEffectView(MobileSafariFrameworkExtras)

- (void)sf_configureAsStartPageBackground
{
  id v2 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  objc_msgSend(a1, "sf_configureAsStartPageBackgroundWithNonVibrantBackgroundColor:", v2);
}

- (void)sf_configureAsStartPageBackgroundWithNonVibrantBackgroundColor:()MobileSafariFrameworkExtras
{
  id v12 = a3;
  v4 = [a1 traitCollection];
  v5 = objc_msgSend(v4, "sf_backgroundBlurEffect");
  if (!objc_msgSend(v4, "sf_usesVibrantAppearance"))
  {
LABEL_6:
    objc_msgSend(a1, "sf_configureAsStartPageBackgroundIgnoringVibrancyWithBackgroundColor:", v12);
    goto LABEL_10;
  }
  if (v5)
  {
    if (debugOpaqueInPopover_onceToken != -1) {
      dispatch_once(&debugOpaqueInPopover_onceToken, &__block_literal_global_36_0);
    }
    if (debugOpaqueInPopover_flag) {
      goto LABEL_6;
    }
    v8 = [MEMORY[0x1E4FB1618] blackColor];
    v9 = [a1 contentView];
    [v9 setBackgroundColor:v8];

    uint64_t v7 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v5 style:6];
  }
  else
  {
    v6 = [a1 contentView];
    [v6 setBackgroundColor:0];

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultStartPageBackgroundEffect");
  }
  v10 = (void *)v7;
  [a1 setEffect:v7];

  v11 = [a1 layer];
  [v11 setShadowOpacity:0.0];

LABEL_10:
}

- (void)sf_configureAsStartPageBackgroundIgnoringVibrancyWithBackgroundColor:()MobileSafariFrameworkExtras
{
  id v4 = a3;
  v5 = [a1 contentView];
  [v5 setBackgroundColor:v4];

  [a1 setEffect:0];
  id v7 = [a1 layer];
  if ([v7 shadowPathIsBounds])
  {
    LODWORD(v6) = *(_DWORD *)"\nף=";
    [v7 setShadowOpacity:v6];
  }
}

+ (id)safari_statusBarGradientBlurEffectView
{
  if (safari_statusBarGradientBlurEffectView_onceToken != -1) {
    dispatch_once(&safari_statusBarGradientBlurEffectView_onceToken, &__block_literal_global_49);
  }
  id v0 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v1 = (void *)[v0 initWithEffect:safari_statusBarGradientBlurEffectView_gradientBlur];

  return v1;
}

+ (id)sf_startPageBackgroundTraits
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];

  return v0;
}

+ (id)sf_startPageCellBackgroundEffectViewWithShadow:()MobileSafariFrameworkExtras shadowRadius:
{
  id v6 = objc_alloc_init(a1);
  [v6 _setGroupName:@"start-page-cell"];
  [v6 _setContinuousCornerRadius:10.0];
  id v7 = [v6 contentView];
  [v7 _setContinuousCornerRadius:10.0];

  if (!a4)
  {
    if (debugShadows_onceToken != -1) {
      dispatch_once(&debugShadows_onceToken, &__block_literal_global_30);
    }
LABEL_8:
    if (debugShadows_flag != 1) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (debugShadows_onceToken != -1) {
    dispatch_once(&debugShadows_onceToken, &__block_literal_global_30);
  }
  if (debugShadows_flag == 2) {
    goto LABEL_8;
  }
LABEL_9:
  v8 = [v6 layer];
  [v8 setShadowRadius:a2];
  [v8 setShadowPathIsBounds:1];
  id v9 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v8, "setShadowColor:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(v8, "setShadowOffset:", 0.0, 6.0);
  [v8 setShadowOpacity:0.0];

LABEL_10:

  return v6;
}

+ (uint64_t)sf_startPageCellBackgroundEffectViewWithShadow:()MobileSafariFrameworkExtras
{
  return objc_msgSend(a1, "sf_startPageCellBackgroundEffectViewWithShadow:shadowRadius:", 12.0);
}

+ (id)sf_startPageLabelVibrancyEffectView
{
  id v0 = (void *)MEMORY[0x1E4FB1EA0];
  v1 = objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultStartPageBackgroundEffect");
  id v2 = [v0 effectForBlurEffect:v1 style:0];

  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v2];

  return v3;
}

- (void)sf_configureAsStartPageBackgroundIgnoringVibrancy
{
  id v2 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  objc_msgSend(a1, "sf_configureAsStartPageBackgroundIgnoringVibrancyWithBackgroundColor:", v2);
}

- (void)sf_configureAsStartPageForegroundWithEffectStyle:()MobileSafariFrameworkExtras
{
  id v10 = [a1 traitCollection];
  if (objc_msgSend(v10, "sf_usesVibrantAppearance"))
  {
    v5 = objc_msgSend(v10, "sf_backgroundBlurEffect");
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultStartPageBackgroundEffect");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    id v9 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v7 style:a3];
    [a1 setEffect:v9];
  }
  else
  {
    [a1 setEffect:0];
  }
}

- (void)sf_setHighlighted:()MobileSafariFrameworkExtras cellState:
{
  id v6 = (void *)MEMORY[0x1E4FB1498];
  id v7 = a4;
  v8 = [v6 listGroupedCellConfiguration];
  id v10 = [v8 updatedConfigurationForState:v7];

  id v9 = [v10 backgroundColor];
  objc_msgSend(a1, "sf_setHighlighted:cellState:nonVibrantBackgroundColor:", a3, v7, v9);
}

- (void)sf_setHighlighted:()MobileSafariFrameworkExtras cellState:nonVibrantBackgroundColor:
{
  id v8 = a5;
  id v6 = [a1 effect];

  if (!v6)
  {
    id v7 = [a1 contentView];
    [v7 setBackgroundColor:v8];
  }
}

@end