@interface UIImageActivityType
- (_TtC9TipsTryIt19UIImageActivityType)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation UIImageActivityType

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC9TipsTryIt19UIImageActivityType_image));
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC9TipsTryIt19UIImageActivityType_image));
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC9TipsTryIt19UIImageActivityType_image));
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v5 = objc_allocWithZone(MEMORY[0x263F103D8]);
  id v6 = a3;
  v7 = self;
  id v8 = objc_msgSend(v5, sel_init);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088E0]), sel_initWithObject_, *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC9TipsTryIt19UIImageActivityType_image));
  objc_msgSend(v8, sel_setIconProvider_, v9);

  return v8;
}

- (_TtC9TipsTryIt19UIImageActivityType)init
{
  result = (_TtC9TipsTryIt19UIImageActivityType *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end