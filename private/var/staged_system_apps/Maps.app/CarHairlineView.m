@interface CarHairlineView
+ (BOOL)requiresConstraintBasedLayout;
+ (id)hairlineViewAlongAxis:(int64_t)a3;
+ (id)hairlineViewsInView:(id)a3;
+ (void)removeHairlineViewsFromView:(id)a3;
- (CGSize)intrinsicContentSize;
- (CarHairlineView)initWithAxis:(int64_t)a3;
- (void)didMoveToWindow;
@end

@implementation CarHairlineView

+ (id)hairlineViewAlongAxis:(int64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithAxis:a3];

  return v3;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)hairlineViewsInView:(id)a3
{
  v4 = [a3 subviews];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005F80B0;
  v8[3] = &unk_1012F1EF0;
  v8[4] = a1;
  v5 = +[NSPredicate predicateWithBlock:v8];
  v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

+ (void)removeHairlineViewsFromView:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [a3 subviews];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 removeFromSuperview];
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (CarHairlineView)initWithAxis:(int64_t)a3
{
  id v4 = -[CarHairlineView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v5 = v4;
  if (v4)
  {
    v4->_int64_t axis = a3;
    [(CarHairlineView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v6 = +[UIColor colorWithWhite:0.5 alpha:0.5];
    [(CarHairlineView *)v5 setBackgroundColor:v6];

    int64_t axis = v5->_axis;
    if (axis)
    {
      if (axis != 1)
      {
LABEL_7:
        [(CarHairlineView *)v5 addConstraint:v5->_constraint];
        return v5;
      }
      v8 = [(CarHairlineView *)v5 widthAnchor];
    }
    else
    {
      v8 = [(CarHairlineView *)v5 heightAnchor];
    }
    long long v9 = v8;
    uint64_t v10 = [v8 constraintEqualToConstant:1.0];
    constraint = v5->_constraint;
    v5->_constraint = (NSLayoutConstraint *)v10;

    goto LABEL_7;
  }
  return v5;
}

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)CarHairlineView;
  [(CarHairlineView *)&v8 didMoveToWindow];
  id v3 = [(CarHairlineView *)self window];

  if (v3)
  {
    id v4 = [(CarHairlineView *)self traitCollection];
    [v4 displayScale];
    if (v5 <= 0.0)
    {
      [(NSLayoutConstraint *)self->_constraint setConstant:1.0];
    }
    else
    {
      uint64_t v6 = [(CarHairlineView *)self traitCollection];
      [v6 displayScale];
      [(NSLayoutConstraint *)self->_constraint setConstant:1.0 / v7];
    }
  }
}

- (CGSize)intrinsicContentSize
{
  CGFloat v2 = UIViewNoIntrinsicMetric;
  int64_t axis = self->_axis;
  if (axis)
  {
    if (axis == 1)
    {
      [(NSLayoutConstraint *)self->_constraint constant];
      double v4 = UIViewNoIntrinsicMetric;
      CGFloat v2 = v5;
    }
    else
    {
      double v4 = UIViewNoIntrinsicMetric;
    }
  }
  else
  {
    [(NSLayoutConstraint *)self->_constraint constant];
    double v4 = v6;
  }
  double v7 = v2;
  result.height = v4;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
}

@end