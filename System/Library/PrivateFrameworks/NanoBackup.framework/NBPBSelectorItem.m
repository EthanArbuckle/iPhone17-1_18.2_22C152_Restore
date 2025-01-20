@interface NBPBSelectorItem
- (BOOL)connected;
- (SEL)selector;
- (void)method;
- (void)setConnected:(BOOL)a3;
- (void)setMethod:(void *)a3;
- (void)setSelector:(SEL)a3;
@end

@implementation NBPBSelectorItem

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (void)method
{
  return self->_method;
}

- (void)setMethod:(void *)a3
{
  self->_method = a3;
}

@end