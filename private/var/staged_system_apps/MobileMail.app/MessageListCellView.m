@interface MessageListCellView
+ (OS_os_log)log;
- (BOOL)_hasPastReminderForReadLaterDate:(id)a3 displayDate:(id)a4;
- (BOOL)_isLabelValid:(id)a3;
- (BOOL)disclosureEnabled;
- (BOOL)hasGeneratedSummary;
- (BOOL)hideMessageListAvatar;
- (BOOL)isCompact;
- (BOOL)isEditing;
- (BOOL)isFlagged;
- (BOOL)isHighlighted;
- (BOOL)isMute;
- (BOOL)isNotify;
- (BOOL)isRead;
- (BOOL)isReadLater;
- (BOOL)isSelected;
- (BOOL)isSenderSpecificCell;
- (BOOL)shouldAnnotateReplyOrForward;
- (BOOL)shouldShowCategorizationInformation;
- (BOOL)shouldShowHighImpact;
- (BOOL)swiped;
- (BOOL)verifyContentVisibility:(id *)a3;
- (CGPoint)_dateOriginAlignedWithAddressBaselineForBounds:(CGRect)a3;
- (CGPoint)_dateOriginUnderSummary:(CGRect)a3;
- (CGPoint)_originForChevronBoxWithBounds:(CGRect)a3 addressRect:(CGRect)a4 sizeForChevron:(CGSize)a5;
- (CGRect)_adjustRect:(CGRect)a3 forTrailingRect:(CGRect)a4 padding:(double)a5;
- (CGRect)_rectForAddressWithBounds:(CGRect)a3;
- (CGRect)_rectForAvatarWithBounds:(CGRect)a3;
- (CGRect)_rectForCategoriesStackViewWithBounds:(CGRect)a3;
- (CGRect)_rectForChevronBoxWithBounds:(CGRect)a3 addressRect:(CGRect)a4 type:(int64_t)a5;
- (CGRect)_rectForChevronWithBounds:(CGRect)a3 addressRect:(CGRect)a4;
- (CGRect)_rectForDateWithBounds:(CGRect)a3 chevronRect:(CGRect)a4;
- (CGRect)_rectForDisclosureButtonWithFrame:(CGRect)a3 boxFrame:(CGRect)a4;
- (CGRect)_rectForMultipleSubjectWithBounds:(CGRect)a3 position:(int64_t)a4;
- (CGRect)_rectForRecipientLabelWithBounds:(CGRect)a3;
- (CGRect)_rectForStatusIndicatorViewsWithPrimaryStatusIndicatorImage:(id)a3;
- (CGRect)_rectForSubjectWithBounds:(CGRect)a3;
- (CGRect)_rectForSummaryWithBounds:(CGRect)a3;
- (CGSize)_sizeForChevron;
- (CGSize)_sizeForChevronWithType:(int64_t)a3;
- (EFCancelable)avatarToken;
- (EFCancelable)messageListAvatarUserDefaultObserver;
- (EMCachingContactStore)contactStore;
- (EMCategory)category;
- (LayoutStatusIndicatorInfo)_layoutStatusIndicatorViews;
- (LayoutStatusIndicatorInfo)_layoutStatusIndicatorViewsWithChevronRect:(SEL)a3;
- (MUIAvatarImageGenerator)avatarGenerator;
- (MUIAvatarImageGeneratorResult)avatarResult;
- (MessageListCellLabel)primaryLabel;
- (MessageListCellLabel)secondaryLabel;
- (MessageListCellLabel)tertiaryLabel;
- (MessageListCellLayoutValues)layoutValues;
- (MessageListCellLayoutValuesHelper)layoutValuesHelper;
- (MessageListCellView)initWithFrame:(CGRect)a3;
- (MessageListCellViewModel)viewModel;
- (MessageListStatusIndicatorManager)statusIndicatorManager;
- (NSAttributedString)attributedPrimaryString;
- (NSAttributedString)attributedSecondaryString;
- (NSAttributedString)attributedTertiaryString;
- (NSDate)readLaterDate;
- (NSIndexSet)flagColors;
- (NSString)accessibilitySecondaryLabel;
- (NSString)summary;
- (NSTextAttachment)summarySymbolTextAttachment;
- (UIBackgroundConfiguration)backgroundConfiguration;
- (UIButton)disclosureButton;
- (UICellConfigurationState)configurationState;
- (UIImageView)avatarView;
- (UIImageView)chevron;
- (UIImageView)recipientLabelImageView;
- (UILabel)categorizationStateLabel;
- (UILabel)dateLabel;
- (UIListContentConfiguration)contentConfiguration;
- (UIStackView)categoriesStackView;
- (id)_addressAttributesWithColor:(id)a3;
- (id)_baselineLabelForIndicator;
- (id)_bodyAttributesWithColor:(id)a3;
- (id)_dateForViewModel:(id)a3;
- (id)_defaultAttributesWithFont:(id)a3 color:(id)a4;
- (id)_formatTertiaryString:(id)a3;
- (id)_highlightedPrimaryString:(id)a3;
- (id)_highlightedSender:(id)a3;
- (id)_highlightedSubject:(id)a3;
- (id)_highlightedSummarySnippet:(id)a3;
- (id)_labelForVerticalPosition:(unint64_t)a3 font:(id *)a4;
- (id)_primaryLabelString;
- (id)_secondaryStringAttributesWithColor:(id)a3;
- (id)_statusIndicatorVeritcalPositionForLabel:(id)a3 font:(id)a4 shouldAlignWithCenter:(BOOL)a5;
- (id)_statusIndicatorVerticalPositionAvatarForItem:(unint64_t)a3 verticalIndicatorCount:(int64_t)a4;
- (int64_t)annotatedRelationshipType;
- (int64_t)chevronType;
- (int64_t)dateStyle;
- (int64_t)numberOfPreviewLines;
- (int64_t)recipientLabelType;
- (void)_animateIndicator:(unint64_t)a3 toState:(BOOL)a4;
- (void)_dynamicTypeDidChange:(id)a3;
- (void)_invalidateCachedValues;
- (void)_layoutChevronForDisclosureStateAnimated:(BOOL)a3;
- (void)_layoutDisclosureButton;
- (void)_layoutValuesDidChange:(id)a3;
- (void)_recalculateAttributedStrings;
- (void)_recalculatePrimaryAttributedString;
- (void)_recalculatePrimaryAttributedStringShouldRehighlight:(BOOL)a3;
- (void)_recalculateSecondaryAttributedString;
- (void)_recalculateSecondaryAttributedStringShouldRehighlight:(BOOL)a3;
- (void)_recalculateTertiaryAttributedString;
- (void)_recalculateTertiaryAttributedStringShouldRehighlight:(BOOL)a3;
- (void)_resetAttributedStrings;
- (void)_resetDateLabel;
- (void)_setupDisclosureButtonImageIfNecessary;
- (void)_updateAvatarView;
- (void)_updateDateLabelWithDateStyle:(int64_t)a3;
- (void)applyIndicatorPreviewChangeAction:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilitySecondaryLabel:(id)a3;
- (void)setAnnotatedRelationshipType:(int64_t)a3;
- (void)setAttributedPrimaryString:(id)a3;
- (void)setAttributedSecondaryString:(id)a3;
- (void)setAttributedTertiaryString:(id)a3;
- (void)setAvatarGenerator:(id)a3;
- (void)setAvatarResult:(id)a3;
- (void)setAvatarToken:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setBackgroundConfiguration:(id)a3;
- (void)setCategoriesStackView:(id)a3;
- (void)setCategorizationStateLabel:(id)a3;
- (void)setCategory:(id)a3;
- (void)setChevron:(id)a3;
- (void)setChevronType:(int64_t)a3;
- (void)setCompact:(BOOL)a3;
- (void)setConfigurationState:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContentConfiguration:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setDateStyle:(int64_t)a3;
- (void)setDisclosureEnabled:(BOOL)a3;
- (void)setDisclosureEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setDisplayUnreadDot:(BOOL)a3;
- (void)setDisplayVIP:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFlagColors:(id)a3;
- (void)setFlagged:(BOOL)a3;
- (void)setHasGeneratedSummary:(BOOL)a3;
- (void)setHideMessageListAvatar:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsReadLater:(BOOL)a3;
- (void)setLayoutValuesHelper:(id)a3;
- (void)setMessageListAvatarUserDefaultObserver:(id)a3;
- (void)setMute:(BOOL)a3;
- (void)setNotify:(BOOL)a3;
- (void)setNumberOfPreviewLines:(int64_t)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setRead:(BOOL)a3;
- (void)setReadLaterDate:(id)a3;
- (void)setRecipientLabelImageView:(id)a3;
- (void)setRecipientLabelType:(int64_t)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSenderSpecificCell:(BOOL)a3;
- (void)setShouldAnnotateReplyOrForward:(BOOL)a3;
- (void)setShouldShowHighImpact:(BOOL)a3;
- (void)setStatusIndicatorManager:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSummarySymbolTextAttachment:(id)a3;
- (void)setSwiped:(BOOL)a3;
- (void)setTertiaryLabel:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MessageListCellView

- (CGRect)_rectForDisclosureButtonWithFrame:(CGRect)a3 boxFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  unsigned __int8 v12 = [(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout];
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v24);
  CGFloat v22 = v10;
  if (v12)
  {
    CGFloat v13 = v8;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v25);
  }
  else
  {
    v26.origin.CGFloat x = v11;
    v26.origin.CGFloat y = v10;
    v26.size.CGFloat width = v9;
    CGFloat v13 = v8;
    v26.size.CGFloat height = v8;
    double MaxX = CGRectGetMaxX(v26);
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double MinX = MaxX - CGRectGetMaxX(v27);
  }
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v16 = CGRectGetWidth(v28) + MinX * 2.0;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v17 = CGRectGetHeight(v29);
  double v18 = 0.0;
  if ((v12 & 1) == 0)
  {
    v30.origin.CGFloat x = v11;
    v30.origin.CGFloat y = v22;
    v30.size.CGFloat width = v9;
    v30.size.CGFloat height = v13;
    double v18 = CGRectGetMaxX(v30) - v16;
  }
  double v19 = v17 + MinY * 2.0;
  double v20 = 0.0;
  double v21 = v16;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)_layoutChevronForDisclosureStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MessageListCellView *)self layoutValues];
  v6 = [(MessageListCellView *)self configurationState];
  v7 = [(MessageListCellView *)self contentConfiguration];
  CGFloat v8 = [(MessageListCellView *)self backgroundConfiguration];
  CGFloat v9 = [v5 threadDisclosureColorForConfigurationState:v6 contentConfiguration:v7 backgroundConfiguration:v8];
  CGFloat v10 = [(MessageListCellView *)self disclosureButton];
  [v10 setTintColor:v9];

  if ([(MessageListCellView *)self disclosureEnabled])
  {
    if ([(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout])CGFloat v11 = -1.57079633; {
    else
    }
      CGFloat v11 = 1.57079633;
    CGAffineTransformMakeRotation(&v22, v11);
    CGFloat a = v22.a;
    CGFloat b = v22.b;
    CGFloat c = v22.c;
    CGFloat d = v22.d;
    tCGFloat x = v22.tx;
    tCGFloat y = v22.ty;
  }
  else
  {
    CGFloat a = CGAffineTransformIdentity.a;
    CGFloat b = CGAffineTransformIdentity.b;
    CGFloat c = CGAffineTransformIdentity.c;
    CGFloat d = CGAffineTransformIdentity.d;
    tCGFloat x = CGAffineTransformIdentity.tx;
    tCGFloat y = CGAffineTransformIdentity.ty;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000051B8;
  v21[3] = &unk_100609318;
  v21[4] = self;
  *(CGFloat *)&v21[5] = a;
  *(CGFloat *)&v21[6] = b;
  *(CGFloat *)&v21[7] = c;
  *(CGFloat *)&v21[8] = d;
  *(CGFloat *)&v21[9] = tx;
  *(CGFloat *)&v21[10] = ty;
  double v18 = objc_retainBlock(v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000075AC;
  v20[3] = &unk_100604550;
  v20[4] = self;
  double v19 = objc_retainBlock(v20);
  if (v3)
  {
    +[UIView animateWithDuration:v18 animations:v19 completion:0.333];
  }
  else
  {
    ((void (*)(void *))v18[2])(v18);
    ((void (*)(void *, uint64_t))v19[2])(v19, 1);
  }
}

- (void)_setupDisclosureButtonImageIfNecessary
{
  id v7 = [(MessageListCellView *)self disclosureButton];
  BOOL v3 = [v7 imageView];
  v4 = [v3 image];

  if (!v4)
  {
    [(MessageListCellView *)self _layoutDisclosureButton];
    id v8 = [(MessageListCellView *)self disclosureButton];
    v5 = +[UIImage systemImageNamed:MFImageGlyphMessageListChevronThread];
    [v8 setImage:v5 forState:0];

    id v9 = [(MessageListCellView *)self disclosureButton];
    v6 = [v9 imageView];
    [v6 setContentMode:1];
  }
}

- (void)setContentConfiguration:(id)a3
{
  id v5 = a3;
  if ((-[UIListContentConfiguration isEqual:](self->_contentConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentConfiguration, a3);
    [(MessageListCellView *)self _resetAttributedStrings];
    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (void)setDisplayUnreadDot:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MessageListCellView *)self statusIndicatorManager];
  [v4 setHidesUnreadIndicator:!v3];
}

- (void)setDisplayVIP:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MessageListCellView *)self statusIndicatorManager];
  [v4 setHidesVIPIndicator:!v3];
}

- (void)setSummary:(id)a3
{
  id v7 = (NSString *)a3;
  if (self->_summary != v7)
  {
    id v4 = (NSString *)[(NSString *)v7 copy];
    summarCGFloat y = self->_summary;
    self->_summarCGFloat y = v4;

    attributedTertiaryString = self->_attributedTertiaryString;
    self->_attributedTertiaryString = 0;

    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (void)setConfigurationState:(id)a3
{
  id v5 = a3;
  if ((-[UICellConfigurationState isEqual:](self->_configurationState, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_configurationState, a3);
    [(MessageListCellView *)self _resetAttributedStrings];
    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (void)setBackgroundConfiguration:(id)a3
{
  id v5 = a3;
  if ((-[UIBackgroundConfiguration isEqual:](self->_backgroundConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backgroundConfiguration, a3);
    [(MessageListCellView *)self _resetAttributedStrings];
    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (void)_resetAttributedStrings
{
  attributedPrimaryString = self->_attributedPrimaryString;
  self->_attributedPrimaryString = 0;

  attributedSecondaryString = self->_attributedSecondaryString;
  self->_attributedSecondaryString = 0;

  accessibilitySecondaryLabel = self->_accessibilitySecondaryLabel;
  self->_accessibilitySecondaryLabel = 0;

  attributedTertiaryString = self->_attributedTertiaryString;
  self->_attributedTertiaryString = 0;
}

- (void)layoutSubviews
{
  v175.receiver = self;
  v175.super_class = (Class)MessageListCellView;
  [(MessageListCellView *)&v175 layoutSubviews];
  [(MessageListCellView *)self _layoutDisclosureButton];
  if ([(MessageListCellView *)self isEditing])
  {
    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v4 = [(MessageListCellView *)self statusIndicatorManager];
    id v5 = [v4 statusIndicatorViews];

    id v6 = [v5 countByEnumeratingWithState:&v171 objects:v176 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v172;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v172 != v7) {
            objc_enumerationMutation(v5);
          }
          [(MessageListCellView *)self addSubview:*(void *)(*((void *)&v171 + 1) + 8 * i)];
        }
        id v6 = [v5 countByEnumeratingWithState:&v171 objects:v176 count:16];
      }
      while (v6);
    }
  }
  [(MessageListCellView *)self _recalculateAttributedStrings];
  id v9 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v9);

  CGFloat v10 = [(MessageListCellView *)self viewModel];
  v164 = [(MessageListCellView *)self _dateForViewModel:v10];
  if ([(MessageListCellView *)self isSelected]) {
    unsigned int v11 = 1;
  }
  else {
    unsigned int v11 = [(MessageListCellView *)self isHighlighted];
  }
  v167 = [(MessageListCellView *)self dateLabel];
  switch([(MessageListCellView *)self dateStyle])
  {
    case 0:
      [v164 timeIntervalSince1970];
      [v167 setTimeInterval:v12 + -978307200.0];
      break;
    case 1:
      CGFloat v13 = +[NSDateFormatter ef_formatDate:v164 style:2];
      [v167 setText:v13];
      goto LABEL_22;
    case 2:
      if (v11) {
        goto LABEL_19;
      }
      goto LABEL_20;
    case 3:
      if (v11) {
LABEL_19:
      }
        sub_100136A74();
      else {
LABEL_20:
      }
      v14 = sub_100044274();
      [v167 _setTextEncapsulation:v14];

      CGFloat v13 = _EFLocalizedString();
      [v167 setText:v13];
LABEL_22:

      break;
    default:
      break;
  }
  int64_t v15 = [(MessageListCellView *)self dateStyle];
  if (v164 || (double v16 = 0.0, (v15 & 0xFFFFFFFFFFFFFFFELL) == 2))
  {
    BOOL v17 = !IsAccessibilityCategory || [v10 style] != (id)2;
    double v16 = (double)v17;
  }
  [v167 mf_setAlpha:v16];
  double v18 = [(MessageListCellView *)self layoutValues];
  double v19 = [(MessageListCellView *)self configurationState];
  double v20 = [(MessageListCellView *)self contentConfiguration];
  double v21 = [(MessageListCellView *)self backgroundConfiguration];
  CGAffineTransform v22 = [v18 dateColorForConfigurationState:v19 contentConfiguration:v20 backgroundConfiguration:v21];
  [v167 setTextColor:v22];

  if (_os_feature_enabled_impl())
  {
    v23 = [v10 hintsBySnippetZone];
    CGRect v24 = [v23 objectForKeyedSubscript:EMMessageSnippetHintZoneAuthor];
    if ([v24 count])
    {
    }
    else
    {
      CGRect v25 = [v10 hintsBySnippetZone];
      CGRect v26 = [v25 objectForKeyedSubscript:EMMessageSnippetHintZoneAuthorEmailAddresses];
      BOOL v27 = [v26 count] == 0;

      if (v27) {
        goto LABEL_34;
      }
    }
    [(MessageListCellView *)self _recalculatePrimaryAttributedStringShouldRehighlight:1];
  }
LABEL_34:
  CGRect v28 = [(MessageListCellView *)self attributedPrimaryString];
  CGRect v29 = [(MessageListCellView *)self primaryLabel];
  [v29 setAttributedText:v28];

  v165 = [(MessageListCellView *)self secondaryLabel];
  CGRect v30 = [(MessageListCellView *)self layoutValues];
  int v31 = [v30 isSubjectVisible];
  v32 = [(MessageListCellView *)self attributedSecondaryString];
  v33 = [(MessageListCellView *)self accessibilitySecondaryLabel];
  sub_10003D6BC((uint64_t)self, v165, v31, v32, v33);

  v166 = [(MessageListCellView *)self recipientLabelImageView];
  if ([(MessageListCellView *)self recipientLabelType])
  {
    [v166 mf_setAlpha:1.0];
    int64_t recipientLabelType = self->_recipientLabelType;
    v35 = [(MessageListCellView *)self traitCollection];
    v36 = sub_1001376A4(recipientLabelType, (uint64_t)[v35 userInterfaceStyle]);
    v37 = [v36 imageWithRenderingMode:2];
    [v166 setImage:v37];

    v38 = [(MessageListCellView *)self layoutValues];
    v33 = [(MessageListCellView *)self configurationState];
    v39 = [(MessageListCellView *)self contentConfiguration];
    v2 = [(MessageListCellView *)self backgroundConfiguration];
    v40 = [v38 recipientColorForConfigurationState:v33 contentConfiguration:v39 backgroundConfiguration:v2];
    [v166 setTintColor:v40];
  }
  else
  {
    [v166 mf_setAlpha:0.0];
  }
  if ((id)[(MessageListCellView *)self chevronType] == (id)1)
  {
    v41 = [(MessageListCellView *)self chevron];
    [v41 mf_setAlpha:1.0];
    v42 = +[UIImage mf_imageForChevronType:1];
    [v41 setImage:v42];

    v43 = +[UIImage mf_symbolConfigurationForView:9];
    [v41 setPreferredSymbolConfiguration:v43];

    v44 = +[UIColor tertiaryLabelColor];
    [v41 setTintColor:v44];
  }
  else
  {
    [(UIImageView *)self->_chevron mf_setAlpha:0.0];
  }
  v45 = [(MessageListCellView *)self layoutValues];
  [v45 padding];
  [(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout];
  MFEdgeInsetsFromDirectionalEdgeInsets();
  double v162 = v46;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;

  [(MessageListCellView *)self bounds];
  double v160 = v53;
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  v169[0] = _NSConcreteStackBlock;
  v169[1] = 3221225472;
  v169[2] = sub_10003A3D8;
  v169[3] = &unk_1006092C8;
  char v170 = v11;
  v60 = objc_retainBlock(v169);
  v61 = [UIApp preferredContentSizeCategory];
  BOOL v62 = UIContentSizeCategoryIsAccessibilityCategory(v61);

  double v63 = v50 + v55;
  double v64 = v48 + v57;
  double v65 = v160 - (v50 + v162);
  double v66 = v59 - (v48 + v52);
  if (v62
    || [(MessageListCellView *)self hideMessageListAvatar]
    || !EMBlackPearlIsFeatureEnabled())
  {
    v71 = [(MessageListCellView *)self avatarView];

    if (v71)
    {
      v72 = [(MessageListCellView *)self avatarView];
      [v72 removeFromSuperview];

      [(MessageListCellView *)self setAvatarView:0];
    }
  }
  else
  {
    v2 = [(MessageListCellView *)self avatarView];
    [(MessageListCellView *)self addSubview:v2];
    -[MessageListCellView _rectForAvatarWithBounds:](self, "_rectForAvatarWithBounds:", v50 + v55, v64, v65, v66);
    [v2 setFrame:];
    v67 = [(MessageListCellView *)self viewModel];
    if ([v67 style] == (id)2)
    {
      v68 = [(MessageListCellView *)self layoutValues];
      [v68 standardAvatarSize];
      double v70 = v69;
    }
    else
    {
      [v2 frame];
      double v70 = v145;
    }

    if (v70 > 0.0)
    {
      [(MessageListCellView *)self addSubview:v2];
      if ([(MessageListCellView *)self effectiveUserInterfaceLayoutDirection] == (id)1)
      {
        v146 = [(MessageListCellView *)self layoutValues];
        [v146 horizontalSpacing];
        double v148 = v147;

        double v149 = v162 + v70 + v148;
      }
      else
      {
        v150 = [(MessageListCellView *)self layoutValues];
        [v150 horizontalSpacing];
        double v152 = v151;

        double v50 = v50 + v70 + v152;
        double v63 = v55 + v50;
        double v149 = v162;
      }
      double v65 = v160 - (v50 + v149);
    }
    [(MessageListCellView *)self _updateAvatarView];
  }
  int v73 = _os_feature_enabled_impl();
  if (v73)
  {
    v2 = [v10 hintsBySnippetZone];
    v33 = [v2 objectForKeyedSubscript:EMMessageSnippetHintZoneTextContent];
    if ([v33 count])
    {

LABEL_57:
      [(MessageListCellView *)self _recalculateTertiaryAttributedStringShouldRehighlight:1];
      goto LABEL_58;
    }
  }
  if (_os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
  {
    unsigned int v74 = [(MessageListCellView *)self hasGeneratedSummary];
    if (!v73) {
      goto LABEL_53;
    }
LABEL_56:

    if ((v74 & 1) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  unsigned int v74 = 0;
  if (v73) {
    goto LABEL_56;
  }
LABEL_53:
  if (v74) {
    goto LABEL_57;
  }
LABEL_58:
  v75 = [(MessageListCellView *)self tertiaryLabel];
  v76 = [(MessageListCellView *)self attributedTertiaryString];
  [v75 setAttributedText:v76];

  v77 = [v75 text];
  unsigned int v78 = [v77 _isNaturallyRTL];

  if (v78) {
    uint64_t v79 = 2;
  }
  else {
    uint64_t v79 = 0;
  }
  [v75 setTextAlignment:v79];
  -[MessageListCellView _rectForSummaryWithBounds:](self, "_rectForSummaryWithBounds:", v63, v64, v65, v66);
  ((void (*)(void *, void *))v60[2])(v60, v75);
  if (EMBlackPearlIsFeatureEnabled())
  {
    v80 = [(MessageListCellView *)self categorizationStateLabel];
    v81 = [v10 categorizationState];
    [v80 setText:v81];

    if (v11) {
      sub_100136A74();
    }
    else {
    v82 = sub_100044274();
    }
    [v80 _setTextEncapsulation:v82];
  }
  v83 = [(MessageListCellView *)self primaryLabel];
  -[MessageListCellView _rectForAddressWithBounds:](self, "_rectForAddressWithBounds:", v63, v64, v65, v66);
  double v85 = v84;
  double v87 = v86;
  double v89 = v88;
  double v91 = v90;
  ((void (*)(void *, void *))v60[2])(v60, v83);
  double v154 = v85;
  double v155 = v87;
  double v156 = v89;
  double v157 = v91;
  -[MessageListCellView _rectForChevronWithBounds:addressRect:](self, "_rectForChevronWithBounds:addressRect:", v63, v64, v65, v66, v85, v87, v89, v91);
  double v93 = v92;
  double v95 = v94;
  double v97 = v96;
  double v99 = v98;
  if (self->_chevronType == 2)
  {
    [(MessageListCellView *)self _setupDisclosureButtonImageIfNecessary];
    v100 = [(MessageListCellView *)self disclosureButton];
    [(MessageListCellView *)self addSubview:v100];

    v101 = [(MessageListCellView *)self disclosureButton];
    [v101 setFrame:v93, v95, v97, v99];

    [(MessageListCellView *)self _layoutChevronForDisclosureStateAnimated:0];
  }
  else
  {
    v102 = [(MessageListCellView *)self disclosureButton];
    [v102 removeFromSuperview];
  }
  ((void (*)(void *, UIImageView *, double, double, double, double))v60[2])(v60, self->_chevron, v93, v95, v97, v99);
  -[MessageListCellView _rectForDateWithBounds:chevronRect:](self, "_rectForDateWithBounds:chevronRect:", v63, v64, v65, v66, v93, v95, v97, v99);
  double v161 = v104.n128_f64[0];
  double v163 = v103.n128_f64[0];
  double v158 = v106.n128_f64[0];
  double v159 = v105.n128_f64[0];
  ((void (*)(void *, void *, __n128, __n128, __n128, __n128))v60[2])(v60, v167, v103, v104, v105, v106);
  -[MessageListCellView _rectForSubjectWithBounds:](self, "_rectForSubjectWithBounds:", v63, v64, v65, v66);
  ((void (*)(void *, void *))v60[2])(v60, v165);
  -[MessageListCellView _rectForRecipientLabelWithBounds:](self, "_rectForRecipientLabelWithBounds:", v63, v64, v65, v66);
  ((void (*)(void *, void *))v60[2])(v60, v166);
  if (EMBlackPearlIsFeatureEnabled())
  {
    -[MessageListCellView _rectForCategoriesStackViewWithBounds:](self, "_rectForCategoriesStackViewWithBounds:", v63, v64, v65, v66);
    double v108 = v107;
    double v110 = v109;
    double v112 = v111;
    double v114 = v113;
    v115 = [(MessageListCellView *)self categoriesStackView];
    [v115 setFrame:v108, v110, v112, v114];
  }
  if (_os_feature_enabled_impl())
  {
    v116 = [v10 hintsBySnippetZone];
    v117 = [v116 objectForKeyedSubscript:EMMessageSnippetHintZoneSubject];
    BOOL v118 = [v117 count] == 0;

    if (!v118)
    {
      [(MessageListCellView *)self _recalculateSecondaryAttributedStringShouldRehighlight:1];
      v119 = [(MessageListCellView *)self layoutValues];
      int v120 = [v119 isSubjectVisible];
      v121 = [(MessageListCellView *)self attributedSecondaryString];
      v122 = [(MessageListCellView *)self accessibilitySecondaryLabel];
      sub_10003D6BC((uint64_t)self, v165, v120, v121, v122);
    }
  }
  v123 = [UIApp preferredContentSizeCategory];
  BOOL v124 = UIContentSizeCategoryIsAccessibilityCategory(v123);

  if (v124)
  {
    -[MessageListCellView _adjustRect:forTrailingRect:padding:](self, "_adjustRect:forTrailingRect:padding:", v154, v155, v156, v157, v93, v95, v97, v99, 0x4024000000000000);
    double v126 = v125;
    double v128 = v127;
    double v130 = v129;
    double v132 = v131;
  }
  else
  {
    v133 = [(MessageListCellView *)self layoutValues];
    [v133 horizontalSpacing];
    -[MessageListCellView _adjustRect:forTrailingRect:padding:](self, "_adjustRect:forTrailingRect:padding:", v154, v155, v156, v157, v163, v161, v159, v158, v134);
    double v126 = v135;
    double v128 = v136;
    double v130 = v137;
    double v132 = v138;
  }
  ((void (*)(void *, void *, double, double, double, double))v60[2])(v60, v83, v126, v128, v130, v132);
  v139.CGFloat width = NAN;
  v139.CGFloat height = NAN;
  v168.origin = (CGPoint)v139;
  v168.size = v139;
  [(MessageListCellView *)self _layoutStatusIndicatorViews];
  v177.origin.CGFloat x = CGRectZero.origin.x;
  v177.origin.CGFloat y = CGRectZero.origin.y;
  v177.size.CGFloat width = CGRectZero.size.width;
  v177.size.CGFloat height = CGRectZero.size.height;
  if (CGRectEqualToRect(v168, v177)) {
    goto LABEL_78;
  }
  v141 = [(MessageListCellView *)self secondaryLabel];
  unsigned int v142 = [(MessageListCellView *)self _isLabelValid:v141];

  if (v142)
  {
    if (IsAccessibilityCategory) {
      goto LABEL_78;
    }
    id v143 = [(MessageListCellView *)self secondaryLabel];
  }
  else
  {
    if (![(MessageListCellView *)self _isLabelValid:v75]) {
      goto LABEL_78;
    }
    id v143 = v75;
  }
  id v144 = v143;
  if (v143)
  {
    [v143 frame];
    -[MessageListCellView _adjustRect:forTrailingRect:padding:](self, "_adjustRect:forTrailingRect:padding:", 0x4030000000000000);
    ((void (*)(void *, id))v60[2])(v60, v144);
    v140 = v144;
    goto LABEL_79;
  }
LABEL_78:
  v140 = 0;
LABEL_79:
  [(MessageListCellView *)self mf_activateDebugModeIfEnabled];
}

- (MessageListCellLabel)primaryLabel
{
  primaryLabel = self->_primaryLabel;
  if (!primaryLabel)
  {
    id v4 = (MessageListCellLabel *)objc_alloc_init((Class)MessageListCellLabel);
    id v5 = self->_primaryLabel;
    self->_primaryLabel = v4;

    id v6 = +[UIColor clearColor];
    [(MessageListCellLabel *)self->_primaryLabel setBackgroundColor:v6];

    [(MessageListCellLabel *)self->_primaryLabel setAccessibilityIdentifier:MSAccessibilityIdentifierMailMessageCellViewAddressLabel];
    [(MessageListCellView *)self addSubview:self->_primaryLabel];
    primaryLabel = self->_primaryLabel;
  }

  return primaryLabel;
}

- (MessageListCellLayoutValues)layoutValues
{
  BOOL v3 = [(MessageListCellView *)self layoutValuesHelper];
  id v4 = [(MessageListCellView *)self viewModel];
  id v5 = [v3 layoutValuesForStyle:[v4 style]];

  return (MessageListCellLayoutValues *)v5;
}

- (MessageListCellViewModel)viewModel
{
  return self->_viewModel;
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (UIButton)disclosureButton
{
  disclosureButton = self->_disclosureButton;
  if (!disclosureButton)
  {
    id v4 = +[UIButton buttonWithType:0];
    id v5 = self->_disclosureButton;
    self->_disclosureButton = v4;

    id v6 = +[UIColor clearColor];
    [(UIButton *)self->_disclosureButton setBackgroundColor:v6];

    [(UIButton *)self->_disclosureButton setAccessibilityIdentifier:MSAccessibilityIdentifierMailMessageCellViewDisclosureButton];
    disclosureButton = self->_disclosureButton;
  }

  return disclosureButton;
}

- (int64_t)dateStyle
{
  return self->_dateStyle;
}

- (CGRect)_adjustRect:(CGRect)a3 forTrailingRect:(CGRect)a4 padding:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  double v11 = a3.origin.y;
  double v12 = a3.origin.x;
  if (CGRectGetWidth(a4) > 0.0)
  {
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    if (CGRectGetMinX(v27) > 0.0)
    {
      unsigned __int8 v14 = [(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout];
      double bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
      double left = UIEdgeInsetsZero.left;
      if (v14)
      {
        v28.origin.CGFloat x = x;
        v28.origin.CGFloat y = y;
        v28.size.CGFloat width = width;
        v28.size.CGFloat height = height;
        CGFloat v15 = CGRectGetMaxX(v28) + a5;
        v29.origin.CGFloat x = v12;
        v29.origin.CGFloat y = v11;
        v29.size.CGFloat width = v10;
        v29.size.CGFloat height = v9;
        CGFloat MinX = CGRectGetMinX(v29);
        double v17 = right;
        double v18 = left + v15 - MinX;
      }
      else
      {
        v30.origin.CGFloat x = v12;
        v30.origin.CGFloat y = v11;
        v30.size.CGFloat width = v10;
        v30.size.CGFloat height = v9;
        CGFloat v24 = CGRectGetMaxX(v30) + a5;
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        double v17 = right + v24 - CGRectGetMinX(v31);
        double v18 = left;
      }
      double v12 = v12 + v18;
      double v11 = v11 + UIEdgeInsetsZero.top;
      double v10 = v10 - (v17 + v18);
      double v9 = v9 - (UIEdgeInsetsZero.top + bottom);
    }
  }
  double v19 = v12;
  double v20 = v11;
  double v21 = v10;
  double v22 = v9;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (UIImageView)recipientLabelImageView
{
  recipientLabelImageView = self->_recipientLabelImageView;
  if (!recipientLabelImageView)
  {
    if (self->_recipientLabelType)
    {
      id v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
      id v5 = self->_recipientLabelImageView;
      self->_recipientLabelImageView = v4;

      [(UIImageView *)self->_recipientLabelImageView setAccessibilityIdentifier:MSAccessibilityIdentifierMailMessageCellViewRecipientImageView];
      [(MessageListCellView *)self addSubview:self->_recipientLabelImageView];
      recipientLabelImageView = self->_recipientLabelImageView;
    }
    else
    {
      recipientLabelImageView = 0;
    }
  }

  return recipientLabelImageView;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UILabel)dateLabel
{
  dateLabel = self->_dateLabel;
  if (!dateLabel)
  {
    [(MessageListCellView *)self _updateDateLabelWithDateStyle:[(MessageListCellView *)self dateStyle]];
    dateLabel = self->_dateLabel;
  }

  return dateLabel;
}

- (UIImageView)chevron
{
  chevron = self->_chevron;
  if (!chevron)
  {
    if (self->_chevronType)
    {
      id v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
      id v5 = self->_chevron;
      self->_chevron = v4;

      [(MessageListCellView *)self addSubview:self->_chevron];
      chevron = self->_chevron;
    }
    else
    {
      chevron = 0;
    }
  }

  return chevron;
}

- (UILabel)categorizationStateLabel
{
  categorizationStateLabel = self->_categorizationStateLabel;
  if (!categorizationStateLabel)
  {
    id v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    id v5 = self->_categorizationStateLabel;
    self->_categorizationStateLabel = v4;

    id v6 = [(MessageListCellView *)self categoriesStackView];
    [v6 insertArrangedSubview:self->_categorizationStateLabel atIndex:0];

    categorizationStateLabel = self->_categorizationStateLabel;
  }

  return categorizationStateLabel;
}

- (UIStackView)categoriesStackView
{
  categoriesStackView = self->_categoriesStackView;
  if (!categoriesStackView)
  {
    id v4 = +[UIStackView mf_baselineAlignedHorizontalStackView];
    id v5 = self->_categoriesStackView;
    self->_categoriesStackView = v4;

    [(UIStackView *)self->_categoriesStackView setSpacing:2.5];
    [(UIStackView *)self->_categoriesStackView setTranslatesAutoresizingMaskIntoConstraints:1];
    [(MessageListCellView *)self addSubview:self->_categoriesStackView];
    categoriesStackView = self->_categoriesStackView;
  }

  return categoriesStackView;
}

- (NSAttributedString)attributedTertiaryString
{
  return self->_attributedTertiaryString;
}

- (NSAttributedString)attributedSecondaryString
{
  return self->_attributedSecondaryString;
}

- (NSAttributedString)attributedPrimaryString
{
  return self->_attributedPrimaryString;
}

- (NSString)accessibilitySecondaryLabel
{
  return self->_accessibilitySecondaryLabel;
}

- (void)_updateDateLabelWithDateStyle:(int64_t)a3
{
  id v4 = (objc_class *)objc_opt_class();
  if (([(UILabel *)self->_dateLabel isMemberOfClass:v4] & 1) == 0)
  {
    [(MessageListCellView *)self _resetDateLabel];
    id v5 = (UILabel *)objc_alloc_init(v4);
    dateLabel = self->_dateLabel;
    self->_dateLabel = v5;

    uint64_t v7 = +[UIColor clearColor];
    [(UILabel *)self->_dateLabel setBackgroundColor:v7];

    [(UILabel *)self->_dateLabel setTextAlignment:2];
    id v8 = [(MessageListCellView *)self layoutValues];
    double v9 = [v8 dateFont];
    [(UILabel *)self->_dateLabel setFont:v9];

    [(UILabel *)self->_dateLabel setAccessibilityIdentifier:MSAccessibilityIdentifierMailMessageCellViewDateLabel];
    double v10 = self->_dateLabel;
    [(MessageListCellView *)self addSubview:v10];
  }
}

- (void)_resetDateLabel
{
  [(UILabel *)self->_dateLabel removeFromSuperview];
  dateLabel = self->_dateLabel;
  self->_dateLabel = 0;
}

- (CGRect)_rectForRecipientLabelWithBounds:(CGRect)a3
{
  int64_t recipientLabelType = self->_recipientLabelType;
  if (recipientLabelType)
  {
    CGFloat height = a3.size.height;
    CGFloat width = a3.size.width;
    CGFloat y = a3.origin.y;
    CGFloat x = a3.origin.x;
    double v9 = [(MessageListCellView *)self traitCollection];
    double v10 = sub_1001376A4(recipientLabelType, (uint64_t)[v9 userInterfaceStyle]);

    if (v10)
    {
      [v10 size];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      double v15 = x;
      if ([(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout])
      {
        v25.origin.CGFloat x = x;
        v25.origin.CGFloat y = y;
        v25.size.CGFloat width = width;
        v25.size.CGFloat height = height;
        double MaxX = CGRectGetMaxX(v25);
        [v10 size];
        double v15 = MaxX - v17;
      }
      double v18 = [(MessageListCellView *)self _baselineLabelForIndicator];
      [v18 frame];
      CGRectGetMinY(v26);
      [v18 _firstBaselineOffsetFromTop];
      v27.origin.CGFloat x = v15;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = v12;
      v27.size.CGFloat height = v14;
      CGRectGetHeight(v27);
      double v19 = [v18 font];
      [v19 capHeight];
      v28.origin.CGFloat x = v15;
      v28.origin.CGFloat y = y;
      v28.size.CGFloat width = v12;
      v28.size.CGFloat height = v14;
      CGRectGetHeight(v28);
    }
  }

  MFIntegralRectToViewScale();
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGRect)_rectForDateWithBounds:(CGRect)a3 chevronRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat y = a4.origin.y;
  CGFloat width = a4.size.width;
  CGFloat x = a4.origin.x;
  double v6 = a3.size.height;
  double v7 = a3.size.width;
  double v8 = a3.origin.y;
  double v9 = a3.origin.x;
  unsigned __int8 v11 = [(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout];
  CGFloat v12 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v12);

  -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", v7, v6);
  if (IsAccessibilityCategory)
  {
    -[MessageListCellView _dateOriginUnderSummary:](self, "_dateOriginUnderSummary:", v9, v8, v7, v6);
    if (v11)
    {
LABEL_3:
      v25.origin.CGFloat x = v9;
      v25.origin.CGFloat y = v8;
      v25.size.CGFloat width = v7;
      v25.size.CGFloat height = v6;
      CGRectGetMaxX(v25);
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  -[MessageListCellView _dateOriginAlignedWithAddressBaselineForBounds:](self, "_dateOriginAlignedWithAddressBaselineForBounds:", v9, v8, v7, v6);
  if (!self->_chevronType || [(MessageListCellView *)self isEditing] && self->_chevronType != 2)
  {
    if ((v11 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_10:
    v26.origin.CGFloat x = v9;
    v26.origin.CGFloat y = v8;
    v26.size.CGFloat width = v7;
    v26.size.CGFloat height = v6;
    CGRectGetMinX(v26);
    goto LABEL_12;
  }
  CGFloat v14 = x;
  CGFloat v15 = y;
  CGFloat v16 = width;
  CGFloat v17 = height;
  if (v11) {
    CGRectGetMaxX(*(CGRect *)&v14);
  }
  else {
    CGRectGetMinX(*(CGRect *)&v14);
  }
LABEL_12:

  MFIntegralRectToViewScale();
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (CGRect)_rectForChevronWithBounds:(CGRect)a3 addressRect:(CGRect)a4
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  if (self->_chevronType)
  {
    CGFloat height = a4.size.height;
    CGFloat width = a4.size.width;
    CGFloat v8 = a4.origin.y;
    CGFloat v9 = a4.origin.x;
    double v10 = a3.size.height;
    double v11 = a3.size.width;
    double v30 = a3.origin.x;
    double v27 = a3.origin.y;
    unsigned __int8 v13 = [(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout];
    double v28 = v8;
    double v29 = v9;
    if ([(MessageListCellView *)self swiped]
      || ![(MessageListCellView *)self isEditing]
      || (id)[(MessageListCellView *)self chevronType] == (id)2)
    {
      double v14 = width;
      double v15 = height;
    }
    else
    {
      double v22 = +[UIImage mf_imageForChevronType:2];
      double v23 = [(MessageListCellView *)self layoutValues];
      [v23 padding];
      double v26 = v24;

      [v22 size];
      if (v13) {
        double v30 = v30 - (v26 + v25);
      }
      else {
        double v11 = v11 + v26 + v25;
      }
      double v14 = width;
      double v15 = height;
    }
    [(MessageListCellView *)self _sizeForChevron];
    -[MessageListCellView _rectForChevronBoxWithBounds:addressRect:type:](self, "_rectForChevronBoxWithBounds:addressRect:type:", [(MessageListCellView *)self chevronType], v30, v27, v11, v10, v29, v28, v14, v15);
    UIRectCenteredIntegralRect();
    CGFloat x = v18;
    CGFloat y = v19;
  }
  else
  {
    double v16 = CGRectZero.size.width;
    double v17 = CGRectZero.size.height;
  }
  double v20 = x;
  double v21 = y;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGRect)_rectForChevronBoxWithBounds:(CGRect)a3 addressRect:(CGRect)a4 type:(int64_t)a5
{
  double width = a4.size.width;
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  double v9 = a3.origin.y;
  double v10 = a3.origin.x;
  [(MessageListCellView *)self _sizeForChevronWithType:a5];
  -[MessageListCellView _originForChevronBoxWithBounds:addressRect:sizeForChevron:](self, "_originForChevronBoxWithBounds:addressRect:sizeForChevron:", v10, v9, v8, v7, x, y, width, height, v12, v13);

  MFIntegralRectToViewScale();
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGSize)_sizeForChevronWithType:(int64_t)a3
{
  CGFloat width = CGSizeZero.width;
  CGFloat height = CGSizeZero.height;
  if (a3)
  {
    if (a3 == 3) {
      a3 = 2;
    }
    id v5 = +[UIImage mf_imageForChevronType:a3];
    double v6 = v5;
    if (v5)
    {
      [v5 size];
      CGFloat width = v7;
      CGFloat height = v8;
    }
  }
  double v9 = width;
  double v10 = height;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (BOOL)swiped
{
  return self->_swiped;
}

- (CGSize)_sizeForChevron
{
  [(MessageListCellView *)self _sizeForChevronWithType:self->_chevronType];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (CGRect)_rectForCategoriesStackViewWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  if (EMBlackPearlIsFeatureEnabled())
  {
    if ([(MessageListCellView *)self recipientLabelType])
    {
      double v8 = [(MessageListCellView *)self recipientLabelImageView];
      [v8 frame];
      double v10 = x + v9 + 2.5;
    }
    else
    {
      double v10 = x;
    }
    -[UIStackView systemLayoutSizeFittingSize:](self->_categoriesStackView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    double v16 = v15;
    CGFloat v18 = v17;
    if ([(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout])
    {
      v29.origin.double x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      double v10 = CGRectGetMaxX(v29) - v16;
    }
    double v19 = [(MessageListCellView *)self _baselineLabelForIndicator];
    [v19 frame];
    CGRectGetMinY(v30);
    [v19 _firstBaselineOffsetFromTop];
    v31.origin.double x = v10;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = v16;
    v31.size.CGFloat height = v18;
    CGRectGetHeight(v31);
    double v20 = [v19 font];
    [v20 capHeight];
    v32.origin.double x = v10;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = v16;
    v32.size.CGFloat height = v18;
    CGRectGetHeight(v32);

    MFIntegralRectToViewScale();
    CGFloat v11 = v21;
    CGFloat v12 = v22;
    CGFloat v13 = v23;
    CGFloat v14 = v24;
  }
  else
  {
    CGFloat v11 = CGRectZero.origin.x;
    CGFloat v12 = CGRectZero.origin.y;
    CGFloat v13 = CGRectZero.size.width;
    CGFloat v14 = CGRectZero.size.height;
  }
  double v25 = v11;
  double v26 = v12;
  double v27 = v13;
  double v28 = v14;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.double x = v25;
  return result;
}

- (int64_t)recipientLabelType
{
  return self->_recipientLabelType;
}

- (CGRect)_rectForAvatarWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (IsAccessibilityCategory) {
    goto LABEL_5;
  }
  double v10 = [(MessageListCellView *)self layoutValues];
  [v10 avatarSize];
  double v12 = v11;

  double v13 = -v12;
  if (v12 >= 0.0) {
    double v13 = v12;
  }
  if (v13 < 2.22044605e-16)
  {
LABEL_5:
    double v14 = CGRectZero.origin.x;
    double v15 = CGRectZero.origin.y;
    double v16 = CGRectZero.size.width;
    double v17 = CGRectZero.size.height;
  }
  else
  {
    UIRoundToViewScale();
    UIRoundToViewScale();
    [(MessageListCellView *)self numberOfPreviewLines];
    if ([(MessageListCellView *)self effectiveUserInterfaceLayoutDirection] == (id)1)
    {
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGRectGetMaxX(v21);
    }
    else
    {
      CGFloat v18 = [(MessageListCellView *)self viewModel];
      id v19 = [v18 style];

      if (v19 == (id)2)
      {
        double v20 = [(MessageListCellView *)self layoutValues];
        [v20 standardAvatarSize];
      }
    }
    MFIntegralRectToViewScale();
  }
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)_rectForAddressWithBounds:(CGRect)a3
{
  unsigned __int8 v4 = [(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout];
  id v5 = [(MessageListCellView *)self layoutValues];
  [v5 horizontalSpacing];

  UIRectInset();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  *(double *)&v43[2] = v10;
  double v44 = v12;
  double v14 = [(MessageListCellView *)self layoutValues];
  double v15 = [v14 addressFont];

  double v16 = [(MessageListCellView *)self layoutValues];
  [v16 addressCapHeight];
  double v18 = v9 + v17;

  [v15 mf_originPointFromBaselinePoint:v7, v18];
  v43[0] = v19;
  v43[1] = v20;
  if ([(MessageListCellView *)self isSenderSpecificCell])
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1001379D8;
    v41[3] = &unk_100609338;
    char v42 = v4 ^ 1;
    CGRect v21 = objc_retainBlock(v41);
    if ([(MessageListCellView *)self shouldShowCategorizationInformation])
    {
      -[MessageListCellView _rectForCategoriesStackViewWithBounds:](self, "_rectForCategoriesStackViewWithBounds:", v7, v9, v11, v13);
      if (v24 != 0.0)
      {
        CGFloat Width = CGRectGetWidth(*(CGRect *)&v22);
        ((void (*)(void *, void *, CGFloat))v21[2])(v21, v43, Width + 2.5);
      }
    }
    if ([(MessageListCellView *)self recipientLabelType])
    {
      -[MessageListCellView _rectForRecipientLabelWithBounds:](self, "_rectForRecipientLabelWithBounds:", v7, v9, v11, v13);
      CGFloat v27 = CGRectGetWidth(v45);
      ((void (*)(void *, void *, CGFloat))v21[2])(v21, v43, v27 + 2.5);
    }
  }
  [v15 lineHeight];
  [v15 descender];
  UIRoundToViewScale();
  double v44 = v28;
  MFIntegralRectToViewScale();
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  double v37 = v30;
  double v38 = v32;
  double v39 = v34;
  double v40 = v36;
  result.size.CGFloat height = v40;
  result.size.CGFloat width = v39;
  result.origin.CGFloat y = v38;
  result.origin.CGFloat x = v37;
  return result;
}

- (CGRect)_rectForSubjectWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(MessageListCellView *)self layoutValues];
  unsigned __int8 v9 = [v8 isSubjectVisible];

  if (v9)
  {
    unsigned int v10 = [(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout];
    double left = UIEdgeInsetsZero.left;
    if (self->_recipientLabelType)
    {
      -[MessageListCellView _rectForRecipientLabelWithBounds:](self, "_rectForRecipientLabelWithBounds:", x, y, width, height);
      double v12 = CGRectGetWidth(v36) + 2.5;
      if (v10) {
        double v12 = -0.0;
      }
      double left = left + v12;
    }
    if ([(MessageListCellView *)self shouldShowCategorizationInformation])
    {
      -[MessageListCellView _rectForCategoriesStackViewWithBounds:](self, "_rectForCategoriesStackViewWithBounds:", x, y, width, height);
      if (v15 != 0.0)
      {
        double v17 = CGRectGetWidth(*(CGRect *)&v13) + 2.5;
        if (v10) {
          double v17 = -0.0;
        }
        double left = left + v17;
      }
    }
    double v18 = [(MessageListCellView *)self layoutValues];
    [v18 addressAndSubjectHeight];
    double v20 = v19;

    CGRect v21 = [(MessageListCellView *)self layoutValues];
    uint64_t v22 = [v21 subjectFont];

    [v22 mf_originPointFromBaselinePoint:x + left, y + UIEdgeInsetsZero.top + v20];
    [v22 lineHeight];
    double v23 = [(MessageListCellView *)self layoutValues];
    [v23 subjectNumberOfLines];
    [v22 descender];
    UIRoundToViewScale();

    MFIntegralRectToViewScale();
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
  }
  else
  {
    CGFloat v25 = CGRectZero.origin.x;
    CGFloat v27 = CGRectZero.origin.y;
    CGFloat v29 = CGRectZero.size.width;
    CGFloat v31 = CGRectZero.size.height;
  }
  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (BOOL)shouldShowCategorizationInformation
{
  double v2 = [(MessageListCellView *)self viewModel];
  double v3 = [v2 categorizationState];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (CGRect)_rectForStatusIndicatorViewsWithPrimaryStatusIndicatorImage:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListCellView *)self layoutValues];
  double v6 = [v5 addressFont];
  [(MessageListCellLabel *)self->_primaryLabel frame];
  [v6 mf_baselinePointFromOriginPoint:];

  double v7 = [v5 addressFont];
  [v7 capHeight];

  [v4 size];
  UIRoundToViewScale();
  [(MessageListCellView *)self bounds];
  UIRectInset();
  double v9 = v8;
  double v11 = v10;
  [v5 padding];
  double v13 = v12;
  double v14 = 0.0;
  if ([(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout])
  {
    [(MessageListCellView *)self bounds];
    double v14 = CGRectGetMaxX(v19) - v13;
  }

  double v15 = v14;
  double v16 = v9;
  double v17 = v13;
  double v18 = v11;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGPoint)_originForChevronBoxWithBounds:(CGRect)a3 addressRect:(CGRect)a4 sizeForChevron:(CGSize)a5
{
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  double v12 = [(MessageListCellView *)self layoutValues];
  double v13 = [v12 addressFont];

  [v13 mf_baselinePointFromOriginPoint:x, y];
  double v15 = v14;
  double v16 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v16);

  if (IsAccessibilityCategory)
  {
    double v18 = v15 - v33;
  }
  else
  {
    CGRect v19 = [(MessageListCellView *)self layoutValues];
    double v20 = [v19 addressFont];
    [v20 capHeight];
    double v22 = v21;

    double v18 = v15 + v22 * -0.5 - v33 * 0.5;
  }
  unsigned __int8 v23 = [(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout];
  double v24 = [(MessageListCellView *)self traitCollection];
  unsigned int v25 = [v24 mf_useSplitViewStyling];

  if (v23)
  {
    v35.origin.double x = v10;
    v35.origin.double y = v9;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double v26 = CGRectGetMinX(v35) + v32 * 0.5 * -0.5;
  }
  else
  {
    v36.origin.double x = v10;
    v36.origin.double y = v9;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v36);
    if (v25) {
      double v28 = v32;
    }
    else {
      double v28 = v32 * 0.5;
    }
    double v26 = MaxX - v28;
  }
  double v29 = round(v26);

  double v30 = v29;
  double v31 = round(v18);
  result.double y = v31;
  result.double x = v30;
  return result;
}

- (void)_recalculateTertiaryAttributedString
{
}

- (void)_recalculateTertiaryAttributedStringShouldRehighlight:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MessageListCellView *)self summary];
  double v6 = v5;
  if (self->_attributedTertiaryString) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  double v12 = v5;
  if (!v7 || (id v8 = [v5 length], v6 = v12, v8) && v3)
  {
    CGFloat v9 = [(MessageListCellView *)self _formatTertiaryString:v6];
    CGFloat v10 = [(MessageListCellView *)self _highlightedSummarySnippet:v9];
    attributedTertiaryString = self->_attributedTertiaryString;
    self->_attributedTertiaryString = v10;

    double v6 = v12;
  }
}

- (CGRect)_rectForSummaryWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unsigned __int8 v8 = [(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout];
  CGFloat v9 = [(MessageListCellView *)self layoutValues];
  uint64_t v10 = (uint64_t)[v9 linesOfSummaryForCompactHeight:self->_compact];

  double v11 = [(MessageListCellView *)self summary];
  if (v10 >= 1)
  {
    double v12 = [(MessageListCellView *)self layoutValues];
    double v13 = [v12 summaryFont];

    double v14 = [(MessageListCellView *)self layoutValues];
    [v14 addressAndSubjectHeight];
    double v16 = v15;

    double v17 = [(MessageListCellView *)self layoutValues];
    [v17 bodyLeading];
    double v19 = v18;

    double v20 = [(MessageListCellView *)self viewModel];
    id v21 = [v20 style];

    double v22 = [UIApp preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v22);

    if (v21 != (id)2 && IsAccessibilityCategory)
    {
      unsigned int v25 = [(MessageListCellView *)self layoutValues];
      [(MessageListCellView *)self bounds];
      [v25 actualLineCountForSummary:v11];
    }
    [v13 mf_originPointFromBaselinePoint:x, y + v16 + v19];
    [v13 _bodyLeading];
    [v13 descender];
    UIRoundToViewScale();
    if (v21 == (id)2 && [(MessageListCellView *)self recipientLabelType])
    {
      -[MessageListCellView _rectForRecipientLabelWithBounds:](self, "_rectForRecipientLabelWithBounds:", x, y, width, height);
      CGFloat v26 = v43.origin.x;
      CGFloat v27 = v43.origin.y;
      CGFloat v28 = v43.size.width;
      CGFloat v29 = v43.size.height;
      CGRectGetWidth(v43);
      if (v8)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      int v30 = EMBlackPearlIsFeatureEnabled() ^ 1;
      if (v21 != (id)2) {
        LOBYTE(v30) = 1;
      }
      if (v30) {
        goto LABEL_17;
      }
      if (![(MessageListCellView *)self shouldShowCategorizationInformation]) {
        goto LABEL_17;
      }
      -[MessageListCellView _rectForCategoriesStackViewWithBounds:](self, "_rectForCategoriesStackViewWithBounds:", x, y, width, height);
      CGFloat v26 = v44.origin.x;
      CGFloat v27 = v44.origin.y;
      CGFloat v28 = v44.size.width;
      CGFloat v29 = v44.size.height;
      CGRectGetWidth(v44);
      if (v8) {
        goto LABEL_17;
      }
    }
    v45.origin.double x = v26;
    v45.origin.double y = v27;
    v45.size.double width = v28;
    v45.size.double height = v29;
    CGRectGetMaxX(v45);
    goto LABEL_17;
  }
LABEL_18:
  MFIntegralRectToViewScale();
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  double v39 = v32;
  double v40 = v34;
  double v41 = v36;
  double v42 = v38;
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.double y = v40;
  result.origin.double x = v39;
  return result;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)_recalculateAttributedStrings
{
  [(MessageListCellView *)self _recalculatePrimaryAttributedString];
  [(MessageListCellView *)self _recalculateSecondaryAttributedString];

  [(MessageListCellView *)self _recalculateTertiaryAttributedString];
}

- (void)_recalculateSecondaryAttributedString
{
}

- (void)_recalculateSecondaryAttributedStringShouldRehighlight:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MessageListCellView *)self viewModel];
  id v23 = [v5 subject];

  if (self->_attributedSecondaryString) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v23 == 0;
  }
  if (!v6 || [v23 length] && v3)
  {
    BOOL v7 = [(MessageListCellView *)self layoutValues];
    uint64_t v8 = [(MessageListCellView *)self contentConfiguration];
    CGFloat v9 = [v7 subjectColorForContentConfiguration:v8];

    uint64_t v10 = [(MessageListCellView *)self viewModel];
    LOBYTE(v8) = [v10 subjectIsPresent];

    if ((v8 & 1) == 0)
    {
      double v11 = [(MessageListCellView *)self layoutValues];
      double v12 = [(MessageListCellView *)self configurationState];
      double v13 = [(MessageListCellView *)self contentConfiguration];
      double v14 = [(MessageListCellView *)self backgroundConfiguration];
      uint64_t v15 = [v11 absentDataColorForConfigurationState:v12 contentConfiguration:v13 backgroundConfiguration:v14];

      CGFloat v9 = (void *)v15;
    }
    id v16 = objc_alloc((Class)NSAttributedString);
    double v17 = [(MessageListCellView *)self _secondaryStringAttributesWithColor:v9];
    id v18 = [v16 initWithString:v23 attributes:v17];

    double v19 = [v18 string];
    accessibilitySecondaryLabel = self->_accessibilitySecondaryLabel;
    self->_accessibilitySecondaryLabel = v19;

    id v21 = [(MessageListCellView *)self _highlightedSubject:v18];
    attributedSecondaryString = self->_attributedSecondaryString;
    self->_attributedSecondaryString = v21;
  }
}

- (id)_secondaryStringAttributesWithColor:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListCellView *)self layoutValues];
  BOOL v6 = [v5 subjectFont];
  BOOL v7 = [(MessageListCellView *)self _defaultAttributesWithFont:v6 color:v4];

  return v7;
}

- (void)_recalculatePrimaryAttributedString
{
}

- (void)_recalculatePrimaryAttributedStringShouldRehighlight:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MessageListCellView *)self _primaryLabelString];
  id v40 = v5;
  if (self->_attributedPrimaryString) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6 || [v5 length] && v3)
  {
    BOOL v7 = [(MessageListCellView *)self layoutValues];
    uint64_t v8 = [(MessageListCellView *)self contentConfiguration];
    CGFloat v9 = [v7 addressColorForContentConfiguration:v8];

    uint64_t v10 = [(MessageListCellView *)self layoutValues];
    double v11 = [(MessageListCellView *)self configurationState];
    double v12 = [(MessageListCellView *)self contentConfiguration];
    double v13 = [(MessageListCellView *)self backgroundConfiguration];
    double v14 = [v10 annotationColorForConfigurationState:v11 contentConfiguration:v12 backgroundConfiguration:v13];

    if (!self->_shouldAnnotateReplyOrForward || !self->_annotatedRelationshipType)
    {
      id v15 = v9;
      double v20 = [(MessageListCellView *)self viewModel];
      unsigned __int8 v21 = [v20 addressIsPresent];

      if ((v21 & 1) == 0)
      {
        double v22 = [(MessageListCellView *)self layoutValues];
        id v23 = [(MessageListCellView *)self configurationState];
        double v24 = [(MessageListCellView *)self contentConfiguration];
        unsigned int v25 = [(MessageListCellView *)self backgroundConfiguration];
        uint64_t v26 = [v22 absentDataColorForConfigurationState:v23 contentConfiguration:v24 backgroundConfiguration:v25];

        id v15 = (id)v26;
      }
      id v27 = objc_alloc((Class)NSAttributedString);
      CGFloat v28 = [(MessageListCellView *)self _addressAttributesWithColor:v15];
      id v29 = [v27 initWithString:v40 attributes:v28];

      int v30 = [(MessageListCellView *)self viewModel];
      double v31 = [v30 attributedAddress];

      if (v31)
      {
        id v16 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v31];
        double v32 = [(MessageListCellView *)self _addressAttributesWithColor:v15];
        [v16 addAttributes:v32 range:NSMakeRange(0, [v16 length])];
      }
      else
      {
        id v16 = v29;
      }
      double v33 = [(MessageListCellView *)self _highlightedPrimaryString:v16];
      attributedPrimaryString = self->_attributedPrimaryString;
      self->_attributedPrimaryString = v33;
      goto LABEL_24;
    }
    id v15 = [(MessageListCellView *)self _addressAttributesWithColor:v9];
    id v16 = [(MessageListCellView *)self _addressAttributesWithColor:v14];
    int64_t annotatedRelationshipType = self->_annotatedRelationshipType;
    switch(annotatedRelationshipType)
    {
      case 1:
        id v18 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"REPLY_ANNOTATION_FORMAT" value:&stru_100619928 table:@"Main"];
        break;
      case 2:
        id v18 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"DRAFT_ANNOTATION_FORMAT" value:&stru_100619928 table:@"Main"];
        break;
      case 3:
        id v18 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"FORWARD_ANNOTATION_FORMAT" value:&stru_100619928 table:@"Main"];
        break;
      default:
        goto LABEL_25;
    }
    double v31 = (void *)v19;

    if (v31)
    {
      attributedPrimaryString = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v40);
      id v35 = [objc_alloc((Class)NSMutableAttributedString) initWithString:attributedPrimaryString attributes:v16];
      id v36 = [attributedPrimaryString rangeOfString:v40];
      [v35 setAttributes:v15 range:v36];
      double v38 = [(MessageListCellView *)self _highlightedPrimaryString:v35];
      double v39 = self->_attributedPrimaryString;
      self->_attributedPrimaryString = v38;

LABEL_24:
    }
LABEL_25:
  }
}

- (UIListContentConfiguration)contentConfiguration
{
  return self->_contentConfiguration;
}

- (id)_primaryLabelString
{
  unsigned int v3 = [(MessageListCellView *)self isSenderSpecificCell];
  id v4 = [(MessageListCellView *)self viewModel];
  id v5 = v4;
  if (v3) {
    [v4 subject];
  }
  else {
  BOOL v6 = [v4 address];
  }

  return v6;
}

- (LayoutStatusIndicatorInfo)_layoutStatusIndicatorViews
{
  id v4 = [(MessageListCellView *)self layoutValues];
  [v4 padding];

  [(MessageListCellView *)self chevronType];
  [(MessageListCellView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(MessageListCellView *)self mf_prefersRightToLeftInterfaceLayout];
  MFEdgeInsetsFromDirectionalEdgeInsets();
  double v14 = v6 + v13;
  double v16 = v8 + v15;
  double v18 = v10 - (v13 + v17);
  double v20 = v12 - (v15 + v19);
  [(MessageListCellLabel *)self->_primaryLabel frame];
  -[MessageListCellView _rectForChevronBoxWithBounds:addressRect:type:](self, "_rectForChevronBoxWithBounds:addressRect:type:", 2, v14, v16, v18, v20, v21, v22, v23, v24);

  return [(MessageListCellView *)self _layoutStatusIndicatorViewsWithChevronRect:"_layoutStatusIndicatorViewsWithChevronRect:"];
}

- (int64_t)chevronType
{
  return self->_chevronType;
}

- (LayoutStatusIndicatorInfo)_layoutStatusIndicatorViewsWithChevronRect:(SEL)a3
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = [(MessageListCellView *)self viewModel];
  unsigned int v10 = [v9 isVIP];
  unsigned int v11 = [(MessageListCellView *)self isRead];
  unsigned int v12 = [v9 isReplied];
  unsigned int v13 = [v9 isForwarded];
  if (v9) {
    int v14 = v11;
  }
  else {
    int v14 = 1;
  }
  uint64_t v15 = v10;
  uint64_t v16 = 1;
  if (v10) {
    uint64_t v16 = 2;
  }
  if (!v14) {
    uint64_t v15 = v16;
  }
  uint64_t v76 = v15;
  unsigned int v17 = [v9 isBlockedSender];
  unsigned int v18 = [(MessageListCellView *)self isNotify];
  uint64_t v19 = 2;
  if (!v10) {
    uint64_t v19 = 0;
  }
  uint64_t v20 = v19 | v14 ^ 1u;
  if (v12) {
    v20 |= 8uLL;
  }
  if (v13) {
    v20 |= 0x10uLL;
  }
  if (v17) {
    v20 |= 0x100uLL;
  }
  if (v18) {
    uint64_t v21 = v20 | 0x40;
  }
  else {
    uint64_t v21 = v20;
  }
  if ([(MessageListCellView *)self isReadLater])
  {
    if (!_os_feature_enabled_impl()
      || ([(MessageListCellView *)self readLaterDate],
          double v22 = objc_claimAutoreleasedReturnValue(),
          [v9 displayDate],
          double v23 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v24 = [(MessageListCellView *)self _hasPastReminderForReadLaterDate:v22 displayDate:v23], v23, v22, (v24 & 1) == 0))
    {
      v21 |= 0x200uLL;
    }
  }
  unsigned int v25 = [(MessageListCellView *)self isMute];
  unsigned int v26 = [v9 hasAttachments];
  unsigned int v27 = [(MessageListCellView *)self isFlagged];
  uint64_t v28 = v21 | 0x80;
  if (!v25) {
    uint64_t v28 = v21;
  }
  if (v26) {
    v28 |= 0x20uLL;
  }
  if (v27) {
    uint64_t v29 = v28 | 4;
  }
  else {
    uint64_t v29 = v28;
  }
  int v30 = [(MessageListCellView *)self category];
  v77 = v9;
  unsigned int v78 = v30;
  if ([v30 isHighImpact]
    && [(MessageListCellView *)self shouldShowHighImpact])
  {
    id v31 = [v30 type];
    uint64_t v32 = v29 | 0x1000;
    uint64_t v33 = v29 | 0x800;
    if (v31 != (id)3) {
      uint64_t v33 = v29;
    }
    if (v31 != (id)2) {
      uint64_t v32 = v33;
    }
    if (v31 == (id)1) {
      v29 |= 0x400uLL;
    }
    else {
      uint64_t v29 = v32;
    }
  }
  uint64_t v79 = [(MessageListCellView *)self statusIndicatorManager];
  double v34 = [(MessageListCellView *)self flagColors];
  [v79 setFlagColors:v34];

  [v79 setIndicatorOptions:v29];
  id v35 = [(MessageListCellView *)self layoutValues];
  id v36 = [(MessageListCellView *)self configurationState];
  uint64_t v37 = [(MessageListCellView *)self backgroundConfiguration];
  [v79 setUseSelectedColors:[v35 useSelectedColorForConfigurationState:v36 backgroundConfiguration:v37]];

  v75 = [v79 primaryStatusIndicatorImage];
  [(MessageListCellView *)self _rectForStatusIndicatorViewsWithPrimaryStatusIndicatorImage:v75];
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v46 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v46);

  double v48 = +[NSMutableArray arrayWithCapacity:3];
  if (!EMBlackPearlIsFeatureEnabled()
    || [(MessageListCellView *)self hideMessageListAvatar]
    || ([UIApp preferredContentSizeCategory],
        double v49 = (NSString *)objc_claimAutoreleasedReturnValue(),
        BOOL v50 = UIContentSizeCategoryIsAccessibilityCategory(v49),
        v49,
        v50))
  {
    double v51 = 0;
    int v52 = 0;
  }
  else
  {
    double v51 = +[NSMutableArray arrayWithCapacity:3];
    int v52 = 1;
  }
  uint64_t v53 = 0;
  uint64_t v54 = v76 + v12 + v13;
  do
  {
    id v81 = 0;
    double v55 = [(MessageListCellView *)self _labelForVerticalPosition:v53 font:&v81];
    id v56 = v81;
    double v57 = v56;
    if (v55 && v56)
    {
      double v58 = [(MessageListCellView *)self _statusIndicatorVeritcalPositionForLabel:v55 font:v56 shouldAlignWithCenter:IsAccessibilityCategory];
      [v48 addObject:v58];
    }
    if (v52)
    {
      double v59 = [(MessageListCellView *)self _statusIndicatorVerticalPositionAvatarForItem:v53 verticalIndicatorCount:v54];
      [v51 addObject:v59];
    }
    ++v53;
  }
  while (v53 != 3);
  v82.origin.CGFloat x = x;
  v82.origin.CGFloat y = y;
  v82.size.CGFloat width = width;
  v82.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v82);
  double v61 = 0.0;
  if ((unint64_t)[v48 count] >= 2)
  {
    BOOL v62 = [v48 objectAtIndex:1];
    [v62 floatValue];
    double v61 = v63;
  }
  double v64 = [UIApp preferredContentSizeCategory];
  BOOL v65 = UIContentSizeCategoryIsAccessibilityCategory(v64);

  if (v65)
  {
    id v80 = 0;
    double v66 = [(MessageListCellView *)self _labelForVerticalPosition:3 font:&v80];
    id v67 = v80;
    v68 = [(MessageListCellView *)self _statusIndicatorVeritcalPositionForLabel:v66 font:v67 shouldAlignWithCenter:IsAccessibilityCategory];
    [v68 floatValue];
    float v70 = v69;
    double v71 = v69;

    if (v70 > 0.0) {
      double v61 = v71;
    }
  }
  v72.CGFloat width = NAN;
  v72.CGFloat height = NAN;
  retstr->var0.origin = (CGPoint)v72;
  retstr->var0.size = v72;
  retstr->var1 = 0xAAAAAAAAAAAAAAAALL;
  if (v79)
  {
    [v79 layoutStatusIndicatorViewsInRect:self contentView:v48 verticalPositions:v51 avatarVerticalPostions:IsAccessibilityCategory horizontalPoint:v39 verticalPoint:v41 horizontalPoint:v43 verticalPoint:v45 horizontalPoint:MidX];
  }
  else
  {
    retstr->var1 = 0;
    retstr->var0.origin = 0u;
    retstr->var0.size = 0u;
  }

  return result;
}

- (UICellConfigurationState)configurationState
{
  return self->_configurationState;
}

- (UIBackgroundConfiguration)backgroundConfiguration
{
  return self->_backgroundConfiguration;
}

- (id)_statusIndicatorVerticalPositionAvatarForItem:(unint64_t)a3 verticalIndicatorCount:(int64_t)a4
{
  double v6 = [(MessageListCellView *)self avatarView];
  double v7 = v6;
  if (a4 == 1) {
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    [v6 frame];
    double MaxY = CGRectGetMaxY(v16);
    goto LABEL_8;
  }
  if (a3 == 1)
  {
LABEL_7:
    [v6 frame];
    double v10 = v9;
    [v7 frame];
    double MaxY = v10 + v11 * 0.5;
  }
  else
  {
    double MaxY = 0.0;
    if (!a3)
    {
      [v6 frame];
      double MaxY = CGRectGetMinY(v15);
    }
  }
LABEL_8:
  unsigned int v12 = +[NSNumber numberWithDouble:MaxY];

  return v12;
}

- (id)_statusIndicatorVeritcalPositionForLabel:(id)a3 font:(id)a4 shouldAlignWithCenter:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  double v10 = &off_10062AA28;
  if (v7 && v8)
  {
    [v7 frame];
    if (v5)
    {
      CGRectGetMinY(*(CGRect *)&v11);
      [v7 _firstBaselineOffsetFromTop];
      [v9 capHeight];
      UIRoundToViewScale();
      double v16 = v15;
    }
    else
    {
      [v9 mf_baselinePointFromOriginPoint:];
      double v16 = 0.0;
    }
    UIRoundToViewScale();
    double v18 = v17 - v16;
    *(float *)&double v18 = v18;
    double v10 = +[NSNumber numberWithFloat:v18];
  }

  return v10;
}

- (id)_labelForVerticalPosition:(unint64_t)a3 font:(id *)a4
{
  id v7 = [(MessageListCellView *)self layoutValues];
  id v8 = [(MessageListCellView *)self secondaryLabel];
  double v9 = [(MessageListCellView *)self tertiaryLabel];
  double v10 = [v7 subjectFont];
  uint64_t v11 = [v7 summaryFont];
  uint64_t v28 = a4;
  unsigned int v12 = [(MessageListCellView *)self _isLabelValid:v8];
  if (v12) {
    unsigned int v13 = v8;
  }
  else {
    unsigned int v13 = v9;
  }
  if (v12) {
    int v14 = v10;
  }
  else {
    int v14 = v11;
  }
  if (v12) {
    double v15 = v9;
  }
  else {
    double v15 = v8;
  }
  if (v12) {
    double v16 = v11;
  }
  else {
    double v16 = v10;
  }
  id v30 = v13;
  id v29 = v14;
  id v17 = v15;
  id v18 = v16;
  if (![(MessageListCellView *)self _isLabelValid:v17])
  {

    id v17 = 0;
    id v18 = 0;
  }
  switch(a3)
  {
    case 0uLL:
      id v19 = [(MessageListCellView *)self primaryLabel];
      if (v28)
      {
        *uint64_t v28 = [v7 addressFont];
      }
      break;
    case 1uLL:
      id v19 = v30;
      uint64_t v20 = v28;
      if (v28)
      {
        uint64_t v21 = v29;
        goto LABEL_22;
      }
      break;
    case 2uLL:
      id v19 = v17;
      uint64_t v20 = v28;
      if (v28)
      {
        uint64_t v21 = v18;
LABEL_22:
        *uint64_t v20 = v21;
      }
      break;
    case 3uLL:
      double v22 = [UIApp preferredContentSizeCategory];
      IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v22);

      if (!IsAccessibilityCategory) {
        goto LABEL_30;
      }
      unsigned __int8 v24 = [(MessageListCellView *)self dateLabel];
      if (![(MessageListCellView *)self _isLabelValid:v24])
      {

        goto LABEL_30;
      }
      uint64_t v25 = [(MessageListCellView *)self dateLabel];

      if (v28 && v25)
      {
        *uint64_t v28 = [v7 dateFont];
      }
      id v19 = (id)v25;
      break;
    default:
LABEL_30:
      id v19 = 0;
      break;
  }
  id v26 = v19;

  return v26;
}

- (BOOL)_isLabelValid:(id)a3
{
  id v3 = a3;
  [v3 alpha];
  if (v4 <= 0.0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    [v3 frame];
    v8.origin.CGFloat x = CGRectZero.origin.x;
    v8.origin.CGFloat y = CGRectZero.origin.y;
    v8.size.CGFloat width = CGRectZero.size.width;
    v8.size.CGFloat height = CGRectZero.size.height;
    BOOL v5 = !CGRectEqualToRect(v7, v8);
  }

  return v5;
}

- (MessageListCellLabel)secondaryLabel
{
  secondaryLabel = self->_secondaryLabel;
  if (!secondaryLabel)
  {
    double v4 = (MessageListCellLabel *)objc_alloc_init((Class)MessageListCellLabel);
    BOOL v5 = self->_secondaryLabel;
    self->_secondaryLabel = v4;

    double v6 = +[UIColor clearColor];
    [(MessageListCellLabel *)self->_secondaryLabel setBackgroundColor:v6];

    CGRect v7 = [(MessageListCellView *)self layoutValues];
    -[MessageListCellLabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", [v7 subjectNumberOfLines]);

    [(MessageListCellLabel *)self->_secondaryLabel setAccessibilityIdentifier:MSAccessibilityIdentifierMailMessageCellViewSubjectLabel];
    [(MessageListCellView *)self addSubview:self->_secondaryLabel];
    secondaryLabel = self->_secondaryLabel;
  }

  return secondaryLabel;
}

- (MessageListCellLabel)tertiaryLabel
{
  id v3 = [(MessageListCellView *)self layoutValues];
  uint64_t v4 = (uint64_t)[v3 linesOfSummaryForCompactHeight:self->_compact];

  tertiaryLabel = self->_tertiaryLabel;
  if (tertiaryLabel) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 < 1;
  }
  if (v6)
  {
    if (v4) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    [(MessageListCellLabel *)tertiaryLabel mf_setAlpha:v7];
  }
  else
  {
    CGRect v8 = (MessageListCellLabel *)objc_alloc_init((Class)MessageListCellLabel);
    double v9 = self->_tertiaryLabel;
    self->_tertiaryLabel = v8;

    double v10 = +[UIColor clearColor];
    [(MessageListCellLabel *)self->_tertiaryLabel setBackgroundColor:v10];

    [(MessageListCellLabel *)self->_tertiaryLabel setAccessibilityIdentifier:MSAccessibilityIdentifierMailMessageCellViewSummaryLabel];
    [(MessageListCellView *)self addSubview:self->_tertiaryLabel];
  }
  uint64_t v11 = self->_tertiaryLabel;

  return v11;
}

- (MessageListStatusIndicatorManager)statusIndicatorManager
{
  statusIndicatorManager = self->_statusIndicatorManager;
  if (!statusIndicatorManager)
  {
    uint64_t v4 = objc_alloc_init(MessageListStatusIndicatorManager);
    BOOL v5 = self->_statusIndicatorManager;
    self->_statusIndicatorManager = v4;

    statusIndicatorManager = self->_statusIndicatorManager;
  }

  return statusIndicatorManager;
}

- (BOOL)hideMessageListAvatar
{
  return self->_hideMessageListAvatar;
}

- (void)_updateAvatarView
{
  id v7 = [(MessageListCellView *)self avatarResult];
  id v3 = [(MessageListCellView *)self avatarView];
  uint64_t v4 = [v3 traitCollection];
  id v5 = [v7 needsBorderFor:[v4 userInterfaceStyle]];

  id v8 = [(MessageListCellView *)self avatarView];
  BOOL v6 = [(MessageListCellView *)self layoutValues];
  [v6 avatarSize];
  +[MUIAvatarImageGenerator roundAvatarView:withBorder:size:](MUIAvatarImageGenerator, "roundAvatarView:withBorder:size:", v8, v5);
}

- (UIImageView)avatarView
{
  avatarView = self->_avatarView;
  if (!avatarView)
  {
    uint64_t v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    id v5 = self->_avatarView;
    self->_avatarView = v4;

    avatarView = self->_avatarView;
  }

  return avatarView;
}

- (EMCategory)category
{
  return self->_category;
}

- (BOOL)isRead
{
  return self->_read;
}

- (BOOL)isReadLater
{
  return self->_isReadLater;
}

- (BOOL)isNotify
{
  return self->_notify;
}

- (BOOL)isMute
{
  return self->_mute;
}

- (BOOL)isFlagged
{
  return self->_flagged;
}

- (NSIndexSet)flagColors
{
  return self->_flagColors;
}

- (void)_layoutDisclosureButton
{
  disclosureButton = self->_disclosureButton;
  id v3 = +[UIImage mf_symbolConfigurationForView:10];
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](disclosureButton, "setPreferredSymbolConfiguration:forImageInState:");
}

- (id)_highlightedSummarySnippet:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListCellView *)self viewModel];
  BOOL v6 = [v5 hintsBySnippetZone];
  id v7 = [v6 objectForKeyedSubscript:EMMessageSnippetHintZoneTextContent];

  if (_os_feature_enabled_impl() && [v7 count])
  {
    id v8 = +[MessageListCellView log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      +[EFPrivacy partiallyRedactedStringFromArray:v7];
      objc_claimAutoreleasedReturnValue();
      [v4 string];
      objc_claimAutoreleasedReturnValue();
      sub_10045B4DC();
    }

    double v9 = sub_100137764(self);
    id v10 = +[MUISnippetGenerator highlightedSnippetUsingTokens:v7 attributedString:v4 maxNumberOfWordsBeforeOrAfterToken:2 maxNumberOfRanges:2 highlighting:v9 error:0];
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

- (id)_highlightedSubject:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListCellView *)self viewModel];
  BOOL v6 = [v5 hintsBySnippetZone];
  id v7 = [v6 objectForKeyedSubscript:EMMessageSnippetHintZoneSubject];

  if (_os_feature_enabled_impl() && [v7 count])
  {
    id v8 = +[MessageListCellView log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      +[EFPrivacy partiallyRedactedStringFromArray:v7];
      objc_claimAutoreleasedReturnValue();
      [v4 string];
      objc_claimAutoreleasedReturnValue();
      sub_10045B4DC();
    }

    double v9 = [(MessageListCellView *)self secondaryLabel];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    id v18 = sub_100137764(self);
    +[MUISnippetGenerator highlightedSnippetUsingTokens:attributedString:frame:highlighting:error:](MUISnippetGenerator, "highlightedSnippetUsingTokens:attributedString:frame:highlighting:error:", v7, v4, v18, 0, v11, v13, v15, v17);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = v4;
  }

  return v19;
}

- (id)_highlightedPrimaryString:(id)a3
{
  id v4 = a3;
  if ([(MessageListCellView *)self isSenderSpecificCell]) {
    [(MessageListCellView *)self _highlightedSubject:v4];
  }
  else {
  id v5 = [(MessageListCellView *)self _highlightedSender:v4];
  }

  return v5;
}

- (id)_highlightedSender:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListCellView *)self viewModel];
  BOOL v6 = [v5 hintsBySnippetZone];
  id v7 = [v6 objectForKeyedSubscript:EMMessageSnippetHintZoneAuthor];

  id v8 = [(MessageListCellView *)self viewModel];
  double v9 = [v8 hintsBySnippetZone];
  double v10 = [v9 objectForKeyedSubscript:EMMessageSnippetHintZoneAuthorEmailAddresses];

  if (_os_feature_enabled_impl() && ([v7 count] || objc_msgSend(v10, "count")))
  {
    double v11 = +[MessageListCellView log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v15 = +[EFPrivacy partiallyRedactedStringFromArray:v7];
      double v16 = +[EFPrivacy partiallyRedactedStringFromArray:v10];
      double v17 = [v4 string];
      int v18 = 138412802;
      id v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      double v23 = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[Snippet Hints] Highlighting: %@ and %@ in %@", (uint8_t *)&v18, 0x20u);
    }
    double v12 = sub_100137764(self);
    id v13 = +[MUISnippetGenerator highlightingAuthorTokens:v7 authorEmailTokens:v10 inEmailAttributedString:v4 highlighting:v12 error:0];
  }
  else
  {
    id v13 = v4;
  }

  return v13;
}

- (id)_formatTertiaryString:(id)a3
{
  id v27 = a3;
  id v4 = [(MessageListCellView *)self layoutValues];
  id v5 = [(MessageListCellView *)self configurationState];
  BOOL v6 = [(MessageListCellView *)self contentConfiguration];
  id v7 = [(MessageListCellView *)self backgroundConfiguration];
  id v8 = [v4 summaryColorForConfigurationState:v5 contentConfiguration:v6 backgroundConfiguration:v7];

  LODWORD(v6) = [(MessageListCellView *)self hasGeneratedSummary];
  double v9 = objc_opt_new();
  double v10 = [(MessageListCellView *)self _bodyAttributesWithColor:v8];
  if (v6)
  {
    id v11 = objc_alloc_init((Class)NSTextAttachment);
    [(MessageListCellView *)self setSummarySymbolTextAttachment:v11];

    double v12 = [(MessageListCellView *)self layoutValues];
    id v13 = [v12 summarySymbolFont];
    double v14 = +[UIImage mf_imageForSummarySymbolWithFont:v13];
    id v15 = [(MessageListCellView *)self summarySymbolTextAttachment];
    [v15 setImage:v14];

    double v16 = [(MessageListCellView *)self layoutValues];
    double v17 = [(MessageListCellView *)self configurationState];
    int v18 = [(MessageListCellView *)self contentConfiguration];
    id v19 = [(MessageListCellView *)self backgroundConfiguration];
    __int16 v20 = [v16 summarySymbolColorForConfigurationState:v17 contentConfiguration:v18 backgroundConfiguration:v19];

    uint64_t v21 = [(MessageListCellView *)self summarySymbolTextAttachment];
    NSAttributedStringKey v28 = NSForegroundColorAttributeName;
    id v29 = v20;
    __int16 v22 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    double v23 = +[NSAttributedString attributedStringWithAttachment:v21 attributes:v22];
    [v9 appendAttributedString:v23];

    id v24 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
    [v9 appendAttributedString:v24];
  }
  id v25 = [objc_alloc((Class)NSAttributedString) initWithString:v27 attributes:v10];
  [v9 appendAttributedString:v25];

  return v9;
}

- (BOOL)hasGeneratedSummary
{
  return self->_hasGeneratedSummary;
}

- (CGPoint)_dateOriginAlignedWithAddressBaselineForBounds:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v6 = [(MessageListCellView *)self layoutValues];
  [v6 addressCapHeight];
  double v8 = v7;

  double v9 = [(MessageListCellView *)self layoutValues];
  double v10 = [v9 dateFont];

  [v10 mf_originPointFromBaselinePoint:x, y + v8];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (id)_bodyAttributesWithColor:(id)a3
{
  id v4 = a3;
  id v5 = +[NSParagraphStyle defaultParagraphStyle];
  id v6 = [v5 mutableCopy];

  double v7 = [(MessageListCellView *)self layoutValues];
  double v8 = [v7 summaryFont];

  double v9 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (IsAccessibilityCategory)
  {
    LODWORD(v11) = 1.0;
    [v6 setHyphenationFactor:v11];
  }
  v14[0] = NSFontAttributeName;
  v14[1] = NSParagraphStyleAttributeName;
  v15[0] = v8;
  v15[1] = v6;
  v14[2] = NSForegroundColorAttributeName;
  v15[2] = v4;
  double v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (id)_defaultAttributesWithFont:(id)a3 color:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = +[NSParagraphStyle defaultParagraphStyle];
  id v8 = [v7 mutableCopy];

  [v8 setLineBreakMode:4];
  v11[0] = NSFontAttributeName;
  v11[1] = NSParagraphStyleAttributeName;
  v12[0] = v5;
  v12[1] = v8;
  v11[2] = NSForegroundColorAttributeName;
  v12[2] = v6;
  double v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (id)_baselineLabelForIndicator
{
  if ([(MessageListCellView *)self isSenderSpecificCell])
  {
    id v3 = &OBJC_IVAR___MessageListCellView__primaryLabel;
  }
  else
  {
    id v4 = [(MessageListCellView *)self viewModel];
    id v5 = [v4 style];

    id v3 = &OBJC_IVAR___MessageListCellView__secondaryLabel;
    if (v5 == (id)2) {
      id v3 = &OBJC_IVAR___MessageListCellView__tertiaryLabel;
    }
  }
  id v6 = *(id *)((char *)&self->super.super.super.isa + *v3);

  return v6;
}

- (BOOL)isSenderSpecificCell
{
  return self->_senderSpecificCell;
}

- (id)_addressAttributesWithColor:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListCellView *)self layoutValues];
  id v6 = [v5 addressFont];
  double v7 = [(MessageListCellView *)self _defaultAttributesWithFont:v6 color:v4];

  return v7;
}

- (void)setViewModel:(id)a3
{
  id v5 = (MessageListCellViewModel *)a3;
  if (self->_viewModel != v5)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    attributedPrimaryString = self->_attributedPrimaryString;
    self->_attributedPrimaryString = 0;

    attributedSecondaryString = self->_attributedSecondaryString;
    self->_attributedSecondaryString = 0;

    accessibilitySecondaryLabel = self->_accessibilitySecondaryLabel;
    self->_accessibilitySecondaryLabel = 0;

    attributedTertiaryString = self->_attributedTertiaryString;
    self->_attributedTertiaryString = 0;

    double v10 = [(MessageListCellViewModel *)v5 readLaterDate];
    [(MessageListCellView *)self setRead:[(MessageListCellViewModel *)v5 isRead]];
    [(MessageListCellView *)self setFlagged:[(MessageListCellViewModel *)v5 isFlagged]];
    double v11 = [(MessageListCellViewModel *)v5 flagColors];
    [(MessageListCellView *)self setFlagColors:v11];

    [(MessageListCellView *)self setNotify:[(MessageListCellViewModel *)v5 isNotify]];
    [(MessageListCellView *)self setMute:[(MessageListCellViewModel *)v5 isMute]];
    [(MessageListCellView *)self setReadLaterDate:v10];
    [(MessageListCellView *)self setIsReadLater:v10 != 0];
    id v12 = [(MessageListCellViewModel *)v5 recipientType];
    uint64_t v13 = 3;
    if (v12 != (id)2) {
      uint64_t v13 = 0;
    }
    if (v12 == (id)1) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = v13;
    }
    [(MessageListCellView *)self setRecipientLabelType:v14];
    double v15 = [(MessageListCellViewModel *)v5 sendLaterDate];

    if (v15)
    {
      uint64_t v16 = 1;
    }
    else if (v10)
    {
      double v17 = [(MessageListCellView *)self readLaterDate];
      int v18 = [(MessageListCellViewModel *)v5 displayDate];
      unsigned int v19 = [(MessageListCellView *)self _hasPastReminderForReadLaterDate:v17 displayDate:v18];

      if (v19) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = 1;
      }
    }
    else
    {
      __int16 v20 = [(MessageListCellViewModel *)v5 followUp];
      if ([v20 isActive])
      {
        unsigned int v21 = [(MessageListCellViewModel *)v5 hideFollowUp];

        if (v21) {
          uint64_t v16 = 0;
        }
        else {
          uint64_t v16 = 3;
        }
      }
      else
      {

        uint64_t v16 = 0;
      }
    }
    [(MessageListCellView *)self setDateStyle:v16];
    [(MessageListCellView *)self _updateDateLabelWithDateStyle:v16];
    [(MessageListCellView *)self setNeedsLayout];
    if (EMBlackPearlIsFeatureEnabled()
      && ![(MessageListCellView *)self hideMessageListAvatar])
    {
      __int16 v22 = [(MessageListCellViewModel *)v5 addressList];
      id v36 = [v22 firstObject];

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      id v23 = objc_alloc((Class)MUIAvatarImageContext);
      id v35 = [(MessageListCellView *)self category];
      double v34 = [(MessageListCellViewModel *)v5 avatarContext];
      id v24 = [v34 businessLogoID];
      id v25 = [(MessageListCellViewModel *)v5 avatarContext];
      id v26 = [v25 isAuthenticated];
      id v27 = [(MessageListCellView *)self contactStore];
      NSAttributedStringKey v28 = [(MessageListCellViewModel *)v5 avatarContext];
      id v29 = [v28 brandIndicatorFuture];
      id v33 = [v23 initWithCategory:v35 emailAddress:v36 businessLogoID:v24 isAuthenticated:v26 contactStore:v27 brandIndicatorFuture:v29];

      id v30 = [(MessageListCellView *)self avatarGenerator];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100046F04;
      v37[3] = &unk_1006092A8;
      objc_copyWeak(&v39, &location);
      id v31 = v36;
      id v38 = v31;
      uint64_t v32 = [v30 avatarImageForContext:v33 handler:v37];
      [(MessageListCellView *)self setAvatarToken:v32];

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
  }
}

- (EMCachingContactStore)contactStore
{
  return self->contactStore;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008E00;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699898 != -1) {
    dispatch_once(&qword_100699898, block);
  }
  double v2 = (void *)qword_100699890;

  return (OS_os_log *)v2;
}

- (void)setRecipientLabelType:(int64_t)a3
{
  if (self->_recipientLabelType != a3)
  {
    self->_int64_t recipientLabelType = a3;
    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (void)setReadLaterDate:(id)a3
{
}

- (void)setRead:(BOOL)a3
{
  self->_reaCGFloat d = a3;
}

- (void)setNotify:(BOOL)a3
{
  self->_notifdouble y = a3;
}

- (void)setMute:(BOOL)a3
{
  self->_mute = a3;
}

- (void)setIsReadLater:(BOOL)a3
{
  self->_isReadLater = a3;
}

- (void)setFlagged:(BOOL)a3
{
  self->_flaggeCGFloat d = a3;
}

- (void)setFlagColors:(id)a3
{
}

- (void)setDateStyle:(int64_t)a3
{
  self->_dateStyle = a3;
}

- (void)setAvatarToken:(id)a3
{
}

- (MessageListCellView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)MessageListCellView;
  id v3 = -[MessageListCellView initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(MessageListCellView *)v3 setClipsToBounds:1];
    [(MessageListCellView *)v4 setAutoresizesSubviews:1];
    [(MessageListCellView *)v4 setAutoresizingMask:18];
    id v5 = +[UIColor clearColor];
    [(MessageListCellView *)v4 setBackgroundColor:v5];

    [(MessageListCellView *)v4 setAccessibilityIdentifier:MSAccessibilityIdentifierMailMessageCellView];
    id v6 = +[NSUserDefaults em_userDefaults];
    uint64_t v7 = EMUserDefaultHideMessageListAvatar;
    -[MessageListCellView setHideMessageListAvatar:](v4, "setHideMessageListAvatar:", [v6 BOOLForKey:EMUserDefaultHideMessageListAvatar]);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v4);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100136B54;
    void v14[3] = &unk_100604B20;
    objc_copyWeak(&v16, &location);
    id v8 = v6;
    id v15 = v8;
    double v9 = [v8 ef_observeKeyPath:v7 options:1 autoCancelToken:1 usingBlock:v14];
    [(MessageListCellView *)v4 setMessageListAvatarUserDefaultObserver:v9];

    double v10 = +[UIApplication sharedApplication];
    double v11 = [v10 avatarGenerator];
    [(MessageListCellView *)v4 setAvatarGenerator:v11];

    id v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v4 selector:"_layoutValuesDidChange:" name:kMessageListCellLayoutValuesDidChangeNotification object:0];
    [v12 addObserver:v4 selector:"_dynamicTypeDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)setMessageListAvatarUserDefaultObserver:(id)a3
{
}

- (void)setHideMessageListAvatar:(BOOL)a3
{
  self->_hideMessageListAvatar = a3;
}

- (void)setAvatarGenerator:(id)a3
{
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (BOOL)verifyContentVisibility:(id *)a3
{
  uint64_t v4 = [(MessageListCellView *)self primaryLabel];
  if (!v4) {
    return 1;
  }
  id v5 = (void *)v4;
  while (1)
  {
    if ([v5 isHidden]) {
      goto LABEL_12;
    }
    [v5 alpha];
    if (v6 < 0.0) {
      double v6 = -v6;
    }
    if (v6 < 2.22044605e-16)
    {
LABEL_12:
      double v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      unsigned int v12 = [v5 isHidden];
      [v5 alpha];
      uint64_t v14 = +[NSString stringWithFormat:@"%@ is unexpectedly hidden (hidden=%d, alpha=%.2f)", v11, v12, v13];
      id v15 = +[NSError em_internalErrorWithReason:v14];
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
    uint64_t v7 = [v5 superview];

    if (!v7) {
      break;
    }
    uint64_t v8 = [v5 superview];

    id v5 = (void *)v8;
    if (!v8)
    {
LABEL_10:
      BOOL v9 = 1;
      goto LABEL_15;
    }
  }
  id v16 = (objc_class *)objc_opt_class();
  double v11 = NSStringFromClass(v16);
  uint64_t v14 = +[NSString stringWithFormat:@"%@ is missing its superview", v11];
  id v15 = +[NSError em_internalErrorWithReason:v14];
LABEL_14:
  *a3 = v15;

  BOOL v9 = 0;
LABEL_15:

  return v9;
}

- (id)_dateForViewModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sendLaterDate];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [v4 date];
    BOOL v9 = [v4 displayDate];
    double v10 = +[NSDate now];
    unsigned int v11 = [v10 ef_isEarlierThanDate:v9];

    if (v11)
    {
      unsigned int v12 = +[MessageListCellView log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_10045B454((uint64_t)v9, (uint64_t)v4, v12);
      }

      id v7 = v9;
    }
    else
    {
      uint64_t v13 = [(MessageListCellView *)self readLaterDate];
      uint64_t v14 = v13;
      if (v13)
      {
        if (objc_msgSend(v13, "ef_isEarlierThanOrEqualDate:", v9)) {
          id v15 = v9;
        }
        else {
          id v15 = v14;
        }
        id v7 = v15;
      }
      else
      {
        id v16 = [v4 followUp];
        if (v16) {
          double v17 = v8;
        }
        else {
          double v17 = v9;
        }
        id v7 = v17;
      }
    }
  }

  return v7;
}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (void)setContactStore:(id)a3
{
}

- (void)setShouldShowHighImpact:(BOOL)a3
{
  self->_shouldShowHighImpact = a3;
}

- (void)setSenderSpecificCell:(BOOL)a3
{
  self->_senderSpecificCell = a3;
}

- (void)setLayoutValuesHelper:(id)a3
{
}

- (void)setHasGeneratedSummary:(BOOL)a3
{
  if (self->_hasGeneratedSummary != a3)
  {
    self->_hasGeneratedSummardouble y = a3;
    tertiaryLabel = self->_tertiaryLabel;
    id v4 = &MSAccessibilityIdentifierMailMessageCellViewGeneratedSummaryLabel;
    if (!a3) {
      id v4 = &MSAccessibilityIdentifierMailMessageCellViewSummaryLabel;
    }
    [(MessageListCellLabel *)tertiaryLabel setAccessibilityIdentifier:*v4];
  }
}

- (void)setChevronType:(int64_t)a3
{
  if (self->_chevronType != a3)
  {
    self->_chevronType = a3;
    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (void)setCategory:(id)a3
{
}

- (void)setAnnotatedRelationshipType:(int64_t)a3
{
  if (self->_annotatedRelationshipType != a3)
  {
    self->_int64_t annotatedRelationshipType = a3;
    attributedPrimaryString = self->_attributedPrimaryString;
    self->_attributedPrimaryString = 0;

    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (BOOL)disclosureEnabled
{
  return self->_disclosureEnabled;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(MessageListCellView *)self messageListAvatarUserDefaultObserver];
  [v4 cancel];

  v5.receiver = self;
  v5.super_class = (Class)MessageListCellView;
  [(MessageListCellView *)&v5 dealloc];
}

- (void)_layoutValuesDidChange:(id)a3
{
  id v4 = [a3 object];
  objc_super v5 = [(MessageListCellView *)self layoutValues];

  if (v4 == v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100136D84;
    v7[3] = &unk_1006047A0;
    v7[4] = self;
    double v6 = +[EFScheduler mainThreadScheduler];
    [v6 performBlock:v7];
  }
}

- (void)_dynamicTypeDidChange:(id)a3
{
  [(MessageListCellView *)self _resetDateLabel];
  [(id)objc_opt_class() clearCache];

  [(MessageListCellView *)self setNeedsLayout];
}

- (void)_invalidateCachedValues
{
  attributedPrimaryString = self->_attributedPrimaryString;
  self->_attributedPrimaryString = 0;

  attributedSecondaryString = self->_attributedSecondaryString;
  self->_attributedSecondaryString = 0;

  accessibilitySecondaryLabel = self->_accessibilitySecondaryLabel;
  self->_accessibilitySecondaryLabel = 0;

  attributedTertiaryString = self->_attributedTertiaryString;
  self->_attributedTertiaryString = 0;

  self->_int64_t annotatedRelationshipType = 0;
}

- (void)setShouldAnnotateReplyOrForward:(BOOL)a3
{
  if (self->_shouldAnnotateReplyOrForward != a3)
  {
    self->_shouldAnnotateReplyOrForwarCGFloat d = a3;
    attributedPrimaryString = self->_attributedPrimaryString;
    self->_attributedPrimaryString = 0;

    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (void)setCompact:(BOOL)a3
{
  if (self->_compact != a3)
  {
    self->_compact = a3;
    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (void)setDisclosureEnabled:(BOOL)a3
{
}

- (void)setDisclosureEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_disclosureEnabled != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_disclosureEnableCGFloat d = a3;
    id v7 = [(MessageListCellView *)self disclosureButton];
    [v7 setSelected:v5];

    [(MessageListCellView *)self setNeedsLayout];
    [(MessageListCellView *)self _layoutChevronForDisclosureStateAnimated:v4];
  }
}

- (void)applyIndicatorPreviewChangeAction:(id)a3
{
  id v10 = a3;
  id v4 = [v10 action];
  BOOL v5 = 0;
  uint64_t v6 = 0;
  switch((unint64_t)v4)
  {
    case 2uLL:
      -[MessageListCellView setRead:[v10 flagState:0]];
      BOOL v5 = [(MessageListCellView *)self isRead] ^ 1;
      uint64_t v6 = 1;
      break;
    case 3uLL:
      -[MessageListCellView setIsReadLater:[v10 flagState:0]];
      id v7 = [v10 readLaterDate];
      [(MessageListCellView *)self setReadLaterDate:v7];

      BOOL v5 = [(MessageListCellView *)self isReadLater];
      [(MessageListCellView *)self setDateStyle:[(MessageListCellView *)self isReadLater]];
      [(MessageListCellView *)self _updateDateLabelWithDateStyle:[(MessageListCellView *)self dateStyle]];
      uint64_t v6 = 512;
      break;
    case 6uLL:
      uint64_t v8 = [v10 flagColors];
      BOOL v5 = v8 != 0;

      [(MessageListCellView *)self setFlagged:v5];
      BOOL v9 = [v10 flagColors];
      [(MessageListCellView *)self setFlagColors:v9];

      uint64_t v6 = 4;
      break;
    case 0xAuLL:
      -[MessageListCellView setNotify:[v10 flagState:0]];
      BOOL v5 = [(MessageListCellView *)self isNotify] ^ 1;
      uint64_t v6 = 64;
      break;
    case 0xBuLL:
      -[MessageListCellView setMute:[v10 flagState:0]];
      BOOL v5 = [(MessageListCellView *)self isMute] ^ 1;
      uint64_t v6 = 128;
      break;
    default:
      break;
  }
  [(MessageListCellView *)self _animateIndicator:v6 toState:v5];
}

- (void)_animateIndicator:(unint64_t)a3 toState:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(MessageListCellView *)self statusIndicatorManager];
  uint64_t v8 = [v7 statusIndicatorViews];

  BOOL v9 = [(MessageListCellView *)self statusIndicatorManager];
  id v10 = [v9 tierForIndicator:a3];

  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = 0;
    id v24 = &v32;
    id v25 = v29;
    unsigned int v12 = UINavigationItem_ptr;
    while (v11 < (unint64_t)objc_msgSend(v8, "count", v24, v25))
    {
      if (v10 == (id)v11)
      {
        uint64_t v13 = [v8 objectAtIndex:v10];
        uint64_t v14 = [v13 superview];

        if (v14 != self) {
          [(MessageListCellView *)self addSubview:v13];
        }
        id v15 = objc_alloc((Class)v12[46]);
        if (v4)
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_100137594;
          v31[3] = &unk_1006047A0;
          id v16 = v13;
          id v32 = v16;
          id v17 = [v15 initWithDuration:0 curve:v31 animations:0.4];
          objc_super v18 = v12;
          id v19 = objc_alloc((Class)v12[46]);
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v29[0] = sub_1001375A0;
          v29[1] = &unk_1006047A0;
          id v30 = v16;
          id v20 = [v19 initWithDuration:v28 dampingRatio:0.8 animations:0.7];
          [v17 startAnimation];
          unsigned int v12 = v18;
          [v20 startAnimation];

          unsigned int v21 = v24;
        }
        else
        {
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_1001375F4;
          v26[3] = &unk_1006047A0;
          id v27 = v13;
          id v17 = [v15 initWithDuration:0 curve:v26 animations:0.8];
          [v17 startAnimation];
          unsigned int v21 = &v27;
        }
      }
      ++v11;
    }
    [(MessageListCellView *)self _layoutStatusIndicatorViews];
    __int16 v22 = [UIApp preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v22);

    if (IsAccessibilityCategory) {
      [(MessageListCellView *)self setNeedsLayout];
    }
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selecteCGFloat d = a3;
    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighteCGFloat d = a3;
    [(MessageListCellView *)self setNeedsLayout];
  }
}

- (CGPoint)_dateOriginUnderSummary:(CGRect)a3
{
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v6 = [(MessageListCellView *)self layoutValues];
  id v7 = [v6 summaryFont];

  uint64_t v8 = [(MessageListCellView *)self layoutValues];
  [v8 addressAndSubjectHeight];
  double v10 = v9;

  unint64_t v11 = [(MessageListCellView *)self tertiaryLabel];
  unsigned int v12 = [(MessageListCellView *)self _isLabelValid:v11];

  if (v12)
  {
    uint64_t v13 = [(MessageListCellView *)self layoutValues];
    uint64_t v14 = [(MessageListCellView *)self summary];
    [(MessageListCellView *)self bounds];
    [v13 actualLineCountForSummary:v14];
  }
  [v7 _bodyLeading];
  [v7 descender];
  UIRoundToViewScale();
  double v16 = y + v10 + v15;

  double v17 = x;
  double v18 = v16;
  result.double y = v18;
  result.CGFloat x = v17;
  return result;
}

- (CGRect)_rectForMultipleSubjectWithBounds:(CGRect)a3 position:(int64_t)a4
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(MessageListCellView *)self layoutValues];
  [v7 addressCapHeight];
  double v9 = v8;
  double v10 = [v7 summaryFont];
  [v10 lineHeight];
  [v10 mf_originPointFromBaselinePoint:x + UIEdgeInsetsZero.left, y + UIEdgeInsetsZero.top + v9 + 2.0 + v11 * (double)(a4 + 1) + (double)(unint64_t)(2 * a4)];
  [v10 lineHeight];
  [v10 descender];
  UIRoundToViewScale();
  MFIntegralRectToViewScale();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (BOOL)_hasPastReminderForReadLaterDate:(id)a3 displayDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSDate now];
  if (objc_msgSend(v5, "ef_isEarlierThanOrEqualDate:", v7)) {
    unsigned __int8 v8 = 1;
  }
  else {
    unsigned __int8 v8 = [v5 ef_isEarlierThanOrEqualDate:v6];
  }

  return v8;
}

- (void)prepareForReuse
{
  viewModel = self->_viewModel;
  self->_viewModel = 0;

  [(MessageListCellView *)self setRead:1];
  [(MessageListCellView *)self setFlagged:0];
  [(MessageListCellView *)self setFlagColors:0];
  [(MessageListCellView *)self setNotify:0];
  [(MessageListCellView *)self setMute:0];
  [(MessageListCellView *)self setReadLaterDate:0];
  [(MessageListCellView *)self setIsReadLater:0];
  [(MessageListCellView *)self setRecipientLabelType:0];
  [(MessageListCellView *)self setAttributedSecondaryString:0];
  [(MessageListCellView *)self setAccessibilitySecondaryLabel:0];
  id v5 = [(MessageListCellView *)self secondaryLabel];
  [v5 setText:0];

  [(MessageListCellView *)self setAttributedPrimaryString:0];
  id v6 = [(MessageListCellView *)self primaryLabel];
  [v6 setText:0];

  [(MessageListCellView *)self setAttributedTertiaryString:0];
  id v7 = [(MessageListCellView *)self tertiaryLabel];
  [v7 setText:0];

  [(MessageListCellView *)self setSummary:&stru_100619928];
  [(MessageListCellView *)self setHasGeneratedSummary:0];
  [(MessageListCellView *)self setSummarySymbolTextAttachment:0];
  id v8 = [(MessageListCellView *)self avatarView];
  [v8 setImage:0];

  [(MessageListCellView *)self setAvatarResult:0];
  [(MessageListCellView *)self _updateAvatarView];
  id v9 = [(MessageListCellView *)self avatarToken];
  [v9 cancel];

  [(MessageListCellView *)self setAvatarToken:0];
  id v10 = [(MessageListCellView *)self categorizationStateLabel];
  [v10 setText:0];

  [(MessageListCellView *)self setCompact:0];
  id v11 = [(MessageListCellView *)self dateLabel];
  [v11 _setTextEncapsulation:0];
  [v11 setAttributedText:0];
  [v11 setText:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 setDate:0];
  }
  BOOL v4 = [(MessageListCellView *)self statusIndicatorManager];
  [v4 prepareForReuse];
}

- (int64_t)annotatedRelationshipType
{
  return self->_annotatedRelationshipType;
}

- (BOOL)isCompact
{
  return self->_compact;
}

- (BOOL)shouldAnnotateReplyOrForward
{
  return self->_shouldAnnotateReplyOrForward;
}

- (int64_t)numberOfPreviewLines
{
  return self->_numberOfPreviewLines;
}

- (void)setNumberOfPreviewLines:(int64_t)a3
{
  self->_numberOfPreviewLines = a3;
}

- (BOOL)shouldShowHighImpact
{
  return self->_shouldShowHighImpact;
}

- (void)setSwiped:(BOOL)a3
{
  self->_swipeCGFloat d = a3;
}

- (void)setDateLabel:(id)a3
{
}

- (void)setPrimaryLabel:(id)a3
{
}

- (void)setAttributedPrimaryString:(id)a3
{
}

- (void)setSecondaryLabel:(id)a3
{
}

- (void)setAccessibilitySecondaryLabel:(id)a3
{
}

- (void)setAttributedSecondaryString:(id)a3
{
}

- (void)setTertiaryLabel:(id)a3
{
}

- (void)setAttributedTertiaryString:(id)a3
{
}

- (void)setRecipientLabelImageView:(id)a3
{
}

- (void)setCategoriesStackView:(id)a3
{
}

- (void)setCategorizationStateLabel:(id)a3
{
}

- (MUIAvatarImageGeneratorResult)avatarResult
{
  return self->_avatarResult;
}

- (void)setAvatarResult:(id)a3
{
}

- (EFCancelable)avatarToken
{
  return self->_avatarToken;
}

- (void)setAvatarView:(id)a3
{
}

- (EFCancelable)messageListAvatarUserDefaultObserver
{
  return self->_messageListAvatarUserDefaultObserver;
}

- (NSTextAttachment)summarySymbolTextAttachment
{
  return self->_summarySymbolTextAttachment;
}

- (void)setSummarySymbolTextAttachment:(id)a3
{
}

- (void)setChevron:(id)a3
{
}

- (void)setStatusIndicatorManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readLaterDate, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
  objc_storeStrong((id *)&self->_statusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_summarySymbolTextAttachment, 0);
  objc_storeStrong((id *)&self->_messageListAvatarUserDefaultObserver, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_avatarToken, 0);
  objc_storeStrong((id *)&self->_avatarResult, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_categorizationStateLabel, 0);
  objc_storeStrong((id *)&self->_categoriesStackView, 0);
  objc_storeStrong((id *)&self->_recipientLabelImageView, 0);
  objc_storeStrong((id *)&self->_attributedTertiaryString, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_attributedSecondaryString, 0);
  objc_storeStrong((id *)&self->_accessibilitySecondaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_attributedPrimaryString, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->contactStore, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_storeStrong((id *)&self->_disclosureButton, 0);
  objc_storeStrong((id *)&self->_contentConfiguration, 0);
  objc_storeStrong((id *)&self->_configurationState, 0);

  objc_storeStrong((id *)&self->_backgroundConfiguration, 0);
}

@end