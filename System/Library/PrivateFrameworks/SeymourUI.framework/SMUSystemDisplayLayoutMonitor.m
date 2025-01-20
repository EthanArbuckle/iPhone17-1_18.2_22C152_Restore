@interface SMUSystemDisplayLayoutMonitor
+ (id)externalDisplayLayoutMonitorWithIdentity:(id)a3;
+ (id)mainDisplayLayoutMonitor;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (NSArray)currentLayout;
- (SMUSystemDisplayLayoutMonitor)init;
- (SMUSystemDisplayLayoutMonitor)initWithConfiguration:(id)a3;
- (id)transitionHandler;
- (void)dealloc;
- (void)handleUpdatedLayout:(id)a3 transitionContext:(id)a4;
- (void)setTransitionHandler:(id)a3;
@end

@implementation SMUSystemDisplayLayoutMonitor

- (void)handleUpdatedLayout:(id)a3 transitionContext:(id)a4
{
  id v12 = a3;
  uint64_t v5 = [(SMUSystemDisplayLayoutMonitor *)self transitionHandler];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v12 elements];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      v9 = [(SMUSystemDisplayLayoutMonitor *)self transitionHandler];
      v10 = [v12 displayConfiguration];
      v11 = [v12 elements];
      ((void (**)(void, void *, void *))v9)[2](v9, v10, v11);
    }
  }
}

- (id)transitionHandler
{
  return self->transitionHandler;
}

- (void)setTransitionHandler:(id)a3
{
}

+ (id)mainDisplayLayoutMonitor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (SMUSystemDisplayLayoutMonitor)init
{
  v3 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  v4 = [(SMUSystemDisplayLayoutMonitor *)self initWithConfiguration:v3];

  return v4;
}

- (SMUSystemDisplayLayoutMonitor)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SMUSystemDisplayLayoutMonitor;
  uint64_t v5 = [(SMUSystemDisplayLayoutMonitor *)&v15 init];
  if (v5)
  {
    objc_initWeak(&location, v5);
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __55__SMUSystemDisplayLayoutMonitor_initWithConfiguration___block_invoke;
    id v12 = &unk_264DBD160;
    objc_copyWeak(&v13, &location);
    [v4 setTransitionHandler:&v9];
    uint64_t v6 = objc_msgSend(MEMORY[0x263F3F728], "monitorWithConfiguration:", v4, v9, v10, v11, v12);
    layoutMonitor = v5->_layoutMonitor;
    v5->_layoutMonitor = (FBSDisplayLayoutMonitor *)v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __55__SMUSystemDisplayLayoutMonitor_initWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained handleUpdatedLayout:v7 transitionContext:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutMonitor, 0);

  objc_storeStrong(&self->transitionHandler, 0);
}

- (void)dealloc
{
  v3 = [(SMUSystemDisplayLayoutMonitor *)self layoutMonitor];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SMUSystemDisplayLayoutMonitor;
  [(SMUSystemDisplayLayoutMonitor *)&v4 dealloc];
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

+ (id)externalDisplayLayoutMonitorWithIdentity:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = SBSCreateLayoutServiceEndpointForExternalDisplay();
    uint64_t v5 = [MEMORY[0x263F3F738] configurationWithEndpoint:v4];
    id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConfiguration:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSArray)currentLayout
{
  id v2 = [(SMUSystemDisplayLayoutMonitor *)self layoutMonitor];
  id v3 = [v2 currentLayout];
  objc_super v4 = [v3 elements];

  return (NSArray *)v4;
}

@end