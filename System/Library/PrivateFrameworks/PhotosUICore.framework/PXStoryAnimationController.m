@interface PXStoryAnimationController
- (PXStoryAnimationController)initWithModel:(id)a3;
- (PXStoryAnimationController)initWithObservableModel:(id)a3;
- (PXStoryModel)model;
- (id)checkOutAnimationWithIdentifier:(id)a3 creationBlock:(id)a4;
- (void)_configureAnimation:(id)a3 withAnimationInfo:(id)a4;
- (void)_enumerateAnimationInfosUsingBlock:(id)a3;
- (void)_handleAnimationInvalidation;
- (void)_invalidateAnimations;
- (void)_updateAnimations;
- (void)addAnimation:(id)a3;
- (void)checkInAnimation:(id)a3;
- (void)configureUpdater:(id)a3;
- (void)enumerateAnimationsUsingBlock:(id)a3;
- (void)handleModelChange:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXStoryAnimationController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_model);
  objc_storeStrong((id *)&self->_checkOutCountsByIdentifier, 0);
  objc_storeStrong((id *)&self->_animationInfoByIdentifier, 0);
}

- (PXStoryModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (PXStoryModel *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)AnimationObservationContext == a5)
  {
    if ((a4 & 2) != 0)
    {
      if (self->_isUpdatingAnimations)
      {
        objc_initWeak(&location, self);
        v9 = [(PXStoryController *)self storyQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __59__PXStoryAnimationController_observable_didChange_context___block_invoke;
        block[3] = &unk_1E5DD32D0;
        objc_copyWeak(&v12, &location);
        dispatch_async(v9, block);

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
      else
      {
        [(PXStoryAnimationController *)self _handleAnimationInvalidation];
      }
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXStoryAnimationController;
    [(PXStoryController *)&v10 observable:v8 didChange:a4 context:a5];
  }
}

void __59__PXStoryAnimationController_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAnimationInvalidation];
}

- (void)handleModelChange:(unint64_t)a3
{
  v5 = [(PXStoryController *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  v7.receiver = self;
  v7.super_class = (Class)PXStoryAnimationController;
  [(PXStoryController *)&v7 handleModelChange:a3];
  if ((a3 & 0x4001002) != 0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__PXStoryAnimationController_handleModelChange___block_invoke;
    v6[3] = &unk_1E5DD1110;
    v6[4] = self;
    [(PXStoryController *)self performChanges:v6];
  }
}

uint64_t __48__PXStoryAnimationController_handleModelChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAnimations];
}

- (void)_updateAnimations
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(PXStoryController *)self storyQueue];
  dispatch_assert_queue_V2(v3);

  BOOL isUpdatingAnimations = self->_isUpdatingAnimations;
  self->_BOOL isUpdatingAnimations = 1;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__288740;
  v23 = __Block_byref_object_dispose__288741;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__PXStoryAnimationController__updateAnimations__block_invoke;
  v18[3] = &unk_1E5DD11A8;
  v18[4] = self;
  v18[5] = &v19;
  [(PXStoryAnimationController *)self _enumerateAnimationInfosUsingBlock:v18];
  if ([(id)v20[5] count])
  {
    v5 = PLStoryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(id)v20[5] componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543362;
      v27 = v6;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "[77239634] Removing animations with identifiers: %{public}@", buf, 0xCu);
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = (id)v20[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        -[NSMutableDictionary removeObjectForKey:](self->_animationInfoByIdentifier, "removeObjectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v10++), (void)v14);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v25 count:16];
    }
    while (v8);
  }

  if ([(id)v20[5] count])
  {
    v11 = PLStoryGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(NSMutableDictionary *)self->_animationInfoByIdentifier allKeys];
      v13 = [v12 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "[77239634] Remaining animations: %{public}@", buf, 0xCu);
    }
  }
  self->_BOOL isUpdatingAnimations = isUpdatingAnimations;
  _Block_object_dispose(&v19, 8);
}

void __47__PXStoryAnimationController__updateAnimations__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 animation];
  int v4 = [v3 isStopped];
  if (!v3 || v4)
  {
    v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    uint64_t v9 = [v10 animationIdentifier];
    [v5 addObject:v9];
  }
  else
  {
    [*(id *)(a1 + 32) _configureAnimation:v3 withAnimationInfo:v10];
  }
}

- (void)_invalidateAnimations
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAnimations];
}

- (void)_configureAnimation:(id)a3 withAnimationInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PXStoryController *)self storyQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(PXStoryAnimationController *)self model];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PXStoryAnimationController__configureAnimation_withAnimationInfo___block_invoke;
  v13[3] = &unk_1E5DD1180;
  id v14 = v9;
  id v15 = v7;
  id v16 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v9;
  [v10 performChanges:v13];
}

void __68__PXStoryAnimationController__configureAnimation_withAnimationInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 elapsedTime];
  }
  else {
    memset(&v7[2], 0, sizeof(CMTime));
  }
  v5 = *(void **)(a1 + 40);
  if (v5) {
    [v5 startTime];
  }
  else {
    memset(&v7[1], 0, sizeof(CMTime));
  }
  CMTime lhs = v7[2];
  CMTime rhs = v7[1];
  CMTimeSubtract(&v8, &lhs, &rhs);
  v7[0] = v8;
  [v3 setElapsedTime:v7];
  if ([*(id *)(a1 + 48) canBePaused])
  {
    BOOL v6 = ([*(id *)(a1 + 32) isTouching] & 1) != 0
      || [*(id *)(a1 + 32) desiredPlayState] == 0;
    [v3 setIsPaused:v6];
  }
}

- (void)checkInAnimation:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXStoryController *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    BOOL v6 = [v4 identifier];
    id v7 = PLStoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isUpdatingAnimations = self->_isUpdatingAnimations;
      int v11 = 138543618;
      id v12 = v6;
      __int16 v13 = 1024;
      BOOL v14 = isUpdatingAnimations;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "[77239634] Check in animation with identifier: %{public}@, updatingAnimations: %d", (uint8_t *)&v11, 0x12u);
    }

    [(NSCountedSet *)self->_checkOutCountsByIdentifier removeObject:v6];
    if (![(NSCountedSet *)self->_checkOutCountsByIdentifier countForObject:v6])
    {
      uint64_t v9 = [(NSMutableDictionary *)self->_animationInfoByIdentifier objectForKey:v6];
      id v10 = [v9 animation];
      [v10 performChanges:&__block_literal_global_288752];

      [(NSMutableDictionary *)self->_animationInfoByIdentifier removeObjectForKey:v6];
    }
  }
}

uint64_t __47__PXStoryAnimationController_checkInAnimation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stop];
}

- (id)checkOutAnimationWithIdentifier:(id)a3 creationBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  CMTime v8 = [(PXStoryController *)self storyQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = PLStoryGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isUpdatingAnimations = self->_isUpdatingAnimations;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = isUpdatingAnimations;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "[77239634] Check out animation with identifier: %{public}@, updatingAnimations: %d", buf, 0x12u);
  }

  int v11 = [(NSMutableDictionary *)self->_animationInfoByIdentifier objectForKey:v6];
  id v12 = [v11 animation];
  __int16 v13 = [v11 animation];

  if (v13)
  {
    BOOL v14 = v12;
  }
  else
  {
    BOOL v14 = v7[2](v7);

    memset(buf, 0, sizeof(buf));
    uint64_t v15 = [(PXStoryAnimationController *)self model];
    id v16 = v15;
    if (v15) {
      [v15 elapsedTime];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }

    long long v17 = [_PXStoryAnimationInfo alloc];
    long long v20 = *(_OWORD *)buf;
    uint64_t v21 = *(void *)&buf[16];
    uint64_t v18 = [(_PXStoryAnimationInfo *)v17 initWithAnimation:v14 startTime:&v20];

    [(PXStoryAnimationController *)self _configureAnimation:v14 withAnimationInfo:v18];
    [(PXStoryAnimationController *)self signalChange:1];
    [v14 registerChangeObserver:self context:AnimationObservationContext];
    [(NSMutableDictionary *)self->_animationInfoByIdentifier setObject:v18 forKey:v6];
    int v11 = (void *)v18;
  }
  [(NSCountedSet *)self->_checkOutCountsByIdentifier addObject:v6];
  [(PXStoryAnimationController *)self signalChange:1];

  return v14;
}

- (void)addAnimation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXStoryController *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 identifier];
  id v7 = PLStoryGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isUpdatingAnimations = self->_isUpdatingAnimations;
    *(_DWORD *)buf = 138543618;
    BOOL v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = isUpdatingAnimations;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "[77239634] Add existing animation with identifier: %{public}@, updatingAnimations: %d", buf, 0x12u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__PXStoryAnimationController_addAnimation___block_invoke;
  v11[3] = &unk_1E5DD1138;
  id v12 = v4;
  id v9 = v4;
  id v10 = [(PXStoryAnimationController *)self checkOutAnimationWithIdentifier:v6 creationBlock:v11];
}

id __43__PXStoryAnimationController_addAnimation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_handleAnimationInvalidation
{
  id v3 = [(PXStoryController *)self storyQueue];
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PXStoryAnimationController__handleAnimationInvalidation__block_invoke;
  v4[3] = &unk_1E5DD1110;
  v4[4] = self;
  [(PXStoryController *)self performChanges:v4];
}

uint64_t __58__PXStoryAnimationController__handleAnimationInvalidation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAnimations];
}

- (void)_enumerateAnimationInfosUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryController *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)[(NSMutableDictionary *)self->_animationInfoByIdentifier copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PXStoryAnimationController__enumerateAnimationInfosUsingBlock___block_invoke;
  v8[3] = &unk_1E5DD10E8;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

uint64_t __65__PXStoryAnimationController__enumerateAnimationInfosUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateAnimationsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryController *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PXStoryAnimationController_enumerateAnimationsUsingBlock___block_invoke;
  CMTime v7[3] = &unk_1E5DD10C0;
  id v8 = v4;
  id v6 = v4;
  [(PXStoryAnimationController *)self _enumerateAnimationInfosUsingBlock:v7];
}

void __60__PXStoryAnimationController_enumerateAnimationsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  v5 = [v8 animation];
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v8 animation];
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))(v6, v7, a3);
  }
}

- (void)configureUpdater:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryController *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryAnimationController;
  [(PXStoryController *)&v6 configureUpdater:v4];
  [v4 addUpdateSelector:sel__updateAnimations];
}

- (PXStoryAnimationController)initWithModel:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryAnimationController;
  v5 = [(PXStoryController *)&v12 initWithObservableModel:v4];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    animationInfoByIdentifier = v6->_animationInfoByIdentifier;
    v6->_animationInfoByIdentifier = v7;

    id v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    checkOutCountsByIdentifier = v6->_checkOutCountsByIdentifier;
    v6->_checkOutCountsByIdentifier = v9;
  }
  return v6;
}

- (PXStoryAnimationController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryAnimationController.m", 40, @"%s is not available as initializer", "-[PXStoryAnimationController initWithObservableModel:]");

  abort();
}

@end