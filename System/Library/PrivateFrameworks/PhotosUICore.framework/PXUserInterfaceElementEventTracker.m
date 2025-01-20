@interface PXUserInterfaceElementEventTracker
- (BOOL)hasAppeared;
- (BOOL)isAppActive;
- (BOOL)isVisible;
- (NSMutableDictionary)payload;
- (PXUpdater)updater;
- (PXUserInterfaceElementEventTracker)init;
- (double)currentTimestamp;
- (double)timeIntervalBetweenTimestamp:(double)a3 andTimestamp:(double)a4;
- (double)timeIntervalSinceTimestamp:(double)a3;
- (id)finalPayloadWithPayload:(id)a3;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_invalidateIsVisible;
- (void)_setNeedsUpdate;
- (void)_updateIsVisible;
- (void)didAppear;
- (void)didDisappear;
- (void)didPerformChanges;
- (void)setHasAppeared:(BOOL)a3;
- (void)setIsAppActive:(BOOL)a3;
- (void)setIsVisible:(BOOL)a3;
- (void)setPayload:(id)a3;
@end

@implementation PXUserInterfaceElementEventTracker

- (void)_setNeedsUpdate
{
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXUserInterfaceElementEventTracker;
  [(PXUserInterfaceElementEventTracker *)&v4 didPerformChanges];
  v3 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v3 updateIfNeeded];
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)_updateIsVisible
{
  if ([(PXUserInterfaceElementEventTracker *)self isAppActive]) {
    BOOL v3 = [(PXUserInterfaceElementEventTracker *)self hasAppeared];
  }
  else {
    BOOL v3 = 0;
  }
  [(PXUserInterfaceElementEventTracker *)self setIsVisible:v3];
}

- (BOOL)isAppActive
{
  return self->_isAppActive;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setIsVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    [(PXUserInterfaceElementEventTracker *)self signalChange:1];
  }
}

- (void)_invalidateIsVisible
{
  id v2 = [(PXUserInterfaceElementEventTracker *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsVisible];
}

uint64_t __66__PXUserInterfaceElementEventTracker__applicationDidBecomeActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAppActive:1];
}

uint64_t __47__PXUserInterfaceElementEventTracker_didAppear__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHasAppeared:1];
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (id)finalPayloadWithPayload:(id)a3
{
  id v4 = a3;
  if (![(NSMutableDictionary *)self->_payload count])
  {
    uint64_t v9 = [v4 copy];
    v7 = (void *)v9;
    v10 = (void *)MEMORY[0x1E4F1CC08];
    if (v9) {
      v10 = (void *)v9;
    }
    id v8 = v10;
    goto LABEL_7;
  }
  uint64_t v5 = [v4 count];
  payload = self->_payload;
  if (v5)
  {
    v7 = (void *)[(NSMutableDictionary *)payload mutableCopy];
    [v7 addEntriesFromDictionary:v4];
    id v8 = (id)[v7 copy];
LABEL_7:
    v11 = v8;

    goto LABEL_9;
  }
  v11 = (void *)[(NSMutableDictionary *)payload copy];
LABEL_9:

  return v11;
}

- (double)currentTimestamp
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

- (void)didAppear
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__PXUserInterfaceElementEventTracker_didAppear__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXUserInterfaceElementEventTracker *)self performChanges:v2];
}

- (void)setIsAppActive:(BOOL)a3
{
  if (self->_isAppActive != a3)
  {
    self->_isAppActive = a3;
    [(PXUserInterfaceElementEventTracker *)self signalChange:4];
    [(PXUserInterfaceElementEventTracker *)self _invalidateIsVisible];
  }
}

- (void)setHasAppeared:(BOOL)a3
{
  if (self->_hasAppeared != a3)
  {
    self->_hasAppeared = a3;
    [(PXUserInterfaceElementEventTracker *)self signalChange:2];
    [(PXUserInterfaceElementEventTracker *)self _invalidateIsVisible];
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__PXUserInterfaceElementEventTracker__applicationDidBecomeActive___block_invoke;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = self;
  [(PXUserInterfaceElementEventTracker *)self performChanges:v3];
}

- (PXUserInterfaceElementEventTracker)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PXUserInterfaceElementEventTracker;
  id v2 = [(PXUserInterfaceElementEventTracker *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v2 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v2->_updater;
    v2->_updater = (PXUpdater *)v3;

    [(PXUpdater *)v2->_updater addUpdateSelector:sel__updateIsVisible];
    if (_UIApplicationIsExtension())
    {
      BOOL v5 = 1;
      v6 = (id *)MEMORY[0x1E4F28270];
      v7 = (id *)MEMORY[0x1E4F28288];
    }
    else
    {
      id v8 = [MEMORY[0x1E4FB1438] sharedApplication];
      BOOL v5 = [v8 applicationState] == 0;

      v6 = (id *)MEMORY[0x1E4FB2628];
      v7 = (id *)MEMORY[0x1E4FB2738];
    }
    id v9 = *v7;
    id v10 = *v6;
    v11 = v10;
    v2->_isAppActive = v5;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      PXAssertGetLog();
    }
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v2 selector:sel__applicationWillResignActive_ name:v9 object:0];
    [v13 addObserver:v2 selector:sel__applicationDidBecomeActive_ name:v11 object:0];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)setPayload:(id)a3
{
}

- (void)_applicationWillResignActive:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__PXUserInterfaceElementEventTracker__applicationWillResignActive___block_invoke;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = self;
  [(PXUserInterfaceElementEventTracker *)self performChanges:v3];
}

uint64_t __67__PXUserInterfaceElementEventTracker__applicationWillResignActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAppActive:0];
}

- (double)timeIntervalBetweenTimestamp:(double)a3 andTimestamp:(double)a4
{
  return a4 - a3;
}

- (double)timeIntervalSinceTimestamp:(double)a3
{
  [(PXUserInterfaceElementEventTracker *)self currentTimestamp];
  [(PXUserInterfaceElementEventTracker *)self timeIntervalBetweenTimestamp:a3 andTimestamp:v5];
  return result;
}

- (NSMutableDictionary)payload
{
  payload = self->_payload;
  if (!payload)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    double v5 = self->_payload;
    self->_payload = v4;

    payload = self->_payload;
  }
  return payload;
}

- (void)didDisappear
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__PXUserInterfaceElementEventTracker_didDisappear__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXUserInterfaceElementEventTracker *)self performChanges:v2];
}

uint64_t __50__PXUserInterfaceElementEventTracker_didDisappear__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHasAppeared:0];
}

@end