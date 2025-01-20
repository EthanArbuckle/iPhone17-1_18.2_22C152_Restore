@interface SUUICommenterAction
- (int64_t)index;
- (void)setIndex:(int64_t)a3;
@end

@implementation SUUICommenterAction

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

@end