@interface COSTargetOutlineView
- (COSTargetOutlineView)initWithOutlinePath:(id)a3;
- (UIBezierPath)outlinePath;
- (void)drawRect:(CGRect)a3;
- (void)setOutlinePath:(id)a3;
@end

@implementation COSTargetOutlineView

- (COSTargetOutlineView)initWithOutlinePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COSTargetOutlineView;
  v6 = [(COSTargetOutlineView *)&v9 init];
  if (v6)
  {
    v7 = +[UIColor clearColor];
    [(COSTargetOutlineView *)v6 setBackgroundColor:v7];

    objc_storeStrong((id *)&v6->_outlinePath, a3);
  }

  return v6;
}

- (void)drawRect:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSTargetOutlineView;
  -[COSTargetOutlineView drawRect:](&v5, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_outlinePath)
  {
    v4 = +[UIColor systemYellowColor];
    [v4 setStroke];

    [(UIBezierPath *)self->_outlinePath stroke];
  }
}

- (UIBezierPath)outlinePath
{
  return self->_outlinePath;
}

- (void)setOutlinePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end