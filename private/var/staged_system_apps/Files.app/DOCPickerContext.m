@interface DOCPickerContext
- (_TtC5Files16DOCPickerContext)init;
- (_TtC5Files16DOCPickerContext)initWithItems:(id)a3;
- (_TtC5Files16DOCPickerContext)initWithURLs:(id)a3;
@end

@implementation DOCPickerContext

- (_TtC5Files16DOCPickerContext)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;

  result = (_TtC5Files16DOCPickerContext *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5Files16DOCPickerContext)initWithURLs:(id)a3
{
  sub_10009E6C4(0, &qword_100708ED0);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC5Files16DOCPickerContext *)DOCPickerContext.init(with:)(v3);
}

- (_TtC5Files16DOCPickerContext)initWithItems:(id)a3
{
  sub_10009E6C4(0, (unint64_t *)&qword_1007069C0);
  v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCPickerContext_urlsToSave) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCPickerContext_itemsToMove) = v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCPickerContext();
  return [(DOCPickerContext *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end