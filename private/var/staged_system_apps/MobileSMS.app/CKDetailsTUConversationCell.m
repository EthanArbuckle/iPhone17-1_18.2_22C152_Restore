@interface CKDetailsTUConversationCell
+ (BOOL)shouldHighlight;
+ (id)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKDetailsTUConversationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CKDetailsTUConversationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 conversation:(id)a5;
- (TUConversation)conversation;
- (UIButton)actionButton;
- (UIImageView)iconView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)buttonInteritemSpacing;
- (double)buttonTitleHorizontalSpacing;
- (double)buttonTitleVerticalSpacing;
- (double)insetPadding;
- (double)interitemSpacing;
- (unint64_t)state;
- (void)_handleMultiWayStateChange:(id)a3;
- (void)actionButtonTapped:(id)a3;
- (void)addConstraints;
- (void)configureActionButton;
- (void)configureIconView;
- (void)configureSubtitle;
- (void)formatIconViewForExpanse;
- (void)formatIconViewForFaceTime;
- (void)formatSubtitleForText;
- (void)formatTitle;
- (void)layoutSubviews;
- (void)setActionButton:(id)a3;
- (void)setConversation:(id)a3;
- (void)setIconView:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupView;
- (void)updateView;
@end

@implementation CKDetailsTUConversationCell

- (CKDetailsTUConversationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKDetailsTUConversationCell;
  return [(CKDetailsTUConversationCell *)&v5 initWithStyle:a3 reuseIdentifier:a4];
}

- (CKDetailsTUConversationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 conversation:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CKDetailsTUConversationCell;
  v9 = [(CKDetailsTUConversationCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    [(CKDetailsTUConversationCell *)v9 setConversation:v8];
    [(CKDetailsTUConversationCell *)v10 setupView];
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v10 selector:"_handleMultiWayStateChange:" name:IMChatMultiWayStateChangedNotification object:0];
  }
  return v10;
}

- (void)setupView
{
  id v3 = objc_alloc_init((Class)UIImageView);
  [(CKDetailsTUConversationCell *)self setIconView:v3];

  v4 = [(CKDetailsTUConversationCell *)self iconView];
  [v4 setContentMode:1];

  id v5 = objc_alloc_init((Class)UILabel);
  [(CKDetailsTUConversationCell *)self setTitleLabel:v5];

  v6 = [(CKDetailsTUConversationCell *)self titleLabel];
  LODWORD(v7) = 1132068864;
  [v6 setContentCompressionResistancePriority:0 forAxis:v7];

  [(CKDetailsTUConversationCell *)self formatTitle];
  id v8 = objc_alloc_init((Class)UILabel);
  [(CKDetailsTUConversationCell *)self setSubtitleLabel:v8];

  v9 = [(CKDetailsTUConversationCell *)self subtitleLabel];
  LODWORD(v10) = 1132068864;
  [v9 setContentCompressionResistancePriority:0 forAxis:v10];

  [(CKDetailsTUConversationCell *)self formatSubtitleForText];
  v11 = +[UIButton buttonWithType:0];
  [(CKDetailsTUConversationCell *)self setActionButton:v11];

  v12 = [(CKDetailsTUConversationCell *)self actionButton];
  objc_super v13 = [v12 titleLabel];
  [v13 setNumberOfLines:1];

  v14 = [(CKDetailsTUConversationCell *)self actionButton];
  v15 = [v14 titleLabel];
  v16 = +[CKUIBehavior sharedBehaviors];
  v17 = [v16 tuConversationViewActionButtonFont];
  [v15 setFont:v17];

  v18 = [(CKDetailsTUConversationCell *)self actionButton];
  v19 = CKFrameworkBundle();
  v20 = [v19 localizedStringForKey:@"JOIN" value:&stru_100031290 table:@"ChatKit"];
  [v18 setTitle:v20 forState:0];

  v21 = [(CKDetailsTUConversationCell *)self actionButton];
  [v21 addTarget:self action:"actionButtonTapped:" forControlEvents:1];

  v22 = [(CKDetailsTUConversationCell *)self actionButton];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  v23 = [(CKDetailsTUConversationCell *)self actionButton];
  [v23 setContentEdgeInsets:6.0, 17.0, 6.0, 17.0];

  v24 = [(CKDetailsTUConversationCell *)self actionButton];
  [v24 sizeToFit];

  v25 = [(CKDetailsTUConversationCell *)self actionButton];
  v26 = [v25 layer];
  v27 = +[CKUIBehavior sharedBehaviors];
  if ([v27 isAccessibilityPreferredContentSizeCategory])
  {
    v28 = [(CKDetailsTUConversationCell *)self actionButton];
    [v28 frame];
    double v30 = v29 * 0.5;
  }
  else
  {
    v28 = +[CKUIBehavior sharedBehaviors];
    [v28 tuConversationJoinButtonCornerRadius];
  }
  [v26 setCornerRadius:v30];

  v31 = [(CKDetailsTUConversationCell *)self actionButton];
  LODWORD(v32) = 1148846080;
  [v31 setContentCompressionResistancePriority:0 forAxis:v32];

  v33 = [(CKDetailsTUConversationCell *)self actionButton];
  LODWORD(v34) = 1148846080;
  [v33 setContentHuggingPriority:0 forAxis:v34];

  v35 = [(CKDetailsTUConversationCell *)self contentView];
  v36 = [(CKDetailsTUConversationCell *)self titleLabel];
  [v35 addSubview:v36];

  v37 = [(CKDetailsTUConversationCell *)self contentView];
  v38 = [(CKDetailsTUConversationCell *)self subtitleLabel];
  [v37 addSubview:v38];

  v39 = [(CKDetailsTUConversationCell *)self contentView];
  v40 = [(CKDetailsTUConversationCell *)self iconView];
  [v39 addSubview:v40];

  v41 = [(CKDetailsTUConversationCell *)self contentView];
  v42 = [(CKDetailsTUConversationCell *)self actionButton];
  [v41 addSubview:v42];

  [(CKDetailsTUConversationCell *)self setClipsToBounds:0];
  [(CKDetailsTUConversationCell *)self updateView];

  [(CKDetailsTUConversationCell *)self addConstraints];
}

- (void)addConstraints
{
  id v3 = +[CKUIBehavior sharedBehaviors];
  [v3 detailsTUConversationDetailsSummaryImageDiameter];
  double v5 = v4;

  v6 = +[CKUIBehavior sharedBehaviors];
  [v6 contactImageSize];
  double v8 = (v7 - v5) * 0.5;
  if (qword_10003AE48 != -1) {
    dispatch_once(&qword_10003AE48, &stru_100030A08);
  }
  double v9 = *(double *)&qword_10003AE40;
  if (*(double *)&qword_10003AE40 == 0.0) {
    double v9 = 1.0;
  }
  double v10 = round(v8 * v9) / v9;

  v11 = +[CKUIBehavior sharedBehaviors];
  unsigned int v12 = [v11 isAccessibilityPreferredContentSizeCategory];

  v101 = [(CKDetailsTUConversationCell *)self iconView];
  v100 = [v101 widthAnchor];
  uint64_t v13 = [v100 constraintEqualToConstant:v5];
  v99 = (void *)v13;
  if (v12)
  {
    v103[0] = v13;
    v98 = [(CKDetailsTUConversationCell *)self iconView];
    v97 = [v98 heightAnchor];
    v96 = [v97 constraintEqualToConstant:v5];
    v103[1] = v96;
    v95 = [(CKDetailsTUConversationCell *)self iconView];
    v14 = [v95 leadingAnchor];
    v93 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v93 leadingAnchor];
    v92 = v94 = v14;
    v91 = [v14 constraintEqualToAnchor:v10];
    v103[2] = v91;
    v90 = [(CKDetailsTUConversationCell *)self iconView];
    v15 = [v90 topAnchor];
    v88 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v88 topAnchor];
    v87 = v89 = v15;
    v86 = [v15 constraintEqualToAnchor:];
    v103[3] = v86;
    v85 = [(CKDetailsTUConversationCell *)self titleLabel];
    v16 = [v85 leadingAnchor];
    v83 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v83 leadingAnchor];
    v82 = v84 = v16;
    v81 = [v16 constraintEqualToAnchor:v10];
    v103[4] = v81;
    v80 = [(CKDetailsTUConversationCell *)self titleLabel];
    v17 = [v80 topAnchor];
    v78 = [(CKDetailsTUConversationCell *)self iconView];
    [v78 bottomAnchor];
    v77 = v79 = v17;
    v76 = [v17 constraintEqualToAnchor:];
    v103[5] = v76;
    v75 = [(CKDetailsTUConversationCell *)self titleLabel];
    v18 = [v75 widthAnchor];
    v73 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v73 widthAnchor];
    v72 = v74 = v18;
    v71 = [v18 constraintEqualToAnchor:];
    v103[6] = v71;
    v70 = [(CKDetailsTUConversationCell *)self subtitleLabel];
    v19 = [v70 leadingAnchor];
    v68 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v68 leadingAnchor];
    v67 = v69 = v19;
    v66 = [v19 constraintEqualToAnchor:v10];
    v103[7] = v66;
    v65 = [(CKDetailsTUConversationCell *)self subtitleLabel];
    v20 = [v65 topAnchor];
    v63 = [(CKDetailsTUConversationCell *)self titleLabel];
    [v63 bottomAnchor];
    v62 = v64 = v20;
    v61 = [v20 constraintEqualToAnchor:];
    v103[8] = v61;
    v60 = [(CKDetailsTUConversationCell *)self subtitleLabel];
    v21 = [v60 widthAnchor];
    v58 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v58 widthAnchor];
    v57 = v59 = v21;
    v56 = [v21 constraintEqualToAnchor:];
    v103[9] = v56;
    v55 = [(CKDetailsTUConversationCell *)self actionButton];
    v22 = [v55 leadingAnchor];
    v53 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v53 leadingAnchor];
    v52 = v54 = v22;
    v51 = [v22 constraintEqualToAnchor:v10];
    v103[10] = v51;
    v50 = [(CKDetailsTUConversationCell *)self actionButton];
    v23 = [v50 topAnchor];
    v48 = [(CKDetailsTUConversationCell *)self subtitleLabel];
    [v48 bottomAnchor];
    v47 = v49 = v23;
    v24 = [v23 constraintEqualToAnchor:];
    v103[11] = v24;
    v25 = [(CKDetailsTUConversationCell *)self actionButton];
    v26 = [v25 heightAnchor];
    v27 = +[CKUIBehavior sharedBehaviors];
    [v27 tuConversationJoinButtonHeight];
    v28 = [v26 constraintGreaterThanOrEqualToConstant:];
    v103[12] = v28;
    double v29 = [(CKDetailsTUConversationCell *)self actionButton];
    double v30 = [v29 widthAnchor];
    v31 = +[CKUIBehavior sharedBehaviors];
    [v31 tuConversationJoinButtonMinWidth];
    double v32 = [v30 constraintGreaterThanOrEqualToConstant:];
    v103[13] = v32;
    v33 = v103;
  }
  else
  {
    v102[0] = v13;
    v98 = [(CKDetailsTUConversationCell *)self iconView];
    v97 = [v98 heightAnchor];
    v96 = [v97 constraintEqualToConstant:v5];
    v102[1] = v96;
    v95 = [(CKDetailsTUConversationCell *)self iconView];
    double v34 = [v95 leadingAnchor];
    v93 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v93 leadingAnchor];
    v92 = v94 = v34;
    v91 = [v34 constraintEqualToAnchor:v10];
    v102[2] = v91;
    v90 = [(CKDetailsTUConversationCell *)self iconView];
    v35 = [v90 centerYAnchor];
    v88 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v88 centerYAnchor];
    v87 = v89 = v35;
    v86 = [v35 constraintEqualToAnchor:];
    v102[3] = v86;
    v85 = [(CKDetailsTUConversationCell *)self titleLabel];
    v36 = [v85 leadingAnchor];
    v83 = [(CKDetailsTUConversationCell *)self iconView];
    uint64_t v37 = [v83 trailingAnchor];
    [(CKDetailsTUConversationCell *)self interitemSpacing];
    v84 = v36;
    v82 = (void *)v37;
    v81 = [v36 constraintEqualToAnchor:v37];
    v102[4] = v81;
    v80 = [(CKDetailsTUConversationCell *)self titleLabel];
    v38 = [v80 bottomAnchor];
    v78 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v78 centerYAnchor];
    v77 = v79 = v38;
    v76 = [v38 constraintEqualToAnchor:];
    v102[5] = v76;
    v75 = [(CKDetailsTUConversationCell *)self subtitleLabel];
    v39 = [v75 leadingAnchor];
    v73 = [(CKDetailsTUConversationCell *)self titleLabel];
    [v73 leadingAnchor];
    v72 = v74 = v39;
    v71 = [v39 constraintEqualToAnchor:];
    v102[6] = v71;
    v70 = [(CKDetailsTUConversationCell *)self subtitleLabel];
    v40 = [v70 trailingAnchor];
    v68 = [(CKDetailsTUConversationCell *)self titleLabel];
    [v68 trailingAnchor];
    v67 = v69 = v40;
    v66 = [v40 constraintEqualToAnchor:];
    v102[7] = v66;
    v65 = [(CKDetailsTUConversationCell *)self subtitleLabel];
    v41 = [v65 topAnchor];
    v63 = [(CKDetailsTUConversationCell *)self titleLabel];
    [v63 bottomAnchor];
    v62 = v64 = v41;
    v61 = [v41 constraintEqualToAnchor:];
    v102[8] = v61;
    v60 = [(CKDetailsTUConversationCell *)self actionButton];
    v42 = [v60 centerYAnchor];
    v58 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v58 centerYAnchor];
    v57 = v59 = v42;
    v56 = [v42 constraintEqualToAnchor:];
    v102[9] = v56;
    v55 = [(CKDetailsTUConversationCell *)self actionButton];
    v43 = [v55 leadingAnchor];
    v53 = [(CKDetailsTUConversationCell *)self titleLabel];
    uint64_t v44 = [v53 trailingAnchor];
    [(CKDetailsTUConversationCell *)self interitemSpacing];
    v54 = v43;
    v52 = (void *)v44;
    v51 = [v43 constraintEqualToAnchor:v44];
    v102[10] = v51;
    v50 = [(CKDetailsTUConversationCell *)self actionButton];
    v45 = [v50 trailingAnchor];
    v48 = [(CKDetailsTUConversationCell *)self layoutMarginsGuide];
    [v48 trailingAnchor];
    v47 = v49 = v45;
    v24 = [v45 constraintEqualToAnchor:];
    v102[11] = v24;
    v25 = [(CKDetailsTUConversationCell *)self actionButton];
    v26 = [v25 heightAnchor];
    v27 = +[CKUIBehavior sharedBehaviors];
    [v27 tuConversationJoinButtonHeight];
    v28 = [v26 constraintEqualToConstant:];
    v102[12] = v28;
    double v29 = [(CKDetailsTUConversationCell *)self actionButton];
    double v30 = [v29 widthAnchor];
    v31 = +[CKUIBehavior sharedBehaviors];
    [v31 tuConversationJoinButtonMinWidth];
    double v32 = [v30 constraintGreaterThanOrEqualToConstant:];
    v102[13] = v32;
    v33 = v102;
  }
  v46 = +[NSArray arrayWithObjects:v33 count:14];

  +[NSLayoutConstraint activateConstraints:v46];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(CKDetailsTUConversationCell *)self contentView];
  double v7 = [v6 layoutMarginsGuide];
  [v7 layoutFrame];
  double v9 = v8;

  double v10 = [(CKDetailsTUConversationCell *)self titleLabel];
  [v10 sizeThatFits:width, height];
  double v12 = v11;

  [(CKDetailsTUConversationCell *)self layoutMargins];
  double v14 = v12 + v13;
  [(CKDetailsTUConversationCell *)self layoutMargins];
  double v16 = v14 + v15;
  v17 = [(CKDetailsTUConversationCell *)self subtitleLabel];

  if (v17)
  {
    v18 = [(CKDetailsTUConversationCell *)self subtitleLabel];
    [v18 sizeThatFits:width, height];
    double v16 = v16 + v19;
  }
  v20 = +[CKUIBehavior sharedBehaviors];
  unsigned int v21 = [v20 isAccessibilityPreferredContentSizeCategory];

  if (v21)
  {
    v22 = [(CKDetailsTUConversationCell *)self iconView];
    [v22 bounds];
    double v24 = v23;
    v25 = [(CKDetailsTUConversationCell *)self actionButton];
    [v25 bounds];
    double v27 = v24 + v26;
    [(CKDetailsTUConversationCell *)self layoutMargins];
    double v29 = v28 + v27;
    [(CKDetailsTUConversationCell *)self layoutMargins];
    double v16 = v16 + v30 + v29;
  }
  double v31 = v9;
  double v32 = v16;
  result.double height = v32;
  result.double width = v31;
  return result;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);

  [(CKDetailsTUConversationCell *)self updateView];
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  [(CKDetailsTUConversationCell *)self configureIconView];
  [(CKDetailsTUConversationCell *)self formatTitle];
  [(CKDetailsTUConversationCell *)self configureSubtitle];
  [(CKDetailsTUConversationCell *)self configureActionButton];

  [(CKDetailsTUConversationCell *)self setNeedsLayout];
}

- (void)configureIconView
{
  unint64_t state = self->_state;
  if (state - 3 >= 2
    && (state
     || !+[IMFaceTimeUtilities activeTUConversationHasActivitySession:self->_conversation]))
  {
    [(CKDetailsTUConversationCell *)self formatIconViewForFaceTime];
  }
  else
  {
    [(CKDetailsTUConversationCell *)self formatIconViewForExpanse];
  }
}

- (void)configureSubtitle
{
  [(CKDetailsTUConversationCell *)self formatSubtitleForText];
  unint64_t state = self->_state;
  if (state - 1 >= 4)
  {
    if (state) {
      return;
    }
    id v7 = [(CKDetailsTUConversationCell *)self subtitleLabel];
    double v4 = CKFrameworkBundle();
    uint64_t v5 = [v4 localizedStringForKey:@"CALL_ENDED" value:&stru_100031290 table:@"ChatKit"];
  }
  else
  {
    id v7 = [(CKDetailsTUConversationCell *)self subtitleLabel];
    double v4 = [(CKDetailsTUConversationCell *)self conversation];
    uint64_t v5 = +[CKTUConversationViewUtilities joinStateStatusStringForTUConversation:v4];
  }
  v6 = (void *)v5;
  [v7 setText:v5];
}

- (void)configureActionButton
{
  switch(self->_state)
  {
    case 0uLL:
      id v15 = [(CKDetailsTUConversationCell *)self actionButton];
      [v15 setHidden:1];
      goto LABEL_6;
    case 1uLL:
    case 3uLL:
      id v3 = [(CKDetailsTUConversationCell *)self actionButton];
      [v3 setHidden:0];

      double v4 = [(CKDetailsTUConversationCell *)self actionButton];
      uint64_t v5 = +[CKUIBehavior sharedBehaviors];
      v6 = [v5 theme];
      id v7 = [v6 multiwayButtonColor];
      [v4 setBackgroundColor:v7];

      id v15 = [(CKDetailsTUConversationCell *)self actionButton];
      double v8 = CKFrameworkBundle();
      double v9 = v8;
      CFStringRef v10 = @"JOIN";
      goto LABEL_4;
    case 2uLL:
    case 4uLL:
      double v11 = [(CKDetailsTUConversationCell *)self actionButton];
      [v11 setHidden:0];

      double v12 = [(CKDetailsTUConversationCell *)self actionButton];
      double v13 = +[UIColor systemRedColor];
      [v12 setBackgroundColor:v13];

      id v15 = [(CKDetailsTUConversationCell *)self actionButton];
      double v8 = CKFrameworkBundle();
      double v9 = v8;
      CFStringRef v10 = @"LEAVE";
LABEL_4:
      double v14 = [v8 localizedStringForKey:v10 value:&stru_100031290 table:@"ChatKit"];
      [v15 setTitle:v14 forState:0];

LABEL_6:

      break;
    default:
      return;
  }
}

+ (id)reuseIdentifier
{
  return @"ExpanseGroupMembershipCell_reuseIdentifier";
}

- (void)actionButtonTapped:(id)a3
{
  if ((id)[(CKDetailsTUConversationCell *)self state] == (id)1
    || (id)[(CKDetailsTUConversationCell *)self state] == (id)3)
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    double v4 = [(CKDetailsTUConversationCell *)self conversation];
    id v5 = +[IMFaceTimeUtilities conversationIsVideoCall:v4];

    if (v5) {
      id v6 = +[IMFaceTimeUtilities platformSupportsStagingArea];
    }
    else {
      id v6 = 0;
    }
    id v7 = [(CKDetailsTUConversationCell *)self conversation];
    +[IMFaceTimeUtilities joinExistingConversationForTUCoversation:v7 videoEnabled:v5 wantsStagingArea:v6];
  }
  else if ((id)[(CKDetailsTUConversationCell *)self state] == (id)2 {
         || (id)[(CKDetailsTUConversationCell *)self state] == (id)4)
  }
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    +[IMFaceTimeUtilities leaveTUConversation];
    [(CKDetailsTUConversationCell *)self updateView];
  }
}

- (void)_handleMultiWayStateChange:(id)a3
{
  double v4 = [a3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:IMChatMultiWayMessagesConversationUUID];

  id v5 = +[IMChatRegistry sharedRegistry];
  id v6 = [v5 existingConversationForTelephonyConversationUUID:v7];

  [(CKDetailsTUConversationCell *)self setConversation:v6];
}

- (void)updateView
{
  id v3 = [(CKDetailsTUConversationCell *)self conversation];
  [(CKDetailsTUConversationCell *)self setState:+[CKTUConversationViewUtilities ckTUConversationStateForTUConversation:v3]];

  [(CKDetailsTUConversationCell *)self setNeedsLayout];

  [(CKDetailsTUConversationCell *)self layoutIfNeeded];
}

- (void)formatIconViewForFaceTime
{
  id v3 = [(CKDetailsTUConversationCell *)self iconView];
  double v4 = [(CKDetailsTUConversationCell *)self conversation];
  id v5 = +[CKTUConversationViewUtilities faceTimeIconForTUConversation:v4];
  [v3 setImage:v5];

  id v6 = [(CKDetailsTUConversationCell *)self iconView];
  [v6 setBackgroundColor:0];

  id v7 = [(CKDetailsTUConversationCell *)self iconView];
  double v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = [v8 theme];
  CFStringRef v10 = [v9 expanseActivityViewIconTintColor];
  [v7 setTintColor:v10];

  double v11 = [(CKDetailsTUConversationCell *)self iconView];
  [v11 _setCornerRadius:0.0];

  id v12 = [(CKDetailsTUConversationCell *)self iconView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)formatIconViewForExpanse
{
  id v3 = [(CKDetailsTUConversationCell *)self iconView];
  double v4 = +[CKTUConversationViewUtilities sharePlayIcon];
  [v3 setImage:v4];

  id v5 = [(CKDetailsTUConversationCell *)self iconView];
  [v5 setBackgroundColor:0];

  id v6 = [(CKDetailsTUConversationCell *)self iconView];
  id v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = [v7 theme];
  double v9 = [v8 expanseActivityViewIconTintColor];
  [v6 setTintColor:v9];

  CFStringRef v10 = [(CKDetailsTUConversationCell *)self iconView];
  [v10 _setCornerRadius:0.0];

  double v11 = [(CKDetailsTUConversationCell *)self iconView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [(CKDetailsTUConversationCell *)self iconView];
  [v12 setBackgroundColor:0];
}

- (void)formatTitle
{
  id v3 = [(CKDetailsTUConversationCell *)self titleLabel];
  double v4 = +[CKUIBehavior sharedBehaviors];
  id v5 = [v4 recipientNameFont];
  [v3 setFont:v5];

  id v6 = [(CKDetailsTUConversationCell *)self titleLabel];
  id v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = [v7 theme];
  double v9 = [v8 primaryLabelColor];
  [v6 setTextColor:v9];

  CFStringRef v10 = [(CKDetailsTUConversationCell *)self titleLabel];
  [v10 setNumberOfLines:1];

  double v11 = [(CKDetailsTUConversationCell *)self titleLabel];
  [v11 setLineBreakMode:4];

  id v12 = [(CKDetailsTUConversationCell *)self conversation];
  +[CKTUConversationViewUtilities titleForAVMode:](CKTUConversationViewUtilities, "titleForAVMode:", [v12 avMode]);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  double v13 = [(CKDetailsTUConversationCell *)self conversation];
  LODWORD(v11) = +[IMFaceTimeUtilities activeTUConversationHasActivitySession:v13];

  if (v11)
  {
    double v14 = CKFrameworkBundle();
    uint64_t v15 = [v14 localizedStringForKey:@"EXPANSE_DEFAULT" value:&stru_100031290 table:@"ChatKit"];

    id v18 = (id)v15;
  }
  double v16 = [(CKDetailsTUConversationCell *)self titleLabel];
  [v16 setText:v18];

  v17 = [(CKDetailsTUConversationCell *)self titleLabel];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)formatSubtitleForText
{
  id v3 = [(CKDetailsTUConversationCell *)self subtitleLabel];
  [v3 setNumberOfLines:1];

  double v4 = [(CKDetailsTUConversationCell *)self subtitleLabel];
  [v4 setLineBreakMode:4];

  id v5 = [(CKDetailsTUConversationCell *)self subtitleLabel];
  id v6 = +[CKUIBehavior sharedBehaviors];
  id v7 = [v6 locationSubtitleFont];
  [v5 setFont:v7];

  double v8 = [(CKDetailsTUConversationCell *)self subtitleLabel];
  double v9 = +[CKUIBehavior sharedBehaviors];
  CFStringRef v10 = [v9 theme];
  double v11 = [v10 secondaryLabelColor];
  [v8 setTextColor:v11];

  id v12 = [(CKDetailsTUConversationCell *)self subtitleLabel];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CKDetailsTUConversationCell;
  [(CKDetailsTUConversationCell *)&v6 layoutSubviews];
  id v3 = [(CKDetailsTUConversationCell *)self topSeperator];
  [v3 setHidden:1];

  double v4 = [(CKDetailsTUConversationCell *)self bottomSeperator];
  [v4 setUserInteractionEnabled:1];

  id v5 = [(CKDetailsTUConversationCell *)self bottomSeperator];
  [v5 setHidden:0];
}

- (double)insetPadding
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationInsetPadding];
  double v4 = v3;

  return v4;
}

- (double)buttonInteritemSpacing
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationButtonInteritemSpacing];
  double v4 = v3;

  return v4;
}

- (double)interitemSpacing
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationInteritemSpacing];
  double v4 = v3;

  return v4;
}

- (double)buttonTitleHorizontalSpacing
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationButtonTitleHorizontalSpacing];
  double v4 = v3;

  return v4;
}

- (double)buttonTitleVerticalSpacing
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationButtonTitleVerticalSpacing];
  double v4 = v3;

  return v4;
}

- (TUConversation)conversation
{
  return self->_conversation;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_conversation, 0);
}

@end