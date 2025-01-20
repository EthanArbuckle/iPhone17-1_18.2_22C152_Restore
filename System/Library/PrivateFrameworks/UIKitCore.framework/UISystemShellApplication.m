@interface UISystemShellApplication
+ (BOOL)registerAsSystemApp;
+ (BOOL)rendersLocally;
- (BOOL)_openURL:(id)a3;
- (BOOL)_saveSnapshotWithName:(id)a3;
- (BOOL)canOpenURL:(id)a3;
- (BOOL)handleDoubleHeightStatusBarTapWithStyleOverride:(unint64_t)a3;
- (BOOL)handleStatusBarHoverActionForRegion:(int64_t)a3;
- (BOOL)isFrontBoard;
- (BOOL)isSuspended;
- (BOOL)isSuspendedEventsOnly;
- (BOOL)isSuspendedUnderLock;
- (UISystemShellApplication)init;
- (int64_t)_interfaceOrientationRotationDirectionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4;
- (int64_t)startupInterfaceOrientation;
- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5;
- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5 screen:(id)a6;
- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3;
- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3 screen:(id)a4;
@end

@implementation UISystemShellApplication

- (BOOL)isFrontBoard
{
  return 1;
}

+ (BOOL)rendersLocally
{
  return 0;
}

- (BOOL)isSuspended
{
  return 0;
}

- (BOOL)isSuspendedEventsOnly
{
  return 0;
}

- (UISystemShellApplication)init
{
  v17.receiver = self;
  v17.super_class = (Class)UISystemShellApplication;
  v2 = [(UIApplication *)&v17 init];
  v3 = v2;
  if (v2)
  {
    [(UIApplication *)v2 _setShouldFixMainThreadPriority:1];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F62418]) initWithDisplayType:0 name:@"FBSystemAppActiveInterfaceOrientationChanged"];
    interfaceOrientationTransition = v3->_interfaceOrientationTransition;
    v3->_interfaceOrientationTransition = (FBDisplayLayoutTransition *)v4;

    v6 = [MEMORY[0x1E4F62428] sharedInstance];
    objc_msgSend(v6, "setInterfaceOrientation:animationSettings:direction:", -[UISystemShellApplication startupInterfaceOrientation](v3, "startupInterfaceOrientation"), 0, 0);

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_initWeak(&location, v7);

    id v8 = objc_loadWeakRetained(&location);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __32__UISystemShellApplication_init__block_invoke;
    v13[3] = &unk_1E52F1A70;
    objc_copyWeak(&v15, &location);
    v9 = v3;
    v14 = v9;
    uint64_t v10 = [v8 addObserverForName:@"UIApplicationDidFinishLaunchingNotification" object:0 queue:0 usingBlock:v13];
    id didFinishLaunchingObserver = v9->_didFinishLaunchingObserver;
    v9->_id didFinishLaunchingObserver = (id)v10;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __32__UISystemShellApplication_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = MEMORY[0x1E4F143A8];
  v7 = WeakRetained;
  id v8 = *(id *)(a1 + 32);
  id v3 = WeakRetained;
  BSRunLoopPerformAfterCACommit();
  objc_msgSend(v3, "removeObserver:", *(void *)(*(void *)(a1 + 32) + 496), v6, 3221225472, __32__UISystemShellApplication_init__block_invoke_2, &unk_1E52D9F98);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 496);
  *(void *)(v4 + 496) = 0;
}

uint64_t __32__UISystemShellApplication_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) postNotificationName:*MEMORY[0x1E4F623B8] object:*(void *)(a1 + 40)];
}

- (int64_t)startupInterfaceOrientation
{
  return 1;
}

+ (BOOL)registerAsSystemApp
{
  return 1;
}

- (BOOL)isSuspendedUnderLock
{
  return 0;
}

- (BOOL)handleDoubleHeightStatusBarTapWithStyleOverride:(unint64_t)a3
{
  return 1;
}

- (BOOL)handleStatusBarHoverActionForRegion:(int64_t)a3
{
  return 1;
}

- (BOOL)_saveSnapshotWithName:(id)a3
{
  return 0;
}

- (BOOL)canOpenURL:(id)a3
{
  return [(UIApplication *)self _canOpenURL:a3 publicURLsOnly:0];
}

- (BOOL)_openURL:(id)a3
{
  id v4 = a3;
  if (v4 && [(UISystemShellApplication *)self canOpenURL:v4])
  {
    [(UIApplication *)self _applicationOpenURL:v4 payload:0];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3
{
  id v5 = +[UIScreen mainScreen];
  [(UISystemShellApplication *)self noteActiveInterfaceOrientationWillChangeToOrientation:a3 screen:v5];
}

- (void)noteActiveInterfaceOrientationWillChangeToOrientation:(int64_t)a3 screen:(id)a4
{
  id v6 = a4;
  if ([(FBDisplayLayoutTransition *)self->_interfaceOrientationTransition interfaceOrientation] != a3)
  {
    [(FBDisplayLayoutTransition *)self->_interfaceOrientationTransition setInterfaceOrientation:a3];
    [(FBDisplayLayoutTransition *)self->_interfaceOrientationTransition beginTransition];
  }
  v7.receiver = self;
  v7.super_class = (Class)UISystemShellApplication;
  [(UIApplication *)&v7 noteActiveInterfaceOrientationWillChangeToOrientation:a3 screen:v6];
}

- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5
{
  id v8 = a4;
  id v9 = +[UIScreen mainScreen];
  [(UISystemShellApplication *)self noteActiveInterfaceOrientationDidChangeToOrientation:a3 willAnimateWithSettings:v8 fromOrientation:a5 screen:v9];
}

- (void)noteActiveInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithSettings:(id)a4 fromOrientation:(int64_t)a5 screen:(id)a6
{
  id v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UISystemShellApplication;
  [(UIApplication *)&v13 noteActiveInterfaceOrientationDidChangeToOrientation:a3 willAnimateWithSettings:v10 fromOrientation:a5 screen:a6];
  if ([(FBDisplayLayoutTransition *)self->_interfaceOrientationTransition isTransitioning])
  {
    [(FBDisplayLayoutTransition *)self->_interfaceOrientationTransition setInterfaceOrientation:a3];
    [(FBDisplayLayoutTransition *)self->_interfaceOrientationTransition endTransition];
    int64_t v11 = [(UISystemShellApplication *)self _interfaceOrientationRotationDirectionFromOrientation:a5 toOrientation:a3];
    v12 = [MEMORY[0x1E4F62428] sharedInstance];
    [v12 setInterfaceOrientation:a3 animationSettings:v10 direction:v11];
  }
}

- (int64_t)_interfaceOrientationRotationDirectionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  if (a4 == 2) {
    int v4 = 180;
  }
  else {
    int v4 = 0;
  }
  if (a4 == 4) {
    int v5 = -90;
  }
  else {
    int v5 = v4;
  }
  if (a4 == 3) {
    int v6 = 90;
  }
  else {
    int v6 = v5;
  }
  if (a4 == 1) {
    int v6 = 0;
  }
  if (a3 == 2) {
    int v7 = -180;
  }
  else {
    int v7 = 0;
  }
  if (a3 == 4) {
    int v8 = 90;
  }
  else {
    int v8 = v7;
  }
  if (a3 == 3) {
    int v9 = -90;
  }
  else {
    int v9 = v8;
  }
  if (a3 == 1) {
    int v9 = 0;
  }
  int v10 = v9 + v6;
  double v11 = (double)v10;
  if (v10 <= -181)
  {
    do
      double v11 = v11 + 360.0;
    while (v11 < -180.0);
  }
  for (; v11 > 180.0; double v11 = v11 + -360.0)
    ;
  if (fabs(v11) != 180.0 && v11 < 0.0) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishLaunchingObserver, 0);
  objc_storeStrong((id *)&self->_interfaceOrientationTransition, 0);
}

@end