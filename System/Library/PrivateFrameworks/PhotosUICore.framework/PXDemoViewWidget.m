@interface PXDemoViewWidget
- (BOOL)_didLoadContent;
- (BOOL)hasContentForCurrentInput;
- (CGRect)_contentViewFrameForSize:(CGSize)a3;
- (CGSize)_contentSize;
- (NSString)localizedDisclosureTitle;
- (NSString)localizedTitle;
- (PXAnonymousView)contentView;
- (PXDemoViewWidget)init;
- (PXWidgetDelegate)widgetDelegate;
- (PXWidgetSpec)spec;
- (UIView)_containerView;
- (UIView)_contentView;
- (double)preferredContentHeightForWidth:(double)a3;
- (int64_t)_animationCount;
- (int64_t)contentViewAnchoringType;
- (void)_handleLongPressGestureRecognizer:(id)a3;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)_loadViews;
- (void)_setAnimationCount:(int64_t)a3;
- (void)_setContentSize:(CGSize)a3;
- (void)_setContentViewAnchoringType:(int64_t)a3;
- (void)_setDidLoadContent:(BOOL)a3;
- (void)_updateContentViewColor;
- (void)contentViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)loadContentData;
- (void)setSpec:(id)a3;
- (void)setWidgetDelegate:(id)a3;
- (void)userDidSelectDisclosureControl;
@end

@implementation PXDemoViewWidget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
}

- (int64_t)_animationCount
{
  return self->__animationCount;
}

- (BOOL)_didLoadContent
{
  return self->__didLoadContent;
}

- (void)_setContentSize:(CGSize)a3
{
  self->__contentSize = a3;
}

- (CGSize)_contentSize
{
  double width = self->__contentSize.width;
  double height = self->__contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (int64_t)contentViewAnchoringType
{
  return self->_contentViewAnchoringType;
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (void)setWidgetDelegate:(id)a3
{
}

- (PXWidgetDelegate)widgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  return (PXWidgetDelegate *)WeakRetained;
}

- (void)userDidSelectDisclosureControl
{
  BOOL v3 = !self->_isExpanded;
  self->_isExpanded ^= 1u;
  self->_double height = self->_height + dbl_1AB359C40[v3];
  [(PXDemoViewWidget *)self _setContentViewAnchoringType:1];
  v4 = [(PXDemoViewWidget *)self widgetDelegate];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PXDemoViewWidget_userDidSelectDisclosureControl__block_invoke;
  v6[3] = &unk_1E5DD32A8;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 widget:self animateChanges:v6 withAnimationOptions:0];
}

uint64_t __50__PXDemoViewWidget_userDidSelectDisclosureControl__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) widgetLocalizedDisclosureTitleDidChange:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 widgetPreferredContentHeightForWidthDidChange:v3];
}

- (NSString)localizedDisclosureTitle
{
  if (self->_isExpanded) {
    return (NSString *)@"Show Less";
  }
  else {
    return (NSString *)@"Show More";
  }
}

- (NSString)localizedTitle
{
  return (NSString *)@"Demo View";
}

- (void)contentViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  -[PXDemoViewWidget _contentViewFrameForSize:](self, "_contentViewFrameForSize:", width, height);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  [(PXDemoViewWidget *)self _setAnimationCount:[(PXDemoViewWidget *)self _animationCount] + 1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__PXDemoViewWidget_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v17[3] = &unk_1E5DD3630;
  v17[4] = self;
  v17[5] = v9;
  v17[6] = v11;
  v17[7] = v13;
  v17[8] = v15;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__PXDemoViewWidget_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v16[3] = &unk_1E5DD36F8;
  v16[4] = self;
  [v7 animateAlongsideTransition:v17 completion:v16];
}

void __78__PXDemoViewWidget_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _contentView];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __78__PXDemoViewWidget_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _animationCount] - 1;
  return [v1 _setAnimationCount:v2];
}

- (PXAnonymousView)contentView
{
  [(PXDemoViewWidget *)self _loadViews];
  return (PXAnonymousView *)[(PXDemoViewWidget *)self _containerView];
}

- (void)loadContentData
{
}

- (double)preferredContentHeightForWidth:(double)a3
{
  v4 = [(PXDemoViewWidget *)self spec];
  [v4 contentGuideInsets];
  double v6 = v5;
  double v8 = v7;

  return v8 + v6 + self->_height;
}

- (BOOL)hasContentForCurrentInput
{
  uint64_t v2 = +[PXPhotosDetailsSettings sharedInstance];
  char v3 = [v2 showDemoViewWidget];

  return v3;
}

- (void)setSpec:(id)a3
{
  double v5 = (PXWidgetSpec *)a3;
  if (self->_spec != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    double v6 = [(PXDemoViewWidget *)self widgetDelegate];
    [v6 widgetPreferredContentHeightForWidthDidChange:self];

    double v5 = v7;
  }
}

- (void)_setAnimationCount:(int64_t)a3
{
  if (self->__animationCount != a3)
  {
    self->__animationCount = a3;
    [(PXDemoViewWidget *)self _updateContentViewColor];
  }
}

- (void)_setDidLoadContent:(BOOL)a3
{
  if (self->__didLoadContent != a3)
  {
    self->__didLoadContent = a3;
    [(PXDemoViewWidget *)self _updateContentViewColor];
  }
}

- (void)_setContentViewAnchoringType:(int64_t)a3
{
  if (self->_contentViewAnchoringType != a3)
  {
    self->_contentViewAnchoringType = a3;
    id v4 = [(PXDemoViewWidget *)self widgetDelegate];
    [v4 widgetInvalidateContentViewAnchoringType:self];
  }
}

- (void)_updateContentViewColor
{
  if ([(PXDemoViewWidget *)self _didLoadContent])
  {
    if ([(PXDemoViewWidget *)self _animationCount]) {
      [MEMORY[0x1E4FB1618] redColor];
    }
    else {
    uint64_t v3 = [MEMORY[0x1E4FB1618] purpleColor];
    }
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] yellowColor];
  }
  id v5 = (id)v3;
  id v4 = [(PXDemoViewWidget *)self _contentView];
  [v4 setBackgroundColor:v5];
}

- (CGRect)_contentViewFrameForSize:(CGSize)a3
{
  id v4 = [(PXDemoViewWidget *)self spec];
  [v4 contentGuideInsets];

  id v5 = [(PXDemoViewWidget *)self _containerView];
  [v5 bounds];

  PXEdgeInsetsInsetRect();
}

- (void)_handleLongPressGestureRecognizer:(id)a3
{
  if ([a3 state] == 3)
  {
    self->_isExpanded ^= 1u;
    id v4 = [(PXDemoViewWidget *)self widgetDelegate];
    [v4 widgetLocalizedDisclosureTitleDidChange:self];
  }
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  if ([a3 state] == 3)
  {
    id v5 = objc_alloc_init(PXDemoViewWidgetUIViewController);
    id v4 = [(PXDemoViewWidget *)self widgetDelegate];
    [v4 widget:self transitionToViewController:v5 withTransitionType:1];
  }
}

- (void)_loadViews
{
  if (!self->__containerView)
  {
    [(PXDemoViewWidget *)self _contentSize];
    PXSizeIsNull();
  }
}

- (PXDemoViewWidget)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXDemoViewWidget;
  CGSize result = [(PXDemoViewWidget *)&v3 init];
  if (result)
  {
    result->_isExpanded = 0;
    result->_double height = 200.0;
    result->__contentSize = *(CGSize *)off_1E5DAB030;
  }
  return result;
}

@end