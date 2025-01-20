@interface SYNotesActivationObserver
- (BOOL)hasInitialVisibility;
- (BOOL)isVisible;
- (CGRect)visibleFrame;
- (FBSDisplayLayoutMonitor)_displayLayoutMonitor;
- (SYNotesActivationObserver)initWithHandler:(id)a3;
- (id)handler;
- (void)_notifyHandlerOfVisibility;
- (void)_startObservingNotes;
- (void)_updateNotesVisibilityFromLayout:(id)a3;
- (void)dealloc;
- (void)setHandler:(id)a3;
- (void)setHasInitialVisibility:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisibleFrame:(CGRect)a3;
- (void)set_displayLayoutMonitor:(id)a3;
@end

@implementation SYNotesActivationObserver

- (void)_notifyHandlerOfVisibility
{
  v3 = [(SYNotesActivationObserver *)self handler];

  if (v3)
  {
    v4 = [(SYNotesActivationObserver *)self handler];
    v4[2](v4, [(SYNotesActivationObserver *)self isVisible]);
  }
}

- (id)handler
{
  return self->_handler;
}

- (BOOL)isVisible
{
  if (!self->_hasInitialVisibility)
  {
    v3 = [(SYNotesActivationObserver *)self _displayLayoutMonitor];
    v4 = [v3 currentLayout];
    [(SYNotesActivationObserver *)self _updateNotesVisibilityFromLayout:v4];
  }
  return self->_visible;
}

void __49__SYNotesActivationObserver__startObservingNotes__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5 && WeakRetained)
  {
    [WeakRetained _updateNotesVisibilityFromLayout:v5];
    [WeakRetained _notifyHandlerOfVisibility];
  }
}

- (void)_updateNotesVisibilityFromLayout:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x4010000000;
  v15 = &unk_1C2CA665D;
  id v5 = (double *)MEMORY[0x1E4F1DB20];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v16 = *MEMORY[0x1E4F1DB20];
  long long v17 = v6;
  v7 = [v4 elements];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SYNotesActivationObserver__updateNotesVisibilityFromLayout___block_invoke;
  v11[3] = &unk_1E6464888;
  v11[4] = &v18;
  v11[5] = &v12;
  [v7 enumerateObjectsUsingBlock:v11];

  [(SYNotesActivationObserver *)self setVisible:*((unsigned __int8 *)v19 + 24)];
  if (*((unsigned char *)v19 + 24))
  {
    id v5 = v13 + 4;
    v8 = v13 + 5;
    v9 = v13 + 6;
    v10 = v13 + 7;
  }
  else
  {
    v10 = v5 + 3;
    v9 = v5 + 2;
    v8 = v5 + 1;
  }
  -[SYNotesActivationObserver setVisibleFrame:](self, "setVisibleFrame:", *v5, *v8, *v9, *v10);
  [(SYNotesActivationObserver *)self setHasInitialVisibility:1];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

- (void)setVisibleFrame:(CGRect)a3
{
  self->_visibleFrame = a3;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void)setHasInitialVisibility:(BOOL)a3
{
  self->_hasInitialVisibility = a3;
}

- (FBSDisplayLayoutMonitor)_displayLayoutMonitor
{
  return self->__displayLayoutMonitor;
}

- (SYNotesActivationObserver)initWithHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SYNotesActivationObserver;
  id v5 = [(SYNotesActivationObserver *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id handler = v5->_handler;
    v5->_id handler = (id)v6;

    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v5->_visibleFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v5->_visibleFrame.size = v8;
    [(SYNotesActivationObserver *)v5 startObservingNotes];
  }

  return v5;
}

- (void)_startObservingNotes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SYNotesActivationObserver__startObservingNotes__block_invoke;
  block[3] = &unk_1E6463AB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__SYNotesActivationObserver__updateNotesVisibilityFromLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  uint64_t v6 = [v16 bundleIdentifier];
  if ([v6 isEqualToString:@"com.apple.mobilenotes"]) {
    BOOL v7 = [v16 layoutRole] == 5;
  }
  else {
    BOOL v7 = 0;
  }

  CGSize v8 = [v16 bundleIdentifier];
  if ([v8 isEqualToString:@"com.apple.SystemPaperViewService"])
  {
  }
  else
  {
    v9 = [v16 identifier];
    int v10 = [v9 isEqualToString:@"com.apple.SystemPaperViewService"];

    if ((v7 | v10) != 1) {
      goto LABEL_8;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  [v16 frame];
  v11 = *(void **)(*(void *)(a1 + 40) + 8);
  v11[4] = v12;
  v11[5] = v13;
  void v11[6] = v14;
  v11[7] = v15;
  *a4 = 1;
LABEL_8:
}

void __49__SYNotesActivationObserver__startObservingNotes__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v2 = (void *)getFBSDisplayLayoutMonitorConfigurationClass_softClass_0;
  uint64_t v19 = getFBSDisplayLayoutMonitorConfigurationClass_softClass_0;
  if (!getFBSDisplayLayoutMonitorConfigurationClass_softClass_0)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke_0;
    uint64_t v14 = &unk_1E64635F8;
    uint64_t v15 = &v16;
    __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke_0((uint64_t)&v11);
    v2 = (void *)v17[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v16, 8);
  id v4 = [v3 configurationForDefaultMainDisplayMonitor];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SYNotesActivationObserver__startObservingNotes__block_invoke_2;
  v8[3] = &unk_1E6463CC0;
  objc_copyWeak(&v9, &location);
  [v4 setTransitionHandler:v8];
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v5 = (void *)getFBSDisplayLayoutMonitorClass_softClass_0;
  uint64_t v19 = getFBSDisplayLayoutMonitorClass_softClass_0;
  if (!getFBSDisplayLayoutMonitorClass_softClass_0)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __getFBSDisplayLayoutMonitorClass_block_invoke_0;
    uint64_t v14 = &unk_1E64635F8;
    uint64_t v15 = &v16;
    __getFBSDisplayLayoutMonitorClass_block_invoke_0((uint64_t)&v11);
    id v5 = (void *)v17[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v16, 8);
  BOOL v7 = [v6 monitorWithConfiguration:v4];
  objc_msgSend(*(id *)(a1 + 32), "set_displayLayoutMonitor:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)set_displayLayoutMonitor:(id)a3
{
}

- (void)dealloc
{
  id v3 = [(SYNotesActivationObserver *)self _displayLayoutMonitor];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SYNotesActivationObserver;
  [(SYNotesActivationObserver *)&v4 dealloc];
}

- (CGRect)visibleFrame
{
  double x = self->_visibleFrame.origin.x;
  double y = self->_visibleFrame.origin.y;
  double width = self->_visibleFrame.size.width;
  double height = self->_visibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)hasInitialVisibility
{
  return self->_hasInitialVisibility;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__displayLayoutMonitor, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end