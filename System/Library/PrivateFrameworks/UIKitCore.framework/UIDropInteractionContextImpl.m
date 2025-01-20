@interface UIDropInteractionContextImpl
- (NSArray)items;
- (int64_t)state;
- (void)setItems:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation UIDropInteractionContextImpl

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end