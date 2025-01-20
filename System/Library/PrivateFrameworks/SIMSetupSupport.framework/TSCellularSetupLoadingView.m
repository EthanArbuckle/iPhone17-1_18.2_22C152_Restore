@interface TSCellularSetupLoadingView
- (BOOL)isRemotePlan;
- (TSCellularSetupLoadingView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)spinner;
- (UILabel)firstLabel;
- (UILabel)secondLabel;
- (void)_setupActivityIndicator;
- (void)_setupLabels;
- (void)layoutSubviews;
- (void)setFirstLabel:(id)a3;
- (void)setIsRemotePlan:(BOOL)a3;
- (void)setSecondLabel:(id)a3;
- (void)setSpinner:(id)a3;
- (void)spinnerStartAnimating;
- (void)spinnerStopAnimating;
@end

@implementation TSCellularSetupLoadingView

- (TSCellularSetupLoadingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSCellularSetupLoadingView;
  v3 = -[TSCellularSetupLoadingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TSCellularSetupLoadingView *)v3 _setupLabels];
    [(TSCellularSetupLoadingView *)v4 _setupActivityIndicator];
  }
  return v4;
}

- (void)_setupLabels
{
  id v37 = (id)objc_opt_new();
  [(TSCellularSetupLoadingView *)self setFirstLabel:v37];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"Please wait while the page is loading..." value:&stru_26DBE8E78 table:@"Localizable"];
  [v37 setText:v4];

  [v37 setNumberOfLines:0];
  [v37 setAdjustsFontSizeToFitWidth:1];
  [v37 setLineBreakMode:0];
  [v37 setTextAlignment:1];
  uint64_t v5 = *MEMORY[0x263F83570];
  objc_super v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v37 setFont:v6];

  objc_msgSend(v37, "setFrame:", 0.0, 0.0, 40.0, 20.0);
  [(TSCellularSetupLoadingView *)self addSubview:v37];
  [v37 setIsAccessibilityElement:1];
  v7 = [v37 text];
  [v37 setAccessibilityLabel:v7];

  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [v37 topAnchor];
  v9 = [(TSCellularSetupLoadingView *)self topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:130.0];
  [v10 setActive:1];

  v11 = [v37 centerXAnchor];
  v12 = [(TSCellularSetupLoadingView *)self centerXAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [v37 heightAnchor];
  v15 = [(TSCellularSetupLoadingView *)self heightAnchor];
  v16 = [v14 constraintLessThanOrEqualToAnchor:v15 multiplier:1.0];
  [v16 setActive:1];

  v17 = [v37 widthAnchor];
  v18 = [(TSCellularSetupLoadingView *)self widthAnchor];
  v19 = [v17 constraintLessThanOrEqualToAnchor:v18 multiplier:1.0];
  [v19 setActive:1];

  v20 = objc_opt_new();
  [(TSCellularSetupLoadingView *)self setSecondLabel:v20];
  v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"This should only take a few seconds to complete." value:&stru_26DBE8E78 table:@"Localizable"];
  [v20 setText:v22];

  [v20 setNumberOfLines:0];
  [v20 setAdjustsFontSizeToFitWidth:1];
  [v20 setLineBreakMode:0];
  [v20 setTextAlignment:1];
  v23 = [MEMORY[0x263F81708] preferredFontForTextStyle:v5];
  [v20 setFont:v23];

  objc_msgSend(v20, "setFrame:", 0.0, 0.0, 40.0, 20.0);
  [(TSCellularSetupLoadingView *)self addSubview:v20];
  [v20 setIsAccessibilityElement:1];
  v24 = [v20 text];
  [v20 setAccessibilityLabel:v24];

  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  v25 = [v20 topAnchor];
  v26 = [v37 bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26 constant:15.0];
  [v27 setActive:1];

  v28 = [v20 centerXAnchor];
  v29 = [(TSCellularSetupLoadingView *)self centerXAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [v20 heightAnchor];
  v32 = [(TSCellularSetupLoadingView *)self heightAnchor];
  v33 = [v31 constraintLessThanOrEqualToAnchor:v32 multiplier:1.0];
  [v33 setActive:1];

  v34 = [v20 widthAnchor];
  v35 = [(TSCellularSetupLoadingView *)self widthAnchor];
  v36 = [v34 constraintLessThanOrEqualToAnchor:v35 multiplier:1.0];
  [v36 setActive:1];
}

- (void)_setupActivityIndicator
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [(TSCellularSetupLoadingView *)self setSpinner:v3];

  v4 = [(TSCellularSetupLoadingView *)self spinner];
  [v4 setHidesWhenStopped:1];

  uint64_t v5 = [MEMORY[0x263F825C8] clearColor];
  objc_super v6 = [(TSCellularSetupLoadingView *)self spinner];
  [v6 setBackgroundColor:v5];

  v7 = [MEMORY[0x263F825C8] systemGrayColor];
  v8 = [(TSCellularSetupLoadingView *)self spinner];
  [v8 setColor:v7];

  v9 = [(TSCellularSetupLoadingView *)self spinner];
  [v9 setClipsToBounds:1];

  v10 = [(TSCellularSetupLoadingView *)self spinner];
  [(TSCellularSetupLoadingView *)self addSubview:v10];

  v11 = [(TSCellularSetupLoadingView *)self spinner];
  [v11 setIsAccessibilityElement:1];

  v12 = [(TSCellularSetupLoadingView *)self spinner];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(TSCellularSetupLoadingView *)self spinner];
  v14 = [v13 topAnchor];
  v15 = [(TSCellularSetupLoadingView *)self secondLabel];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:30.0];
  [v17 setActive:1];

  v18 = [(TSCellularSetupLoadingView *)self spinner];
  v19 = [v18 centerXAnchor];
  v20 = [(TSCellularSetupLoadingView *)self centerXAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  [(TSCellularSetupLoadingView *)self spinnerStartAnimating];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)TSCellularSetupLoadingView;
  [(TSCellularSetupLoadingView *)&v7 layoutSubviews];
  v3 = +[TSUtilities backgroundColorForRemotePlan:[(TSCellularSetupLoadingView *)self isRemotePlan]];
  [(TSCellularSetupLoadingView *)self setBackgroundColor:v3];

  v4 = +[TSUtilities textColorForRemotePlan:[(TSCellularSetupLoadingView *)self isRemotePlan]];
  uint64_t v5 = [(TSCellularSetupLoadingView *)self firstLabel];
  [v5 setTextColor:v4];

  objc_super v6 = [(TSCellularSetupLoadingView *)self secondLabel];
  [v6 setTextColor:v4];
}

- (void)spinnerStartAnimating
{
  v3 = [(TSCellularSetupLoadingView *)self spinner];
  char v4 = [v3 isAnimating];

  if ((v4 & 1) == 0)
  {
    id v5 = [(TSCellularSetupLoadingView *)self spinner];
    [v5 startAnimating];
  }
}

- (void)spinnerStopAnimating
{
  v3 = [(TSCellularSetupLoadingView *)self spinner];
  int v4 = [v3 isAnimating];

  if (v4)
  {
    id v5 = [(TSCellularSetupLoadingView *)self spinner];
    [v5 stopAnimating];
  }
}

- (BOOL)isRemotePlan
{
  return self->_isRemotePlan;
}

- (void)setIsRemotePlan:(BOOL)a3
{
  self->_isRemotePlan = a3;
}

- (UILabel)firstLabel
{
  return self->_firstLabel;
}

- (void)setFirstLabel:(id)a3
{
}

- (UILabel)secondLabel
{
  return self->_secondLabel;
}

- (void)setSecondLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_secondLabel, 0);
  objc_storeStrong((id *)&self->_firstLabel, 0);
}

@end