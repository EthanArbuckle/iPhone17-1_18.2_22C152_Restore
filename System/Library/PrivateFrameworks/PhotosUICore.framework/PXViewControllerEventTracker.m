@interface PXViewControllerEventTracker
- (BOOL)isViewVisible;
- (NSString)viewName;
- (PXAnonymousViewController)currentViewController;
- (PXViewControllerEventTracker)init;
- (PXViewControllerEventTracker)initWithViewName:(id)a3;
- (int64_t)viewSignpost;
- (void)_invalidateIsViewVisible;
- (void)_updateIsViewVisible;
- (void)didPerformChanges;
- (void)logViewControllerDidAppear:(id)a3;
- (void)logViewControllerDidDisappear:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCurrentViewController:(id)a3;
- (void)setIsViewVisible:(BOOL)a3;
- (void)setViewSignpost:(int64_t)a3;
@end

@implementation PXViewControllerEventTracker

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXViewControllerEventTracker;
  [(PXUserInterfaceElementEventTracker *)&v4 didPerformChanges];
  v3 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v3 updateIfNeeded];
}

uint64_t __61__PXViewControllerEventTracker_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateIsViewVisible];
}

- (void)_updateIsViewVisible
{
  if ([(PXUserInterfaceElementEventTracker *)self isVisible])
  {
    id v3 = [(PXViewControllerEventTracker *)self currentViewController];
    [(PXViewControllerEventTracker *)self setIsViewVisible:v3 != 0];
  }
  else
  {
    [(PXViewControllerEventTracker *)self setIsViewVisible:0];
  }
}

- (void)setIsViewVisible:(BOOL)a3
{
  if (self->_isViewVisible != a3)
  {
    self->_isViewVisible = a3;
    [(PXViewControllerEventTracker *)self signalChange:8];
  }
}

- (void)logViewControllerDidAppear:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PXViewControllerEventTracker *)self currentViewController];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = [(PXViewControllerEventTracker *)self currentViewController];

    if (v7 != v4) {
      PXAssertGetLog();
    }
  }
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __59__PXViewControllerEventTracker_logViewControllerDidAppear___block_invoke;
  v19 = &unk_1E5DD0328;
  v20 = self;
  id v8 = v4;
  id v21 = v8;
  [(PXViewControllerEventTracker *)self performChanges:&v16];
  v9 = [(PXViewControllerEventTracker *)self viewName];
  if (v9)
  {
    if ([(PXViewControllerEventTracker *)self viewSignpost])
    {
      v10 = PLUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v8;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "did appear callback called twice without did disappear for view controller %@", buf, 0xCu);
      }
    }
    else
    {
      -[PXViewControllerEventTracker setViewSignpost:](self, "setViewSignpost:", [MEMORY[0x1E4F56658] startSignpost]);
      v11 = (void *)MEMORY[0x1E4F56658];
      uint64_t v12 = *MEMORY[0x1E4F56480];
      uint64_t v13 = *MEMORY[0x1E4F56598];
      v22[0] = *MEMORY[0x1E4F56560];
      v22[1] = v13;
      v23[0] = v9;
      v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PXViewControllerEventTracker viewSignpost](self, "viewSignpost"));
      v23[1] = v10;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      v15 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v14];
      [v11 sendEvent:v12 withPayload:v15];
    }
  }
}

- (int64_t)viewSignpost
{
  return self->_viewSignpost;
}

- (PXAnonymousViewController)currentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentViewController);
  return (PXAnonymousViewController *)WeakRetained;
}

- (void)setViewSignpost:(int64_t)a3
{
  self->_viewSignpost = a3;
}

- (BOOL)isViewVisible
{
  return self->_isViewVisible;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)EventTrackerObserverContext_281399 != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXViewControllerEventTracker.m" lineNumber:134 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__PXViewControllerEventTracker_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5DD0FA8;
    v12[4] = self;
    [(PXViewControllerEventTracker *)self performChanges:v12];
  }
}

- (void)setCurrentViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentViewController);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_currentViewController, obj);
    [(PXViewControllerEventTracker *)self signalChange:16];
    [(PXViewControllerEventTracker *)self _invalidateIsViewVisible];
    uint64_t v5 = obj;
  }
}

- (void)_invalidateIsViewVisible
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsViewVisible];
}

uint64_t __59__PXViewControllerEventTracker_logViewControllerDidAppear___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didAppear];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setCurrentViewController:v3];
}

- (PXViewControllerEventTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXViewControllerEventTracker;
  id v2 = [(PXUserInterfaceElementEventTracker *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(PXViewControllerEventTracker *)v2 registerChangeObserver:v2 context:EventTrackerObserverContext_281399];
    id v4 = [(PXUserInterfaceElementEventTracker *)v3 updater];
    [v4 addUpdateSelector:sel__updateIsViewVisible];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentViewController);
  objc_storeStrong((id *)&self->_viewName, 0);
}

- (NSString)viewName
{
  return self->_viewName;
}

- (void)logViewControllerDidDisappear:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PXViewControllerEventTracker *)self currentViewController];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    id v7 = [(PXViewControllerEventTracker *)self currentViewController];

    if (v7 != v4) {
      PXAssertGetLog();
    }
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __62__PXViewControllerEventTracker_logViewControllerDidDisappear___block_invoke;
  v22[3] = &unk_1E5DD0FA8;
  v22[4] = self;
  [(PXViewControllerEventTracker *)self performChanges:v22];
  id v8 = [(PXViewControllerEventTracker *)self viewName];
  if (v8)
  {
    int64_t v9 = [(PXViewControllerEventTracker *)self viewSignpost];
    if (v9)
    {
      int64_t v10 = v9;
      v11 = (void *)MEMORY[0x1E4F56658];
      uint64_t v12 = *MEMORY[0x1E4F565C0];
      uint64_t v25 = *MEMORY[0x1E4F56560];
      uint64_t v13 = v25;
      uint64_t v26 = v8;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v15 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v14];
      [v11 endSignpost:v10 forEventName:v12 withPayload:v15];

      uint64_t v16 = (void *)MEMORY[0x1E4F56658];
      uint64_t v17 = *MEMORY[0x1E4F56488];
      uint64_t v18 = *MEMORY[0x1E4F56598];
      v23[0] = v13;
      v23[1] = v18;
      v24[0] = v8;
      v19 = [NSNumber numberWithLongLong:v10];
      v24[1] = v19;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
      id v21 = [(PXUserInterfaceElementEventTracker *)self finalPayloadWithPayload:v20];
      [v16 sendEvent:v17 withPayload:v21];

      [(PXViewControllerEventTracker *)self setViewSignpost:0];
    }
  }
}

uint64_t __62__PXViewControllerEventTracker_logViewControllerDidDisappear___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didDisappear];
  id v2 = *(void **)(a1 + 32);
  return [v2 setCurrentViewController:0];
}

- (PXViewControllerEventTracker)initWithViewName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXViewControllerEventTracker *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    viewName = v5->_viewName;
    v5->_viewName = (NSString *)v6;
  }
  return v5;
}

@end