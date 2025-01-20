@interface HttpTemplateController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (_TtC23ShelfKitCollectionViews22HttpTemplateController)init;
- (void)dealloc;
- (void)textFieldDidChange:(id)a3;
@end

@implementation HttpTemplateController

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v5];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(HttpTemplateController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews22HttpTemplateController_okAction);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  sub_3843C0();
  id v9 = a3;
  v10 = self;
  sub_2F49D4(v9, location, length);
  LOBYTE(length) = v11;

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textFieldDidChange:(id)a3
{
  uint64_t v4 = sub_37AD50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37AD40();
  if (*((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews22HttpTemplateController_hasRequiredParameters) == 1)
  {
    v8 = self;
    sub_2F4644();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC23ShelfKitCollectionViews22HttpTemplateController)init
{
  result = (_TtC23ShelfKitCollectionViews22HttpTemplateController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end