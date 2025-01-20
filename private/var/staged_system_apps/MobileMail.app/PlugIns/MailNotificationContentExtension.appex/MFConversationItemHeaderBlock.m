@interface MFConversationItemHeaderBlock
+ (OS_os_log)log;
- (BOOL)_displayOptionsHideAvatar;
- (BOOL)_hasConversationLayout;
- (BOOL)_shouldHideAvatar;
- (BOOL)_shouldHideDetailsButton;
- (BOOL)_shouldSaveHeaderDetailsButtonSettings;
- (BOOL)_shouldUseFootnoteFontInCaptionView;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)shouldDecorateAtomListWithSMIMEStatus:(id)a3;
- (CNContactStore)contactStore;
- (EFCancelable)observableCancelable;
- (MFAvatarView)avatarView;
- (MFConversationItemHeaderBlock)initWithFrame:(CGRect)a3 contactStore:(id)a4 accountsProvider:(id)a5;
- (MFConversationItemHeaderBlockDelegate)delegate;
- (MFExpandableCaptionView)captionView;
- (MFMailAccountsProvider)accountsProvider;
- (MFMessageInfoViewController)messageInfoViewController;
- (MFModernLabelledAtomList)primaryAtomList;
- (MessageViewStatusIndicatorManager)horizontalStatusIndicatorManager;
- (MessageViewStatusIndicatorManager)statusIndicatorManager;
- (NSArray)activeTimestampLabelConstraints;
- (NSArray)avatarViewConstraints;
- (NSArray)timestampLabelConstraints;
- (NSLayoutConstraint)avatarTopConstraint;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)bottomToAvatarBottomConstraint;
- (NSLayoutConstraint)primaryStackViewLeadingConstraint;
- (NSLayoutConstraint)statusIndicatorLayoutGuideTrailingConstraint;
- (NSLayoutConstraint)topConstraint;
- (UIButton)messageInfoButton;
- (UIButton)revealActionsButton;
- (UIDateLabel)timestampLabel;
- (UILayoutGuide)statusIndicatorLayoutGuide;
- (UIStackView)primaryStackView;
- (UITapGestureRecognizer)tapRecognizer;
- (UIView)horizontalStatusIndicatorContentView;
- (UIView)placeHolderView;
- (id)_footnoteFont;
- (id)_subheadFont;
- (id)expandableCaptionView:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5;
- (id)popoverManagerForExpandableCaptionView:(id)a3;
- (id)presentingViewControllerForAvatarView:(id)a3;
- (int64_t)displayOptions;
- (void)_addMessageInfoButton;
- (void)_clearAvatarViewConstraints;
- (void)_clearTimestampRevealActionsButtonConstraints;
- (void)_configureTimestampRevealActionsButtonConstraints;
- (void)_layoutHorizontalStatusIndicators:(CGRect)a3;
- (void)_layoutStatusIndicatorsInRect:(CGRect)a3;
- (void)_primaryAddressAtomWasTapped:(id)a3;
- (void)_resetHorizontalStatusIndicatorContentViewIfNeeded;
- (void)_revealActionsButtonTapped:(id)a3;
- (void)_showMessageInfo;
- (void)_tappedHeader:(id)a3;
- (void)_updateAvatarView;
- (void)_updateDisplayedContact;
- (void)_updateFonts;
- (void)_updateHorizontalStatusIndicators:(id)a3;
- (void)_updateLabelColor;
- (void)_updateStackViewSpacing;
- (void)_updateStatusIndicators:(id)a3;
- (void)_updateStyle;
- (void)_updateSubviewConstraints;
- (void)_updateTimestampLabels;
- (void)createPrimaryViews;
- (void)displayMessageUsingViewModel:(id)a3;
- (void)expandableCaptionView:(id)a3 didTapAtom:(id)a4 forAtomType:(unint64_t)a5;
- (void)expandableCaptionView:(id)a3 willBecomeExpanded:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)expandableCaptionViewDidTapBIMILearnMore:(id)a3;
- (void)initializePrimaryLayoutConstraints;
- (void)iterateDisplayedAtomListsWithBlock:(id)a3;
- (void)layoutSubviews;
- (void)messageInfoViewController:(id)a3 didSelectAddress:(id)a4 forAtomType:(unint64_t)a5;
- (void)prepareForReuse;
- (void)setAccountsProvider:(id)a3;
- (void)setActiveTimestampLabelConstraints:(id)a3;
- (void)setAvatarTopConstraint:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setAvatarViewConstraints:(id)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setBottomToAvatarBottomConstraint:(id)a3;
- (void)setCaptionView:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setDisplayOptions:(int64_t)a3;
- (void)setHorizontalStatusIndicatorContentView:(id)a3;
- (void)setHorizontalStatusIndicatorManager:(id)a3;
- (void)setInteractivelyResizing:(BOOL)a3;
- (void)setMessageInfoButton:(id)a3;
- (void)setMessageInfoViewController:(id)a3;
- (void)setObservableCancelable:(id)a3;
- (void)setOtherSigners:(id)a3;
- (void)setPlaceHolderView:(id)a3;
- (void)setPrimaryAtomList:(id)a3;
- (void)setPrimaryStackView:(id)a3;
- (void)setPrimaryStackViewLeadingConstraint:(id)a3;
- (void)setRevealActionsButton:(id)a3;
- (void)setShowsHeaderDetails:(BOOL)a3 animated:(BOOL)a4;
- (void)setStatusIndicatorLayoutGuide:(id)a3;
- (void)setStatusIndicatorLayoutGuideTrailingConstraint:(id)a3;
- (void)setStatusIndicatorManager:(id)a3;
- (void)setTapRecognizer:(id)a3;
- (void)setTimestampLabel:(id)a3;
- (void)setTimestampLabelConstraints:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation MFConversationItemHeaderBlock

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009398;
  block[3] = &unk_10003C9E0;
  block[4] = a1;
  if (qword_1000485A0 != -1) {
    dispatch_once(&qword_1000485A0, block);
  }
  v2 = (void *)qword_100048598;

  return (OS_os_log *)v2;
}

- (MFConversationItemHeaderBlock)initWithFrame:(CGRect)a3 contactStore:(id)a4 accountsProvider:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MFConversationItemHeaderBlock;
  v13 = -[MFConversationItemHeaderBlock initWithFrame:](&v20, "initWithFrame:", x, y, width, height);
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    [(MFConversationItemHeaderBlock *)v13 setContactStore:v11];
    objc_storeStrong((id *)&v14->_accountsProvider, a5);
    v16 = +[NSUserDefaults standardUserDefaults];
    byte_1000485A8 = [v16 BOOLForKey:@"ShowMessageHeaderDetails"];

    v15->_showDetails = byte_1000485A8;
    messageInfoViewController = v15->_messageInfoViewController;
    v15->_messageInfoViewController = 0;

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v15 selector:"_fontMetricCacheDidInvalidate:" name:MFFontMetricCacheInvalidationNotification object:0];
  }
  [(MFConversationItemHeaderBlock *)v15 setAccessibilityIdentifier:MSAccessibilityIdentifierMailConversationViewHeaderBlock];

  return v15;
}

- (void)createPrimaryViews
{
  v49.receiver = self;
  v49.super_class = (Class)MFConversationItemHeaderBlock;
  [(MFConversationItemHeaderBlock *)&v49 createPrimaryViews];
  v3 = +[UIStackView mf_baselineAlignedVerticalStackView];
  [(MFConversationItemHeaderBlock *)self setPrimaryStackView:v3];

  v4 = [(MFConversationItemHeaderBlock *)self primaryStackView];
  [v4 setAlignment:1];

  v5 = [(MFConversationItemHeaderBlock *)self primaryStackView];
  [(MFConversationItemHeaderBlock *)self addSubview:v5];

  id v6 = objc_alloc((Class)UIDateLabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(MFConversationItemHeaderBlock *)self setTimestampLabel:v10];

  id v11 = [(MFConversationItemHeaderBlock *)self timestampLabel];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [(MFConversationItemHeaderBlock *)self timestampLabel];
  [v12 setAdjustsFontForContentSizeCategory:1];

  v13 = [(MFConversationItemHeaderBlock *)self timestampLabel];
  [v13 accessibilitySetIdentification:@"MessageDateLabel"];

  [(MFConversationItemHeaderBlock *)self _updateLabelColor];
  id v14 = objc_alloc((Class)MFModernLabelledAtomList);
  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"FROM_HEADER" value:&stru_10003D3F8 table:@"Main"];
  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"FROM_TITLE" value:&stru_10003D3F8 table:@"Main"];
  v19 = +[MFAddressBookManager sharedManager];
  id v20 = [v14 initWithLabel:v16 title:v18 addressBook:[v19 addressBook]];
  [(MFConversationItemHeaderBlock *)self setPrimaryAtomList:v20];

  v21 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
  [v21 setPrimary:1];

  v22 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
  [v22 setLabelVisible:0];

  v23 = [(MFConversationItemHeaderBlock *)self primaryStackView];
  v24 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
  [v23 addArrangedSubview:v24];

  v25 = -[MFExpandableCaptionView initWithFrame:]([MFExpandableCaptionView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(MFConversationItemHeaderBlock *)self setCaptionView:v25];

  v26 = [(MFConversationItemHeaderBlock *)self captionView];
  [v26 setDelegate:self];

  v27 = [(MFConversationItemHeaderBlock *)self captionView];
  [v27 setShowsTimestampWhenExpanded:1];

  v28 = [(MFConversationItemHeaderBlock *)self captionView];
  [v28 setShowsBIMIWhenExpanded:1];

  v29 = [(MFConversationItemHeaderBlock *)self primaryStackView];
  v30 = [(MFConversationItemHeaderBlock *)self captionView];
  [v29 addArrangedSubview:v30];

  if (self && _os_feature_enabled_impl()) {
    [(MFConversationItemHeaderBlock *)self _addMessageInfoButton];
  }
  +[MFMessageDisplayMetrics avatarDiameter];
  v32 = -[MFAvatarView initWithFrame:]([MFAvatarView alloc], "initWithFrame:", 0.0, 0.0, v31, v31);
  [(MFConversationItemHeaderBlock *)self setAvatarView:v32];

  v33 = [(MFConversationItemHeaderBlock *)self avatarView];
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

  v34 = [(MFConversationItemHeaderBlock *)self avatarView];
  [v34 setShowsContactOnTap:1];

  v35 = [(MFConversationItemHeaderBlock *)self avatarView];
  [v35 setDelegate:self];

  [(MFConversationItemHeaderBlock *)self _updateAvatarView];
  if ([(MFConversationItemHeaderBlock *)self usingLargeTextLayout])
  {
    v36 = [(MFConversationItemHeaderBlock *)self primaryStackView];
    v37 = [(MFConversationItemHeaderBlock *)self timestampLabel];
    [v36 addArrangedSubview:v37];
  }
  else
  {
    v38 = [(MFConversationItemHeaderBlock *)self timestampLabel];
    [(MFConversationItemHeaderBlock *)self addSubview:v38];

    v36 = [(MFConversationItemHeaderBlock *)self timestampLabel];
    v50 = v36;
    v37 = +[NSArray arrayWithObjects:&v50 count:1];
    v39 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
    [v39 setViewsToDodge:v37];
  }
  v40 = objc_alloc_init(MessageViewStatusIndicatorManager);
  [(MFConversationItemHeaderBlock *)self setStatusIndicatorManager:v40];

  v41 = [(MFConversationItemHeaderBlock *)self statusIndicatorManager];
  [v41 setHidesVIPIndicator:1];

  id v42 = objc_alloc_init((Class)UILayoutGuide);
  [(MFConversationItemHeaderBlock *)self setStatusIndicatorLayoutGuide:v42];

  v43 = [(MFConversationItemHeaderBlock *)self statusIndicatorLayoutGuide];
  [(MFConversationItemHeaderBlock *)self addLayoutGuide:v43];

  id v44 = objc_alloc_init((Class)UIView);
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MFConversationItemHeaderBlock *)self addSubview:v44];
  [(MFConversationItemHeaderBlock *)self setHorizontalStatusIndicatorContentView:v44];
  v45 = objc_alloc_init(MessageViewStatusIndicatorManager);
  [(MFConversationItemHeaderBlock *)self setHorizontalStatusIndicatorManager:v45];

  id v46 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_tappedHeader:"];
  [(MFConversationItemHeaderBlock *)self setTapRecognizer:v46];

  v47 = [(MFConversationItemHeaderBlock *)self tapRecognizer];
  [v47 setDelegate:self];

  v48 = [(MFConversationItemHeaderBlock *)self tapRecognizer];
  [(MFConversationItemHeaderBlock *)self addGestureRecognizer:v48];

  [(MFConversationItemHeaderBlock *)self _updateFonts];
}

- (void)initializePrimaryLayoutConstraints
{
  v57.receiver = self;
  v57.super_class = (Class)MFConversationItemHeaderBlock;
  [(MFConversationItemHeaderBlock *)&v57 initializePrimaryLayoutConstraints];
  v54 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
  v52 = [(MFConversationItemHeaderBlock *)self timestampLabel];
  v56 = [(MFConversationItemHeaderBlock *)self primaryStackView];
  v53 = [(MFConversationItemHeaderBlock *)self horizontalStatusIndicatorContentView];
  v55 = [(MFConversationItemHeaderBlock *)self statusIndicatorLayoutGuide];
  v3 = [v56 firstBaselineAnchor];
  v4 = [(MFConversationItemHeaderBlock *)self topAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  [(MFConversationItemHeaderBlock *)self setTopConstraint:v5];

  id v6 = [(MFConversationItemHeaderBlock *)self bottomAnchor];
  v7 = [v56 lastBaselineAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  [(MFConversationItemHeaderBlock *)self setBottomConstraint:v8];

  v9 = [v52 firstBaselineAnchor];
  id v10 = [v54 firstBaselineAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  v59[0] = v11;
  id v12 = [v52 trailingAnchor];
  v13 = [v56 trailingAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];
  v59[1] = v14;
  v15 = +[NSArray arrayWithObjects:v59 count:2];
  [(MFConversationItemHeaderBlock *)self setTimestampLabelConstraints:v15];

  v16 = [v55 trailingAnchor];
  v17 = [(MFConversationItemHeaderBlock *)self layoutMarginsGuide];
  v18 = [v17 leadingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [(MFConversationItemHeaderBlock *)self setStatusIndicatorLayoutGuideTrailingConstraint:v19];

  v45 = [(MFConversationItemHeaderBlock *)self topConstraint];
  v58[0] = v45;
  v51 = [v56 trailingAnchor];
  id v44 = [(MFConversationItemHeaderBlock *)self layoutMarginsGuide];
  v43 = [v44 trailingAnchor];
  id v42 = [v51 constraintEqualToAnchor:7.0];
  v58[1] = v42;
  v50 = [v54 trailingAnchor];
  v41 = [v56 trailingAnchor];
  v40 = [v50 constraintEqualToAnchor:];
  v58[2] = v40;
  v39 = [(MFConversationItemHeaderBlock *)self captionView];
  objc_super v49 = [v39 trailingAnchor];
  v38 = [v53 leadingAnchor];
  v37 = [v49 constraintEqualToAnchor:-16.0];
  v58[3] = v37;
  v36 = [(MFConversationItemHeaderBlock *)self bottomConstraint];
  v58[4] = v36;
  v48 = [v55 leadingAnchor];
  v35 = [(MFConversationItemHeaderBlock *)self leadingAnchor];
  v34 = [v48 constraintEqualToAnchor:];
  v58[5] = v34;
  v33 = [(MFConversationItemHeaderBlock *)self statusIndicatorLayoutGuideTrailingConstraint];
  v58[6] = v33;
  v47 = [v55 topAnchor];
  v32 = [(MFConversationItemHeaderBlock *)self topAnchor];
  double v31 = [v47 constraintEqualToAnchor:];
  v58[7] = v31;
  id v46 = [v55 bottomAnchor];
  id v20 = [v54 firstBaselineAnchor];
  v21 = [v46 constraintEqualToAnchor:v20];
  v58[8] = v21;
  v22 = [v53 trailingAnchor];
  v23 = [v56 trailingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v58[9] = v24;
  v25 = [v53 lastBaselineAnchor];
  v26 = [v56 lastBaselineAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v58[10] = v27;
  v28 = +[NSArray arrayWithObjects:v58 count:11];
  v29 = +[NSMutableArray arrayWithArray:v28];

  v30 = [v29 ef_flatten];
  +[NSLayoutConstraint activateConstraints:v30];
}

- (void)updateConstraints
{
  v57.receiver = self;
  v57.super_class = (Class)MFConversationItemHeaderBlock;
  [(MFConversationItemHeaderBlock *)&v57 updateConstraints];
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self _hasConversationLayout];
  v4 = [(MFConversationItemHeaderBlock *)self displayMetrics];
  v5 = v4;
  if (v3)
  {
    [v4 topToSenderBaselineInConversation];
    double v7 = v6;
    v8 = [(MFConversationItemHeaderBlock *)self topConstraint];
    [v8 setConstant:v7];

    v9 = [(MFConversationItemHeaderBlock *)self displayMetrics];
    [v9 recipientBaselineToFirstSeparatorInConversation];
  }
  else
  {
    [v4 topToSenderBaseline];
    double v14 = v13;
    v15 = [(MFConversationItemHeaderBlock *)self topConstraint];
    [v15 setConstant:v14];

    v9 = [(MFConversationItemHeaderBlock *)self displayMetrics];
    [v9 recipientBaselineToFirstSeparator];
  }
  double v11 = v10;
  id v12 = [(MFConversationItemHeaderBlock *)self bottomConstraint];
  [v12 setConstant:v11];

  if ([(MFConversationItemHeaderBlock *)self usingLargeTextLayout])
  {
    v16 = [(MFConversationItemHeaderBlock *)self statusIndicatorLayoutGuideTrailingConstraint];
    [v16 setConstant:0.0];
  }
  else if ([(MFConversationItemHeaderBlock *)self _displayOptionsHideAvatar])
  {
    v16 = [(MFConversationItemHeaderBlock *)self statusIndicatorLayoutGuideTrailingConstraint];
    [v16 setConstant:-6.0];
  }
  else
  {
    v17 = [(MFConversationItemHeaderBlock *)self avatarViewConstraints];
    BOOL v18 = v17 == 0;

    if (v18)
    {
      v19 = [(MFConversationItemHeaderBlock *)self avatarView];
      id v20 = [(MFConversationItemHeaderBlock *)self bottomAnchor];
      v21 = [v19 bottomAnchor];
      v22 = [v20 constraintGreaterThanOrEqualToAnchor:v21];
      [(MFConversationItemHeaderBlock *)self setBottomToAvatarBottomConstraint:v22];

      v23 = [v19 topAnchor];
      v24 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
      v25 = [v24 topAnchor];
      v26 = [v23 constraintEqualToAnchor:v25];
      [(MFConversationItemHeaderBlock *)self setAvatarTopConstraint:v26];

      v56 = [v19 leadingAnchor];
      v54 = [(MFConversationItemHeaderBlock *)self layoutMarginsGuide];
      v53 = [v54 leadingAnchor];
      v52 = [v56 constraintEqualToAnchor:-7.0];
      v58[0] = v52;
      v55 = [v19 widthAnchor];
      v51 = [(MFConversationItemHeaderBlock *)self trailingAccessoryViewLayoutGuide];
      v27 = [v51 widthAnchor];
      v28 = [v55 constraintEqualToAnchor:v27];
      v58[1] = v28;
      v29 = [v19 heightAnchor];
      v30 = [v19 widthAnchor];
      double v31 = [v29 constraintEqualToAnchor:v30];
      v58[2] = v31;
      v32 = [(MFConversationItemHeaderBlock *)self avatarTopConstraint];
      v58[3] = v32;
      v33 = [(MFConversationItemHeaderBlock *)self bottomToAvatarBottomConstraint];
      v58[4] = v33;
      v34 = +[NSArray arrayWithObjects:v58 count:5];
      [(MFConversationItemHeaderBlock *)self setAvatarViewConstraints:v34];

      v35 = [(MFConversationItemHeaderBlock *)self displayMetrics];
      [v35 messageBottomPaddingInConversation];
      double v37 = v36;
      v38 = [(MFConversationItemHeaderBlock *)self bottomToAvatarBottomConstraint];
      [v38 setConstant:v37];
    }
    v39 = [(MFConversationItemHeaderBlock *)self avatarViewConstraints];
    +[NSLayoutConstraint activateConstraints:v39];

    v40 = [(MFConversationItemHeaderBlock *)self statusIndicatorLayoutGuideTrailingConstraint];
    [v40 setConstant:-7.0];

    v16 = [(MFConversationItemHeaderBlock *)self displayMetrics];
    [v16 minHorizontalSpacing];
    double v42 = v41;
    v43 = [(MFConversationItemHeaderBlock *)self primaryStackViewLeadingConstraint];
    [v43 setConstant:v42];
  }
  [(MFConversationItemHeaderBlock *)self _configureTimestampRevealActionsButtonConstraints];
  if (self && _os_feature_enabled_impl())
  {
    id v44 = [(MFConversationItemHeaderBlock *)self captionView];
    unsigned int v45 = [v44 isExpanded];

    id v46 = [(MFConversationItemHeaderBlock *)self messageInfoButton];
    [v46 trailingAnchor];
    if (v45) {
      v47 = {;
    }
      v48 = [(MFConversationItemHeaderBlock *)self primaryStackView];
      objc_super v49 = [v48 trailingAnchor];
      [v47 constraintEqualToAnchor:v49];
    }
    else {
      v47 = {;
    }
      v48 = [(MFConversationItemHeaderBlock *)self timestampLabel];
      objc_super v49 = [v48 leadingAnchor];
      [v47 constraintEqualToAnchor:v49 constant:-8.0];
    v50 = };
    [v50 setActive:1];
  }
}

- (void)_clearTimestampRevealActionsButtonConstraints
{
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self timestampLabelConstraints];

  if (v3)
  {
    v4 = [(MFConversationItemHeaderBlock *)self timestampLabelConstraints];
    +[NSLayoutConstraint deactivateConstraints:v4];
  }

  [(MFConversationItemHeaderBlock *)self setActiveTimestampLabelConstraints:0];
}

- (void)_configureTimestampRevealActionsButtonConstraints
{
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self revealActionsButton];
  v4 = [v3 superview];

  if (v4)
  {
    v5 = [(MFConversationItemHeaderBlock *)self revealActionsButton];
    [v5 removeFromSuperview];
  }
  if ([(MFConversationItemHeaderBlock *)self usingLargeTextLayout])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(MFConversationItemHeaderBlock *)self timestampLabelConstraints];
  }
  id v8 = (id)v6;
  id v7 = [(MFConversationItemHeaderBlock *)self activeTimestampLabelConstraints];

  if (v8 != v7)
  {
    [(MFConversationItemHeaderBlock *)self _clearTimestampRevealActionsButtonConstraints];
    [(MFConversationItemHeaderBlock *)self setActiveTimestampLabelConstraints:v8];
    if (v8) {
      +[NSLayoutConstraint activateConstraints:v8];
    }
  }
}

- (void)_revealActionsButtonTapped:(id)a3
{
  id v5 = [(MFConversationItemHeaderBlock *)self delegate];
  v4 = [(MFConversationItemHeaderBlock *)self revealActionsButton];
  [v5 conversationItemHeader:self didTapRevealActionsButton:v4];
}

- (void)_updateStackViewSpacing
{
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self _hasConversationLayout];
  v4 = [(MFConversationItemHeaderBlock *)self displayMetrics];
  id v10 = v4;
  if (v3) {
    [v4 baselineToBaselineSpacingInConversation];
  }
  else {
    [v4 baselineToBaselineSpacing];
  }
  double v6 = v5;

  id v11 = [(MFConversationItemHeaderBlock *)self captionView];
  if (([v11 isExpanded] & 1) != 0
    || [(MFConversationItemHeaderBlock *)self usingLargeTextLayout])
  {
    unsigned __int8 v7 = [(MFConversationItemHeaderBlock *)self _hasConversationLayout];

    if ((v7 & 1) == 0)
    {
      unsigned int v8 = +[UIDevice mf_isPad];
      double v9 = 8.0;
      if (v8) {
        double v9 = 6.0;
      }
      double v6 = v6 + v9;
    }
  }
  else
  {
  }
  id v12 = [(MFConversationItemHeaderBlock *)self captionView];
  [v12 setListSpacing:v6];

  id v13 = [(MFConversationItemHeaderBlock *)self primaryStackView];
  [v13 setSpacing:v6];

  id v14 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
  [v14 setLineSpacing:v6];
}

- (void)setDisplayMetrics:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFConversationItemHeaderBlock;
  [(MFConversationItemHeaderBlock *)&v7 setDisplayMetrics:v4];
  double v5 = [(MFConversationItemHeaderBlock *)self displayMetrics];

  if (v5)
  {
    [(MFConversationItemHeaderBlock *)self _updateStackViewSpacing];
    [(MFConversationItemHeaderBlock *)self _clearAvatarViewConstraints];
    [(MFConversationItemHeaderBlock *)self setNeedsUpdateConstraints];
    [(MFConversationItemHeaderBlock *)self updateConstraintsIfNeeded];
    double v6 = [(MFConversationItemHeaderBlock *)self avatarView];
    [v6 layoutIfNeeded];
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)MFConversationItemHeaderBlock;
  [(MFConversationItemHeaderBlock *)&v8 layoutSubviews];
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self statusIndicatorLayoutGuide];
  id v4 = [(MFConversationItemHeaderBlock *)self statusIndicatorManager];
  id v5 = [v4 effectiveIndicatorOptions];

  if (v5)
  {
    [v3 layoutFrame];
    [(MFConversationItemHeaderBlock *)self _layoutStatusIndicatorsInRect:"_layoutStatusIndicatorsInRect:"];
  }
  double v6 = [(MFConversationItemHeaderBlock *)self horizontalStatusIndicatorManager];
  id v7 = [v6 effectiveIndicatorOptions];

  if (v7)
  {
    [v3 layoutFrame];
    [(MFConversationItemHeaderBlock *)self _layoutHorizontalStatusIndicators:"_layoutHorizontalStatusIndicators:"];
  }
}

- (void)setDisplayOptions:(int64_t)a3
{
  if (self->_displayOptions != a3)
  {
    self->_displayOptions = a3;
    [(MFConversationItemHeaderBlock *)self _updateStyle];
    [(MFConversationItemHeaderBlock *)self _updateSubviewConstraints];
    id v4 = [(MFConversationItemHeaderBlock *)self statusIndicatorManager];
    [v4 updateImageViews];
  }
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFConversationItemHeaderBlock;
  -[MFConversationItemHeaderBlock setInteractivelyResizing:](&v7, "setInteractivelyResizing:");
  id v5 = [(MFConversationItemHeaderBlock *)self captionView];
  double v6 = [v5 captionLabel];
  [v6 setPreventAutoUpdatingLabel:v3];
}

- (void)_updateStyle
{
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self _hasConversationLayout];
  id v4 = [(MFConversationItemHeaderBlock *)self tapRecognizer];
  id v5 = v4;
  if (v3)
  {
    [v4 setEnabled:1];

    double v6 = [(MFConversationItemHeaderBlock *)self _footnoteFont];
    objc_super v7 = [(MFConversationItemHeaderBlock *)self captionView];
    [v7 setFont:v6];

    objc_super v8 = [(MFConversationItemHeaderBlock *)self captionView];
    [v8 setShowsTimestampWhenExpanded:1];

    double v9 = [(MFConversationItemHeaderBlock *)self captionView];
    [v9 setShowsBIMIWhenExpanded:1];

    if ([(MFConversationItemHeaderBlock *)self usingLargeTextLayout]) {
      goto LABEL_7;
    }
    id v10 = [(MFConversationItemHeaderBlock *)self timestampLabel];
    v22 = v10;
    id v11 = +[NSArray arrayWithObjects:&v22 count:1];
    id v12 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
    [v12 setViewsToDodge:v11];
  }
  else
  {
    [v4 setEnabled:1];

    id v13 = [(MFConversationItemHeaderBlock *)self _subheadFont];
    id v14 = [(MFConversationItemHeaderBlock *)self captionView];
    [v14 setFont:v13];

    v15 = [(MFConversationItemHeaderBlock *)self captionView];
    [v15 setShowsTimestampWhenExpanded:0];

    v16 = [(MFConversationItemHeaderBlock *)self captionView];
    [v16 setShowsBIMIWhenExpanded:0];

    if ([(MFConversationItemHeaderBlock *)self usingLargeTextLayout]) {
      goto LABEL_7;
    }
    id v10 = [(MFConversationItemHeaderBlock *)self avatarView];
    v21 = v10;
    id v11 = +[NSArray arrayWithObjects:&v21 count:1];
    id v12 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
    [v12 setViewsToDodge:v11];
  }

LABEL_7:
  if ([(MFConversationItemHeaderBlock *)self _shouldUseFootnoteFontInCaptionView])
  {
    v17 = [(MFConversationItemHeaderBlock *)self _footnoteFont];
    BOOL v18 = [(MFConversationItemHeaderBlock *)self captionView];
    [v18 setFont:v17];
  }
  unint64_t displayOptions = self->_displayOptions;
  id v20 = [(MFConversationItemHeaderBlock *)self statusIndicatorManager];
  [v20 setHidesUnreadIndicator:(displayOptions >> 4) & 1];
}

- (void)_updateSubviewConstraints
{
  id v15 = [(MFConversationItemHeaderBlock *)self timestampLabel];
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self revealActionsButton];
  id v4 = [(MFConversationItemHeaderBlock *)self primaryStackView];
  id v5 = [(MFConversationItemHeaderBlock *)self captionView];
  unsigned int v6 = [v5 isExpanded];

  unsigned int v7 = [(MFConversationItemHeaderBlock *)self _hasConversationLayout];
  objc_super v8 = [(MFConversationItemHeaderBlock *)self primaryStackViewLeadingConstraint];
  [v8 setActive:0];

  [(MFConversationItemHeaderBlock *)self _clearTimestampRevealActionsButtonConstraints];
  [v3 removeFromSuperview];
  [v15 removeFromSuperview];
  [v4 removeArrangedSubview:v15];
  [v15 setAlpha:1.0];
  if ([(MFConversationItemHeaderBlock *)self usingLargeTextLayout])
  {
    if (((v6 | v7 ^ 1) & 1) == 0) {
      [v4 addArrangedSubview:v15];
    }
    double v9 = [v4 leadingAnchor];
    id v10 = [(MFConversationItemHeaderBlock *)self layoutMarginsGuide];
    id v11 = [v10 leadingAnchor];
    id v12 = [v9 constraintEqualToAnchor:v11];
    [(MFConversationItemHeaderBlock *)self setPrimaryStackViewLeadingConstraint:v12];
  }
  else
  {
    [(MFConversationItemHeaderBlock *)self addSubview:v15];
    double v13 = 1.0;
    if (v6) {
      double v13 = 0.0;
    }
    [v15 setAlpha:v13];
    [(MFConversationItemHeaderBlock *)self _configureTimestampRevealActionsButtonConstraints];
    if ([(MFConversationItemHeaderBlock *)self _shouldHideAvatar])
    {
      double v9 = [v4 leadingAnchor];
      id v10 = [(MFConversationItemHeaderBlock *)self layoutMarginsGuide];
      id v11 = [v10 leadingAnchor];
      [v9 constraintEqualToAnchor:v11 constant:-8.0];
    }
    else
    {
      double v9 = [v4 leadingAnchor];
      id v10 = [(MFConversationItemHeaderBlock *)self avatarView];
      id v11 = [v10 trailingAnchor];
      [v9 constraintEqualToAnchor:v11];
    id v12 = };
    [(MFConversationItemHeaderBlock *)self setPrimaryStackViewLeadingConstraint:v12];
  }

  id v14 = [(MFConversationItemHeaderBlock *)self primaryStackViewLeadingConstraint];
  [v14 setActive:1];
}

- (void)_addMessageInfoButton
{
  if (self)
  {
    if (_os_feature_enabled_impl())
    {
      v23 = +[UIButtonConfiguration plainButtonConfiguration];
      v21 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightSemibold];
      v22 = +[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:");
      unsigned int v3 = +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", MFImageGlyphInfo);
      [v23 setImage:v3];

      id v4 = +[UIColor systemBlueColor];
      [v23 setBaseForegroundColor:v4];

      id v5 = +[UIColor systemWhiteColor];
      [v23 setBaseBackgroundColor:v5];

      [v23 setButtonSize:2];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000BF18;
      v24[3] = &unk_10003CAF8;
      v24[4] = self;
      id v20 = +[UIAction actionWithHandler:v24];
      unsigned int v6 = +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v23);
      [(MFConversationItemHeaderBlock *)self setMessageInfoButton:v6];

      unsigned int v7 = [(MFConversationItemHeaderBlock *)self messageInfoButton];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

      objc_super v8 = [(MFConversationItemHeaderBlock *)self messageInfoButton];
      [(MFConversationItemHeaderBlock *)self addSubview:v8];

      v19 = [(MFConversationItemHeaderBlock *)self messageInfoButton];
      BOOL v18 = [v19 widthAnchor];
      double v9 = [v18 constraintEqualToConstant:20.0];
      v25[0] = v9;
      id v10 = [(MFConversationItemHeaderBlock *)self messageInfoButton];
      id v11 = [v10 heightAnchor];
      id v12 = [v11 constraintEqualToConstant:20.0];
      v25[1] = v12;
      double v13 = [(MFConversationItemHeaderBlock *)self messageInfoButton];
      id v14 = [v13 topAnchor];
      id v15 = [(MFConversationItemHeaderBlock *)self topAnchor];
      v16 = [v14 constraintEqualToAnchor:v15 constant:18.0];
      v25[2] = v16;
      v17 = +[NSArray arrayWithObjects:v25 count:3];
      +[NSLayoutConstraint activateConstraints:v17];
    }
  }
}

- (BOOL)_hasConversationLayout
{
  return ((unint64_t)[(MFConversationItemHeaderBlock *)self displayOptions] >> 1) & 1;
}

- (BOOL)_shouldHideDetailsButton
{
  return ((unint64_t)[(MFConversationItemHeaderBlock *)self displayOptions] >> 2) & 1;
}

- (BOOL)_shouldHideAvatar
{
  if ([(MFConversationItemHeaderBlock *)self usingLargeTextLayout]) {
    return 1;
  }

  return [(MFConversationItemHeaderBlock *)self _displayOptionsHideAvatar];
}

- (BOOL)_displayOptionsHideAvatar
{
  return ((unint64_t)[(MFConversationItemHeaderBlock *)self displayOptions] >> 5) & 1;
}

- (BOOL)_shouldUseFootnoteFontInCaptionView
{
  return 0;
}

- (BOOL)_shouldSaveHeaderDetailsButtonSettings
{
  unsigned __int8 v3 = [(MFConversationItemHeaderBlock *)self _shouldHideDetailsButton];
  return ([(MFConversationItemHeaderBlock *)self _hasConversationLayout] | v3) ^ 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MFConversationItemHeaderBlock *)self _displayOptionsHideAvatar];
  unsigned int v6 = [(MFConversationItemHeaderBlock *)self usingLargeTextLayout];
  v8.receiver = self;
  v8.super_class = (Class)MFConversationItemHeaderBlock;
  [(MFConversationItemHeaderBlock *)&v8 traitCollectionDidChange:v4];
  if (v6 != [(MFConversationItemHeaderBlock *)self usingLargeTextLayout]
    || v5 != [(MFConversationItemHeaderBlock *)self _displayOptionsHideAvatar])
  {
    [(MFConversationItemHeaderBlock *)self _updateAvatarView];
    [(MFConversationItemHeaderBlock *)self _updateStyle];
    [(MFConversationItemHeaderBlock *)self _updateSubviewConstraints];
    [(MFConversationItemHeaderBlock *)self setNeedsUpdateConstraints];
    [(MFConversationItemHeaderBlock *)self updateConstraintsIfNeeded];
    unsigned int v7 = [(MFConversationItemHeaderBlock *)self superview];
    [v7 layoutIfNeeded];
  }
  [(MFConversationItemHeaderBlock *)self _updateLabelColor];
}

- (void)_updateAvatarView
{
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self _shouldHideAvatar];
  id v4 = [(MFConversationItemHeaderBlock *)self avatarView];
  id v8 = v4;
  if (v3)
  {
    [v4 removeFromSuperview];
  }
  else
  {
    [(MFConversationItemHeaderBlock *)self addSubview:v4];

    [(MFConversationItemHeaderBlock *)self _updateDisplayedContact];
    unsigned int v5 = [(MFConversationItemHeaderBlock *)self avatarView];
    double v9 = v5;
    unsigned int v6 = +[NSArray arrayWithObjects:&v9 count:1];
    unsigned int v7 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
    [v7 setViewsToDodge:v6];
  }
}

- (void)_updateLabelColor
{
  id v4 = +[UIColor mailExpandedConversationViewCellDateLabelColor];
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self timestampLabel];
  [v3 setTextColor:v4];
}

- (void)_clearAvatarViewConstraints
{
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self avatarViewConstraints];

  if (v3)
  {
    id v4 = [(MFConversationItemHeaderBlock *)self avatarViewConstraints];
    +[NSLayoutConstraint deactivateConstraints:v4];

    [(MFConversationItemHeaderBlock *)self setAvatarViewConstraints:0];
    [(MFConversationItemHeaderBlock *)self setAvatarTopConstraint:0];
    [(MFConversationItemHeaderBlock *)self setBottomToAvatarBottomConstraint:0];
  }
}

- (void)prepareForReuse
{
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self viewModel];
  id v4 = [v3 atomManager];
  [v4 setAtomProvider:0];

  v5.receiver = self;
  v5.super_class = (Class)MFConversationItemHeaderBlock;
  [(MFConversationItemHeaderBlock *)&v5 prepareForReuse];
}

- (void)displayMessageUsingViewModel:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)MFConversationItemHeaderBlock;
  id v30 = a3;
  [(MFConversationItemHeaderBlock *)&v35 displayMessageUsingViewModel:v30];
  [(MFConversationItemHeaderBlock *)self _updateDisplayedContact];
  [(MFConversationItemHeaderBlock *)self _updateTimestampLabels];
  [(MFConversationItemHeaderBlock *)self _updateStatusIndicators:v30];
  [(MFConversationItemHeaderBlock *)self _updateHorizontalStatusIndicators:v30];
  id v4 = [(MFConversationItemHeaderBlock *)self observableCancelable];
  [v4 cancel];

  v36[0] = @"FromAtomsKey";
  v28 = [(MFConversationItemHeaderBlock *)self viewModel];
  uint64_t v5 = [v28 senderList];
  unsigned int v6 = (void *)v5;
  if (v5) {
    unsigned int v7 = (void *)v5;
  }
  else {
    unsigned int v7 = &__NSArray0__struct;
  }
  v37[0] = v7;
  v36[1] = @"ReplyToAtomsKey";
  v29 = [(MFConversationItemHeaderBlock *)self viewModel];
  uint64_t v8 = [v29 replyToList];
  double v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = &__NSArray0__struct;
  }
  v37[1] = v10;
  v36[2] = @"ToAtomsKey";
  id v11 = [(MFConversationItemHeaderBlock *)self viewModel];
  uint64_t v12 = [v11 toList];
  double v13 = (void *)v12;
  if (v12) {
    id v14 = (void *)v12;
  }
  else {
    id v14 = &__NSArray0__struct;
  }
  v37[2] = v14;
  v36[3] = @"CcAtomsKey";
  id v15 = [(MFConversationItemHeaderBlock *)self viewModel];
  uint64_t v16 = [v15 ccList];
  v17 = (void *)v16;
  if (v16) {
    BOOL v18 = (void *)v16;
  }
  else {
    BOOL v18 = &__NSArray0__struct;
  }
  v37[3] = v18;
  v36[4] = @"BccAtomsKey";
  v19 = [(MFConversationItemHeaderBlock *)self viewModel];
  uint64_t v20 = [v19 bccList];
  v21 = (void *)v20;
  if (v20) {
    v22 = (void *)v20;
  }
  else {
    v22 = &__NSArray0__struct;
  }
  v37[4] = v22;
  double v31 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:5];

  v23 = [(MFConversationItemHeaderBlock *)self captionView];
  [v23 setParticipants:v31];
  if (v30)
  {
    [v23 setHideDetailsButton:[self _shouldHideDetailsButton]];
    [v23 setExpanded:[v23 isExpanded] animated:0 force:1];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v24 = [v30 modelObservable];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10000C8D0;
    v32[3] = &unk_10003CB20;
    objc_copyWeak(&v33, &location);
    v25 = [v24 subscribeWithResultBlock:v32];
    [(MFConversationItemHeaderBlock *)self setObservableCancelable:v25];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  v26 = [(MFConversationItemHeaderBlock *)self viewModel];
  v27 = [v26 atomManager];
  [v27 setAtomProvider:self];
}

- (void)_updateDisplayedContact
{
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self viewModel];
  id v4 = [v3 senderList];
  uint64_t v5 = [v4 firstObject];
  if (![(MFConversationItemHeaderBlock *)self _shouldHideAvatar])
  {
    if (EMBlackPearlIsFeatureEnabled())
    {
      unsigned int v6 = [(MFConversationItemHeaderBlock *)self avatarView];
      unsigned int v7 = [v3 avatarContext];
      uint64_t v8 = [v3 avatarGenerator];
      id v9 = [v6 displayPersonForContext:v7 avatarGenerator:v8];
    }
    else
    {
      unsigned int v6 = [(MFConversationItemHeaderBlock *)self avatarView];
      unsigned int v7 = [v3 avatarContext];
      uint64_t v8 = [v7 brandIndicatorFuture];
      id v10 = [(MFConversationItemHeaderBlock *)self contactStore];
      id v11 = [v6 displayPersonForEmailAddress:v5 brandIndicatorFuture:v8 usingContactStore:v10];
    }
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v12 = [v3 avatarContext];
  double v13 = [v12 brandIndicatorFuture];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000CC68;
  v17[3] = &unk_10003CB70;
  objc_copyWeak(&v18, &location);
  [v13 addSuccessBlock:v17];

  id v14 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000CDD0;
  v15[3] = &unk_10003CB98;
  objc_copyWeak(&v16, &location);
  [v14 setAddresses:v4 withCompletion:v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_updateTimestampLabels
{
  unsigned int v3 = [(MFConversationItemHeaderBlock *)self viewModel];
  id v6 = [v3 dateSent];

  id v4 = [(MFConversationItemHeaderBlock *)self timestampLabel];
  [v4 setDate:v6];

  uint64_t v5 = [(MFConversationItemHeaderBlock *)self captionView];
  [v5 setDateSent:v6];
}

- (void)_updateStatusIndicators:(id)a3
{
  id v13 = a3;
  id v4 = [(MFConversationItemHeaderBlock *)self statusIndicatorManager];
  unsigned int v5 = [v13 isReplied];
  unsigned int v6 = [v13 isForwarded];
  unsigned int v7 = [v13 isRead];
  unsigned int v8 = [v13 isVIP];
  uint64_t v9 = 8;
  if (!v5) {
    uint64_t v9 = 0;
  }
  if (v6) {
    v9 |= 0x10uLL;
  }
  uint64_t v10 = v9 | v7 ^ 1;
  if (v8) {
    uint64_t v11 = v10 | 2;
  }
  else {
    uint64_t v11 = v10;
  }
  [v4 setIndicatorOptions:v11];
  if ([v4 effectiveIndicatorOptions])
  {
    [(MFConversationItemHeaderBlock *)self setNeedsLayout];
  }
  else
  {
    uint64_t v12 = [v4 statusIndicatorImageViews];
    [v12 makeObjectsPerformSelector:"removeFromSuperview"];
  }
}

- (void)_updateHorizontalStatusIndicators:(id)a3
{
  id v13 = a3;
  id v4 = [(MFConversationItemHeaderBlock *)self horizontalStatusIndicatorManager];
  unsigned int v5 = [v13 isFlagged];
  unsigned int v6 = [v13 hasAttachments];
  unsigned int v7 = [v13 isNotify];
  unsigned int v8 = [v13 isMute];
  unsigned int v9 = [v13 isBlockedSender];
  uint64_t v10 = 4;
  if (!v5) {
    uint64_t v10 = 0;
  }
  if (v6) {
    v10 |= 0x20uLL;
  }
  if (v7) {
    v10 |= 0x40uLL;
  }
  if (v8) {
    v10 |= 0x80uLL;
  }
  if (v9) {
    uint64_t v11 = v10 | 0x100;
  }
  else {
    uint64_t v11 = v10;
  }
  [v4 setIndicatorOptions:v11];
  uint64_t v12 = [v13 flagColors];
  [v4 setFlagColors:v12];

  if ([v4 effectiveIndicatorOptions]) {
    [(MFConversationItemHeaderBlock *)self setNeedsLayout];
  }
  else {
    [(MFConversationItemHeaderBlock *)self _resetHorizontalStatusIndicatorContentViewIfNeeded];
  }
}

- (void)_layoutStatusIndicatorsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(MFConversationItemHeaderBlock *)self _hasConversationLayout])
  {
    unsigned int v8 = [(MFConversationItemHeaderBlock *)self statusIndicatorManager];
    [v8 updateImageViews];

    unsigned int v9 = [(MFConversationItemHeaderBlock *)self displayMetrics];
    [v9 baselineToBaselineSpacing];
    double v11 = v10;

    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v39);
    id v13 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
    id v14 = [v13 label];
    id v15 = [v14 font];
    [v15 capHeight];
    double v17 = v16;

    LODWORD(v15) = [(MFConversationItemHeaderBlock *)self mf_prefersRightToLeftInterfaceLayout];
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v40);
    CGFloat v19 = x;
    CGFloat v20 = y;
    CGFloat v21 = width;
    CGFloat v22 = height;
    if (v15)
    {
      double v23 = CGRectGetMinX(*(CGRect *)&v19) + 14.0;
      if (MidX < v23) {
        double v23 = MidX;
      }
      double v24 = -1.0;
    }
    else
    {
      double v23 = CGRectGetMaxX(*(CGRect *)&v19) + -14.0;
      if (MidX >= v23) {
        double v23 = MidX;
      }
      double v24 = 1.0;
    }
    double v30 = v23 + v24;
    double v31 = [(MFConversationItemHeaderBlock *)self statusIndicatorManager];
    v32 = [v31 statusIndicatorImageViews];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000D52C;
    v37[3] = &unk_10003CBC0;
    v37[4] = self;
    *(double *)&void v37[5] = v30;
    *(double *)&v37[6] = MaxY + v17 * -0.5;
    *(double *)&v37[7] = v11 + 1.0;
    [v32 enumerateObjectsUsingBlock:v37];
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v25 = [(MFConversationItemHeaderBlock *)self statusIndicatorManager];
    v26 = [v25 statusIndicatorImageViews];

    id v27 = [v26 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v34;
      do
      {
        v29 = 0;
        do
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * (void)v29) removeFromSuperview];
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v27 = [v26 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v27);
    }
  }
}

- (void)_layoutHorizontalStatusIndicators:(CGRect)a3
{
  id v4 = [(MFConversationItemHeaderBlock *)self horizontalStatusIndicatorManager];
  if ([(MFConversationItemHeaderBlock *)self _hasConversationLayout])
  {
    [v4 updateImageViews];
    id v5 = [v4 statusIndicatorImageViews];
    if ([v5 count])
    {
      unsigned int v6 = [(MFConversationItemHeaderBlock *)self horizontalStatusIndicatorContentView];
      unsigned int v7 = [v6 subviews];
      [v7 makeObjectsPerformSelector:"removeFromSuperview"];

      unsigned int v8 = [v6 mf_prefersRightToLeftInterfaceLayout];
      [v4 midXToMidXSpacing];
      double v10 = v9;
      double v11 = [v5 ef_reverse];
      if (v8) {
        double v10 = -v10;
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000D838;
      v13[3] = &unk_10003CBE8;
      id v12 = v6;
      id v14 = v12;
      id v5 = v11;
      id v15 = v5;
      double v16 = v10;
      [v5 enumerateObjectsUsingBlock:v13];
      [v12 setNeedsUpdateConstraints];
      [v12 layoutIfNeeded];
    }
    else
    {
      [(MFConversationItemHeaderBlock *)self _resetHorizontalStatusIndicatorContentViewIfNeeded];
    }
  }
  else
  {
    [(MFConversationItemHeaderBlock *)self _resetHorizontalStatusIndicatorContentViewIfNeeded];
  }
}

- (void)_resetHorizontalStatusIndicatorContentViewIfNeeded
{
  id v15 = [(MFConversationItemHeaderBlock *)self horizontalStatusIndicatorContentView];
  unsigned int v3 = [v15 subviews];
  id v4 = [(MFConversationItemHeaderBlock *)self placeHolderView];
  if (!v4 || [v3 count] != (id)1 || (objc_msgSend(v3, "containsObject:", v4) & 1) == 0)
  {
    [v3 makeObjectsPerformSelector:"removeFromSuperview"];
    if (!v4)
    {
      id v5 = objc_alloc_init((Class)UIView);
      [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v4 = v5;
      [(MFConversationItemHeaderBlock *)self setPlaceHolderView:v5];
    }
    [v15 addSubview:v4];
    unsigned int v6 = objc_opt_new();
    unsigned int v7 = [v4 leadingAnchor];
    unsigned int v8 = [v15 leadingAnchor];
    double v9 = [v7 constraintEqualToAnchor:v8];
    [v6 addObject:v9];

    double v10 = [v4 trailingAnchor];
    double v11 = [v15 trailingAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11];
    [v6 addObject:v12];

    id v13 = [v4 widthAnchor];
    id v14 = [v13 constraintEqualToConstant:0.0];
    [v6 addObject:v14];

    +[NSLayoutConstraint activateConstraints:v6];
  }
}

- (void)_showMessageInfo
{
  uint64_t v41 = 0;
  double v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = sub_10000E2A4;
  unsigned int v45 = sub_10000E2B4;
  id v46 = 0;
  if (_os_feature_enabled_impl())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v4 = [WeakRetained conversationAttachmentURLsForConversationItemHeaderBlock:self];
    id v5 = [WeakRetained richLinksInConversationForConversationItemHeaderBlock:self];
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = sub_10000E2A4;
    v39[4] = sub_10000E2B4;
    id v40 = (id)0xAAAAAAAAAAAAAAAALL;
    id v40 = objc_alloc_init((Class)NSMutableArray);
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_10000E2A4;
    v37[4] = sub_10000E2B4;
    id v38 = (id)0xAAAAAAAAAAAAAAAALL;
    id v38 = objc_alloc_init((Class)NSMutableArray);
    unsigned int v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10000E2BC;
    v34[3] = &unk_10003CC10;
    long long v36 = v39;
    unsigned int v7 = v6;
    long long v35 = v7;
    [v4 addSuccessBlock:v34];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000E31C;
    v31[3] = &unk_10003CC38;
    long long v33 = v39;
    unsigned int v8 = v7;
    v32 = v8;
    [v4 addFailureBlock:v31];
    dispatch_group_enter(v8);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000E3A0;
    v28[3] = &unk_10003CC10;
    double v30 = v37;
    double v9 = v8;
    v29 = v9;
    [v5 addSuccessBlock:v28];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000E400;
    void v25[3] = &unk_10003CC38;
    id v27 = v37;
    double v10 = v9;
    v26 = v10;
    [v5 addFailureBlock:v25];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E514;
    block[3] = &unk_10003CC60;
    id v20 = WeakRetained;
    CGFloat v21 = self;
    CGFloat v22 = &v41;
    double v23 = v39;
    double v24 = v37;
    id v11 = WeakRetained;
    dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(v39, 8);
  }
  else
  {
    id v12 = [MFMessageInfoViewController alloc];
    id v13 = [(MFConversationItemHeaderBlock *)self viewModel];
    id v14 = [(MFConversationItemHeaderBlock *)self contactStore];
    id v15 = [(MFMessageInfoViewController *)v12 initWithViewModel:v13 contactsStore:v14];
    double v16 = (void *)v42[5];
    v42[5] = (uint64_t)v15;

    [(MFConversationItemHeaderBlock *)self setMessageInfoViewController:v42[5]];
    [(id)v42[5] setDelegate:self];
    double v17 = [(id)v42[5] view];
    [v17 frame];
    [v42[5] setPreferredContentSize:320.0 v18];

    id v4 = [(MFConversationItemHeaderBlock *)self delegate];
    [v4 conversationItemHeader:self presentViewController:v42[5]];
  }

  _Block_object_dispose(&v41, 8);
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  id v4 = [(MFConversationItemHeaderBlock *)self delegate];
  id v5 = [v4 viewControllerForPresentationsFromConversationItemHeader:self];

  return v5;
}

- (void)setShowsHeaderDetails:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(MFConversationItemHeaderBlock *)self captionView];
  [v6 setExpanded:v5 animated:v4 force:0];
}

- (id)expandableCaptionView:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  unsigned int v8 = [(MFConversationItemHeaderBlock *)self delegate];
  double v9 = [v8 conversationItemHeader:self displayNameForEmailAddress:v7 abbreviated:v5];

  return v9;
}

- (id)popoverManagerForExpandableCaptionView:(id)a3
{
  BOOL v4 = [(MFConversationItemHeaderBlock *)self delegate];
  BOOL v5 = [v4 popoverManagerForForConversationItemHeader:self];

  return v5;
}

- (void)expandableCaptionView:(id)a3 willBecomeExpanded:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    double v10 = [(MFConversationItemHeaderBlock *)self viewModel];
    id v11 = [v10 atomManager];
    [v11 updateTrustForDisplayedAtoms];
  }
  unsigned __int8 v12 = [(MFConversationItemHeaderBlock *)self usingLargeTextLayout];
  unsigned __int8 v13 = v12;
  if (v6)
  {
    if (v12)
    {
      uint64_t v14 = 1;
      goto LABEL_10;
    }
    double v18 = [(MFConversationItemHeaderBlock *)self avatarView];
    uint64_t v28 = v18;
    CGFloat v19 = +[NSArray arrayWithObjects:&v28 count:1];
    id v20 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
    [v20 setViewsToDodge:v19];
    uint64_t v14 = 1;
  }
  else
  {
    id v15 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
    double v16 = [v15 addressAtoms];
    BOOL v17 = (unint64_t)[v16 count] < 2;

    uint64_t v14 = (2 * v17);
    if (v13) {
      goto LABEL_10;
    }
    double v18 = [(MFConversationItemHeaderBlock *)self timestampLabel];
    id v27 = v18;
    CGFloat v19 = +[NSArray arrayWithObjects:&v27 count:1];
    id v20 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
    [v20 setViewsToDodge:v19];
  }

LABEL_10:
  if ([v9 isAnimated])
  {
    CGFloat v21 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
    [v21 crossFadeLabelVisibility:v6 atomSeparatorStyle:v14 withAnimationCoordinator:v9];
  }
  else
  {
    CGFloat v22 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
    [v22 setLabelVisible:v6];

    CGFloat v21 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
    [v21 setAddressAtomSeparatorStyle:v14];
  }

  [(MFConversationItemHeaderBlock *)self setClipsToBounds:1];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000EC28;
  void v25[3] = &unk_10003CC88;
  void v25[4] = self;
  BOOL v26 = v6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000ED90;
  v24[3] = &unk_10003CCB0;
  v24[4] = self;
  [v9 animateAlongsideAnimations:v25 completion:v24];
  if (self->_showDetails != v6)
  {
    if ([(MFConversationItemHeaderBlock *)self _shouldSaveHeaderDetailsButtonSettings])
    {
      self->_showDetails = v6;
      if (byte_1000485A8 != v6)
      {
        double v23 = +[NSUserDefaults standardUserDefaults];
        [v23 setBool:self->_showDetails forKey:@"ShowMessageHeaderDetails"];

        byte_1000485A8 = self->_showDetails;
      }
    }
  }
}

- (void)expandableCaptionView:(id)a3 didTapAtom:(id)a4 forAtomType:(unint64_t)a5
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained conversationItemHeader:self didSelectAddressAtom:v8 forAtomType:a5];
  }
}

- (void)expandableCaptionViewDidTapBIMILearnMore:(id)a3
{
  id v4 = [(MFConversationItemHeaderBlock *)self delegate];
  [v4 conversationItemHeaderDidTapBIMILearnMore:self];
}

- (void)_primaryAddressAtomWasTapped:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained conversationItemHeader:self didSelectAddressAtom:v5 forAtomType:1];
  }
}

- (void)iterateDisplayedAtomListsWithBlock:(id)a3
{
  BOOL v6 = (void (**)(id, void *))a3;
  id v4 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
  v6[2](v6, v4);

  id v5 = [(MFConversationItemHeaderBlock *)self captionView];
  [v5 iterateAtomListsWithBlock:v6];
}

- (BOOL)shouldDecorateAtomListWithSMIMEStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
  LOBYTE(self) = v5 == v4;

  return (char)self;
}

- (void)setOtherSigners:(id)a3
{
  [a3 ef_map:&stru_10003CCF0];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(MFConversationItemHeaderBlock *)self captionView];
  if (v6) {
    id v5 = v6;
  }
  else {
    id v5 = &__NSArray0__struct;
  }
  [v4 setOtherSigners:v5];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(MFConversationItemHeaderBlock *)self captionView];
  unsigned int v6 = [v5 isExpanded];

  if (v6)
  {
    [v4 locationInView:self];
    id v7 = -[MFConversationItemHeaderBlock hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

- (void)_tappedHeader:(id)a3
{
  id v3 = [(MFConversationItemHeaderBlock *)self captionView];
  [v3 setExpanded:1 animated:1 force:0];
}

- (void)_updateFonts
{
  id v6 = [(MFConversationItemHeaderBlock *)self _footnoteFont];
  id v3 = [(MFConversationItemHeaderBlock *)self timestampLabel];
  [v3 setFont:v6];

  if ([(MFConversationItemHeaderBlock *)self _hasConversationLayout]
    || [(MFConversationItemHeaderBlock *)self _shouldUseFootnoteFontInCaptionView])
  {
    id v7 = [(MFConversationItemHeaderBlock *)self _footnoteFont];
    id v4 = [(MFConversationItemHeaderBlock *)self captionView];
    [v4 setFont:v7];
  }
  else
  {
    id v7 = [(MFConversationItemHeaderBlock *)self _subheadFont];
    id v4 = [(MFConversationItemHeaderBlock *)self captionView];
    [v4 setFont:v7];
  }

  id v8 = [(MFConversationItemHeaderBlock *)self primaryAtomList];
  id v5 = +[UIFont mf_messageHeaderSenderLabelFont];
  [v8 setOverrideFont:v5];
}

- (id)_subheadFont
{
  v2 = +[MFFontMetricCache sharedFontMetricCache];
  id v3 = [v2 cachedPreferredFontForStyle:UIFontTextStyleSubheadline];

  return v3;
}

- (id)_footnoteFont
{
  return +[UIFont mf_messageHeaderSummaryLabelFont];
}

- (void)messageInfoViewController:(id)a3 didSelectAddress:(id)a4 forAtomType:(unint64_t)a5
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained conversationItemHeader:self didSelectAddress:v8 forAtomType:a5];
  }
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
}

- (MFConversationItemHeaderBlockDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFConversationItemHeaderBlockDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)displayOptions
{
  return self->_displayOptions;
}

- (MFModernLabelledAtomList)primaryAtomList
{
  return self->_primaryAtomList;
}

- (void)setPrimaryAtomList:(id)a3
{
}

- (UIDateLabel)timestampLabel
{
  return self->_timestampLabel;
}

- (void)setTimestampLabel:(id)a3
{
}

- (UIButton)revealActionsButton
{
  return self->_revealActionsButton;
}

- (void)setRevealActionsButton:(id)a3
{
}

- (UIStackView)primaryStackView
{
  return self->_primaryStackView;
}

- (void)setPrimaryStackView:(id)a3
{
}

- (UIView)horizontalStatusIndicatorContentView
{
  return self->_horizontalStatusIndicatorContentView;
}

- (void)setHorizontalStatusIndicatorContentView:(id)a3
{
}

- (UIView)placeHolderView
{
  return self->_placeHolderView;
}

- (void)setPlaceHolderView:(id)a3
{
}

- (MFExpandableCaptionView)captionView
{
  return self->_captionView;
}

- (void)setCaptionView:(id)a3
{
}

- (MFAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (UILayoutGuide)statusIndicatorLayoutGuide
{
  return self->_statusIndicatorLayoutGuide;
}

- (void)setStatusIndicatorLayoutGuide:(id)a3
{
}

- (MessageViewStatusIndicatorManager)statusIndicatorManager
{
  return self->_statusIndicatorManager;
}

- (void)setStatusIndicatorManager:(id)a3
{
}

- (MessageViewStatusIndicatorManager)horizontalStatusIndicatorManager
{
  return self->_horizontalStatusIndicatorManager;
}

- (void)setHorizontalStatusIndicatorManager:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomToAvatarBottomConstraint
{
  return self->_bottomToAvatarBottomConstraint;
}

- (void)setBottomToAvatarBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryStackViewLeadingConstraint
{
  return self->_primaryStackViewLeadingConstraint;
}

- (void)setPrimaryStackViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)avatarTopConstraint
{
  return self->_avatarTopConstraint;
}

- (void)setAvatarTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)statusIndicatorLayoutGuideTrailingConstraint
{
  return self->_statusIndicatorLayoutGuideTrailingConstraint;
}

- (void)setStatusIndicatorLayoutGuideTrailingConstraint:(id)a3
{
}

- (NSArray)timestampLabelConstraints
{
  return self->_timestampLabelConstraints;
}

- (void)setTimestampLabelConstraints:(id)a3
{
}

- (NSArray)activeTimestampLabelConstraints
{
  return self->_activeTimestampLabelConstraints;
}

- (void)setActiveTimestampLabelConstraints:(id)a3
{
}

- (NSArray)avatarViewConstraints
{
  return self->_avatarViewConstraints;
}

- (void)setAvatarViewConstraints:(id)a3
{
}

- (MFMessageInfoViewController)messageInfoViewController
{
  return self->_messageInfoViewController;
}

- (void)setMessageInfoViewController:(id)a3
{
}

- (UIButton)messageInfoButton
{
  return self->_messageInfoButton;
}

- (void)setMessageInfoButton:(id)a3
{
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (EFCancelable)observableCancelable
{
  return self->_observableCancelable;
}

- (void)setObservableCancelable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observableCancelable, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_messageInfoButton, 0);
  objc_storeStrong((id *)&self->_messageInfoViewController, 0);
  objc_storeStrong((id *)&self->_avatarViewConstraints, 0);
  objc_storeStrong((id *)&self->_activeTimestampLabelConstraints, 0);
  objc_storeStrong((id *)&self->_timestampLabelConstraints, 0);
  objc_storeStrong((id *)&self->_statusIndicatorLayoutGuideTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_avatarTopConstraint, 0);
  objc_storeStrong((id *)&self->_primaryStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomToAvatarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalStatusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_statusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_statusIndicatorLayoutGuide, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_captionView, 0);
  objc_storeStrong((id *)&self->_placeHolderView, 0);
  objc_storeStrong((id *)&self->_horizontalStatusIndicatorContentView, 0);
  objc_storeStrong((id *)&self->_primaryStackView, 0);
  objc_storeStrong((id *)&self->_revealActionsButton, 0);
  objc_storeStrong((id *)&self->_timestampLabel, 0);
  objc_storeStrong((id *)&self->_primaryAtomList, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountsProvider, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end