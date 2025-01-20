@interface STSLoadMoreFooter
+ (double)defaultHeight;
- (BOOL)isLoading;
- (CGSize)sizeThatFits:(CGSize)a3;
- (STSLoadMoreFooter)initWithFrame:(CGRect)a3;
- (STSLoadMoreFooterDelegate)delegate;
- (UIImage)searchProviderImage;
- (void)_handleLogoTap:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setSearchProviderImage:(id)a3;
@end

@implementation STSLoadMoreFooter

- (STSLoadMoreFooter)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STSLoadMoreFooter;
  v3 = -[STSLoadMoreFooter initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:4];
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v4;

    [(STSLoadMoreFooter *)v3 addSubview:v3->_activityIndicator];
  }
  return v3;
}

+ (double)defaultHeight
{
  return 44.0;
}

- (void)layoutSubviews
{
  [(STSLoadMoreFooter *)self bounds];
  [(UIActivityIndicatorView *)self->_activityIndicator bounds];
  UIRectCenteredIntegralRectScale();
  [(UIActivityIndicatorView *)self->_activityIndicator setFrame:0x3FF0000000000000];
  providerIconView = self->_providerIconView;
  if (providerIconView)
  {
    [(UIImageView *)providerIconView bounds];
    UIRectCenteredYInRectScale();
    uint64_t v4 = self->_providerIconView;
    -[UIImageView setFrame:](v4, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(id)objc_opt_class() defaultHeight];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)_handleLogoTap:(id)a3
{
  double v4 = [(STSLoadMoreFooter *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(STSLoadMoreFooter *)self delegate];
    [v6 loadMoreFooterDidTapLogo];
  }
}

- (void)setLoading:(BOOL)a3
{
  if (self->_loading != a3)
  {
    self->_loading = a3;
    activityIndicator = self->_activityIndicator;
    if (a3) {
      [(UIActivityIndicatorView *)activityIndicator startAnimating];
    }
    else {
      [(UIActivityIndicatorView *)activityIndicator stopAnimating];
    }
  }
}

- (void)setSearchProviderImage:(id)a3
{
  char v5 = (UIImage *)a3;
  p_searchProviderImage = &self->_searchProviderImage;
  if (self->_searchProviderImage != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_searchProviderImage, a3);
    providerIconView = self->_providerIconView;
    if (providerIconView)
    {
      [(UIImageView *)providerIconView setImage:*p_searchProviderImage];
    }
    else
    {
      v8 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:*p_searchProviderImage];
      v9 = self->_providerIconView;
      self->_providerIconView = v8;

      v10 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleLogoTap_];
      [(UIImageView *)self->_providerIconView addGestureRecognizer:v10];
      [(UIImageView *)self->_providerIconView setUserInteractionEnabled:1];
      v11 = self->_providerIconView;
      v12 = objc_msgSend(MEMORY[0x263F825C8], "sts_providerImageColor");
      [(UIImageView *)v11 setTintColor:v12];

      [(STSLoadMoreFooter *)self addSubview:self->_providerIconView];
    }
    [(STSLoadMoreFooter *)self setNeedsLayout];
    char v5 = v13;
  }
}

- (STSLoadMoreFooterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STSLoadMoreFooterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (UIImage)searchProviderImage
{
  return self->_searchProviderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchProviderImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providerIconView, 0);

  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end