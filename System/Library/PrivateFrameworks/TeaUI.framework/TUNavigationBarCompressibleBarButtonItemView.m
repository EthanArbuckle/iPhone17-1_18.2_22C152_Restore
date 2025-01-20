@interface TUNavigationBarCompressibleBarButtonItemView
- (TUNavigationBarButtonItemCompressible)customItemView;
- (TUNavigationBarCompressibleBarButtonItemView)initWithCustomItemView:(id)a3;
- (TUNavigationBarCompressibleBarButtonItemView)initWithRegularItemView:(id)a3;
- (UIView)regularItemView;
- (UIView)view;
- (double)contentAlpha;
- (double)verticalOffset;
- (void)setContentAlpha:(double)a3;
- (void)setVerticalOffset:(double)a3;
@end

@implementation TUNavigationBarCompressibleBarButtonItemView

- (TUNavigationBarCompressibleBarButtonItemView)initWithCustomItemView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUNavigationBarCompressibleBarButtonItemView;
  v6 = [(TUNavigationBarCompressibleBarButtonItemView *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_customItemView, a3);
    regularItemView = v7->_regularItemView;
    v7->_regularItemView = 0;
  }
  return v7;
}

- (TUNavigationBarCompressibleBarButtonItemView)initWithRegularItemView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUNavigationBarCompressibleBarButtonItemView;
  v6 = [(TUNavigationBarCompressibleBarButtonItemView *)&v10 init];
  v7 = v6;
  if (v6)
  {
    customItemView = v6->_customItemView;
    v6->_customItemView = 0;

    objc_storeStrong((id *)&v7->_regularItemView, a3);
  }

  return v7;
}

- (UIView)view
{
  v3 = [(TUNavigationBarCompressibleBarButtonItemView *)self customItemView];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(TUNavigationBarCompressibleBarButtonItemView *)self regularItemView];
  }
  v6 = v5;

  return (UIView *)v6;
}

- (double)contentAlpha
{
  v3 = [(TUNavigationBarCompressibleBarButtonItemView *)self customItemView];

  if (v3)
  {
    v4 = [(TUNavigationBarCompressibleBarButtonItemView *)self customItemView];
    [v4 contentAlpha];
  }
  else
  {
    v4 = [(TUNavigationBarCompressibleBarButtonItemView *)self regularItemView];
    [v4 alpha];
  }
  double v6 = v5;

  return v6;
}

- (void)setContentAlpha:(double)a3
{
  double v5 = [(TUNavigationBarCompressibleBarButtonItemView *)self customItemView];

  if (v5)
  {
    double v6 = [(TUNavigationBarCompressibleBarButtonItemView *)self customItemView];
    [v6 setContentAlpha:a3];
  }
  v7 = [(TUNavigationBarCompressibleBarButtonItemView *)self regularItemView];

  if (v7)
  {
    id v8 = [(TUNavigationBarCompressibleBarButtonItemView *)self regularItemView];
    [v8 setAlpha:a3];
  }
}

- (double)verticalOffset
{
  v2 = [(TUNavigationBarCompressibleBarButtonItemView *)self view];
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
  double v4 = [(TUNavigationBarCompressibleBarButtonItemView *)self view];
  CATransform3DMakeTranslation(&v5, 0.0, a3, 0.0);
  [v4 setTransform3D:&v5];
}

- (TUNavigationBarButtonItemCompressible)customItemView
{
  return self->_customItemView;
}

- (UIView)regularItemView
{
  return self->_regularItemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularItemView, 0);
  objc_storeStrong((id *)&self->_customItemView, 0);
}

@end