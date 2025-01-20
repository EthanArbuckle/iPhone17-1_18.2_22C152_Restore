@interface UINavigationDeferredTransitionContext
- (_UINavigationControllerPalette)incomingTopPalette;
- (_UINavigationControllerPalette)outgoingTopPalette;
- (void)setIncomingTopPalette:(id)a3;
- (void)setOutgoingTopPalette:(id)a3;
@end

@implementation UINavigationDeferredTransitionContext

- (_UINavigationControllerPalette)incomingTopPalette
{
  return self->_incomingTopPalette;
}

- (void)setIncomingTopPalette:(id)a3
{
}

- (_UINavigationControllerPalette)outgoingTopPalette
{
  return self->_outgoingTopPalette;
}

- (void)setOutgoingTopPalette:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingTopPalette, 0);
  objc_storeStrong((id *)&self->_incomingTopPalette, 0);
}

@end