@interface MFCollapsedMessageCell
+ (double)defaultHeightWithDisplayMetrics:(id)a3;
- (BOOL)isActionCardHeader;
- (BOOL)shouldApplySystemLighterMaterial;
- (BOOL)shouldHideAvatarSuperview;
- (BOOL)shouldShowSubject;
- (ConversationSearchOverlayView)findOverlayView;
- (MFAvatarView)avatarView;
- (MFCollapsedMessageCell)initWithFrame:(CGRect)a3;
- (MessageViewStatusIndicatorManager)horizontalStatusIndicatorManager;
- (MessageViewStatusIndicatorManager)verticalStatusIndicatorManager;
- (UIDateLabel)timestampLabel;
- (UIImageView)avatarSuperview;
- (UILabel)senderOrSubjectLabel;
- (UILabel)summaryLabel;
- (double)_baselineToBaselineSpacingInConversation;
- (double)_leadingMargin;
- (double)_messageBottomPaddingInConversation;
- (double)_messageTopPaddingInConversation;
- (double)_topToSenderBaselineInConversation;
- (id)_messageFromViewModel:(id)a3;
- (void)_createPrimaryViews;
- (void)_fontMetricCacheDidInvalidate:(id)a3;
- (void)_layoutLabelBetweenViews:(id)a3 leading:(id)a4 trailing:(id)a5 baseline:(double)a6 fillWidth:(BOOL)a7;
- (void)_layoutSubviews;
- (void)_sizeToFitLabels;
- (void)_updateAvatarSuperview;
- (void)_updateFonts;
- (void)_updateForViewModelChange;
- (void)_updateHorizontalStatusIndicatorsFromViewModel:(id)a3;
- (void)_updateLabelColor;
- (void)_updateLabelFrameAfterHorizontalStatusIndicators:(CGRect)a3 label:(id)a4;
- (void)_updateSummary:(id)a3 didComplete:(BOOL)a4;
- (void)_updateSummaryNumberOfLines;
- (void)_updateVerticalStatusIndicatorsFromViewModel:(id)a3;
- (void)addConversationSearchOverlay;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)removeConversationSearchOverlay;
- (void)setAvatarSuperview:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setFindOverlayView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHorizontalStatusIndicatorManager:(id)a3;
- (void)setIsActionCardHeader:(BOOL)a3;
- (void)setSenderOrSubjectLabel:(id)a3;
- (void)setShouldShowSubject:(BOOL)a3;
- (void)setSummaryLabel:(id)a3;
- (void)setTimestampLabel:(id)a3;
- (void)setVerticalStatusIndicatorManager:(id)a3;
- (void)setViewModel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MFCollapsedMessageCell

- (MFCollapsedMessageCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFCollapsedMessageCell;
  v3 = -[MFMessageConversationViewCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFCollapsedMessageCell *)v3 _createPrimaryViews];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_fontMetricCacheDidInvalidate:" name:MFFontMetricCacheInvalidationNotification object:0];

    [(MFMessageConversationViewCell *)v4 setRoundsCellCorners:1];
  }
  return v4;
}

- (ConversationSearchOverlayView)findOverlayView
{
  findOverlayView = self->_findOverlayView;
  if (!findOverlayView)
  {
    id v4 = objc_alloc((Class)ConversationSearchOverlayView);
    [(MFCollapsedMessageCell *)self bounds];
    v5 = [v4 initWithFrame:];
    v6 = self->_findOverlayView;
    self->_findOverlayView = v5;

    objc_super v7 = [(MFCollapsedMessageCell *)self contentView];
    [v7 addSubview:self->_findOverlayView];

    findOverlayView = self->_findOverlayView;
  }

  return findOverlayView;
}

- (void)_createPrimaryViews
{
  v3 = +[UIColor mailConversationViewCollapsedCellBackgroundColor];
  id v4 = [(MFCollapsedMessageCell *)self contentView];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(MFCollapsedMessageCell *)self setSenderOrSubjectLabel:v9];

  v10 = [(MFCollapsedMessageCell *)self contentView];
  v11 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
  [v10 addSubview:v11];

  id v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(MFCollapsedMessageCell *)self setSummaryLabel:v12];

  v13 = [(MFCollapsedMessageCell *)self contentView];
  v14 = [(MFCollapsedMessageCell *)self summaryLabel];
  [v13 addSubview:v14];

  id v15 = [objc_alloc((Class)UIDateLabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(MFCollapsedMessageCell *)self setTimestampLabel:v15];

  v16 = [(MFCollapsedMessageCell *)self contentView];
  v17 = [(MFCollapsedMessageCell *)self timestampLabel];
  [v16 addSubview:v17];

  [(MFCollapsedMessageCell *)self _updateLabelColor];
  +[MFMessageDisplayMetrics avatarDiameter];
  double v19 = v18;
  v20 = -[MFAvatarView initWithFrame:]([MFAvatarView alloc], "initWithFrame:", 0.0, 0.0, v19, v19);
  [(MFCollapsedMessageCell *)self setAvatarView:v20];

  v21 = [(MFCollapsedMessageCell *)self avatarView];
  [v21 setShowsContactOnTap:1];

  v22 = [(MFCollapsedMessageCell *)self avatarView];
  [v22 setAlpha:0.4];

  id v23 = [objc_alloc((Class)UIImageView) initWithFrame:0.0, 0.0, v19, v19];
  [(MFCollapsedMessageCell *)self setAvatarSuperview:v23];

  v24 = [(MFCollapsedMessageCell *)self avatarSuperview];
  v25 = [(MFCollapsedMessageCell *)self avatarView];
  [v24 addSubview:v25];

  [(MFCollapsedMessageCell *)self _updateAvatarSuperview];
  v26 = objc_alloc_init(MessageViewStatusIndicatorManager);
  [(MFCollapsedMessageCell *)self setVerticalStatusIndicatorManager:v26];

  v27 = [(MFCollapsedMessageCell *)self verticalStatusIndicatorManager];
  [v27 setHidesVIPIndicator:1];

  v28 = objc_alloc_init(MessageViewStatusIndicatorManager);
  [(MFCollapsedMessageCell *)self setHorizontalStatusIndicatorManager:v28];

  [(MFCollapsedMessageCell *)self _updateSummaryNumberOfLines];

  [(MFCollapsedMessageCell *)self _updateFonts];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MFCollapsedMessageCell;
  [(MFMessageConversationViewCell *)&v3 layoutSubviews];
  [(MFCollapsedMessageCell *)self _layoutSubviews];
}

- (void)_layoutSubviews
{
  v61 = [(MFCollapsedMessageCell *)self contentView];
  v62 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
  v60 = [(MFCollapsedMessageCell *)self summaryLabel];
  objc_super v3 = [(MFCollapsedMessageCell *)self timestampLabel];
  id v4 = [(MFCollapsedMessageCell *)self avatarSuperview];
  unsigned int v5 = [(MFCollapsedMessageCell *)self shouldHideAvatarSuperview];
  unsigned int v6 = [(MFCollapsedMessageCell *)self mf_prefersRightToLeftInterfaceLayout];
  unsigned int v7 = [(MFCollapsedMessageCell *)self shouldShowSubject];
  v8 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v8);

  v10 = [(MFConversationViewCell *)self displayMetrics];
  [v61 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [(MFCollapsedMessageCell *)self _topToSenderBaselineInConversation];
  double v20 = v19;
  [(MFCollapsedMessageCell *)self _baselineToBaselineSpacingInConversation];
  double v63 = v21;
  [(MFCollapsedMessageCell *)self _leadingMargin];
  double v23 = v22;
  [v10 avatarDiameterForCurrentContentSize];
  double v25 = v24;
  double v26 = v23;
  if (v6)
  {
    v70.origin.x = v12;
    v70.origin.double y = v14;
    v70.size.double width = v16;
    v70.size.double height = v18;
    double Width = CGRectGetWidth(v70);
    v71.origin.x = 0.0;
    v71.origin.double y = 0.0;
    v71.size.double width = v25;
    v71.size.double height = v25;
    double v26 = Width - (v23 + CGRectGetWidth(v71));
  }
  [(MFCollapsedMessageCell *)self _messageTopPaddingInConversation];
  double v29 = v28;
  v72.origin.double y = 0.0;
  v72.origin.x = v26;
  v72.size.double width = v25;
  v72.size.double height = v25;
  double Height = CGRectGetHeight(v72);
  double v31 = -0.0;
  if (!v5) {
    double v31 = v63;
  }
  [v4 setFrame:v26, v31 + v20 + v29 - Height, v25, v25];
  [(MFCollapsedMessageCell *)self avatarView];
  CGFloat v32 = v12;
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  [v33 frame];
  [v33 setFrame:];

  [v3 frame];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  if (((v6 | IsAccessibilityCategory) & 1) == 0)
  {
    CGFloat v41 = v34;
    v73.origin.x = v32;
    v73.origin.double y = v14;
    v73.size.double height = v58;
    v73.size.double width = v59;
    double v42 = CGRectGetWidth(v73);
    v74.origin.x = v41;
    v74.origin.double y = v36;
    v74.size.double width = v38;
    v74.size.double height = v40;
    double v23 = v42 - CGRectGetWidth(v74) - v23;
  }
  [v3 setFrame:v23, v36, v38, v40];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10017FD40;
  v64[3] = &unk_10060AF18;
  BOOL v69 = IsAccessibilityCategory;
  id v43 = v60;
  double v68 = v63;
  id v65 = v43;
  v66 = self;
  id v44 = v3;
  id v67 = v44;
  v45 = objc_retainBlock(v64);
  if (v7)
  {
    if (IsAccessibilityCategory) {
      id v46 = 0;
    }
    else {
      id v46 = v44;
    }
    [(MFCollapsedMessageCell *)self _layoutLabelBetweenViews:v62 leading:0 trailing:v46 baseline:1 fillWidth:v20];
    [(MFCollapsedMessageCell *)self _layoutLabelBetweenViews:v44 leading:v62 trailing:0 baseline:0 fillWidth:v20];
    double v47 = v20 + v63;
    [(MFCollapsedMessageCell *)self _layoutLabelBetweenViews:v43 leading:0 trailing:0 baseline:1 fillWidth:v47];
    goto LABEL_14;
  }
  if (v5)
  {
    [(MFCollapsedMessageCell *)self _layoutLabelBetweenViews:v62 leading:0 trailing:0 baseline:1 fillWidth:v20];
    double v47 = v20 + v63;
    [(MFCollapsedMessageCell *)self _layoutLabelBetweenViews:v43 leading:0 trailing:0 baseline:1 fillWidth:v47];
LABEL_14:
    ((void (*)(void *, double))v45[2])(v45, v47);
    goto LABEL_16;
  }
  [(MFCollapsedMessageCell *)self _layoutLabelBetweenViews:v62 leading:v4 trailing:v44 baseline:1 fillWidth:v20];
  [(MFCollapsedMessageCell *)self _layoutLabelBetweenViews:v44 leading:v62 trailing:0 baseline:0 fillWidth:v20];
  [(MFCollapsedMessageCell *)self _layoutLabelBetweenViews:v43 leading:v4 trailing:0 baseline:1 fillWidth:v20 + v63];
LABEL_16:
  v48 = [(MFConversationViewCell *)self viewModel];
  [(MFCollapsedMessageCell *)self _updateVerticalStatusIndicatorsFromViewModel:v48];
  [(MFCollapsedMessageCell *)self _updateHorizontalStatusIndicatorsFromViewModel:v48];
  if (self->_findOverlayView)
  {
    [(MFCollapsedMessageCell *)self bounds];
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    v57 = [(MFCollapsedMessageCell *)self findOverlayView];
    [v57 setFrame:v50, v52, v54, v56];
  }
  [(MFCollapsedMessageCell *)self mf_activateDebugModeIfEnabled];
}

- (void)_layoutLabelBetweenViews:(id)a3 leading:(id)a4 trailing:(id)a5 baseline:(double)a6 fillWidth:(BOOL)a7
{
  BOOL v7 = a7;
  double v45 = a6;
  id v47 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned int v13 = [(MFCollapsedMessageCell *)self mf_prefersRightToLeftInterfaceLayout];
  CGFloat v14 = [(MFConversationViewCell *)self displayMetrics];
  [v14 minHorizontalSpacing];
  double v16 = v15;

  [(MFCollapsedMessageCell *)self _leadingMargin];
  double v18 = v17;
  double v19 = [(MFCollapsedMessageCell *)self contentView];
  [v19 bounds];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  [v19 layoutMargins];
  double v29 = v28;
  if (v13) {
    v30 = v12;
  }
  else {
    v30 = v11;
  }
  if (v13) {
    double v31 = v11;
  }
  else {
    double v31 = v12;
  }
  if (v13) {
    double v32 = v18;
  }
  else {
    double v32 = v28;
  }
  id v33 = v30;
  id v34 = v31;
  double v35 = v34;
  if (!v33)
  {
    if (v13) {
      double v18 = v29;
    }
    if (v34) {
      goto LABEL_12;
    }
LABEL_16:
    v51.origin.x = v21;
    v51.origin.double y = v23;
    v51.size.double width = v25;
    v51.size.double height = v27;
    double v36 = CGRectGetWidth(v51) - v32;
    goto LABEL_17;
  }
  [v33 frame];
  double v18 = v16 + CGRectGetMaxX(v49);
  if (!v35) {
    goto LABEL_16;
  }
LABEL_12:
  [v35 frame:v45];
  double v36 = CGRectGetMinX(v50) - v16;
LABEL_17:
  [v47 frame:v45];
  double v41 = v39;
  double v42 = v40;
  double v43 = v18;
  if (!v33)
  {
    double v43 = v18;
    if (!v7) {
      double v43 = v36 - CGRectGetWidth(*(CGRect *)&v37);
    }
  }
  if (v7) {
    double v41 = v36 - v18;
  }
  [v47 _firstBaselineOffsetFromTop];
  UIRoundToViewScale();
  [v47 setFrame:v43, v46 - v44, v41, v42];
}

- (double)_leadingMargin
{
  objc_super v3 = [(MFCollapsedMessageCell *)self contentView];
  [v3 directionalLayoutMargins];
  double v5 = v4;

  unsigned int v6 = [(MFConversationViewCell *)self displayMetrics];
  [v6 minHorizontalSpacing];
  double v8 = v7;
  [v6 headerAvatarMaxOffset];
  double v10 = v5 - v9;
  if (v8 >= v10) {
    double v11 = v8;
  }
  else {
    double v11 = v10;
  }

  return v11;
}

+ (double)defaultHeightWithDisplayMetrics:(id)a3
{
  id v3 = a3;
  [v3 messageTopPaddingInConversation];
  double v5 = v4;
  [v3 topToSenderBaselineInConversation];
  double v7 = v6;
  [v3 baselineToBaselineSpacingInConversation];
  double v9 = v8;
  [v3 messageBottomPaddingInConversation];
  double v11 = v10;
  id v12 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v12);
  double v14 = v5 + v7 + v9 + v11;

  if (IsAccessibilityCategory)
  {
    [v3 baselineToBaselineSpacingInConversation];
    double v16 = v15;
    [v3 messageBottomPaddingInConversation];
    double v18 = v17;
    [v3 baselineToBaselineSpacingInConversation];
    double v14 = v14 + v16 * 2.0 - v18 + v19;
  }

  return v14;
}

- (void)_updateVerticalStatusIndicatorsFromViewModel:(id)a3
{
  id v4 = a3;
  double v5 = [(MFCollapsedMessageCell *)self verticalStatusIndicatorManager];
  double v6 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
  if ([(MFCollapsedMessageCell *)self shouldHideAvatarSuperview])
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [(MFCollapsedMessageCell *)self avatarSuperview];
  }
  double v8 = v7;
  unsigned int v9 = [v4 isVIP];
  unsigned int v10 = [v4 isRead];
  unsigned int v11 = [v4 isReplied];
  unsigned int v12 = [v4 isForwarded];
  uint64_t v13 = 2;
  if (!v9) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v13 | v10 ^ 1;
  if (v11) {
    v14 |= 8uLL;
  }
  if (v12) {
    uint64_t v15 = v14 | 0x10;
  }
  else {
    uint64_t v15 = v14;
  }
  [v5 setIndicatorOptions:v15];
  [v5 pruneIndicatorOptions:2];
  if ([v5 effectiveIndicatorOptions])
  {
    unsigned int v16 = [(MFCollapsedMessageCell *)self mf_prefersRightToLeftInterfaceLayout];
    if (v16)
    {
      [(MFCollapsedMessageCell *)self bounds];
      double Width = CGRectGetWidth(v38);
      [v8 frame];
      double MaxX = CGRectGetMaxX(v39);
      [v8 frame];
      CGFloat v19 = CGRectGetMaxX(v40);
      double v20 = [(MFCollapsedMessageCell *)self contentView];
      [v20 bounds];
      CGFloat Height = CGRectGetHeight(v41);
      double MinX = Width - MaxX;
    }
    else
    {
      [v8 frame];
      double MinX = CGRectGetMinX(v42);
      double v20 = [(MFCollapsedMessageCell *)self contentView];
      [v20 bounds];
      CGFloat Height = CGRectGetHeight(v43);
      CGFloat v19 = 0.0;
    }

    [v5 updateImageViews];
    [(MFCollapsedMessageCell *)self _baselineToBaselineSpacingInConversation];
    double v36 = v24;
    [v6 frame];
    double MaxY = CGRectGetMaxY(v44);
    [v6 _baselineOffsetFromBottom];
    double v27 = v26;
    double v28 = [v6 font];
    [v28 capHeight];
    double v30 = v29;

    if (v16)
    {
      v45.origin.x = v19;
      v45.origin.double y = 0.0;
      v45.size.double width = MinX;
      v45.size.double height = Height;
      double MidX = CGRectGetMidX(v45);
      v46.origin.x = v19;
      v46.origin.double y = 0.0;
      v46.size.double width = MinX;
      v46.size.double height = Height;
      double v32 = CGRectGetMinX(v46) + 14.0;
      if (MidX < v32) {
        double v32 = MidX;
      }
      double v33 = -1.0;
    }
    else
    {
      v47.origin.x = v19;
      v47.origin.double y = 0.0;
      v47.size.double width = MinX;
      v47.size.double height = Height;
      double v34 = CGRectGetMidX(v47);
      v48.origin.x = v19;
      v48.origin.double y = 0.0;
      v48.size.double width = MinX;
      v48.size.double height = Height;
      double v32 = CGRectGetMaxX(v48) + -14.0;
      if (v34 >= v32) {
        double v32 = v34;
      }
      double v33 = 1.0;
    }
    double v35 = v32 + v33;
    CGFloat v23 = [v5 statusIndicatorImageViews];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100180564;
    v37[3] = &unk_10060AF40;
    v37[4] = self;
    *(double *)&v37[5] = v35;
    *(double *)&v37[6] = MaxY - v27 + v30 * -0.5;
    *(double *)&v37[7] = v36 + 1.0;
    [v23 enumerateObjectsUsingBlock:v37];
  }
  else
  {
    CGFloat v23 = [v5 statusIndicatorImageViews];
    [v23 makeObjectsPerformSelector:"removeFromSuperview"];
  }
}

- (void)_updateHorizontalStatusIndicatorsFromViewModel:(id)a3
{
  id v4 = a3;
  double v5 = [(MFCollapsedMessageCell *)self horizontalStatusIndicatorManager];
  double v6 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory) {
    [(MFCollapsedMessageCell *)self timestampLabel];
  }
  else {
  double v8 = [(MFCollapsedMessageCell *)self summaryLabel];
  }
  unsigned int v9 = [v4 isFlagged];
  unsigned int v10 = [v4 hasAttachments];
  unsigned int v11 = [v4 isNotify];
  unsigned int v12 = [v4 isMute];
  unsigned int v13 = [v4 isBlockedSender];
  uint64_t v14 = 4;
  if (!v9) {
    uint64_t v14 = 0;
  }
  if (v10) {
    v14 |= 0x20uLL;
  }
  if (v11) {
    v14 |= 0x40uLL;
  }
  if (v12) {
    v14 |= 0x80uLL;
  }
  if (v13) {
    uint64_t v15 = v14 | 0x100;
  }
  else {
    uint64_t v15 = v14;
  }
  [v5 setIndicatorOptions:v15];
  unsigned int v16 = [v4 flagColors];
  [v5 setFlagColors:v16];

  [v5 pruneIndicatorOptions:2];
  if ([v5 effectiveIndicatorOptions])
  {
    unsigned int v17 = [(MFCollapsedMessageCell *)self mf_prefersRightToLeftInterfaceLayout];
    [(MFCollapsedMessageCell *)self bounds];
    double Width = CGRectGetWidth(v53);
    [v8 frame];
    double v19 = Width - CGRectGetMaxX(v54);
    if (v17)
    {
      [v8 frame];
      double MinX = CGRectGetMinX(v55);
      [v8 bounds];
      CGFloat MinY = CGRectGetMinY(v56);
      [v8 bounds];
      CGFloat Height = CGRectGetHeight(v57);
    }
    else
    {
      if (IsAccessibilityCategory) {
        [(MFCollapsedMessageCell *)self summaryLabel];
      }
      else {
      double v24 = [(MFCollapsedMessageCell *)self timestampLabel];
      }
      [v24 frame];
      double MaxX = CGRectGetMaxX(v58);
      [v8 bounds];
      CGFloat MinY = CGRectGetMinY(v59);
      [v8 bounds];
      CGFloat Height = CGRectGetHeight(v60);
      double MinX = MaxX - v19;
    }
    [v5 updateImageViews];
    double v26 = [v5 statusIndicatorImageViews];
    [v8 frame];
    double MaxY = CGRectGetMaxY(v61);
    [v8 _baselineOffsetFromBottom];
    double v29 = v28;
    double v30 = [v8 font];
    [v30 capHeight];
    double v32 = v31;

    if (v17)
    {
      v62.origin.x = MinX;
      v62.origin.double y = MinY;
      v62.size.double width = v19;
      v62.size.double height = Height;
      double v33 = CGRectGetMinX(v62);
      double v34 = [v26 firstObject];
      [v34 frame];
      double v35 = CGRectGetWidth(v63);

      [v5 midXToMidXSpacing];
      double v37 = v33 + v35 * 0.5;
    }
    else
    {
      v64.origin.x = MinX;
      v64.origin.double y = MinY;
      v64.size.double width = v19;
      v64.size.double height = Height;
      double MidX = CGRectGetMidX(v64);
      v65.origin.x = MinX;
      v65.origin.double y = MinY;
      v65.size.double width = v19;
      v65.size.double height = Height;
      double v39 = CGRectGetMaxX(v65);
      CGRect v40 = [v26 firstObject];
      [v40 frame];
      double v41 = CGRectGetWidth(v66);

      [v5 midXToMidXSpacing];
      double v43 = v39 + v41 * -0.5;
      if (MidX >= v43) {
        double v43 = MidX;
      }
      double v44 = 0.0;
      if (IsAccessibilityCategory) {
        double v44 = -1.0;
      }
      double v37 = v44 + v43;
      double v36 = -v42;
    }
    uint64_t v47 = 0;
    CGRect v48 = (double *)&v47;
    uint64_t v49 = 0x4010000000;
    CGRect v50 = &unk_100591BFD;
    *(void *)&long long v45 = -1;
    *((void *)&v45 + 1) = -1;
    long long v51 = v45;
    long long v52 = v45;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100180B9C;
    v46[3] = &unk_10060AF68;
    *(double *)&v46[6] = v37;
    *(double *)&v46[7] = v36;
    v46[4] = self;
    v46[5] = &v47;
    *(double *)&v46[8] = MaxY - v29 + v32 * -0.5;
    [v26 enumerateObjectsUsingBlock:v46];
    -[MFCollapsedMessageCell _updateLabelFrameAfterHorizontalStatusIndicators:label:](self, "_updateLabelFrameAfterHorizontalStatusIndicators:label:", v8, v48[4], v48[5], v48[6], v48[7]);
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    CGFloat v23 = [v5 statusIndicatorImageViews];
    [v23 makeObjectsPerformSelector:"removeFromSuperview"];
  }
}

- (void)_updateLabelFrameAfterHorizontalStatusIndicators:(CGRect)a3 label:(id)a4
{
  CGFloat rect = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v19 = a4;
  [v19 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if ([(MFCollapsedMessageCell *)self mf_prefersRightToLeftInterfaceLayout])
  {
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.double height = rect;
    double v16 = CGRectGetMaxX(v21) + 16.0;
    double v9 = v9 + v16;
  }
  else
  {
    v22.origin.CGFloat x = v9;
    v22.origin.CGFloat y = v11;
    v22.size.CGFloat width = v13;
    v22.size.double height = v15;
    double MaxX = CGRectGetMaxX(v22);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.double height = rect;
    double v16 = MaxX - CGRectGetMinX(v23) + 16.0;
  }
  [v19 setFrame:v9, v11, v13 - v16, v15, *(void *)&rect];
}

- (void)_fontMetricCacheDidInvalidate:(id)a3
{
  [(MFCollapsedMessageCell *)self _updateFonts];
  [(MFCollapsedMessageCell *)self _updateSummaryNumberOfLines];
  [(MFCollapsedMessageCell *)self _sizeToFitLabels];

  [(MFCollapsedMessageCell *)self setNeedsLayout];
}

- (void)_sizeToFitLabels
{
  id v3 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
  [v3 sizeToFit];

  id v4 = [(MFCollapsedMessageCell *)self summaryLabel];
  [v4 sizeToFit];

  id v5 = [(MFCollapsedMessageCell *)self timestampLabel];
  [v5 sizeToFit];
}

- (void)_updateFonts
{
  id v6 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
  id v3 = +[UIFont mf_messageHeaderSenderLabelFont];
  sub_100181054((uint64_t)v3, v6, v3);

  id v7 = [(MFCollapsedMessageCell *)self summaryLabel];
  id v4 = +[UIFont mf_messageHeaderSummaryLabelFont];
  sub_100181054((uint64_t)v4, v7, v4);

  id v8 = [(MFCollapsedMessageCell *)self timestampLabel];
  id v5 = +[UIFont mf_messageHeaderTimestampLabelFont];
  sub_100181054((uint64_t)v5, v8, v5);
}

- (void)_updateSummaryNumberOfLines
{
  id v5 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  id v6 = [(MFCollapsedMessageCell *)self summaryLabel];
  [v6 setNumberOfLines:v4];
}

- (void)setViewModel:(id)a3
{
  id v4 = a3;
  id v5 = [(MFConversationViewCell *)self viewModel];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MFCollapsedMessageCell;
    [(MFConversationViewCell *)&v6 setViewModel:v4];
    [(MFCollapsedMessageCell *)self _updateForViewModelChange];
  }
}

- (void)_updateForViewModelChange
{
  id v21 = [(MFConversationViewCell *)self viewModel];
  if ([(MFCollapsedMessageCell *)self shouldShowSubject])
  {
    id v3 = [v21 subject];
    id v4 = [v3 subjectString];
    id v5 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
    [v5 setText:v4];
  }
  else
  {
    objc_super v6 = [v21 senderList];
    id v3 = [v6 firstObject];

    if (EMBlackPearlIsFeatureEnabled())
    {
      id v7 = [(MFCollapsedMessageCell *)self avatarView];
      id v8 = [v21 avatarContext];
      double v9 = [v21 avatarGenerator];
      id v10 = [v7 displayPersonForContext:v8 avatarGenerator:v9];
    }
    else
    {
      id v7 = [(MFCollapsedMessageCell *)self avatarView];
      id v8 = [v21 avatarContext];
      double v9 = [v8 brandIndicatorFuture];
      double v11 = [(MFMessageConversationViewCell *)self contactStore];
      double v12 = [v11 cnStore];
      id v13 = [v7 displayPersonForEmailAddress:v3 brandIndicatorFuture:v9 usingContactStore:v12];
    }
    id v4 = [(MFMessageConversationViewCell *)self contactStore];
    id v5 = [v3 stringValue];
    double v14 = [v4 displayNameForEmailAddress:v5];
    double v15 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
    [v15 setText:v14];
  }
  double v16 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
  [v16 sizeToFit];

  unsigned int v17 = [v21 summary];
  [(MFCollapsedMessageCell *)self _updateSummary:v17 didComplete:v17 != 0];
  double v18 = [v21 date];
  id v19 = [(MFCollapsedMessageCell *)self timestampLabel];
  [v19 setDate:v18];

  double v20 = [(MFCollapsedMessageCell *)self timestampLabel];
  [v20 sizeToFit];

  [(MFCollapsedMessageCell *)self setNeedsLayout];
}

- (void)setShouldShowSubject:(BOOL)a3
{
  if (self->_shouldShowSubject != a3)
  {
    self->_shouldShowSubject = a3;
    [(MFCollapsedMessageCell *)self _updateAvatarSuperview];
    [(MFCollapsedMessageCell *)self _updateForViewModelChange];
    [(MFCollapsedMessageCell *)self _updateLabelColor];
  }
}

- (void)_updateSummary:(id)a3 didComplete:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (!v6 || ![v6 length])
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    if (v4) {
      [v8 localizedStringForKey:@"NO_BODY" value:&stru_100619928 table:@"Main"];
    }
    else {
    uint64_t v9 = [v8 localizedStringForKey:@"LOADING" value:&stru_100619928 table:@"Main"];
    }

    id v7 = (void *)v9;
  }
  if (+[EMInternalPreferences preferenceEnabled:7])
  {
    id v10 = [(MFConversationViewCell *)self viewModel];
    double v11 = [(MFCollapsedMessageCell *)self _messageFromViewModel:v10];

    double v12 = [v11 itemID];
    uint64_t v13 = +[NSString stringWithFormat:@"%@, %@", v12, v7];

    id v7 = (void *)v13;
  }
  double v14 = [(MFCollapsedMessageCell *)self summaryLabel];
  [v14 setText:v7];
  double v15 = [v14 text];
  unsigned int v16 = [v15 _isNaturallyRTL];

  if (v16) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 0;
  }
  [v14 setTextAlignment:v17];
  double v18 = +[MFFontMetricCache sharedFontMetricCache];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100181888;
  v21[3] = &unk_100604738;
  id v19 = v14;
  id v22 = v19;
  CGRect v23 = self;
  [v18 cachedFloat:v21 forKey:@"conversationView.collapsedMessageCell.summary.height"];

  [(MFCollapsedMessageCell *)self bounds];
  id v20 = v19;
  [v20 frame];
  [v20 setFrame:];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFCollapsedMessageCell;
  -[MFCollapsedMessageCell setHighlighted:](&v7, "setHighlighted:");
  if (v3) {
    +[UIColor mailConversationViewCollapsedCellHighlightedBackgroundColor];
  }
  else {
  id v5 = +[UIColor mailConversationViewCollapsedCellBackgroundColor];
  }
  id v6 = [(MFCollapsedMessageCell *)self contentView];
  [v6 setBackgroundColor:v5];
}

- (id)_messageFromViewModel:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 messageContentRequest];

  if (v4) {
    [v3 messageContentRequest];
  }
  else {
  id v5 = [v3 messageLoadingContext];
  }
  id v6 = [v5 message];

  return v6;
}

- (double)_topToSenderBaselineInConversation
{
  v2 = [(MFConversationViewCell *)self displayMetrics];
  [v2 topToSenderBaselineInConversation];
  double v4 = v3;

  return v4;
}

- (double)_baselineToBaselineSpacingInConversation
{
  v2 = [(MFConversationViewCell *)self displayMetrics];
  [v2 baselineToBaselineSpacingInConversation];
  double v4 = v3;

  return v4;
}

- (double)_messageBottomPaddingInConversation
{
  v2 = [(MFConversationViewCell *)self displayMetrics];
  [v2 messageBottomPaddingInConversation];
  double v4 = v3;

  return v4;
}

- (double)_messageTopPaddingInConversation
{
  v2 = [(MFConversationViewCell *)self displayMetrics];
  [v2 messageTopPaddingInConversation];
  double v4 = v3;

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFCollapsedMessageCell;
  [(MFCollapsedMessageCell *)&v5 traitCollectionDidChange:v4];
  [(MFCollapsedMessageCell *)self _updateAvatarSuperview];
  [(MFCollapsedMessageCell *)self _updateLabelColor];
}

- (void)_updateAvatarSuperview
{
  id v4 = [(MFCollapsedMessageCell *)self avatarSuperview];
  if ([(MFCollapsedMessageCell *)self shouldHideAvatarSuperview])
  {
    [v4 removeFromSuperview];
  }
  else
  {
    double v3 = [(MFCollapsedMessageCell *)self contentView];
    [v3 addSubview:v4];
  }
}

- (BOOL)shouldHideAvatarSuperview
{
  if ([(MFCollapsedMessageCell *)self shouldShowSubject]) {
    return 1;
  }
  double v3 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (BOOL)shouldApplySystemLighterMaterial
{
  return 1;
}

- (void)_updateLabelColor
{
  id v8 = +[UIColor mailConversationViewCollapsedCellLabelColor];
  if ([(MFCollapsedMessageCell *)self shouldShowSubject])
  {
    id v3 = +[UIColor mailConversationViewCollapsedCellSubjectLabelColor];
  }
  else
  {
    id v3 = v8;
  }
  id v4 = v3;
  objc_super v5 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
  [v5 setTextColor:v4];

  id v6 = [(MFCollapsedMessageCell *)self summaryLabel];
  [v6 setTextColor:v8];

  objc_super v7 = [(MFCollapsedMessageCell *)self timestampLabel];
  [v7 setTextColor:v8];
}

- (void)prepareForReuse
{
  v10.receiver = self;
  v10.super_class = (Class)MFCollapsedMessageCell;
  [(MFMessageConversationViewCell *)&v10 prepareForReuse];
  id v3 = [(MFCollapsedMessageCell *)self senderOrSubjectLabel];
  [v3 setText:0];

  id v4 = [(MFCollapsedMessageCell *)self summaryLabel];
  [v4 setText:0];

  objc_super v5 = [(MFCollapsedMessageCell *)self timestampLabel];
  [v5 setDate:0];

  id v6 = [(MFCollapsedMessageCell *)self horizontalStatusIndicatorManager];
  [v6 setIndicatorOptions:0];

  objc_super v7 = [(MFCollapsedMessageCell *)self horizontalStatusIndicatorManager];
  [v7 updateImageViews];

  id v8 = [(MFCollapsedMessageCell *)self verticalStatusIndicatorManager];
  [v8 setIndicatorOptions:0];

  uint64_t v9 = [(MFCollapsedMessageCell *)self verticalStatusIndicatorManager];
  [v9 updateImageViews];

  [(MFCollapsedMessageCell *)self removeConversationSearchOverlay];
}

- (void)addConversationSearchOverlay
{
  id v3 = [(MFCollapsedMessageCell *)self findOverlayView];
  -[MFCollapsedMessageCell bringSubviewToFront:](self, "bringSubviewToFront:");

  id v4 = [(MFCollapsedMessageCell *)self findOverlayView];
  [v4 show];
}

- (void)removeConversationSearchOverlay
{
  id v3 = [(MFCollapsedMessageCell *)self findOverlayView];
  [v3 hide];

  id v4 = [(MFCollapsedMessageCell *)self findOverlayView];
  -[MFCollapsedMessageCell sendSubviewToBack:](self, "sendSubviewToBack:");
}

- (UIDateLabel)timestampLabel
{
  return self->_timestampLabel;
}

- (void)setTimestampLabel:(id)a3
{
}

- (MessageViewStatusIndicatorManager)verticalStatusIndicatorManager
{
  return self->_verticalStatusIndicatorManager;
}

- (void)setVerticalStatusIndicatorManager:(id)a3
{
}

- (MessageViewStatusIndicatorManager)horizontalStatusIndicatorManager
{
  return self->_horizontalStatusIndicatorManager;
}

- (void)setHorizontalStatusIndicatorManager:(id)a3
{
}

- (void)setFindOverlayView:(id)a3
{
}

- (BOOL)shouldShowSubject
{
  return self->_shouldShowSubject;
}

- (UILabel)senderOrSubjectLabel
{
  return self->_senderOrSubjectLabel;
}

- (void)setSenderOrSubjectLabel:(id)a3
{
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (void)setSummaryLabel:(id)a3
{
}

- (UIImageView)avatarSuperview
{
  return self->_avatarSuperview;
}

- (void)setAvatarSuperview:(id)a3
{
}

- (MFAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (BOOL)isActionCardHeader
{
  return self->_isActionCardHeader;
}

- (void)setIsActionCardHeader:(BOOL)a3
{
  self->_isActionCardHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_avatarSuperview, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_senderOrSubjectLabel, 0);
  objc_storeStrong((id *)&self->_findOverlayView, 0);
  objc_storeStrong((id *)&self->_horizontalStatusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_verticalStatusIndicatorManager, 0);

  objc_storeStrong((id *)&self->_timestampLabel, 0);
}

@end