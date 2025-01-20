@interface SBAppSwitcherSnapshotLockoutViewControllerProvider
- (SBAppSwitcherSnapshotLockoutViewControllerProvider)init;
- (id)blockingViewControllerForBundleIdentifier:(id)a3 screenTimePolicy:(int64_t)a4;
- (void)_receivedMemoryWarning:(id)a3;
- (void)dealloc;
- (void)recycleBlockingViewController:(id)a3;
@end

@implementation SBAppSwitcherSnapshotLockoutViewControllerProvider

- (SBAppSwitcherSnapshotLockoutViewControllerProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBAppSwitcherSnapshotLockoutViewControllerProvider;
  v2 = [(SBAppSwitcherSnapshotLockoutViewControllerProvider *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    availableControllers = v2->_availableControllers;
    v2->_availableControllers = v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__receivedMemoryWarning_ name:*MEMORY[0x1E4F43670] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43670] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherSnapshotLockoutViewControllerProvider;
  [(SBAppSwitcherSnapshotLockoutViewControllerProvider *)&v4 dealloc];
}

- (id)blockingViewControllerForBundleIdentifier:(id)a3 screenTimePolicy:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = [(NSMutableArray *)self->_availableControllers _sb_dequeue];
  if (!v7)
  {
    objc_super v7 = (void *)[MEMORY[0x1E4F99D98] newTranslucentBlockingViewController];
    v8 = [MEMORY[0x1E4F99D98] closeApplicationHandler];
    [v7 setOkButtonHandler:v8];

    [v7 _setIgnoresWrapperViewForContentOverlayInsets:1];
  }
  [v7 updateAppearanceUsingPolicy:a4 forBundleIdentifier:v6];

  return v7;
}

- (void)recycleBlockingViewController:(id)a3
{
}

- (void)_receivedMemoryWarning:(id)a3
{
}

- (void).cxx_destruct
{
}

@end