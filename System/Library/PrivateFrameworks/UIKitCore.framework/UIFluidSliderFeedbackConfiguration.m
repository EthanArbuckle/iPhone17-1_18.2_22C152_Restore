@interface UIFluidSliderFeedbackConfiguration
@end

@implementation UIFluidSliderFeedbackConfiguration

void __59___UIFluidSliderFeedbackConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_UIDiscreteFeedback discreteFeedbackForType:8];
  v4 = [v3 hapticParameters];
  LODWORD(v5) = 1050253722;
  [v4 setVolume:v5];

  v6 = +[_UIDiscreteFeedback discreteFeedbackForType:8];
  v7 = [v6 hapticParameters];
  LODWORD(v8) = 1058642330;
  [v7 setVolume:v8];

  v9 = +[_UIDiscreteFeedback discreteFeedbackForType:9];
  v10 = [v9 hapticParameters];
  LODWORD(v11) = 1053609165;
  [v10 setVolume:v11];

  v12 = (void *)*((void *)v2 + 17);
  *((void *)v2 + 17) = v3;
  id v19 = v3;

  uint64_t v13 = +[_UIDiscreteFeedback discreteFeedbackForType:11];
  v14 = (void *)*((void *)v2 + 15);
  *((void *)v2 + 15) = v13;

  v15 = (void *)*((void *)v2 + 16);
  *((void *)v2 + 16) = v9;
  id v16 = v9;

  v17 = (void *)*((void *)v2 + 14);
  *((void *)v2 + 14) = v6;
  id v18 = v6;

  objc_storeStrong((id *)v2 + 18, @"edge");
  objc_storeStrong((id *)v2 + 19, @"generic_selection");
}

@end