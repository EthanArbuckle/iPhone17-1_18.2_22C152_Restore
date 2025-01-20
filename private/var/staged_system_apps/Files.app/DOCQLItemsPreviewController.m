@interface DOCQLItemsPreviewController
- (_TtC5Files27DOCQLItemsPreviewController)initWithCoder:(id)a3;
- (_TtC5Files27DOCQLItemsPreviewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Files27DOCQLItemsPreviewController)initWithPreviewItems:(id)a3;
@end

@implementation DOCQLItemsPreviewController

- (_TtC5Files27DOCQLItemsPreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC5Files27DOCQLItemsPreviewController__nonSourceBasedQLItems) = (Class)_swiftEmptyArrayStorage;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC5Files27DOCQLItemsPreviewController__nonSourceBasedQLItems) = (Class)_swiftEmptyArrayStorage;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCQLItemsPreviewController();
  v9 = [(DOCQLItemsPreviewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC5Files27DOCQLItemsPreviewController)initWithCoder:(id)a3
{
  result = (_TtC5Files27DOCQLItemsPreviewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5Files27DOCQLItemsPreviewController)initWithPreviewItems:(id)a3
{
  result = (_TtC5Files27DOCQLItemsPreviewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end