@interface PXInfoUpdater
- (BOOL)isUpdatingInfo;
- (BOOL)shouldUpdateInfo;
- (NSProgress)currentUpdateProgress;
- (NSString)infoKind;
- (PXInfoProvider)infoProvider;
- (PXInfoUpdater)init;
- (PXInfoUpdater)initWithInfoProvider:(id)a3 infoKind:(id)a4;
- (PXInfoUpdaterObserver)observer;
- (id)info;
- (int64_t)currentUpdateGeneration;
- (int64_t)currentUpdatePriority;
- (void)_handleCurrentUpdateWithInfo:(id)a3 generation:(int64_t)a4;
- (void)_updateInfo;
- (void)_updateInfoIfNeeded;
- (void)invalidateInfo;
- (void)performBlockWhenDoneUpdating:(id)a3;
- (void)setCurrentUpdateGeneration:(int64_t)a3;
- (void)setCurrentUpdatePriority:(int64_t)a3;
- (void)setCurrentUpdateProgress:(id)a3;
- (void)setInfo:(id)a3;
- (void)setIsUpdatingInfo:(BOOL)a3;
- (void)setObserver:(id)a3;
- (void)setShouldUpdateInfo:(BOOL)a3;
@end

@implementation PXInfoUpdater

void __21__PXInfoUpdater_info__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateInfoIfNeeded];
}

- (void)invalidateInfo
{
  [(PXInfoUpdater *)self setShouldUpdateInfo:1];
  [(PXInfoUpdater *)self _updateInfoIfNeeded];
}

void __28__PXInfoUpdater__updateInfo__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleCurrentUpdateWithInfo:*(void *)(a1 + 32) generation:*(void *)(a1 + 48)];
}

- (void)_handleCurrentUpdateWithInfo:(id)a3 generation:(int64_t)a4
{
  id v6 = a3;
  if ([(PXInfoUpdater *)self currentUpdateGeneration] == a4)
  {
    [(PXInfoUpdater *)self setInfo:v6];
    [(PXInfoUpdater *)self setIsUpdatingInfo:0];
    if ([(PXInfoUpdater *)self shouldUpdateInfo]) {
      [(PXInfoUpdater *)self _updateInfo];
    }
  }
}

- (void)_updateInfoIfNeeded
{
  if ([(PXInfoUpdater *)self shouldUpdateInfo])
  {
    if ([(PXInfoUpdater *)self isUpdatingInfo])
    {
      if (!self->_infoProviderRespondsTo.priorityForInfoRequestOfKind) {
        return;
      }
      v3 = [(PXInfoUpdater *)self infoProvider];
      v4 = [(PXInfoUpdater *)self infoKind];
      uint64_t v5 = [v3 priorityForInfoRequestOfKind:v4];

      if (v5 <= [(PXInfoUpdater *)self currentUpdatePriority]) {
        return;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    if (!self->_observerRespondsTo.shouldUpdate
      || ([(PXInfoUpdater *)self observer],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 infoUpdaterShouldUpdate:self],
          v6,
          v7))
    {
      [(PXInfoUpdater *)self setCurrentUpdatePriority:v5];
      [(PXInfoUpdater *)self _updateInfo];
    }
  }
}

void __46__PXInfoUpdater_performBlockWhenDoneUpdating___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained performBlockWhenDoneUpdating:*(void *)(a1 + 32)];
}

- (void)performBlockWhenDoneUpdating:(id)a3
{
  v4 = (void (**)(void))a3;
  if ([(PXInfoUpdater *)self isUpdatingInfo]
    || [(PXInfoUpdater *)self shouldUpdateInfo])
  {
    [(PXInfoUpdater *)self info];

    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PXInfoUpdater_performBlockWhenDoneUpdating___block_invoke;
    block[3] = &unk_1E5DD1848;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    v4[2](v4);
  }
}

- (BOOL)isUpdatingInfo
{
  return self->_isUpdatingInfo;
}

- (id)info
{
  if ([(PXInfoUpdater *)self shouldUpdateInfo])
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __21__PXInfoUpdater_info__block_invoke;
    v5[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  id info = self->_info;
  return info;
}

- (BOOL)shouldUpdateInfo
{
  return self->_shouldUpdateInfo;
}

- (void)setInfo:(id)a3
{
  id v5 = a3;
  if (self->_info != v5)
  {
    id v7 = v5;
    objc_storeStrong(&self->_info, a3);
    id v6 = [(PXInfoUpdater *)self observer];
    [v6 infoUpdaterDidUpdate:self];

    id v5 = v7;
  }
}

- (void)_updateInfo
{
  v3 = (void *)([(PXInfoUpdater *)self currentUpdateGeneration] + 1);
  [(PXInfoUpdater *)self setCurrentUpdateGeneration:v3];
  [(PXInfoUpdater *)self setShouldUpdateInfo:0];
  [(PXInfoUpdater *)self setIsUpdatingInfo:1];
  v4 = [(PXInfoUpdater *)self currentUpdateProgress];
  [v4 cancel];

  id v5 = [(PXInfoUpdater *)self infoProvider];
  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = [(PXInfoUpdater *)self infoKind];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __28__PXInfoUpdater__updateInfo__block_invoke;
    v8[3] = &unk_1E5DB11B8;
    objc_copyWeak(v9, &location);
    v9[1] = v3;
    id v7 = [v5 requestInfoOfKind:v6 withResultHandler:v8];

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PXInfoUpdater *)self _handleCurrentUpdateWithInfo:0 generation:v3];
    id v7 = 0;
  }
  [(PXInfoUpdater *)self setCurrentUpdateProgress:v7];
}

- (void)setIsUpdatingInfo:(BOOL)a3
{
  self->_isUpdatingInfo = a3;
}

- (int64_t)currentUpdateGeneration
{
  return self->_currentUpdateGeneration;
}

- (void)setShouldUpdateInfo:(BOOL)a3
{
  self->_shouldUpdateInfo = a3;
}

- (PXInfoProvider)infoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoProvider);
  return (PXInfoProvider *)WeakRetained;
}

- (NSString)infoKind
{
  return self->_infoKind;
}

- (void)setCurrentUpdateProgress:(id)a3
{
}

- (void)setCurrentUpdateGeneration:(int64_t)a3
{
  self->_currentUpdateGeneration = a3;
}

- (NSProgress)currentUpdateProgress
{
  return self->_currentUpdateProgress;
}

- (PXInfoUpdaterObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PXInfoUpdaterObserver *)WeakRetained;
}

- (void)setCurrentUpdatePriority:(int64_t)a3
{
  self->_currentUpdatePriority = a3;
}

- (int64_t)currentUpdatePriority
{
  return self->_currentUpdatePriority;
}

- (void)setObserver:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_observer, obj);
    self->_observerRespondsTo.shouldUpdate = objc_opt_respondsToSelector() & 1;
    [(PXInfoUpdater *)self _updateInfoIfNeeded];
  }
}

void __28__PXInfoUpdater__updateInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v3;
  v4[1] = *(id *)(a1 + 40);
  px_dispatch_on_main_queue();
}

- (PXInfoUpdater)initWithInfoProvider:(id)a3 infoKind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXInfoUpdater;
  v8 = [(PXInfoUpdater *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_infoProvider, v6);
    v9->_infoProviderRespondsTo.priorityForInfoRequestOfKind = objc_opt_respondsToSelector() & 1;
    uint64_t v10 = [v7 copy];
    infoKind = v9->_infoKind;
    v9->_infoKind = (NSString *)v10;

    v9->_shouldUpdateInfo = 1;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUpdateProgress, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_infoKind, 0);
  objc_destroyWeak((id *)&self->_infoProvider);
  objc_storeStrong(&self->_info, 0);
}

- (PXInfoUpdater)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXInfoUpdater.m", 36, @"%s is not available as initializer", "-[PXInfoUpdater init]");

  abort();
}

@end