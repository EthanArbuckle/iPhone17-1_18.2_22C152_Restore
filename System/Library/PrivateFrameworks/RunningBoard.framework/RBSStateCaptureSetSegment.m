@interface RBSStateCaptureSetSegment
- (BOOL)containsItem:(id)a3;
- (NSSet)items;
- (RBSStateCaptureSetSegment)init;
- (id)_stateCapture;
- (unint64_t)count;
- (void)addItem:(id)a3 withLength:(unint64_t)a4;
- (void)dealloc;
- (void)removeItem:(id)a3;
@end

@implementation RBSStateCaptureSetSegment

- (unint64_t)count
{
  return [(NSMutableSet *)self->_items count];
}

- (void)addItem:(id)a3 withLength:(unint64_t)a4
{
}

- (BOOL)containsItem:(id)a3
{
  return [(NSMutableSet *)self->_items containsObject:a3];
}

- (void)removeItem:(id)a3
{
}

- (NSSet)items
{
  return (NSSet *)self->_items;
}

- (RBSStateCaptureSetSegment)init
{
  v15.receiver = self;
  v15.super_class = (Class)RBSStateCaptureSetSegment;
  v2 = [(RBSStateCaptureSetSegment *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    items = v2->_items;
    v2->_items = (NSMutableSet *)v3;

    objc_initWeak(&location, v2);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __33__RBSStateCaptureSetSegment_init__block_invoke;
    v12[3] = &unk_2647C8A28;
    objc_copyWeak(&v13, &location);
    v5 = (void *)MEMORY[0x22A6611D0](v12);
    uint64_t v6 = segmentUniqueID++;
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"RBSStateCaptureSet Segment %d", v6);
    v8 = dispatch_get_global_queue(17, 0);
    uint64_t v9 = _RBLogAddStateCaptureBlockWithTitle(v8, v7, v5);
    invalidatable = v2->_invalidatable;
    v2->_invalidatable = (RBSInvalidatable *)v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

__CFString *__33__RBSStateCaptureSetSegment_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained _stateCapture];
  }
  else
  {
    uint64_t v3 = &stru_26DA9D688;
  }

  return v3;
}

- (id)_stateCapture
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock(&_stateCaptureLock);
  uint64_t v3 = (void *)[(NSMutableSet *)self->_items copy];
  os_unfair_lock_unlock(&_stateCaptureLock);
  v4 = [MEMORY[0x263F089D8] string];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "captureState", (void)v12);
        [v4 appendString:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)dealloc
{
  [(RBSInvalidatable *)self->_invalidatable invalidate];
  v3.receiver = self;
  v3.super_class = (Class)RBSStateCaptureSetSegment;
  [(RBSStateCaptureSetSegment *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_invalidatable, 0);
}

@end