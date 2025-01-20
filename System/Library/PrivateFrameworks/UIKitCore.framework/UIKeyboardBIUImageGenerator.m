@interface UIKeyboardBIUImageGenerator
- (UIColor)normalColor;
- (UIColor)tintColor;
- (UIKeyboardBIUImageGenerator)init;
- (id)BIUImageForBold:(BOOL)a3 italic:(BOOL)a4 underline:(BOOL)a5;
- (void)_accessibilitySettingsChanged:(id)a3;
- (void)_drawBIUAtSize:(CGSize)a3 bold:(BOOL)a4 italic:(BOOL)a5 underline:(BOOL)a6;
- (void)_invalidateCache;
- (void)setNormalColor:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation UIKeyboardBIUImageGenerator

- (UIKeyboardBIUImageGenerator)init
{
  v17.receiver = self;
  v17.super_class = (Class)UIKeyboardBIUImageGenerator;
  v2 = [(UIKeyboardBIUImageGenerator *)&v17 init];
  if (v2)
  {
    uint64_t v3 = +[UIColor systemBlueColor];
    tintColor = v2->_tintColor;
    v2->_tintColor = (UIColor *)v3;

    uint64_t v5 = +[UIColor blackColor];
    normalColor = v2->_normalColor;
    v2->_normalColor = (UIColor *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    imageCache = v2->_imageCache;
    v2->_imageCache = (NSMutableDictionary *)v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__accessibilitySettingsChanged_ name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

    v2->_useButtonShapes = _AXSButtonShapesEnabled() != 0;
    uint64_t v10 = +[UIImage kitImageNamed:@"UIButtonBarKeyboardBIUBold"];
    biuBoldImage = v2->_biuBoldImage;
    v2->_biuBoldImage = (UIImage *)v10;

    uint64_t v12 = +[UIImage kitImageNamed:@"UIButtonBarKeyboardBIUItalic"];
    biuItalicImage = v2->_biuItalicImage;
    v2->_biuItalicImage = (UIImage *)v12;

    uint64_t v14 = +[UIImage kitImageNamed:@"UIButtonBarKeyboardBIUUnderline"];
    biuUnderlineImage = v2->_biuUnderlineImage;
    v2->_biuUnderlineImage = (UIImage *)v14;
  }
  return v2;
}

- (void)_invalidateCache
{
}

- (void)setTintColor:(id)a3
{
  id v5 = a3;
  if (!-[UIColor isEqual:](self->_tintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    [(UIKeyboardBIUImageGenerator *)self _invalidateCache];
  }
}

- (void)setNormalColor:(id)a3
{
  id v5 = a3;
  if (!-[UIColor isEqual:](self->_normalColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_normalColor, a3);
    [(UIKeyboardBIUImageGenerator *)self _invalidateCache];
  }
}

- (void)_accessibilitySettingsChanged:(id)a3
{
  BOOL v4 = _AXSButtonShapesEnabled() != 0;
  if (self->_useButtonShapes != v4)
  {
    self->_useButtonShapes = v4;
    [(UIKeyboardBIUImageGenerator *)self _invalidateCache];
  }
}

- (void)_drawBIUAtSize:(CGSize)a3 bold:(BOOL)a4 italic:(BOOL)a5 underline:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  double height = a3.height;
  CGFloat width = a3.width;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
  {
    v13 = 0;
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    if (!v8) {
      goto LABEL_7;
    }
  }
  -[UIImage drawAtPoint:](self->_biuBoldImage, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  if (self->_useButtonShapes)
  {
    v15.origin.y = height + -3.0;
    v15.origin.x = 3.0;
    v15.size.CGFloat width = 3.0;
    v15.size.double height = 3.0;
    CGContextFillEllipseInRect(v13, v15);
  }
LABEL_7:
  if (v7)
  {
    -[UIImage drawAtPoint:](self->_biuItalicImage, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    if (self->_useButtonShapes)
    {
      v16.origin.y = height + -3.0;
      v16.origin.x = 14.0;
      v16.size.CGFloat width = 3.0;
      v16.size.double height = 3.0;
      CGContextFillEllipseInRect(v13, v16);
    }
  }
  if (v6)
  {
    -[UIImage drawAtPoint:](self->_biuUnderlineImage, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    if (self->_useButtonShapes)
    {
      v17.origin.y = height + -3.0;
      v17.origin.x = 25.0;
      v17.size.CGFloat width = 3.0;
      v17.size.double height = 3.0;
      CGContextFillEllipseInRect(v13, v17);
    }
  }
  [(UIColor *)self->_tintColor setFill];
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.CGFloat width = width;
  v18.size.double height = height;
  UIRectFillUsingBlendMode(v18, kCGBlendModeSourceIn);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.CGFloat width = width;
  v19.size.double height = height;
  CGContextBeginTransparencyLayerWithRect(v13, v19, 0);
  if (v8)
  {
    if (v7) {
      goto LABEL_15;
    }
  }
  else
  {
    -[UIImage drawAtPoint:](self->_biuBoldImage, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    if (v7)
    {
LABEL_15:
      if (v6) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  -[UIImage drawAtPoint:](self->_biuItalicImage, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  if (!v6) {
LABEL_16:
  }
    -[UIImage drawAtPoint:](self->_biuUnderlineImage, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
LABEL_17:
  [(UIColor *)self->_normalColor setFill];
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.CGFloat width = width;
  v20.size.double height = height;
  UIRectFillUsingBlendMode(v20, kCGBlendModeSourceIn);
  CGContextEndTransparencyLayer(v13);
}

- (id)BIUImageForBold:(BOOL)a3 italic:(BOOL)a4 underline:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v9 = 2;
  if (!a4) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = 4;
  if (!a5) {
    uint64_t v10 = 0;
  }
  v11 = [NSNumber numberWithInteger:v9 | a3 | v10 | 8];
  uint64_t v12 = [(NSMutableDictionary *)self->_imageCache objectForKeyedSubscript:v11];
  if (!v12)
  {
    [(UIImage *)self->_biuBoldImage size];
    CGFloat v15 = v14;
    if (self->_useButtonShapes) {
      double v16 = v13 + 6.0;
    }
    else {
      double v16 = v13;
    }
    [(UIImage *)self->_biuBoldImage scale];
    _UIGraphicsBeginImageContextWithOptions(0, 0, v15, v16, v17);
    -[UIKeyboardBIUImageGenerator _drawBIUAtSize:bold:italic:underline:](self, "_drawBIUAtSize:bold:italic:underline:", v7, v6, v5, v15, v16);
    CGRect v18 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
    if (self->_useButtonShapes) {
      double v19 = -8.0;
    }
    else {
      double v19 = -2.0;
    }
    CGRect v20 = objc_msgSend(v18, "imageWithAlignmentRectInsets:", 0.0, 0.0, v19, 0.0);

    uint64_t v12 = [v20 imageWithRenderingMode:1];

    [(NSMutableDictionary *)self->_imageCache setObject:v12 forKeyedSubscript:v11];
  }
  id v21 = v12;

  return v21;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIColor)normalColor
{
  return self->_normalColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_biuUnderlineImage, 0);
  objc_storeStrong((id *)&self->_biuItalicImage, 0);
  objc_storeStrong((id *)&self->_biuBoldImage, 0);
}

@end