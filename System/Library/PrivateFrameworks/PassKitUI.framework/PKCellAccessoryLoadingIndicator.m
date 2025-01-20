@interface PKCellAccessoryLoadingIndicator
+ (id)accessory;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKCellAccessoryLoadingIndicator)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PKCellAccessoryLoadingIndicator

+ (id)accessory
{
  v2 = [PKCellAccessoryLoadingIndicator alloc];
  v3 = -[PKCellAccessoryLoadingIndicator initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v3 placement:1];

  return v4;
}

- (PKCellAccessoryLoadingIndicator)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKCellAccessoryLoadingIndicator;
  v3 = -[PKCellAccessoryLoadingIndicator initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    loadingIndicator = v3->_loadingIndicator;
    v3->_loadingIndicator = (UIActivityIndicatorView *)v4;

    [(UIActivityIndicatorView *)v3->_loadingIndicator startAnimating];
    [(PKCellAccessoryLoadingIndicator *)v3 addSubview:v3->_loadingIndicator];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIActivityIndicatorView sizeThatFits:](self->_loadingIndicator, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  [(PKCellAccessoryLoadingIndicator *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIActivityIndicatorView *)self->_loadingIndicator sizeToFit];
  [(UIActivityIndicatorView *)self->_loadingIndicator frame];
  loadingIndicator = self->_loadingIndicator;

  -[UIActivityIndicatorView setFrame:](loadingIndicator, "setFrame:", v4 - v7, (v6 - v8) * 0.5);
}

- (void).cxx_destruct
{
}

@end