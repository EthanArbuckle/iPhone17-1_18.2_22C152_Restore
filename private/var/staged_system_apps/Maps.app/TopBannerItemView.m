@interface TopBannerItemView
- (BOOL)isFirstItemWithIcon;
- (BOOL)isHairlineVisible;
- (MKArtworkImageView)badgeImageView;
- (TopBannerItem)item;
- (TopBannerItemView)initWithCoder:(id)a3;
- (TopBannerItemView)initWithFrame:(CGRect)a3;
- (UIButton)button;
- (UILabel)messageLabel;
- (void)_buttonTapped:(id)a3;
- (void)_customInit;
- (void)_deregisterObservers;
- (void)_setupConstraints;
- (void)_updateUI;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBadgeImageView:(id)a3;
- (void)setButton:(id)a3;
- (void)setFirstItemWithIcon:(BOOL)a3;
- (void)setHairlineVisible:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)updateBadgeView;
@end

@implementation TopBannerItemView

- (TopBannerItemView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TopBannerItemView;
  v3 = -[TopBannerItemView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TopBannerItemView *)v3 _customInit];
    v5 = v4;
  }

  return v4;
}

- (TopBannerItemView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TopBannerItemView;
  v3 = [(TopBannerItemView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(TopBannerItemView *)v3 _customInit];
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  if (self->_item) {
    [(TopBannerItemView *)self _deregisterObservers];
  }
  v3.receiver = self;
  v3.super_class = (Class)TopBannerItemView;
  [(TopBannerItemView *)&v3 dealloc];
}

- (void)_customInit
{
  objc_super v3 = (MKArtworkImageView *)objc_alloc_init((Class)MKArtworkImageView);
  badgeImageView = self->_badgeImageView;
  self->_badgeImageView = v3;

  [(MKArtworkImageView *)self->_badgeImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKArtworkImageView *)self->_badgeImageView setContentMode:4];
  [(TopBannerItemView *)self addSubview:self->_badgeImageView];
  v5 = (UILabel *)objc_alloc_init((Class)UILabel);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v5;

  objc_super v7 = +[UIColor labelColor];
  [(UILabel *)self->_messageLabel setTextColor:v7];

  [(UILabel *)self->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  +[DynamicTypeWizard autorefreshLabel:self->_messageLabel withFontProvider:&stru_1012FED80];
  [(UILabel *)self->_messageLabel setTextAlignment:4];
  [(UILabel *)self->_messageLabel setNumberOfLines:0];
  [(UILabel *)self->_messageLabel setLineBreakMode:4];
  [(UILabel *)self->_messageLabel setContentHuggingPriority:0 forAxis:0.0];
  [(TopBannerItemView *)self addSubview:self->_messageLabel];
  v8 = -[HairlineView initWithFrame:]([HairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  hairlineView = self->_hairlineView;
  self->_hairlineView = v8;

  [(HairlineView *)self->_hairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TopBannerItemView *)self addSubview:self->_hairlineView];

  [(TopBannerItemView *)self _setupConstraints];
}

- (void)_setupConstraints
{
  objc_super v3 = [(TopBannerItemView *)self badgeImageView];
  LODWORD(v4) = 1148846080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v4];

  v5 = [(TopBannerItemView *)self badgeImageView];
  LODWORD(v6) = 1148846080;
  [v5 setContentHuggingPriority:0 forAxis:v6];

  objc_super v7 = [(TopBannerItemView *)self messageLabel];
  v8 = [v7 trailingAnchor];
  v9 = [(TopBannerItemView *)self trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:-9.0];
  messageLabelToTrailingConstraint = self->_messageLabelToTrailingConstraint;
  self->_messageLabelToTrailingConstraint = v10;

  v12 = [(TopBannerItemView *)self badgeImageView];
  v13 = [v12 trailingAnchor];
  v14 = [(TopBannerItemView *)self messageLabel];
  v15 = [v14 leadingAnchor];
  v16 = [v13 constraintEqualToAnchor:v15 constant:-7.0];
  badgeViewToMessageLabelConstraint = self->_badgeViewToMessageLabelConstraint;
  self->_badgeViewToMessageLabelConstraint = v16;

  v60 = [(TopBannerItemView *)self badgeImageView];
  v59 = [v60 leadingAnchor];
  v58 = [(TopBannerItemView *)self leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:9.0];
  v61[0] = v57;
  v56 = [(TopBannerItemView *)self badgeImageView];
  v55 = [v56 topAnchor];
  v54 = [(TopBannerItemView *)self topAnchor];
  v53 = [v55 constraintEqualToAnchor:v54 constant:9.0];
  v61[1] = v53;
  v52 = [(TopBannerItemView *)self badgeImageView];
  v50 = [v52 bottomAnchor];
  v51 = [(TopBannerItemView *)self messageLabel];
  v49 = [v51 bottomAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v18 = self->_badgeViewToMessageLabelConstraint;
  v61[2] = v48;
  v61[3] = v18;
  v61[4] = self->_messageLabelToTrailingConstraint;
  v46 = [(HairlineView *)self->_hairlineView leadingAnchor];
  v47 = [(TopBannerItemView *)self messageLabel];
  v45 = [v47 leadingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v61[5] = v44;
  v43 = [(HairlineView *)self->_hairlineView trailingAnchor];
  v42 = [(TopBannerItemView *)self trailingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:-9.0];
  v61[6] = v41;
  v40 = [(TopBannerItemView *)self badgeImageView];
  v39 = [v40 topAnchor];
  v38 = [(TopBannerItemView *)self topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v36 = +[DynamicTypeWizard autoscaledConstraint:v37 constant:&stru_1012FED80 withFontProvider:9.0];
  v61[7] = v36;
  v35 = [(TopBannerItemView *)self messageLabel];
  v34 = [v35 firstBaselineAnchor];
  v33 = [(TopBannerItemView *)self topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v19 = +[DynamicTypeWizard autoscaledConstraint:v32 constant:&stru_1012FED80 withFontProvider:19.0];
  v61[8] = v19;
  v20 = [(TopBannerItemView *)self bottomAnchor];
  v21 = [(TopBannerItemView *)self messageLabel];
  v22 = [v21 lastBaselineAnchor];
  v23 = [v20 constraintGreaterThanOrEqualToAnchor:v22 constant:11.0];
  v61[9] = v23;
  v24 = [(HairlineView *)self->_hairlineView bottomAnchor];
  v25 = [(TopBannerItemView *)self bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v61[10] = v26;
  v27 = +[NSArray arrayWithObjects:v61 count:11];
  +[NSLayoutConstraint activateConstraints:v27];

  v28 = [(TopBannerItemView *)self badgeImageView];
  v29 = [v28 widthAnchor];
  v30 = [v29 constraintEqualToConstant:0.0];
  badgeViewWidthConstraint = self->_badgeViewWidthConstraint;
  self->_badgeViewWidthConstraint = v30;
}

- (void)setHairlineVisible:(BOOL)a3
{
}

- (BOOL)isHairlineVisible
{
  return [(HairlineView *)self->_hairlineView isHidden] ^ 1;
}

- (void)setItem:(id)a3
{
  v5 = (TopBannerItem *)a3;
  item = self->_item;
  if (item != v5)
  {
    objc_super v7 = v5;
    if (item) {
      [(TopBannerItemView *)self _deregisterObservers];
    }
    objc_storeStrong((id *)&self->_item, a3);
    [(TopBannerItemView *)self _updateUI];
    v5 = v7;
  }
}

- (void)setFirstItemWithIcon:(BOOL)a3
{
  if (self->_firstItemWithIcon != a3)
  {
    self->_firstItemWithIcon = a3;
    uint64_t v4 = [(TopBannerItemView *)self isFirstItemWithIcon] ^ 1;
    badgeImageView = self->_badgeImageView;
    [(MKArtworkImageView *)badgeImageView setHidden:v4];
  }
}

- (void)_buttonTapped:(id)a3
{
  uint64_t v4 = [(TopBannerItemView *)self item];
  v5 = [v4 buttonAction];

  if (v5)
  {
    id v8 = [(TopBannerItemView *)self item];
    double v6 = [v8 buttonAction];
    objc_super v7 = [(TopBannerItemView *)self item];
    ((void (**)(void, void *))v6)[2](v6, v7);
  }
}

- (void)updateBadgeView
{
  objc_super v3 = [(TopBannerItem *)self->_item artwork];
  [(MKArtworkImageView *)self->_badgeImageView setImageSource:v3];

  [(MKArtworkImageView *)self->_badgeImageView setHidden:!self->_firstItemWithIcon];
  uint64_t v4 = [(MKArtworkImageView *)self->_badgeImageView image];

  if (v4) {
    double v5 = -7.0;
  }
  else {
    double v5 = 0.0;
  }
  [(NSLayoutConstraint *)self->_badgeViewWidthConstraint setActive:v4 == 0];
  [(NSLayoutConstraint *)self->_badgeViewToMessageLabelConstraint setConstant:v5];
  double v6 = [(MKArtworkImageView *)self->_badgeImageView image];
  if (v6)
  {
    uint64_t v7 = 4;
  }
  else
  {
    id v8 = [(UIButton *)self->_button superview];
    if (v8) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  messageLabel = self->_messageLabel;

  [(UILabel *)messageLabel setTextAlignment:v7];
}

- (void)_updateUI
{
  objc_super v3 = [(TopBannerItem *)self->_item buttonText];
  if ([v3 length]) {
    int64_t v4 = [(TopBannerItem *)self->_item maxNumberOfLines];
  }
  else {
    int64_t v4 = 0;
  }
  [(UILabel *)self->_messageLabel setNumberOfLines:v4];

  double v5 = [(TopBannerItem *)self->_item attributedText];
  if ([v5 length])
  {
    double v6 = [(TopBannerItem *)self->_item attributedText];
    [(UILabel *)self->_messageLabel setAttributedText:v6];
  }
  else
  {
    [(UILabel *)self->_messageLabel setAttributedText:0];
  }

  uint64_t v7 = [(TopBannerItem *)self->_item buttonText];
  id v8 = [v7 length];

  if (v8)
  {
    button = self->_button;
    if (!button)
    {
      v10 = [(TopBannerItemView *)self traitCollection];
      BOOL v11 = [v10 userInterfaceIdiom] != (id)5;

      v12 = +[UIButton buttonWithType:v11];
      v13 = self->_button;
      self->_button = v12;

      [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIButton *)self->_button addTarget:self action:"_buttonTapped:" forControlEvents:64];
      LODWORD(v14) = 1148829696;
      [(UIButton *)self->_button setContentHuggingPriority:0 forAxis:v14];
      v15 = [(UIButton *)self->_button titleLabel];
      +[DynamicTypeWizard autorefreshLabel:v15 withFontProvider:&stru_101321340];

      button = self->_button;
    }
    if (([(UIButton *)button isDescendantOfView:self] & 1) == 0) {
      [(TopBannerItemView *)self addSubview:self->_button];
    }
    int64_t v16 = [(TopBannerItem *)self->_item layout];
    if (v16 == 1)
    {
      if (!self->_messageLabelToButtonConstraint)
      {
        v30 = [(UILabel *)self->_messageLabel lastBaselineAnchor];
        v31 = [(UIButton *)self->_button firstBaselineAnchor];
        v32 = [v30 constraintEqualToAnchor:v31];
        v33 = +[DynamicTypeWizard autoscaledConstraint:v32 constant:&stru_1012FED80 withFontProvider:-19.0];
        messageLabelToButtonConstraint = self->_messageLabelToButtonConstraint;
        self->_messageLabelToButtonConstraint = v33;
      }
      v43 = [(UIButton *)self->_button leadingAnchor];
      v46 = [(UILabel *)self->_messageLabel leadingAnchor];
      v45 = [v43 constraintEqualToAnchor:];
      v47[0] = v45;
      v35 = [(UILabel *)self->_messageLabel trailingAnchor];
      uint64_t v42 = [(TopBannerItemView *)self trailingAnchor];
      v44 = v35;
      v24 = [v35 constraintEqualToAnchor:v42 constant:7.0];
      v47[1] = v24;
      v25 = [(TopBannerItemView *)self bottomAnchor];
      v26 = [(UIButton *)self->_button lastBaselineAnchor];
      v27 = [v25 constraintGreaterThanOrEqualToAnchor:v26];
      v36 = +[DynamicTypeWizard autoscaledConstraint:v27 constant:&stru_1012FED80 withFontProvider:11.0];
      v37 = self->_messageLabelToButtonConstraint;
      v23 = (void *)v42;
      v47[2] = v36;
      v47[3] = v37;
      v47[4] = self->_messageLabelToTrailingConstraint;
      v29 = +[NSArray arrayWithObjects:v47 count:5];

      v21 = v43;
    }
    else
    {
      if (v16)
      {
LABEL_22:
        v38 = self->_button;
        v39 = [(TopBannerItem *)self->_item buttonText];
        [(UIButton *)v38 setTitle:v39 forState:0];

        goto LABEL_23;
      }
      if (!self->_messageLabelToButtonConstraint)
      {
        v17 = [(UILabel *)self->_messageLabel trailingAnchor];
        v18 = [(UIButton *)self->_button leadingAnchor];
        v19 = [v17 constraintEqualToAnchor:v18 constant:-7.0];
        v20 = self->_messageLabelToButtonConstraint;
        self->_messageLabelToButtonConstraint = v19;
      }
      [(NSLayoutConstraint *)self->_messageLabelToTrailingConstraint setActive:0];
      v21 = [(UIButton *)self->_button trailingAnchor];
      v46 = [(TopBannerItemView *)self trailingAnchor];
      v45 = [v21 constraintEqualToAnchor:-9.0];
      v48[0] = v45;
      v22 = [(UIButton *)self->_button firstBaselineAnchor];
      v23 = [(UILabel *)self->_messageLabel firstBaselineAnchor];
      v44 = v22;
      v24 = [v22 constraintEqualToAnchor:v23];
      v48[1] = v24;
      v25 = [(TopBannerItemView *)self bottomAnchor];
      v26 = [(UIButton *)self->_button lastBaselineAnchor];
      v27 = [v25 constraintGreaterThanOrEqualToAnchor:v26 constant:11.0];
      v28 = self->_messageLabelToButtonConstraint;
      v48[2] = v27;
      v48[3] = v28;
      v29 = +[NSArray arrayWithObjects:v48 count:4];
    }

    +[NSLayoutConstraint activateConstraints:v29];
    goto LABEL_22;
  }
  [(NSLayoutConstraint *)self->_messageLabelToTrailingConstraint setActive:1];
  [(UIButton *)self->_button removeFromSuperview];
LABEL_23:
  item = self->_item;
  v41 = NSStringFromSelector("artwork");
  [(TopBannerItem *)item addObserver:self forKeyPath:v41 options:0 context:off_1015F1B20];

  [(TopBannerItemView *)self updateBadgeView];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  NSStringFromSelector("artwork");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = off_1015F1B20;

  if (v9 == a6 && v11 == v8) {
    [(TopBannerItemView *)self updateBadgeView];
  }
}

- (void)_deregisterObservers
{
  NSStringFromSelector("artwork");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(TopBannerItem *)self->_item removeObserver:self forKeyPath:v3 context:off_1015F1B20];
}

- (BOOL)isFirstItemWithIcon
{
  return self->_firstItemWithIcon;
}

- (TopBannerItem)item
{
  return self->_item;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (MKArtworkImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_messageLabelToButtonConstraint, 0);
  objc_storeStrong((id *)&self->_messageLabelToTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_badgeViewToMessageLabelConstraint, 0);

  objc_storeStrong((id *)&self->_badgeViewWidthConstraint, 0);
}

@end