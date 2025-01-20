@interface TVMonogramViewConfiguration
- (NSString)subtitleTextStyle;
- (NSString)titleTextStyle;
- (TVMonogramViewConfiguration)initWithShadowImages:(BOOL)a3;
- (TVMonogramViewConfiguration)initWithStyle:(int64_t)a3;
- (UIColor)focusedBgColor;
- (UIColor)subtitleFocusedColor;
- (UIColor)subtitleUnfocusedColor;
- (UIColor)titleFocusedColor;
- (UIColor)titleUnfocusedColor;
- (UIColor)unfocusedBgColor;
- (UIImage)focusedShadowImage;
- (UIImage)unfocusedShadowImage;
- (double)focusedShadowAlpha;
- (double)focusedSizeIncrease;
- (double)unfocusedImageAlpha;
- (double)unfocusedShadowAlpha;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (void)setFocusedBgColor:(id)a3;
- (void)setFocusedShadowAlpha:(double)a3;
- (void)setFocusedShadowImage:(id)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSubtitleFocusedColor:(id)a3;
- (void)setSubtitleTextStyle:(id)a3;
- (void)setSubtitleUnfocusedColor:(id)a3;
- (void)setTitleFocusedColor:(id)a3;
- (void)setTitleTextStyle:(id)a3;
- (void)setTitleUnfocusedColor:(id)a3;
- (void)setUnfocusedBgColor:(id)a3;
- (void)setUnfocusedShadowAlpha:(double)a3;
- (void)setUnfocusedShadowImage:(id)a3;
@end

@implementation TVMonogramViewConfiguration

- (TVMonogramViewConfiguration)initWithStyle:(int64_t)a3
{
  v38.receiver = self;
  v38.super_class = (Class)TVMonogramViewConfiguration;
  v4 = [(TVMonogramViewConfiguration *)&v38 init];
  v5 = (TVMonogramViewConfiguration *)v4;
  if (v4)
  {
    *((void *)v4 + 1) = a3;
    *((void *)v4 + 2) = 0x404A000000000000;
    *(_OWORD *)(v4 + 40) = xmmword_230C37FA0;
    v6 = (void *)MEMORY[0x263F1C6B0];
    v7 = +[TVMLUtilities TVMLKitBundle];
    uint64_t v8 = [v6 imageNamed:@"monogram250x250-shadow-unfocussed" inBundle:v7 compatibleWithTraitCollection:0];
    unfocusedShadowImage = v5->_unfocusedShadowImage;
    v5->_unfocusedShadowImage = (UIImage *)v8;

    v10 = (void *)MEMORY[0x263F1C6B0];
    v11 = +[TVMLUtilities TVMLKitBundle];
    uint64_t v12 = [v10 imageNamed:@"monogram250x250-shadow-focussed" inBundle:v11 compatibleWithTraitCollection:0];
    focusedShadowImage = v5->_focusedShadowImage;
    v5->_focusedShadowImage = (UIImage *)v12;

    objc_storeStrong((id *)&v5->_titleTextStyle, (id)*MEMORY[0x263F1D260]);
    objc_storeStrong((id *)&v5->_subtitleTextStyle, (id)*MEMORY[0x263F1D2B8]);
    if (a3 == 2)
    {
      uint64_t v25 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.6];
      unfocusedBgColor = v5->_unfocusedBgColor;
      v5->_unfocusedBgColor = (UIColor *)v25;

      uint64_t v27 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
      focusedBgColor = v5->_focusedBgColor;
      v5->_focusedBgColor = (UIColor *)v27;

      uint64_t v29 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.5];
      titleUnfocusedColor = v5->_titleUnfocusedColor;
      v5->_titleUnfocusedColor = (UIColor *)v29;

      uint64_t v31 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
      titleFocusedColor = v5->_titleFocusedColor;
      v5->_titleFocusedColor = (UIColor *)v31;

      v22 = (void *)MEMORY[0x263F1C550];
      double v23 = 0.3;
      double v24 = 1.0;
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      uint64_t v14 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.6];
      v15 = v5->_unfocusedBgColor;
      v5->_unfocusedBgColor = (UIColor *)v14;

      uint64_t v16 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.9];
      v17 = v5->_focusedBgColor;
      v5->_focusedBgColor = (UIColor *)v16;

      uint64_t v18 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.6];
      v19 = v5->_titleUnfocusedColor;
      v5->_titleUnfocusedColor = (UIColor *)v18;

      uint64_t v20 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
      v21 = v5->_titleFocusedColor;
      v5->_titleFocusedColor = (UIColor *)v20;

      v22 = (void *)MEMORY[0x263F1C550];
      double v23 = 0.4;
      double v24 = 0.0;
LABEL_6:
      uint64_t v33 = [v22 colorWithWhite:v24 alpha:v23];
      subtitleUnfocusedColor = v5->_subtitleUnfocusedColor;
      v5->_subtitleUnfocusedColor = (UIColor *)v33;

      uint64_t v35 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
      subtitleFocusedColor = v5->_subtitleFocusedColor;
      v5->_subtitleFocusedColor = (UIColor *)v35;
    }
  }
  return v5;
}

- (TVMonogramViewConfiguration)initWithShadowImages:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TVMonogramViewConfiguration;
  v4 = [(TVMonogramViewConfiguration *)&v15 init];
  v5 = (TVMonogramViewConfiguration *)v4;
  if (v4)
  {
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0x404A000000000000;
    if (v3)
    {
      *(_OWORD *)(v4 + 40) = xmmword_230C37FA0;
      v6 = (void *)MEMORY[0x263F1C6B0];
      v7 = +[TVMLUtilities TVMLKitBundle];
      uint64_t v8 = [v6 imageNamed:@"monogram250x250-shadow-unfocussed" inBundle:v7 compatibleWithTraitCollection:0];
      unfocusedShadowImage = v5->_unfocusedShadowImage;
      v5->_unfocusedShadowImage = (UIImage *)v8;

      v10 = (void *)MEMORY[0x263F1C6B0];
      v11 = +[TVMLUtilities TVMLKitBundle];
      uint64_t v12 = [v10 imageNamed:@"monogram250x250-shadow-focussed" inBundle:v11 compatibleWithTraitCollection:0];
      focusedShadowImage = v5->_focusedShadowImage;
      v5->_focusedShadowImage = (UIImage *)v12;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 16) = self->_focusedSizeIncrease;
  *(double *)(v4 + 40) = self->_unfocusedShadowAlpha;
  *(double *)(v4 + 48) = self->_focusedShadowAlpha;
  uint64_t v5 = [(UIImage *)self->_unfocusedShadowImage copy];
  v6 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v5;

  uint64_t v7 = [(UIImage *)self->_focusedShadowImage copy];
  uint64_t v8 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v7;

  uint64_t v9 = [(NSString *)self->_titleTextStyle copy];
  v10 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v9;

  uint64_t v11 = [(NSString *)self->_subtitleTextStyle copy];
  uint64_t v12 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v11;

  uint64_t v13 = [(UIColor *)self->_unfocusedBgColor copy];
  uint64_t v14 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v13;

  uint64_t v15 = [(UIColor *)self->_focusedBgColor copy];
  uint64_t v16 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v15;

  uint64_t v17 = [(UIColor *)self->_titleUnfocusedColor copy];
  uint64_t v18 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v17;

  uint64_t v19 = [(UIColor *)self->_titleFocusedColor copy];
  uint64_t v20 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v19;

  uint64_t v21 = [(UIColor *)self->_subtitleUnfocusedColor copy];
  v22 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v21;

  uint64_t v23 = [(UIColor *)self->_subtitleFocusedColor copy];
  double v24 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = v23;

  return (id)v4;
}

- (double)unfocusedImageAlpha
{
  double result = 1.0;
  if (self->_focusedBgColor)
  {
    unfocusedBgColor = self->_unfocusedBgColor;
    if (unfocusedBgColor)
    {
      double v5 = 1.0;
      double v6 = 1.0;
      -[UIColor getRed:green:blue:alpha:](unfocusedBgColor, "getRed:green:blue:alpha:", 0, 0, 0, &v5, 1.0);
      [(UIColor *)self->_focusedBgColor getRed:0 green:0 blue:0 alpha:&v6];
      return v5 / v6;
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

- (UIImage)unfocusedShadowImage
{
  return self->_unfocusedShadowImage;
}

- (void)setUnfocusedShadowImage:(id)a3
{
}

- (UIImage)focusedShadowImage
{
  return self->_focusedShadowImage;
}

- (void)setFocusedShadowImage:(id)a3
{
}

- (NSString)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setTitleTextStyle:(id)a3
{
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

- (NSString)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (void)setSubtitleTextStyle:(id)a3
{
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
  objc_storeStrong((id *)&self->_subtitleTextStyle, 0);
  objc_storeStrong((id *)&self->_titleFocusedColor, 0);
  objc_storeStrong((id *)&self->_titleUnfocusedColor, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
  objc_storeStrong((id *)&self->_focusedShadowImage, 0);
  objc_storeStrong((id *)&self->_unfocusedShadowImage, 0);
  objc_storeStrong((id *)&self->_focusedBgColor, 0);
  objc_storeStrong((id *)&self->_unfocusedBgColor, 0);
}

@end