@interface MFExpandableCaptionView
- (BOOL)hideDetailsButton;
- (BOOL)isBIMIVerified;
- (BOOL)isExpanded;
- (BOOL)isOutgoing;
- (BOOL)showsBIMIWhenExpanded;
- (BOOL)showsTimestampWhenExpanded;
- (MFCaptionLabel)captionLabel;
- (MFExpandableCaptionView)initWithFrame:(CGRect)a3;
- (MFExpandableCaptionViewDelegate)delegate;
- (NSDate)dateSent;
- (NSLayoutConstraint)captionLabelTrailingConstraint;
- (NSLayoutConstraint)lastBaselineLabelConstraint;
- (NSMutableDictionary)participantDictionary;
- (UIFont)font;
- (UILabel)lastBaseLineDeceptionLabel;
- (UILabel)timestampLabel;
- (UIStackView)atomListStackView;
- (UIStackView)bimiStackView;
- (double)listSpacing;
- (id)captionLabel:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5;
- (id)viewForFirstBaselineLayout;
- (void)_addAtomListForAddresses:(id)a3 label:(id)a4 title:(id)a5 key:(id)a6;
- (void)_bimiLearnMorePressed;
- (void)_createPrimaryViews;
- (void)_initializePrimaryLayoutConstraints;
- (void)_reattachBottomConstraint;
- (void)_recipientAtomPressed:(id)a3;
- (void)_replyToAtomPressed:(id)a3;
- (void)_senderAtomPressed:(id)a3;
- (void)_setRecipientDetailsVisible:(BOOL)a3;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)iterateAtomListsWithBlock:(id)a3;
- (void)reloadData;
- (void)setAtomListStackView:(id)a3;
- (void)setBIMIVerified:(BOOL)a3;
- (void)setBimiStackView:(id)a3;
- (void)setBimiVerified:(BOOL)a3;
- (void)setCaptionLabel:(id)a3;
- (void)setCaptionLabelTrailingConstraint:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4 force:(BOOL)a5;
- (void)setFont:(id)a3;
- (void)setHideDetailsButton:(BOOL)a3;
- (void)setLastBaseLineDeceptionLabel:(id)a3;
- (void)setLastBaselineLabelConstraint:(id)a3;
- (void)setListSpacing:(double)a3;
- (void)setOtherSigners:(id)a3;
- (void)setOutgoing:(BOOL)a3;
- (void)setParticipantDictionary:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setShowsBIMIWhenExpanded:(BOOL)a3;
- (void)setShowsTimestampWhenExpanded:(BOOL)a3;
- (void)setTimestampLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation MFExpandableCaptionView

- (MFExpandableCaptionView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MFExpandableCaptionView;
  v3 = -[MFExpandableCaptionView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFExpandableCaptionView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = +[UIColor clearColor];
    [(MFExpandableCaptionView *)v4 setBackgroundColor:v5];

    v6 = +[NSMutableDictionary dictionary];
    [(MFExpandableCaptionView *)v4 setParticipantDictionary:v6];

    [(MFExpandableCaptionView *)v4 _createPrimaryViews];
    [(MFExpandableCaptionView *)v4 _initializePrimaryLayoutConstraints];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v4 selector:"contentSizeCategoryDidChangeNotification:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MFExpandableCaptionView;
  [(MFExpandableCaptionView *)&v4 dealloc];
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_font] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    v6 = [(MFExpandableCaptionView *)self timestampLabel];
    [v6 setFont:v5];

    v7 = [(MFExpandableCaptionView *)self captionLabel];
    [v7 setFont:v5];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000FE84;
    v8[3] = &unk_10003CD18;
    id v9 = v5;
    [(MFExpandableCaptionView *)self iterateAtomListsWithBlock:v8];
  }
}

- (void)_createPrimaryViews
{
  id v5 = objc_alloc_init((Class)MFCaptionLabel);
  -[MFExpandableCaptionView setCaptionLabel:](self, "setCaptionLabel:");

  id v6 = [(MFExpandableCaptionView *)self captionLabel];
  [v6 setDataSource:self];

  id v7 = [(MFExpandableCaptionView *)self captionLabel];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = +[UIColor mailSubtitleGrayColor];
  v3 = [(MFExpandableCaptionView *)self captionLabel];
  [v3 setTextColor:v8];

  id v9 = +[MFCaptionLabel defaultFont];
  objc_super v4 = [(MFExpandableCaptionView *)self captionLabel];
  [v4 setFont:v9];

  id v10 = [(MFExpandableCaptionView *)self captionLabel];
  -[MFExpandableCaptionView addSubview:](self, "addSubview:");

  id v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  -[MFExpandableCaptionView setLastBaseLineDeceptionLabel:](self, "setLastBaseLineDeceptionLabel:");

  id v12 = [(MFExpandableCaptionView *)self lastBaseLineDeceptionLabel];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v13 = [(MFExpandableCaptionView *)self lastBaseLineDeceptionLabel];
  -[MFExpandableCaptionView addSubview:](self, "addSubview:");
}

- (void)_initializePrimaryLayoutConstraints
{
  v3 = [(MFExpandableCaptionView *)self lastBaseLineDeceptionLabel];
  objc_super v4 = [v3 lastBaselineAnchor];
  id v5 = [(MFExpandableCaptionView *)self captionLabel];
  id v6 = [v5 lastBaselineAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  [(MFExpandableCaptionView *)self setLastBaselineLabelConstraint:v7];

  v25 = [(MFExpandableCaptionView *)self captionLabel];
  v24 = [v25 leadingAnchor];
  v22 = [(MFExpandableCaptionView *)self leadingAnchor];
  v21 = [v24 constraintEqualToAnchor:];
  v26[0] = v21;
  v20 = [(MFExpandableCaptionView *)self captionLabel];
  v23 = [v20 trailingAnchor];
  v19 = [(MFExpandableCaptionView *)self trailingAnchor];
  v18 = [v23 constraintLessThanOrEqualToAnchor:];
  v26[1] = v18;
  id v8 = [(MFExpandableCaptionView *)self captionLabel];
  id v9 = [v8 topAnchor];
  id v10 = [(MFExpandableCaptionView *)self topAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  v26[2] = v11;
  id v12 = [(MFExpandableCaptionView *)self bottomAnchor];
  id v13 = [(MFExpandableCaptionView *)self lastBaseLineDeceptionLabel];
  v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v26[3] = v15;
  v16 = [(MFExpandableCaptionView *)self lastBaselineLabelConstraint];
  v26[4] = v16;
  v17 = +[NSArray arrayWithObjects:v26 count:5];

  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)setListSpacing:(double)a3
{
  if (self->_listSpacing != a3)
  {
    self->_listSpacing = a3;
    [(MFExpandableCaptionView *)self setNeedsUpdateConstraints];
  }
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  [UIApp preferredContentSizeCategory:a3];
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  id v9 = [(MFExpandableCaptionView *)self timestampLabel];
  [v9 setNumberOfLines:!IsAccessibilityCategory];

  id v10 = [UIApp preferredContentSizeCategory];
  BOOL v5 = UIContentSizeCategoryIsAccessibilityCategory(v10);

  id v6 = [(MFExpandableCaptionView *)self timestampLabel];
  if (v5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 4;
  }
  id v11 = v6;
  [v6 setLineBreakMode:v7];
}

- (void)updateConstraints
{
  v13.receiver = self;
  v13.super_class = (Class)MFExpandableCaptionView;
  [(MFExpandableCaptionView *)&v13 updateConstraints];
  v3 = [(MFExpandableCaptionView *)self captionLabelTrailingConstraint];

  if (!v3)
  {
    objc_super v4 = [(MFExpandableCaptionView *)self captionLabel];
    BOOL v5 = [v4 trailingAnchor];
    id v6 = [(MFExpandableCaptionView *)self trailingAnchor];
    uint64_t v7 = [v5 constraintEqualToAnchor:v6 constant:-5.0];
    [(MFExpandableCaptionView *)self setCaptionLabelTrailingConstraint:v7];

    id v8 = [(MFExpandableCaptionView *)self captionLabelTrailingConstraint];
    [v8 setActive:1];
  }
  [(MFExpandableCaptionView *)self listSpacing];
  double v10 = v9;
  id v11 = [(MFExpandableCaptionView *)self atomListStackView];
  [v11 setSpacing:v10];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010714;
  v12[3] = &unk_10003CD18;
  v12[4] = self;
  [(MFExpandableCaptionView *)self iterateAtomListsWithBlock:v12];
}

- (id)viewForFirstBaselineLayout
{
  v2 = [(MFExpandableCaptionView *)self captionLabel];
  v3 = [v2 viewForFirstBaselineLayout];

  return v3;
}

- (void)setParticipants:(id)a3
{
  id v5 = a3;
  id v4 = [v5 mutableCopy];
  [(MFExpandableCaptionView *)self setParticipantDictionary:v4];

  [(MFExpandableCaptionView *)self reloadData];
}

- (void)setOtherSigners:(id)a3
{
  id v6 = a3;
  id v4 = [(MFExpandableCaptionView *)self participantDictionary];

  if (v4)
  {
    id v5 = [(MFExpandableCaptionView *)self participantDictionary];
    [v5 setObject:v6 forKeyedSubscript:@"OtherSignersAtomsKey"];

    [(MFExpandableCaptionView *)self reloadData];
  }
}

- (void)setBIMIVerified:(BOOL)a3
{
  [(MFExpandableCaptionView *)self setBimiVerified:a3];

  [(MFExpandableCaptionView *)self reloadData];
}

- (void)reloadData
{
  if ([(MFExpandableCaptionView *)self isOutgoing])
  {
    v3 = [(MFExpandableCaptionView *)self captionLabel];
    [v3 setToRecipients:0];

    id v4 = [(MFExpandableCaptionView *)self participantDictionary];
    id v5 = [v4 objectForKeyedSubscript:@"FromAtomsKey"];
    id v6 = [(MFExpandableCaptionView *)self captionLabel];
    [v6 setFromSenders:v5];
  }
  else
  {
    uint64_t v7 = [(MFExpandableCaptionView *)self participantDictionary];
    id v8 = [v7 objectForKeyedSubscript:@"ToAtomsKey"];
    double v9 = [(MFExpandableCaptionView *)self captionLabel];
    [v9 setToRecipients:v8];

    id v4 = [(MFExpandableCaptionView *)self captionLabel];
    [v4 setFromSenders:0];
  }

  double v10 = [(MFExpandableCaptionView *)self participantDictionary];
  id v11 = [v10 objectForKeyedSubscript:@"CcAtomsKey"];
  id v12 = [(MFExpandableCaptionView *)self captionLabel];
  [v12 setCcRecipients:v11];

  objc_super v13 = [(MFExpandableCaptionView *)self participantDictionary];
  v14 = [v13 objectForKeyedSubscript:@"BccAtomsKey"];
  v15 = [(MFExpandableCaptionView *)self captionLabel];
  [v15 setBccRecipients:v14];

  v16 = [(MFExpandableCaptionView *)self participantDictionary];
  v17 = [v16 objectForKeyedSubscript:@"OtherSignersAtomsKey"];
  v18 = [(MFExpandableCaptionView *)self captionLabel];
  [v18 setOtherSigners:v17];

  v19 = [(MFExpandableCaptionView *)self participantDictionary];
  v20 = [v19 objectForKeyedSubscript:@"ReplyToAtomsKey"];
  v21 = [(MFExpandableCaptionView *)self captionLabel];
  [v21 setReplyToSenders:v20];

  v22 = [(MFExpandableCaptionView *)self participantDictionary];
  v23 = [v22 objectForKeyedSubscript:@"FromAtomsKey"];
  v24 = [(MFExpandableCaptionView *)self captionLabel];
  v25 = [v24 replyToSenders];
  id v26 = +[MFAddressAtomStatusManager shouldDecorateAtomListForSender:v23 replyTo:v25];
  v27 = [(MFExpandableCaptionView *)self captionLabel];
  [v27 setHasDifferentReplyToAddress:v26];

  if ([(MFExpandableCaptionView *)self isExpanded])
  {
    [(MFExpandableCaptionView *)self _setRecipientDetailsVisible:0];
    [(MFExpandableCaptionView *)self _setRecipientDetailsVisible:1];
    [(MFExpandableCaptionView *)self _reattachBottomConstraint];
  }
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  if (self->_expanded != a3 || a5)
  {
    BOOL v6 = a4;
    BOOL v7 = a3;
    if (a3)
    {
      -[MFExpandableCaptionView _setRecipientDetailsVisible:](self, "_setRecipientDetailsVisible:", 0, a4, a5);
      [(MFExpandableCaptionView *)self _setRecipientDetailsVisible:1];
    }
    id v9 = [objc_alloc((Class)MFSimpleAnimationCoordinator) initCoordinatorAnimated:v6];
    double v10 = [(MFExpandableCaptionView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v10 expandableCaptionView:self willBecomeExpanded:v7 withAnimationCoordinator:v9];
    }
    if (v7 && v6) {
      [(MFExpandableCaptionView *)self layoutIfNeeded];
    }
    self->_expanded = v7;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100010F3C;
    v22[3] = &unk_10003CD40;
    v22[4] = self;
    BOOL v24 = v7;
    id v11 = v9;
    id v23 = v11;
    id v12 = objc_retainBlock(v22);
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_100010FFC;
    v18 = &unk_10003CD68;
    BOOL v21 = v7;
    v19 = self;
    id v13 = v11;
    id v20 = v13;
    v14 = objc_retainBlock(&v15);
    [(MFExpandableCaptionView *)self setNeedsUpdateConstraints];
    if (v6)
    {
      +[UIView animateWithDuration:0 delay:v12 usingSpringWithDamping:v14 initialSpringVelocity:0.349999994 options:0.0 animations:1.0 completion:0.0];
    }
    else
    {
      ((void (*)(void *))v12[2])(v12);
      ((void (*)(void ***, uint64_t))v14[2])(v14, 1);
    }
  }
}

- (void)_reattachBottomConstraint
{
  id v8 = [(MFExpandableCaptionView *)self lastBaselineLabelConstraint];
  [v8 setActive:0];

  BOOL expanded = self->_expanded;
  id v9 = [(MFExpandableCaptionView *)self lastBaseLineDeceptionLabel];
  [v9 lastBaselineAnchor];
  if (expanded) {
    id v4 = {;
  }
    [(MFExpandableCaptionView *)self atomListStackView];
  }
  else {
    id v4 = {;
  }
    [(MFExpandableCaptionView *)self captionLabel];
  id v5 = };
  BOOL v6 = [v5 lastBaselineAnchor];
  BOOL v7 = [v4 constraintGreaterThanOrEqualToAnchor:v6];
  [(MFExpandableCaptionView *)self setLastBaselineLabelConstraint:v7];

  id v10 = [(MFExpandableCaptionView *)self lastBaselineLabelConstraint];
  [v10 setActive:1];
}

- (void)_setRecipientDetailsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MFExpandableCaptionView *)self atomListStackView];
  BOOL v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      BOOL v7 = +[UIStackView mf_baselineAlignedVerticalStackView];
      [(MFExpandableCaptionView *)self setAtomListStackView:v7];

      if ([(MFExpandableCaptionView *)self isExpanded]) {
        double v8 = 1.0;
      }
      else {
        double v8 = 0.0;
      }
      id v9 = [(MFExpandableCaptionView *)self atomListStackView];
      [v9 setAlpha:v8];

      id v10 = [(MFExpandableCaptionView *)self atomListStackView];
      id v11 = [(MFExpandableCaptionView *)self captionLabel];
      [(MFExpandableCaptionView *)self insertSubview:v10 belowSubview:v11];
    }
    if (![(MFExpandableCaptionView *)self isOutgoing])
    {
      id v12 = [(MFExpandableCaptionView *)self participantDictionary];
      id v13 = [v12 objectForKeyedSubscript:@"ToAtomsKey"];

      if ([v13 count])
      {
        v14 = +[NSBundle mainBundle];
        v15 = [v14 localizedStringForKey:@"TO_HEADER" value:&stru_10003D3F8 table:@"Main"];
        uint64_t v16 = +[NSBundle mainBundle];
        v17 = [v16 localizedStringForKey:@"TO_TITLE" value:&stru_10003D3F8 table:@"Main"];
        [(MFExpandableCaptionView *)self _addAtomListForAddresses:v13 label:v15 title:v17 key:@"ToAtomsKey"];
      }
    }
    v18 = [(MFExpandableCaptionView *)self participantDictionary];
    v19 = [v18 objectForKeyedSubscript:@"CcAtomsKey"];

    v105 = v19;
    if ([v19 count])
    {
      id v20 = +[NSBundle mainBundle];
      BOOL v21 = [v20 localizedStringForKey:@"CC_HEADER" value:&stru_10003D3F8 table:@"Main"];
      v22 = +[NSBundle mainBundle];
      id v23 = [v22 localizedStringForKey:@"CC_TITLE" value:&stru_10003D3F8 table:@"Main"];
      [(MFExpandableCaptionView *)self _addAtomListForAddresses:v105 label:v21 title:v23 key:@"CcAtomsKey"];
    }
    BOOL v24 = [(MFExpandableCaptionView *)self participantDictionary];
    v25 = [v24 objectForKeyedSubscript:@"BccAtomsKey"];

    v104 = v25;
    if ([v25 count])
    {
      id v26 = +[NSBundle mainBundle];
      v27 = [v26 localizedStringForKey:@"BCC_HEADER" value:&stru_10003D3F8 table:@"Main"];
      v28 = +[NSBundle mainBundle];
      v29 = [v28 localizedStringForKey:@"BCC_TITLE" value:&stru_10003D3F8 table:@"Main"];
      [(MFExpandableCaptionView *)self _addAtomListForAddresses:v104 label:v27 title:v29 key:@"BccAtomsKey"];
    }
    v30 = [(MFExpandableCaptionView *)self participantDictionary];
    v31 = [v30 objectForKeyedSubscript:@"OtherSignersAtomsKey"];

    v103 = v31;
    if ([v31 count])
    {
      v32 = +[NSBundle mainBundle];
      v33 = [v32 localizedStringForKey:@"OTHER_SIGNERS_HEADER" value:&stru_10003D3F8 table:@"Main"];
      v34 = +[NSBundle mainBundle];
      v35 = [v34 localizedStringForKey:@"OTHER_SIGNERS_TITLE" value:&stru_10003D3F8 table:@"Main"];
      [(MFExpandableCaptionView *)self _addAtomListForAddresses:v103 label:v33 title:v35 key:@"OtherSignersAtomsKey"];
    }
    if ([(MFExpandableCaptionView *)self isOutgoing])
    {
      v36 = [(MFExpandableCaptionView *)self participantDictionary];
      v37 = [v36 objectForKeyedSubscript:@"FromAtomsKey"];

      if ([v37 count])
      {
        v38 = +[NSBundle mainBundle];
        v39 = [v38 localizedStringForKey:@"FROM_HEADER" value:&stru_10003D3F8 table:@"Main"];
        v40 = +[NSBundle mainBundle];
        v41 = [v40 localizedStringForKey:@"FROM_TITLE" value:&stru_10003D3F8 table:@"Main"];
        [(MFExpandableCaptionView *)self _addAtomListForAddresses:v37 label:v39 title:v41 key:@"FromAtomsKey"];
      }
    }
    v42 = [(MFExpandableCaptionView *)self participantDictionary];
    v43 = [v42 objectForKeyedSubscript:@"ReplyToAtomsKey"];

    v102 = v43;
    if ([v43 count])
    {
      v44 = _EFLocalizedString();
      v45 = _EFLocalizedString();
      [(MFExpandableCaptionView *)self _addAtomListForAddresses:v102 label:v44 title:v45 key:@"ReplyToAtomsKey"];
    }
    if ([(MFExpandableCaptionView *)self showsBIMIWhenExpanded]
      && [(MFExpandableCaptionView *)self isBIMIVerified])
    {
      v46 = [(MFExpandableCaptionView *)self bimiStackView];

      if (!v46)
      {
        id v47 = objc_alloc((Class)UIStackView);
        double y = CGRectZero.origin.y;
        double width = CGRectZero.size.width;
        double height = CGRectZero.size.height;
        id v51 = [v47 initWithFrame:CGRectZero.origin.x, y, width, height];
        [(MFExpandableCaptionView *)self setBimiStackView:v51];

        v52 = [(MFExpandableCaptionView *)self bimiStackView];
        [v52 setAlignment:2];

        v53 = [(MFExpandableCaptionView *)self bimiStackView];
        [v53 setTranslatesAutoresizingMaskIntoConstraints:0];

        id v54 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
        v55 = [(MFExpandableCaptionView *)self font];
        [v54 setFont:v55];

        v56 = +[UIColor mailSubtitleGrayColor];
        [v54 setTextColor:v56];

        v57 = _EFLocalizedString();
        [v54 setText:v57];

        LODWORD(v58) = 1148846080;
        [v54 setContentHuggingPriority:0 forAxis:v58];
        v59 = [(MFExpandableCaptionView *)self bimiStackView];
        [v59 addArrangedSubview:v54];

        v60 = +[UIButtonConfiguration plainButtonConfiguration];
        [v60 setButtonSize:2];
        v61 = _EFLocalizedString();
        [v60 setTitle:v61];
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        v107[0] = _NSConcreteStackBlock;
        v107[1] = 3221225472;
        v107[2] = sub_10001227C;
        v107[3] = &unk_10003CD90;
        objc_copyWeak(&v108, &location);
        v62 = +[UIAction actionWithHandler:v107];
        v63 = +[UIButton buttonWithConfiguration:v60 primaryAction:v62];

        v64 = [(MFExpandableCaptionView *)self bimiStackView];
        [v64 addArrangedSubview:v63];

        v65 = [(MFExpandableCaptionView *)self bimiStackView];
        v66 = objc_opt_new();
        [v65 addArrangedSubview:v66];

        objc_destroyWeak(&v108);
        objc_destroyWeak(&location);
      }
      v67 = [(MFExpandableCaptionView *)self atomListStackView];
      v68 = [(MFExpandableCaptionView *)self bimiStackView];
      [v67 addArrangedSubview:v68];
    }
    if ([(MFExpandableCaptionView *)self showsTimestampWhenExpanded])
    {
      v69 = [(MFExpandableCaptionView *)self timestampLabel];
      BOOL v70 = v69 == 0;

      if (v70)
      {
        id v71 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
        [(MFExpandableCaptionView *)self setTimestampLabel:v71];

        v72 = [(MFExpandableCaptionView *)self timestampLabel];
        [v72 setTranslatesAutoresizingMaskIntoConstraints:0];

        v73 = [(MFExpandableCaptionView *)self font];
        v74 = [(MFExpandableCaptionView *)self timestampLabel];
        [v74 setFont:v73];

        v75 = +[UIColor mailSubtitleGrayColor];
        v76 = [(MFExpandableCaptionView *)self timestampLabel];
        [v76 setTextColor:v75];

        v77 = [UIApp preferredContentSizeCategory];
        LODWORD(v76) = UIContentSizeCategoryIsAccessibilityCategory(v77);

        v78 = [(MFExpandableCaptionView *)self timestampLabel];
        [v78 setNumberOfLines:v76 ^ 1];

        v79 = [UIApp preferredContentSizeCategory];
        LODWORD(v76) = UIContentSizeCategoryIsAccessibilityCategory(v79);

        v80 = [(MFExpandableCaptionView *)self timestampLabel];
        v81 = v80;
        if (v76) {
          uint64_t v82 = 0;
        }
        else {
          uint64_t v82 = 4;
        }
        [v80 setLineBreakMode:v82];
      }
      v83 = [(MFExpandableCaptionView *)self dateSent];
      v84 = +[NSDateFormatter ef_formatDate:v83 shortStyle:0];

      v85 = [(MFExpandableCaptionView *)self timestampLabel];
      [v85 setText:v84];

      v86 = [(MFExpandableCaptionView *)self atomListStackView];
      v87 = [(MFExpandableCaptionView *)self timestampLabel];
      [v86 addArrangedSubview:v87];
    }
    v99 = [(MFExpandableCaptionView *)self atomListStackView];
    v106 = [v99 firstBaselineAnchor];
    v101 = [(MFExpandableCaptionView *)self captionLabel];
    v98 = [v101 firstBaselineAnchor];
    v100 = [v106 constraintEqualToAnchor:];
    v110[0] = v100;
    v88 = [(MFExpandableCaptionView *)self atomListStackView];
    v89 = [v88 leadingAnchor];
    v90 = [(MFExpandableCaptionView *)self leadingAnchor];
    v91 = [v89 constraintEqualToAnchor:v90];
    v110[1] = v91;
    v92 = [(MFExpandableCaptionView *)self atomListStackView];
    v93 = [v92 trailingAnchor];
    v94 = [(MFExpandableCaptionView *)self trailingAnchor];
    v95 = [v93 constraintEqualToAnchor:v94];
    v110[2] = v95;
    v96 = +[NSArray arrayWithObjects:v110 count:3];

    +[NSLayoutConstraint activateConstraints:v96];
  }
  else
  {
    [v5 removeFromSuperview];

    [(MFExpandableCaptionView *)self setAtomListStackView:0];
  }
  v97 = [(MFExpandableCaptionView *)self timestampLabel];
  [v97 setAccessibilityIdentifier:MSAccessibilityIdentifierMailConversationViewReceivedDateTime];
}

- (id)captionLabel:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  double v8 = [(MFExpandableCaptionView *)self delegate];
  id v9 = [v8 expandableCaptionView:self displayNameForEmailAddress:v7 abbreviated:v5];

  return v9;
}

- (void)iterateAtomListsWithBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = [(MFExpandableCaptionView *)self atomListStackView];
  BOOL v6 = [v5 arrangedSubviews];

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v4[2](v4, v10);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_addAtomListForAddresses:(id)a3 label:(id)a4 title:(id)a5 key:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc((Class)MFModernLabelledAtomList);
  v15 = +[MFAddressBookManager sharedManager];
  id v16 = objc_msgSend(v14, "initWithLabel:title:addressBook:", v11, v12, objc_msgSend(v15, "addressBook"));

  [(MFExpandableCaptionView *)self listSpacing];
  [v16 setLineSpacing:];
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  BOOL v21 = sub_1000126A4;
  v22 = &unk_10003CDB8;
  id v17 = v13;
  id v23 = v17;
  BOOL v24 = self;
  [v16 setAddresses:v10 withCompletion:&v19];
  v18 = [(MFExpandableCaptionView *)self atomListStackView];
  [v18 addArrangedSubview:v16];
}

- (void)_recipientAtomPressed:(id)a3
{
  id v5 = a3;
  id v4 = [(MFExpandableCaptionView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 expandableCaptionView:self didTapAtom:v5 forAtomType:0];
  }
}

- (void)_senderAtomPressed:(id)a3
{
  id v5 = a3;
  id v4 = [(MFExpandableCaptionView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 expandableCaptionView:self didTapAtom:v5 forAtomType:1];
  }
}

- (void)_replyToAtomPressed:(id)a3
{
  id v5 = a3;
  id v4 = [(MFExpandableCaptionView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 expandableCaptionView:self didTapAtom:v5 forAtomType:2];
  }
}

- (void)_bimiLearnMorePressed
{
  id v3 = [(MFExpandableCaptionView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 expandableCaptionViewDidTapBIMILearnMore:self];
  }
}

- (MFExpandableCaptionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFExpandableCaptionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)listSpacing
{
  return self->_listSpacing;
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (MFCaptionLabel)captionLabel
{
  return self->_captionLabel;
}

- (void)setCaptionLabel:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(BOOL)a3
{
  self->_outgoing = a3;
}

- (BOOL)hideDetailsButton
{
  return self->_hideDetailsButton;
}

- (void)setHideDetailsButton:(BOOL)a3
{
  self->_hideDetailsButton = a3;
}

- (BOOL)showsBIMIWhenExpanded
{
  return self->_showsBIMIWhenExpanded;
}

- (void)setShowsBIMIWhenExpanded:(BOOL)a3
{
  self->_showsBIMIWhenExpanded = a3;
}

- (BOOL)showsTimestampWhenExpanded
{
  return self->_showsTimestampWhenExpanded;
}

- (void)setShowsTimestampWhenExpanded:(BOOL)a3
{
  self->_showsTimestampWhenExpanded = a3;
}

- (UIStackView)atomListStackView
{
  return self->_atomListStackView;
}

- (void)setAtomListStackView:(id)a3
{
}

- (UILabel)lastBaseLineDeceptionLabel
{
  return self->_lastBaseLineDeceptionLabel;
}

- (void)setLastBaseLineDeceptionLabel:(id)a3
{
}

- (UILabel)timestampLabel
{
  return self->_timestampLabel;
}

- (void)setTimestampLabel:(id)a3
{
}

- (UIStackView)bimiStackView
{
  return self->_bimiStackView;
}

- (void)setBimiStackView:(id)a3
{
}

- (NSLayoutConstraint)captionLabelTrailingConstraint
{
  return self->_captionLabelTrailingConstraint;
}

- (void)setCaptionLabelTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)lastBaselineLabelConstraint
{
  return self->_lastBaselineLabelConstraint;
}

- (void)setLastBaselineLabelConstraint:(id)a3
{
}

- (NSMutableDictionary)participantDictionary
{
  return self->_participantDictionary;
}

- (void)setParticipantDictionary:(id)a3
{
}

- (BOOL)isBIMIVerified
{
  return self->_bimiVerified;
}

- (void)setBimiVerified:(BOOL)a3
{
  self->_bimiVerified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantDictionary, 0);
  objc_storeStrong((id *)&self->_lastBaselineLabelConstraint, 0);
  objc_storeStrong((id *)&self->_captionLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bimiStackView, 0);
  objc_storeStrong((id *)&self->_timestampLabel, 0);
  objc_storeStrong((id *)&self->_lastBaseLineDeceptionLabel, 0);
  objc_storeStrong((id *)&self->_atomListStackView, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end