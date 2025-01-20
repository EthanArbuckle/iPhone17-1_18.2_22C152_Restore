@interface HODiscoverConnectionIssueOverlayView
- (HODiscoverConnectionIssueOverlayView)initWithFrame:(CGRect)a3 withDelegate:(id)a4;
- (HODiscoverConnectionIssueOverlayViewDelegate)delegate;
- (HUIconView)networkIconView;
- (NSArray)layoutConstraints;
- (UIButton)retryButton;
- (UILabel)descriptionLabel;
- (unint64_t)connectionIssueType;
- (void)_retryButtonPressed:(id)a3;
- (void)_setupCommonViewAppearance;
- (void)setConnectionIssueType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setNetworkIconView:(id)a3;
- (void)setRetryButton:(id)a3;
- (void)updateConstraints;
@end

@implementation HODiscoverConnectionIssueOverlayView

- (HODiscoverConnectionIssueOverlayView)initWithFrame:(CGRect)a3 withDelegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HODiscoverConnectionIssueOverlayView;
  v10 = -[HODiscoverConnectionIssueOverlayView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    [(HODiscoverConnectionIssueOverlayView *)v11 _setupCommonViewAppearance];
  }

  return v11;
}

- (void)_setupCommonViewAppearance
{
  id v3 = objc_alloc((Class)HUIconView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  networkIconView = self->_networkIconView;
  self->_networkIconView = v7;

  id v9 = +[UIColor systemGrayColor];
  [(HUIconView *)self->_networkIconView setTintColor:v9];

  [(HUIconView *)self->_networkIconView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HODiscoverConnectionIssueOverlayView *)self addSubview:self->_networkIconView];
  v10 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v10;

  v12 = +[UIColor systemGrayColor];
  [(UILabel *)self->_descriptionLabel setTextColor:v12];

  [(UILabel *)self->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_descriptionLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_descriptionLabel setTextAlignment:1];
  [(UILabel *)self->_descriptionLabel setNumberOfLines:0];
  [(UILabel *)self->_descriptionLabel setLineBreakMode:0];
  objc_super v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_descriptionLabel setFont:v13];

  [(UILabel *)self->_descriptionLabel setAdjustsFontForContentSizeCategory:1];
  [(HODiscoverConnectionIssueOverlayView *)self addSubview:self->_descriptionLabel];
  v14 = [objc_alloc((Class)UIButton) initWithFrame:CGRectZero.origin.x, y, width, height];
  retryButton = self->_retryButton;
  self->_retryButton = v14;

  [(UIButton *)self->_retryButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = self->_retryButton;
  v17 = sub_10001E6A8(@"HODiscoverConnectionIssueOverlayViewRetryButtonTitle");
  [(UIButton *)v16 setTitle:v17 forState:0];

  v18 = self->_retryButton;
  v19 = +[UIColor systemOrangeColor];
  [(UIButton *)v18 setTitleColor:v19 forState:0];

  [(UIButton *)self->_retryButton sizeToFit];
  v20 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v21 = [(UIButton *)self->_retryButton titleLabel];
  [v21 setFont:v20];

  v22 = [(UIButton *)self->_retryButton titleLabel];
  [v22 setAdjustsFontForContentSizeCategory:1];

  v23 = [(UIButton *)self->_retryButton titleLabel];
  [v23 setAdjustsFontSizeToFitWidth:1];

  [(UIButton *)self->_retryButton addTarget:self action:"_retryButtonPressed:" forEvents:64];
  [(HODiscoverConnectionIssueOverlayView *)self addSubview:self->_retryButton];
  id v24 = +[UIColor clearColor];
  [(HODiscoverConnectionIssueOverlayView *)self setBackgroundColor:v24];
}

- (void)updateConstraints
{
  id v3 = [(HODiscoverConnectionIssueOverlayView *)self layoutConstraints];

  if (!v3)
  {
    v4 = +[NSMutableArray array];
    v5 = [(HODiscoverConnectionIssueOverlayView *)self networkIconView];
    v6 = [v5 bottomAnchor];
    v7 = [(HODiscoverConnectionIssueOverlayView *)self descriptionLabel];
    v8 = [v7 topAnchor];
    id v9 = [v6 constraintEqualToAnchor:v8 constant:-12.0];
    [v4 addObject:v9];

    v10 = [(HODiscoverConnectionIssueOverlayView *)self networkIconView];
    v11 = [v10 centerXAnchor];
    v12 = [(HODiscoverConnectionIssueOverlayView *)self centerXAnchor];
    objc_super v13 = [v11 constraintEqualToAnchor:v12];
    [v4 addObject:v13];

    v14 = [(HODiscoverConnectionIssueOverlayView *)self networkIconView];
    v15 = [v14 widthAnchor];
    v16 = [v15 constraintEqualToConstant:50.0];
    [v4 addObject:v16];

    v17 = [(HODiscoverConnectionIssueOverlayView *)self networkIconView];
    v18 = [v17 heightAnchor];
    v19 = [v18 constraintEqualToConstant:50.0];
    [v4 addObject:v19];

    v20 = [(HODiscoverConnectionIssueOverlayView *)self descriptionLabel];
    v21 = [v20 centerXAnchor];
    v22 = [(HODiscoverConnectionIssueOverlayView *)self centerXAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v4 addObject:v23];

    id v24 = [(HODiscoverConnectionIssueOverlayView *)self descriptionLabel];
    v25 = [v24 centerYAnchor];
    v26 = [(HODiscoverConnectionIssueOverlayView *)self centerYAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [v4 addObject:v27];

    v28 = [(HODiscoverConnectionIssueOverlayView *)self descriptionLabel];
    v29 = [v28 leadingAnchor];
    v30 = [(HODiscoverConnectionIssueOverlayView *)self leadingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:20.0];
    [v4 addObject:v31];

    v32 = [(HODiscoverConnectionIssueOverlayView *)self descriptionLabel];
    v33 = [v32 trailingAnchor];
    v34 = [(HODiscoverConnectionIssueOverlayView *)self trailingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34 constant:-20.0];
    [v4 addObject:v35];

    v36 = [(HODiscoverConnectionIssueOverlayView *)self retryButton];
    v37 = [v36 topAnchor];
    v38 = [(HODiscoverConnectionIssueOverlayView *)self descriptionLabel];
    v39 = [v38 bottomAnchor];
    v40 = [v37 constraintEqualToAnchor:v39];
    [v4 addObject:v40];

    v41 = [(HODiscoverConnectionIssueOverlayView *)self retryButton];
    v42 = [v41 centerXAnchor];
    v43 = [(HODiscoverConnectionIssueOverlayView *)self centerXAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    [v4 addObject:v44];

    +[NSLayoutConstraint activateConstraints:v4];
    [(HODiscoverConnectionIssueOverlayView *)self setLayoutConstraints:v4];
  }
  v45.receiver = self;
  v45.super_class = (Class)HODiscoverConnectionIssueOverlayView;
  [(HODiscoverConnectionIssueOverlayView *)&v45 updateConstraints];
}

- (void)setConnectionIssueType:(unint64_t)a3
{
  if (self->_connectionIssueType == a3) {
    return;
  }
  self->_connectionIssueType = a3;
  id v14 = +[UIImageSymbolConfiguration configurationWithPointSize:50.0];
  if (a3 < 2)
  {
    v5 = [(HODiscoverConnectionIssueOverlayView *)self networkIconView];
    id v6 = [objc_alloc((Class)HFImageIconDescriptor) initWithSystemImageNamed:@"wifi.slash" configuration:v14];
    [v5 updateWithIconDescriptor:v6 displayStyle:1 animated:0];

    v7 = [(HODiscoverConnectionIssueOverlayView *)self retryButton];
    [v7 setHidden:1];

    if (+[HFUtilities useWLANInsteadOfWiFi]) {
      v8 = @"HODiscoverConnectionIssueNetworkUnavailableDescription_WLAN";
    }
    else {
      v8 = @"HODiscoverConnectionIssueNetworkUnavailableDescription_WIFI";
    }
    goto LABEL_8;
  }
  if (a3 == 2)
  {
    id v9 = [(HODiscoverConnectionIssueOverlayView *)self networkIconView];
    id v10 = [objc_alloc((Class)HFImageIconDescriptor) initWithSystemImageNamed:@"exclamationmark.icloud.fill" configuration:v14];
    [v9 updateWithIconDescriptor:v10 displayStyle:1 animated:0];

    v11 = [(HODiscoverConnectionIssueOverlayView *)self retryButton];
    [v11 setHidden:0];

    v8 = @"HODiscoverConnectionIssueServerUnavailableDescription";
LABEL_8:
    v12 = sub_10001E6A8(v8);
    objc_super v13 = [(HODiscoverConnectionIssueOverlayView *)self descriptionLabel];
    [v13 setText:v12];
  }
  [(HODiscoverConnectionIssueOverlayView *)self setNeedsUpdateConstraints];
}

- (void)_retryButtonPressed:(id)a3
{
  v4 = [(HODiscoverConnectionIssueOverlayView *)self delegate];

  if (v4)
  {
    id v5 = [(HODiscoverConnectionIssueOverlayView *)self delegate];
    [v5 connectionIssueOverlayRetryButtonPressed];
  }
}

- (unint64_t)connectionIssueType
{
  return self->_connectionIssueType;
}

- (HUIconView)networkIconView
{
  return self->_networkIconView;
}

- (void)setNetworkIconView:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIButton)retryButton
{
  return self->_retryButton;
}

- (void)setRetryButton:(id)a3
{
}

- (HODiscoverConnectionIssueOverlayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HODiscoverConnectionIssueOverlayViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_storeStrong((id *)&self->_networkIconView, 0);
}

@end