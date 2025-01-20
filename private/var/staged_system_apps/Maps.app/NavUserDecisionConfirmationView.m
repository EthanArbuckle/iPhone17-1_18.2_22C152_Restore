@interface NavUserDecisionConfirmationView
- (BOOL)progressBarHidden;
- (BackgroundColorButton)cancelButton;
- (MKArtworkImageSource)imageSource;
- (MapsProgressButton)confirmButton;
- (NSString)cancelButtonTitle;
- (NSString)confirmButtonTitle;
- (NavUserDecisionConfirmationView)initWithCoder:(id)a3;
- (NavUserDecisionConfirmationView)initWithFrame:(CGRect)a3;
- (NavUserDecisionConfirmationViewDelegate)delegate;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UILayoutGuide)paddingGuide;
- (UIStackView)buttonsStackView;
- (double)completionProgress;
- (id)_initialConstraints;
- (void)_customInit;
- (void)_didTapActionButton:(id)a3;
- (void)_didTapCancelButton:(id)a3;
- (void)confirmButtonTitlesetCompletionProgress:(double)a3;
- (void)setCancelButton:(id)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setCompletionProgress:(double)a3;
- (void)setConfirmButton:(id)a3;
- (void)setConfirmButtonTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageSource:(id)a3;
- (void)setPaddingGuide:(id)a3;
- (void)setProgressBarHidden:(BOOL)a3;
@end

@implementation NavUserDecisionConfirmationView

- (NavUserDecisionConfirmationView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NavUserDecisionConfirmationView;
  v3 = -[NavUserDecisionConfirmationView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NavUserDecisionConfirmationView *)v3 _customInit];
    v5 = v4;
  }

  return v4;
}

- (NavUserDecisionConfirmationView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NavUserDecisionConfirmationView;
  v3 = [(NavUserDecisionConfirmationView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(NavUserDecisionConfirmationView *)v3 _customInit];
    v5 = v4;
  }

  return v4;
}

- (void)_customInit
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(NavUserDecisionConfirmationView *)self setAccessibilityIdentifier:v4];

  v5 = -[NavTrafficIncidentHeaderView initWithFrame:]([NavTrafficIncidentHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  headerView = self->_headerView;
  self->_headerView = v5;

  [(NavTrafficIncidentHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NavTrafficIncidentHeaderView *)self->_headerView setPrimaryToSecondaryLabelBaselineSpacing:28.0];
  objc_super v7 = [(NavTrafficIncidentHeaderView *)self->_headerView primaryLabel];
  [v7 setNumberOfLines:1];

  v8 = +[UIFont _maps_boldSystemFontWithFixedSize:27.0];
  v9 = [(NavTrafficIncidentHeaderView *)self->_headerView primaryLabel];
  [v9 setFont:v8];

  v10 = [(NavTrafficIncidentHeaderView *)self->_headerView secondaryLabel];
  [v10 setNumberOfLines:0];

  v11 = +[UIFont _maps_systemFontWithFixedSize:22.0];
  v12 = [(NavTrafficIncidentHeaderView *)self->_headerView secondaryLabel];
  [v12 setFont:v11];

  [(NavUserDecisionConfirmationView *)self addSubview:self->_headerView];
  v13 = +[NavUserDecisionButtonFactory cancelButton];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v13;

  [(BackgroundColorButton *)self->_cancelButton addTarget:self action:"_didTapCancelButton:" forControlEvents:64];
  v15 = +[NavUserDecisionButtonFactory confirmButton];
  confirmButton = self->_confirmButton;
  self->_confirmButton = v15;

  [(MapsProgressButton *)self->_confirmButton addTarget:self action:"_didTapActionButton:" forControlEvents:64];
  id v17 = objc_alloc((Class)UIStackView);
  v18 = self->_confirmButton;
  v31[0] = self->_cancelButton;
  v31[1] = v18;
  v19 = +[NSArray arrayWithObjects:v31 count:2];
  v20 = (UIStackView *)[v17 initWithArrangedSubviews:v19];
  buttonsStackView = self->_buttonsStackView;
  self->_buttonsStackView = v20;

  [(UIStackView *)self->_buttonsStackView setAccessibilityIdentifier:@"ButtonsStackView"];
  v22 = [(NavUserDecisionConfirmationView *)self buttonsStackView];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  v23 = [(NavUserDecisionConfirmationView *)self buttonsStackView];
  [v23 setAxis:0];

  v24 = [(NavUserDecisionConfirmationView *)self buttonsStackView];
  [v24 setDistribution:1];

  v25 = [(NavUserDecisionConfirmationView *)self buttonsStackView];
  [v25 setAlignment:0];

  v26 = [(NavUserDecisionConfirmationView *)self buttonsStackView];
  [v26 setSpacing:16.0];

  v27 = [(NavUserDecisionConfirmationView *)self buttonsStackView];
  [(NavUserDecisionConfirmationView *)self addSubview:v27];

  id v28 = objc_alloc_init((Class)UILayoutGuide);
  [(NavUserDecisionConfirmationView *)self setPaddingGuide:v28];

  v29 = [(NavUserDecisionConfirmationView *)self paddingGuide];
  [(NavUserDecisionConfirmationView *)self addLayoutGuide:v29];

  v30 = [(NavUserDecisionConfirmationView *)self _initialConstraints];
  +[NSLayoutConstraint activateConstraints:v30];
}

- (id)_initialConstraints
{
  v44 = [(NavUserDecisionConfirmationView *)self paddingGuide];
  v43 = [v44 leadingAnchor];
  v42 = [(NavUserDecisionConfirmationView *)self leadingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:16.0];
  v45[0] = v41;
  v40 = [(NavUserDecisionConfirmationView *)self paddingGuide];
  v39 = [v40 leadingAnchor];
  v38 = [(NavTrafficIncidentHeaderView *)self->_headerView leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:-4.0];
  v45[1] = v37;
  v36 = [(NavUserDecisionConfirmationView *)self paddingGuide];
  v34 = [v36 leadingAnchor];
  v35 = [(NavUserDecisionConfirmationView *)self buttonsStackView];
  v33 = [v35 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v45[2] = v32;
  v31 = [(NavUserDecisionConfirmationView *)self paddingGuide];
  v30 = [v31 trailingAnchor];
  v29 = [(NavUserDecisionConfirmationView *)self trailingAnchor];
  id v28 = [v30 constraintEqualToAnchor:v29 constant:-16.0];
  v45[3] = v28;
  v27 = [(NavUserDecisionConfirmationView *)self paddingGuide];
  v26 = [v27 trailingAnchor];
  v25 = [(NavTrafficIncidentHeaderView *)self->_headerView trailingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v45[4] = v24;
  v23 = [(NavUserDecisionConfirmationView *)self paddingGuide];
  v21 = [v23 trailingAnchor];
  v22 = [(NavUserDecisionConfirmationView *)self buttonsStackView];
  v20 = [v22 trailingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v45[5] = v19;
  v18 = [(NavTrafficIncidentHeaderView *)self->_headerView firstBaselineAnchor];
  id v17 = [(NavUserDecisionConfirmationView *)self topAnchor];
  v16 = [v18 constraintEqualToAnchor:v17 constant:42.0];
  v45[6] = v16;
  v15 = [(NavUserDecisionConfirmationView *)self buttonsStackView];
  v3 = [v15 topAnchor];
  v4 = [(NavTrafficIncidentHeaderView *)self->_headerView lastBaselineAnchor];
  v5 = [v3 constraintEqualToAnchor:v4 constant:21.0];
  v45[7] = v5;
  v6 = [(NavUserDecisionConfirmationView *)self buttonsStackView];
  objc_super v7 = [v6 heightAnchor];
  v8 = [v7 constraintEqualToConstant:65.0];
  v45[8] = v8;
  v9 = [(NavUserDecisionConfirmationView *)self buttonsStackView];
  v10 = [v9 bottomAnchor];
  v11 = [(NavUserDecisionConfirmationView *)self bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:-15.0];
  v45[9] = v12;
  id v14 = +[NSArray arrayWithObjects:v45 count:10];

  return v14;
}

- (UILabel)primaryLabel
{
  return [(NavTrafficIncidentHeaderView *)self->_headerView primaryLabel];
}

- (UILabel)secondaryLabel
{
  return [(NavTrafficIncidentHeaderView *)self->_headerView secondaryLabel];
}

- (MKArtworkImageSource)imageSource
{
  return [(NavTrafficIncidentHeaderView *)self->_headerView imageSource];
}

- (void)setImageSource:(id)a3
{
}

- (NSString)cancelButtonTitle
{
  v2 = [(NavUserDecisionConfirmationView *)self cancelButton];
  v3 = [v2 titleForState:0];

  return (NSString *)v3;
}

- (void)setCancelButtonTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(NavUserDecisionConfirmationView *)self cancelButton];
  [v5 setTitle:v4 forState:0];
}

- (NSString)confirmButtonTitle
{
  v2 = [(NavUserDecisionConfirmationView *)self confirmButton];
  v3 = [v2 titleForState:0];

  return (NSString *)v3;
}

- (void)setConfirmButtonTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(NavUserDecisionConfirmationView *)self confirmButton];
  [v5 setTitle:v4 forState:0];
}

- (void)confirmButtonTitlesetCompletionProgress:(double)a3
{
  id v4 = [(NavUserDecisionConfirmationView *)self confirmButton];
  [v4 setProgress:a3];
}

- (void)setCompletionProgress:(double)a3
{
  id v4 = [(NavUserDecisionConfirmationView *)self confirmButton];
  [v4 setProgress:a3];
}

- (double)completionProgress
{
  v2 = [(NavUserDecisionConfirmationView *)self confirmButton];
  [v2 progress];
  double v4 = v3;

  return v4;
}

- (void)setProgressBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NavUserDecisionConfirmationView *)self confirmButton];
  [v4 setProgressBarHidden:v3];
}

- (BOOL)progressBarHidden
{
  v2 = [(NavUserDecisionConfirmationView *)self confirmButton];
  unsigned __int8 v3 = [v2 progressBarHidden];

  return v3;
}

- (void)_didTapCancelButton:(id)a3
{
  id v4 = [(NavUserDecisionConfirmationView *)self delegate];
  [v4 userDecisionConfirmationViewDidCancel:self];
}

- (void)_didTapActionButton:(id)a3
{
  id v4 = [(NavUserDecisionConfirmationView *)self delegate];
  [v4 userDecisionConfirmationViewDidConfirm:self];
}

- (NavUserDecisionConfirmationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavUserDecisionConfirmationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BackgroundColorButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (MapsProgressButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (UILayoutGuide)paddingGuide
{
  return self->_paddingGuide;
}

- (void)setPaddingGuide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingGuide, 0);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end