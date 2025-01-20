@interface UnifiedBar
- (BOOL)canBecomeFirstResponder;
- (CGRect)URLOutlineFrameInNavigationBarSpace;
- (CGRect)urlOutlineFrameRelativeToView:(id)a3;
- (NSArray)popoverPassthroughViews;
- (UITextField)textField;
- (UnifiedBar)initWithFrame:(CGRect)a3;
- (_SFNavigationBarDelegateCommon)delegate;
- (_SFPopoverSourceInfo)URLOutlinePopoverSourceInfo;
- (_SFPopoverSourceInfo)formatMenuButtonPopoverSourceInfo;
- (id)popoverSourceInfoForBarItem:(int64_t)a3;
- (id)viewForBarItem:(int64_t)a3;
- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8;
- (void)animateSafariIconLinkFromPoint:(CGPoint)a3 inView:(id)a4;
- (void)didCompleteBarRegistrationWithToken:(id)a3;
- (void)metricsDidChange;
- (void)setDelegate:(id)a3;
- (void)squishedBarTapped;
- (void)unifiedTabBar:(id)a3 didFinishShowingAvailabilityLabelOfType:(int64_t)a4;
- (void)unifiedTabBar:(id)a3 didTapMediaStateMuteButtonForItem:(id)a4;
- (void)unifiedTabBar:(id)a3 extensionButtonTapped:(id)a4 extension:(id)a5;
- (void)unifiedTabBar:(id)a3 multipleExtensionButtonTapped:(id)a4;
- (void)unifiedTabBarMenuButtonClicked:(id)a3;
- (void)unifiedTabBarMenuButtonReceivedTouchDown:(id)a3;
- (void)unifiedTabBarMenuButtonTapped:(id)a3;
- (void)unifiedTabBarReaderButtonTapped:(id)a3;
- (void)unifiedTabBarReloadButtonTapped:(id)a3;
- (void)unifiedTabBarStopButtonTapped:(id)a3;
- (void)unifiedTabBarTranslationButtonTapped:(id)a3;
- (void)unifiedTabBarURLTapped:(id)a3 completionHandler:(id)a4;
- (void)unifiedTabBarVoiceSearchButtonTapped:(id)a3;
@end

@implementation UnifiedBar

- (UnifiedBar)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UnifiedBar;
  v3 = -[SFUnifiedBar initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1F78]);
    [(UnifiedBar *)v3 addInteraction:v4];

    v5 = v3;
  }

  return v3;
}

- (void)metricsDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarMetricsDidChange:self];
  }
}

- (void)squishedBarTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained compressedNavigationBarWasTapped:self];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)viewForBarItem:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barRegistrationToken);
  v5 = [WeakRetained viewForBarItem:a3];

  return v5;
}

- (void)unifiedTabBarMenuButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarFormatMenuButtonWasTapped:self];
  }
}

- (void)unifiedTabBarMenuButtonReceivedTouchDown:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarFormatMenuButtonStartedInteraction:self];
  }
}

- (void)unifiedTabBarMenuButtonClicked:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarReaderButtonWasTapped:self];
  }
}

- (void)unifiedTabBarVoiceSearchButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarVoiceSearchButtonWasTapped:self];
  }
}

- (void)unifiedTabBarReloadButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarReloadButtonWasTapped:self];
  }
}

- (void)unifiedTabBarStopButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarStopLoadingButtonWasTapped:self];
  }
}

- (void)unifiedTabBarReaderButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarReaderButtonWasTapped:self];
  }
}

- (void)unifiedTabBarTranslationButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarTranslateButtonWasTapped:self];
  }
}

- (void)unifiedTabBar:(id)a3 didTapMediaStateMuteButtonForItem:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarMediaStateMuteButtonWasTapped:self forItem:v6];
  }
}

- (void)unifiedTabBarURLTapped:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBarURLWasTapped:self completionHandler:v6];
  }
}

- (void)unifiedTabBar:(id)a3 didFinishShowingAvailabilityLabelOfType:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBar:self didFinishShowingAvailabilityLabelOfType:a4];
  }
}

- (void)unifiedTabBar:(id)a3 extensionButtonTapped:(id)a4 extension:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBar:self extensionButtonTapped:v9 extension:v7];
  }
}

- (void)unifiedTabBar:(id)a3 multipleExtensionButtonTapped:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained navigationBar:self multipleExtensionsButtonTapped:v6];
  }
}

- (void)animateSafariIconLinkFromPoint:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v14 = [(UnifiedBar *)self viewForBarItem:3];
  v8 = (void *)MEMORY[0x1E4FB1EB0];
  id v9 = _SFSafariIconLinkImage();
  [v14 bounds];
  objc_msgSend(v8, "_sf_animateLinkImage:withAnimation:fromPoint:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", v9, 1, v7, v14, 0, 0, x, y, v10, v11, v12, v13);
}

- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  if (a6 == 5)
  {
    v20 = [(SFUnifiedBar *)self contentArrangement];
    v21 = [v20 inlineContentView];
    id v27 = [v21 menuPopoverSourceView];
  }
  else
  {
    id v27 = [(UnifiedBar *)self viewForBarItem:a6];
  }
  v22 = (void *)MEMORY[0x1E4FB1EB0];
  [v27 bounds];
  objc_msgSend(v22, "_sf_animateLinkImage:withAnimation:fromRect:inView:toRect:inView:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", a3, 1, v19, v27, v18, v17, x, y, width, height, v23, v24, v25, v26);
}

- (id)popoverSourceInfoForBarItem:(int64_t)a3
{
  if (a3 == 5)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F785C8]);
    id WeakRetained = [(SFUnifiedBar *)self contentArrangement];
    id v6 = [WeakRetained inlineContentView];
    id v7 = [v6 menuPopoverSourceView];
    v8 = (void *)[v4 initWithView:v7];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_barRegistrationToken);
    v8 = [WeakRetained popoverSourceInfoForItem:a3];
  }

  return v8;
}

- (UITextField)textField
{
  v2 = [(SFUnifiedBar *)self contentArrangement];
  v3 = [v2 inlineContentView];

  id v4 = [v3 searchField];

  return (UITextField *)v4;
}

- (NSArray)popoverPassthroughViews
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SFUnifiedBar *)self contentArrangement];
  id v4 = [v3 inlineContentView];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14[0] = self;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = (UnifiedBar **)v14;
LABEL_8:
    v3 = [v6 arrayWithObjects:v7 count:1];
    goto LABEL_9;
  }
  uint64_t v5 = [v4 role];
  if (v5 == 2)
  {
    double v11 = self;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = &v11;
    goto LABEL_8;
  }
  if (v5 != 1)
  {
    if (v5) {
      goto LABEL_9;
    }
    double v13 = self;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = &v13;
    goto LABEL_8;
  }
  v12[0] = v4;
  id v9 = [(SFUnifiedBar *)self leadingItemContainerView];
  v12[1] = v9;
  double v10 = [(SFUnifiedBar *)self trailingItemContainerView];
  v12[2] = v10;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

LABEL_9:
  return (NSArray *)v3;
}

- (CGRect)URLOutlineFrameInNavigationBarSpace
{
  v3 = [(SFUnifiedBar *)self contentArrangement];
  id v4 = [v3 inlineContentView];

  uint64_t v5 = [v4 searchFieldPopoverSourceView];
  [v5 bounds];
  -[UnifiedBar convertRect:fromView:](self, "convertRect:fromView:", v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v4 searchFieldPopoverSourceInsets];
  double v15 = v7 + v14;
  double v17 = v9 + v16;
  double v19 = v11 - (v14 + v18);
  double v21 = v13 - (v16 + v20);

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGRect)urlOutlineFrameRelativeToView:(id)a3
{
  id v4 = a3;
  [(UnifiedBar *)self URLOutlineFrameInNavigationBarSpace];
  -[UnifiedBar convertRect:toView:](self, "convertRect:toView:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (_SFPopoverSourceInfo)formatMenuButtonPopoverSourceInfo
{
  v2 = [(SFUnifiedBar *)self contentArrangement];
  v3 = [v2 inlineContentView];

  id v4 = [v3 menuPopoverSourceView];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F785C8]) initWithView:v4];
  [v5 setPermittedArrowDirections:3];
  [v5 setShouldHideArrow:1];
  [v5 setShouldPassthroughSuperview:1];
  uint64_t v6 = [v3 role];
  if (v6)
  {
    if (v6 != 1) {
      goto LABEL_6;
    }
    uint64_t v7 = 3;
  }
  else
  {
    uint64_t v7 = 4;
  }
  [v5 setProvenance:v7];
LABEL_6:

  return (_SFPopoverSourceInfo *)v5;
}

- (_SFPopoverSourceInfo)URLOutlinePopoverSourceInfo
{
  v2 = [(SFUnifiedBar *)self contentArrangement];
  v3 = [v2 inlineContentView];

  id v4 = objc_alloc(MEMORY[0x1E4F785C8]);
  double v5 = [v3 searchFieldPopoverSourceView];
  [v3 searchFieldPopoverSourceInsets];
  uint64_t v6 = objc_msgSend(v4, "initWithView:insets:", v5);

  return (_SFPopoverSourceInfo *)v6;
}

- (void)didCompleteBarRegistrationWithToken:(id)a3
{
}

- (_SFNavigationBarDelegateCommon)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SFNavigationBarDelegateCommon *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_barRegistrationToken);
}

@end