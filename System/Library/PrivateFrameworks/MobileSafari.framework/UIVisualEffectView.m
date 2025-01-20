@interface UIVisualEffectView
@end

@implementation UIVisualEffectView

void __89__UIVisualEffectView_MobileSafariFrameworkExtras__safari_statusBarGradientBlurEffectView__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB14C8];
  objc_msgSend(MEMORY[0x1E4FB1818], "sf_imageNamed:", @"status_bar_blur_mask");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 effectWithVariableBlurRadius:v3 imageMask:3.0];
  v2 = (void *)safari_statusBarGradientBlurEffectView_gradientBlur;
  safari_statusBarGradientBlurEffectView_gradientBlur = v1;
}

@end