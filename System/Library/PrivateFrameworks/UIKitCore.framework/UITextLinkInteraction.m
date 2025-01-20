@interface UITextLinkInteraction
+ (id)interactionWithShouldProxyContextMenuDelegate:(BOOL)a3;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIContextMenuInteractionDelegate)contextMenuDelegateProxy;
- (UIEditMenuInteraction)editMenuInteraction;
@end

@implementation UITextLinkInteraction

+ (id)interactionWithShouldProxyContextMenuDelegate:(BOOL)a3
{
  v3 = [[_UITextMenuLinkInteraction alloc] initWithShouldProxyContextMenuDelegate:a3];
  return v3;
}

- (UIContextMenuInteractionDelegate)contextMenuDelegateProxy
{
  return 0;
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return 0;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void).cxx_destruct
{
}

@end