@interface UIFont(SiriSharedUIFrameworkAdditions)
+ (float)sirisharedui_preferredDynamicBodySize;
+ (float)sirisharedui_preferredDynamicBodySubtextSize;
+ (id)sirisharedui_dynamicTitle0Font;
+ (id)sirisharedui_serverTipPrefixFont;
+ (id)sirisharedui_serverUtteranceFont;
+ (uint64_t)sirisharedui_boldWeightFontWithSize:()SiriSharedUIFrameworkAdditions;
+ (uint64_t)sirisharedui_dynamicBodyFont;
+ (uint64_t)sirisharedui_dynamicHeaderFont;
+ (uint64_t)sirisharedui_dynamicLightWeightBodySizeFont;
+ (uint64_t)sirisharedui_dynamicLightWeightBodySubtextSizeFont;
+ (uint64_t)sirisharedui_dynamicMediumWeightBodySizeFont;
+ (uint64_t)sirisharedui_dynamicMediumWeightBodySubtextSizeFont;
+ (uint64_t)sirisharedui_dynamicThinWeightBodySizeFont;
+ (uint64_t)sirisharedui_dynamicThinWeightBodySubtextSizeFont;
+ (uint64_t)sirisharedui_headerFont;
+ (uint64_t)sirisharedui_largeHeaderFontWithSize:()SiriSharedUIFrameworkAdditions;
+ (uint64_t)sirisharedui_lightWeightBodySizeFont;
+ (uint64_t)sirisharedui_lightWeightBodySubtextSizeFont;
+ (uint64_t)sirisharedui_lightWeightFontWithSize:()SiriSharedUIFrameworkAdditions;
+ (uint64_t)sirisharedui_mediumWeightBodySizeFont;
+ (uint64_t)sirisharedui_mediumWeightBodySubtextSizeFont;
+ (uint64_t)sirisharedui_mediumWeightFontWithSize:()SiriSharedUIFrameworkAdditions;
+ (uint64_t)sirisharedui_ratingFont;
+ (uint64_t)sirisharedui_regularWeightFontWithSize:()SiriSharedUIFrameworkAdditions;
+ (uint64_t)sirisharedui_semiboldWeightFontWithSize:()SiriSharedUIFrameworkAdditions;
+ (uint64_t)sirisharedui_serverTipFont;
+ (uint64_t)sirisharedui_serverUtteranceCorrectionPromptFont;
+ (uint64_t)sirisharedui_subtitleFont;
+ (uint64_t)sirisharedui_thinWeightBodySizeFont;
+ (uint64_t)sirisharedui_thinWeightBodySubtextSizeFont;
+ (uint64_t)sirisharedui_thinWeightFontWithSize:()SiriSharedUIFrameworkAdditions;
+ (uint64_t)sirisharedui_typedTextInputFont;
+ (uint64_t)sirisharedui_userUtteranceFont;
@end

@implementation UIFont(SiriSharedUIFrameworkAdditions)

+ (uint64_t)sirisharedui_lightWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x263F81708], "systemFontOfSize:");
}

+ (uint64_t)sirisharedui_thinWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x263F81708], "_lightSystemFontOfSize:");
}

+ (uint64_t)sirisharedui_mediumWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x263F81708], "boldSystemFontOfSize:");
}

+ (uint64_t)sirisharedui_regularWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return [MEMORY[0x263F81708] systemFontOfSize:a1 weight:*MEMORY[0x263F81838]];
}

+ (uint64_t)sirisharedui_semiboldWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return [MEMORY[0x263F81708] systemFontOfSize:a1 weight:*MEMORY[0x263F81840]];
}

+ (uint64_t)sirisharedui_boldWeightFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x263F81708], "boldSystemFontOfSize:");
}

+ (uint64_t)sirisharedui_lightWeightBodySizeFont
{
  return objc_msgSend(a1, "sirisharedui_lightWeightFontWithSize:", 18.0);
}

+ (uint64_t)sirisharedui_thinWeightBodySizeFont
{
  return objc_msgSend(a1, "sirisharedui_thinWeightFontWithSize:", 18.0);
}

+ (uint64_t)sirisharedui_mediumWeightBodySizeFont
{
  return objc_msgSend(a1, "sirisharedui_mediumWeightFontWithSize:", 18.0);
}

+ (uint64_t)sirisharedui_lightWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "sirisharedui_lightWeightFontWithSize:", 14.0);
}

+ (uint64_t)sirisharedui_thinWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "sirisharedui_thinWeightFontWithSize:", 14.0);
}

+ (uint64_t)sirisharedui_mediumWeightBodySubtextSizeFont
{
  return objc_msgSend(a1, "sirisharedui_mediumWeightFontWithSize:", 14.0);
}

+ (uint64_t)sirisharedui_headerFont
{
  return objc_msgSend(a1, "sirisharedui_thinWeightFontWithSize:", 32.0);
}

+ (uint64_t)sirisharedui_largeHeaderFontWithSize:()SiriSharedUIFrameworkAdditions
{
  return objc_msgSend(MEMORY[0x263F81708], "_lightSystemFontOfSize:");
}

+ (uint64_t)sirisharedui_subtitleFont
{
  return objc_msgSend(a1, "sirisharedui_lightWeightFontWithSize:", 14.0);
}

+ (id)sirisharedui_serverUtteranceFont
{
  v0 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
  v1 = [v0 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:2];

  v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (uint64_t)sirisharedui_serverUtteranceCorrectionPromptFont
{
  return [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
}

+ (uint64_t)sirisharedui_serverTipFont
{
  return [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
}

+ (id)sirisharedui_serverTipPrefixFont
{
  v0 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
  v1 = [v0 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:2];

  v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (uint64_t)sirisharedui_ratingFont
{
  return [MEMORY[0x263F81708] systemFontOfSize:12.5 weight:*MEMORY[0x263F81840]];
}

+ (uint64_t)sirisharedui_userUtteranceFont
{
  return [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
}

+ (uint64_t)sirisharedui_typedTextInputFont
{
  return [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83570] maximumContentSizeCategory:*MEMORY[0x263F83418]];
}

+ (uint64_t)sirisharedui_dynamicHeaderFont
{
  return [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83610]];
}

+ (uint64_t)sirisharedui_dynamicBodyFont
{
  return [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
}

+ (id)sirisharedui_dynamicTitle0Font
{
  v0 = (void *)MEMORY[0x263F81708];
  v1 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83608]];
  [v1 pointSize];
  v2 = objc_msgSend(v0, "systemFontOfSize:weight:");

  return v2;
}

+ (float)sirisharedui_preferredDynamicBodySize
{
  v0 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v0 _scaledValueForValue:18.0];
  double v2 = round(v1);

  return fmax(v2, 18.0);
}

+ (float)sirisharedui_preferredDynamicBodySubtextSize
{
  v0 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [v0 _scaledValueForValue:14.0];
  double v2 = round(v1);

  return fmax(v2, 14.0);
}

+ (uint64_t)sirisharedui_dynamicLightWeightBodySizeFont
{
  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySize");
  double v3 = v2;
  return objc_msgSend(a1, "sirisharedui_lightWeightFontWithSize:", v3);
}

+ (uint64_t)sirisharedui_dynamicThinWeightBodySizeFont
{
  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySize");
  double v3 = v2;
  return objc_msgSend(a1, "sirisharedui_thinWeightFontWithSize:", v3);
}

+ (uint64_t)sirisharedui_dynamicMediumWeightBodySizeFont
{
  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySize");
  double v3 = v2;
  return objc_msgSend(a1, "sirisharedui_mediumWeightFontWithSize:", v3);
}

+ (uint64_t)sirisharedui_dynamicLightWeightBodySubtextSizeFont
{
  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySubtextSize");
  double v3 = v2;
  return objc_msgSend(a1, "sirisharedui_lightWeightFontWithSize:", v3);
}

+ (uint64_t)sirisharedui_dynamicThinWeightBodySubtextSizeFont
{
  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySubtextSize");
  double v3 = v2;
  return objc_msgSend(a1, "sirisharedui_thinWeightFontWithSize:", v3);
}

+ (uint64_t)sirisharedui_dynamicMediumWeightBodySubtextSizeFont
{
  objc_msgSend(a1, "sirisharedui_preferredDynamicBodySubtextSize");
  double v3 = v2;
  return objc_msgSend(a1, "sirisharedui_mediumWeightFontWithSize:", v3);
}

@end