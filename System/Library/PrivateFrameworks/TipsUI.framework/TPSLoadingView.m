@interface TPSLoadingView
- (TPSLoadingView)init;
- (TPSLoadingView)initWithLoadingLabel:(BOOL)a3;
@end

@implementation TPSLoadingView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);

  objc_storeStrong((id *)&self->_loadingLayoutGuide, 0);
}

- (TPSLoadingView)initWithLoadingLabel:(BOOL)a3
{
  BOOL v3 = a3;
  v40.receiver = self;
  v40.super_class = (Class)TPSLoadingView;
  v4 = [(TPSLoadingView *)&v40 init];
  v5 = v4;
  if (v4 && !v4->_loadingLayoutGuide)
  {
    v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F82908]);
    loadingLayoutGuide = v5->_loadingLayoutGuide;
    v5->_loadingLayoutGuide = v6;

    [(TPSLoadingView *)v5 addLayoutGuide:v5->_loadingLayoutGuide];
    uint64_t v8 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    loadingIndicatorView = v5->_loadingIndicatorView;
    v5->_loadingIndicatorView = (UIActivityIndicatorView *)v8;

    [(UIActivityIndicatorView *)v5->_loadingIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TPSLoadingView *)v5 addSubview:v5->_loadingIndicatorView];
    if (v3)
    {
      id v10 = objc_alloc(MEMORY[0x263F828E0]);
      uint64_t v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      loadingLabel = v5->_loadingLabel;
      v5->_loadingLabel = (UILabel *)v11;

      [(UILabel *)v5->_loadingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)v5->_loadingLabel setNumberOfLines:0];
      v13 = [MEMORY[0x263F086E0] mainBundle];
      v14 = [v13 localizedStringForKey:@"LOADING" value:&stru_26C7F3A90 table:0];
      [(UILabel *)v5->_loadingLabel setText:v14];

      [(UILabel *)v5->_loadingLabel setTextAlignment:1];
      v15 = +[TPSAppearance preferredFontForTextStyle:*MEMORY[0x263F83590]];
      [(UILabel *)v5->_loadingLabel setFont:v15];

      [(TPSLoadingView *)v5 addSubview:v5->_loadingLabel];
      v16 = [(UILabel *)v5->_loadingLabel firstBaselineAnchor];
      v17 = [(UIActivityIndicatorView *)v5->_loadingIndicatorView bottomAnchor];
      v18 = [v16 constraintEqualToSystemSpacingBelowAnchor:v17 multiplier:1.0];
      [v18 setActive:1];

      v19 = [(UILabel *)v5->_loadingLabel centerXAnchor];
      v20 = [(UILayoutGuide *)v5->_loadingLayoutGuide centerXAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      [v21 setActive:1];

      v22 = +[TPSAppearance secondaryLabelColor];
      [(UILabel *)v5->_loadingLabel setTextColor:v22];

      v23 = [(UILayoutGuide *)v5->_loadingLayoutGuide bottomAnchor];
      v24 = v5->_loadingLabel;
    }
    else
    {
      v23 = [(UILayoutGuide *)v5->_loadingLayoutGuide bottomAnchor];
      v24 = v5->_loadingIndicatorView;
    }
    v25 = [v24 bottomAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [(UIActivityIndicatorView *)v5->_loadingIndicatorView centerXAnchor];
    v28 = [(UILayoutGuide *)v5->_loadingLayoutGuide centerXAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v29 setActive:1];

    v30 = [(UILayoutGuide *)v5->_loadingLayoutGuide topAnchor];
    v31 = [(UIActivityIndicatorView *)v5->_loadingIndicatorView topAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v32 setActive:1];

    v33 = [(UILayoutGuide *)v5->_loadingLayoutGuide centerXAnchor];
    v34 = [(TPSLoadingView *)v5 centerXAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    v36 = [(UILayoutGuide *)v5->_loadingLayoutGuide centerYAnchor];
    v37 = [(TPSLoadingView *)v5 centerYAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    [v38 setActive:1];

    [(UIActivityIndicatorView *)v5->_loadingIndicatorView startAnimating];
  }
  return v5;
}

- (TPSLoadingView)init
{
  return [(TPSLoadingView *)self initWithLoadingLabel:0];
}

@end