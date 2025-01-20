@interface _UIEditMenuBridgedContextMenuInteraction
- (id)_proxySender;
- (id)proxySender;
- (void)setProxySender:(id)a3;
@end

@implementation _UIEditMenuBridgedContextMenuInteraction

- (void)setProxySender:(id)a3
{
  self->_proxySender = a3;
}

- (id)_proxySender
{
  return self->_proxySender;
}

- (id)proxySender
{
  return self->_proxySender;
}

@end