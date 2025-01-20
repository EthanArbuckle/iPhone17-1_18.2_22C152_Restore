@interface TransitLineDisambiguationCell
- (MapsThemeLabel)messageLabel;
- (NSLayoutConstraint)messageLabelLeadingConstraint;
- (NSString)labelText;
- (TransitLineDisambiguationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIActivityIndicatorView)spinner;
- (UIImage)shieldImage;
- (UIImageView)shieldImageView;
- (double)_targetCellHeight;
- (double)maxWidth;
- (id)_fontProviderForMessageLabel;
- (void)_updateMessageLabelLeadingMargin;
- (void)addConstraints;
- (void)hideSpinner;
- (void)setLabelText:(id)a3;
- (void)setMaxWidth:(double)a3;
- (void)setMessageLabel:(id)a3;
- (void)setMessageLabelLeadingConstraint:(id)a3;
- (void)setShieldImage:(id)a3;
- (void)setShieldImageView:(id)a3;
- (void)setSpinner:(id)a3;
- (void)showSpinner;
@end

@implementation TransitLineDisambiguationCell

- (TransitLineDisambiguationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v41.receiver = self;
  v41.super_class = (Class)TransitLineDisambiguationCell;
  v4 = [(MapsThemeTableViewCell *)&v41 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [(TransitLineDisambiguationCell *)v4 setSpinner:v5];

    v6 = [(TransitLineDisambiguationCell *)v4 spinner];
    [v6 setHidesWhenStopped:1];

    v7 = [(TransitLineDisambiguationCell *)v4 spinner];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [MapsThemeLabel alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v12 = -[MapsThemeLabel initWithFrame:](v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(TransitLineDisambiguationCell *)v4 setMessageLabel:v12];

    v13 = [(TransitLineDisambiguationCell *)v4 messageLabel];
    [v13 setLineBreakMode:4];

    v14 = [(TransitLineDisambiguationCell *)v4 messageLabel];
    [v14 setNumberOfLines:0];

    v15 = [(TransitLineDisambiguationCell *)v4 messageLabel];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = +[UIColor labelColor];
    v17 = [(TransitLineDisambiguationCell *)v4 messageLabel];
    [v17 setTextColor:v16];

    v18 = [(TransitLineDisambiguationCell *)v4 messageLabel];
    LODWORD(v19) = 1144750080;
    [v18 setContentCompressionResistancePriority:0 forAxis:v19];

    v20 = [(TransitLineDisambiguationCell *)v4 messageLabel];
    LODWORD(v21) = 1148829696;
    [v20 setContentCompressionResistancePriority:1 forAxis:v21];

    v22 = [(TransitLineDisambiguationCell *)v4 contentView];
    v23 = [(TransitLineDisambiguationCell *)v4 messageLabel];
    [v22 addSubview:v23];

    id v24 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(TransitLineDisambiguationCell *)v4 setShieldImageView:v24];

    v25 = [(TransitLineDisambiguationCell *)v4 shieldImageView];
    [v25 setContentMode:4];

    v26 = [(TransitLineDisambiguationCell *)v4 shieldImageView];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    v27 = [(TransitLineDisambiguationCell *)v4 shieldImageView];
    LODWORD(v28) = 1148846080;
    [v27 setContentHuggingPriority:0 forAxis:v28];

    v29 = [(TransitLineDisambiguationCell *)v4 shieldImageView];
    LODWORD(v30) = 1148846080;
    [v29 setContentHuggingPriority:1 forAxis:v30];

    v31 = [(TransitLineDisambiguationCell *)v4 shieldImageView];
    LODWORD(v32) = 1148846080;
    [v31 setContentCompressionResistancePriority:0 forAxis:v32];

    v33 = [(TransitLineDisambiguationCell *)v4 shieldImageView];
    LODWORD(v34) = 1148846080;
    [v33 setContentCompressionResistancePriority:1 forAxis:v34];

    v35 = [(TransitLineDisambiguationCell *)v4 contentView];
    v36 = [(TransitLineDisambiguationCell *)v4 shieldImageView];
    [v35 addSubview:v36];

    v37 = [(TransitLineDisambiguationCell *)v4 messageLabel];
    v38 = [(TransitLineDisambiguationCell *)v4 _fontProviderForMessageLabel];
    +[DynamicTypeWizard autorefreshLabel:v37 withFontProvider:v38];

    v39 = +[UIColor clearColor];
    [(TransitLineDisambiguationCell *)v4 setBackgroundColor:v39];

    [(TransitLineDisambiguationCell *)v4 addConstraints];
  }
  return v4;
}

- (void)showSpinner
{
  v3 = [(TransitLineDisambiguationCell *)self messageLabel];
  [v3 setText:0];

  v4 = [(TransitLineDisambiguationCell *)self shieldImageView];
  [v4 setImage:0];

  id v5 = [(TransitLineDisambiguationCell *)self contentView];
  v6 = [(TransitLineDisambiguationCell *)self spinner];
  [v5 addSubview:v6];

  v7 = [(TransitLineDisambiguationCell *)self spinner];
  [v7 startAnimating];

  v18 = [(TransitLineDisambiguationCell *)self spinner];
  v8 = [v18 centerXAnchor];
  v9 = [(TransitLineDisambiguationCell *)self contentView];
  v10 = [v9 centerXAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v19[0] = v11;
  v12 = [(TransitLineDisambiguationCell *)self spinner];
  v13 = [v12 centerYAnchor];
  v14 = [(TransitLineDisambiguationCell *)self contentView];
  v15 = [v14 centerYAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v19[1] = v16;
  v17 = +[NSArray arrayWithObjects:v19 count:2];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)hideSpinner
{
  v3 = [(TransitLineDisambiguationCell *)self spinner];
  v4 = [v3 superview];

  if (v4)
  {
    id v5 = [(TransitLineDisambiguationCell *)self spinner];
    [v5 stopAnimating];

    id v6 = [(TransitLineDisambiguationCell *)self spinner];
    [v6 removeFromSuperview];
  }
}

- (void)setShieldImage:(id)a3
{
  p_shieldImage = (id *)&self->_shieldImage;
  id v8 = a3;
  if ((objc_msgSend(*p_shieldImage, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shieldImage, a3);
    id v6 = *p_shieldImage;
    v7 = [(TransitLineDisambiguationCell *)self shieldImageView];
    [v7 setImage:v6];
  }
}

- (void)setLabelText:(id)a3
{
  p_labelText = (id *)&self->_labelText;
  id v8 = a3;
  if ((objc_msgSend(*p_labelText, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_labelText, a3);
    id v6 = *p_labelText;
    v7 = [(TransitLineDisambiguationCell *)self messageLabel];
    [v7 setText:v6];
  }
}

- (void)setMaxWidth:(double)a3
{
  if (self->_maxWidth != a3)
  {
    self->_maxWidth = a3;
    [(TransitLineDisambiguationCell *)self _updateMessageLabelLeadingMargin];
  }
}

- (void)addConstraints
{
  v3 = [(TransitLineDisambiguationCell *)self contentView];
  v4 = [v3 heightAnchor];
  [(TransitLineDisambiguationCell *)self _targetCellHeight];
  id v5 = [v4 constraintEqualToConstant:];

  LODWORD(v6) = 1148813312;
  v7 = v5;
  v44 = v5;
  [v5 setPriority:v6];
  id v8 = [(TransitLineDisambiguationCell *)self messageLabel];
  v9 = [v8 firstBaselineAnchor];
  v10 = [(TransitLineDisambiguationCell *)self contentView];
  v11 = [v10 topAnchor];
  uint64_t v12 = [v9 constraintGreaterThanOrEqualToAnchor:v11];
  v37 = (void *)v12;

  v13 = [(TransitLineDisambiguationCell *)self messageLabel];
  v14 = [v13 leadingAnchor];
  v15 = [(TransitLineDisambiguationCell *)self contentView];
  v16 = [v15 leadingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [(TransitLineDisambiguationCell *)self setMessageLabelLeadingConstraint:v17];

  if (sub_1000BBB44(self) == 5) {
    double v18 = 8.0;
  }
  else {
    double v18 = 34.0;
  }
  v45[0] = v7;
  v43 = [(TransitLineDisambiguationCell *)self shieldImageView];
  objc_super v41 = [v43 centerYAnchor];
  v42 = [(TransitLineDisambiguationCell *)self contentView];
  v40 = [v42 centerYAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v45[1] = v39;
  v38 = [(TransitLineDisambiguationCell *)self shieldImageView];
  v35 = [v38 leadingAnchor];
  v36 = [(TransitLineDisambiguationCell *)self contentView];
  double v34 = [v36 leadingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34 constant:16.0];
  v45[2] = v33;
  double v32 = [(TransitLineDisambiguationCell *)self _fontProviderForMessageLabel];
  v31 = +[DynamicTypeWizard autoscaledConstraint:v12 constant:v32 withFontProvider:v18];
  v45[3] = v31;
  double v30 = [(TransitLineDisambiguationCell *)self messageLabelLeadingConstraint];
  v45[4] = v30;
  v29 = [(TransitLineDisambiguationCell *)self messageLabel];
  double v28 = [v29 centerYAnchor];
  double v19 = [(TransitLineDisambiguationCell *)self contentView];
  v20 = [v19 centerYAnchor];
  double v21 = [v28 constraintEqualToAnchor:v20];
  v45[5] = v21;
  v22 = [(TransitLineDisambiguationCell *)self messageLabel];
  v23 = [v22 trailingAnchor];
  id v24 = [(TransitLineDisambiguationCell *)self contentView];
  v25 = [v24 trailingAnchor];
  v26 = [v23 constraintEqualToAnchor:v25 constant:-16.0];
  v45[6] = v26;
  v27 = +[NSArray arrayWithObjects:v45 count:7];
  +[NSLayoutConstraint activateConstraints:v27];

  [(TransitLineDisambiguationCell *)self _updateMessageLabelLeadingMargin];
}

- (void)_updateMessageLabelLeadingMargin
{
  [(TransitLineDisambiguationCell *)self maxWidth];
  double v4 = v3 + 16.0;
  id v8 = [(TransitLineDisambiguationCell *)self shieldImage];
  double v5 = 0.0;
  if (v8) {
    double v5 = 16.0;
  }
  double v6 = v4 + v5;
  v7 = [(TransitLineDisambiguationCell *)self messageLabelLeadingConstraint];
  [v7 setConstant:v6];
}

- (id)_fontProviderForMessageLabel
{
  if (sub_1000BBB44(self) == 5) {
    v2 = &stru_1013214E0;
  }
  else {
    v2 = &stru_101321480;
  }
  double v3 = objc_retainBlock(v2);

  return v3;
}

- (double)_targetCellHeight
{
  uint64_t v2 = sub_1000BBB44(self);
  double result = 79.0;
  if (v2 == 5) {
    return 36.0;
  }
  return result;
}

- (NSString)labelText
{
  return self->_labelText;
}

- (UIImage)shieldImage
{
  return self->_shieldImage;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (MapsThemeLabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIImageView)shieldImageView
{
  return self->_shieldImageView;
}

- (void)setShieldImageView:(id)a3
{
}

- (NSLayoutConstraint)messageLabelLeadingConstraint
{
  return self->_messageLabelLeadingConstraint;
}

- (void)setMessageLabelLeadingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_shieldImageView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_shieldImage, 0);

  objc_storeStrong((id *)&self->_labelText, 0);
}

@end