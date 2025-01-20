@interface SBWorkspaceTransientOverlay
- (SBTransientOverlayViewController)viewController;
- (SBWorkspaceTransientOverlay)initWithViewController:(id)a3;
- (id)_generator;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SBWorkspaceTransientOverlay

- (SBWorkspaceTransientOverlay)initWithViewController:(id)a3
{
  id v5 = a3;
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"%@-%p", v8, v5];
  v12.receiver = self;
  v12.super_class = (Class)SBWorkspaceTransientOverlay;
  v10 = [(SBWorkspaceEntity *)&v12 initWithIdentifier:v9 displayChangeSettings:0];

  if (v10) {
    objc_storeStrong((id *)&v10->_viewController, a3);
  }

  return v10;
}

- (id)_generator
{
  v3 = objc_opt_class();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__SBWorkspaceTransientOverlay__generator__block_invoke;
  v7[3] = &unk_1E6B093A0;
  objc_copyWeak(v8, &location);
  v8[1] = v3;
  v4 = (void *)MEMORY[0x1D948C7A0](v7);
  id v5 = (void *)MEMORY[0x1D948C7A0]();

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

id __41__SBWorkspaceTransientOverlay__generator__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    v3 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithViewController:WeakRetained[5]];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBWorkspaceTransientOverlay;
  v4 = [(SBWorkspaceEntity *)&v7 copyWithZone:a3];
  id v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 5, self->_viewController);
  }
  return v5;
}

- (SBTransientOverlayViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
}

@end