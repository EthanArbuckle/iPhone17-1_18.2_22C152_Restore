@interface PXWidgetCompositionElement
+ (Class)footerBarClass;
+ (Class)headerBarClass;
+ (id)elementWithWidget:(id)a3 scrollViewController:(id)a4;
- (BOOL)_isClassOfViewElement;
- (BOOL)_isNotifyingWidget;
- (BOOL)_isViewElementAndCheckingInTile;
- (BOOL)shouldLoadWidgetContent;
- (BOOL)widget:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4;
- (BOOL)widget:(id)a3 transitionToViewController:(id)a4 withTransitionType:(int64_t)a5;
- (CGSize)widgetContentSize;
- (NSHashTable)_observers;
- (PXScrollViewController)scrollViewController;
- (PXTilingController)animationOptionsOriginatingTilingController;
- (PXTilingController)contentTilingController;
- (PXTilingController)footerTilingController;
- (PXTilingController)headerTilingController;
- (PXWidget)widget;
- (PXWidgetBar)_footer;
- (PXWidgetBar)_header;
- (PXWidgetCompositionElement)init;
- (PXWidgetCompositionElement)initWithWidget:(id)a3 scrollViewController:(id)a4;
- (PXWidgetCompositionElementDelegate)delegate;
- (PXWidgetCompositionSpec)spec;
- (id)extendedTraitCollection;
- (id)presentationEnvironmentForWidget:(id)a3;
- (id)widgetUndoManager:(id)a3;
- (id)widgetViewControllerHostingWidget:(id)a3;
- (id)widgetViewHostingGestureRecognizers:(id)a3;
- (int64_t)widgetDefaultContentViewAnchoringTypeForDisclosureHeightChange:(id)a3;
- (void)_notifyWidgetUsingBlock:(id)a3;
- (void)_performChanges:(id)a3 withAnimationOptions:(id)a4;
- (void)_performContentChangeWhenSafe:(id)a3;
- (void)_setNotifyingWidget:(BOOL)a3;
- (void)_updateFooter;
- (void)_updateHeader;
- (void)prepare;
- (void)registerObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldLoadWidgetContent:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setWidgetContentSize:(CGSize)a3;
- (void)set_isClassOfViewElement:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
- (void)widget:(id)a3 animateChanges:(id)a4 withAnimationOptions:(id)a5;
- (void)widgetBarDidSelectDisclosureAffordance:(id)a3;
- (void)widgetBarDidSelectSubtitle:(id)a3;
- (void)widgetHasLoadedContentDataDidChange:(id)a3;
- (void)widgetInvalidateContentLayoutStyle:(id)a3;
- (void)widgetLocalizedCaptionDidChange:(id)a3;
- (void)widgetLocalizedDisclosureTitleDidChange:(id)a3;
- (void)widgetLocalizedSubtitleDidChange:(id)a3;
- (void)widgetLocalizedTitleDidChange:(id)a3;
- (void)widgetPreferredContentHeightForWidthDidChange:(id)a3;
- (void)widgetRequestFocus:(id)a3;
@end

@implementation PXWidgetCompositionElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__footer, 0);
  objc_storeStrong((id *)&self->__header, 0);
  objc_storeStrong((id *)&self->__observers, 0);
  objc_storeStrong((id *)&self->_animationOptionsOriginatingTilingController, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrollViewController);
  objc_storeStrong((id *)&self->_widget, 0);
}

- (void)set_isClassOfViewElement:(BOOL)a3
{
  self->__isClassOfViewElement = a3;
}

- (BOOL)_isClassOfViewElement
{
  return self->__isClassOfViewElement;
}

- (void)_setNotifyingWidget:(BOOL)a3
{
  self->__isNotifyingWidget = a3;
}

- (BOOL)_isNotifyingWidget
{
  return self->__isNotifyingWidget;
}

- (PXWidgetBar)_footer
{
  return self->__footer;
}

- (PXWidgetBar)_header
{
  return self->__header;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (PXTilingController)animationOptionsOriginatingTilingController
{
  return self->_animationOptionsOriginatingTilingController;
}

- (BOOL)shouldLoadWidgetContent
{
  return self->_shouldLoadWidgetContent;
}

- (CGSize)widgetContentSize
{
  double width = self->_widgetContentSize.width;
  double height = self->_widgetContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXWidgetCompositionSpec)spec
{
  return self->_spec;
}

- (PXWidgetCompositionElementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXWidgetCompositionElementDelegate *)WeakRetained;
}

- (PXScrollViewController)scrollViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewController);
  return (PXScrollViewController *)WeakRetained;
}

- (PXWidget)widget
{
  return self->_widget;
}

- (void)widgetBarDidSelectDisclosureAffordance:(id)a3
{
  id v4 = [(PXWidgetCompositionElement *)self widget];
  [(PXWidgetCompositionElement *)self widgetRequestFocus:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 userDidSelectDisclosureControl];
  }
}

- (void)widgetBarDidSelectSubtitle:(id)a3
{
  id v4 = [(PXWidgetCompositionElement *)self widget];
  [(PXWidgetCompositionElement *)self widgetRequestFocus:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 userDidSelectSubtitle];
  }
}

- (id)widgetUndoManager:(id)a3
{
  id v4 = [(PXWidgetCompositionElement *)self delegate];
  v5 = [v4 elementUndoManager:self];

  return v5;
}

- (id)presentationEnvironmentForWidget:(id)a3
{
  if (self->_delegateFlags.respondsToPresentationEnvironment)
  {
    id v4 = [(PXWidgetCompositionElement *)self delegate];
    v5 = [v4 presentationEnvironmentForElement:self];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)widget:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4
{
  if (!self->_delegateFlags.respondsToRequestViewControllerDismissalAnimated) {
    return 0;
  }
  uint64_t v4 = a4;
  v6 = [(PXWidgetCompositionElement *)self delegate];
  LOBYTE(v4) = [v6 element:self requestViewControllerDismissalAnimated:v4];

  return v4;
}

- (BOOL)widget:(id)a3 transitionToViewController:(id)a4 withTransitionType:(int64_t)a5
{
  if (!self->_delegateFlags.respondsToTransitionToViewControllerPreferredTransitionType) {
    return 0;
  }
  id v7 = a4;
  v8 = [(PXWidgetCompositionElement *)self delegate];
  LOBYTE(a5) = [v8 element:self transitionToViewController:v7 withTransitionType:a5];

  return a5;
}

- (int64_t)widgetDefaultContentViewAnchoringTypeForDisclosureHeightChange:(id)a3
{
  id v5 = a3;
  v6 = [(PXWidgetCompositionElement *)self spec];
  int64_t v7 = [v6 disclosureLocation];

  if (v7 != 1 && v7 != 2)
  {
    if (!v7)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXWidgetCompositionElement.m" lineNumber:404 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    int64_t v7 = 0;
  }

  return v7;
}

- (void)widgetInvalidateContentLayoutStyle:(id)a3
{
}

uint64_t __65__PXWidgetCompositionElement_widgetInvalidateContentLayoutStyle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _invalidateHeader];
}

- (void)widgetRequestFocus:(id)a3
{
  id v3 = [(PXWidgetCompositionElement *)self contentTilingController];
  [v3 requestFocus];
}

- (void)widgetHasLoadedContentDataDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PXWidgetCompositionElement_widgetHasLoadedContentDataDidChange___block_invoke;
  v6[3] = &unk_1E5DBBBA0;
  id v7 = v4;
  id v5 = v4;
  [(PXWidgetCompositionElement *)self _performContentChangeWhenSafe:v6];
}

void __66__PXWidgetCompositionElement_widgetHasLoadedContentDataDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PXWidgetCompositionElement_widgetHasLoadedContentDataDidChange___block_invoke_2;
  v5[3] = &unk_1E5DD32A8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  [v4 _performChanges:v5 withAnimationOptions:0];
}

void __66__PXWidgetCompositionElement_widgetHasLoadedContentDataDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [*(id *)(a1 + 32) hasLoadedContentData]) {
    kdebug_trace();
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 40), "_observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 elementHasLoadedContentDataDidChange:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)widgetPreferredContentHeightForWidthDidChange:(id)a3
{
}

void __76__PXWidgetCompositionElement_widgetPreferredContentHeightForWidthDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__PXWidgetCompositionElement_widgetPreferredContentHeightForWidthDidChange___block_invoke_2;
  v4[3] = &unk_1E5DD36F8;
  id v5 = v2;
  id v3 = v2;
  [v3 _performChanges:v4 withAnimationOptions:0];
}

void __76__PXWidgetCompositionElement_widgetPreferredContentHeightForWidthDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  [(PXTilingLayoutInvalidationContext *)v4 invalidateVisibleRect];
  id v2 = [*(id *)(a1 + 32) contentTilingController];
  id v3 = [v2 targetLayout];
  [v3 invalidateLayoutWithContext:v4];
}

- (void)widgetLocalizedDisclosureTitleDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__PXWidgetCompositionElement_widgetLocalizedDisclosureTitleDidChange___block_invoke;
  v3[3] = &unk_1E5DBBB78;
  v3[4] = self;
  v3[5] = a2;
  [(PXWidgetCompositionElement *)self _performContentChangeWhenSafe:v3];
}

void __70__PXWidgetCompositionElement_widgetLocalizedDisclosureTitleDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 spec];
  uint64_t v4 = [v3 disclosureLocation];

  if (v4 == 1)
  {
    [v7 _invalidateHeader];
LABEL_7:
    id v5 = v7;
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    [v7 _invalidateFooter];
    goto LABEL_7;
  }
  id v5 = v7;
  if (!v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PXWidgetCompositionElement.m" lineNumber:347 description:@"Code which should be unreachable has been reached"];

    abort();
  }
LABEL_8:
}

- (void)widgetLocalizedCaptionDidChange:(id)a3
{
}

uint64_t __62__PXWidgetCompositionElement_widgetLocalizedCaptionDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _invalidateHeader];
}

- (void)widgetLocalizedSubtitleDidChange:(id)a3
{
}

uint64_t __63__PXWidgetCompositionElement_widgetLocalizedSubtitleDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _invalidateHeader];
}

- (void)widgetLocalizedTitleDidChange:(id)a3
{
}

uint64_t __60__PXWidgetCompositionElement_widgetLocalizedTitleDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _invalidateHeader];
}

- (void)widget:(id)a3 animateChanges:(id)a4 withAnimationOptions:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!v8)
  {
    id v8 = +[PXBasicTileAnimationOptions defaultAnimationOptions];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PXWidgetCompositionElement_widget_animateChanges_withAnimationOptions___block_invoke;
  v11[3] = &unk_1E5DBBB30;
  id v12 = v8;
  id v13 = v7;
  v11[4] = self;
  id v9 = v8;
  id v10 = v7;
  [(PXWidgetCompositionElement *)self _performContentChangeWhenSafe:v11];
}

uint64_t __73__PXWidgetCompositionElement_widget_animateChanges_withAnimationOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performChanges:*(void *)(a1 + 48) withAnimationOptions:*(void *)(a1 + 40)];
}

- (id)widgetViewControllerHostingWidget:(id)a3
{
  uint64_t v4 = [(PXWidgetCompositionElement *)self delegate];
  id v5 = [v4 elementViewController:self];

  return v5;
}

- (id)widgetViewHostingGestureRecognizers:(id)a3
{
  id v3 = [(PXWidgetCompositionElement *)self scrollViewController];
  uint64_t v4 = [v3 scrollView];

  return v4;
}

- (BOOL)_isViewElementAndCheckingInTile
{
  int v3 = [(PXWidgetCompositionElement *)self _isClassOfViewElement];
  if (v3)
  {
    LOBYTE(v3) = [(PXWidgetCompositionElement *)self isCheckingInTile];
  }
  return v3;
}

- (void)_performChanges:(id)a3 withAnimationOptions:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(void))a3;
  id v7 = a4;
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  if (v6) {
    v6[2](v6);
  }
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    v16 = v6;
    id v9 = [(PXWidgetCompositionElement *)self animationOptionsOriginatingTilingController];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = [(PXWidgetCompositionElement *)self _observers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v15 elementNeedsLayout:self preferredAnimationOptions:v7 originatingTilingController:v9];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v12);
    }

    uint64_t v6 = v16;
    goto LABEL_17;
  }
  if (v7)
  {
    id v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v7;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "ignoring nested animation options %@", buf, 0xCu);
    }
LABEL_17:
  }
}

- (void)_updateFooter
{
  int v3 = [(PXWidgetCompositionElement *)self widget];
  uint64_t v4 = [(PXWidgetCompositionElement *)self spec];
  if ([v4 disclosureLocation] != 2)
  {

    goto LABEL_5;
  }
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
  {
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = [v3 localizedDisclosureTitle];
LABEL_6:
  id v7 = [(PXWidgetCompositionElement *)self spec];
  id v8 = [v7 footerSpec];

  id v9 = [(PXWidgetCompositionElement *)self _footer];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__PXWidgetCompositionElement__updateFooter__block_invoke;
  v13[3] = &unk_1E5DD0F30;
  id v14 = v9;
  id v15 = v6;
  id v16 = v8;
  id v10 = v8;
  id v11 = v6;
  id v12 = v9;
  [v12 performChanges:v13];
}

uint64_t __43__PXWidgetCompositionElement__updateFooter__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDisclosureTitle:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 setSpec:v3];
}

- (void)_updateHeader
{
  uint64_t v3 = [(PXWidgetCompositionElement *)self widget];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 localizedTitle];
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    char v5 = [v3 localizedSubtitle];
  }
  else
  {
    char v5 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v3 localizedCaption];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = [(PXWidgetCompositionElement *)self spec];
  if ([v7 disclosureLocation] == 1)
  {
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [v3 localizedDisclosureTitle];
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v9 = 0;
LABEL_15:
  if (objc_opt_respondsToSelector()) {
    char v10 = [v3 allowUserInteractionWithSubtitle];
  }
  else {
    char v10 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v11 = [v3 contentLayoutStyle];
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = [(PXWidgetCompositionElement *)self spec];
  uint64_t v13 = [v12 headerSpecForWidgetContentLayoutStyle:v11];

  id v14 = [(PXWidgetCompositionElement *)self _header];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __43__PXWidgetCompositionElement__updateHeader__block_invoke;
  v21[3] = &unk_1E5DBBB08;
  id v22 = v14;
  id v23 = v4;
  id v24 = v5;
  id v25 = v6;
  id v26 = v9;
  id v27 = v13;
  char v28 = v10;
  id v15 = v13;
  id v16 = v9;
  id v17 = v6;
  id v18 = v5;
  id v19 = v4;
  id v20 = v14;
  [v20 performChanges:v21];
}

uint64_t __43__PXWidgetCompositionElement__updateHeader__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setSubtitle:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setCaption:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setDisclosureTitle:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setSpec:*(void *)(a1 + 72)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 80);
  return [v2 setAllowUserInteractionWithSubtitle:v3];
}

- (void)_performContentChangeWhenSafe:(id)a3
{
  id v4 = a3;
  if ([(PXWidgetCompositionElement *)self _isNotifyingWidget]
    || [(PXWidgetCompositionElement *)self _isViewElementAndCheckingInTile])
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PXWidgetCompositionElement__performContentChangeWhenSafe___block_invoke;
    block[3] = &unk_1E5DD1848;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, PXWidgetCompositionElement *))v4 + 2))(v4, self);
  }
}

void __60__PXWidgetCompositionElement__performContentChangeWhenSafe___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_notifyWidgetUsingBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL v5 = [(PXWidgetCompositionElement *)self _isNotifyingWidget];
  [(PXWidgetCompositionElement *)self _setNotifyingWidget:1];
  v4[2](v4);

  [(PXWidgetCompositionElement *)self _setNotifyingWidget:v5];
}

- (void)setShouldLoadWidgetContent:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_shouldLoadWidgetContent != a3)
  {
    BOOL v3 = a3;
    self->_shouldLoadWidgetContent = a3;
    BOOL v5 = [(PXWidgetCompositionElement *)self widget];
    id v6 = PLRelatedGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v12 = self;
      __int16 v13 = 1024;
      BOOL v14 = v3;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "[%@] set should load content=%i for widget=%@ ", buf, 0x1Cu);
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__PXWidgetCompositionElement_setShouldLoadWidgetContent___block_invoke;
    v8[3] = &unk_1E5DCFE98;
    BOOL v10 = v3;
    id v9 = v5;
    id v7 = v5;
    [(PXWidgetCompositionElement *)self _notifyWidgetUsingBlock:v8];
  }
}

uint64_t __57__PXWidgetCompositionElement_setShouldLoadWidgetContent___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      BOOL v3 = (objc_class *)objc_opt_class();
      id v4 = NSStringFromClass(v3);
      uint64_t v5 = [v4 length];
      if (v5 >= 1)
      {
        uint64_t v6 = v5;
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        do
        {
          uint64_t v9 = v7 + 1;
          v8 += (v7 + 1) * objc_msgSend(v4, "characterAtIndex:");
          uint64_t v7 = v9;
        }
        while (v6 != v9);
      }
      kdebug_trace();

      uint64_t v11 = *(void **)(a1 + 32);
      return [v11 loadContentData];
    }
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      BOOL v10 = *(void **)(a1 + 32);
      return [v10 unloadContentData];
    }
  }
  return result;
}

- (void)setWidgetContentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3.width != self->_widgetContentSize.width || a3.height != self->_widgetContentSize.height)
  {
    self->_widgetContentSize = a3;
    uint64_t v7 = [(PXWidgetCompositionElement *)self widget];
    uint64_t v8 = PLRelatedGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v22.CGFloat width = width;
      v22.CGFloat height = height;
      uint64_t v9 = NSStringFromCGSize(v22);
      *(_DWORD *)buf = 138412802;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "[%@] set content size for widget=%@ size=%@", buf, 0x20u);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__PXWidgetCompositionElement_setWidgetContentSize___block_invoke;
    v11[3] = &unk_1E5DD35E0;
    id v12 = v7;
    CGFloat v13 = width;
    CGFloat v14 = height;
    id v10 = v7;
    [(PXWidgetCompositionElement *)self _notifyWidgetUsingBlock:v11];
  }
}

uint64_t __51__PXWidgetCompositionElement_setWidgetContentSize___block_invoke(double *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    BOOL v3 = (void *)*((void *)a1 + 4);
    double v4 = a1[5];
    double v5 = a1[6];
    return objc_msgSend(v3, "setContentSize:", v4, v5);
  }
  return result;
}

- (PXTilingController)footerTilingController
{
  id v2 = [(PXWidgetCompositionElement *)self _footer];
  BOOL v3 = [v2 tilingController];

  return (PXTilingController *)v3;
}

- (PXTilingController)headerTilingController
{
  id v2 = [(PXWidgetCompositionElement *)self _header];
  BOOL v3 = [v2 tilingController];

  return (PXTilingController *)v3;
}

- (PXTilingController)contentTilingController
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXWidgetCompositionElement.m" lineNumber:129 description:@"must be implemented by concrete subclass"];

  return 0;
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PXWidgetCompositionElement *)self _observers];
  [v5 removeObject:v4];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PXWidgetCompositionElement *)self _observers];
  [v5 addObject:v4];
}

- (void)setSpec:(id)a3
{
  id v5 = (PXWidgetCompositionSpec *)a3;
  if (self->_spec != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXWidgetCompositionElement *)self _invalidateHeader];
    [(PXWidgetCompositionElement *)self _invalidateFooter];
    id v5 = v6;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToTransitionToViewControllerPreferredTransitionType = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToRequestViewControllerDismissalAnimated = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPresentationEnvironment = objc_opt_respondsToSelector() & 1;
  }
}

- (void)prepare
{
  [(PXWidgetCompositionElement *)self _updateHeader];
  [(PXWidgetCompositionElement *)self _updateFooter];
}

- (PXWidgetCompositionElement)initWithWidget:(id)a3 scrollViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PXWidgetCompositionElement;
  uint64_t v9 = [(PXWidgetCompositionElement *)&v28 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v9->__observers;
    v9->__observers = (NSHashTable *)v10;

    objc_storeStrong((id *)&v9->_widget, a3);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v12 = (objc_class *)objc_opt_class();
      CGFloat v13 = NSStringFromClass(v12);
      uint64_t v14 = [v13 length];
      if (v14 >= 1)
      {
        uint64_t v15 = v14;
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        do
        {
          uint64_t v18 = v16 + 1;
          v17 += (v16 + 1) * objc_msgSend(v13, "characterAtIndex:");
          uint64_t v16 = v18;
        }
        while (v15 != v18);
      }
      kdebug_trace();
    }
    if (objc_opt_respondsToSelector()) {
      [v7 setWidgetDelegate:v9];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9->__isClassOfViewElement = 1;
    }
    v9->_widgetContentSize = *(CGSize *)off_1E5DAB030;
    objc_storeWeak((id *)&v9->_scrollViewController, v8);
    id v19 = objc_alloc((Class)[(id)objc_opt_class() headerBarClass]);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_scrollViewController);
    uint64_t v21 = [v19 initWithScrollViewController:WeakRetained];
    header = v9->__header;
    v9->__header = (PXWidgetBar *)v21;

    [(PXWidgetBar *)v9->__header setDelegate:v9];
    id v23 = objc_alloc((Class)[(id)objc_opt_class() footerBarClass]);
    id v24 = objc_loadWeakRetained((id *)&v9->_scrollViewController);
    uint64_t v25 = [v23 initWithScrollViewController:v24];
    footer = v9->__footer;
    v9->__footer = (PXWidgetBar *)v25;

    [(PXWidgetBar *)v9->__footer setDelegate:v9];
  }

  return v9;
}

- (PXWidgetCompositionElement)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXWidgetCompositionElement.m" lineNumber:56 description:@"invalid initializer"];

  return 0;
}

+ (id)elementWithWidget:(id)a3 scrollViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"PXWidgetCompositionElement.m" lineNumber:49 description:@"widget must provide either contentView or contentTilingController"];

    uint64_t v9 = 0;
  }
  uint64_t v11 = (void *)[[v9 alloc] initWithWidget:v7 scrollViewController:v8];

  return v11;
}

- (id)extendedTraitCollection
{
  BOOL v3 = [(PXWidgetCompositionElement *)self delegate];
  id v4 = [v3 elementViewController:self];

  id v5 = objc_msgSend(v4, "px_extendedTraitCollection");

  return v5;
}

+ (Class)footerBarClass
{
  return (Class)objc_opt_class();
}

+ (Class)headerBarClass
{
  return (Class)objc_opt_class();
}

@end