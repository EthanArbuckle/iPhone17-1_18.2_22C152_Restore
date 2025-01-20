@interface CalendarMessageCell
+ (Class)cellClassForNotification:(id)a3;
+ (double)defaultRowHeight;
+ (id)_authorCache;
+ (id)authorCacheObjectForKey:(id)a3;
+ (id)layoutMetrics;
+ (id)strikethroughTitleColor:(unint64_t)a3;
+ (int64_t)numberOfLinesForBodyLabels;
+ (int64_t)numberOfLinesForTitleLabels;
+ (void)authorCacheSetObject:(id)a3 forKey:(id)a4;
+ (void)clearMetrics;
+ (void)emptyAuthorCache;
- (BOOL)_shouldWrapTextUnderAuthor;
- (BOOL)hasDisclosure;
- (BOOL)showAsCancelledOrDeclined;
- (CalendarMessageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CalendarMessageCellDelegate)delegate;
- (EKCalendarNotification)notification;
- (NSArray)colorBarConstraints;
- (NSArray)commentPromptRelatedConstraints;
- (NSArray)disclosureConstraints;
- (NSArray)labelRelatedConstraints;
- (NSDictionary)conflictDict;
- (NSIndexSet)indexSetOfTruncatedBodyStrings;
- (NSIndexSet)indexSetOfTruncatedTitleStrings;
- (UIView)authorView;
- (id)_responseButtons;
- (id)actionBodyString;
- (id)actions;
- (id)authorAddressForIdentity:(id)a3;
- (id)authorCacheKeyForIdentity:(id)a3;
- (id)bodyStringDict;
- (id)color;
- (id)comment;
- (id)eventStatusButtonsViewButtonFont:(id)a3;
- (id)preActionBodyStrings;
- (id)provideAuthorView;
- (id)titleStrings;
- (int64_t)actionBodyStringAction;
- (int64_t)selectedResponseButton;
- (unint64_t)destination;
- (unint64_t)options;
- (void)_commentPromptDone:(id)a3;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)_removeColorBarConstraintsIfNeeded;
- (void)_removeCommentPromptRelatedConstraintsIfNeeded;
- (void)_removeDisclosureConstraintsIfNeeded;
- (void)_removeLabelRelatedConstraintsIfNeeded;
- (void)_updateAppEntityAnnotation;
- (void)_updateAppEntityAnnotationState;
- (void)_updateColorBar;
- (void)_updateLabels;
- (void)_updateResponseButtons;
- (void)actionLabelTap;
- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4;
- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAuthorView:(id)a3;
- (void)setColorBarConstraints:(id)a3;
- (void)setCommentPromptRelatedConstraints:(id)a3;
- (void)setConflictDict:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(unint64_t)a3;
- (void)setDisclosureConstraints:(id)a3;
- (void)setHasDisclosure:(BOOL)a3;
- (void)setLabelRelatedConstraints:(id)a3;
- (void)setNotification:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsCommentPrompt:(BOOL)a3 animated:(BOOL)a4 initialValue:(id)a5;
- (void)setupColorBarConstraintsIfNeeded;
- (void)setupCommentPromptConstraintsIfNeeded;
- (void)setupDisclosureConstraintsIfNeeded;
- (void)setupLabelConstraintsIfNeeded;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateAuthor;
- (void)updateSelectedResponseButton;
@end

@implementation CalendarMessageCell

+ (id)_authorCache
{
  if (qword_1002166D8 != -1) {
    dispatch_once(&qword_1002166D8, &stru_1001D3758);
  }
  v2 = (void *)qword_1002166D0;

  return v2;
}

+ (void)emptyAuthorCache
{
  id v2 = [a1 _authorCache];
  [v2 removeAllObjects];
}

+ (id)authorCacheObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 _authorCache];
  v6 = [v5 objectForKey:v4];

  return v6;
}

+ (void)authorCacheSetObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _authorCache];
  [v8 setObject:v7 forKey:v6];
}

- (CalendarMessageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CalendarMessageCell;
  id v4 = [(CalendarMessageCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v4->_didSetupColorBarConstraints = 0;
    v4->_didSetupLabelConstraints = 0;
    v4->_didSetupDisclosureConstraints = 0;
    uint64_t v6 = [(CalendarMessageCell *)v4 provideAuthorView];
    authorView = v5->_authorView;
    v5->_authorView = (UIView *)v6;

    [(UIView *)v5->_authorView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [(CalendarMessageCell *)v5 contentView];
    [v8 addSubview:v5->_authorView];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v5 selector:"_contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v5;
}

- (void)layoutSubviews
{
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  id v4 = [(CalendarMessageCell *)self superview];
  [v4 safeAreaInsets];
  double v6 = v5;
  double v8 = v7;

  if ([(CalendarMessageCell *)self _shouldWrapTextUnderAuthor])
  {
    CalRoundToScreenScale();
    double v10 = v9;
    CalRoundToScreenScale();
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:v10 + v11];
    double v13 = v12;
    v14 = [(CalendarMessageCell *)self contentView];
    [v14 layoutMargins];
    double v16 = v13 + v15;
  }
  else
  {
    v14 = [(CalendarMessageCell *)self contentView];
    [v14 layoutMargins];
    double v18 = v17;
    CalRoundToScreenScale();
    double v20 = v18 + v19;
    CalRoundToScreenScale();
    double v22 = v20 + v21;
    CalRoundToScreenScale();
    double v24 = v22 + v23;
    CalRoundToScreenScale();
    double v16 = v24 + v25;
  }
  if (IsLeftToRight) {
    double v26 = v6;
  }
  else {
    double v26 = v8;
  }
  -[CalendarMessageCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v26 + v16, 0.0, 0.0);

  v27.receiver = self;
  v27.super_class = (Class)CalendarMessageCell;
  [(CalendarMessageCell *)&v27 layoutSubviews];
}

- (id)provideAuthorView
{
  id v2 = objc_opt_new();

  return v2;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CalendarMessageCell;
  [(CalendarMessageCell *)&v3 prepareForReuse];
  self->_didSetupColorBarConstraints = 0;
  self->_didSetupLabelConstraints = 0;
  self->_didSetupDisclosureConstraints = 0;
  [(CalendarMessageCell *)self setConflictDict:0];
}

- (void)setDestination:(unint64_t)a3
{
  if (self->_destination != a3)
  {
    self->_destination = a3;
    if (a3 == 2) {
      +[UIBackgroundConfiguration listSidebarCellConfiguration];
    }
    else {
    id v4 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
    }
    [(CalendarMessageCell *)self setBackgroundConfiguration:v4];
  }
}

+ (Class)cellClassForNotification:(id)a3
{
  switch((unint64_t)[a3 type])
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      double v6 = objc_opt_class();
      break;
    default:
      double v5 = +[NSAssertionHandler currentHandler];
      [v5 handleFailureInMethod:a2 object:a1 file:@"CalendarMessageCell.m" lineNumber:241 description:@"Unexpected notification type"];

      double v6 = 0;
      break;
  }

  return (Class)v6;
}

+ (id)strikethroughTitleColor:(unint64_t)a3
{
  if (a3 == 2)
  {
    objc_super v3 = &qword_1002166E0;
    id v4 = (void *)qword_1002166E0;
    if (qword_1002166E0) {
      goto LABEL_7;
    }
    double v5 = &stru_1001D3798;
  }
  else
  {
    objc_super v3 = &qword_1002166E8;
    id v4 = (void *)qword_1002166E8;
    if (qword_1002166E8) {
      goto LABEL_7;
    }
    double v5 = &stru_1001D37B8;
  }
  uint64_t v6 = +[UIColor colorWithDynamicProvider:v5];
  double v7 = (void *)*v3;
  *objc_super v3 = v6;

  id v4 = (void *)*v3;
LABEL_7:
  id v8 = v4;

  return v8;
}

+ (id)layoutMetrics
{
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  double v16 = sub_100079A4C;
  double v17 = &unk_1001D2FA8;
  id v18 = a1;
  if (qword_1002166F0 != -1) {
    dispatch_once(&qword_1002166F0, &v14);
  }
  id v2 = (void *)qword_1002166F8;
  if (!qword_1002166F8)
  {
    CalRoundToScreenScale();
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, v14, v15, v16, v17, v18);
    double v4 = v3;
    v19[0] = @"verticalContainerPadding";
    CalRoundToScreenScale();
    double v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v20[0] = v5;
    v19[1] = @"avatarPadding";
    uint64_t v6 = +[NSNumber numberWithDouble:v4];
    v20[1] = v6;
    v19[2] = @"interLabelPadding";
    CalRoundToScreenScale();
    double v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v20[2] = v7;
    v19[3] = @"verticalButtonPadding";
    CalRoundToScreenScale();
    id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v20[3] = v8;
    v19[4] = @"avatarSize";
    CalRoundToScreenScale();
    double v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v20[4] = v9;
    v19[5] = @"colorBarWidth";
    CalRoundToScreenScale();
    double v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v19[6] = @"disclosureTrailingPadding";
    v20[5] = v10;
    v20[6] = &off_1001DCCA0;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];
    double v12 = (void *)qword_1002166F8;
    qword_1002166F8 = v11;

    id v2 = (void *)qword_1002166F8;
  }

  return v2;
}

+ (void)clearMetrics
{
  id v2 = (void *)qword_1002166F8;
  qword_1002166F8 = 0;
}

- (void)setupColorBarConstraintsIfNeeded
{
  if (!self->_didSetupColorBarConstraints)
  {
    [(CalendarMessageCell *)self _removeColorBarConstraintsIfNeeded];
    id v13 = [(id)objc_opt_class() layoutMetrics];
    double v3 = _NSDictionaryOfVariableBindings(@"_colorBar", self->_colorBar, 0);
    id v4 = objc_alloc_init((Class)NSMutableArray);
    double v5 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_colorBar]", 512, v13, v3);
    [v4 addObjectsFromArray:v5];

    uint64_t v6 = [(MessageCellColorBarView *)self->_colorBar widthAnchor];
    double v7 = [(CalendarMessageCell *)self traitCollection];
    char v8 = EKUIUsesLargeTextLayout();
    double v9 = 6.0;
    if ((v8 & 1) == 0) {
      CalRoundToScreenScale();
    }
    double v10 = [v6 constraintEqualToConstant:v9];
    [v4 addObject:v10];

    uint64_t v11 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(verticalContainerPadding)-[_colorBar]-(verticalContainerPadding)-|", 0, v13, v3);
    [v4 addObjectsFromArray:v11];

    +[NSLayoutConstraint activateConstraints:v4];
    double v12 = +[NSArray arrayWithArray:v4];
    [(CalendarMessageCell *)self setColorBarConstraints:v12];

    self->_didSetupColorBarConstraints = 1;
  }
}

- (BOOL)_shouldWrapTextUnderAuthor
{
  id v2 = [(CalendarMessageCell *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];
  BOOL v4 = UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryAccessibilityMedium) == NSOrderedDescending;

  return v4;
}

- (void)_removeColorBarConstraintsIfNeeded
{
  double v3 = [(CalendarMessageCell *)self colorBarConstraints];

  if (v3)
  {
    BOOL v4 = [(CalendarMessageCell *)self colorBarConstraints];
    +[NSLayoutConstraint deactivateConstraints:v4];

    [(CalendarMessageCell *)self setColorBarConstraints:0];
  }
}

- (void)setupLabelConstraintsIfNeeded
{
  if (!self->_didSetupLabelConstraints)
  {
    [(CalendarMessageCell *)self _removeLabelRelatedConstraintsIfNeeded];
    id v136 = objc_alloc_init((Class)NSMutableArray);
    id v131 = objc_alloc_init((Class)NSMutableArray);
    id v130 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v3 = [(id)objc_opt_class() layoutMetrics];
    NSUInteger v4 = [(NSArray *)self->_titleLabels count];
    id firstValue = [(NSArray *)self->_titleLabels objectAtIndexedSubscript:0];
    v124 = -[NSArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:");
    NSUInteger v5 = [(NSArray *)self->_actionLabels count];
    NSUInteger v132 = v5;
    if (v5)
    {
      NSUInteger v6 = v5;
      double v7 = [(NSArray *)self->_actionLabels objectAtIndexedSubscript:0];
      if (v6 == 1)
      {
        id v127 = v7;
        v129 = v127;
      }
      else
      {
        v129 = v7;
        id v127 = [(NSArray *)self->_actionLabels objectAtIndexedSubscript:v6 - 1];
      }
    }
    else
    {
      id v127 = 0;
      v129 = 0;
    }
    NSUInteger v134 = [(NSArray *)self->_bodyLabels count];
    v128 = [(NSArray *)self->_bodyLabels firstObject];
    char v8 = [(UIView *)self->_authorView heightAnchor];
    double v9 = [(UIView *)self->_authorView widthAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    [v136 addObject:v10];

    uint64_t v11 = _NSDictionaryOfVariableBindings(@"_colorBar, _authorView", self->_colorBar, self->_authorView, 0);
    double v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:[_colorBar]-(avatarPadding)-[_authorView(==avatarSize)]", 0, v3, v11);
    [v136 addObjectsFromArray:v12];

    v126 = (void *)v3;
    if ([(CalendarMessageCell *)self _shouldWrapTextUnderAuthor])
    {
      id v13 = [(UIView *)self->_authorView centerYAnchor];
      v14 = firstValue;
      uint64_t v15 = [firstValue firstBaselineAnchor];
      double v16 = [firstValue font];
      [v16 capHeight];
      CalRoundToScreenScale();
      id v18 = [v13 constraintEqualToAnchor:v15 constant:-v17];
      [v136 addObject:v18];

      double v19 = [(UIView *)self->_authorView leadingAnchor];
      double v20 = [firstValue leadingAnchor];
      double v21 = [v19 constraintEqualToAnchor:v20];
      [v136 addObject:v21];
    }
    else
    {
      double v22 = _NSDictionaryOfVariableBindings(@"_authorView", self->_authorView, 0);
      double v23 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(verticalContainerPadding)-[_authorView]", 0, v3, v22);
      [v136 addObjectsFromArray:v23];

      double v19 = _NSDictionaryOfVariableBindings(@"topTitleLabel,_authorView", firstValue, self->_authorView, 0);
      uint64_t v24 = v3;
      v14 = firstValue;
      double v20 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:[_authorView]-(avatarPadding)-[topTitleLabel]", 0, v24, v19);
      [v136 addObjectsFromArray:v20];
    }

    double v25 = [(CalendarMessageCell *)self contentView];
    CalRoundToScreenScale();
    objc_super v27 = +[NSLayoutConstraint constraintWithItem:v25 attribute:3 relatedBy:0 toItem:v14 attribute:3 multiplier:1.0 constant:-(v26 + -1.0)];
    firstTitleLabelToContentViewTopConstraint = self->_firstTitleLabelToContentViewTopConstraint;
    self->_firstTitleLabelToContentViewTopConstraint = v27;

    [v130 addObject:self->_firstTitleLabelToContentViewTopConstraint];
    [(CalendarMessageCell *)self setHasDisclosure:self->_hasDisclosure];
    v29 = [v14 font];
    [v29 _scaledValueForValue:4.0];
    double v31 = v30;

    if (v4 >= 2)
    {
      for (uint64_t i = 1; i != v4; ++i)
      {
        v33 = [(NSArray *)self->_titleLabels objectAtIndexedSubscript:i];
        v34 = [(NSArray *)self->_titleLabels objectAtIndexedSubscript:i - 1];
        v35 = [v33 topAnchor];
        v36 = [v34 bottomAnchor];
        v37 = [v35 constraintEqualToAnchor:v36 constant:v31];
        [v136 addObject:v37];

        v14 = firstValue;
        v38 = +[NSLayoutConstraint constraintWithItem:v34 attribute:5 relatedBy:0 toItem:v33 attribute:5 multiplier:1.0 constant:0.0];
        [v136 addObject:v38];

        v39 = +[NSLayoutConstraint constraintWithItem:v34 attribute:6 relatedBy:0 toItem:v33 attribute:6 multiplier:1.0 constant:0.0];
        [v136 addObject:v39];

        if (i == v4 - 1)
        {
          v40 = +[NSLayoutConstraint constraintWithItem:v33 attribute:6 relatedBy:0 toItem:firstValue attribute:6 multiplier:1.0 constant:0.0];
          [v136 addObject:v40];
        }
      }
    }
    +[NSLayoutConstraint activateConstraints:v136];
    objc_storeStrong((id *)&self->_titleLabelConstraints, v136);
    v41 = v124;
    senderLabel = self->_senderLabel;
    v43 = v41;
    if (senderLabel)
    {
      v44 = [(UILabel *)senderLabel topAnchor];
      v45 = [(UILabel *)v41 bottomAnchor];
      v46 = [v44 constraintEqualToAnchor:v45 constant:0.0];
      [v131 addObject:v46];

      v47 = +[NSLayoutConstraint constraintWithItem:self->_senderLabel attribute:5 relatedBy:0 toItem:v41 attribute:5 multiplier:1.0 constant:0.0];
      [v131 addObject:v47];

      v48 = +[NSLayoutConstraint constraintWithItem:self->_senderLabel attribute:6 relatedBy:0 toItem:v41 attribute:6 multiplier:1.0 constant:0.0];
      [v131 addObject:v48];

      v43 = self->_senderLabel;
    }
    v133 = v41;
    if (v132)
    {
      id v49 = v129;
      double v50 = 0.0;
      v51 = +[NSLayoutConstraint constraintWithItem:v49 attribute:5 relatedBy:0 toItem:v14 attribute:5 multiplier:1.0 constant:0.0];
      [v131 addObject:v51];

      v52 = [v49 topAnchor];
      v125 = v43;
      v53 = [(UILabel *)v43 bottomAnchor];
      v54 = [v52 constraintEqualToAnchor:v53 constant:v31];
      [v131 addObject:v54];

      v55 = +[NSLayoutConstraint constraintWithItem:v127 attribute:6 relatedBy:-1 toItem:v14 attribute:6 multiplier:1.0 constant:0.0];
      [v131 addObject:v55];

      LODWORD(v56) = 1148846080;
      [v49 setContentHuggingPriority:0 forAxis:v56];
      LODWORD(v57) = 1148846080;
      [v49 setContentCompressionResistancePriority:0 forAxis:v57];
      LODWORD(v58) = 1148846080;
      [v49 setContentHuggingPriority:1 forAxis:v58];
      LODWORD(v59) = 1148846080;
      [v49 setContentCompressionResistancePriority:1 forAxis:v59];
      v60 = v49;
      if (v132 != 1)
      {
        uint64_t v61 = 1;
        v62 = v49;
        do
        {
          v60 = [(NSArray *)self->_actionLabels objectAtIndexedSubscript:v61];
          LODWORD(v63) = 1148846080;
          [v60 setContentHuggingPriority:0 forAxis:v63];
          LODWORD(v64) = 1148846080;
          [v60 setContentCompressionResistancePriority:0 forAxis:v64];
          v65 = +[NSLayoutConstraint constraintWithItem:v60 attribute:5 relatedBy:0 toItem:v62 attribute:6 multiplier:1.0 constant:0.0];
          [v131 addObject:v65];

          v66 = +[NSLayoutConstraint constraintWithItem:v60 attribute:12 relatedBy:0 toItem:v49 attribute:12 multiplier:1.0 constant:0.0];
          [v131 addObject:v66];

          [v60 sizeToFit];
          [v60 frame];
          double v50 = v50 + v67;

          ++v61;
          v62 = v60;
        }
        while (v132 != v61);
      }
      v14 = firstValue;
      v68 = +[NSLayoutConstraint constraintWithItem:v49 attribute:6 relatedBy:-1 toItem:firstValue attribute:6 multiplier:1.0 constant:-v50];
      [v131 addObject:v68];

      v43 = (UILabel *)v49;
    }
    if (v128)
    {
      v69 = [v128 topAnchor];
      v70 = [(UILabel *)v43 bottomAnchor];
      v71 = [v69 constraintEqualToAnchor:v70 constant:v31];
      lastTitleLabelToFirstBodyLabelConstraint = self->_lastTitleLabelToFirstBodyLabelConstraint;
      self->_lastTitleLabelToFirstBodyLabelConstraint = v71;

      v73 = +[NSLayoutConstraint constraintWithItem:v128 attribute:5 relatedBy:0 toItem:v14 attribute:5 multiplier:1.0 constant:0.0];
      [v131 addObject:v73];

      v74 = +[NSLayoutConstraint constraintWithItem:v128 attribute:6 relatedBy:0 toItem:v14 attribute:6 multiplier:1.0 constant:0.0];
      [v131 addObject:v74];

      [v130 addObject:self->_lastTitleLabelToFirstBodyLabelConstraint];
      v75 = v128;

      v43 = v75;
    }
    if (v134 < 2)
    {
      v77 = v43;
    }
    else
    {
      for (uint64_t j = 1; j != v134; ++j)
      {
        v77 = [(NSArray *)self->_bodyLabels objectAtIndexedSubscript:j];
        v78 = [(NSArray *)self->_bodyLabels objectAtIndexedSubscript:j - 1];
        v79 = [(UILabel *)v77 topAnchor];
        v80 = [v78 bottomAnchor];
        v81 = [v79 constraintEqualToAnchor:v80 constant:v31];
        [v131 addObject:v81];

        v82 = +[NSLayoutConstraint constraintWithItem:v77 attribute:5 relatedBy:0 toItem:firstValue attribute:5 multiplier:1.0 constant:0.0];
        [v131 addObject:v82];

        v83 = +[NSLayoutConstraint constraintWithItem:v77 attribute:6 relatedBy:0 toItem:firstValue attribute:6 multiplier:1.0 constant:0.0];
        [v131 addObject:v83];

        v43 = v77;
      }
    }
    v84 = (MessageCellWarningView *)v77;
    warningView = self->_warningView;
    if (warningView)
    {
      v86 = [(MessageCellWarningView *)warningView topAnchor];
      v87 = [(UILabel *)v77 bottomAnchor];
      v88 = [v86 constraintEqualToAnchor:v87 constant:v31];
      v89 = v131;
      [v131 addObject:v88];

      v90 = +[NSLayoutConstraint constraintWithItem:self->_warningView attribute:5 relatedBy:0 toItem:firstValue attribute:5 multiplier:1.0 constant:0.0];
      [v131 addObject:v90];

      v91 = +[NSLayoutConstraint constraintWithItem:self->_warningView attribute:6 relatedBy:0 toItem:firstValue attribute:6 multiplier:1.0 constant:0.0];
      [v131 addObject:v91];

      v92 = self->_warningView;
      v84 = v92;
      v93 = v130;
    }
    else
    {
      v93 = v130;
      v89 = v131;
    }
    +[NSLayoutConstraint activateConstraints:v89];
    objc_storeStrong((id *)&self->_bodyLabelConstraints, v89);
    v94 = [(CalendarMessageCell *)self _responseButtons];
    v95 = [v94 leadingButton];
    v96 = [v95 titleLabel];
    v97 = [v96 font];
    [v97 _scaledValueForValue:-10.0];
    double v99 = v98;

    if ([v94 shouldUseVerticalLayout])
    {
      v100 = [v94 topAnchor];
      v101 = [(MessageCellWarningView *)v84 lastBaselineAnchor];
      [v100 constraintEqualToSystemSpacingBelowAnchor:v101 multiplier:1.125];
    }
    else
    {
      v100 = [v94 leadingButton];
      v101 = [v100 titleLabel];
      +[NSLayoutConstraint constraintWithItem:v84 attribute:4 relatedBy:0 toItem:v101 attribute:3 multiplier:1.0 constant:v99];
    }
    v102 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    lastBodyLabelToResponseButtonsConstraint = self->_lastBodyLabelToResponseButtonsConstraint;
    self->_lastBodyLabelToResponseButtonsConstraint = v102;

    [v93 addObject:self->_lastBodyLabelToResponseButtonsConstraint];
    unsigned int v104 = [v94 shouldUseVerticalLayout];
    v105 = [v94 leadingAnchor];
    v106 = [firstValue leadingAnchor];
    if (v104)
    {
      v107 = [v105 constraintEqualToAnchor:v106];
      [v93 addObject:v107];
    }
    else
    {
      v108 = [v105 constraintEqualToAnchor:v106 constant:0.0];
      statusButtonLeadingConstraint = self->_statusButtonLeadingConstraint;
      self->_statusButtonLeadingConstraint = v108;

      v110 = [v94 trailingAnchor];
      v111 = [firstValue trailingAnchor];
      v112 = [v110 constraintEqualToAnchor:v111 constant:0.0];
      statusButtonTrailingConstraint = self->_statusButtonTrailingConstraint;
      self->_statusButtonTrailingConstraint = v112;

      [v93 addObject:self->_statusButtonLeadingConstraint];
      [v93 addObject:self->_statusButtonTrailingConstraint];
    }
    v114 = [v94 trailingButton];
    v115 = [v114 titleLabel];
    v116 = [(CalendarMessageCell *)self contentView];
    v117 = +[NSLayoutConstraint constraintWithItem:v115 attribute:4 relatedBy:0 toItem:v116 attribute:4 multiplier:1.0 constant:v99];
    bottomMostViewToContentViewBottomConstraint = self->_bottomMostViewToContentViewBottomConstraint;
    self->_bottomMostViewToContentViewBottomConstraint = v117;

    [v93 addObject:self->_bottomMostViewToContentViewBottomConstraint];
    +[NSLayoutConstraint activateConstraints:v93];
    v119 = +[NSArray arrayWithArray:self->_titleLabelConstraints];
    [(CalendarMessageCell *)self setLabelRelatedConstraints:v119];

    v120 = [(CalendarMessageCell *)self labelRelatedConstraints];
    v121 = [v120 arrayByAddingObjectsFromArray:self->_bodyLabelConstraints];
    [(CalendarMessageCell *)self setLabelRelatedConstraints:v121];

    v122 = [(CalendarMessageCell *)self labelRelatedConstraints];
    v123 = [v122 arrayByAddingObjectsFromArray:v93];
    [(CalendarMessageCell *)self setLabelRelatedConstraints:v123];

    self->_didSetupLabelConstraints = 1;
  }
}

- (void)_removeLabelRelatedConstraintsIfNeeded
{
  uint64_t v3 = [(CalendarMessageCell *)self labelRelatedConstraints];

  if (v3)
  {
    NSUInteger v4 = [(CalendarMessageCell *)self labelRelatedConstraints];
    +[NSLayoutConstraint deactivateConstraints:v4];

    [(CalendarMessageCell *)self setLabelRelatedConstraints:0];
    self->_didSetupLabelConstraints = 0;
  }
}

- (void)setupDisclosureConstraintsIfNeeded
{
  uint64_t v3 = [(CalendarMessageCell *)self disclosureConstraints];
  +[NSLayoutConstraint deactivateConstraints:v3];

  id v10 = objc_alloc_init((Class)NSMutableArray);
  NSUInteger v4 = [(id)objc_opt_class() layoutMetrics];
  NSUInteger v5 = self->_disclosureIndicatorView;
  NSUInteger v6 = [(NSArray *)self->_titleLabels objectAtIndexedSubscript:0];
  if (v6)
  {
    double v7 = _NSDictionaryOfVariableBindings(@"topTitleLabel, disclosureView", v6, v5, 0);
    char v8 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:[topTitleLabel]-[disclosureView]-|", 4096, v4, v7);
    [v10 addObjectsFromArray:v8];

    +[NSLayoutConstraint activateConstraints:v10];
    double v9 = +[NSArray arrayWithArray:v10];
    [(CalendarMessageCell *)self setDisclosureConstraints:v9];
  }
}

- (void)_removeDisclosureConstraintsIfNeeded
{
  uint64_t v3 = [(CalendarMessageCell *)self disclosureConstraints];
  +[NSLayoutConstraint deactivateConstraints:v3];

  id v9 = objc_alloc_init((Class)NSMutableArray);
  NSUInteger v4 = [(id)objc_opt_class() layoutMetrics];
  NSUInteger v5 = [(NSArray *)self->_titleLabels objectAtIndexedSubscript:0];
  if (v5)
  {
    NSUInteger v6 = _NSDictionaryOfVariableBindings(@"topTitleLabel", v5, 0);
    double v7 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[topTitleLabel]-|" options:0 metrics:v4 views:v6];
    [v9 addObjectsFromArray:v7];

    +[NSLayoutConstraint activateConstraints:v9];
    char v8 = +[NSArray arrayWithArray:v9];
    [(CalendarMessageCell *)self setDisclosureConstraints:v8];
  }
}

- (void)setupCommentPromptConstraintsIfNeeded
{
  [(CalendarMessageCell *)self _removeCommentPromptRelatedConstraintsIfNeeded];
  id v28 = objc_alloc_init((Class)NSMutableArray);
  id v3 = objc_alloc_init((Class)NSMutableArray);
  NSUInteger v4 = v3;
  commentPrompt = self->_commentPrompt;
  if (commentPrompt)
  {
    NSUInteger v6 = commentPrompt;
    double v7 = [(CalendarMessageCell *)self _responseButtons];
    char v8 = +[NSLayoutConstraint constraintWithItem:v6 attribute:5 relatedBy:0 toItem:v7 attribute:5 multiplier:1.0 constant:0.0];

    [v28 addObject:v8];
    id v9 = [(CalendarMessageCell *)self contentView];
    CalRoundToScreenScale();
    uint64_t v11 = +[NSLayoutConstraint constraintWithItem:v6 attribute:6 relatedBy:0 toItem:v9 attribute:6 multiplier:1.0 constant:v10];

    [v28 addObject:v11];
    [v4 addObject:self->_bottomMostViewToContentViewBottomConstraint];
    double v12 = [(CalendarMessageCell *)self _responseButtons];
    id v13 = self->_commentPrompt;
    CalRoundToScreenScale();
    uint64_t v15 = +[NSLayoutConstraint constraintWithItem:v12 attribute:4 relatedBy:0 toItem:v13 attribute:12 multiplier:1.0 constant:-5.0 - v14];

    [v28 addObject:v15];
    responseButtonsToCommentLabelConstraint = self->_responseButtonsToCommentLabelConstraint;
    self->_responseButtonsToCommentLabelConstraint = v15;
    double v17 = v15;

    id v18 = self->_commentPrompt;
    double v19 = [(CalendarMessageCell *)self contentView];
    CalRoundToScreenScale();
    double v21 = +[NSLayoutConstraint constraintWithItem:v18 attribute:4 relatedBy:0 toItem:v19 attribute:4 multiplier:1.0 constant:-v20];

    [v28 addObject:v21];
    bottomMostViewToContentViewBottomConstraint = self->_bottomMostViewToContentViewBottomConstraint;
    self->_bottomMostViewToContentViewBottomConstraint = v21;
  }
  else
  {
    [v3 addObject:self->_bottomMostViewToContentViewBottomConstraint];
    double v23 = [(CalendarMessageCell *)self _responseButtons];
    uint64_t v24 = [(CalendarMessageCell *)self contentView];
    CalRoundToScreenScale();
    double v26 = +[NSLayoutConstraint constraintWithItem:v23 attribute:4 relatedBy:0 toItem:v24 attribute:4 multiplier:1.0 constant:-v25];

    [v28 addObject:v26];
    uint64_t v11 = self->_bottomMostViewToContentViewBottomConstraint;
    self->_bottomMostViewToContentViewBottomConstraint = v26;
  }

  objc_super v27 = +[NSArray arrayWithArray:v28];
  [(CalendarMessageCell *)self setCommentPromptRelatedConstraints:v27];

  +[NSLayoutConstraint activateConstraints:v28];
  +[NSLayoutConstraint deactivateConstraints:v4];
}

- (void)_removeCommentPromptRelatedConstraintsIfNeeded
{
  id v3 = [(CalendarMessageCell *)self commentPromptRelatedConstraints];

  if (v3)
  {
    NSUInteger v4 = [(CalendarMessageCell *)self commentPromptRelatedConstraints];
    +[NSLayoutConstraint deactivateConstraints:v4];

    [(CalendarMessageCell *)self setCommentPromptRelatedConstraints:0];
  }
}

- (void)setShowsCommentPrompt:(BOOL)a3 animated:(BOOL)a4 initialValue:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (self->_showsCommentPrompt == v6)
  {
    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  self->_showsCommentPrompt = v6;
  if (v6)
  {
    id v9 = (UITextField *)objc_opt_new();
    commentPrompt = self->_commentPrompt;
    self->_commentPrompt = v9;

    [(UITextField *)self->_commentPrompt setBorderStyle:3];
    uint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
    double v12 = [v11 localizedStringForKey:@"Comment to Organizer" value:&stru_1001D6918 table:0];
    [(UITextField *)self->_commentPrompt setPlaceholder:v12];

    [(UITextField *)self->_commentPrompt setClearButtonMode:1];
    id v13 = +[UIFont systemFontOfSize:15.0];
    [(UITextField *)self->_commentPrompt setFont:v13];

    [(UITextField *)self->_commentPrompt addTarget:self action:"_commentPromptDone:" forControlEvents:0x80000];
    [(UITextField *)self->_commentPrompt setDelegate:self];
    [(UITextField *)self->_commentPrompt setText:v8];
    [(UITextField *)self->_commentPrompt setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v14) = 1144750080;
    [(UITextField *)self->_commentPrompt setContentCompressionResistancePriority:0 forAxis:v14];
    uint64_t v15 = [(CalendarMessageCell *)self contentView];
    [v15 addSubview:self->_commentPrompt];
  }
  else
  {
    if (a4)
    {
      [(CalendarMessageCell *)self updateSelectedResponseButton];
      [(CalendarMessageCell *)self setNeedsLayout];
      goto LABEL_10;
    }
    [(CalendarMessageCell *)self _removeCommentPromptRelatedConstraintsIfNeeded];
    [(UITextField *)self->_commentPrompt removeFromSuperview];
    uint64_t v15 = self->_commentPrompt;
    self->_commentPrompt = 0;
  }

  [(CalendarMessageCell *)self updateSelectedResponseButton];
  [(CalendarMessageCell *)self setNeedsLayout];
  if (!a4)
  {
LABEL_11:
    [(CalendarMessageCell *)self setupCommentPromptConstraintsIfNeeded];
    goto LABEL_12;
  }
LABEL_10:
  [(CalendarMessageCell *)self layoutIfNeeded];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007B760;
  v18[3] = &unk_1001D2718;
  v18[4] = self;
  BOOL v19 = v6;
  +[UIView animateWithDuration:v18 animations:0.3];
  [(CalendarMessageCell *)self setupCommentPromptConstraintsIfNeeded];
  double v16 = [(CalendarMessageCell *)self _tableView];
  [v16 beginUpdates];

  double v17 = [(CalendarMessageCell *)self _tableView];
  [v17 endUpdates];

LABEL_12:
}

- (id)comment
{
  return [(UITextField *)self->_commentPrompt text];
}

- (void)_commentPromptDone:(id)a3
{
}

- (void)textFieldDidEndEditing:(id)a3
{
  if (self->_commentPrompt == a3)
  {
    id v5 = [(CalendarMessageCell *)self delegate];
    NSUInteger v4 = [(UITextField *)self->_commentPrompt text];
    [v5 messageCell:self committedComment:v4];
  }
}

- (void)updateAuthor
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = self->_authorView;
    NSUInteger v4 = [(CalendarMessageCell *)self authorCacheKeyForIdentity:self->_notification];
    uint64_t v5 = [(id)objc_opt_class() authorCacheObjectForKey:v4];
    BOOL v6 = (void *)v5;
    if (v5)
    {
      uint64_t v14 = v5;
      double v7 = +[NSArray arrayWithObjects:&v14 count:1];
      [(UIView *)v3 updateWithContacts:v7];
    }
    else
    {
      if ([(UIView *)v3 loadContactsAsynchronously]) {
        [(UIView *)v3 updateWithContacts:0];
      }
      id v8 = [(CalendarMessageCell *)self authorAddressForIdentity:self->_notification];
      id v9 = [(EKCalendarNotification *)self->_notification name];
      double v10 = [(EKCalendarNotification *)self->_notification firstName];
      uint64_t v11 = [(EKCalendarNotification *)self->_notification lastName];
      [(UIView *)v3 updateWithAddress:v8 fullName:v9 firstName:v10 lastName:v11];

      if (([(UIView *)v3 loadContactsAsynchronously] & 1) == 0)
      {
        double v12 = objc_opt_class();
        id v13 = [(UIView *)v3 contact];
        [v12 authorCacheSetObject:v13 forKey:v4];
      }
    }
  }
}

- (id)authorAddressForIdentity:(id)a3
{
  id v3 = a3;
  NSUInteger v4 = [v3 emailAddress];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = [v3 URL];
    id v6 = [v7 resourceSpecifier];
  }

  return v6;
}

- (id)authorCacheKeyForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CalendarMessageCell *)self authorAddressForIdentity:v4];
  id v6 = [v4 name];
  double v7 = [v4 firstName];
  id v8 = [v4 lastName];

  id v9 = +[NSString stringWithFormat:@"%@-%@-%@-%@", v5, v6, v7, v8];

  return v9;
}

- (void)_updateLabels
{
  [(CalendarMessageCell *)self _removeLabelRelatedConstraintsIfNeeded];
  id v3 = objc_opt_new();
  id v4 = v3;
  if (self->_titleLabels)
  {
    [v3 addObjectsFromArray:];
    titleLabels = self->_titleLabels;
    self->_titleLabels = 0;
  }
  if (self->_senderLabel)
  {
    [v4 addObject:];
    senderLabel = self->_senderLabel;
    self->_senderLabel = 0;
  }
  if (self->_actionLabels)
  {
    [v4 addObjectsFromArray:];
    actionLabels = self->_actionLabels;
    self->_actionLabels = 0;
  }
  if (self->_bodyLabels)
  {
    [v4 addObjectsFromArray:];
    bodyLabels = self->_bodyLabels;
    self->_bodyLabels = 0;
  }
  id v9 = objc_opt_new();
  double v10 = objc_opt_new();
  uint64_t v11 = (NSArray *)objc_opt_new();
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_10007C548;
  v94[3] = &unk_1001D3808;
  id v74 = v4;
  id v95 = v74;
  v96 = self;
  double v12 = objc_retainBlock(v94);
  id v13 = [(CalendarMessageCell *)self titleStrings];
  uint64_t v14 = [(CalendarMessageCell *)self preActionBodyStrings];
  uint64_t v15 = [(CalendarMessageCell *)self bodyStringDict];
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_10007C97C;
  v91[3] = &unk_1001D3830;
  v91[4] = self;
  double v16 = v12;
  id v93 = v16;
  double v17 = v9;
  v92 = v17;
  v78 = v13;
  [v13 enumerateObjectsUsingBlock:v91];
  if (![(NSArray *)v17 count])
  {
    id v18 = ((void (*)(void *, void, uint64_t, double))v16[2])(v16, 0, 1, 0.0);
    [(NSArray *)v17 addObject:v18];
  }
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_10007CA44;
  v88[3] = &unk_1001D3858;
  BOOL v19 = v16;
  id v90 = v19;
  double v20 = v10;
  v89 = v20;
  [v14 enumerateObjectsUsingBlock:v88];
  uint64_t v21 = [(CalendarMessageCell *)self actionBodyString];
  if (v21)
  {
    double v22 = ((void (*)(void *, uint64_t, uint64_t, double))v19[2])(v19, v21, 4, 0.0);
    [v22 setNumberOfLines:1];
    [(NSArray *)v20 addObject:v22];
  }
  v73 = v20;
  v75 = (void *)v21;
  v76 = v17;
  v77 = v14;
  uint64_t v23 = [v15 objectForKeyedSubscript:CUIKNotificationDescriptionKeyPerson];
  if (v23)
  {
    ((void (*)(void *, uint64_t, void, double))v19[2])(v19, v23, 0, 0.0);
    uint64_t v24 = (UILabel *)objc_claimAutoreleasedReturnValue();
    double v25 = self->_senderLabel;
    self->_senderLabel = v24;
  }
  v72 = (void *)v23;
  v79 = self;
  v99[0] = CUIKNotificationDescriptionKeySecondPerson;
  v99[1] = CUIKNotificationDescriptionKeyAction;
  v99[2] = CUIKNotificationDescriptionKeyApp;
  v99[3] = CUIKNotificationDescriptionKeyComment;
  v99[4] = CUIKNotificationDescriptionKeyRecurrence;
  +[NSArray arrayWithObjects:v99 count:5];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = [v26 countByEnumeratingWithState:&v84 objects:v98 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v28; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v85 != v29) {
          objc_enumerationMutation(v26);
        }
        double v31 = [v15 objectForKeyedSubscript:*(void *)(*((void *)&v84 + 1) + 8 * i)];
        if (v31)
        {
          v32 = ((void (*)(void *, void *, void, double))v19[2])(v19, v31, 0, 0.0);
          [(NSArray *)v11 addObject:v32];
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v84 objects:v98 count:16];
    }
    while (v28);
  }

  uint64_t v33 = [v15 objectForKeyedSubscript:CUIKNotificationDescriptionKeyTimeSensitive];
  if (v33)
  {
    v34 = ((void (*)(void *, uint64_t, uint64_t, double))v19[2])(v19, v33, 3, 0.0);
    [(NSArray *)v11 addObject:v34];
  }
  uint64_t v35 = [v15 objectForKeyedSubscript:CUIKNotificationDescriptionKeyDate];
  if (v35)
  {
    v36 = [v15 objectForKeyedSubscript:CUIKNotificationDescriptionKeyHintCancelled];
    BOOL v37 = v36 == 0;

    v38 = ((void (*)(void *, uint64_t, void, double))v19[2])(v19, v35, (2 * v37), 0.0);
    [(NSArray *)v11 addObject:v38];
  }
  v70 = (void *)v35;
  v71 = (void *)v33;
  uint64_t v39 = [v15 objectForKeyedSubscript:CUIKNotificationDescriptionKeyError];
  if (v39)
  {
    v69 = (MessageCellWarningView *)v39;
    v40 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v41 = +[UIImageSymbolConfiguration configurationWithFont:v40];
    v42 = +[UIImage systemImageNamed:@"exclamationmark.triangle.fill" withConfiguration:v41];
    v43 = +[UIColor systemRedColor];
    v44 = [v42 imageWithTintColor:v43 renderingMode:1];
    v68 = 0;
  }
  else
  {
    uint64_t v45 = CUIKNotificationDescriptionKeyConflict;
    uint64_t v46 = [v15 objectForKeyedSubscript:CUIKNotificationDescriptionKeyConflict];
    v47 = v79;
    if (!v46)
    {
      v48 = [(CalendarMessageCell *)v79 conflictDict];
      uint64_t v46 = [v48 objectForKeyedSubscript:v45];

      if (!v46)
      {
        [(MessageCellWarningView *)v79->_warningView removeFromSuperview];
        warningView = v79->_warningView;
        v79->_warningView = 0;
        goto LABEL_38;
      }
    }
    v69 = (MessageCellWarningView *)v46;
    uint64_t v49 = CUIKNotificationDescriptionKeyConflictEventRange;
    uint64_t v50 = [v15 objectForKeyedSubscript:CUIKNotificationDescriptionKeyConflictEventRange];
    if (!v50)
    {
      v51 = [(CalendarMessageCell *)v79 conflictDict];
      uint64_t v50 = [v51 objectForKeyedSubscript:v49];
    }
    v68 = (void *)v50;
    v40 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v41 = +[UIImageSymbolConfiguration configurationWithFont:v40];
    v42 = +[UIImage systemImageNamed:@"exclamationmark.circle.fill" withConfiguration:v41];
    v43 = +[UIColor systemRedColor];
    v44 = [v42 imageWithTintColor:v43 renderingMode:1];
  }

  v47 = v79;
  v52 = v79->_warningView;
  if (!v52)
  {
    uint64_t v53 = objc_opt_new();
    v54 = v79->_warningView;
    v79->_warningView = (MessageCellWarningView *)v53;

    [(MessageCellWarningView *)v79->_warningView setTranslatesAutoresizingMaskIntoConstraints:0];
    v55 = [(CalendarMessageCell *)v79 contentView];
    [v55 addSubview:v79->_warningView];

    v52 = v79->_warningView;
  }
  warningView = v69;
  [(MessageCellWarningView *)v52 setImage:v44 warningString:v69 emphasizedRangeValue:v68];

LABEL_38:
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v57 = v74;
  id v58 = [v57 countByEnumeratingWithState:&v80 objects:v97 count:16];
  if (v58)
  {
    id v59 = v58;
    uint64_t v60 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v59; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v81 != v60) {
          objc_enumerationMutation(v57);
        }
        [*(id *)(*((void *)&v80 + 1) + 8 * (void)j) removeFromSuperview];
      }
      id v59 = [v57 countByEnumeratingWithState:&v80 objects:v97 count:16];
    }
    while (v59);
  }

  v62 = v47->_titleLabels;
  v47->_titleLabels = v76;
  double v63 = v76;

  double v64 = v47->_actionLabels;
  v47->_actionLabels = v73;
  v65 = v73;

  v66 = v47->_bodyLabels;
  v47->_bodyLabels = v11;
  double v67 = v11;

  [(CalendarMessageCell *)v47 setupLabelConstraintsIfNeeded];
}

- (void)_updateResponseButtons
{
  id v4 = [(CalendarMessageCell *)self _responseButtons];
  id v3 = [(CalendarMessageCell *)self actions];
  [v4 setActions:v3];

  [v4 setSelectedAction:0];
}

- (void)_updateColorBar
{
  if (!self->_colorBar)
  {
    id v3 = objc_alloc_init(MessageCellColorBarView);
    colorBar = self->_colorBar;
    self->_colorBar = v3;

    [(MessageCellColorBarView *)self->_colorBar setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1144750080;
    [(MessageCellColorBarView *)self->_colorBar setContentCompressionResistancePriority:0 forAxis:v5];
    id v6 = [(CalendarMessageCell *)self contentView];
    [v6 addSubview:self->_colorBar];
  }
  double v7 = [(CalendarMessageCell *)self color];
  [(MessageCellColorBarView *)self->_colorBar setColor:v7];

  [(CalendarMessageCell *)self setupColorBarConstraintsIfNeeded];
}

+ (double)defaultRowHeight
{
  return 201.0;
}

- (void)actionLabelTap
{
  id v3 = [(CalendarMessageCell *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained performAction:[self actionBodyStringAction] forCell:self appliesToAll:0 ifCancelled:0];
  }
}

- (id)_responseButtons
{
  responseButtons = self->_responseButtons;
  if (!responseButtons)
  {
    id v4 = objc_alloc((Class)EKUIEventStatusButtonsView);
    double v5 = [(CalendarMessageCell *)self actions];
    id v6 = [v4 initWithFrame:v5 actions:self delegate:[self options] options:([self options] | 2) CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v7 = self->_responseButtons;
    self->_responseButtons = v6;

    -[EKUIEventStatusButtonsView setButtonsTouchInsets:](self->_responseButtons, "setButtonsTouchInsets:", -15.0, -15.0, -15.0, -15.0);
    [(EKUIEventStatusButtonsView *)self->_responseButtons setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [(CalendarMessageCell *)self traitCollection];
    [(EKUIEventStatusButtonsView *)self->_responseButtons setShouldUseVerticalLayout:EKUIUsesLargeTextLayout()];

    [(EKUIEventStatusButtonsView *)self->_responseButtons updateFonts];
    id v9 = [(CalendarMessageCell *)self contentView];
    [v9 addSubview:self->_responseButtons];

    responseButtons = self->_responseButtons;
  }

  return responseButtons;
}

- (void)updateSelectedResponseButton
{
  if (self->_showsCommentPrompt) {
    int64_t v3 = 4;
  }
  else {
    int64_t v3 = [(CalendarMessageCell *)self selectedResponseButton];
  }
  id v4 = [(CalendarMessageCell *)self _responseButtons];
  [v4 setSelectedAction:v3];

  if (v3)
  {
    double v5 = [(CalendarMessageCell *)self _responseButtons];
    bottomMostViewToContentViewBottomConstraint = self->_bottomMostViewToContentViewBottomConstraint;
    id v6 = +[NSArray arrayWithObjects:&bottomMostViewToContentViewBottomConstraint count:1];
    +[NSLayoutConstraint deactivateConstraints:v6];

    double v7 = [v5 trailingButton];
    id v8 = [v7 titleLabel];
    id v9 = [v8 font];
    [v9 _scaledValueForValue:-10.0];
    double v11 = v10;

    double v12 = [v5 trailingButton];
    id v13 = [(CalendarMessageCell *)self contentView];
    uint64_t v14 = +[NSLayoutConstraint constraintWithItem:v12 attribute:4 relatedBy:0 toItem:v13 attribute:4 multiplier:1.0 constant:v11];
    uint64_t v15 = self->_bottomMostViewToContentViewBottomConstraint;
    self->_bottomMostViewToContentViewBottomConstraint = v14;

    [(NSLayoutConstraint *)self->_bottomMostViewToContentViewBottomConstraint setActive:1];
    [(CalendarMessageCell *)self setNeedsLayout];
  }
}

- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  double v12 = (void *)kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    uint64_t v14 = +[NSNumber numberWithInteger:a4];
    uint64_t v15 = +[NSNumber numberWithBool:v7];
    int v19 = 138543874;
    double v20 = v14;
    __int16 v21 = 2114;
    id v22 = v10;
    __int16 v23 = 2114;
    uint64_t v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Event status buttons view did select action: [%{public}@]. Event status buttons view: %{public}@, appliesToAll: %{public}@.", (uint8_t *)&v19, 0x20u);
  }
  double v16 = [(CalendarMessageCell *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained performAction:a4 forCell:self appliesToAll:v7 ifCancelled:v11];
  }
}

- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4
{
  self->_cachedStatusButtonsFontSize = a4;
}

- (id)eventStatusButtonsViewButtonFont:(id)a3
{
  id v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  double v5 = [v4 fontWithSize:self->_cachedStatusButtonsFontSize];

  return v5;
}

- (void)setNotification:(id)a3
{
  double v5 = (EKCalendarNotification *)a3;
  p_notification = &self->_notification;
  if (self->_notification != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_notification, a3);
    BOOL v7 = [(CalendarMessageCell *)self _responseButtons];
    [v7 setActions:&__NSArray0__struct];

    [(CalendarMessageCell *)self _updateColorBar];
    [(CalendarMessageCell *)self _updateResponseButtons];
    [(CalendarMessageCell *)self _updateLabels];
    [(CalendarMessageCell *)self updateAuthor];
    [(CalendarMessageCell *)self updateSelectedResponseButton];
    [(CalendarMessageCell *)self setNeedsLayout];
    [(CalendarMessageCell *)self setNeedsDisplay];
    p_notification = (EKCalendarNotification **)[(CalendarMessageCell *)self _updateAppEntityAnnotation];
    double v5 = v8;
  }

  _objc_release_x1(p_notification, v5);
}

- (void)_updateAppEntityAnnotation
{
  int64_t v3 = [(CalendarMessageCell *)self notification];
  [(CalendarMessageCell *)self Cal_annotateWithNotification:v3];

  [(CalendarMessageCell *)self _updateAppEntityAnnotationState];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CalendarMessageCell;
  [(CalendarMessageCell *)&v5 setSelected:a3 animated:a4];
  [(CalendarMessageCell *)self _updateAppEntityAnnotationState];
}

- (void)_updateAppEntityAnnotationState
{
  id v3 = [(CalendarMessageCell *)self isSelected];

  [(CalendarMessageCell *)self Cal_updateEntityAnnotationStateIsSelected:v3 isHighlighted:0 isFocused:0 isDisabled:0 isEditing:0 isPrimary:0];
}

+ (int64_t)numberOfLinesForTitleLabels
{
  if (EKUIUsesLargeTextLayout()) {
    return 0;
  }
  else {
    return 2;
  }
}

+ (int64_t)numberOfLinesForBodyLabels
{
  if (EKUIUsesLargeTextLayout()) {
    return 0;
  }
  else {
    return 2;
  }
}

- (id)preActionBodyStrings
{
  return 0;
}

- (id)actionBodyString
{
  return 0;
}

- (int64_t)actionBodyStringAction
{
  return 0;
}

- (BOOL)showAsCancelledOrDeclined
{
  return self->_showsCommentPrompt;
}

- (id)color
{
  id v3 = [(CalendarMessageCell *)self notification];
  id v4 = [v3 dotColor];

  if (v4)
  {
    objc_super v5 = [(CalendarMessageCell *)self notification];
    id v6 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v5 dotColor]);
  }
  else
  {
    id v6 = +[UIColor lightGrayColor];
  }

  return v6;
}

- (int64_t)selectedResponseButton
{
  return 0;
}

- (void)setHasDisclosure:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hasDisclosure = a3;
  [(CalendarMessageCell *)self _removeDisclosureConstraintsIfNeeded];
  [(UIView *)self->_disclosureIndicatorView removeFromSuperview];
  disclosureIndicatorView = self->_disclosureIndicatorView;
  self->_disclosureIndicatorView = 0;

  self->_didSetupDisclosureConstraints = 0;
  if (v3)
  {
    id v6 = +[EKUISemiConstantCache sharedInstance];
    BOOL v7 = [v6 inboxDisclosureImage];

    id v8 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
    id v9 = +[UIColor tertiaryLabelColor];
    [(UIView *)v8 setTintColor:v9];

    id v10 = self->_disclosureIndicatorView;
    self->_disclosureIndicatorView = v8;
    id v11 = v8;

    [(UIView *)self->_disclosureIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1148846080;
    [(UIView *)self->_disclosureIndicatorView setContentCompressionResistancePriority:0 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(UIView *)self->_disclosureIndicatorView setContentCompressionResistancePriority:1 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [(UIView *)self->_disclosureIndicatorView setContentHuggingPriority:0 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [(UIView *)self->_disclosureIndicatorView setContentHuggingPriority:1 forAxis:v15];
    double v16 = [(CalendarMessageCell *)self contentView];
    [v16 addSubview:self->_disclosureIndicatorView];

    [(CalendarMessageCell *)self setupDisclosureConstraintsIfNeeded];
  }
  [(CalendarMessageCell *)self setNeedsLayout];

  [(CalendarMessageCell *)self setNeedsDisplay];
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  id v4 = [(CalendarMessageCell *)self traitCollection];
  [(EKUIEventStatusButtonsView *)self->_responseButtons setShouldUseVerticalLayout:EKUIUsesLargeTextLayout()];

  self->_didSetupColorBarConstraints = 0;
  self->_didSetupLabelConstraints = 0;
  [(CalendarMessageCell *)self _updateColorBar];
  [(CalendarMessageCell *)self _updateLabels];
  responseButtons = self->_responseButtons;

  [(EKUIEventStatusButtonsView *)responseButtons updateFonts];
}

- (EKCalendarNotification)notification
{
  return self->_notification;
}

- (CalendarMessageCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CalendarMessageCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasDisclosure
{
  return self->_hasDisclosure;
}

- (UIView)authorView
{
  return self->_authorView;
}

- (void)setAuthorView:(id)a3
{
}

- (unint64_t)destination
{
  return self->_destination;
}

- (NSDictionary)conflictDict
{
  return self->_conflictDict;
}

- (void)setConflictDict:(id)a3
{
}

- (NSArray)labelRelatedConstraints
{
  return self->_labelRelatedConstraints;
}

- (void)setLabelRelatedConstraints:(id)a3
{
}

- (NSArray)colorBarConstraints
{
  return self->_colorBarConstraints;
}

- (void)setColorBarConstraints:(id)a3
{
}

- (NSArray)disclosureConstraints
{
  return self->_disclosureConstraints;
}

- (void)setDisclosureConstraints:(id)a3
{
}

- (NSArray)commentPromptRelatedConstraints
{
  return self->_commentPromptRelatedConstraints;
}

- (void)setCommentPromptRelatedConstraints:(id)a3
{
}

- (NSIndexSet)indexSetOfTruncatedTitleStrings
{
  return self->_indexSetOfTruncatedTitleStrings;
}

- (NSIndexSet)indexSetOfTruncatedBodyStrings
{
  return self->_indexSetOfTruncatedBodyStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSetOfTruncatedBodyStrings, 0);
  objc_storeStrong((id *)&self->_indexSetOfTruncatedTitleStrings, 0);
  objc_storeStrong((id *)&self->_commentPromptRelatedConstraints, 0);
  objc_storeStrong((id *)&self->_disclosureConstraints, 0);
  objc_storeStrong((id *)&self->_colorBarConstraints, 0);
  objc_storeStrong((id *)&self->_labelRelatedConstraints, 0);
  objc_storeStrong((id *)&self->_conflictDict, 0);
  objc_storeStrong((id *)&self->_authorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_bodyLabelConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_statusButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_statusButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomMostViewToContentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_responseButtonsToCommentLabelConstraint, 0);
  objc_storeStrong((id *)&self->_lastBodyLabelToResponseButtonsConstraint, 0);
  objc_storeStrong((id *)&self->_lastTitleLabelToFirstBodyLabelConstraint, 0);
  objc_storeStrong((id *)&self->_firstTitleLabelToContentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_commentPrompt, 0);
  objc_storeStrong((id *)&self->_warningView, 0);
  objc_storeStrong((id *)&self->_responseButtons, 0);
  objc_storeStrong((id *)&self->_disclosureIndicatorView, 0);
  objc_storeStrong((id *)&self->_colorBar, 0);
  objc_storeStrong((id *)&self->_bodyLabels, 0);
  objc_storeStrong((id *)&self->_actionLabels, 0);
  objc_storeStrong((id *)&self->_senderLabel, 0);

  objc_storeStrong((id *)&self->_titleLabels, 0);
}

- (id)titleStrings
{
  return 0;
}

- (id)bodyStringDict
{
  return 0;
}

- (id)actions
{
  return 0;
}

- (unint64_t)options
{
  return 0;
}

@end