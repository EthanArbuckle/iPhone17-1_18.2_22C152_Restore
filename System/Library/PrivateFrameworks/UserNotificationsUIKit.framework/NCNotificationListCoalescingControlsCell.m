@interface NCNotificationListCoalescingControlsCell
+ (double)coalescingControlsCellHeightShowingCoalescingControls:(BOOL)a3;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)dismissModalFullScreenIfNeeded;
- (BOOL)isFooterCell;
- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3;
- (BOOL)shouldShowCoalescingControls;
- (NCNotificationListCoalescingControlsHandlerDelegate)handlerDelegate;
- (NCNotificationListCoalescingControlsView)coalescingControlsView;
- (NSString)clearAllText;
- (NSString)materialGroupNameBase;
- (id)containerViewForCoalescingControlsPreviewInteractionPresentedContent:(id)a3;
- (void)_configureCoalescingControlsViewIfNecessary;
- (void)_layoutCoalescingControlsView;
- (void)layoutSubviews;
- (void)notificationListCoalescingControlsView:(id)a3 didTransitionToClearState:(BOOL)a4;
- (void)notificationListCoalescingControlsViewDidBeginPreviewInteraction:(id)a3;
- (void)notificationListCoalescingControlsViewDidDismissPreviewInteractionPresentedContent:(id)a3;
- (void)notificationListCoalescingControlsViewDidPresentPreviewInteractionPresentedContent:(id)a3;
- (void)notificationListCoalescingControlsViewRequestsClear:(id)a3;
- (void)notificationListCoalescingControlsViewRequestsClearAll:(id)a3;
- (void)notificationListCoalescingControlsViewRequestsRestack:(id)a3;
- (void)resetClearButtonStateAnimated:(BOOL)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setClearAllText:(id)a3;
- (void)setCoalescingControlsView:(id)a3;
- (void)setFooterCell:(BOOL)a3;
- (void)setHandlerDelegate:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setShouldShowCoalescingControls:(BOOL)a3;
@end

@implementation NCNotificationListCoalescingControlsCell

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListCoalescingControlsCell;
  [(NCNotificationListCoalescingControlsCell *)&v3 layoutSubviews];
  [(NCNotificationListCoalescingControlsCell *)self _configureCoalescingControlsViewIfNecessary];
  [(NCNotificationListCoalescingControlsCell *)self _layoutCoalescingControlsView];
}

- (void)setClearAllText:(id)a3
{
  objc_storeStrong((id *)&self->_clearAllText, a3);
  id v5 = a3;
  [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setClearAllText:v5];
}

- (void)resetClearButtonStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationListCoalescingControlsCell *)self coalescingControlsView];
  [v4 resetClearButtonStateAnimated:v3];
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  v2 = [(NCNotificationListCoalescingControlsCell *)self coalescingControlsView];
  char v3 = [v2 dismissModalFullScreenIfNeeded];

  return v3;
}

- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(NCNotificationListCoalescingControlsCell *)self coalescingControlsView];
  char v6 = objc_msgSend(v5, "shouldReceiveTouchAtPointInWindowSpace:", x, y);

  return v6;
}

- (void)setShouldShowCoalescingControls:(BOOL)a3
{
  if (self->_shouldShowCoalescingControls != a3)
  {
    self->_shouldShowCoalescingControls = a3;
    coalescingControlsView = self->_coalescingControlsView;
    double v4 = 0.0;
    if (a3) {
      double v4 = 1.0;
    }
    [(NCNotificationListCoalescingControlsView *)coalescingControlsView setAlpha:v4];
  }
}

+ (double)coalescingControlsCellHeightShowingCoalescingControls:(BOOL)a3
{
  if (a3) {
    double v3 = 56.0;
  }
  else {
    double v3 = 28.0;
  }
  double v4 = +[NCNotificationListCoalescingControlsView labelTextStyle];
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v4];
  [v5 _scaledValueForValue:v3];
  char v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  UIRoundToScreenScale();

  _NCMainScreenScale();
  UICeilToScale();
  double v8 = v7;

  return v8;
}

- (void)notificationListCoalescingControlsViewRequestsClear:(id)a3
{
  uint64_t v4 = [(NCNotificationListCoalescingControlsCell *)self handlerDelegate];
  if (v4)
  {
    id v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 notificationListCoalescingControlsHandlerRequestsClearingNotifications:self];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)notificationListCoalescingControlsViewRequestsClearAll:(id)a3
{
  uint64_t v4 = [(NCNotificationListCoalescingControlsCell *)self handlerDelegate];
  if (v4)
  {
    id v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 notificationListCoalescingControlsHandlerRequestsClearingAllNotifications:self];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)notificationListCoalescingControlsViewRequestsRestack:(id)a3
{
  uint64_t v4 = [(NCNotificationListCoalescingControlsCell *)self handlerDelegate];
  if (v4)
  {
    id v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 notificationListCoalescingControlsHandlerRequestsRestackingNotifications:self];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)notificationListCoalescingControlsView:(id)a3 didTransitionToClearState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(NCNotificationListCoalescingControlsCell *)self handlerDelegate];
  if (v6)
  {
    double v7 = (void *)v6;
    if (objc_opt_respondsToSelector()) {
      [v7 notificationListCoalescingControlsHandler:self didTransitionToClearState:v4];
    }
  }

  MEMORY[0x1F4181820]();
}

- (id)containerViewForCoalescingControlsPreviewInteractionPresentedContent:(id)a3
{
  BOOL v4 = [(NCNotificationListCoalescingControlsCell *)self handlerDelegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = [v4 containerViewForCoalescingControlsHandlerPreviewInteractionPresentedContent:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)notificationListCoalescingControlsViewDidBeginPreviewInteraction:(id)a3
{
  id v4 = [(NCNotificationListCoalescingControlsCell *)self handlerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListCoalescingControlsHandlerDidBeginPreviewInteraction:self];
  }
}

- (void)notificationListCoalescingControlsViewDidPresentPreviewInteractionPresentedContent:(id)a3
{
  id v4 = [(NCNotificationListCoalescingControlsCell *)self handlerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListCoalescingControlsHandlerDidPresentPreviewInteractionPresentedContent:self];
  }
}

- (void)notificationListCoalescingControlsViewDidDismissPreviewInteractionPresentedContent:(id)a3
{
  id v4 = [(NCNotificationListCoalescingControlsCell *)self handlerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListCoalescingControlsHandlerDidDismissPreviewInteractionPresentedContent:self];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategordouble y = a3;
    -[NCNotificationListCoalescingControlsView setAdjustsFontForContentSizeCategory:](self->_coalescingControlsView, "setAdjustsFontForContentSizeCategory:");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(NCNotificationListCoalescingControlsCell *)self adjustsFontForContentSizeCategory];
  if (v3)
  {
    BOOL v3 = [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView adjustForContentSizeCategoryChange];
    if (v3)
    {
      [(NCNotificationListCoalescingControlsCell *)self setNeedsLayout];
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  p_materialGroupNameBase = &self->_materialGroupNameBase;
  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  id v6 = a3;
  [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setMaterialGroupNameBase:*p_materialGroupNameBase];
}

- (void)_configureCoalescingControlsViewIfNecessary
{
  if (!self->_coalescingControlsView)
  {
    BOOL v3 = [NCNotificationListCoalescingControlsView alloc];
    [(NCNotificationListCoalescingControlsCell *)self bounds];
    id v4 = -[NCNotificationListCoalescingControlsView initWithFrame:](v3, "initWithFrame:");
    coalescingControlsView = self->_coalescingControlsView;
    self->_coalescingControlsView = v4;

    [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setFooterCell:self->_footerCell];
    [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setDelegate:self];
    id v6 = self->_coalescingControlsView;
    double v7 = [(NCNotificationListCoalescingControlsCell *)self materialGroupNameBase];
    [(NCNotificationListCoalescingControlsView *)v6 setMaterialGroupNameBase:v7];

    [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setClearAllText:self->_clearAllText];
    [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setAdjustsFontForContentSizeCategory:[(NCNotificationListCoalescingControlsCell *)self adjustsFontForContentSizeCategory]];
    double v8 = 1.0;
    if (!self->_shouldShowCoalescingControls) {
      double v8 = 0.0;
    }
    [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setAlpha:v8];
    v9 = self->_coalescingControlsView;
    [(NCNotificationListCoalescingControlsCell *)self addSubview:v9];
  }
}

- (void)_layoutCoalescingControlsView
{
  [(NCNotificationListCoalescingControlsCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  -[NCNotificationListCoalescingControlsView sizeThatFits:](self->_coalescingControlsView, "sizeThatFits:", v8, v10);
  double v16 = v15;
  double v18 = v17;
  char v19 = [(NCNotificationListCoalescingControlsCell *)self _shouldReverseLayoutDirection];
  double v20 = 0.0;
  if ((v19 & 1) == 0)
  {
    v24.origin.double x = v4;
    v24.origin.double y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    double Width = CGRectGetWidth(v24);
    v25.origin.double x = v12;
    v25.origin.double y = v14;
    v25.size.width = v16;
    v25.size.height = v18;
    double v20 = Width - CGRectGetWidth(v25);
  }
  coalescingControlsView = self->_coalescingControlsView;

  -[NCNotificationListCoalescingControlsView setFrame:](coalescingControlsView, "setFrame:", v20, 0.0, v16, v18);
}

- (NCNotificationListCoalescingControlsHandlerDelegate)handlerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handlerDelegate);

  return (NCNotificationListCoalescingControlsHandlerDelegate *)WeakRetained;
}

- (void)setHandlerDelegate:(id)a3
{
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (BOOL)shouldShowCoalescingControls
{
  return self->_shouldShowCoalescingControls;
}

- (BOOL)isFooterCell
{
  return self->_footerCell;
}

- (void)setFooterCell:(BOOL)a3
{
  self->_footerCell = a3;
}

- (NSString)clearAllText
{
  return self->_clearAllText;
}

- (NCNotificationListCoalescingControlsView)coalescingControlsView
{
  return self->_coalescingControlsView;
}

- (void)setCoalescingControlsView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingControlsView, 0);
  objc_storeStrong((id *)&self->_clearAllText, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);

  objc_destroyWeak((id *)&self->_handlerDelegate);
}

@end