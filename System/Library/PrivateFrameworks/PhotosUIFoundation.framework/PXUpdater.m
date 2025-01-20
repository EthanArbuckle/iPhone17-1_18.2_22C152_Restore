@interface PXUpdater
- (BOOL)extraChecksEnabled;
- (BOOL)hasAlreadyUpdatedSelector:(SEL)a3;
- (BOOL)isPerformingUpdates;
- (BOOL)isUpdatePassScheduled;
- (PXUpdater)init;
- (PXUpdater)initWithTarget:(id)a3;
- (PXUpdater)initWithTarget:(id)a3 needsUpdateSelector:(SEL)a4;
- (SEL)needsUpdateSelector;
- (id)target;
- (void)_scheduleUpdatePassIfNeeded;
- (void)addUpdateSelector:(SEL)a3;
- (void)addUpdateSelector:(SEL)a3 needsUpdate:(BOOL)a4;
- (void)dealloc;
- (void)setExtraChecksEnabled:(BOOL)a3;
- (void)setNeedsUpdateOf:(SEL)a3;
- (void)setNeedsUpdateSelector:(SEL)a3;
- (void)setUpdatePassScheduled:(BOOL)a3;
- (void)updateIfNeeded;
@end

@implementation PXUpdater

- (void)addUpdateSelector:(SEL)a3
{
}

- (void)setNeedsUpdateOf:(SEL)a3
{
  if (self->_isPerformingUpdates
    && [(NSMutableIndexSet *)self->_updateSelectorsAlreadyUpdated containsIndex:a3])
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    v7 = NSStringFromSelector(a3);
    [v6 handleFailureInMethod:a2, self, @"PXUpdater.m", 98, @"%@ marking %@ as needing update after it already has been updated", self, v7 object file lineNumber description];

    abort();
  }
  [(NSMutableIndexSet *)self->_updateSelectorsNeedingUpdate addIndex:a3];

  [(PXUpdater *)self _scheduleUpdatePassIfNeeded];
}

- (void)_scheduleUpdatePassIfNeeded
{
  if (![(PXUpdater *)self isUpdatePassScheduled])
  {
    v3 = [(PXUpdater *)self needsUpdateSelector];
    if (v3)
    {
      v4 = v3;
      self->_hasUpdatedForCurrentPass = 0;
      v5 = [(PXUpdater *)self target];
      [v5 performSelector:v4 withObject:0];

      if (!self->_hasUpdatedForCurrentPass)
      {
        [(PXUpdater *)self setUpdatePassScheduled:1];
      }
    }
  }
}

- (BOOL)isUpdatePassScheduled
{
  return self->_updatePassScheduled;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (SEL)needsUpdateSelector
{
  return self->_needsUpdateSelector;
}

- (void)addUpdateSelector:(SEL)a3 needsUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v8 = [(PXUpdater *)self extraChecksEnabled];
  unint64_t orderedUpdateSelectorsCount = self->_orderedUpdateSelectorsCount;
  if (v8 && orderedUpdateSelectorsCount)
  {
    for (uint64_t i = 0; i != orderedUpdateSelectorsCount; ++i)
    {
      if (self->_orderedUpdateSelectors[i] == a3)
      {
        v14 = [MEMORY[0x263F08690] currentHandler];
        v15 = NSStringFromSelector(a3);
        [v14 handleFailureInMethod:a2, self, @"PXUpdater.m", 67, @"%@ update selector %@ already added", self, v15 object file lineNumber description];

        abort();
      }
    }
  }
  orderedUpdateSelectors = self->_orderedUpdateSelectors;
  unint64_t orderedUpdateSelectorsCapacity = self->_orderedUpdateSelectorsCapacity;
  while (orderedUpdateSelectorsCount >= orderedUpdateSelectorsCapacity)
  {
    if (orderedUpdateSelectorsCapacity <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = orderedUpdateSelectorsCapacity;
    }
    self->_unint64_t orderedUpdateSelectorsCapacity = 2 * v13;
    orderedUpdateSelectors = malloc_type_realloc(orderedUpdateSelectors, 16 * v13, 0x80040B8603338uLL);
    self->_orderedUpdateSelectors = (SEL *)orderedUpdateSelectors;
    unint64_t orderedUpdateSelectorsCapacity = self->_orderedUpdateSelectorsCapacity;
    unint64_t orderedUpdateSelectorsCount = self->_orderedUpdateSelectorsCount;
  }
  *((void *)orderedUpdateSelectors + orderedUpdateSelectorsCount) = a3;
  self->_unint64_t orderedUpdateSelectorsCount = orderedUpdateSelectorsCount + 1;
  if (v4)
  {
    [(PXUpdater *)self setNeedsUpdateOf:a3];
  }
}

- (BOOL)extraChecksEnabled
{
  return self->_extraChecksEnabled;
}

- (void)updateIfNeeded
{
  self->_hasUpdatedForCurrentPass = 1;
  if ([(NSMutableIndexSet *)self->_updateSelectorsNeedingUpdate count])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(NSMutableIndexSet *)self->_updateSelectorsAlreadyUpdated removeAllIndexes];
    id v11 = [(PXUpdater *)self target];
    if (self->_orderedUpdateSelectorsCount)
    {
      unint64_t v5 = 0;
      do
      {
        SEL v6 = self->_orderedUpdateSelectors[v5];
        [(NSMutableIndexSet *)self->_updateSelectorsAlreadyUpdated addIndex:v6];
        if ([(NSMutableIndexSet *)self->_updateSelectorsNeedingUpdate containsIndex:v6])
        {
          [(NSMutableIndexSet *)self->_updateSelectorsNeedingUpdate removeIndex:v6];
          [v11 performSelector:v6 withObject:0];
        }
        ++v5;
      }
      while (v5 < self->_orderedUpdateSelectorsCount);
    }
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
    if (!isPerformingUpdates)
    {
      [(PXUpdater *)self setUpdatePassScheduled:0];
      if ([(NSMutableIndexSet *)self->_updateSelectorsNeedingUpdate count])
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableIndexSet count](self->_updateSelectorsNeedingUpdate, "count"));
        updateSelectorsNeedingUpdate = self->_updateSelectorsNeedingUpdate;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __27__PXUpdater_updateIfNeeded__block_invoke;
        v12[3] = &unk_26545B890;
        id v9 = v7;
        v12[4] = v9;
        [(NSMutableIndexSet *)updateSelectorsNeedingUpdate enumerateIndexesUsingBlock:v12];
        v10 = [MEMORY[0x263F08690] currentHandler];
        [v10 handleFailureInMethod:a2, self, @"PXUpdater.m", 178, @"%@ still needing update after update pass: %@", self, v9 object file lineNumber description];

        abort();
      }
    }
  }
}

- (void)setUpdatePassScheduled:(BOOL)a3
{
  self->_updatePassScheduled = a3;
}

- (PXUpdater)initWithTarget:(id)a3
{
  return [(PXUpdater *)self initWithTarget:a3 needsUpdateSelector:0];
}

- (PXUpdater)initWithTarget:(id)a3 needsUpdateSelector:(SEL)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXUpdater;
  v7 = [(PXUpdater *)&v14 init];
  BOOL v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    v8->_needsUpdateSelector = a4;
    v8->_unint64_t orderedUpdateSelectorsCapacity = 32;
    v8->_orderedUpdateSelectors = (SEL *)malloc_type_calloc(0x20uLL, 8uLL, 0x80040B8603338uLL);
    id v9 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    updateSelectorsNeedingUpdate = v8->_updateSelectorsNeedingUpdate;
    v8->_updateSelectorsNeedingUpdate = v9;

    id v11 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    updateSelectorsAlreadyUpdated = v8->_updateSelectorsAlreadyUpdated;
    v8->_updateSelectorsAlreadyUpdated = v11;

    v8->_extraChecksEnabled = 0;
  }

  return v8;
}

- (void)setNeedsUpdateSelector:(SEL)a3
{
  if (self->_needsUpdateSelector != a3)
  {
    self->_needsUpdateSelector = a3;
    [(PXUpdater *)self setUpdatePassScheduled:0];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_updateSelectorsAlreadyUpdated, 0);

  objc_storeStrong((id *)&self->_updateSelectorsNeedingUpdate, 0);
}

- (void)setExtraChecksEnabled:(BOOL)a3
{
  self->_extraChecksEnabled = a3;
}

- (BOOL)isPerformingUpdates
{
  return self->_isPerformingUpdates;
}

void __27__PXUpdater_updateIfNeeded__block_invoke(uint64_t a1, SEL aSelector)
{
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(aSelector);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (BOOL)hasAlreadyUpdatedSelector:(SEL)a3
{
  return self->_isPerformingUpdates
      && ([(NSMutableIndexSet *)self->_updateSelectorsAlreadyUpdated containsIndex:a3] & 1) != 0;
}

- (void)dealloc
{
  orderedUpdateSelectors = self->_orderedUpdateSelectors;
  if (orderedUpdateSelectors) {
    free(orderedUpdateSelectors);
  }
  v4.receiver = self;
  v4.super_class = (Class)PXUpdater;
  [(PXUpdater *)&v4 dealloc];
}

- (PXUpdater)init
{
  objc_super v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXUpdater.m", 28, @"%s is not available as initializer", "-[PXUpdater init]");

  abort();
}

@end