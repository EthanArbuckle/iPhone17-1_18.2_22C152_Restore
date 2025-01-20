@interface UIFont(UIKit_SiriUIFrameworkAdditions)
+ (float)siriui_preferredDynamicBodySize;
+ (float)siriui_preferredDynamicBodySubtextSize;
+ (id)siriUI_dynamicSubHeadlineEmphasizedSizeFont;
+ (id)siriUI_dynamicSubHeadlineMediumSizeFont;
+ (id)siriui_dynamicTitle0Font;
+ (id)siriui_serverTipPrefixFont;
+ (id)siriui_serverUtteranceFont;
+ (uint64_t)siriui_dynamicBodyFont;
+ (uint64_t)siriui_dynamicHeaderFont;
+ (uint64_t)siriui_dynamicLightWeightBodySizeFont;
+ (uint64_t)siriui_dynamicLightWeightBodySubtextSizeFont;
+ (uint64_t)siriui_dynamicMediumWeightBodySizeFont;
+ (uint64_t)siriui_dynamicMediumWeightBodySubtextSizeFont;
+ (uint64_t)siriui_dynamicThinWeightBodySizeFont;
+ (uint64_t)siriui_dynamicThinWeightBodySubtextSizeFont;
+ (uint64_t)siriui_headerFont;
+ (uint64_t)siriui_largeHeaderFontWithSize:()UIKit_SiriUIFrameworkAdditions;
+ (uint64_t)siriui_lightWeightBodySizeFont;
+ (uint64_t)siriui_lightWeightBodySubtextSizeFont;
+ (uint64_t)siriui_lightWeightFontWithSize:()UIKit_SiriUIFrameworkAdditions;
+ (uint64_t)siriui_mediumWeightBodySizeFont;
+ (uint64_t)siriui_mediumWeightBodySubtextSizeFont;
+ (uint64_t)siriui_mediumWeightFontWithSize:()UIKit_SiriUIFrameworkAdditions;
+ (uint64_t)siriui_ratingFont;
+ (uint64_t)siriui_serverTipFont;
+ (uint64_t)siriui_serverUtteranceCorrectionPromptFont;
+ (uint64_t)siriui_subtitleFont;
+ (uint64_t)siriui_thinWeightBodySizeFont;
+ (uint64_t)siriui_thinWeightBodySubtextSizeFont;
+ (uint64_t)siriui_thinWeightFontWithSize:()UIKit_SiriUIFrameworkAdditions;
+ (uint64_t)siriui_typedTextInputFont;
+ (uint64_t)siriui_userUtteranceFont;
@end

@implementation UIFont(UIKit_SiriUIFrameworkAdditions)

+ (uint64_t)siriui_lightWeightFontWithSize:()UIKit_SiriUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:");
}

+ (uint64_t)siriui_thinWeightFontWithSize:()UIKit_SiriUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x263F1C658], "_lightSystemFontOfSize:");
}

+ (uint64_t)siriui_mediumWeightFontWithSize:()UIKit_SiriUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:");
}

+ (uint64_t)siriui_lightWeightBodySizeFont
{
  return objc_msgSend(a1, "siriui_lightWeightFontWithSize:", 18.0);
}

+ (uint64_t)siriui_thinWeightBodySizeFont
{
  return objc_msgSend(a1, "siriui_thinWeightFontWithSize:", 18.0);
}

+ (uint64_t)siriui_mediumWeightBodySizeFont
{
  return objc_msgSend(a1, "siriui_mediumWeightFontWithSize:", 18.0);
}

+ (uint64_t)siriui_lightWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "siriui_lightWeightFontWithSize:", 14.0);
}

+ (uint64_t)siriui_thinWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "siriui_thinWeightFontWithSize:", 14.0);
}

+ (uint64_t)siriui_mediumWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "siriui_mediumWeightFontWithSize:", 14.0);
}

+ (uint64_t)siriui_headerFont
{
  return objc_msgSend(a1, "siriui_thinWeightFontWithSize:", 32.0);
}

+ (uint64_t)siriui_largeHeaderFontWithSize:()UIKit_SiriUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x263F1C658], "_lightSystemFontOfSize:");
}

+ (uint64_t)siriui_subtitleFont
{
  return objc_msgSend(a1, "siriui_lightWeightFontWithSize:", 14.0);
}

+ (id)siriui_serverUtteranceFont
{
  v0 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D300]];
  v1 = [v0 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:2];

  v3 = [MEMORY[0x263F1C658] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (uint64_t)siriui_serverUtteranceCorrectionPromptFont
{
  return [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
}

+ (uint64_t)siriui_serverTipFont
{
  return [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D300]];
}

+ (id)siriui_serverTipPrefixFont
{
  v0 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D300]];
  v1 = [v0 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:2];

  v3 = [MEMORY[0x263F1C658] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (uint64_t)siriui_ratingFont
{
  return [MEMORY[0x263F1C658] systemFontOfSize:12.5 weight:*MEMORY[0x263F1D340]];
}

+ (uint64_t)siriui_userUtteranceFont
{
  return [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D300]];
}

+ (uint64_t)siriui_typedTextInputFont
{
  return [MEMORY[0x263F1C658] _preferredFontForTextStyle:*MEMORY[0x263F1D260] maximumContentSizeCategory:*MEMORY[0x263F1D148]];
}

+ (uint64_t)siriui_dynamicHeaderFont
{
  return [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
}

+ (uint64_t)siriui_dynamicBodyFont
{
  return [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
}

+ (id)siriui_dynamicTitle0Font
{
  v0 = (void *)MEMORY[0x263F1C658];
  v1 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2F0]];
  [v1 pointSize];
  v2 = objc_msgSend(v0, "systemFontOfSize:weight:");

  return v2;
}

+ (float)siriui_preferredDynamicBodySize
{
  v0 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [v0 _scaledValueForValue:18.0];
  double v2 = round(v1);

  return fmax(v2, 18.0);
}

+ (float)siriui_preferredDynamicBodySubtextSize
{
  v0 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
  [v0 _scaledValueForValue:14.0];
  double v2 = round(v1);

  return fmax(v2, 14.0);
}

+ (uint64_t)siriui_dynamicLightWeightBodySizeFont
{
  objc_msgSend(a1, "siriui_preferredDynamicBodySize");
  double v3 = v2;
  return objc_msgSend(a1, "siriui_lightWeightFontWithSize:", v3);
}

+ (uint64_t)siriui_dynamicThinWeightBodySizeFont
{
  objc_msgSend(a1, "siriui_preferredDynamicBodySize");
  double v3 = v2;
  return objc_msgSend(a1, "siriui_thinWeightFontWithSize:", v3);
}

+ (uint64_t)siriui_dynamicMediumWeightBodySizeFont
{
  objc_msgSend(a1, "siriui_preferredDynamicBodySize");
  double v3 = v2;
  return objc_msgSend(a1, "siriui_mediumWeightFontWithSize:", v3);
}

+ (uint64_t)siriui_dynamicLightWeightBodySubtextSizeFont
{
  objc_msgSend(a1, "siriui_preferredDynamicBodySubtextSize");
  double v3 = v2;
  return objc_msgSend(a1, "siriui_lightWeightFontWithSize:", v3);
}

+ (uint64_t)siriui_dynamicThinWeightBodySubtextSizeFont
{
  objc_msgSend(a1, "siriui_preferredDynamicBodySubtextSize");
  double v3 = v2;
  return objc_msgSend(a1, "siriui_thinWeightFontWithSize:", v3);
}

+ (uint64_t)siriui_dynamicMediumWeightBodySubtextSizeFont
{
  objc_msgSend(a1, "siriui_preferredDynamicBodySubtextSize");
  double v3 = v2;
  return objc_msgSend(a1, "siriui_mediumWeightFontWithSize:", v3);
}

+ (id)siriUI_dynamicSubHeadlineMediumSizeFont
{
  v0 = (void *)MEMORY[0x263F1C658];
  double v1 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2C0]];
  [v1 pointSize];
  float v2 = objc_msgSend(v0, "systemFontOfSize:weight:");

  return v2;
}

+ (id)siriUI_dynamicSubHeadlineEmphasizedSizeFont
{
  v0 = (void *)MEMORY[0x263F1C658];
  double v1 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2C0]];
  [v1 pointSize];
  float v2 = objc_msgSend(v0, "systemFontOfSize:weight:");

  return v2;
}

@end