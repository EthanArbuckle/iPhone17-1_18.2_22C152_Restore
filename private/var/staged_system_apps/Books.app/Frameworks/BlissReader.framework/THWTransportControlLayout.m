@interface THWTransportControlLayout
- (Class)repClassOverride;
- (THWButtonControlLayout)nextButtonLayout;
- (THWButtonControlLayout)previousButtonLayout;
- (THWButtonControlLayout)restartButtonLayout;
- (THWLabelControlLayout)labelLayout;
- (THWTransportControlLayout)init;
- (id)additionalLayouts;
- (id)dependentLayouts;
- (id)layoutGeometryForLayout:(id)a3;
- (void)dealloc;
- (void)setLabelLayout:(id)a3;
- (void)setNextButtonLayout:(id)a3;
- (void)setPreviousButtonLayout:(id)a3;
- (void)setRestartButtonLayout:(id)a3;
@end

@implementation THWTransportControlLayout

- (THWTransportControlLayout)init
{
  v4.receiver = self;
  v4.super_class = (Class)THWTransportControlLayout;
  v2 = [(THWTransportControlLayout *)&v4 initWithInfo:0];
  if (v2)
  {
    v2->_restartButtonLayout = [(THWControlLayout *)[THWButtonControlLayout alloc] initWithTag:0];
    v2->_previousButtonLayout = [(THWControlLayout *)[THWButtonControlLayout alloc] initWithTag:1];
    v2->_nextButtonLayout = [(THWControlLayout *)[THWButtonControlLayout alloc] initWithTag:2];
    v2->_labelLayout = [(THWControlLayout *)[THWLabelControlLayout alloc] initWithTag:3];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)dependentLayouts
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_restartButtonLayout, self->_previousButtonLayout, self->_nextButtonLayout, self->_labelLayout, 0);
}

- (id)additionalLayouts
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_restartButtonLayout, self->_previousButtonLayout, self->_nextButtonLayout, self->_labelLayout, 0);
}

- (id)layoutGeometryForLayout:(id)a3
{
  [(THWTransportControlLayout *)self frame];
  TSDRectWithSize();
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  double height = v24.size.height;
  double v9 = (CGRectGetHeight(v24) - v24.size.height) * 0.5;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.double height = height;
  double v10 = CGRectGetHeight(v25);
  if (self->_restartButtonLayout == a3)
  {
    id v12 = objc_alloc((Class)TSDLayoutGeometry);
    double v13 = 35.0;
    double v14 = 0.0;
LABEL_10:
    double v18 = v9;
    double v19 = height;
    goto LABEL_11;
  }
  if (self->_previousButtonLayout == a3)
  {
    id v15 = objc_alloc((Class)TSDLayoutGeometry);
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.double height = height;
    double MidX = CGRectGetMidX(v26) + -40.0;
    double v17 = -35.0;
LABEL_9:
    double v14 = MidX + v17;
    double v13 = 35.0;
    id v12 = v15;
    goto LABEL_10;
  }
  if (self->_nextButtonLayout == a3)
  {
    id v15 = objc_alloc((Class)TSDLayoutGeometry);
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.double height = height;
    double MidX = CGRectGetMidX(v27);
    double v17 = 40.0;
    goto LABEL_9;
  }
  if (self->_labelLayout != a3) {
    return 0;
  }
  CGFloat v21 = (v10 - height) * 0.5;
  id v22 = objc_alloc((Class)TSDLayoutGeometry);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.double height = height;
  v29.origin.CGFloat x = CGRectGetMidX(v28) + -40.0;
  v29.size.CGFloat width = 80.0;
  v29.origin.CGFloat y = v21;
  v29.size.double height = height;
  *(CGRect *)&double v14 = CGRectIntegral(v29);
  id v12 = v22;
LABEL_11:
  id v20 = [v12 initWithFrame:v14, v18, v13, v19];

  return v20;
}

- (THWButtonControlLayout)restartButtonLayout
{
  return self->_restartButtonLayout;
}

- (void)setRestartButtonLayout:(id)a3
{
}

- (THWButtonControlLayout)previousButtonLayout
{
  return self->_previousButtonLayout;
}

- (void)setPreviousButtonLayout:(id)a3
{
}

- (THWButtonControlLayout)nextButtonLayout
{
  return self->_nextButtonLayout;
}

- (void)setNextButtonLayout:(id)a3
{
}

- (THWLabelControlLayout)labelLayout
{
  return self->_labelLayout;
}

- (void)setLabelLayout:(id)a3
{
}

@end