@interface UILabel(SiriUITextStyles)
+ (id)siriui_configuredBodyLabel;
+ (id)siriui_configuredCaptionLabel;
+ (id)siriui_configuredFootnoteLabel;
+ (id)siriui_configuredHeadlineLabel;
+ (id)siriui_configuredLabel;
+ (id)siriui_configuredPriceLabel;
+ (id)siriui_configuredSubheadLabel;
+ (id)siriui_configuredTitle3Label;
+ (id)siriui_configuredTitleLabel;
- (void)setUseSecondaryTextColor;
@end

@implementation UILabel(SiriUITextStyles)

+ (id)siriui_configuredLabel
{
  id v0 = objc_alloc(MEMORY[0x263F1C768]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v2 = objc_msgSend(MEMORY[0x263F1C550], "siriui_platterTextColor");
  [v1 setTextColor:v2];

  return v1;
}

+ (id)siriui_configuredBodyLabel
{
  id v0 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredLabel");
  v1 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [v0 setFont:v1];

  return v0;
}

+ (id)siriui_configuredHeadlineLabel
{
  id v0 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredLabel");
  v1 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
  [v0 setFont:v1];

  return v0;
}

+ (id)siriui_configuredSubheadLabel
{
  id v0 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredLabel");
  v1 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
  [v0 setFont:v1];

  return v0;
}

+ (id)siriui_configuredCaptionLabel
{
  id v0 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredLabel");
  v1 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D270]];
  [v0 setFont:v1];

  [v0 setNumberOfLines:0];
  return v0;
}

+ (id)siriui_configuredPriceLabel
{
  v7[1] = *MEMORY[0x263EF8340];
  id v0 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredLabel");
  id v1 = objc_alloc(MEMORY[0x263F1C660]);
  uint64_t v6 = *MEMORY[0x263F1D208];
  v7[0] = *MEMORY[0x263F1D260];
  v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v3 = (void *)[v1 initWithFontAttributes:v2];

  v4 = [MEMORY[0x263F1C658] fontWithDescriptor:v3 size:70.0];
  [v0 setFont:v4];

  return v0;
}

+ (id)siriui_configuredTitleLabel
{
  id v0 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredLabel");
  id v1 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
  [v0 setFont:v1];

  return v0;
}

+ (id)siriui_configuredTitle3Label
{
  id v0 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredLabel");
  id v1 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D308]];
  [v0 setFont:v1];

  return v0;
}

+ (id)siriui_configuredFootnoteLabel
{
  id v0 = objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredLabel");
  id v1 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
  [v0 setFont:v1];

  return v0;
}

- (void)setUseSecondaryTextColor
{
  objc_msgSend(MEMORY[0x263F1C550], "siriui_platterSemiTransparentTextColor");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setTextColor:v2];
}

@end