@interface SiriSharedUIContentLabel
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
- (SiriSharedUIContentLabel)initWithFrame:(CGRect)a3;
@end

@implementation SiriSharedUIContentLabel

+ (id)label
{
  v2 = objc_opt_class();
  return (id)[v2 labelWithLightWeightRegularFont];
}

+ (id)labelWithLightWeightFontSize:(double)a3
{
  id v4 = objc_alloc_init((Class)a1);
  v5 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_lightWeightFontWithSize:", a3);
  [v4 setFont:v5];

  return v4;
}

+ (id)labelWithThinWeightFontSize:(double)a3
{
  id v4 = objc_alloc_init((Class)a1);
  v5 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_thinWeightFontWithSize:", a3);
  [v4 setFont:v5];

  return v4;
}

+ (id)labelWithThinWeightRegularFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_thinWeightBodySizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithLightWeightRegularFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_lightWeightBodySizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithMediumWeightRegularFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_mediumWeightBodySizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithThinWeightSubtextFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_thinWeightBodySubtextSizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithLightWeightSubtextFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_lightWeightBodySubtextSizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithMediumWeightSubtextFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_mediumWeightBodySubtextSizeFont");
  [v2 setFont:v3];

  return v2;
}

+ (id)labelWithHeaderFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_headerFont");
  [v2 setFont:v3];

  [v2 setTextAlignment:1];
  return v2;
}

+ (id)labelWithSubtitleFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_subtitleFont");
  [v2 setFont:v3];

  [v2 setTextAlignment:1];
  return v2;
}

- (SiriSharedUIContentLabel)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUIContentLabel;
  v3 = -[SiriSharedUIContentLabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x263F825C8] labelColor];
    [(SiriSharedUIContentLabel *)v3 setTextColor:v4];

    v5 = [MEMORY[0x263F825C8] clearColor];
    [(SiriSharedUIContentLabel *)v3 setBackgroundColor:v5];
  }
  return v3;
}

+ (id)labelWithBodyFont
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_dynamicBodyFont");
  [v2 setFont:v3];

  return v2;
}

@end