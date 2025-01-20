@interface MFMessageDisplayMetrics
+ (MFMessageDisplayMetrics)displayMetricsWithTraitCollection:(id)a3 layoutMargins:(UIEdgeInsets)a4 safeAreaInsets:(UIEdgeInsets)a5 interfaceOrientation:(int64_t)a6;
+ (MFMessageDisplayMetrics)displayMetricsWithTraitCollection:(id)a3 layoutMargins:(UIEdgeInsets)a4 safeAreaInsets:(UIEdgeInsets)a5 interfaceOrientation:(int64_t)a6 trailingButtonView:(id)a7;
+ (double)avatarDiameter;
+ (id)mf_actionCardMetricsFromDisplayMetrics:(id)a3;
- (BOOL)conversationHeaderViewShouldHideCollapsedSuperTitle;
- (BOOL)hasCompactLayout;
- (BOOL)hasGenerousMargins;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersFlushSeparator;
- (BOOL)prefersFlushSeparatorForLeadingEdge;
- (BOOL)usePhoneLandscapeSymbolConfiguration;
- (ConversationFooterViewDisplayMetrics)footerViewDisplayMetrics;
- (UIEdgeInsets)layoutMargins;
- (UIEdgeInsets)safeAreaInsets;
- (UITraitCollection)traitCollection;
- (UIView)trailingButtonView;
- (double)_calculateFooterViewButtonsAnimationOffset;
- (double)_scaledFloatWithValue:(double)a3 fontStyle:(id)a4;
- (double)_scaledFloatWithValue:(double)a3 fontStyle:(id)a4 maximumContentSizeCategory:(id)a5;
- (double)avatarDiameterForCurrentContentSize;
- (double)baselineToBaselineSpacing;
- (double)baselineToBaselineSpacingInConversation;
- (double)baselineToBaselineSpacingInConversationForMailActionHeader;
- (double)baselineToBaselineSpacingInMailActionCardHorizontalGroup;
- (double)bottomSpacingInMailActionCardHorizontalGroup;
- (double)bottomToLastBaselineInMailActionCardVerticalGroup;
- (double)cellHeightToStartScroll;
- (double)conversationHeaderViewCollapsedSuperTitleTopToFirstBaseline;
- (double)conversationHeaderViewCollapsedTitleBottomToLastBaseline;
- (double)conversationHeaderViewCollapsedTitleTopToFirstBaseline;
- (double)conversationHeaderViewExpandedTitleTopToFirstBaseline;
- (double)estimatedFooterViewHeight;
- (double)firstSeparatorToSubjectBaseline;
- (double)footerViewButtonsAnimationOffset;
- (double)footerViewTopToBaseline;
- (double)footerViewTrailingButtonOrigin;
- (double)headerAvatarMaxOffset;
- (double)headerBottomPadding;
- (double)headerMinAvatarLeadingSpacing;
- (double)horizontalSpacing;
- (double)mailActionCardLargerMediumDetentCoverage;
- (double)mailActionCardMaximumContainerViewHeightForLargerMediumDetent;
- (double)mailActionCardPreferredHeightForPad;
- (double)mailActionCardSmallerMediumDetentCoverage;
- (double)messageBottomPaddingInConversation;
- (double)messageBottomPaddingInConversationForMailActionHeader;
- (double)messageTopPaddingInConversation;
- (double)messageTopPaddingInConversationForMailActionHeader;
- (double)minHorizontalSpacing;
- (double)recipientBaselineToFirstSeparator;
- (double)recipientBaselineToFirstSeparatorInConversation;
- (double)statusIndicatorHorizontalSpacing;
- (double)statusIndicatorVerticalSpacing;
- (double)topToFirstBaselineSpacingInMailActionCardVerticalGroup;
- (double)topToGlyphBaselineInMailActionCardHorizontalGroup;
- (double)topToSenderBaseline;
- (double)topToSenderBaselineInConversation;
- (double)topToSenderBaselineInConversationForMailActionHeader;
- (id)_cachedFontForStyle:(id)a3;
- (id)description;
- (id)fontCacheKeyPrefix;
- (unint64_t)hash;
- (void)setFooterViewButtonsAnimationOffset:(double)a3;
- (void)setFooterViewDisplayMetrics:(id)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setTrailingButtonView:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation MFMessageDisplayMetrics

+ (id)mf_actionCardMetricsFromDisplayMetrics:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (MFMessageDisplayMetrics)displayMetricsWithTraitCollection:(id)a3 layoutMargins:(UIEdgeInsets)a4 safeAreaInsets:(UIEdgeInsets)a5 interfaceOrientation:(int64_t)a6
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double v11 = a4.right;
  double v12 = a4.bottom;
  double v13 = a4.left;
  double v14 = a4.top;
  id v15 = a3;
  uint64_t v16 = [v15 userInterfaceIdiom];
  if (v16 == -1)
  {
    id v17 = 0;
  }
  else
  {
    if (v16) {
      [v15 horizontalSizeClass];
    }
    id v17 = objc_alloc_init((Class)objc_opt_class());
    [v17 setTraitCollection:v15];
    objc_msgSend(v17, "setLayoutMargins:", v14, v13, v12, v11);
    objc_msgSend(v17, "setSafeAreaInsets:", top, left, bottom, right);
    v18 = +[ConversationFooterViewDisplayMetrics displayMetricsWithSafeAreaInsets:interfaceOrientation:traitCollection:](ConversationFooterViewDisplayMetrics, "displayMetricsWithSafeAreaInsets:interfaceOrientation:traitCollection:", a6, v15, top, left, bottom, right);
    [v17 setFooterViewDisplayMetrics:v18];
  }
  return (MFMessageDisplayMetrics *)v17;
}

+ (MFMessageDisplayMetrics)displayMetricsWithTraitCollection:(id)a3 layoutMargins:(UIEdgeInsets)a4 safeAreaInsets:(UIEdgeInsets)a5 interfaceOrientation:(int64_t)a6 trailingButtonView:(id)a7
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double v12 = a4.right;
  double v13 = a4.bottom;
  double v14 = a4.left;
  double v15 = a4.top;
  id v18 = a7;
  v19 = objc_msgSend(a1, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:", a3, a6, v15, v14, v13, v12, top, left, bottom, right);
  [v19 setTrailingButtonView:v18];

  return (MFMessageDisplayMetrics *)v19;
}

- (id)fontCacheKeyPrefix
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MFMessageDisplayMetrics *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = [(MFMessageDisplayMetrics *)self traitCollection];
      v9 = [(MFMessageDisplayMetrics *)v7 traitCollection];
      if ([v8 isEqual:v9])
      {
        [(MFMessageDisplayMetrics *)self layoutMargins];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        [(MFMessageDisplayMetrics *)v7 layoutMargins];
        BOOL v6 = 0;
        if (v13 == v21 && v11 == v18 && v17 == v20 && v15 == v19)
        {
          [(MFMessageDisplayMetrics *)self safeAreaInsets];
          double v23 = v22;
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          [(MFMessageDisplayMetrics *)v7 safeAreaInsets];
          BOOL v33 = v25 == v32;
          if (v23 != v34) {
            BOOL v33 = 0;
          }
          if (v29 != v31) {
            BOOL v33 = 0;
          }
          BOOL v6 = v27 == v30 && v33;
        }
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(MFMessageDisplayMetrics *)self traitCollection];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)hasCompactLayout
{
  unint64_t v3 = [(MFMessageDisplayMetrics *)self traitCollection];
  if ([v3 userInterfaceIdiom])
  {
    v4 = [(MFMessageDisplayMetrics *)self traitCollection];
    BOOL v5 = [v4 horizontalSizeClass] == 1;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)hasGenerousMargins
{
  [(MFMessageDisplayMetrics *)self layoutMargins];
  return v2 > 30.0;
}

- (BOOL)prefersFlushSeparator
{
  if ([(MFMessageDisplayMetrics *)self hasCompactLayout]
    || ![(MFMessageDisplayMetrics *)self hasGenerousMargins])
  {
    return 1;
  }
  unint64_t v3 = (void *)MEMORY[0x1E4FB19D0];
  v4 = [(MFMessageDisplayMetrics *)self traitCollection];
  char v5 = objc_msgSend(v3, "mf_shouldUseDesktopClassNavigationBarForTraitCollection:", v4);

  return v5;
}

- (BOOL)prefersFlushSeparatorForLeadingEdge
{
  double v2 = (void *)MEMORY[0x1E4FB19D0];
  unint64_t v3 = [(MFMessageDisplayMetrics *)self traitCollection];
  LOBYTE(v2) = objc_msgSend(v2, "mf_shouldUseDesktopClassNavigationBarForTraitCollection:", v3);

  return (char)v2;
}

- (double)minHorizontalSpacing
{
  return 10.0;
}

- (double)horizontalSpacing
{
  return 12.0;
}

- (double)topToSenderBaselineInConversation
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB28C8] fontStyle:32.0];
  return result;
}

- (double)baselineToBaselineSpacingInConversation
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2950] fontStyle:20.0];
  return result;
}

- (double)topToSenderBaselineInConversationForMailActionHeader
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB28C8] fontStyle:*MEMORY[0x1E4FB2798] maximumContentSizeCategory:32.0];
  return result;
}

- (double)baselineToBaselineSpacingInConversationForMailActionHeader
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2950] fontStyle:*MEMORY[0x1E4FB2790] maximumContentSizeCategory:20.0];
  return result;
}

- (double)recipientBaselineToFirstSeparatorInConversation
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB28F0] fontStyle:18.0];
  double v4 = v3;
  [(MFMessageDisplayMetrics *)self messageTopPaddingInConversation];
  return v4 + v5;
}

- (double)headerAvatarMaxOffset
{
  return 7.0;
}

- (double)headerMinAvatarLeadingSpacing
{
  return 24.0;
}

+ (double)avatarDiameter
{
  return 37.0;
}

- (double)avatarDiameterForCurrentContentSize
{
  v19[12] = *MEMORY[0x1E4F143B8];
  double v2 = [(MFMessageDisplayMetrics *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];

  [(id)objc_opt_class() avatarDiameter];
  id v4 = v3;
  double v5 = (void *)_avatarScaleForContentSize_avatarScales;
  if (!_avatarScaleForContentSize_avatarScales)
  {
    uint64_t v6 = *MEMORY[0x1E4FB27E8];
    v18[0] = *MEMORY[0x1E4FB27C8];
    v18[1] = v6;
    v19[0] = &unk_1F39EEEC8;
    v19[1] = &unk_1F39EEEC8;
    uint64_t v7 = *MEMORY[0x1E4FB27D0];
    v18[2] = *MEMORY[0x1E4FB27D8];
    v18[3] = v7;
    v19[2] = &unk_1F39EEEC8;
    v19[3] = &unk_1F39EEEC8;
    uint64_t v8 = *MEMORY[0x1E4FB27B8];
    v18[4] = *MEMORY[0x1E4FB27C0];
    v18[5] = v8;
    v19[4] = &unk_1F39EEEE8;
    v19[5] = &unk_1F39EEEF8;
    uint64_t v9 = *MEMORY[0x1E4FB2798];
    v18[6] = *MEMORY[0x1E4FB27B0];
    v18[7] = v9;
    v19[6] = &unk_1F39EEED8;
    v19[7] = &unk_1F39EEEC8;
    uint64_t v10 = *MEMORY[0x1E4FB2788];
    v18[8] = *MEMORY[0x1E4FB2790];
    v18[9] = v10;
    v19[8] = &unk_1F39EEEC8;
    v19[9] = &unk_1F39EEEC8;
    uint64_t v11 = *MEMORY[0x1E4FB2778];
    v18[10] = *MEMORY[0x1E4FB2780];
    v18[11] = v11;
    v19[10] = &unk_1F39EEEC8;
    v19[11] = &unk_1F39EEEC8;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:12];
    double v13 = (void *)_avatarScaleForContentSize_avatarScales;
    _avatarScaleForContentSize_avatarScales = v12;

    double v5 = (void *)_avatarScaleForContentSize_avatarScales;
  }
  double v14 = [v5 objectForKeyedSubscript:v4];
  [v14 floatValue];

  UIRoundToViewScale();
  double v16 = v15;

  return v16;
}

- (double)statusIndicatorHorizontalSpacing
{
  return 8.0;
}

- (double)messageTopPaddingInConversation
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB28C8] fontStyle:2.0];
  return result;
}

- (double)messageBottomPaddingInConversation
{
  [(MFMessageDisplayMetrics *)self messageTopPaddingInConversation];
  double v4 = v3;
  [(MFMessageDisplayMetrics *)self topToSenderBaselineInConversation];
  double v6 = v4 + v5;
  [(MFMessageDisplayMetrics *)self baselineToBaselineSpacingInConversation];
  double v8 = v6 + v7;
  [(MFMessageDisplayMetrics *)self avatarDiameterForCurrentContentSize];
  return v8 - v9 + 1.0;
}

- (double)messageTopPaddingInConversationForMailActionHeader
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB28C8] fontStyle:*MEMORY[0x1E4FB2798] maximumContentSizeCategory:2.0];
  return result;
}

- (double)messageBottomPaddingInConversationForMailActionHeader
{
  double v3 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
  {
    double v5 = 64.0;
  }
  else
  {
    [(MFMessageDisplayMetrics *)self avatarDiameterForCurrentContentSize];
    double v5 = v6;
  }
  [(MFMessageDisplayMetrics *)self messageTopPaddingInConversationForMailActionHeader];
  double v8 = v7;
  [(MFMessageDisplayMetrics *)self topToSenderBaselineInConversationForMailActionHeader];
  double v10 = v8 + v9;
  [(MFMessageDisplayMetrics *)self baselineToBaselineSpacingInConversationForMailActionHeader];
  return v10 + v11 - v5 + 1.0;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(MFMessageDisplayMetrics *)self traitCollection];
  double v6 = [v3 stringWithFormat:@"<%@: %p> traitCollection = %@", v4, self, v5];

  return v6;
}

- (id)_cachedFontForStyle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
  double v5 = [v4 cachedPreferredFontForStyle:v3];

  return v5;
}

- (double)_scaledFloatWithValue:(double)a3 fontStyle:(id)a4
{
  id v5 = a4;
  double v6 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
  [v6 cachedScaledFloatWithValue:v5 fontStyle:a3];
  double v8 = v7;

  return v8;
}

- (double)_scaledFloatWithValue:(double)a3 fontStyle:(id)a4 maximumContentSizeCategory:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = [MEMORY[0x1E4F350E0] sharedFontMetricCache];
  [v9 cachedScaledFloatWithValue:v7 fontStyle:v8 maximumContentSizeCategory:a3];
  double v11 = v10;

  return v11;
}

- (double)cellHeightToStartScroll
{
  if ([(MFMessageDisplayMetrics *)self usePhoneLandscapeSymbolConfiguration]) {
    double v3 = 175.0;
  }
  else {
    double v3 = 300.0;
  }
  [(MFMessageDisplayMetrics *)self estimatedFooterViewHeight];
  double v5 = v4;
  [(MFMessageDisplayMetrics *)self footerViewTopToBaseline];
  return v3 + v5 - v6;
}

- (double)estimatedFooterViewHeight
{
  double v2 = [(MFMessageDisplayMetrics *)self footerViewDisplayMetrics];
  [v2 toolbarHeight];
  double v4 = v3;

  return v4;
}

- (double)footerViewTopToBaseline
{
  double v2 = [(MFMessageDisplayMetrics *)self footerViewDisplayMetrics];
  [v2 topToBaseline];
  double v4 = v3;

  return v4;
}

- (BOOL)usePhoneLandscapeSymbolConfiguration
{
  double v2 = [(MFMessageDisplayMetrics *)self footerViewDisplayMetrics];
  char v3 = [v2 usePhoneLandscapeSymbolConfiguration];

  return v3;
}

- (double)_calculateFooterViewButtonsAnimationOffset
{
  if ([(MFMessageDisplayMetrics *)self usePhoneLandscapeSymbolConfiguration]) {
    uint64_t v3 = 17;
  }
  else {
    uint64_t v3 = 16;
  }
  double v4 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", *MEMORY[0x1E4F35080], v3);
  [v4 size];
  double v6 = v5;
  [(MFMessageDisplayMetrics *)self footerViewTopToBaseline];
  double v8 = v7;
  [(MFMessageDisplayMetrics *)self estimatedFooterViewHeight];
  double v10 = v9 - (v6 + (v8 - v6) * 2.0);
  double v11 = 0.0;
  if (v10 > 0.0)
  {
    [(MFMessageDisplayMetrics *)self safeAreaInsets];
    if (v12 != 0.0) {
      double v11 = fmin(v10, 15.0);
    }
  }

  return v11;
}

- (void)setFooterViewDisplayMetrics:(id)a3
{
  double v5 = (ConversationFooterViewDisplayMetrics *)a3;
  if (self->_footerViewDisplayMetrics != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_footerViewDisplayMetrics, a3);
    [(MFMessageDisplayMetrics *)self _calculateFooterViewButtonsAnimationOffset];
    self->_footerViewButtonsAnimationOffset = v6;
    double v5 = v7;
  }
}

- (double)footerViewTrailingButtonOrigin
{
  double v2 = [(MFMessageDisplayMetrics *)self trailingButtonView];
  uint64_t v3 = v2;
  if (v2)
  {
    double v4 = [v2 subviews];
    double v5 = [v4 firstObject];
    [v5 frame];
    double v7 = v6;

    [v3 frame];
    double v9 = v7 + v8;
  }
  else
  {
    double v9 = 2.22507386e-308;
  }

  return v9;
}

- (double)topToGlyphBaselineInMailActionCardHorizontalGroup
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB28C8] fontStyle:*MEMORY[0x1E4FB27B8] maximumContentSizeCategory:36.0];
  return result;
}

- (double)baselineToBaselineSpacingInMailActionCardHorizontalGroup
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2950] fontStyle:*MEMORY[0x1E4FB2790] maximumContentSizeCategory:24.0];
  return result;
}

- (double)bottomSpacingInMailActionCardHorizontalGroup
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2950] fontStyle:*MEMORY[0x1E4FB2790] maximumContentSizeCategory:20.0];
  return result;
}

- (double)topToFirstBaselineSpacingInMailActionCardVerticalGroup
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2950] fontStyle:*MEMORY[0x1E4FB2780] maximumContentSizeCategory:32.0];
  return result;
}

- (double)bottomToLastBaselineInMailActionCardVerticalGroup
{
  [(MFMessageDisplayMetrics *)self _scaledFloatWithValue:*MEMORY[0x1E4FB2950] fontStyle:*MEMORY[0x1E4FB2798] maximumContentSizeCategory:20.0];
  return result;
}

- (double)mailActionCardPreferredHeightForPad
{
  return 466.0;
}

- (double)mailActionCardMaximumContainerViewHeightForLargerMediumDetent
{
  return 568.0;
}

- (double)mailActionCardSmallerMediumDetentCoverage
{
  return 0.54;
}

- (double)mailActionCardLargerMediumDetentCoverage
{
  return 0.59;
}

- (double)conversationHeaderViewCollapsedSuperTitleTopToFirstBaseline
{
  return 10.0;
}

- (BOOL)conversationHeaderViewShouldHideCollapsedSuperTitle
{
  double v2 = [(MFMessageDisplayMetrics *)self footerViewDisplayMetrics];
  [v2 toolbarHeight];
  BOOL v4 = v3 < 44.0;

  return v4;
}

- (double)conversationHeaderViewCollapsedTitleTopToFirstBaseline
{
  BOOL v2 = [(MFMessageDisplayMetrics *)self conversationHeaderViewShouldHideCollapsedSuperTitle];
  double result = 28.0;
  if (v2) {
    return 21.0;
  }
  return result;
}

- (double)conversationHeaderViewCollapsedTitleBottomToLastBaseline
{
  return 9.0;
}

- (double)conversationHeaderViewExpandedTitleTopToFirstBaseline
{
  return 40.0;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (UIEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double left = self->_layoutMargins.left;
  double bottom = self->_layoutMargins.bottom;
  double right = self->_layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (double)topToSenderBaseline
{
  return self->_topToSenderBaseline;
}

- (double)baselineToBaselineSpacing
{
  return self->_baselineToBaselineSpacing;
}

- (double)recipientBaselineToFirstSeparator
{
  return self->_recipientBaselineToFirstSeparator;
}

- (double)firstSeparatorToSubjectBaseline
{
  return self->_firstSeparatorToSubjectBaseline;
}

- (double)headerBottomPadding
{
  return self->_headerBottomPadding;
}

- (double)statusIndicatorVerticalSpacing
{
  return self->_statusIndicatorVerticalSpacing;
}

- (double)footerViewButtonsAnimationOffset
{
  return self->_footerViewButtonsAnimationOffset;
}

- (void)setFooterViewButtonsAnimationOffset:(double)a3
{
  self->_footerViewButtonsAnimationOffset = a3;
}

- (ConversationFooterViewDisplayMetrics)footerViewDisplayMetrics
{
  return self->_footerViewDisplayMetrics;
}

- (UIView)trailingButtonView
{
  return self->_trailingButtonView;
}

- (void)setTrailingButtonView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingButtonView, 0);
  objc_storeStrong((id *)&self->_footerViewDisplayMetrics, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end