@interface TPLCDSubImageView
- (TPLCDSubImageView)initWithDefaultSize;
- (UIImage)image;
- (void)drawRect:(CGRect)a3;
- (void)setImage:(id)a3;
@end

@implementation TPLCDSubImageView

- (TPLCDSubImageView)initWithDefaultSize
{
  v2 = -[TPLCDSubImageView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 61.0, 61.0);
  v3 = v2;
  if (v2) {
    [(TPLCDSubImageView *)v2 setOpaque:0];
  }
  return v3;
}

- (void)setImage:(id)a3
{
  v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_image, a3);
    p_image = (UIImage **)[(TPLCDSubImageView *)self setNeedsDisplay];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_image, v5);
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (void *)MEMORY[0x1E4FB14C0];
  CGRect v16 = CGRectInset(a3, 1.5, 1.5);
  objc_msgSend(v8, "bezierPathWithOvalInRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E4FB14C0];
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  CGRect v18 = CGRectInset(v17, 1.0, 1.0);
  v10 = objc_msgSend(v9, "bezierPathWithOvalInRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  [v10 addClip];
  -[UIImage drawInRect:blendMode:alpha:](self->_image, "drawInRect:blendMode:alpha:", 17, x, y, width, height, 1.0);
  CGContextRestoreGState(CurrentContext);
  v12 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.100000001];
  [v12 set];

  [v14 stroke];
  v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.300000012];
  [v13 set];

  [v10 stroke];
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
}

@end