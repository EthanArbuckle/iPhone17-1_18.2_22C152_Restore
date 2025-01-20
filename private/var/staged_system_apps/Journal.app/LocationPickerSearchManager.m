@interface LocationPickerSearchManager
- (_TtC7Journal27LocationPickerSearchManager)init;
@end

@implementation LocationPickerSearchManager

- (_TtC7Journal27LocationPickerSearchManager)init
{
  return (_TtC7Journal27LocationPickerSearchManager *)sub_100022130();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7Journal27LocationPickerSearchManager_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal27LocationPickerSearchManager_delegate);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal27LocationPickerSearchManager_location);
}

@end