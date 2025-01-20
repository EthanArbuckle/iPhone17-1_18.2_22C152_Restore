@interface WBSCleanupHandler
- (WBSCleanupHandler)initWithBlock:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation WBSCleanupHandler

- (WBSCleanupHandler)initWithBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCleanupHandler;
  v5 = [(WBSCleanupHandler *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)invalidate
{
  id block = self->_block;
  self->_id block = 0;
}

- (void)dealloc
{
  id block = (void (**)(id, SEL))self->_block;
  if (block) {
    block[2](block, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)WBSCleanupHandler;
  [(WBSCleanupHandler *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end