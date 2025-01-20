@interface RCTextLayer
- (CGRect)textRectWithAlignment:(int64_t)a3 inLayoutBounds:(CGRect)a4;
- (CGSize)_displaySize;
- (NSString)text;
- (RCTextLayer)init;
- (UIColor)textColor;
- (UIFont)font;
- (id)_attributes;
- (int64_t)preferredAlignment;
- (int64_t)textAlignment;
- (void)drawInContext:(CGContext *)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPreferredAlignment:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)sizeToFit;
@end

@implementation RCTextLayer

- (RCTextLayer)init
{
  v4.receiver = self;
  v4.super_class = (Class)RCTextLayer;
  v2 = [(RCTextLayer *)&v4 init];
  if (v2) {
    [(RCTextLayer *)v2 setContentsScale:UIMainScreenScale()];
  }
  return v2;
}

- (id)_attributes
{
  v3 = +[NSMutableDictionary dictionary];
  objc_super v4 = [(RCTextLayer *)self textColor];
  [v3 setObject:v4 forKeyedSubscript:NSForegroundColorAttributeName];

  v5 = [(RCTextLayer *)self font];
  [v3 setObject:v5 forKeyedSubscript:NSFontAttributeName];

  return v3;
}

- (void)sizeToFit
{
  [(RCTextLayer *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(RCTextLayer *)self _displaySize];

  -[RCTextLayer setFrame:](self, "setFrame:", v4, v6, v7, v8);
}

- (CGSize)_displaySize
{
  double v3 = [(RCTextLayer *)self _attributes];
  double v4 = [(RCTextLayer *)self text];
  unint64_t v5 = (unint64_t)[v4 hash];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v6 = [v3 allValues];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v5 ^= (unint64_t)[*(id *)(*((void *)&v18 + 1) + 8 * (void)v10) hash];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  if (v5 != self->_cachedSizeHash)
  {
    v11 = [(RCTextLayer *)self text];
    [v11 sizeWithAttributes:v3];
    self->_cachedSize.CGFloat width = v12;
    self->_cachedSize.CGFloat height = v13;

    self->_cachedSizeHash = v5;
  }
  CGFloat width = self->_cachedSize.width;
  CGFloat height = self->_cachedSize.height;

  double v16 = width;
  double v17 = height;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (CGRect)textRectWithAlignment:(int64_t)a3 inLayoutBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(RCTextLayer *)self _displaySize];
  double v10 = v9;
  if (a3 == 1)
  {
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double x = x + (CGRectGetWidth(v18) - v10) * 0.5;
  }
  else if (a3 == 2)
  {
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    double x = CGRectGetMaxX(v17) - v10;
  }
  float v11 = x;
  double v12 = rintf(v11);
  float v13 = y;
  double v14 = rintf(v13);
  double v15 = v10;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v12;
  return result;
}

- (void)setText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, a3);
    [(RCTextLayer *)self setNeedsDisplay];
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCTextLayer;
  -[RCTextLayer setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(RCTextLayer *)self setNeedsDisplay];
}

- (void)drawInContext:(CGContext *)a3
{
  UIGraphicsPushContext(a3);
  text = self->_text;
  int64_t v5 = [(RCTextLayer *)self textAlignment];
  [(RCTextLayer *)self bounds];
  -[RCTextLayer textRectWithAlignment:inLayoutBounds:](self, "textRectWithAlignment:inLayoutBounds:", v5);
  double v7 = v6;
  double v9 = v8;
  double v10 = [(RCTextLayer *)self _attributes];
  -[NSString drawAtPoint:withAttributes:](text, "drawAtPoint:withAttributes:", v10, v7, v9);

  UIGraphicsPopContext();
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (int64_t)preferredAlignment
{
  return self->_preferredAlignment;
}

- (void)setPreferredAlignment:(int64_t)a3
{
  self->_preferredAlignment = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end