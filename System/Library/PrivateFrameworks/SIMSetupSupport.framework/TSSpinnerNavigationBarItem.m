@interface TSSpinnerNavigationBarItem
- (TSSpinnerNavigationBarItem)init;
- (UIActivityIndicatorView)activityIndicator;
- (void)setActivityIndicator:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation TSSpinnerNavigationBarItem

- (TSSpinnerNavigationBarItem)init
{
  v12.receiver = self;
  v12.super_class = (Class)TSSpinnerNavigationBarItem;
  v2 = [(UIBarItem *)&v12 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [(TSSpinnerNavigationBarItem *)v2 setActivityIndicator:v3];

    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    v5 = [(TSSpinnerNavigationBarItem *)v2 activityIndicator];
    [v5 frame];
    double v7 = v6;
    v8 = [(TSSpinnerNavigationBarItem *)v2 activityIndicator];
    [v8 frame];
    v9 = objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, v7);

    v10 = [(TSSpinnerNavigationBarItem *)v2 activityIndicator];
    [v9 addSubview:v10];

    [(TSSpinnerNavigationBarItem *)v2 setCustomView:v9];
  }
  return v2;
}

- (void)startAnimating
{
  id v2 = [(TSSpinnerNavigationBarItem *)self activityIndicator];
  [v2 startAnimating];
}

- (void)stopAnimating
{
  id v2 = [(TSSpinnerNavigationBarItem *)self activityIndicator];
  [v2 stopAnimating];
}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 400, 1);
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end