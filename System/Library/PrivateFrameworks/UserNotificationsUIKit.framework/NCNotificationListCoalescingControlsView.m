@interface NCNotificationListCoalescingControlsView
+ (NSString)labelTextStyle;
+ (double)preferredHeight;
- (BOOL)_isClearButtonExpanded;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)dismissModalFullScreenIfNeeded;
- (BOOL)isFooterCell;
- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationListCoalescingControlsViewDelegate)delegate;
- (NCToggleControlPair)toggleControlPair;
- (NSString)clearAllText;
- (NSString)materialGroupNameBase;
- (UIEdgeInsets)_edgeInsets;
- (_UILegibilitySettings)legibilitySettings;
- (double)_cornerRadius;
- (double)_effectiveButtonHeight;
- (double)_effectiveHorizontalPadding;
- (double)_effectiveValue:(double)a3;
- (double)_effectiveVerticalPadding;
- (double)_imageDimension;
- (id)_clearButton;
- (id)_clearButtonTitle;
- (id)_newClearButton;
- (id)_newRestackButton;
- (id)_restackButtonTitle;
- (id)containerViewForToggleControlClickInteractionPresentedContent:(id)a3;
- (void)_configureToggleControlPairIfNecessary;
- (void)_handleClearAll:(id)a3;
- (void)_handleClearPrimaryAction:(id)a3;
- (void)_handleClearTouchUpInside:(id)a3;
- (void)_handleRestackPrimaryAction:(id)a3;
- (void)_handleRestackTouchUpInside:(id)a3;
- (void)_layoutToggleControlPair;
- (void)layoutSubviews;
- (void)resetClearButtonStateAnimated:(BOOL)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setClearAllText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectiveButtonHeight:(double)a3;
- (void)setEffectiveHorizontalPadding:(double)a3;
- (void)setEffectiveVerticalPadding:(double)a3;
- (void)setFooterCell:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setToggleControlPair:(id)a3;
- (void)toggleControlDidBeginClickInteraction:(id)a3;
- (void)toggleControlDidDismssClickInteractionPresentedContent:(id)a3;
- (void)toggleControlDidPresentClickInteractionPresentedContent:(id)a3;
@end

@implementation NCNotificationListCoalescingControlsView

+ (double)preferredHeight
{
  +[NCToggleControl effectiveHeight:1];
  return result;
}

- (void)resetClearButtonStateAnimated:(BOOL)a3
{
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  v2 = [(NCNotificationListCoalescingControlsView *)self _clearButton];
  char v3 = [v2 dismissModalFullScreenIfNeeded];

  return v3;
}

- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(NCNotificationListCoalescingControlsView *)self bounds];
  -[NCNotificationListCoalescingControlsView convertRect:toView:](self, "convertRect:toView:", 0);
  v8.CGFloat x = x;
  v8.CGFloat y = y;
  BOOL v6 = CGRectContainsPoint(v9, v8);
  return [(NCNotificationListCoalescingControlsView *)self _isClearButtonExpanded] && v6;
}

+ (NSString)labelTextStyle
{
  return (NSString *)(id)*MEMORY[0x1E4FB28F0];
}

- (void)setClearAllText:(id)a3
{
  objc_storeStrong((id *)&self->_clearAllText, a3);
  id v5 = a3;
  [(NCToggleControlPair *)self->_toggleControlPair setClearAllText:v5];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListCoalescingControlsView;
  [(NCNotificationListCoalescingControlsView *)&v3 layoutSubviews];
  [(NCNotificationListCoalescingControlsView *)self _configureToggleControlPairIfNecessary];
  [(NCNotificationListCoalescingControlsView *)self _layoutToggleControlPair];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(NCNotificationListCoalescingControlsView *)self _configureToggleControlPairIfNecessary];
  toggleControlPair = self->_toggleControlPair;

  -[NCToggleControlPair sizeThatFits:](toggleControlPair, "sizeThatFits:", width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return [(NCToggleControlPair *)self->_toggleControlPair adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NCNotificationListCoalescingControlsView *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(NCNotificationListCoalescingControlsView *)self _configureToggleControlPairIfNecessary];
  }
  [(NCToggleControlPair *)self->_toggleControlPair setAdjustsFontForContentSizeCategory:v3];
  if (v5 != [(NCNotificationListCoalescingControlsView *)self adjustsFontForContentSizeCategory])
  {
    toggleControlPair = self->_toggleControlPair;
    [(NCToggleControlPair *)toggleControlPair adjustForContentSizeCategoryChange];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  [(NCToggleControlPair *)self->_toggleControlPair adjustForContentSizeCategoryChange];
  toggleControlPair = self->_toggleControlPair;

  return [(NCToggleControlPair *)toggleControlPair adjustsFontForContentSizeCategory];
}

- (void)setMaterialGroupNameBase:(id)a3
{
  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  id v5 = a3;
  [(NCToggleControlPair *)self->_toggleControlPair setMaterialGroupNameBase:v5];
}

- (id)containerViewForToggleControlClickInteractionPresentedContent:(id)a3
{
  v4 = [(NCNotificationListCoalescingControlsView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 containerViewForCoalescingControlsPreviewInteractionPresentedContent:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)toggleControlDidBeginClickInteraction:(id)a3
{
  id v4 = [(NCNotificationListCoalescingControlsView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListCoalescingControlsViewDidBeginPreviewInteraction:self];
  }
}

- (void)toggleControlDidPresentClickInteractionPresentedContent:(id)a3
{
  id v4 = [(NCNotificationListCoalescingControlsView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListCoalescingControlsViewDidPresentPreviewInteractionPresentedContent:self];
  }
}

- (void)toggleControlDidDismssClickInteractionPresentedContent:(id)a3
{
  id v4 = [(NCNotificationListCoalescingControlsView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListCoalescingControlsViewDidDismissPreviewInteractionPresentedContent:self];
  }
}

- (double)_effectiveButtonHeight
{
  double result = self->_effectiveButtonHeight;
  if (result == 0.0)
  {
    [(NCNotificationListCoalescingControlsView *)self _effectiveValue:34.0];
    self->_effectiveButtonHeight = result;
  }
  return result;
}

- (double)_effectiveHorizontalPadding
{
  double result = self->_effectiveHorizontalPadding;
  if (result == 0.0)
  {
    [(NCNotificationListCoalescingControlsView *)self _effectiveValue:12.0];
    self->_effectiveHorizontalPadding = result;
  }
  return result;
}

- (double)_effectiveVerticalPadding
{
  double result = self->_effectiveVerticalPadding;
  if (result == 0.0)
  {
    [(NCNotificationListCoalescingControlsView *)self _effectiveValue:8.0];
    self->_effectiveVerticalPadding = result;
  }
  return result;
}

- (double)_effectiveValue:(double)a3
{
  if ([(NCNotificationListCoalescingControlsView *)self adjustsFontForContentSizeCategory])
  {
    id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [v4 _scaledValueForValue:a3];
    _NCMainScreenScale();
    UIRoundToScale();
  }
  _NCMainScreenScale();

  UICeilToScale();
  return result;
}

- (double)_imageDimension
{
  [(NCNotificationListCoalescingControlsView *)self _effectiveButtonHeight];
  double v4 = v3;
  [(NCNotificationListCoalescingControlsView *)self _effectiveHorizontalPadding];
  double v6 = v4 + v5 * -2.0;
  [(NCNotificationListCoalescingControlsView *)self _effectiveButtonHeight];
  return fmin(v6, v7 * 0.5);
}

- (double)_cornerRadius
{
  [(NCNotificationListCoalescingControlsView *)self _effectiveButtonHeight];
  return v2 * 0.5;
}

- (id)_restackButtonTitle
{
  double v2 = NCUserNotificationsUIKitFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"NOTIFICATION_LIST_SHOW_LESS" value:&stru_1F2F516F8 table:0];

  return v3;
}

- (id)_clearButtonTitle
{
  double v2 = NCUserNotificationsUIKitFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR" value:&stru_1F2F516F8 table:0];

  return v3;
}

- (UIEdgeInsets)_edgeInsets
{
  [(NCNotificationListCoalescingControlsView *)self _effectiveHorizontalPadding];
  double v4 = v3;
  [(NCNotificationListCoalescingControlsView *)self _effectiveVerticalPadding];
  double v6 = v4;
  double v7 = v5;
  double v8 = v4;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (id)_newRestackButton
{
  BOOL v3 = !self->_footerCell;
  double v4 = NCUserNotificationsUIKitFrameworkBundle();
  double v5 = [v4 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR_ALL" value:&stru_1F2F516F8 table:0];
  double v6 = +[NCToggleControl showLessControlWithMaterialRecipe:1 clearAllText:v5 glyphOrientation:v3];

  [v6 setDelegate:self];
  [v6 setAnchorEdge:0];
  [v6 addTarget:self action:sel__handleRestackTouchUpInside_ forControlEvents:64];
  [v6 addTarget:self action:sel__handleRestackPrimaryAction_ forControlEvents:0x2000];
  return v6;
}

- (id)_newClearButton
{
  BOOL v3 = NCUserNotificationsUIKitFrameworkBundle();
  double v4 = [v3 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR_ALL" value:&stru_1F2F516F8 table:0];
  double v5 = +[NCToggleControl dismissControlWithMaterialRecipe:1 clearAllText:v4];

  [v5 setDelegate:self];
  [v5 setAnchorEdge:2];
  [v5 addTarget:self action:sel__handleClearTouchUpInside_ forControlEvents:64];
  [v5 addTarget:self action:sel__handleClearPrimaryAction_ forControlEvents:0x2000];
  [v5 addTarget:self forPreviewInteractionPresentedContentWithAction:sel__handleClearAll_];
  return v5;
}

- (void)_configureToggleControlPairIfNecessary
{
  if (!self->_toggleControlPair)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __82__NCNotificationListCoalescingControlsView__configureToggleControlPairIfNecessary__block_invoke;
    v2[3] = &unk_1E6A91BB0;
    v2[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
  }
}

uint64_t __82__NCNotificationListCoalescingControlsView__configureToggleControlPairIfNecessary__block_invoke(uint64_t a1)
{
  double v2 = [NCToggleControlPair alloc];
  BOOL v3 = (void *)[*(id *)(a1 + 32) _newRestackButton];
  double v4 = (void *)[*(id *)(a1 + 32) _newClearButton];
  uint64_t v5 = [(NCToggleControlPair *)v2 initWithLeadingToggleControl:v3 trailingToggleControl:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  double v7 = *(void **)(v6 + 440);
  *(void *)(v6 + 440) = v5;

  [*(id *)(*(void *)(a1 + 32) + 440) setClearAllText:*(void *)(*(void *)(a1 + 32) + 424)];
  double v8 = *(void **)(a1 + 32);
  CGRect v9 = (void *)v8[55];
  v10 = [v8 materialGroupNameBase];
  [v9 setMaterialGroupNameBase:v10];

  v11 = *(void **)(a1 + 32);
  uint64_t v12 = v11[55];

  return [v11 addSubview:v12];
}

- (void)_layoutToggleControlPair
{
  [(NCNotificationListCoalescingControlsView *)self _configureToggleControlPairIfNecessary];
  [(NCNotificationListCoalescingControlsView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[NCToggleControlPair sizeThatFits:](self->_toggleControlPair, "sizeThatFits:", v7, v9);
  double v12 = v11;
  double v14 = v13;
  char v15 = [(NCNotificationListCoalescingControlsView *)self _shouldReverseLayoutDirection];
  double v16 = 0.0;
  if ((v15 & 1) == 0)
  {
    v19.origin.CGFloat x = v4;
    v19.origin.CGFloat y = v6;
    v19.size.double width = v8;
    v19.size.double height = v10;
    double v16 = CGRectGetWidth(v19) - v12;
  }
  toggleControlPair = self->_toggleControlPair;

  -[NCToggleControlPair setFrame:](toggleControlPair, "setFrame:", v16, 0.0, v12, v14);
}

- (void)_handleRestackTouchUpInside:(id)a3
{
  if ([(NCNotificationListCoalescingControlsView *)self _isClearButtonExpanded])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained notificationListCoalescingControlsView:self didTransitionToClearState:0];
    }
  }
}

- (void)_handleRestackPrimaryAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained notificationListCoalescingControlsViewRequestsRestack:self];
  }
}

- (void)_handleClearTouchUpInside:(id)a3
{
  if (![(NCNotificationListCoalescingControlsView *)self _isClearButtonExpanded])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained notificationListCoalescingControlsView:self didTransitionToClearState:1];
    }
  }
}

- (void)_handleClearPrimaryAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained notificationListCoalescingControlsViewRequestsClear:self];
  }
}

- (void)_handleClearAll:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained notificationListCoalescingControlsViewRequestsClearAll:self];
  }
  CGFloat v4 = [(NCNotificationListCoalescingControlsView *)self _clearButton];
  [v4 dismissModalFullScreenIfNeeded];
}

- (id)_clearButton
{
  double v2 = [(NCToggleControlPair *)self->_toggleControlPair toggleControls];
  double v3 = [v2 lastObject];

  return v3;
}

- (BOOL)_isClearButtonExpanded
{
  double v2 = [(NCNotificationListCoalescingControlsView *)self _clearButton];
  char v3 = [v2 isExpanded];

  return v3;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (NSString)clearAllText
{
  return self->_clearAllText;
}

- (NCNotificationListCoalescingControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListCoalescingControlsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isFooterCell
{
  return self->_footerCell;
}

- (void)setFooterCell:(BOOL)a3
{
  self->_footerCell = a3;
}

- (NCToggleControlPair)toggleControlPair
{
  return self->_toggleControlPair;
}

- (void)setToggleControlPair:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void)setEffectiveButtonHeight:(double)a3
{
  self->_effectiveButtonHeight = a3;
}

- (void)setEffectiveHorizontalPadding:(double)a3
{
  self->_effectiveHorizontalPadding = a3;
}

- (void)setEffectiveVerticalPadding:(double)a3
{
  self->_effectiveVerticalPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_toggleControlPair, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clearAllText, 0);

  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
}

@end