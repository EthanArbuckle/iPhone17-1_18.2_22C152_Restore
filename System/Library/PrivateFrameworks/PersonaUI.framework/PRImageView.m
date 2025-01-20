@interface PRImageView
- (BOOL)isCircular;
- (PRImageView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (void)drawRect:(CGRect)a3;
- (void)setCircular:(BOOL)a3;
- (void)setImage:(id)a3;
@end

@implementation PRImageView

- (PRImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PRImageView;
  v3 = -[PRImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_circular = 0;
    [(PRImageView *)v3 setOpaque:0];
  }
  return v4;
}

- (void)setImage:(id)a3
{
  id v5 = a3;
  if ((-[UIImage isEqual:](self->_image, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(PRImageView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  if ([(PRImageView *)self isCircular])
  {
    v4 = (void *)MEMORY[0x263F1C478];
    [(PRImageView *)self bounds];
    id v5 = objc_msgSend(v4, "bezierPathWithOvalInRect:");
    [v5 addClip];
  }
  id v6 = [(PRImageView *)self image];
  [(PRImageView *)self bounds];
  objc_msgSend(v6, "drawInRect:");
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (void)setCircular:(BOOL)a3
{
  self->_circular = a3;
}

- (void).cxx_destruct
{
}

@end