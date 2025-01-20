@interface NCNotificationListCoalescingHeaderCell
+ (CGSize)_coalescingControlsViewPreferredSize;
+ (double)coalescingHeaderCellHeightForWidth:(double)a3 title:(id)a4;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)dismissModalFullScreenIfNeeded;
- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3;
- (CGRect)_coalescingControlsViewFrameForBounds:(CGRect)a3;
- (NCNotificationListCoalescingControlsHandlerDelegate)handlerDelegate;
- (NCNotificationListCoalescingControlsView)coalescingControlsView;
- (NCNotificationListHeaderTitleView)headerTitleView;
- (NSString)clearAllText;
- (NSString)materialGroupNameBase;
- (NSString)title;
- (_UILegibilitySettings)legibilitySettings;
- (id)containerViewForCoalescingControlsPreviewInteractionPresentedContent:(id)a3;
- (void)_configureCoalescingControlsViewIfNecessary;
- (void)_configureHeaderTitleViewIfNecessary;
- (void)_contentSizeCategoryDidChange;
- (void)_layoutCoalescingControlsView;
- (void)_layoutHeaderTitleView;
- (void)adjustForLegibilitySettingsChange:(id)a3;
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
- (void)setHandlerDelegate:(id)a3;
- (void)setHeaderTitleView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCNotificationListCoalescingHeaderCell

+ (CGSize)_coalescingControlsViewPreferredSize
{
  double v3 = *((double *)&__coalescingControlsViewPreferredSize + 1);
  double v2 = *(double *)&__coalescingControlsViewPreferredSize;
  if (*(double *)&__coalescingControlsViewPreferredSize == 0.0
    && *((double *)&__coalescingControlsViewPreferredSize + 1) == 0.0)
  {
    v4 = objc_alloc_init(NCNotificationListCoalescingControlsView);
    [(NCNotificationListCoalescingControlsView *)v4 setAdjustsFontForContentSizeCategory:1];
    -[NCNotificationListCoalescingControlsView sizeThatFits:](v4, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    *(void *)&__coalescingControlsViewPreferredSize = v5;
    *((void *)&__coalescingControlsViewPreferredSize + 1) = v6;

    double v3 = *((double *)&__coalescingControlsViewPreferredSize + 1);
    double v2 = *(double *)&__coalescingControlsViewPreferredSize;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)coalescingHeaderCellHeightForWidth:(double)a3 title:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v7 = *MEMORY[0x1E4FB2990];
  id v8 = a4;
  v9 = [v6 preferredFontForTextStyle:v7];
  v10 = (id *)MEMORY[0x1E4FB2608];
  v11 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  _NCSizeCategoryIsAX(v11);

  if (!coalescingHeaderCellHeightForWidth_title____drawingContext)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4FB0860]);
    v13 = (void *)coalescingHeaderCellHeightForWidth_title____drawingContext;
    coalescingHeaderCellHeightForWidth_title____drawingContext = (uint64_t)v12;

    [(id)coalescingHeaderCellHeightForWidth_title____drawingContext setWantsNumberOfLineFragments:1];
  }
  [a1 _coalescingControlsViewPreferredSize];
  double v15 = v14;
  [*v10 activeInterfaceOrientation];
  double v16 = v15 + 0.0;
  uint64_t v17 = [*v10 activeInterfaceOrientation];
  double v18 = 6.0;
  if ((unint64_t)(v17 - 1) < 2) {
    double v18 = 10.0;
  }
  double v19 = a3 - (v16 + v18);
  uint64_t v24 = *MEMORY[0x1E4FB06F8];
  v25[0] = v9;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 1, v20, coalescingHeaderCellHeightForWidth_title____drawingContext, v19, 0.0);

  [v9 lineHeight];
  [(id)coalescingHeaderCellHeightForWidth_title____drawingContext numberOfLineFragments];
  _NCMainScreenScale();
  UICeilToScale();
  double v22 = v21;

  return v22;
}

- (void)resetClearButtonStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationListCoalescingHeaderCell *)self coalescingControlsView];
  [v4 resetClearButtonStateAnimated:v3];
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  double v2 = [(NCNotificationListCoalescingHeaderCell *)self coalescingControlsView];
  char v3 = [v2 dismissModalFullScreenIfNeeded];

  return v3;
}

- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(NCNotificationListCoalescingHeaderCell *)self coalescingControlsView];
  char v6 = objc_msgSend(v5, "shouldReceiveTouchAtPointInWindowSpace:", x, y);

  return v6;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(NCNotificationListHeaderTitleView *)self->_headerTitleView setTitle:v5];
}

- (void)setClearAllText:(id)a3
{
  objc_storeStrong((id *)&self->_clearAllText, a3);
  id v5 = a3;
  [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setClearAllText:v5];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListCoalescingHeaderCell;
  [(NCNotificationListCoalescingHeaderCell *)&v3 layoutSubviews];
  [(NCNotificationListCoalescingHeaderCell *)self _configureCoalescingControlsViewIfNecessary];
  [(NCNotificationListCoalescingHeaderCell *)self _configureHeaderTitleViewIfNecessary];
  [(NCNotificationListCoalescingHeaderCell *)self _layoutCoalescingControlsView];
  [(NCNotificationListCoalescingHeaderCell *)self _layoutHeaderTitleView];
}

- (void)notificationListCoalescingControlsViewRequestsClear:(id)a3
{
  uint64_t v4 = [(NCNotificationListCoalescingHeaderCell *)self handlerDelegate];
  if (v4)
  {
    id v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 notificationListCoalescingControlsHandlerRequestsClearingNotifications:self];
    }
  }

  MEMORY[0x1F4181820]();
}

- (id)containerViewForCoalescingControlsPreviewInteractionPresentedContent:(id)a3
{
  uint64_t v4 = [(NCNotificationListCoalescingHeaderCell *)self handlerDelegate];
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

- (void)notificationListCoalescingControlsViewRequestsClearAll:(id)a3
{
  uint64_t v4 = [(NCNotificationListCoalescingHeaderCell *)self handlerDelegate];
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
  uint64_t v4 = [(NCNotificationListCoalescingHeaderCell *)self handlerDelegate];
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
  uint64_t v6 = [(NCNotificationListCoalescingHeaderCell *)self handlerDelegate];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    if (objc_opt_respondsToSelector()) {
      [v7 notificationListCoalescingControlsHandler:self didTransitionToClearState:v4];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)notificationListCoalescingControlsViewDidBeginPreviewInteraction:(id)a3
{
  id v4 = [(NCNotificationListCoalescingHeaderCell *)self handlerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListCoalescingControlsHandlerDidBeginPreviewInteraction:self];
  }
}

- (void)notificationListCoalescingControlsViewDidPresentPreviewInteractionPresentedContent:(id)a3
{
  id v4 = [(NCNotificationListCoalescingHeaderCell *)self handlerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListCoalescingControlsHandlerDidPresentPreviewInteractionPresentedContent:self];
  }
}

- (void)notificationListCoalescingControlsViewDidDismissPreviewInteractionPresentedContent:(id)a3
{
  id v4 = [(NCNotificationListCoalescingHeaderCell *)self handlerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationListCoalescingControlsHandlerDidDismissPreviewInteractionPresentedContent:self];
  }
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  id v5 = a3;
  [(NCNotificationListHeaderTitleView *)self->_headerTitleView adjustForLegibilitySettingsChange:v5];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    BOOL v3 = a3;
    self->_adjustsFontForContentSizeCategordouble y = a3;
    id v5 = [(NCNotificationListCoalescingHeaderCell *)self coalescingControlsView];
    [v5 setAdjustsFontForContentSizeCategory:v3];

    id v6 = [(NCNotificationListCoalescingHeaderCell *)self headerTitleView];
    [v6 setAdjustsFontForContentSizeCategory:v3];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  if (!self->_adjustsFontForContentSizeCategory) {
    return 0;
  }
  BOOL v3 = [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView adjustForContentSizeCategoryChange];
  if (![(NCNotificationListHeaderTitleView *)self->_headerTitleView adjustForContentSizeCategoryChange]&& !v3)
  {
    return 0;
  }
  [(NCNotificationListCoalescingHeaderCell *)self setNeedsLayout];
  return 1;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  p_materialGroupNameBase = &self->_materialGroupNameBase;
  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  id v6 = a3;
  [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setMaterialGroupNameBase:*p_materialGroupNameBase];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListCoalescingHeaderCell;
  id v4 = a3;
  [(NCNotificationListCoalescingHeaderCell *)&v8 traitCollectionDidChange:v4];
  id v5 = [(NCNotificationListCoalescingHeaderCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  uint64_t v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(NCNotificationListCoalescingHeaderCell *)self _contentSizeCategoryDidChange];
  }
  [(NCNotificationListCoalescingHeaderCell *)self setNeedsLayout];
}

- (void)_contentSizeCategoryDidChange
{
  __coalescingControlsViewPreferredSize = *MEMORY[0x1E4F1DB30];
}

- (void)_configureCoalescingControlsViewIfNecessary
{
  if (!self->_coalescingControlsView)
  {
    BOOL v3 = [NCNotificationListCoalescingControlsView alloc];
    [(NCNotificationListCoalescingHeaderCell *)self bounds];
    id v4 = -[NCNotificationListCoalescingControlsView initWithFrame:](v3, "initWithFrame:");
    coalescingControlsView = self->_coalescingControlsView;
    self->_coalescingControlsView = v4;

    [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setDelegate:self];
    [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setClearAllText:self->_clearAllText];
    id v6 = self->_coalescingControlsView;
    uint64_t v7 = [(NCNotificationListCoalescingHeaderCell *)self materialGroupNameBase];
    [(NCNotificationListCoalescingControlsView *)v6 setMaterialGroupNameBase:v7];

    [(NCNotificationListCoalescingControlsView *)self->_coalescingControlsView setAdjustsFontForContentSizeCategory:[(NCNotificationListCoalescingHeaderCell *)self adjustsFontForContentSizeCategory]];
    objc_super v8 = self->_coalescingControlsView;
    [(NCNotificationListCoalescingHeaderCell *)self addSubview:v8];
  }
}

- (void)_configureHeaderTitleViewIfNecessary
{
  if (!self->_headerTitleView)
  {
    BOOL v3 = [NCNotificationListHeaderTitleView alloc];
    [(NCNotificationListCoalescingHeaderCell *)self bounds];
    id v4 = -[NCNotificationListHeaderTitleView initWithFrame:](v3, "initWithFrame:");
    headerTitleView = self->_headerTitleView;
    self->_headerTitleView = v4;

    [(NCNotificationListHeaderTitleView *)self->_headerTitleView setTitle:self->_title];
    [(NCNotificationListHeaderTitleView *)self->_headerTitleView adjustForLegibilitySettingsChange:self->_legibilitySettings];
    [(NCNotificationListHeaderTitleView *)self->_headerTitleView setAdjustsFontForContentSizeCategory:[(NCNotificationListCoalescingHeaderCell *)self adjustsFontForContentSizeCategory]];
    [(NCNotificationListCoalescingHeaderCell *)self addSubview:self->_headerTitleView];
    id v6 = self->_headerTitleView;
    [(NCNotificationListCoalescingHeaderCell *)self sendSubviewToBack:v6];
  }
}

- (CGRect)_coalescingControlsViewFrameForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[NCNotificationListCoalescingControlsView sizeThatFits:](self->_coalescingControlsView, "sizeThatFits:", a3.size.width, a3.size.height);
  BSRectWithSize();
  CGFloat rect = v8;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v15 = (id *)MEMORY[0x1E4FB2608];
  double v16 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v16);

  char v18 = IsAX ^ [(NCNotificationListCoalescingHeaderCell *)self _shouldReverseLayoutDirection];
  double v19 = 0.0;
  if (IsAX)
  {
    if ((unint64_t)([*v15 activeInterfaceOrientation] - 1) >= 2) {
      double v19 = 6.0;
    }
    else {
      double v19 = 10.0;
    }
  }
  if ((v18 & 1) == 0)
  {
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double v27 = x;
    double v20 = y;
    double v21 = CGRectGetWidth(v30);
    v31.origin.CGFloat x = rect;
    v31.origin.CGFloat y = v10;
    v31.size.CGFloat width = v12;
    v31.size.CGFloat height = v14;
    double v22 = v21 - CGRectGetWidth(v31);
    CGFloat y = v20;
    CGFloat x = v27;
    double v19 = v22 - v19;
  }
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGRectGetHeight(v32);
  v33.origin.CGFloat x = v19;
  v33.origin.CGFloat y = v10;
  v33.size.CGFloat width = v12;
  v33.size.CGFloat height = v14;
  CGRectGetHeight(v33);
  _NCMainScreenScale();

  UIRectIntegralWithScale();
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (void)_layoutCoalescingControlsView
{
  [(NCNotificationListCoalescingHeaderCell *)self bounds];
  -[NCNotificationListCoalescingHeaderCell _coalescingControlsViewFrameForBounds:](self, "_coalescingControlsViewFrameForBounds:");
  coalescingControlsView = self->_coalescingControlsView;

  -[NCNotificationListCoalescingControlsView setFrame:](coalescingControlsView, "setFrame:");
}

- (void)_layoutHeaderTitleView
{
  [(NCNotificationListCoalescingHeaderCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = (id *)MEMORY[0x1E4FB2608];
  CGFloat v12 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v12);

  -[NCNotificationListCoalescingHeaderCell _coalescingControlsViewFrameForBounds:](self, "_coalescingControlsViewFrameForBounds:", v4, v6, v8, v10);
  CGFloat rect_24 = v15;
  CGFloat v40 = v14;
  CGFloat rect_8 = v16;
  CGFloat rect_16 = v17;
  if (IsAX) {
    double v18 = 12.0;
  }
  else {
    double v18 = 22.0;
  }
  headerTitleView = self->_headerTitleView;
  v44.origin.CGFloat x = v4;
  v44.origin.CGFloat y = v6;
  v44.size.CGFloat width = v8;
  v44.size.CGFloat height = v10;
  double Width = CGRectGetWidth(v44);
  v45.origin.CGFloat x = v4;
  v45.origin.CGFloat y = v6;
  v45.size.CGFloat width = v8;
  v45.size.CGFloat height = v10;
  -[NCNotificationListHeaderTitleView sizeThatFits:](headerTitleView, "sizeThatFits:", Width, CGRectGetHeight(v45) - v18);
  BSRectWithSize();
  double v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v41 = v23;
  CGFloat v42 = v27;
  if (![(NCNotificationListCoalescingHeaderCell *)self _shouldReverseLayoutDirection])
  {
    if ((unint64_t)([*v11 activeInterfaceOrientation] - 1) >= 2) {
      double v33 = 6.0;
    }
    else {
      double v33 = 10.0;
    }
    if (IsAX) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }
  v46.origin.CGFloat x = v4;
  v46.origin.CGFloat y = v6;
  v46.size.CGFloat width = v8;
  v46.size.CGFloat height = v10;
  CGFloat rect = v22;
  double v29 = CGRectGetWidth(v46);
  uint64_t v30 = [*v11 activeInterfaceOrientation];
  double v31 = 6.0;
  if ((unint64_t)(v30 - 1) < 2) {
    double v31 = 10.0;
  }
  double v32 = v29 - v31;
  v47.origin.CGFloat x = rect;
  v47.origin.CGFloat y = v24;
  v47.size.CGFloat width = v26;
  v47.size.CGFloat height = v28;
  double v33 = v32 - CGRectGetWidth(v47);
  if (!IsAX)
  {
LABEL_8:
    v48.origin.CGFloat x = v4;
    v48.origin.CGFloat y = v6;
    v48.size.CGFloat width = v8;
    v48.size.CGFloat height = v10;
    double Height = CGRectGetHeight(v48);
    v49.origin.CGFloat x = v40;
    v49.origin.CGFloat y = rect_8;
    v49.size.CGFloat width = rect_24;
    v49.size.CGFloat height = rect_16;
    if ((unint64_t)(Height / CGRectGetHeight(v49)) >= 2)
    {
      v50.origin.CGFloat x = v33;
      v50.origin.CGFloat y = v41;
      v50.size.CGFloat width = v26;
      v50.size.CGFloat height = v42;
      CGRectGetHeight(v50);
      v51.origin.CGFloat x = v40;
      v51.origin.CGFloat y = rect_8;
      v51.size.CGFloat width = rect_24;
      v51.size.CGFloat height = rect_16;
      CGRectGetHeight(v51);
    }
    UIRectCenteredYInRect();
  }
LABEL_15:
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  v35 = self->_headerTitleView;

  -[NCNotificationListHeaderTitleView setFrame:](v35, "setFrame:");
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

- (NSString)title
{
  return self->_title;
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

- (NCNotificationListHeaderTitleView)headerTitleView
{
  return self->_headerTitleView;
}

- (void)setHeaderTitleView:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_headerTitleView, 0);
  objc_storeStrong((id *)&self->_coalescingControlsView, 0);
  objc_storeStrong((id *)&self->_clearAllText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);

  objc_destroyWeak((id *)&self->_handlerDelegate);
}

@end