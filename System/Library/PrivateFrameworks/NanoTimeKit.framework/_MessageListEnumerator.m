@interface _MessageListEnumerator
- (id)nextObject;
- (id)nextObjectBlock;
- (void)setNextObjectBlock:(id)a3;
@end

@implementation _MessageListEnumerator

- (id)nextObject
{
  return (id)(*((uint64_t (**)(void))self->_nextObjectBlock + 2))();
}

- (id)nextObjectBlock
{
  return self->_nextObjectBlock;
}

- (void)setNextObjectBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end