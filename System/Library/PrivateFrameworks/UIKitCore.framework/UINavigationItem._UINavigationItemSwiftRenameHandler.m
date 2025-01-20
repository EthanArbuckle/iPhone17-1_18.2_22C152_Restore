@interface UINavigationItem._UINavigationItemSwiftRenameHandler
- (_TtCE5UIKitCSo16UINavigationItem35_UINavigationItemSwiftRenameHandler)init;
@end

@implementation UINavigationItem._UINavigationItemSwiftRenameHandler

- (_TtCE5UIKitCSo16UINavigationItem35_UINavigationItemSwiftRenameHandler)init
{
  *(UINavigationItem **)((char *)&self->super._associatedItem
                       + OBJC_IVAR____TtCE5UIKitCSo16UINavigationItem35_UINavigationItemSwiftRenameHandler_delegate) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)_s35_UINavigationItemSwiftRenameHandlerCMa();
  return [(_UINavigationItemRenameHandler *)&v4 init];
}

- (void).cxx_destruct
{
}

@end