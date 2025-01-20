@interface SUUIBlockAnimationDelegate
- (SUUIBlockAnimationDelegate)initWithCompletionHandler:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation SUUIBlockAnimationDelegate

- (SUUIBlockAnimationDelegate)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIBlockAnimationDelegate;
  v5 = [(SUUIBlockAnimationDelegate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id block = (void (**)(id, id, BOOL))self->_block;
  if (block)
  {
    block[2](block, a3, a4);
    id v6 = self->_block;
    self->_id block = 0;
  }
}

- (void).cxx_destruct
{
}

@end