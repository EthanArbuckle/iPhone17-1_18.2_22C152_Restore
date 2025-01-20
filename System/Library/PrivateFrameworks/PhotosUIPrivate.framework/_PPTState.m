@interface _PPTState
- (BOOL)hasRendered;
- (NSMutableArray)renderStatistics;
- (_PPTState)init;
- (void)enterDispatchGroup;
- (void)groupNotifyOnQueue:(id)a3 withBlock:(id)a4;
- (void)leaveDispatchGroup;
- (void)setHasRendered:(BOOL)a3;
- (void)setRenderStatistics:(id)a3;
@end

@implementation _PPTState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderStatistics, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setRenderStatistics:(id)a3
{
}

- (NSMutableArray)renderStatistics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHasRendered:(BOOL)a3
{
  self->_hasRendered = a3;
}

- (BOOL)hasRendered
{
  return self->_hasRendered;
}

- (void)groupNotifyOnQueue:(id)a3 withBlock:(id)a4
{
}

- (void)leaveDispatchGroup
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31___PPTState_leaveDispatchGroup__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)enterDispatchGroup
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31___PPTState_enterDispatchGroup__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (_PPTState)init
{
  v8.receiver = self;
  v8.super_class = (Class)_PPTState;
  v2 = [(_PPTState *)&v8 init];
  dispatch_queue_t v3 = dispatch_queue_create("_PPTState", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  dispatch_group_t v5 = dispatch_group_create();
  group = v2->_group;
  v2->_group = (OS_dispatch_group *)v5;

  return v2;
}

@end