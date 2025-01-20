@interface CarLoadingButton
- (BOOL)isLoading;
- (UIActivityIndicatorView)activityIndicator;
- (void)setActivityIndicator:(id)a3;
- (void)setLoading:(BOOL)a3;
@end

@implementation CarLoadingButton

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    if (a3)
    {
      id obj = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      [obj setAccessibilityIdentifier:@"CarLoadingButtonActivityIndicator"];
      [obj setTranslatesAutoresizingMaskIntoConstraints:0];
      [(CarLoadingButton *)self addSubview:obj];
      v4 = [obj _maps_constraintsForCenteringInView:self];
      +[NSLayoutConstraint activateConstraints:v4];

      [obj startAnimating];
      objc_storeWeak((id *)&self->_activityIndicator, obj);
    }
    else
    {
      p_activityIndicator = &self->_activityIndicator;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_activityIndicator);
      [WeakRetained stopAnimating];

      id obj = objc_loadWeakRetained((id *)p_activityIndicator);
      [obj removeFromSuperview];
    }
  }
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (UIActivityIndicatorView)activityIndicator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityIndicator);

  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end