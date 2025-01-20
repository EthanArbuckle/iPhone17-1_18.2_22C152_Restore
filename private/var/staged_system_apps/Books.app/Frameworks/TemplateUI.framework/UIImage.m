@interface UIImage
+ (id)tui_imageNamed:(id)a3 inBundle:(id)a4;
+ (id)tui_imageWithCGImage:(CGImage *)a3;
- (BOOL)tui_isDeepColor;
- (BOOL)tui_isMulticolorSymbolWithSymbolRenderingMode:(unint64_t)a3;
- (BOOL)tui_isWideGamut;
- (CGImage)tui_CGImage;
- (id)tui_imageMaskWithColor:(id)a3;
- (id)tui_initWithCGImage:(CGImage *)a3 scale:(double)a4;
@end

@implementation UIImage

+ (id)tui_imageNamed:(id)a3 inBundle:(id)a4
{
  return +[UIImage imageNamed:a3 inBundle:a4 compatibleWithTraitCollection:0];
}

- (id)tui_imageMaskWithColor:(id)a3
{
  id v4 = a3;
  [(UIImage *)self size];
  double v6 = v5;
  double v8 = v7;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_183100;
  v18[3] = &unk_257370;
  double v20 = v5;
  double v21 = v7;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  double v24 = v5;
  double v25 = v7;
  v18[4] = self;
  id v19 = v4;
  id v9 = v4;
  v10 = objc_retainBlock(v18);
  v11 = +[UIGraphicsImageRendererFormat defaultFormat];
  id v12 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v11 format:v6];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1831B8;
  v16[3] = &unk_257398;
  id v17 = v10;
  v13 = v10;
  v14 = [v12 imageWithActions:v16];

  return v14;
}

- (BOOL)tui_isWideGamut
{
  v2 = self;
  if (![(UIImage *)v2 CGImage]) {
    return 0;
  }
  ColorSpace = CGImageGetColorSpace([(UIImage *)v2 CGImage]);
  if (!ColorSpace) {
    return 0;
  }

  return CGColorSpaceIsWideGamutRGB(ColorSpace);
}

- (BOOL)tui_isDeepColor
{
  v2 = self;
  v3 = [(UIImage *)v2 CGImage];
  if (v3) {
    LOBYTE(v3) = CGImageGetBitsPerPixel([(UIImage *)v2 CGImage]) == 64;
  }
  return (char)v3;
}

- (BOOL)tui_isMulticolorSymbolWithSymbolRenderingMode:(unint64_t)a3
{
  if (a3 - 1 < 2) {
    return [(UIImage *)self _isHierarchicalColorSymbolImage];
  }
  if (a3 == 3) {
    return [(UIImage *)self _isMultiColorSymbolImage];
  }
  return 0;
}

+ (id)tui_imageWithCGImage:(CGImage *)a3
{
  id v3 = [objc_alloc((Class)UIImage) initWithCGImage:a3];

  return v3;
}

- (CGImage)tui_CGImage
{
  v2 = self;

  return [(UIImage *)v2 CGImage];
}

- (id)tui_initWithCGImage:(CGImage *)a3 scale:(double)a4
{
  id v4 = [objc_alloc((Class)UIImage) initWithCGImage:a3 scale:0 orientation:a4];

  return v4;
}

@end