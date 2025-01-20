@interface VCCKApplicationStateObserver
- (BOOL)atomicApplicationVisible;
- (BOOL)isApplicationVisible;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (NSString)bundleIdentifier;
- (VCCKApplicationStateObserver)initWithBundleIdentifier:(id)a3;
- (void)dealloc;
- (void)setApplicationVisible:(BOOL)a3;
- (void)setAtomicApplicationVisible:(BOOL)a3;
@end

@implementation VCCKApplicationStateObserver

void __57__VCCKApplicationStateObserver_initWithBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  v7 = [v4 elements];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __VCApplicationPresentInLayout_block_invoke;
  v10[3] = &unk_1E6540348;
  id v11 = v6;
  id v8 = v6;
  v9 = objc_msgSend(v7, "if_firstObjectPassingTest:", v10);

  if ((v9 != 0) != [WeakRetained isApplicationVisible]) {
    [WeakRetained setApplicationVisible:v9 != 0];
  }
}

- (BOOL)isApplicationVisible
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_atomicApplicationVisible);
  return v2 & 1;
}

- (void)setApplicationVisible:(BOOL)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

- (void)setAtomicApplicationVisible:(BOOL)a3
{
}

- (BOOL)atomicApplicationVisible
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_atomicApplicationVisible);
  return v2 & 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VCCKApplicationStateObserver;
  [(VCCKApplicationStateObserver *)&v3 dealloc];
}

- (VCCKApplicationStateObserver)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"VCCKApplicationStateObserver.m", 56, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)VCCKApplicationStateObserver;
  id v6 = [(VCCKApplicationStateObserver *)&v26 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    atomic_store(0, (unsigned __int8 *)&v6->_atomicApplicationVisible);
    v9 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
    objc_initWeak(&location, v6);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__VCCKApplicationStateObserver_initWithBundleIdentifier___block_invoke;
    v22[3] = &unk_1E6540320;
    objc_copyWeak(&v24, &location);
    id v10 = v5;
    id v23 = v10;
    [v9 setTransitionHandler:v22];
    uint64_t v11 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v9];
    layoutMonitor = v6->_layoutMonitor;
    v6->_layoutMonitor = (FBSDisplayLayoutMonitor *)v11;

    id v13 = [(FBSDisplayLayoutMonitor *)v6->_layoutMonitor currentLayout];
    id v14 = v10;
    v15 = [v13 elements];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __VCApplicationPresentInLayout_block_invoke;
    v27[3] = &unk_1E6540348;
    id v16 = v14;
    id v28 = v16;
    v17 = objc_msgSend(v15, "if_firstObjectPassingTest:", v27);
    BOOL v18 = v17 != 0;

    [(VCCKApplicationStateObserver *)v6 setApplicationVisible:v18];
    v19 = v6;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v6;
}

@end