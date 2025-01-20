@interface VUIMonogramViewConfiguration
- (UIColor)focusedBgColor;
- (UIColor)subtitleFocusedColor;
- (UIColor)subtitleUnfocusedColor;
- (UIColor)titleFocusedColor;
- (UIColor)titleUnfocusedColor;
- (UIColor)unfocusedBgColor;
- (VUIMonogramViewConfiguration)initWithShadowImages:(BOOL)a3;
- (VUIMonogramViewConfiguration)initWithStyle:(int64_t)a3;
- (double)focusedShadowAlpha;
- (double)focusedSizeIncrease;
- (double)unfocusedImageAlpha;
- (double)unfocusedShadowAlpha;
- (id)copyWithZone:(_NSZone *)a3;
- (id)focusedShadowImage;
- (id)unfocusedShadowImage;
- (int64_t)style;
- (int64_t)subtitleTextStyle;
- (int64_t)titleTextStyle;
- (void)setFocusedBgColor:(id)a3;
- (void)setFocusedShadowAlpha:(double)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSubtitleFocusedColor:(id)a3;
- (void)setSubtitleTextStyle:(int64_t)a3;
- (void)setSubtitleUnfocusedColor:(id)a3;
- (void)setTitleFocusedColor:(id)a3;
- (void)setTitleTextStyle:(int64_t)a3;
- (void)setTitleUnfocusedColor:(id)a3;
- (void)setUnfocusedBgColor:(id)a3;
- (void)setUnfocusedShadowAlpha:(double)a3;
@end

@implementation VUIMonogramViewConfiguration

- (VUIMonogramViewConfiguration)initWithStyle:(int64_t)a3
{
  v30.receiver = self;
  v30.super_class = (Class)VUIMonogramViewConfiguration;
  v4 = [(VUIMonogramViewConfiguration *)&v30 init];
  v5 = (VUIMonogramViewConfiguration *)v4;
  if (v4)
  {
    *((void *)v4 + 1) = a3;
    *((void *)v4 + 2) = 0x404A000000000000;
    *(_OWORD *)(v4 + 40) = xmmword_1E38FDF30;
    *((void *)v4 + 7) = 13;
    *((void *)v4 + 10) = 14;
    if (a3 == 2)
    {
      uint64_t v17 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.6];
      unfocusedBgColor = v5->_unfocusedBgColor;
      v5->_unfocusedBgColor = (UIColor *)v17;

      uint64_t v19 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
      focusedBgColor = v5->_focusedBgColor;
      v5->_focusedBgColor = (UIColor *)v19;

      uint64_t v21 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.5];
      titleUnfocusedColor = v5->_titleUnfocusedColor;
      v5->_titleUnfocusedColor = (UIColor *)v21;

      uint64_t v23 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
      titleFocusedColor = v5->_titleFocusedColor;
      v5->_titleFocusedColor = (UIColor *)v23;

      v14 = (void *)MEMORY[0x1E4FB1618];
      double v15 = 0.3;
      double v16 = 1.0;
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.6];
      v7 = v5->_unfocusedBgColor;
      v5->_unfocusedBgColor = (UIColor *)v6;

      uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.9];
      v9 = v5->_focusedBgColor;
      v5->_focusedBgColor = (UIColor *)v8;

      uint64_t v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
      v11 = v5->_titleUnfocusedColor;
      v5->_titleUnfocusedColor = (UIColor *)v10;

      uint64_t v12 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
      v13 = v5->_titleFocusedColor;
      v5->_titleFocusedColor = (UIColor *)v12;

      v14 = (void *)MEMORY[0x1E4FB1618];
      double v15 = 0.4;
      double v16 = 0.0;
LABEL_6:
      uint64_t v25 = [v14 colorWithWhite:v16 alpha:v15];
      subtitleUnfocusedColor = v5->_subtitleUnfocusedColor;
      v5->_subtitleUnfocusedColor = (UIColor *)v25;

      uint64_t v27 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
      subtitleFocusedColor = v5->_subtitleFocusedColor;
      v5->_subtitleFocusedColor = (UIColor *)v27;
    }
  }
  return v5;
}

- (VUIMonogramViewConfiguration)initWithShadowImages:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIMonogramViewConfiguration;
  result = [(VUIMonogramViewConfiguration *)&v5 init];
  if (result)
  {
    result->_style = 0;
    result->_focusedSizeIncrease = 52.0;
    if (v3) {
      *(_OWORD *)&result->_unfocusedShadowAlpha = xmmword_1E38FDF30;
    }
  }
  return result;
}

- (id)unfocusedShadowImage
{
  if (unfocusedShadowImage_onceToken != -1) {
    dispatch_once(&unfocusedShadowImage_onceToken, &__block_literal_global_93);
  }
  v2 = (void *)unfocusedShadowImage_unfocusedShadowImage;
  return v2;
}

void __52__VUIMonogramViewConfiguration_unfocusedShadowImage__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 vuiImageNamed:@"MonogramShadowUnfocused" inBundle:v3];
  v2 = (void *)unfocusedShadowImage_unfocusedShadowImage;
  unfocusedShadowImage_unfocusedShadowImage = v1;
}

- (id)focusedShadowImage
{
  if (focusedShadowImage_onceToken != -1) {
    dispatch_once(&focusedShadowImage_onceToken, &__block_literal_global_5_0);
  }
  v2 = (void *)focusedShadowImage_focusedShadowImage;
  return v2;
}

void __50__VUIMonogramViewConfiguration_focusedShadowImage__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 vuiImageNamed:@"MonogramShadowFocused" inBundle:v3];
  v2 = (void *)focusedShadowImage_focusedShadowImage;
  focusedShadowImage_focusedShadowImage = v1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 16) = self->_focusedSizeIncrease;
  *(double *)(v4 + 40) = self->_unfocusedShadowAlpha;
  *(double *)(v4 + 48) = self->_focusedShadowAlpha;
  *(void *)(v4 + 56) = self->_titleTextStyle;
  *(void *)(v4 + 80) = self->_subtitleTextStyle;
  uint64_t v5 = [(UIColor *)self->_unfocusedBgColor copy];
  uint64_t v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  uint64_t v7 = [(UIColor *)self->_focusedBgColor copy];
  uint64_t v8 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v7;

  uint64_t v9 = [(UIColor *)self->_titleUnfocusedColor copy];
  uint64_t v10 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v9;

  uint64_t v11 = [(UIColor *)self->_titleFocusedColor copy];
  uint64_t v12 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v11;

  uint64_t v13 = [(UIColor *)self->_subtitleUnfocusedColor copy];
  v14 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v13;

  uint64_t v15 = [(UIColor *)self->_subtitleFocusedColor copy];
  double v16 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v15;

  return (id)v4;
}

- (double)unfocusedImageAlpha
{
  double result = 1.0;
  if (self->_focusedBgColor)
  {
    if (self->_unfocusedBgColor)
    {
      double v4 = 1.0;
      double v5 = 1.0;
      objc_msgSend(MEMORY[0x1E4FB3C70], "vuiColor:getRed:green:blue:alpha:", 1.0);
      [MEMORY[0x1E4FB3C70] vuiColor:self->_unfocusedBgColor getRed:0 green:0 blue:0 alpha:&v4];
      return v4 / v5;
    }
  }
  return result;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (UIColor)unfocusedBgColor
{
  return self->_unfocusedBgColor;
}

- (void)setUnfocusedBgColor:(id)a3
{
}

- (UIColor)focusedBgColor
{
  return self->_focusedBgColor;
}

- (void)setFocusedBgColor:(id)a3
{
}

- (double)unfocusedShadowAlpha
{
  return self->_unfocusedShadowAlpha;
}

- (void)setUnfocusedShadowAlpha:(double)a3
{
  self->_unfocusedShadowAlpha = a3;
}

- (double)focusedShadowAlpha
{
  return self->_focusedShadowAlpha;
}

- (void)setFocusedShadowAlpha:(double)a3
{
  self->_focusedShadowAlpha = a3;
}

- (int64_t)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setTitleTextStyle:(int64_t)a3
{
  self->_titleTextStyle = a3;
}

- (UIColor)titleUnfocusedColor
{
  return self->_titleUnfocusedColor;
}

- (void)setTitleUnfocusedColor:(id)a3
{
}

- (UIColor)titleFocusedColor
{
  return self->_titleFocusedColor;
}

- (void)setTitleFocusedColor:(id)a3
{
}

- (int64_t)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (void)setSubtitleTextStyle:(int64_t)a3
{
  self->_subtitleTextStyle = a3;
}

- (UIColor)subtitleUnfocusedColor
{
  return self->_subtitleUnfocusedColor;
}

- (void)setSubtitleUnfocusedColor:(id)a3
{
}

- (UIColor)subtitleFocusedColor
{
  return self->_subtitleFocusedColor;
}

- (void)setSubtitleFocusedColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleFocusedColor, 0);
  objc_storeStrong((id *)&self->_subtitleUnfocusedColor, 0);
  objc_storeStrong((id *)&self->_titleFocusedColor, 0);
  objc_storeStrong((id *)&self->_titleUnfocusedColor, 0);
  objc_storeStrong((id *)&self->_focusedBgColor, 0);
  objc_storeStrong((id *)&self->_unfocusedBgColor, 0);
}

@end