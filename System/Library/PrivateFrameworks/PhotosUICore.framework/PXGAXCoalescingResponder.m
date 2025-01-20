@interface PXGAXCoalescingResponder
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (BOOL)pauseEventDelivery;
- (PXGAXResponder)axNextResponder;
- (id)axContainingScrollViewForAXGroup:(id)a3;
- (void)_distributeEvents;
- (void)_notifyResponder:(id)a3;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)setAxNextResponder:(id)a3;
- (void)setPauseEventDelivery:(BOOL)a3;
@end

@implementation PXGAXCoalescingResponder

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__PXGAXCoalescingResponder_axGroup_didChange_userInfo___block_invoke;
  v12[3] = &unk_1E5DBEFA8;
  id v14 = v9;
  unint64_t v15 = a4;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  [(PXGAXCoalescingResponder *)self _notifyResponder:v12];
}

- (void)_notifyResponder:(id)a3
{
  id aBlock = a3;
  v4 = [(PXGAXCoalescingResponder *)self axNextResponder];
  if (v4)
  {
    if ([(PXGAXCoalescingResponder *)self pauseEventDelivery])
    {
      pendingAXEventBlocks = self->_pendingAXEventBlocks;
      v6 = _Block_copy(aBlock);
      [(NSMutableArray *)pendingAXEventBlocks addObject:v6];
    }
    else
    {
      (*((void (**)(id, void *))aBlock + 2))(aBlock, v4);
    }
  }
}

- (BOOL)pauseEventDelivery
{
  return self->_pauseEventDelivery;
}

- (PXGAXResponder)axNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->axNextResponder);
  return (PXGAXResponder *)WeakRetained;
}

- (void)setPauseEventDelivery:(BOOL)a3
{
  if (self->_pauseEventDelivery != a3)
  {
    self->_pauseEventDelivery = a3;
    if (!a3) {
      [(PXGAXCoalescingResponder *)self _distributeEvents];
    }
  }
}

- (void)_distributeEvents
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_pendingAXEventBlocks count])
  {
    v3 = (void *)[(NSMutableArray *)self->_pendingAXEventBlocks copy];
    [(NSMutableArray *)self->_pendingAXEventBlocks removeAllObjects];
    v4 = [(PXGAXCoalescingResponder *)self axNextResponder];
    if (v4)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)setAxNextResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->axNextResponder);
  objc_storeStrong((id *)&self->_pendingAXEventBlocks, 0);
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  long long v10 = [(PXGAXCoalescingResponder *)self axNextResponder];
  LOBYTE(a4) = [v10 axGroup:v9 didRequestToPerformAction:a4 userInfo:v8];

  return a4;
}

uint64_t __55__PXGAXCoalescingResponder_axGroup_didChange_userInfo___block_invoke(void *a1, void *a2)
{
  return [a2 axGroup:a1[4] didChange:a1[6] userInfo:a1[5]];
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGAXCoalescingResponder *)self axNextResponder];
  uint64_t v6 = [v5 axContainingScrollViewForAXGroup:v4];

  return v6;
}

@end