@interface TUNavigationBarCompressibleTitleView
- (TUNavigationBarCompressible)customTitleView;
- (TUNavigationBarCompressibleTitleView)initWithCustomTitleView:(id)a3;
- (TUNavigationBarCompressibleTitleView)initWithRegularTitleView:(id)a3;
- (UILabel)regularTitleView;
- (UIView)view;
- (double)contentAlpha;
- (double)verticalOffset;
- (void)setContentAlpha:(double)a3;
- (void)setVerticalOffset:(double)a3;
@end

@implementation TUNavigationBarCompressibleTitleView

- (TUNavigationBarCompressibleTitleView)initWithCustomTitleView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUNavigationBarCompressibleTitleView;
  v6 = [(TUNavigationBarCompressibleTitleView *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_customTitleView, a3);
    regularTitleView = v7->_regularTitleView;
    v7->_regularTitleView = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularTitleView, 0);
  objc_storeStrong((id *)&self->_customTitleView, 0);
}

- (TUNavigationBarCompressibleTitleView)initWithRegularTitleView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUNavigationBarCompressibleTitleView;
  v6 = [(TUNavigationBarCompressibleTitleView *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_regularTitleView, a3);
    customTitleView = v7->_customTitleView;
    v7->_customTitleView = 0;
  }
  return v7;
}

- (UIView)view
{
  v3 = [(TUNavigationBarCompressibleTitleView *)self customTitleView];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(TUNavigationBarCompressibleTitleView *)self regularTitleView];
  }
  v6 = v5;

  return (UIView *)v6;
}

- (double)contentAlpha
{
  v3 = [(TUNavigationBarCompressibleTitleView *)self customTitleView];

  if (v3)
  {
    v4 = [(TUNavigationBarCompressibleTitleView *)self customTitleView];
    [v4 contentAlpha];
  }
  else
  {
    v4 = [(TUNavigationBarCompressibleTitleView *)self regularTitleView];
    [v4 alpha];
  }
  double v6 = v5;

  return v6;
}

- (void)setContentAlpha:(double)a3
{
  double v5 = [(TUNavigationBarCompressibleTitleView *)self customTitleView];

  if (v5)
  {
    double v6 = [(TUNavigationBarCompressibleTitleView *)self customTitleView];
    [v6 setContentAlpha:a3];
  }
  v7 = [(TUNavigationBarCompressibleTitleView *)self regularTitleView];

  if (v7)
  {
    id v8 = [(TUNavigationBarCompressibleTitleView *)self regularTitleView];
    [v8 setAlpha:a3];
  }
}

- (double)verticalOffset
{
  v2 = [(TUNavigationBarCompressibleTitleView *)self view];
  v3 = v2;
  if (v2)
  {
    [v2 transform];
    double v4 = v6;
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (void)setVerticalOffset:(double)a3
{
  double v4 = [(TUNavigationBarCompressibleTitleView *)self view];
  CATransform3DMakeTranslation(&v5, 0.0, a3, 0.0);
  [v4 setTransform3D:&v5];
}

- (TUNavigationBarCompressible)customTitleView
{
  return self->_customTitleView;
}

- (UILabel)regularTitleView
{
  return self->_regularTitleView;
}

@end