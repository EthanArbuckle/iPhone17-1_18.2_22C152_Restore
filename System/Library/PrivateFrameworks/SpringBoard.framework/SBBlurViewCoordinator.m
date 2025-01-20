@interface SBBlurViewCoordinator
- (BOOL)isBlurred;
- (NSArray)viewControllers;
- (SBBlurViewCoordinator)init;
- (SBBlurViewCoordinator)initWithElementViewControllers:(id)a3;
- (id)description;
- (unint64_t)state;
- (void)_fireBlocksForState:(unint64_t)a3;
- (void)_setState:(unint64_t)a3;
- (void)addNotifyBlock:(id)a3 forState:(unint64_t)a4;
- (void)removeNotifyBlock:(id)a3 forState:(unint64_t)a4;
- (void)setBlurred:(BOOL)a3 withAnimationFactory:(id)a4 completion:(id)a5;
@end

@implementation SBBlurViewCoordinator

- (SBBlurViewCoordinator)initWithElementViewControllers:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBBlurViewCoordinator;
  v6 = [(SBBlurViewCoordinator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_elementVCs, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mapStateToBlocks = v7->_mapStateToBlocks;
    v7->_mapStateToBlocks = v8;

    v7->_state = 0;
  }

  return v7;
}

- (SBBlurViewCoordinator)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBBlurViewCoordinator.m" lineNumber:35 description:@"use initWithElementViewControllers:"];

  return 0;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t v4 = [(SBBlurViewCoordinator *)self state] - 1;
  if (v4 > 2) {
    id v5 = @"idle";
  }
  else {
    id v5 = off_1E6B0DB88[v4];
  }
  id v6 = (id)[v3 appendObject:v5 withName:@"state"];
  [v3 appendArraySection:self->_elementVCs withName:@"coordinatingVCs" skipIfEmpty:1];
  v7 = [v3 build];

  return v7;
}

- (BOOL)isBlurred
{
  return self->_state - 1 < 2;
}

- (void)setBlurred:(BOOL)a3 withAnimationFactory:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v36 = a4;
  id v9 = a5;
  if (![(SBBlurViewCoordinator *)self isBlurred] && v6)
  {
    unint64_t state = self->_state;
    if (state && state != 3)
    {
      objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"SBBlurViewCoordinator.m" lineNumber:56 description:@"Unexpected state transition for the blur coordinator to blur."];
    }
    SEL v34 = a2;
    [(SBBlurViewCoordinator *)self _setState:1];
    v12 = dispatch_group_create();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v33 = self;
    v13 = self->_elementVCs;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          dispatch_group_enter(v12);
          [v36 duration];
          double v20 = v19;
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_2;
          v47[3] = &unk_1E6AF4AC0;
          v48 = v12;
          [v18 setLiveContentBlurEnabled:1 duration:&__block_literal_global_395 blurDelay:v47 iconViewScale:v20 began:0.0 completion:1.0];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v15);
    }

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_3;
    v45[3] = &unk_1E6AF76F8;
    v45[4] = v33;
    v46[1] = v34;
    v21 = (id *)v46;
    v46[0] = v9;
    v22 = MEMORY[0x1E4F14428];
    v23 = v45;
LABEL_26:
    dispatch_group_notify(v12, v22, v23);

    goto LABEL_27;
  }
  if ([(SBBlurViewCoordinator *)self isBlurred] && !v6)
  {
    if (self->_state - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2 object:self file:@"SBBlurViewCoordinator.m" lineNumber:81 description:@"Unexpected state transition for the blur coordinator to unblur."];
    }
    SEL v35 = a2;
    [(SBBlurViewCoordinator *)self _setState:3];
    v12 = dispatch_group_create();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v24 = self->_elementVCs;
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v42 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          dispatch_group_enter(v12);
          [v36 duration];
          double v31 = v30;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_5;
          v39[3] = &unk_1E6AF4AC0;
          v40 = v12;
          [v29 setLiveContentBlurEnabled:0 duration:&__block_literal_global_23_6 blurDelay:v39 iconViewScale:v31 began:0.0 completion:1.0];
        }
        uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }
      while (v26);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_6;
    block[3] = &unk_1E6AF76F8;
    block[4] = self;
    v38[1] = v35;
    v21 = (id *)v38;
    v38[0] = v9;
    v22 = MEMORY[0x1E4F14428];
    v23 = block;
    goto LABEL_26;
  }
LABEL_27:
}

void __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_2(uint64_t a1)
{
}

uint64_t __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isBlurred])
  {
    v2 = *(void **)(a1 + 32);
    if (v2[2] != 1)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v6 = v5;
      unint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16) - 1;
      if (v7 > 2) {
        v8 = @"idle";
      }
      else {
        v8 = off_1E6B0DB88[v7];
      }
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), v8);

      v2 = *(void **)(a1 + 32);
    }
    [v2 _setState:2];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_5(uint64_t a1)
{
}

uint64_t __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_6(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isBlurred])
  {
    v2 = *(void **)(a1 + 32);
    if (v2[2] != 3)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v6 = v5;
      unint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16) - 1;
      if (v7 > 2) {
        v8 = @"idle";
      }
      else {
        v8 = off_1E6B0DB88[v7];
      }
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), v8);

      v2 = *(void **)(a1 + 32);
    }
    [v2 _setState:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)addNotifyBlock:(id)a3 forState:(unint64_t)a4
{
  BOOL v6 = (void (**)(void))a3;
  if (self->_state == a4)
  {
    v13 = v6;
    v6[2]();
  }
  else
  {
    if (!v6) {
      goto LABEL_8;
    }
    v13 = v6;
    mapStateToBlocks = self->_mapStateToBlocks;
    v8 = [NSNumber numberWithUnsignedInteger:a4];
    id v9 = [(NSMutableDictionary *)mapStateToBlocks objectForKey:v8];

    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v10 = self->_mapStateToBlocks;
      objc_super v11 = [NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)v10 setObject:v9 forKey:v11];
    }
    v12 = (void *)MEMORY[0x1D948C7A0](v13);
    [v9 addObject:v12];
  }
  BOOL v6 = v13;
LABEL_8:
}

- (void)removeNotifyBlock:(id)a3 forState:(unint64_t)a4
{
  mapStateToBlocks = self->_mapStateToBlocks;
  BOOL v6 = NSNumber;
  id v7 = a3;
  id v10 = [v6 numberWithUnsignedInteger:a4];
  v8 = [(NSMutableDictionary *)mapStateToBlocks objectForKey:v10];
  id v9 = (void *)MEMORY[0x1D948C7A0](v7);

  [v8 removeObject:v9];
}

- (void)_setState:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    self->_unint64_t state = a3;
    unint64_t v4 = SBLogAppResize();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      id v7 = (void *)v6;
      unint64_t v8 = self->_state - 1;
      if (v8 > 2) {
        id v9 = @"idle";
      }
      else {
        id v9 = off_1E6B0DB88[v8];
      }
      int v10 = 138412802;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      v13 = self;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "<%@:%p>: blur view coordinator state changed to: %@", (uint8_t *)&v10, 0x20u);
    }
    [(SBBlurViewCoordinator *)self _fireBlocksForState:self->_state];
  }
}

- (void)_fireBlocksForState:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  mapStateToBlocks = self->_mapStateToBlocks;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)mapStateToBlocks objectForKey:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v8 = objc_msgSend(v7, "copy", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  v13 = self->_mapStateToBlocks;
  __int16 v14 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v13 removeObjectForKey:v14];
}

- (NSArray)viewControllers
{
  return self->_elementVCs;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapStateToBlocks, 0);
  objc_storeStrong((id *)&self->_elementVCs, 0);
}

@end