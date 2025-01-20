@interface RBSStateCaptureSet
- (NSSet)itemsCopy;
- (RBSStateCaptureSet)init;
- (void)addItem:(id)a3;
- (void)removeItem:(id)a3;
@end

@implementation RBSStateCaptureSet

- (void)addItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 captureState];
  uint64_t v6 = [v5 length];

  os_unfair_lock_assert_owner(&_stateCaptureLock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = self->_stateCaptureSegments;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v8)
  {

LABEL_15:
    v10 = objc_alloc_init(RBSStateCaptureSetSegment);
    [(NSMutableSet *)self->_stateCaptureSegments addObject:v10];
    goto LABEL_16;
  }
  uint64_t v9 = v8;
  v10 = 0;
  uint64_t v11 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v7);
      }
      v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      if ((unint64_t)objc_msgSend(v13, "count", (void)v16) <= 0x18)
      {
        if (!v10 || (unint64_t v14 = -[RBSStateCaptureSetSegment count](v10, "count"), v14 < [v13 count]))
        {
          v15 = v13;

          v10 = v15;
        }
      }
    }
    uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v9);

  if (!v10) {
    goto LABEL_15;
  }
LABEL_16:
  -[RBSStateCaptureSetSegment addItem:withLength:](v10, "addItem:withLength:", v4, v6, (void)v16);
}

- (void)removeItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&_stateCaptureLock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_stateCaptureSegments;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      if (objc_msgSend(v10, "containsItem:", v4, (void)v19)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (!v11) {
      goto LABEL_13;
    }
    [v11 removeItem:v4];
    if (![v11 count]) {
      [(NSMutableSet *)self->_stateCaptureSegments removeObject:v11];
    }
  }
  else
  {
LABEL_9:

LABEL_13:
    v12 = rbs_general_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RBSStateCaptureSet removeItem:]((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);
    }

    id v11 = 0;
  }
}

- (RBSStateCaptureSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)RBSStateCaptureSet;
  v2 = [(RBSStateCaptureSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    stateCaptureSegments = v2->_stateCaptureSegments;
    v2->_stateCaptureSegments = (NSMutableSet *)v3;
  }
  return v2;
}

- (NSSet)itemsCopy
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&_stateCaptureLock);
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_stateCaptureSegments;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "items", (void)v12);
        v10 = [v9 allObjects];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureSegments, 0);
  objc_storeStrong((id *)&self->_invalidatable, 0);
}

- (void)removeItem:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end