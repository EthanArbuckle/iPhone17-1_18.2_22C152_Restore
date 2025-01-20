@interface SearchUILoadingView
- (SearchUILoadingView)init;
- (TLKLabel)loadingLabel;
- (UIActivityIndicatorView)loadingSpinner;
- (unint64_t)loadingState;
- (void)setLoadingLabel:(id)a3;
- (void)setLoadingSpinner:(id)a3;
- (void)setLoadingState:(unint64_t)a3;
@end

@implementation SearchUILoadingView

- (SearchUILoadingView)init
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SearchUILoadingView;
  v2 = [(SearchUILoadingView *)&v10 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [v3 setHidesWhenStopped:0];
    [(SearchUILoadingView *)v2 setLoadingSpinner:v3];
    v4 = objc_opt_new();
    v5 = [MEMORY[0x1E4FB08E0] _lightSystemFontOfSize:18.0];
    [v4 setFont:v5];

    [(SearchUILoadingView *)v2 setLoadingLabel:v4];
    id v6 = objc_alloc(MEMORY[0x1E4F4BF00]);
    v11[0] = v3;
    v11[1] = v4;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    v8 = (void *)[v6 initWithArrangedSubviews:v7];

    [v8 setAlignment:3];
    [v8 setSpacing:6.0];
    [(SearchUILoadingView *)v2 addArrangedSubview:v8];
    [(NUIContainerBoxView *)v2 setVerticalAlignment:1];
    [(NUIContainerBoxView *)v2 setHorizontalAlignment:3];
    [(SearchUILoadingView *)v2 setLayoutMarginsRelativeArrangement:1];
    -[SearchUILoadingView setLayoutMargins:](v2, "setLayoutMargins:", 45.0, 0.0, 0.0, 0.0);
    [(SearchUILoadingView *)v2 setLoadingState:0];
  }
  return v2;
}

- (void)setLoadingState:(unint64_t)a3
{
  self->_loadingState = a3;
  if (a3 == 2)
  {
    id v6 = [(SearchUILoadingView *)self loadingSpinner];
    [v6 setHidden:1];

    id v8 = +[SearchUIUtilities localizedStringForKey:@"CARD_LOADING_ERROR"];
    v7 = [(SearchUILoadingView *)self loadingLabel];
    [v7 setText:v8];
  }
  else if (a3 == 1)
  {
    id v8 = [(SearchUILoadingView *)self loadingSpinner];
    [v8 stopAnimating];
  }
  else
  {
    if (a3) {
      return;
    }
    v4 = +[SearchUIUtilities localizedStringForKey:@"CARD_LOADING"];
    v5 = [(SearchUILoadingView *)self loadingLabel];
    [v5 setText:v4];

    id v8 = [(SearchUILoadingView *)self loadingSpinner];
    [v8 startAnimating];
  }
}

- (unint64_t)loadingState
{
  return self->_loadingState;
}

- (UIActivityIndicatorView)loadingSpinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 672, 1);
}

- (void)setLoadingSpinner:(id)a3
{
}

- (TLKLabel)loadingLabel
{
  return (TLKLabel *)objc_getProperty(self, a2, 680, 1);
}

- (void)setLoadingLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_loadingSpinner, 0);
}

@end