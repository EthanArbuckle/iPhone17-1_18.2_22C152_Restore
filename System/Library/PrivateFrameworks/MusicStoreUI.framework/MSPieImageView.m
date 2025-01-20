@interface MSPieImageView
- (UIImage)backgroundImage;
- (UIImage)foregroundImage;
- (double)pieFraction;
- (double)pieRadius;
- (void)_reloadClipPath;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setForegroundImage:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPieFraction:(double)a3;
- (void)setPieRadius:(double)a3;
- (void)sizeToFit;
@end

@implementation MSPieImageView

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MSPieImageView;
  [(MSPieImageView *)&v3 dealloc];
}

- (void)setBackgroundImage:(id)a3
{
  backgroundImage = self->_backgroundImage;
  if (backgroundImage != a3)
  {

    self->_backgroundImage = (UIImage *)a3;
    [(MSPieImageView *)self setNeedsDisplay];
  }
}

- (void)setForegroundImage:(id)a3
{
  foregroundImage = self->_foregroundImage;
  if (foregroundImage != a3)
  {

    self->_foregroundImage = (UIImage *)a3;
    [(MSPieImageView *)self setNeedsDisplay];
  }
}

- (void)setPieFraction:(double)a3
{
  if (self->_pieFraction != a3)
  {
    self->_pieFraction = a3;
    [(MSPieImageView *)self _reloadClipPath];
  }
}

- (void)setPieRadius:(double)a3
{
  if (self->_pieRadius != a3)
  {
    self->_pieRadius = a3;
    [(MSPieImageView *)self _reloadClipPath];
  }
}

- (void)drawRect:(CGRect)a3
{
  [(MSPieImageView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  -[UIImage drawInRect:](self->_backgroundImage, "drawInRect:");
  clipPath = self->_clipPath;
  if (!clipPath)
  {
    double pieFraction = self->_pieFraction;
    if (pieFraction <= 0.00000011920929)
    {
      clipPath = 0;
    }
    else
    {
      double v14 = ceil(v9 * 0.5);
      double v15 = ceil(v11 * 0.5);
      double v16 = pieFraction * 360.0 + -90.0;
      v17 = (UIBezierPath *)(id)[MEMORY[0x263F1C478] bezierPath];
      self->_clipPath = v17;
      -[UIBezierPath moveToPoint:](v17, "moveToPoint:", v14, v15);
      -[UIBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self->_clipPath, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v14, v15, self->_pieRadius, -1.57079633, v16 * 0.0174532925);
      clipPath = self->_clipPath;
    }
  }
  [(UIBezierPath *)clipPath clip];
  foregroundImage = self->_foregroundImage;
  -[UIImage drawInRect:](foregroundImage, "drawInRect:", v5, v7, v9, v11);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MSPieImageView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MSPieImageView;
  -[MSPieImageView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    if (self->_clipPath) {
      [(MSPieImageView *)self _reloadClipPath];
    }
  }
}

- (void)sizeToFit
{
  [(MSPieImageView *)self frame];
  double v6 = v5;
  double v8 = v7;
  backgroundImage = self->_backgroundImage;
  if (backgroundImage || (backgroundImage = self->_foregroundImage) != 0)
  {
    [(UIImage *)backgroundImage size];
    double v3 = v10;
    double v4 = v11;
  }
  -[MSPieImageView setFrame:](self, "setFrame:", v6, v8, v3, v4);
}

- (void)_reloadClipPath
{
  self->_clipPath = 0;
  [(MSPieImageView *)self setNeedsDisplay];
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (UIImage)foregroundImage
{
  return self->_foregroundImage;
}

- (double)pieFraction
{
  return self->_pieFraction;
}

- (double)pieRadius
{
  return self->_pieRadius;
}

@end