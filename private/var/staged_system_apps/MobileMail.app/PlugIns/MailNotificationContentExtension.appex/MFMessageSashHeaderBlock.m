@interface MFMessageSashHeaderBlock
+ (double)heightForCurrentFontMetrics;
+ (id)titleFont;
- (BOOL)shouldShowMailbox;
- (MFMailAccountsProvider)accountsProvider;
- (MFMessageSashHeaderBlock)initWithCoder:(id)a3;
- (MFMessageSashHeaderBlock)initWithFrame:(CGRect)a3;
- (MFMessageSashHeaderBlock)initWithFrame:(CGRect)a3 accountsProvider:(id)a4;
- (NSLayoutConstraint)iconVerticalConstraint;
- (NSLayoutConstraint)titleLabelBottom;
- (NSLayoutConstraint)titleLabelTop;
- (UIImageView)iconImageView;
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (void)_updateFonts;
- (void)_updateMailboxIcon;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)createPrimaryViews;
- (void)displayMessageUsingViewModel:(id)a3;
- (void)initializePrimaryLayoutConstraints;
- (void)setAccountsProvider:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setIconVerticalConstraint:(id)a3;
- (void)setSeparatorDrawsFlushWithLeadingEdge:(BOOL)a3;
- (void)setSeparatorDrawsFlushWithTrailingEdge:(BOOL)a3;
- (void)setShouldShowMailbox:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelBottom:(id)a3;
- (void)setTitleLabelTop:(id)a3;
- (void)updateConstraints;
@end

@implementation MFMessageSashHeaderBlock

- (MFMessageSashHeaderBlock)initWithFrame:(CGRect)a3
{
}

- (MFMessageSashHeaderBlock)initWithCoder:(id)a3
{
  id v5 = a3;
  [(MFMessageSashHeaderBlock *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFMessageSashHeaderBlock initWithCoder:]", "MFMessageSashHeaderBlock.m", 63, "0");
}

- (MFMessageSashHeaderBlock)initWithFrame:(CGRect)a3 accountsProvider:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MFMessageSashHeaderBlock;
  v11 = -[MFMessageSashHeaderBlock initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountsProvider, a4);
    [(MFMessageSashHeaderBlock *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = +[UIColor clearColor];
    [(MFMessageSashHeaderBlock *)v12 setBackgroundColor:v13];

    [(MFMessageSashHeaderBlock *)v12 setSeparatorDrawsFlushWithLeadingEdge:1];
    [(MFMessageSashHeaderBlock *)v12 setSeparatorDrawsFlushWithTrailingEdge:1];
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v12 selector:"_fontMetricCacheDidInvalidate:" name:MFFontMetricCacheInvalidationNotification object:0];
  }
  return v12;
}

- (void)setSeparatorDrawsFlushWithLeadingEdge:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageSashHeaderBlock;
  [(MFMessageSashHeaderBlock *)&v3 setSeparatorDrawsFlushWithLeadingEdge:1];
}

- (void)setSeparatorDrawsFlushWithTrailingEdge:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageSashHeaderBlock;
  [(MFMessageSashHeaderBlock *)&v3 setSeparatorDrawsFlushWithTrailingEdge:1];
}

+ (id)titleFont
{
  v2 = +[UIFontDescriptor _preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote weight:UIFontWeightBold];
  objc_super v3 = +[MFFontMetricCache sharedFontMetricCache];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001AA2C;
  v7[3] = &unk_10003D218;
  id v4 = v2;
  id v8 = v4;
  id v5 = [v3 cachedFont:v7 forKey:@"messageSashHeaderBlock.titleFont"];

  return v5;
}

+ (double)heightForCurrentFontMetrics
{
  objc_super v3 = +[MFFontMetricCache sharedFontMetricCache];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001AB68;
  v11[3] = &unk_10003D238;
  v11[4] = a1;
  [v3 cachedFloat:v11 forKey:@"messageSashHeaderBlock.titleLabel.top"];
  double v5 = v4;

  v6 = +[MFFontMetricCache sharedFontMetricCache];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001ABC0;
  v10[3] = &unk_10003D238;
  v10[4] = a1;
  [v6 cachedFloat:v10 forKey:@"messageSashHeaderBlock.titleLabel.bottom"];
  double v8 = v7;

  return v5 + v8;
}

- (void)createPrimaryViews
{
  v27.receiver = self;
  v27.super_class = (Class)MFMessageSashHeaderBlock;
  [(MFMessageSashHeaderBlock *)&v27 createPrimaryViews];
  [(MFMessageSashHeaderBlock *)self setSeparatorIsHidden:1];
  id v3 = objc_alloc((Class)UIView);
  [(MFMessageSashHeaderBlock *)self bounds];
  id v4 = [v3 initWithFrame:];
  [(MFMessageSashHeaderBlock *)self setBackgroundView:v4];

  double v5 = +[UIColor tertiarySystemFillColor];
  v6 = [(MFMessageSashHeaderBlock *)self backgroundView];
  [v6 setBackgroundColor:v5];

  double v7 = [(MFMessageSashHeaderBlock *)self backgroundView];
  [v7 setAutoresizingMask:18];

  double v8 = [(MFMessageSashHeaderBlock *)self layer];
  [v8 setAllowsGroupBlending:0];

  v9 = [(MFMessageSashHeaderBlock *)self backgroundView];
  [(MFMessageSashHeaderBlock *)self addSubview:v9];

  id v10 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v14 = [v10 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(MFMessageSashHeaderBlock *)self setTitleLabel:v14];

  v15 = [(MFMessageSashHeaderBlock *)self titleLabel];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v16 = [UIApp preferredContentSizeCategory];
  LODWORD(v6) = UIContentSizeCategoryIsAccessibilityCategory(v16);

  v17 = [(MFMessageSashHeaderBlock *)self titleLabel];
  [v17 setNumberOfLines:v6 ^ 1];

  v18 = [(MFMessageSashHeaderBlock *)self titleLabel];
  [v18 setAdjustsFontForContentSizeCategory:1];

  v19 = +[UIColor secondaryLabelColor];
  v20 = [(MFMessageSashHeaderBlock *)self titleLabel];
  [v20 setTextColor:v19];

  v21 = [(MFMessageSashHeaderBlock *)self titleLabel];
  [(MFMessageSashHeaderBlock *)self addSubview:v21];

  id v22 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(MFMessageSashHeaderBlock *)self setIconImageView:v22];

  v23 = [(MFMessageSashHeaderBlock *)self iconImageView];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  v24 = [(MFMessageSashHeaderBlock *)self iconImageView];
  [v24 setContentMode:4];

  v25 = [(MFMessageSashHeaderBlock *)self iconImageView];
  [(MFMessageSashHeaderBlock *)self addSubview:v25];

  v26 = +[NSNotificationCenter defaultCenter];
  [v26 addObserver:self selector:"contentSizeCategoryDidChangeNotification:" name:UIContentSizeCategoryDidChangeNotification object:0];

  [(MFMessageSashHeaderBlock *)self _updateFonts];
  [(MFMessageSashHeaderBlock *)self setAccessibilityIdentifier:MSAccessibilityIdentifierMailConversationViewSashHeader];
}

- (void)initializePrimaryLayoutConstraints
{
  v48.receiver = self;
  v48.super_class = (Class)MFMessageSashHeaderBlock;
  [(MFMessageSashHeaderBlock *)&v48 initializePrimaryLayoutConstraints];
  v45 = [(MFMessageSashHeaderBlock *)self titleLabel];
  id v3 = [v45 firstBaselineAnchor];
  id v4 = [(MFMessageSashHeaderBlock *)self topAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4];
  [(MFMessageSashHeaderBlock *)self setTitleLabelTop:v5];

  v46 = [(MFMessageSashHeaderBlock *)self bottomAnchor];
  v6 = [(MFMessageSashHeaderBlock *)self titleLabel];
  double v7 = [v6 lastBaselineAnchor];
  double v8 = [v46 constraintEqualToAnchor:v7];
  [(MFMessageSashHeaderBlock *)self setTitleLabelBottom:v8];

  v9 = [(MFMessageSashHeaderBlock *)self titleLabel];
  id v10 = [v9 leadingAnchor];
  v11 = [(MFMessageSashHeaderBlock *)self layoutMarginsGuide];
  v12 = [v11 leadingAnchor];
  v47 = [v10 constraintEqualToAnchor:v12];

  v13 = [(MFMessageSashHeaderBlock *)self iconImageView];
  id v14 = [v13 centerYAnchor];
  v15 = [(MFMessageSashHeaderBlock *)self titleLabel];
  objc_super v16 = [v15 firstBaselineAnchor];
  v17 = [(MFMessageSashHeaderBlock *)self titleLabel];
  v18 = [v17 font];
  [v18 capHeight];
  v20 = [v14 constraintEqualToAnchor:v16 constant:v19 * -0.5];
  [(MFMessageSashHeaderBlock *)self setIconVerticalConstraint:v20];

  id v21 = objc_alloc((Class)NSMutableArray);
  v50[0] = v47;
  v42 = [(MFMessageSashHeaderBlock *)self titleLabelTop];
  v50[1] = v42;
  v41 = [(MFMessageSashHeaderBlock *)self iconVerticalConstraint];
  v50[2] = v41;
  id v22 = [(MFMessageSashHeaderBlock *)self iconImageView];
  v23 = [v22 widthAnchor];
  v24 = [v23 constraintEqualToConstant:22.0];
  v50[3] = v24;
  v25 = [(MFMessageSashHeaderBlock *)self iconImageView];
  v26 = [v25 heightAnchor];
  objc_super v27 = [v26 constraintEqualToConstant:22.0];
  v50[4] = v27;
  v28 = [(MFMessageSashHeaderBlock *)self titleLabelBottom];
  v50[5] = v28;
  v29 = +[NSArray arrayWithObjects:v50 count:6];
  id v44 = [v21 initWithArray:v29];

  v43 = [(MFMessageSashHeaderBlock *)self iconImageView];
  v30 = [v43 centerXAnchor];
  v31 = [(MFMessageSashHeaderBlock *)self trailingAccessoryViewLayoutGuide];
  v32 = [v31 centerXAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  v49[0] = v33;
  v34 = [(MFMessageSashHeaderBlock *)self titleLabel];
  v35 = [v34 trailingAnchor];
  v36 = [(MFMessageSashHeaderBlock *)self iconImageView];
  v37 = [v36 leadingAnchor];
  v38 = [v35 constraintLessThanOrEqualToAnchor:v37 constant:-14.0];
  v49[1] = v38;
  v39 = +[NSArray arrayWithObjects:v49 count:2];
  [v44 addObjectsFromArray:v39];

  id v40 = [v44 copy];
  +[NSLayoutConstraint activateConstraints:v40];
}

- (void)updateConstraints
{
  v24.receiver = self;
  v24.super_class = (Class)MFMessageSashHeaderBlock;
  [(MFMessageSashHeaderBlock *)&v24 updateConstraints];
  id v3 = [(MFMessageSashHeaderBlock *)self titleLabel];
  id v4 = [v3 text];
  id v5 = [v4 length];

  v6 = [(MFMessageSashHeaderBlock *)self titleLabelTop];
  v25[0] = v6;
  double v7 = [(MFMessageSashHeaderBlock *)self titleLabelBottom];
  v25[1] = v7;
  double v8 = +[NSArray arrayWithObjects:v25 count:2];

  if (v5)
  {
    +[NSLayoutConstraint activateConstraints:v8];
    v9 = +[MFFontMetricCache sharedFontMetricCache];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001B94C;
    v23[3] = &unk_10003D260;
    v23[4] = self;
    [v9 cachedFloat:v23 forKey:@"messageSashHeaderBlock.titleLabel.top"];
    double v11 = v10;
    v12 = [(MFMessageSashHeaderBlock *)self titleLabelTop];
    [v12 setConstant:v11];

    v13 = +[MFFontMetricCache sharedFontMetricCache];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001B9A8;
    v22[3] = &unk_10003D260;
    v22[4] = self;
    [v13 cachedFloat:v22 forKey:@"messageSashHeaderBlock.titleLabel.bottom"];
    double v15 = v14;
    objc_super v16 = [(MFMessageSashHeaderBlock *)self titleLabelBottom];
    [v16 setConstant:v15];
  }
  else
  {
    +[NSLayoutConstraint deactivateConstraints:v8];
  }
  v17 = [(MFMessageSashHeaderBlock *)self titleLabel];
  v18 = [v17 font];
  [v18 capHeight];
  double v20 = v19;
  id v21 = [(MFMessageSashHeaderBlock *)self iconVerticalConstraint];
  [v21 setConstant:v20 * -0.5];
}

- (void)setDisplayMetrics:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFMessageSashHeaderBlock;
  [(MFMessageSashHeaderBlock *)&v6 setDisplayMetrics:v4];
  id v5 = [(MFMessageSashHeaderBlock *)self displayMetrics];

  if (v5) {
    [(MFMessageSashHeaderBlock *)self _updateMailboxIcon];
  }
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  [UIApp preferredContentSizeCategory:a3];
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v5);

  id v6 = [(MFMessageSashHeaderBlock *)self titleLabel];
  [v6 setNumberOfLines:!IsAccessibilityCategory];
}

- (void)_updateFonts
{
  id v4 = [(id)objc_opt_class() titleFont];
  id v3 = [(MFMessageSashHeaderBlock *)self titleLabel];
  [v3 setFont:v4];
}

- (void)_updateMailboxIcon
{
  id v7 = [(MFMessageSashHeaderBlock *)self viewModel];
  id v3 = [v7 mailbox];
  id v4 = [v3 tinyDisplayIconWithColor:0];
  id v5 = [(MFMessageSashHeaderBlock *)self iconImageView];
  [v5 setImage:v4];

  id v8 = +[UIColor mailSubtitleGrayColor];
  id v6 = [(MFMessageSashHeaderBlock *)self iconImageView];
  [v6 setTintColor:v8];
}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFMessageSashHeaderBlock;
  [(MFMessageSashHeaderBlock *)&v12 displayMessageUsingViewModel:v4];
  if ([(MFMessageSashHeaderBlock *)self shouldShowMailbox])
  {
    id v5 = [(MFMessageSashHeaderBlock *)self viewModel];
    id v6 = [v5 mailbox];
    id v7 = [(MFMessageSashHeaderBlock *)self accountsProvider];
    id v8 = [v6 foundInDescriptionIncludingAccount:[v7 isDisplayingMultipleAccounts]];
    v9 = [(MFMessageSashHeaderBlock *)self titleLabel];
    [v9 setText:v8];

    double v10 = [(MFMessageSashHeaderBlock *)self iconImageView];
    [v10 setAlpha:1.0];

    [(MFMessageSashHeaderBlock *)self _updateMailboxIcon];
  }
  else
  {
    double v11 = [(MFMessageSashHeaderBlock *)self iconImageView];
    [v11 setAlpha:0.0];
  }
  [(MFMessageSashHeaderBlock *)self setNeedsUpdateConstraints];
}

- (BOOL)shouldShowMailbox
{
  return self->_shouldShowMailbox;
}

- (void)setShouldShowMailbox:(BOOL)a3
{
  self->_shouldShowMailbodouble x = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTop
{
  return self->_titleLabelTop;
}

- (void)setTitleLabelTop:(id)a3
{
}

- (NSLayoutConstraint)titleLabelBottom
{
  return self->_titleLabelBottom;
}

- (void)setTitleLabelBottom:(id)a3
{
}

- (NSLayoutConstraint)iconVerticalConstraint
{
  return self->_iconVerticalConstraint;
}

- (void)setIconVerticalConstraint:(id)a3
{
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_iconVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBottom, 0);
  objc_storeStrong((id *)&self->_titleLabelTop, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end