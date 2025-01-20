@interface SPRReadRelay
- (OS_dispatch_queue)queue;
- (SPRReadDelegate)base;
- (SPRReadRelay)initWithBase:(id)a3 queue:(id)a4;
- (void)onFailureWithError:(id)a3;
- (void)onSuccessWithTransactionData:(id)a3;
- (void)onUpdateWithEvent:(int64_t)a3 mode:(int64_t)a4;
@end

@implementation SPRReadRelay

- (SPRReadRelay)initWithBase:(id)a3 queue:(id)a4
{
  v6 = (SPRReadDelegate *)a3;
  v7 = (OS_dispatch_queue *)a4;
  base = self->_base;
  self->_base = v6;
  v9 = v6;

  queue = self->_queue;
  self->_queue = v7;

  return self;
}

- (void)onUpdateWithEvent:(int64_t)a3 mode:(int64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22125ABC8;
  block[3] = &unk_26459D358;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)onSuccessWithTransactionData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_22125AC74;
  v7[3] = &unk_26459CCB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)onFailureWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_22125AD18;
  v7[3] = &unk_26459CCB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (SPRReadDelegate)base
{
  return (SPRReadDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end