@interface SBCancelableBlockOperation
- (SBCancelableBlockOperation)init;
- (void)addBlock:(id)a3;
- (void)main;
@end

@implementation SBCancelableBlockOperation

- (SBCancelableBlockOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBCancelableBlockOperation;
  v2 = [(SBCancelableBlockOperation *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    blocks = v2->_blocks;
    v2->_blocks = v3;
  }
  return v2;
}

- (void)addBlock:(id)a3
{
  id v7 = a3;
  if (([(SBCancelableBlockOperation *)self isExecuting] & 1) != 0
    || [(SBCancelableBlockOperation *)self isFinished])
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Block added after operation started or finished." userInfo:0];
    objc_exception_throw(v6);
  }
  blocks = self->_blocks;
  v5 = (void *)MEMORY[0x1D948C7A0](v7);
  [(NSMutableArray *)blocks addObject:v5];
}

- (void)main
{
  if (([(SBCancelableBlockOperation *)self isCancelled] & 1) == 0)
  {
    unint64_t v3 = 0;
    do
    {
      if ([(NSMutableArray *)self->_blocks count] <= v3) {
        break;
      }
      v4 = [(NSMutableArray *)self->_blocks objectAtIndex:v3];
      v4[2]();

      ++v3;
    }
    while (([(SBCancelableBlockOperation *)self isCancelled] & 1) == 0);
  }
}

- (void).cxx_destruct
{
}

@end