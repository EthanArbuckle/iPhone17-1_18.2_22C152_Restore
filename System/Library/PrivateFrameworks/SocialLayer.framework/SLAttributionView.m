@interface SLAttributionView
+ (void)presentTranscriptForAttributionIdentifier:(id)a3 attachmentGUID:(id)a4 presentingViewController:(id)a5;
+ (void)presentTranscriptForAttributionIdentifier:(id)a3 presentingViewController:(id)a4;
- (BOOL)_crossPlatformIsRTL;
- (BOOL)_hasiOSBannerVariant;
- (BOOL)enablesMarquee;
- (BOOL)isCollaboration;
- (BOOL)marqueeRequired;
- (BOOL)usesBannerLayout;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSLayoutConstraint)closeButtonVerticalConstraint;
- (NSLayoutConstraint)closeButtonXDimensionConstraint;
- (NSLayoutConstraint)ourHeightConstraint;
- (NSLayoutConstraint)ourWidthConstraint;
- (NSLayoutConstraint)pillCenterYConstraint;
- (NSLayoutConstraint)pillHorizontalAlignmentConstraint;
- (NSString)blurEffectGroupName;
- (NSString)hideMenuItemTitle;
- (SLAttributionView)initWithHighlight:(id)a3;
- (SLAttributionViewDelegate)delegate;
- (SLHighlight)highlight;
- (SLHighlightPillView)pillView;
- (UIButton)closeButton;
- (UIColor)preferredBackgroundColor;
- (UIMenu)supplementalMenu;
- (double)_minHeightForCurrentStyle;
- (double)maxWidthForClippingMarquee;
- (id)_backgroundColorEnforcingPolicies;
- (id)additionalContextMenuItemsForHighlightPillView:(id)a3;
- (id)contextMenuItems;
- (int64_t)_alignmentEnforcingPolicies;
- (int64_t)_backgroundStyleEnforcingPolicies;
- (int64_t)preferredAlignment;
- (int64_t)preferredBackgroundStyle;
- (unint64_t)variant;
- (void)_sanitizeFrameIfNecessaryForTAMIC;
- (void)_updateMarqueeRequiredIfNecessary;
- (void)dealloc;
- (void)excludeContextMenuItemsWithIdentifiers:(id)a3;
- (void)feedbackForCloseButtonHit;
- (void)highlightPillViewDidLoadNewRemoteContent:(id)a3;
- (void)layoutSubviews;
- (void)prepareLayout;
- (void)prepareLayoutWithMaxWidth:(double)a3;
- (void)setBlurEffectGroupName:(id)a3;
- (void)setCloseButtonVerticalConstraint:(id)a3;
- (void)setCloseButtonXDimensionConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnablesMarquee:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHideMenuItemTitle:(id)a3;
- (void)setHighlight:(id)a3;
- (void)setIsCollaboration:(BOOL)a3;
- (void)setMarqueeRequired:(BOOL)a3;
- (void)setMaxWidthForClippingMarquee:(double)a3;
- (void)setOurHeightConstraint:(id)a3;
- (void)setOurWidthConstraint:(id)a3;
- (void)setPillCenterYConstraint:(id)a3;
- (void)setPillHorizontalAlignmentConstraint:(id)a3;
- (void)setPillView:(id)a3;
- (void)setPreferredAlignment:(int64_t)a3;
- (void)setPreferredBackgroundColor:(id)a3;
- (void)setPreferredBackgroundStyle:(int64_t)a3;
- (void)setSupplementalMenu:(id)a3;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
- (void)setUsesBannerLayout:(BOOL)a3;
- (void)updateAlignment:(int64_t)a3;
- (void)updateBackgroundColor:(id)a3;
- (void)updateBackgroundStyle:(int64_t)a3;
- (void)updateConstraints;
- (void)updateInterfaceStyle:(int64_t)a3;
- (void)useBannerLayout;
@end

@implementation SLAttributionView

- (SLAttributionView)initWithHighlight:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SLAttributionView;
  v6 = -[SLAttributionView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    [(SLAttributionView *)v6 _setHostsLayoutEngine:1];
    v8 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(SLAttributionView *)(uint64_t)v7 initWithHighlight:v8];
    }

    objc_storeStrong((id *)&v7->_highlight, a3);
    v7->_isCollaboration = 0;
    objc_opt_class();
    v7->_isCollaboration = objc_opt_isKindOfClass() & 1;
    v7->_preferredBackgroundStyle = -1;
    v7->_preferredAlignment = -1;
    preferredBackgroundColor = v7->_preferredBackgroundColor;
    v7->_preferredBackgroundColor = 0;

    BOOL v10 = [(SLAttributionView *)v7 _backgroundStyleEnforcingPolicies] == 1;
    v11 = [SLHighlightPillView alloc];
    v12 = [(SLAttributionView *)v7 highlight];
    [(SLAttributionView *)v7 frame];
    v14 = [(SLHighlightPillView *)v11 initWithHighlight:v12 maxWidth:[(SLAttributionView *)v7 variant] variant:v10 shouldDrawBlur:v13];
    [(SLAttributionView *)v7 setPillView:v14];

    v15 = [(SLAttributionView *)v7 _backgroundColorEnforcingPolicies];
    v16 = [(SLAttributionView *)v7 pillView];
    [v16 setPreferredBackgroundColor:v15];

    v17 = [(SLAttributionView *)v7 pillView];
    [(SLAttributionView *)v7 addSubview:v17];

    v18 = [(SLAttributionView *)v7 pillView];
    [v18 setDelegate:v7];

    v19 = [(SLAttributionView *)v7 pillView];
    v20 = [v19 centerYAnchor];
    v21 = [(SLAttributionView *)v7 centerYAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    [(SLAttributionView *)v7 setPillCenterYConstraint:v22];

    v23 = [(SLAttributionView *)v7 pillCenterYConstraint];
    [v23 setIdentifier:@"SLAttributionViewInternal-PillCenterY"];

    v24 = [(SLAttributionView *)v7 pillView];
    [v24 setAccessibilityIdentifier:@"AttributionView"];
  }
  return v7;
}

- (void)setBlurEffectGroupName:(id)a3
{
  p_blurEffectGroupName = (id *)&self->_blurEffectGroupName;
  id v8 = a3;
  if ((objc_msgSend(*p_blurEffectGroupName, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_blurEffectGroupName, a3);
    id v6 = *p_blurEffectGroupName;
    v7 = [(SLAttributionView *)self pillView];
    [v7 setBlurEffectGroupName:v6];
  }
}

- (BOOL)_crossPlatformIsRTL
{
  v2 = [(SLAttributionView *)self traitCollection];
  BOOL v3 = [v2 layoutDirection] == 1;

  return v3;
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    [(SLAttributionView *)self _setHostsLayoutEngine:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)SLAttributionView;
  [(SLAttributionView *)&v5 setTranslatesAutoresizingMaskIntoConstraints:v3];
}

- (void)layoutSubviews
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_19BE17000, v0, OS_LOG_TYPE_DEBUG, "[SLAttributionView: %p] Frame width is currently 0.0, we will not layout remote content with this width.", v1, 0xCu);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SLAttributionView *)self frame];
  v18.origin.double x = v8;
  v18.origin.double y = v9;
  v18.size.double width = v10;
  v18.size.double height = v11;
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  if (!CGRectEqualToRect(v16, v18) && width <= 0.0)
  {
    [(SLAttributionView *)self frame];
    v12 = SL_NSStringFromRect(v17);
    double v13 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SLAttributionView setFrame:]();
    }
  }
  [(SLAttributionView *)self _minHeightForCurrentStyle];
  v15.receiver = self;
  v15.super_class = (Class)SLAttributionView;
  -[SLAttributionView setFrame:](&v15, sel_setFrame_, x, y, width, fmax(v14, height));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = [(SLAttributionView *)self pillView];
  [v4 expectedHeightForMaxWidth:width];
  double v6 = v5;

  double v7 = width;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(SLAttributionView *)self frame];
  double v4 = v3;
  [(SLAttributionView *)self _minHeightForCurrentStyle];
  double v6 = v5;
  double v7 = v4;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (void)prepareLayout
{
  [(SLAttributionView *)self frame];
  [(SLAttributionView *)self prepareLayoutWithMaxWidth:v3];
}

- (void)prepareLayoutWithMaxWidth:(double)a3
{
  if (self->_enablesMarquee) {
    double v5 = 10000.0;
  }
  else {
    double v5 = a3;
  }
  if ([(SLAttributionView *)self usesBannerLayout])
  {
    double v6 = [(SLAttributionView *)self closeButton];
    [v6 frame];
    double v5 = fmax(v5 - v7 + -8.0, 0.0);

    double v8 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SLAttributionView prepareLayoutWithMaxWidth:]();
    }
  }
  if (a3 <= 0.0)
  {
    objc_super v15 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SLAttributionView prepareLayoutWithMaxWidth:](v15);
    }
  }
  else
  {
    CGFloat v9 = [(SLAttributionView *)self pillView];
    [v9 maxWidth];
    BOOL v11 = SL_CGFloatApproximatelyEqualToFloat(v5, v10);

    if (!v11)
    {
      v12 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[SLAttributionView prepareLayoutWithMaxWidth:]();
      }

      double v13 = [(SLAttributionView *)self pillView];
      [v13 setMaxWidth:v5];

      double v14 = [(SLAttributionView *)self pillView];
      [v14 setRemoteRenderingEnabled:1];

      [(SLAttributionView *)self _crossPlatformNeedsUpdateConstraints];
      [(SLAttributionView *)self _sanitizeFrameIfNecessaryForTAMIC];
    }
  }
}

- (void)feedbackForCloseButtonHit
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLAttributionView %p]:  _closeButtonTapped", v2, v3, v4, v5, v6);
}

void __46__SLAttributionView_feedbackForCloseButtonHit__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint8_t v6 = SLFrameworkLogHandle();
  double v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      CGFloat v9 = [*(id *)(a1 + 40) identifier];
      int v10 = 134218242;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      double v13 = v9;
      _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_INFO, "[SLHighlightPillView %p] _hideMenuItemSelected: Sent hide feedback for highlight: %@. Posting highlights deleted notification.", (uint8_t *)&v10, 0x16u);
    }
    notify_post("com.apple.spotlight.SyndicatedContentDeleted");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__SLAttributionView_feedbackForCloseButtonHit__block_invoke_cold_1(a1, (uint64_t)v5, v7);
    }
  }
}

- (void)_sanitizeFrameIfNecessaryForTAMIC
{
  if ([(SLAttributionView *)self translatesAutoresizingMaskIntoConstraints])
  {
    uint64_t v3 = [(SLAttributionView *)self pillView];
    [v3 maxWidth];
    double v5 = v4;

    if (v5 != 0.0)
    {
      if (self->_enablesMarquee)
      {
        [(SLAttributionView *)self maxWidthForClippingMarquee];
        double v7 = v6;
      }
      else
      {
        uint64_t v8 = [(SLAttributionView *)self pillView];
        [v8 maxWidth];
        double v7 = v9;
      }
      [(SLAttributionView *)self _minHeightForCurrentStyle];
      double v11 = v10;
      [(SLAttributionView *)self frame];
      double v13 = fmax(v11, v12);
      [(SLAttributionView *)self frame];
      double v15 = v14;
      double v17 = v16;
      [(SLAttributionView *)self frame];
      v24.origin.double x = v18;
      v24.origin.double y = v19;
      v24.size.double width = v20;
      v24.size.double height = v21;
      v23.origin.double x = v15;
      v23.origin.double y = v17;
      v23.size.double width = v7;
      v23.size.double height = v13;
      if (!CGRectEqualToRect(v23, v24))
      {
        -[SLAttributionView setFrame:](self, "setFrame:", v15, v17, v7, v13);
      }
    }
  }
}

- (void)updateAlignment:(int64_t)a3
{
  if ([(SLAttributionView *)self preferredAlignment] != a3)
  {
    double v5 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SLAttributionView updateAlignment:]();
    }

    [(SLAttributionView *)self setPreferredAlignment:a3];
    [(SLAttributionView *)self _updateMarqueeTargetContentAlignment];
    [(SLAttributionView *)self _crossPlatformNeedsUpdateConstraints];
  }
}

- (int64_t)_alignmentEnforcingPolicies
{
  if ([(SLAttributionView *)self preferredAlignment] == -1) {
    return 0;
  }
  return [(SLAttributionView *)self preferredAlignment];
}

- (void)updateBackgroundStyle:(int64_t)a3
{
  if ([(SLAttributionView *)self preferredBackgroundStyle] != a3)
  {
    [(SLAttributionView *)self setPreferredBackgroundStyle:a3];
    double v5 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SLAttributionView updateBackgroundStyle:]();
    }

    double v6 = [(SLAttributionView *)self pillView];

    if (v6)
    {
      BOOL v7 = [(SLAttributionView *)self _backgroundStyleEnforcingPolicies] == 1;
      uint64_t v8 = [(SLAttributionView *)self pillView];
      [v8 setShouldDrawBackgroundBlur:v7];

      double v9 = [(SLAttributionView *)self _backgroundColorEnforcingPolicies];
      double v10 = [(SLAttributionView *)self pillView];
      [v10 setPreferredBackgroundColor:v9];

      [(SLAttributionView *)self _crossPlatformNeedsLayout];
    }
  }
}

- (int64_t)_backgroundStyleEnforcingPolicies
{
  BOOL v3 = [(SLAttributionView *)self preferredBackgroundStyle] == 1;
  return v3 & ~[(SLAttributionView *)self _hasiOSBannerVariant];
}

- (BOOL)_hasiOSBannerVariant
{
  return ([(SLAttributionView *)self variant] & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (void)updateInterfaceStyle:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = a3 == 0;
  }
  [(SLAttributionView *)self setOverrideUserInterfaceStyle:v3];
}

- (void)updateBackgroundColor:(id)a3
{
  id v4 = a3;
  double v5 = [(SLAttributionView *)self preferredBackgroundColor];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    [(SLAttributionView *)self setPreferredBackgroundColor:v4];
    BOOL v7 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SLAttributionView updateBackgroundColor:]();
    }

    uint64_t v8 = [(SLAttributionView *)self pillView];

    if (v8)
    {
      double v9 = [(SLAttributionView *)self _backgroundColorEnforcingPolicies];
      double v10 = [(SLAttributionView *)self pillView];
      [v10 setPreferredBackgroundColor:v9];

      [(SLAttributionView *)self _crossPlatformNeedsLayout];
    }
  }
}

- (id)_backgroundColorEnforcingPolicies
{
  uint64_t v3 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  int64_t v4 = [(SLAttributionView *)self _backgroundStyleEnforcingPolicies];
  if ([(SLAttributionView *)self _hasiOSBannerVariant]
    || v4
    || ([(SLAttributionView *)self preferredBackgroundColor],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    char v6 = [(SLAttributionView *)self preferredBackgroundColor];
    if (v6) {
      [(SLAttributionView *)self preferredBackgroundColor];
    }
    else {
    id v7 = [MEMORY[0x1E4FB1618] clearColor];
    }
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

- (void)setHideMenuItemTitle:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_hideMenuItemTitle = &self->_hideMenuItemTitle;
  if (![(NSString *)self->_hideMenuItemTitle isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_hideMenuItemTitle, a3);
    if (*p_hideMenuItemTitle)
    {
      id v7 = *p_hideMenuItemTitle;
    }
    else
    {
      uint64_t v8 = SLFrameworkBundle();
      id v7 = [v8 localizedStringForKey:@"HIDE_CONTEXTMENU" value:&stru_1EEC19158 table:@"SocialLayer"];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    double v9 = [(SLAttributionView *)self pillView];
    double v10 = [v9 contextMenuItems];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          double v16 = [v15 identifier];
          int v17 = [v16 isEqualToString:@"slHideMenuItem"];

          if (v17)
          {
            [v15 setTitle:v7];
            goto LABEL_15;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
}

+ (void)presentTranscriptForAttributionIdentifier:(id)a3 presentingViewController:(id)a4
{
}

+ (void)presentTranscriptForAttributionIdentifier:(id)a3 attachmentGUID:(id)a4 presentingViewController:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_INFO, "Trying to present Messages Transcript for identifier : %@ and view controller: %@", (uint8_t *)&v12, 0x16u);
  }

  if (v9)
  {
    uint64_t v11 = objc_alloc_init(SLTranscriptController);
    [(SLTranscriptController *)v11 presentTranscriptForMessageGUID:v7 attachmentGUID:v8 presentingViewController:v9];
  }
  else
  {
    SLFrameworkLogHandle();
    uint64_t v11 = (SLTranscriptController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super.super.super, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_19BE17000, &v11->super.super.super, OS_LOG_TYPE_INFO, "Presenting view controller is nil. Returning.", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)useBannerLayout
{
  if (![(SLAttributionView *)self usesBannerLayout])
  {
    [(SLAttributionView *)self setUsesBannerLayout:1];
    BOOL v3 = [(SLAttributionView *)self _backgroundStyleEnforcingPolicies] == 1;
    int64_t v4 = [(SLAttributionView *)self pillView];
    [v4 setShouldDrawBackgroundBlur:v3];

    id v5 = [(SLAttributionView *)self _backgroundColorEnforcingPolicies];
    char v6 = [(SLAttributionView *)self pillView];
    [v6 setPreferredBackgroundColor:v5];

    if (!self->_closeButton) {
      [(SLAttributionView *)self loadCloseButton];
    }
    [(SLAttributionView *)self _crossPlatformNeedsLayout];
  }
}

- (id)contextMenuItems
{
  uint64_t v2 = [(SLAttributionView *)self pillView];
  BOOL v3 = [v2 contextMenuItems];

  return v3;
}

- (void)excludeContextMenuItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    id v5 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SLAttributionView excludeContextMenuItemsWithIdentifiers:]();
    }
  }
  char v6 = [(SLAttributionView *)self pillView];
  [v6 excludeContextMenuItemsWithIdentifiers:v4];
}

- (unint64_t)variant
{
  if ([(SLAttributionView *)self usesBannerLayout])
  {
    if ([(SLAttributionView *)self isCollaboration]) {
      return 7;
    }
    else {
      return 6;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    LODWORD(result) = [(SLAttributionView *)self isCollaboration];
    unint64_t v6 = 2;
    if (result) {
      unint64_t v6 = 3;
    }
    if (v5 == 5) {
      return v6;
    }
    else {
      return result;
    }
  }
}

- (double)_minHeightForCurrentStyle
{
  BOOL v3 = [(SLAttributionView *)self pillView];
  id v4 = [(SLAttributionView *)self pillView];
  [v4 maxWidth];
  objc_msgSend(v3, "expectedHeightForMaxWidth:");
  double v6 = v5;

  return v6;
}

- (void)updateConstraints
{
  v88.receiver = self;
  v88.super_class = (Class)SLAttributionView;
  [(SLAttributionView *)&v88 updateConstraints];
  BOOL v3 = [(SLAttributionView *)self pillView];
  v87 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  if (([(SLAttributionView *)self translatesAutoresizingMaskIntoConstraints] & 1) == 0)
  {
    double v5 = [(SLAttributionView *)self pillView];

    if (v5)
    {
      if (self->_enablesMarquee) {
        double v6 = @"SLAttrConstraintWidthAnchorEqualToMarqueeID";
      }
      else {
        double v6 = @"SLAttrConstraintWidthAnchorEqualToPillID";
      }
      id v7 = v6;
      id v8 = [(SLAttributionView *)self heightAnchor];
      v85 = v3;
      id v9 = [v3 heightAnchor];
      double v10 = [v8 constraintGreaterThanOrEqualToAnchor:v9];

      [v10 setIdentifier:v7];
      uint64_t v11 = [(SLAttributionView *)self ourHeightConstraint];

      if (v11)
      {
        int v12 = [(SLAttributionView *)self ourHeightConstraint];
        id v13 = [v12 identifier];
        __int16 v14 = [v10 identifier];
        char v15 = [v13 isEqualToString:v14];

        if (v15) {
          goto LABEL_10;
        }
        uint64_t v16 = [(SLAttributionView *)self ourHeightConstraint];
        [v87 addObject:v16];
      }
      [(SLAttributionView *)self setOurHeightConstraint:v10];
      int v17 = [(SLAttributionView *)self ourHeightConstraint];
      [v4 addObject:v17];

LABEL_10:
      long long v18 = [(SLAttributionView *)self widthAnchor];
      BOOL v3 = v85;
      long long v19 = [v85 widthAnchor];
      long long v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19];

      [v20 setIdentifier:v7];
      long long v21 = [(SLAttributionView *)self ourWidthConstraint];

      if (v21)
      {
        v22 = [(SLAttributionView *)self ourWidthConstraint];
        uint64_t v23 = [v22 identifier];
        CGRect v24 = [v20 identifier];
        char v25 = [v23 isEqualToString:v24];

        BOOL v3 = v85;
        if (v25)
        {
LABEL_14:

          goto LABEL_21;
        }
        objc_super v26 = [(SLAttributionView *)self ourWidthConstraint];
        [v87 addObject:v26];
      }
      [(SLAttributionView *)self setOurWidthConstraint:v20];
      v27 = [(SLAttributionView *)self ourWidthConstraint];
      [v4 addObject:v27];

      goto LABEL_14;
    }
  }
  uint64_t v28 = [(SLAttributionView *)self ourHeightConstraint];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(SLAttributionView *)self ourHeightConstraint];
    int v31 = [v30 isActive];

    if (v31)
    {
      v32 = [(SLAttributionView *)self ourHeightConstraint];
      [v87 addObject:v32];

      [(SLAttributionView *)self setOurHeightConstraint:0];
    }
  }
  uint64_t v33 = [(SLAttributionView *)self ourWidthConstraint];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(SLAttributionView *)self ourWidthConstraint];
    int v36 = [v35 isActive];

    if (v36)
    {
      v37 = [(SLAttributionView *)self ourWidthConstraint];
      [v87 addObject:v37];

      [(SLAttributionView *)self setOurWidthConstraint:0];
    }
  }
LABEL_21:
  int64_t v38 = [(SLAttributionView *)self _alignmentEnforcingPolicies];
  if (self->_closeButton) {
    BOOL v39 = [(SLAttributionView *)self usesBannerLayout];
  }
  else {
    BOOL v39 = 0;
  }
  BOOL v86 = v39;
  if (v38 == 2)
  {
    if (v39)
    {
      v46 = [(SLAttributionView *)self closeButton];
      v47 = [v46 trailingAnchor];
      v48 = [(SLAttributionView *)self trailingAnchor];
      v45 = [v47 constraintEqualToAnchor:v48];

      v49 = [v3 trailingAnchor];
      v50 = [(SLAttributionView *)self closeButton];
      v51 = [v50 leadingAnchor];
      v42 = [v49 constraintEqualToAnchor:v51 constant:-8.0];
    }
    else
    {
      v49 = [v3 trailingAnchor];
      v50 = [(SLAttributionView *)self trailingAnchor];
      v42 = [v49 constraintEqualToAnchor:v50];
      v45 = 0;
    }

    v61 = @"SLAttributionViewClient-PillTrailing";
LABEL_39:
    [v42 setIdentifier:v61];
    goto LABEL_40;
  }
  if (v38)
  {
    if (v39)
    {
      v52 = [(SLAttributionView *)self closeButton];
      v53 = [v52 leadingAnchor];
      v54 = [v3 trailingAnchor];
      v45 = [v53 constraintEqualToAnchor:v54 constant:8.0];

      LODWORD(v52) = [(SLAttributionView *)self _crossPlatformIsRTL];
      [(UIButton *)self->_closeButton intrinsicContentSize];
      double v56 = v55 + 8.0;
      double v57 = -0.5;
      if (v52) {
        double v57 = 0.5;
      }
      double v58 = v56 * v57;
      v59 = [v3 centerXAnchor];
      v60 = [(SLAttributionView *)self centerXAnchor];
      v42 = [v59 constraintEqualToAnchor:v60 constant:v58];
    }
    else
    {
      v59 = [v3 centerXAnchor];
      v60 = [(SLAttributionView *)self centerXAnchor];
      v42 = [v59 constraintEqualToAnchor:v60];
      v45 = 0;
    }

    v61 = @"SLAttributionViewClient-PillCenter";
    goto LABEL_39;
  }
  v40 = [v3 leadingAnchor];
  v41 = [(SLAttributionView *)self leadingAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];

  [v42 setIdentifier:@"SLAttributionViewClient-PillLeading"];
  if (v39)
  {
    v43 = [(UIButton *)self->_closeButton leadingAnchor];
    v44 = [v3 trailingAnchor];
    v45 = [v43 constraintEqualToAnchor:v44 constant:8.0];
  }
  else
  {
    v45 = 0;
  }
LABEL_40:
  v62 = [(SLAttributionView *)self pillHorizontalAlignmentConstraint];

  if (!v62)
  {
LABEL_43:
    [(SLAttributionView *)self setPillHorizontalAlignmentConstraint:v42];
    v67 = [(SLAttributionView *)self pillHorizontalAlignmentConstraint];
    [v4 addObject:v67];

    goto LABEL_44;
  }
  v63 = [(SLAttributionView *)self pillHorizontalAlignmentConstraint];
  uint64_t v64 = [v63 firstAttribute];
  uint64_t v65 = [v42 firstAttribute];

  if (v64 != v65)
  {
    v66 = [(SLAttributionView *)self pillHorizontalAlignmentConstraint];
    [v87 addObject:v66];

    goto LABEL_43;
  }
LABEL_44:
  v68 = [(SLAttributionView *)self closeButtonXDimensionConstraint];

  if (v68 || !v45)
  {
    v70 = [(SLAttributionView *)self closeButtonXDimensionConstraint];
    if (!v70 || !v45)
    {
      v69 = v45;
      goto LABEL_52;
    }
    v71 = [(SLAttributionView *)self closeButtonXDimensionConstraint];
    uint64_t v72 = [v71 firstAttribute];
    v69 = v45;
    uint64_t v73 = [v45 firstAttribute];
    v74 = v3;
    uint64_t v75 = v73;

    BOOL v76 = v72 == v75;
    BOOL v3 = v74;
    if (v76) {
      goto LABEL_53;
    }
    v77 = [(SLAttributionView *)self closeButtonXDimensionConstraint];
    [v87 addObject:v77];

    v45 = v69;
  }
  v69 = v45;
  [(SLAttributionView *)self setCloseButtonXDimensionConstraint:v45];
  v70 = [(SLAttributionView *)self closeButtonXDimensionConstraint];
  [v4 addObject:v70];
LABEL_52:

LABEL_53:
  v78 = [(SLAttributionView *)self pillCenterYConstraint];
  char v79 = [v78 isActive];

  if ((v79 & 1) == 0)
  {
    v80 = [(SLAttributionView *)self pillCenterYConstraint];
    [v4 addObject:v80];
  }
  if (v86 && !self->_closeButtonVerticalConstraint)
  {
    v81 = [(UIButton *)self->_closeButton centerYAnchor];
    v82 = [(SLAttributionView *)self centerYAnchor];
    v83 = [v81 constraintEqualToAnchor:v82];
    closeButtonVerticalConstraint = self->_closeButtonVerticalConstraint;
    self->_closeButtonVerticalConstraint = v83;

    [v4 addObject:self->_closeButtonVerticalConstraint];
  }
  if ([v87 count]) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v87];
  }
  if ([v4 count]) {
    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    double v6 = [(SLAttributionView *)self pillView];
    [v6 refreshContextMenuItems];

    double v5 = obj;
  }
}

- (void)setSupplementalMenu:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_supplementalMenu] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_supplementalMenu, a3);
    double v5 = [(SLAttributionView *)self pillView];
    [v5 refreshContextMenuItems];
  }
}

- (id)additionalContextMenuItemsForHighlightPillView:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  double v5 = [(SLAttributionView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SLAttributionView *)self delegate];
    id v8 = [v7 contextMenuItemsForAttributionView:self];
    uint64_t v9 = [v8 mutableCopy];

    id v4 = (void *)v9;
  }
  double v10 = [(SLAttributionView *)self supplementalMenu];

  if (v10)
  {
    uint64_t v11 = [(SLAttributionView *)self supplementalMenu];
    [v4 addObject:v11];
  }
  uint64_t v12 = [v4 count];
  id v13 = SLFrameworkLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14) {
      -[SLAttributionView additionalContextMenuItemsForHighlightPillView:](v4, v13);
    }
  }
  else if (v14)
  {
    -[SLAttributionView additionalContextMenuItemsForHighlightPillView:](v13);
  }

  return v4;
}

- (void)highlightPillViewDidLoadNewRemoteContent:(id)a3
{
  [(SLAttributionView *)self _crossPlatformNeedsUpdateConstraints];
  [(SLAttributionView *)self _sanitizeFrameIfNecessaryForTAMIC];
  [(SLAttributionView *)self _updateMarqueeRequiredIfNecessary];
}

- (void)setEnablesMarquee:(BOOL)a3
{
  self->_enablesMarquee = 0;
}

- (void)setMarqueeRequired:(BOOL)a3
{
  self->_marqueeRequired = 0;
}

- (void)_updateMarqueeRequiredIfNecessary
{
  if (self->_enablesMarquee)
  {
    [(SLAttributionView *)self bounds];
    double v4 = v3;
    id v6 = [(SLAttributionView *)self pillView];
    [v6 frame];
    [(SLAttributionView *)self setMarqueeRequired:v4 < v5];
  }
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_19BE17000, v0, OS_LOG_TYPE_DEBUG, "[SLAttributionView: %p] dealloc", v1, 0xCu);
}

- (SLAttributionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SLAttributionViewDelegate *)WeakRetained;
}

- (BOOL)enablesMarquee
{
  return self->_enablesMarquee;
}

- (NSString)blurEffectGroupName
{
  return self->_blurEffectGroupName;
}

- (NSString)hideMenuItemTitle
{
  return self->_hideMenuItemTitle;
}

- (UIMenu)supplementalMenu
{
  return self->_supplementalMenu;
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
}

- (BOOL)isCollaboration
{
  return self->_isCollaboration;
}

- (void)setIsCollaboration:(BOOL)a3
{
  self->_isCollaboration = a3;
}

- (SLHighlightPillView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
}

- (int64_t)preferredAlignment
{
  return self->_preferredAlignment;
}

- (void)setPreferredAlignment:(int64_t)a3
{
  self->_preferredAlignment = a3;
}

- (int64_t)preferredBackgroundStyle
{
  return self->_preferredBackgroundStyle;
}

- (void)setPreferredBackgroundStyle:(int64_t)a3
{
  self->_preferredBackgroundStyle = a3;
}

- (UIColor)preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (void)setPreferredBackgroundColor:(id)a3
{
}

- (BOOL)usesBannerLayout
{
  return self->_usesBannerLayout;
}

- (void)setUsesBannerLayout:(BOOL)a3
{
  self->_usesBannerLayout = a3;
}

- (NSLayoutConstraint)ourWidthConstraint
{
  return self->_ourWidthConstraint;
}

- (void)setOurWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)ourHeightConstraint
{
  return self->_ourHeightConstraint;
}

- (void)setOurHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)pillCenterYConstraint
{
  return self->_pillCenterYConstraint;
}

- (void)setPillCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)pillHorizontalAlignmentConstraint
{
  return self->_pillHorizontalAlignmentConstraint;
}

- (void)setPillHorizontalAlignmentConstraint:(id)a3
{
}

- (NSLayoutConstraint)closeButtonXDimensionConstraint
{
  return self->_closeButtonXDimensionConstraint;
}

- (void)setCloseButtonXDimensionConstraint:(id)a3
{
}

- (NSLayoutConstraint)closeButtonVerticalConstraint
{
  return self->_closeButtonVerticalConstraint;
}

- (void)setCloseButtonVerticalConstraint:(id)a3
{
}

- (double)maxWidthForClippingMarquee
{
  return self->_maxWidthForClippingMarquee;
}

- (void)setMaxWidthForClippingMarquee:(double)a3
{
  self->_maxWidthForClippingMarquee = a3;
}

- (BOOL)marqueeRequired
{
  return self->_marqueeRequired;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_closeButtonVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonXDimensionConstraint, 0);
  objc_storeStrong((id *)&self->_pillHorizontalAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_pillCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_ourHeightConstraint, 0);
  objc_storeStrong((id *)&self->_ourWidthConstraint, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_supplementalMenu, 0);
  objc_storeStrong((id *)&self->_hideMenuItemTitle, 0);
  objc_storeStrong((id *)&self->_blurEffectGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithHighlight:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v5 = [a2 identifier];
  int v6 = 134218242;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_19BE17000, a3, OS_LOG_TYPE_DEBUG, "[SLAttributionView: %p] Initializing with with highlight: [%@].", (uint8_t *)&v6, 0x16u);
}

- (void)setFrame:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_3(&dword_19BE17000, v0, v1, "[SLAttributionView: %p] frame width was set to 0.0. Content will not display and remote content will not be updated until a non-zero width is set. Previous frame was [%@]");
}

- (void)prepareLayoutWithMaxWidth:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_19BE17000, v0, OS_LOG_TYPE_DEBUG, "[SLAttributionView: %p] Received a new max width, updating the pill view. New width: [%f]", v1, 0x16u);
}

- (void)prepareLayoutWithMaxWidth:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "prepareLayoutWithMaxWidth: called with a frame with 0 width. This will cause the pill to not render.", v1, 2u);
}

- (void)prepareLayoutWithMaxWidth:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_19BE17000, v0, OS_LOG_TYPE_DEBUG, "[SLAttributionView: %p] Updating the frame for the close button. New width: [%f]", v1, 0x16u);
}

void __46__SLAttributionView_feedbackForCloseButtonHit__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = [*(id *)(a1 + 40) identifier];
  int v7 = 134218498;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_19BE17000, a3, OS_LOG_TYPE_ERROR, "[SLHighlightPillView %p] _hideMenuItemSelected error sending hide feedback for highlight: [%@] error: [%@].", (uint8_t *)&v7, 0x20u);
}

- (void)updateAlignment:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_3(&dword_19BE17000, v0, v1, "[SLAttributionView: %p] Client updated the preferred alignment: %ld", v2, v3);
}

- (void)updateBackgroundStyle:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_3(&dword_19BE17000, v0, v1, "[SLAttributionView: %p] Client updated the preferred background style to: %ld", v2, v3);
}

- (void)updateBackgroundColor:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_3(&dword_19BE17000, v0, v1, "[SLAttributionView: %p] Client updated the preferred background color to: %@");
}

- (void)excludeContextMenuItemsWithIdentifiers:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "Not excluding context menu items with identifiers: %@", v2, v3, v4, v5, v6);
}

- (void)additionalContextMenuItemsForHighlightPillView:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_19BE17000, log, OS_LOG_TYPE_DEBUG, "No additional context menu items from delegate", v1, 2u);
}

- (void)additionalContextMenuItemsForHighlightPillView:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_19BE17000, a2, OS_LOG_TYPE_DEBUG, "%lu additional context menu items from delegate", v3, 0xCu);
}

@end