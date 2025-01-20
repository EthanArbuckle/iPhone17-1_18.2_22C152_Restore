@interface SiriUIContentLabel
+ (id)label;
+ (id)labelWithBodyFont;
+ (id)labelWithHeaderFont;
+ (id)labelWithLightWeightFontSize:(double)a3;
+ (id)labelWithLightWeightRegularFont;
+ (id)labelWithLightWeightSubtextFont;
+ (id)labelWithMediumWeightRegularFont;
+ (id)labelWithMediumWeightSubtextFont;
+ (id)labelWithSubtitleFont;
+ (id)labelWithThinWeightFontSize:(double)a3;
+ (id)labelWithThinWeightRegularFont;
+ (id)labelWithThinWeightSubtextFont;
- (SiriUIContentLabel)initWithFrame:(CGRect)a3;
@end

@implementation SiriUIContentLabel

+ (id)label
{
  v2 = objc_opt_class();
  return (id)[v2 labelWithLightWeightRegularFont];
}

+ (id)labelWithLightWeightFontSize:(double)a3
{
  id v4 = objc_alloc_init((Class)a1);
  v5 = objc_msgSend(MEMORY[0x263F1C658], "siriui_lightWeightFontWithSize:", a3);
  [v4 setFont:v5];

  return v4;
}

+ (id)labelWithThinWeightFontSize:(double)a3
{
  id v4 = objc_alloc_init((Class)a1);
  v5 = objc_msgSend(MEMORY[0x263F1C658], "siriui_thinWeightFontWithSize:", a3);
  [v4 setFont:v5];

  return v4;
}

+ (id)labelWithThinWeightRegularFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F1C658], "siriui_thinWeightBodySizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithLightWeightRegularFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F1C658], "siriui_lightWeightBodySizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithMediumWeightRegularFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F1C658], "siriui_mediumWeightBodySizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithThinWeightSubtextFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F1C658], "siriui_thinWeightBodySubtextSizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithLightWeightSubtextFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F1C658], "siriui_lightWeightBodySubtextSizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithMediumWeightSubtextFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F1C658], "siriui_mediumWeightBodySubtextSizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithHeaderFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F1C658], "siriui_headerFont");
  [v2 setFont:v3];

  [v2 setTextAlignment:1];
  return v2;
}

+ (id)labelWithSubtitleFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F1C658], "siriui_subtitleFont");
  [v2 setFont:v3];

  [v2 setTextAlignment:1];
  return v2;
}

- (SiriUIContentLabel)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUIContentLabel;
  v3 = -[SiriUIContentLabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_msgSend(MEMORY[0x263F1C550], "siriui_textColor");
    [(SiriUIContentLabel *)v3 setTextColor:v4];

    v5 = [MEMORY[0x263F1C550] clearColor];
    [(SiriUIContentLabel *)v3 setBackgroundColor:v5];
  }
  return v3;
}

+ (id)labelWithBodyFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F1C658], "siriui_dynamicBodyFont");
  [v2 setFont:v3];

  return v2;
}

@end