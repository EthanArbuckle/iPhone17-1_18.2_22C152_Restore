@interface SBNonInteractiveDisplaySceneManager
- (BOOL)_shouldAutoHostScene:(id)a3;
- (BOOL)isSuspendedUnderLock;
- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventSuspendUnderLockForScene:(id)a4 settings:(id)a5;
- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventUnderLockForScene:(id)a4;
- (SBNonInteractiveDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6;
- (id)externalApplicationSceneHandles;
- (id)suspendedUnderLockManager:(id)a3 sceneHandleForScene:(id)a4;
- (id)suspendedUnderLockManagerDisplayConfiguration:(id)a3;
- (void)_externalCoverSheetVisibilityDidDismiss:(id)a3;
- (void)_externalCoverSheetVisibilityDidPresent:(id)a3;
- (void)dealloc;
- (void)setSuspendedUnderLock:(BOOL)a3;
- (void)setSuspendedUnderLock:(BOOL)a3 alongsideWillChangeBlock:(id)a4 alongsideDidChangeBlock:(id)a5;
@end

@implementation SBNonInteractiveDisplaySceneManager

- (SBNonInteractiveDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)SBNonInteractiveDisplaySceneManager;
  v6 = [(SBSceneManager *)&v10 initWithReference:a3 sceneIdentityProvider:a4 presentationBinder:a5 snapshotBehavior:a6];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__externalCoverSheetVisibilityDidPresent_ name:@"SBExternalDisplayCoverSheetDidPresent" object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v6 selector:sel__externalCoverSheetVisibilityDidDismiss_ name:@"SBExternalDisplayCoverSheetDidDismiss" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBExternalDisplayCoverSheetDidPresent" object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"SBExternalDisplayCoverSheetDidDismiss" object:0];

  v5.receiver = self;
  v5.super_class = (Class)SBNonInteractiveDisplaySceneManager;
  [(SBSceneManager *)&v5 dealloc];
}

- (BOOL)_shouldAutoHostScene:(id)a3
{
  return 1;
}

- (id)externalApplicationSceneHandles
{
  v4.receiver = self;
  v4.super_class = (Class)SBNonInteractiveDisplaySceneManager;
  v2 = [(SBSceneManager *)&v4 externalApplicationSceneHandles];
  return v2;
}

- (BOOL)isSuspendedUnderLock
{
  BSDispatchQueueAssertMain();
  lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  return [(SBSuspendedUnderLockManager *)lazy_suspendedUnderLockManager isSuspendedUnderLock];
}

- (void)setSuspendedUnderLock:(BOOL)a3
{
}

- (void)setSuspendedUnderLock:(BOOL)a3 alongsideWillChangeBlock:(id)a4 alongsideDidChangeBlock:(id)a5
{
  BOOL v6 = a3;
  id v15 = a4;
  id v8 = a5;
  BSDispatchQueueAssertMain();
  lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  if (!lazy_suspendedUnderLockManager)
  {
    objc_super v10 = [SBSuspendedUnderLockManager alloc];
    v11 = +[SBWorkspace mainWorkspace];
    v12 = [v11 eventQueue];
    v13 = [(SBSuspendedUnderLockManager *)v10 initWithDelegate:self eventQueue:v12];
    v14 = self->_lazy_suspendedUnderLockManager;
    self->_lazy_suspendedUnderLockManager = v13;

    lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  }
  [(SBSuspendedUnderLockManager *)lazy_suspendedUnderLockManager setSuspendedUnderLock:v6 alongsideWillChangeBlock:v15 alongsideDidChangeBlock:v8];
}

- (void)_externalCoverSheetVisibilityDidPresent:(id)a3
{
}

- (void)_externalCoverSheetVisibilityDidDismiss:(id)a3
{
}

- (id)suspendedUnderLockManagerDisplayConfiguration:(id)a3
{
  v3 = [(SBSceneManager *)self displayIdentity];
  objc_super v4 = [v3 currentConfiguration];

  return v4;
}

- (id)suspendedUnderLockManager:(id)a3 sceneHandleForScene:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBNonInteractiveDisplaySceneManager;
  objc_super v4 = [(SBSceneManager *)&v6 existingSceneHandleForScene:a4];
  return v4;
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventUnderLockForScene:(id)a4
{
  return 0;
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventSuspendUnderLockForScene:(id)a4 settings:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
}

@end