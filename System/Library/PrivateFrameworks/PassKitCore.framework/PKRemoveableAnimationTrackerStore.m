@interface PKRemoveableAnimationTrackerStore
- (NSArray)trackers;
- (PKRemoveableAnimationTrackerStore)init;
- (void)clear;
- (void)preempt;
- (void)remove;
@end

@implementation PKRemoveableAnimationTrackerStore

- (PKRemoveableAnimationTrackerStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKRemoveableAnimationTrackerStore;
  v2 = [(PKRemoveableAnimationTrackerStore *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    trackers = v2->_trackers;
    v2->_trackers = v3;
  }
  return v2;
}

- (void)preempt
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = self->_trackers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (!v3)
  {
LABEL_23:

    return;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v18 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
      if (v8 && !*(unsigned char *)(v8 + 11) && !*(unsigned char *)(v8 + 8))
      {
        if (!v5) {
          id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v5 addObject:v8];
      }
    }
    uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  }
  while (v4);

  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v2 = (NSMutableArray *)v5;
    uint64_t v9 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v2);
          }
          -[PKRemoveableAnimationTracker _preempt](*(void *)(*((void *)&v13 + 1) + 8 * j));
        }
        uint64_t v10 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }

    goto LABEL_23;
  }
}

- (void)remove
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self && [(NSMutableArray *)self->_trackers count]) {
    uint64_t v3 = (void *)[(NSMutableArray *)self->_trackers copy];
  }
  else {
    uint64_t v3 = 0;
  }
  [(NSMutableArray *)self->_trackers removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        if (v9) {
          *(unsigned char *)(v9 + 10) = 0;
        }
        -[PKRemoveableAnimationTracker _remove](v9);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)clear
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self && [(NSMutableArray *)self->_trackers count]) {
    uint64_t v3 = (void *)[(NSMutableArray *)self->_trackers copy];
  }
  else {
    uint64_t v3 = 0;
  }
  [(NSMutableArray *)self->_trackers removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        if (v9) {
          *(unsigned char *)(v9 + 10) = 0;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSArray)trackers
{
  if (self)
  {
    uint64_t v3 = self;
    self = (PKRemoveableAnimationTrackerStore *)[(NSMutableArray *)self->_trackers count];
    if (self) {
      self = (PKRemoveableAnimationTrackerStore *)[(NSMutableArray *)v3->_trackers copy];
    }
    uint64_t v2 = vars8;
  }
  return (NSArray *)self;
}

- (void).cxx_destruct
{
}

@end