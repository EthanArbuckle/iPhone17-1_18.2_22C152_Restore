@interface SBFDateTimeController
+ (SBFDateTimeController)sharedInstance;
- (NSDate)currentDate;
- (NSDate)overrideDate;
- (double)overrideDateOffset;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setOverrideDateOffset:(double)a3;
@end

@implementation SBFDateTimeController

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

+ (SBFDateTimeController)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_22);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return (SBFDateTimeController *)v2;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (NSDate)currentDate
{
  v3 = self->_overrideDate;
  if (!v3)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
  }
  if (self->_overrideDateOffset != 0.0)
  {
    uint64_t v4 = -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:");

    v3 = (NSDate *)v4;
  }
  return v3;
}

uint64_t __39__SBFDateTimeController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBFDateTimeController);
  uint64_t v1 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)setOverrideDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  overrideDate = self->_overrideDate;
  if (overrideDate != a3)
  {
    v6 = overrideDate;
    v7 = (NSDate *)[a3 copy];
    id v8 = self->_overrideDate;
    self->_overrideDate = v7;

    self->_overrideDateOffset = 0.0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v9 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) controller:self didChangeOverrideDateFromDate:v6];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)setOverrideDateOffset:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_overrideDateOffset != a3)
  {
    v5 = self->_overrideDate;
    overrideDate = self->_overrideDate;
    self->_overrideDate = 0;

    self->_overrideDateOffset = a3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v7 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) controller:self didChangeOverrideDateFromDate:v5];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (double)overrideDateOffset
{
  return self->_overrideDateOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
}

@end