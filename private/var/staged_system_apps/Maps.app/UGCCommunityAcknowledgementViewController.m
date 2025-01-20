@interface UGCCommunityAcknowledgementViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (MacFooterView)footerView;
- (NSTimer)dismissTimer;
- (UGCCommunityAcknowledgementOptions)options;
- (UGCCommunityAcknowledgementViewController)initWithOptions:(id)a3 completion:(id)a4;
- (id)completion;
- (int)analyticTarget;
- (void)_addFooterView;
- (void)_cancelDismissTimer;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateLayoutForCurrentContentSize;
- (void)done;
- (void)macFooterViewBackButtonTapped:(id)a3;
- (void)macFooterViewLeftButtonTapped:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDismissTimer:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setOptions:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation UGCCommunityAcknowledgementViewController

- (UGCCommunityAcknowledgementViewController)initWithOptions:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UGCCommunityAcknowledgementViewController;
  v9 = [(UGCCommunityAcknowledgementViewController *)&v14 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_options, a3);
    id v11 = [v8 copy];
    id completion = v10->_completion;
    v10->_id completion = v11;
  }
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UGCCommunityAcknowledgementViewController;
  [(UGCCommunityAcknowledgementViewController *)&v14 viewDidAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"RAPAcknowledgementViewControllerDidAppearNotification" object:self];

  if ([(UGCCommunityAcknowledgementOptions *)self->_options shouldDismissAutomatically])
  {
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, self);
      [(UGCCommunityAcknowledgementViewController *)self _cancelDismissTimer];
      [(UGCCommunityAcknowledgementOptions *)self->_options timeToAutomaticDismissal];
      double v6 = v5;
      id v8 = _NSConcreteStackBlock;
      uint64_t v9 = 3221225472;
      v10 = sub_10087EFA4;
      id v11 = &unk_1012E73C8;
      objc_copyWeak(&v12, &location);
      id v7 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v8 block:v6];
      -[UGCCommunityAcknowledgementViewController setDismissTimer:](self, "setDismissTimer:", v7, v8, v9, v10, v11);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)UGCCommunityAcknowledgementViewController;
  [(UGCCommunityAcknowledgementViewController *)&v9 viewDidLoad];
  [(UGCCommunityAcknowledgementViewController *)self _setupViews];
  [(UGCCommunityAcknowledgementViewController *)self _setupConstraints];
  v3 = [(UGCCommunityAcknowledgementViewController *)self navigationItem];
  [v3 setHidesBackButton:1];

  id v4 = objc_alloc((Class)UIBarButtonItem);
  double v5 = +[NSBundle mainBundle];
  double v6 = [v5 localizedStringForKey:@"Done" value:@"localized string not found" table:0];
  id v7 = [v4 initWithTitle:v6 style:2 target:self action:"done"];
  id v8 = [(UGCCommunityAcknowledgementViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  if ([(UGCCommunityAcknowledgementOptions *)self->_options acknowledgementOptionsType] == (id)1) {
    +[GEOAPPortal captureUserAction:21 target:66 value:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UGCCommunityAcknowledgementViewController;
  id v4 = a3;
  [(UGCCommunityAcknowledgementViewController *)&v9 traitCollectionDidChange:v4];
  double v5 = [(UGCCommunityAcknowledgementViewController *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  int IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);
  id v8 = [v4 preferredContentSizeCategory];

  LODWORD(v4) = UIContentSizeCategoryIsAccessibilityCategory(v8);
  if (IsAccessibilityCategory != v4) {
    [(UGCCommunityAcknowledgementViewController *)self _updateLayoutForCurrentContentSize];
  }
}

- (void)_setupViews
{
  v3 = +[MapsTheme visualEffectViewAllowingBlur:1];
  blurView = self->_blurView;
  self->_blurView = v3;

  double v5 = [(UGCCommunityAcknowledgementViewController *)self view];
  [v5 addSubview:self->_blurView];

  id v6 = objc_alloc((Class)UIScrollView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
  scrollView = self->_scrollView;
  self->_scrollView = v10;

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = [(UGCCommunityAcknowledgementViewController *)self view];
  [v12 addSubview:self->_scrollView];

  v13 = [objc_alloc((Class)MUStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
  stackView = self->_stackView;
  self->_stackView = v13;

  [(MUStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUStackView *)self->_stackView setAxis:1];
  [(MUStackView *)self->_stackView setAlignment:3];
  [(UIScrollView *)self->_scrollView addSubview:self->_stackView];
  id v43 = +[UIImage imageNamed:@"RAPMapIcon"];
  v15 = -[PersonalizedImageView initWithMainImage:mainImageSize:userImageDiameter:userImageExtensionPastMainImage:]([PersonalizedImageView alloc], "initWithMainImage:mainImageSize:userImageDiameter:userImageExtensionPastMainImage:", v43, 100.0, 100.0, 44.0, 10.0);
  personalizedMapIconView = self->_personalizedMapIconView;
  self->_personalizedMapIconView = v15;

  [(PersonalizedImageView *)self->_personalizedMapIconView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUStackView *)self->_stackView addArrangedSubview:self->_personalizedMapIconView withCustomSpacing:20.0];
  v17 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v17;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  v19 = [(UGCCommunityAcknowledgementOptions *)self->_options title];
  [(UILabel *)self->_titleLabel setText:v19];

  v20 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v20];

  +[DynamicTypeWizard autorefreshLabel:self->_titleLabel withFontProvider:&stru_101321460];
  [(MUStackView *)self->_stackView addArrangedSubview:self->_titleLabel withCustomSpacing:4.0];
  v21 = (UILabel *)objc_alloc_init((Class)UILabel);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v21;

  [(UILabel *)self->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_messageLabel setNumberOfLines:0];
  [(UILabel *)self->_messageLabel setTextAlignment:1];
  v23 = [(UGCCommunityAcknowledgementOptions *)self->_options message];
  [(UILabel *)self->_messageLabel setText:v23];

  v24 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_messageLabel setTextColor:v24];

  if (sub_1000BBB44(self) == 5) {
    v25 = &stru_101321300;
  }
  else {
    v25 = &stru_101321340;
  }
  +[DynamicTypeWizard autorefreshLabel:self->_messageLabel withFontProvider:v25];
  [(MUStackView *)self->_stackView addArrangedSubview:self->_messageLabel];
  id v26 = +[GEOPlatform sharedPlatform];
  if ([v26 isInternalInstall]
    && GEOConfigGetBOOL()
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unsigned int v27 = [(UGCCommunityAcknowledgementOptions *)self->_options showsInternalStatusLink];

    if (!v27) {
      goto LABEL_10;
    }
    v28 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    internalUILabel = self->_internalUILabel;
    self->_internalUILabel = v28;

    [self->_internalUILabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v30 = +[UIColor secondaryLabelColor];
    [self->_internalUILabel setTextColor:v30];

    [self->_internalUILabel setNumberOfLines:0];
    v31 = +[UIFont system12Bold];
    [self->_internalUILabel setFont:v31];

    [self->_internalUILabel setText:@"INTERNAL UI ONLY"];
    v32 = [objc_alloc((Class)UITextView) initWithFrame:CGRectZero.origin.x, y, width, height];
    linkTextView = self->_linkTextView;
    self->_linkTextView = v32;

    [(UITextView *)self->_linkTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = +[UIColor clearColor];
    [(UITextView *)self->_linkTextView setBackgroundColor:v34];

    [(UITextView *)self->_linkTextView setTextAlignment:1];
    [(UITextView *)self->_linkTextView setDataDetectorTypes:2];
    [(UITextView *)self->_linkTextView setUserInteractionEnabled:1];
    [(UITextView *)self->_linkTextView setSelectable:1];
    [(UITextView *)self->_linkTextView setEditable:0];
    [(UITextView *)self->_linkTextView setScrollEnabled:0];
    id v26 = [objc_alloc((Class)NSMutableAttributedString) initWithString:@"View internal report status" attributes:0];
    v35 = +[NSURL URLWithString:@"https://feedback.geo.apple.com"];
    [v26 addAttribute:NSLinkAttributeName value:v35 range:0, [v26 length]];

    v36 = +[UIFont system15];
    [v26 addAttribute:NSFontAttributeName value:v36 range:0, [v26 length]];

    [(UITextView *)self->_linkTextView setAttributedText:v26];
    [(MUStackView *)self->_stackView setCustomSpacing:self->_messageLabel afterView:20.0];
    [(MUStackView *)self->_stackView addArrangedSubview:self->_internalUILabel];
    [(MUStackView *)self->_stackView addArrangedSubview:self->_linkTextView];
  }

LABEL_10:
  v37 = [(UGCCommunityAcknowledgementOptions *)self->_options primaryButtonTitle];
  id v38 = [v37 length];

  if (v38)
  {
    v39 = +[MapsThemeButton buttonWithType:0];
    primaryButton = self->_primaryButton;
    self->_primaryButton = v39;

    [(MapsThemeButton *)self->_primaryButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsThemeButton *)self->_primaryButton setTitleColorProvider:&stru_1012FE688];
    [(MapsThemeButton *)self->_primaryButton addTarget:self action:"done" forControlEvents:64];
    v41 = self->_primaryButton;
    v42 = [(UGCCommunityAcknowledgementOptions *)self->_options primaryButtonTitle];
    [(MapsThemeButton *)v41 setTitle:v42 forState:0];

    [(MUStackView *)self->_stackView addArrangedSubview:self->_primaryButton];
  }
}

- (void)_setupConstraints
{
  id v3 = objc_alloc((Class)MUEdgeLayout);
  blurView = self->_blurView;
  double v5 = [(UGCCommunityAcknowledgementViewController *)self view];
  id v6 = [v3 initWithItem:blurView container:v5];
  id v58 = v6;
  id v7 = +[NSArray arrayWithObjects:&v58 count:1];
  +[NSLayoutConstraint _mapsui_activateLayouts:v7];

  v55 = [(UIScrollView *)self->_scrollView topAnchor];
  v56 = [(UGCCommunityAcknowledgementViewController *)self view];
  v54 = [v56 safeAreaLayoutGuide];
  v53 = [v54 topAnchor];
  v52 = [v55 constraintEqualToAnchor:v53];
  v57[0] = v52;
  v50 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v51 = [(UGCCommunityAcknowledgementViewController *)self view];
  v49 = [v51 leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v57[1] = v48;
  v46 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v47 = [(UGCCommunityAcknowledgementViewController *)self view];
  v45 = [v47 trailingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v57[2] = v44;
  v42 = [(UIScrollView *)self->_scrollView bottomAnchor];
  id v43 = [(UGCCommunityAcknowledgementViewController *)self view];
  v41 = [v43 bottomAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v57[3] = v40;
  v39 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v37 = [v39 heightAnchor];
  id v38 = [(UIScrollView *)self->_scrollView frameLayoutGuide];
  v36 = [v38 heightAnchor];
  v35 = [v37 constraintGreaterThanOrEqualToAnchor:v36];
  v57[4] = v35;
  v33 = [(MUStackView *)self->_stackView centerYAnchor];
  v34 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v32 = [v34 centerYAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v57[5] = v31;
  v29 = [(MUStackView *)self->_stackView topAnchor];
  v30 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v28 = [v30 topAnchor];
  unsigned int v27 = [v29 constraintGreaterThanOrEqualToAnchor:v28];
  v57[6] = v27;
  v25 = [(MUStackView *)self->_stackView bottomAnchor];
  id v26 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v24 = [v26 bottomAnchor];
  v23 = [v25 constraintLessThanOrEqualToAnchor:v24];
  v57[7] = v23;
  v22 = [(MUStackView *)self->_stackView centerXAnchor];
  id v8 = [(UIScrollView *)self->_scrollView centerXAnchor];
  objc_super v9 = [v22 constraintEqualToAnchor:v8];
  v57[8] = v9;
  v10 = [(MUStackView *)self->_stackView leadingAnchor];
  id v11 = [(UIScrollView *)self->_scrollView leadingAnchor];
  id v12 = [v10 constraintGreaterThanOrEqualToAnchor:v11 constant:16.0];
  v57[9] = v12;
  v13 = [(MUStackView *)self->_stackView trailingAnchor];
  objc_super v14 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v15 = [v13 constraintLessThanOrEqualToAnchor:v14 constant:-16.0];
  v57[10] = v15;
  v16 = +[NSArray arrayWithObjects:v57 count:11];
  +[NSLayoutConstraint activateConstraints:v16];

  id v17 = objc_alloc((Class)MUSizeLayout);
  stackView = self->_stackView;
  +[MUSizeLayout useIntrinsicContentSize];
  v20 = [v17 initWithItem:stackView size:240.0 v19];
  stackSizeLayout = self->_stackSizeLayout;
  self->_stackSizeLayout = v20;

  [(UGCCommunityAcknowledgementViewController *)self _updateLayoutForCurrentContentSize];
}

- (void)_updateLayoutForCurrentContentSize
{
  id v3 = [(UGCCommunityAcknowledgementViewController *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    stackSizeLayout = self->_stackSizeLayout;
    id v6 = +[NSArray arrayWithObjects:&stackSizeLayout count:1];
    +[NSLayoutConstraint _mapsui_deactivateLayouts:v6];
  }
  else
  {
    id v7 = self->_stackSizeLayout;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    +[NSLayoutConstraint _mapsui_activateLayouts:v6];
  }
}

- (void)_addFooterView
{
  id v3 = [[MacFooterView alloc] initWithNoBlurRightSideButtonsOfType:8];
  [(UGCCommunityAcknowledgementViewController *)self setFooterView:v3];

  id v4 = [(UGCCommunityAcknowledgementViewController *)self footerView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v5 = [(UGCCommunityAcknowledgementViewController *)self footerView];
  [v5 setDelegate:self];

  id v6 = [(UGCCommunityAcknowledgementViewController *)self view];
  id v7 = [(UGCCommunityAcknowledgementViewController *)self footerView];
  [v6 addSubview:v7];

  unsigned int v27 = [(UGCCommunityAcknowledgementViewController *)self footerView];
  id v26 = [v27 topAnchor];
  v25 = [(MUStackView *)self->_stackView bottomAnchor];
  v24 = [v26 constraintGreaterThanOrEqualToAnchor:v25];
  v28[0] = v24;
  v23 = [(UGCCommunityAcknowledgementViewController *)self footerView];
  v21 = [v23 leadingAnchor];
  v22 = [(UGCCommunityAcknowledgementViewController *)self view];
  v20 = [v22 leadingAnchor];
  double v19 = [v21 constraintEqualToAnchor:v20];
  v28[1] = v19;
  v18 = [(UGCCommunityAcknowledgementViewController *)self footerView];
  id v8 = [v18 trailingAnchor];
  objc_super v9 = [(UGCCommunityAcknowledgementViewController *)self view];
  v10 = [v9 trailingAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  v28[2] = v11;
  id v12 = [(UGCCommunityAcknowledgementViewController *)self footerView];
  v13 = [v12 bottomAnchor];
  objc_super v14 = [(UGCCommunityAcknowledgementViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v28[3] = v16;
  id v17 = +[NSArray arrayWithObjects:v28 count:4];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)_cancelDismissTimer
{
  id v3 = [(UGCCommunityAcknowledgementViewController *)self dismissTimer];
  [v3 invalidate];

  [(UGCCommunityAcknowledgementViewController *)self setDismissTimer:0];
}

- (void)done
{
  if (!self->_didRunCompletion)
  {
    self->_didRunCompletion = 1;
    [(UGCCommunityAcknowledgementViewController *)self _cancelDismissTimer];
    if ([(UGCCommunityAcknowledgementOptions *)self->_options acknowledgementOptionsType] == (id)1)
    {
      +[GEOAPPortal captureUserAction:4 target:66 value:0];
    }
    else
    {
      id v3 = +[MKMapService sharedService];
      [v3 captureUserAction:10110 onTarget:[self analyticTarget] eventValue:0];
    }
    id v4 = [(UGCCommunityAcknowledgementViewController *)self completion];

    if (v4)
    {
      double v5 = [(UGCCommunityAcknowledgementViewController *)self completion];
      v5[2]();
    }
  }
}

- (int)analyticTarget
{
  return 1137;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 1;
}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
}

- (void)macFooterViewBackButtonTapped:(id)a3
{
  id v4 = [(UGCCommunityAcknowledgementViewController *)self navigationController];
  id v3 = [v4 popViewControllerAnimated:1];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (UGCCommunityAcknowledgementOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (MacFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (NSTimer)dismissTimer
{
  return self->_dismissTimer;
}

- (void)setDismissTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_stackSizeLayout, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_linkTextView, 0);
  objc_storeStrong((id *)&self->_internalUILabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_personalizedMapIconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end