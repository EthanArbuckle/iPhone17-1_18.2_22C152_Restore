@interface UIShadowView
+ (id)bottomShadowImage;
+ (id)topShadowImage;
- (UIShadowView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setShadowImage:(id)a3 forEdge:(unint64_t)a4 inside:(BOOL)a5;
@end

@implementation UIShadowView

- (UIShadowView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIShadowView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setOpaque:0];
    [(UIView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)setShadowImage:(id)a3 forEdge:(unint64_t)a4 inside:(BOOL)a5
{
  BOOL v5 = a5;
  v22 = (UIImage *)a3;
  if (self->_image != v22)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(UIView *)self frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [(UIImage *)v22 size];
    float v18 = v17;
    double v19 = v18;
    double v20 = v12 - v18;
    if (a4 != 1) {
      double v20 = v12 + v16;
    }
    double v21 = v12 + v16 - v19;
    if (a4 == 1) {
      double v21 = v12;
    }
    if (!v5) {
      double v21 = v20;
    }
    -[UIView setFrame:](self, "setFrame:", v10, v21, v14);
  }
}

- (void)drawRect:(CGRect)a3
{
  image = self->_image;
  [(UIView *)self bounds];
  -[UIImage draw1PartImageInRect:](image, "draw1PartImageInRect:");
}

+ (id)topShadowImage
{
  return _UIImageWithName(@"UITableCellShadowTop.png");
}

+ (id)bottomShadowImage
{
  return _UIImageWithName(@"UITableCellShadowBottom.png");
}

- (void).cxx_destruct
{
}

@end