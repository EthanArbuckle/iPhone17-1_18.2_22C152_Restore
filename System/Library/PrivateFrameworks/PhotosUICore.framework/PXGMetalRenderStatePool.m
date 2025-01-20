@interface PXGMetalRenderStatePool
- (MTLDevice)device;
- (OS_dispatch_queue)queue;
- (PXGMetalRenderStatePool)initWithDevice:(id)a3 queue:(id)a4;
- (id)checkoutRenderState;
- (void)_checkinRenderState:(id)a3;
- (void)clearReusePool;
- (void)setDevice:(id)a3;
@end

@implementation PXGMetalRenderStatePool

- (void)_checkinRenderState:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = [v6 device];
  device = self->_device;

  if (v4 == device) {
    [(NSMutableArray *)self->_reusableRenderStates addObject:v6];
  }
}

- (id)checkoutRenderState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self->_device;
  if (v3)
  {
    v4 = [(NSMutableArray *)self->_reusableRenderStates px_popFirst];
    if (!v4) {
      v4 = [[PXGReusableMetalRenderState alloc] initWithDevice:self->_device];
    }
    v5 = [[PXGMetalRenderStatePoolEntry alloc] initWithReusableRenderState:v4 pool:self];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PXGMetalRenderStatePool)initWithDevice:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXGMetalRenderStatePool;
  v9 = [(PXGMetalRenderStatePool *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
    reusableRenderStates = v10->_reusableRenderStates;
    v10->_reusableRenderStates = (NSMutableArray *)v11;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reusableRenderStates, 0);
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  v5 = (MTLDevice *)a3;
  if (self->_device != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_device, a3);
    [(PXGMetalRenderStatePool *)self clearReusePool];
    v5 = v6;
  }
}

- (void)clearReusePool
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  reusableRenderStates = self->_reusableRenderStates;
  [(NSMutableArray *)reusableRenderStates removeAllObjects];
}

@end