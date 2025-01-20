@interface BCFutureBlockPair
- (id)block;
- (void)caller;
- (void)setBlock:(id)a3;
- (void)setCaller:(void *)a3;
@end

@implementation BCFutureBlockPair

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void)caller
{
  return self->_caller;
}

- (void)setCaller:(void *)a3
{
  self->_caller = a3;
}

- (void).cxx_destruct
{
}

@end