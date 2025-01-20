@interface SUUIVideoImageDataConsumer
- (CGSize)landscapeSize;
- (CGSize)portraitSize;
- (SUUIColorScheme)colorScheme;
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

@implementation SUUIVideoImageDataConsumer

- (id)imageForColor:(id)a3 orientation:(unint64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    colorScheme = self->_colorScheme;
    id v22 = 0;
    SUUIIconColorsForColorScheme(colorScheme, &v22, 0, 0);
    id v6 = v22;
  }
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  v10 = &OBJC_IVAR___SUUIVideoImageDataConsumer__portraitSize;
  if (a4 == 2) {
    v10 = &OBJC_IVAR___SUUIVideoImageDataConsumer__landscapeSize;
  }
  v11 = (double *)((char *)self + *v10);
  double v13 = *v11;
  double v12 = v11[1];
  BOOL v14 = self->_backgroundColor != 0;
  v15 = [MEMORY[0x263F82B60] mainScreen];
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
  v18 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  [v18 set];

  v19 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", v8, v9, v13, v12);
  [v19 stroke];
  v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v20;
}

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  [v4 size];
  BOOL v7 = v5 > v6;
  uint64_t v8 = 2;
  if (v5 <= v6) {
    uint64_t v8 = 1;
  }
  if ((v8 & self->_allowedOrientations) == 0)
  {
    id v9 = objc_alloc(MEMORY[0x263F827E8]);
    id v10 = v4;
    uint64_t v11 = [v10 CGImage];
    [v10 scale];
    id v4 = (id)objc_msgSend(v9, "initWithCGImage:scale:orientation:", v11, 2);

    [v4 size];
    BOOL v7 = self->_allowedOrientations == 2;
  }
  if (v7) {
    double v12 = &OBJC_IVAR___SUUIVideoImageDataConsumer__landscapeSize;
  }
  else {
    double v12 = &OBJC_IVAR___SUUIVideoImageDataConsumer__portraitSize;
  }
  double v13 = *(double *)((char *)&self->super.super.super.isa + *v12);
  double v15 = *MEMORY[0x263F001A8];
  double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
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
  id v22 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  [v22 set];

  v23 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", v15, v14, v13, v17);
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

- (SUUIColorScheme)colorScheme
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

@end