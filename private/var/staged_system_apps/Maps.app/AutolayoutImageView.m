@interface AutolayoutImageView
- (AutolayoutImageView)initWithCoder:(id)a3;
- (AutolayoutImageView)initWithFrame:(CGRect)a3;
- (AutolayoutImageView)initWithImage:(id)a3;
- (float)aspectRatioConstraintPriority;
- (void)setAspectRatioConstraintPriority:(float)a3;
- (void)setImage:(id)a3;
@end

@implementation AutolayoutImageView

- (AutolayoutImageView)initWithImage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AutolayoutImageView;
  result = [(AutolayoutImageView *)&v4 initWithImage:a3];
  if (result) {
    result->_aspectRatioConstraintPriority = 1000.0;
  }
  return result;
}

- (AutolayoutImageView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AutolayoutImageView;
  result = -[AutolayoutImageView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_aspectRatioConstraintPriority = 1000.0;
  }
  return result;
}

- (AutolayoutImageView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AutolayoutImageView;
  result = [(AutolayoutImageView *)&v4 initWithCoder:a3];
  if (result) {
    result->_aspectRatioConstraintPriority = 1000.0;
  }
  return result;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  if (self->_aspectConstraint)
  {
    -[AutolayoutImageView removeConstraint:](self, "removeConstraint:");
    aspectConstraint = self->_aspectConstraint;
    self->_aspectConstraint = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)AutolayoutImageView;
  [(AutolayoutImageView *)&v16 setImage:v4];
  if (v4)
  {
    v6 = [(AutolayoutImageView *)self heightAnchor];
    v7 = [(AutolayoutImageView *)self widthAnchor];
    [v4 size];
    double v9 = v8;
    [v4 size];
    double v11 = v9 / v10;
    [(AutolayoutImageView *)self aspectRatioConstraintPriority];
    LODWORD(v13) = v12;
    v14 = [v6 constraintEqualToAnchor:v7 multiplier:v11 priority:v13];
    v15 = self->_aspectConstraint;
    self->_aspectConstraint = v14;

    [(AutolayoutImageView *)self addConstraint:self->_aspectConstraint];
  }
}

- (void)setAspectRatioConstraintPriority:(float)a3
{
  if (self->_aspectRatioConstraintPriority != a3)
  {
    self->_aspectRatioConstraintPriority = a3;
    id v4 = [(AutolayoutImageView *)self image];
    [(AutolayoutImageView *)self setImage:v4];
  }
}

- (float)aspectRatioConstraintPriority
{
  return self->_aspectRatioConstraintPriority;
}

- (void).cxx_destruct
{
}

@end