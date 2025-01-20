@interface SKUIVideoImageDataConsumer
- (CGSize)landscapeSize;
- (CGSize)portraitSize;
- (SKUIColorScheme)colorScheme;
- (UIColor)backgroundColor;
- (id)imageForColor:(id)a3 orientation:(unint64_t)a4;
- (id)imageForImage:(id)a3;
- (unint64_t)allowedOrientations;
- (void)setAllowedOrientations:(unint64_t)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setLandscapeSize:(CGSize)a3;
- (void)setPortraitSize:(CGSize)a3;
@end

@implementation SKUIVideoImageDataConsumer

- (id)imageForColor:(id)a3 orientation:(unint64_t)a4
{
  id v6 = a3;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    if (v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  -[SKUIVideoImageDataConsumer imageForColor:orientation:]();
  if (!v6)
  {
LABEL_5:
    colorScheme = self->_colorScheme;
    id v22 = 0;
    SKUIIconColorsForColorScheme(colorScheme, &v22, 0, 0);
    id v6 = v22;
  }
LABEL_6:
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v10 = &OBJC_IVAR___SKUIVideoImageDataConsumer__portraitSize;
  if (a4 == 2) {
    v10 = &OBJC_IVAR___SKUIVideoImageDataConsumer__landscapeSize;
  }
  v11 = (double *)((char *)self + *v10);
  double v13 = *v11;
  double v12 = v11[1];
  BOOL v14 = self->_backgroundColor != 0;
  v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 scale];
  CGFloat v17 = v16;
  v24.width = v13;
  v24.height = v12;
  UIGraphicsBeginImageContextWithOptions(v24, v14, v17);

  [v6 set];
  v25.origin.x = v8;
  v25.origin.y = v9;
  v25.size.width = v13;
  v25.size.height = v12;
  UIRectFill(v25);
  v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  [v18 set];

  v19 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v8, v9, v13, v12);
  [v19 stroke];
  v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v20;
}

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIVideoImageDataConsumer imageForImage:]();
  }
  [v4 size];
  BOOL v7 = v5 > v6;
  uint64_t v8 = 2;
  if (v5 <= v6) {
    uint64_t v8 = 1;
  }
  if ((v8 & self->_allowedOrientations) == 0)
  {
    id v9 = objc_alloc(MEMORY[0x1E4FB1818]);
    id v10 = v4;
    uint64_t v11 = [v10 CGImage];
    [v10 scale];
    id v4 = (id)objc_msgSend(v9, "initWithCGImage:scale:orientation:", v11, 2);

    [v4 size];
    BOOL v7 = self->_allowedOrientations == 2;
  }
  if (v7) {
    double v12 = &OBJC_IVAR___SKUIVideoImageDataConsumer__landscapeSize;
  }
  else {
    double v12 = &OBJC_IVAR___SKUIVideoImageDataConsumer__portraitSize;
  }
  double v13 = *(double *)((char *)&self->super.super.super.isa + *v12);
  double v15 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  float v16 = v6 * (v13 / v5);
  double v17 = ceilf(v16);
  BOOL v18 = self->_backgroundColor != 0;
  [v4 scale];
  CGFloat v20 = v19;
  v27.width = v13;
  v27.height = v17;
  UIGraphicsBeginImageContextWithOptions(v27, v18, v20);
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    [(UIColor *)backgroundColor set];
    v28.origin.x = v15;
    v28.origin.y = v14;
    v28.size.width = v13;
    v28.size.height = v17;
    UIRectFill(v28);
  }
  objc_msgSend(v4, "drawInRect:", v15, v14, v13, v17);
  id v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  [v22 set];

  v23 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v15, v14, v13, v17);
  [v23 stroke];
  CGSize v24 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v24;
}

- (unint64_t)allowedOrientations
{
  return self->_allowedOrientations;
}

- (void)setAllowedOrientations:(unint64_t)a3
{
  self->_allowedOrientations = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
}

- (CGSize)landscapeSize
{
  double width = self->_landscapeSize.width;
  double height = self->_landscapeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLandscapeSize:(CGSize)a3
{
  self->_landscapeSize = a3;
}

- (CGSize)portraitSize
{
  double width = self->_portraitSize.width;
  double height = self->_portraitSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPortraitSize:(CGSize)a3
{
  self->_portraitSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)imageForColor:orientation:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIVideoImageDataConsumer imageForColor:orientation:]";
}

- (void)imageForImage:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIVideoImageDataConsumer imageForImage:]";
}

@end