@interface THOffscreenLayoutController
- (BOOL)isCompactHeight;
- (BOOL)isCompactWidth;
- (BOOL)isLayoutOffscreen;
- (BOOL)layoutIsCompactHeight;
- (BOOL)layoutIsCompactWidth;
- (id)ancestorLayoutOfLayout:(id)a3 orDelegateConformingToProtocol:(id)a4;
- (id)delegate;
- (void)setDelegate:(id)a3;
- (void)setLayoutIsCompactHeight:(BOOL)a3;
- (void)setLayoutIsCompactWidth:(BOOL)a3;
@end

@implementation THOffscreenLayoutController

- (BOOL)isLayoutOffscreen
{
  return 1;
}

- (BOOL)isCompactWidth
{
  return self->_layoutIsCompactWidth;
}

- (BOOL)isCompactHeight
{
  return self->_layoutIsCompactHeight;
}

- (id)ancestorLayoutOfLayout:(id)a3 orDelegateConformingToProtocol:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THOffscreenLayoutController;
  id result = -[THOffscreenLayoutController ancestorLayoutOfLayout:orDelegateConformingToProtocol:](&v7, "ancestorLayoutOfLayout:orDelegateConformingToProtocol:", a3);
  if (!result)
  {
    if ([self->_delegate conformsToProtocol:a4]) {
      return self->_delegate;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (BOOL)layoutIsCompactWidth
{
  return self->_layoutIsCompactWidth;
}

- (void)setLayoutIsCompactWidth:(BOOL)a3
{
  self->_layoutIsCompactWidth = a3;
}

- (BOOL)layoutIsCompactHeight
{
  return self->_layoutIsCompactHeight;
}

- (void)setLayoutIsCompactHeight:(BOOL)a3
{
  self->_layoutIsCompactHeight = a3;
}

@end