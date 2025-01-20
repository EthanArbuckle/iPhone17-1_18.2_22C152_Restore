@interface PBUIWallpaperFloatingLayerAssertion
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithContainerView:(void *)a3 forReason:(void *)a4 invalidationBlock:;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)containerView;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithAnimationFactory:(id)a3;
@end

@implementation PBUIWallpaperFloatingLayerAssertion

- (id)initWithContainerView:(void *)a3 forReason:(void *)a4 invalidationBlock:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (a1)
  {
    if (!v10)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel_initWithContainerView_forReason_invalidationBlock_, a1, @"PBUIWallpaperFloatingLayerAssertion.m", 21, @"Invalid parameter not satisfying: %@", @"invalidationBlock" object file lineNumber description];
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__PBUIWallpaperFloatingLayerAssertion_initWithContainerView_forReason_invalidationBlock___block_invoke;
    v19[3] = &unk_1E62B42A8;
    id v20 = v11;
    v12 = (void *)MEMORY[0x1C1872570](v19);
    v18.receiver = a1;
    v18.super_class = (Class)PBUIWallpaperFloatingLayerAssertion;
    v13 = (id *)objc_msgSendSuper2(&v18, sel_initWithIdentifier_forReason_invalidationBlock_, @"WallpaperFloatingLayer", v9, v12);
    v14 = v13;
    if (v13) {
      objc_storeStrong(v13 + 7, a2);
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __89__PBUIWallpaperFloatingLayerAssertion_initWithContainerView_forReason_invalidationBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  id v9 = *(id *)(a1 + 32);
  id v8 = v7;
  BSDispatchMain();
}

uint64_t __89__PBUIWallpaperFloatingLayerAssertion_initWithContainerView_forReason_invalidationBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 48));
}

- (void)invalidate
{
}

- (void)invalidateWithAnimationFactory:(id)a3
{
  uint64_t v4 = (BSUIAnimationFactory *)[a3 copy];
  invalidationAnimationFactory = self->_invalidationAnimationFactory;
  self->_invalidationAnimationFactory = v4;

  v6.receiver = self;
  v6.super_class = (Class)PBUIWallpaperFloatingLayerAssertion;
  [(BSSimpleAssertion *)&v6 invalidate];
}

- (void)dealloc
{
  [(PBUIWallpaperFloatingLayerAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperFloatingLayerAssertion;
  [(BSSimpleAssertion *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperFloatingLayerAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(PBUIWallpaperFloatingLayerAssertion *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(PBUIWallpaperFloatingLayerAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(PBUIWallpaperFloatingLayerAssertion *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_containerView withName:@"ContainerView"];
  return v4;
}

- (uint64_t)containerView
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_invalidationAnimationFactory, 0);
}

@end