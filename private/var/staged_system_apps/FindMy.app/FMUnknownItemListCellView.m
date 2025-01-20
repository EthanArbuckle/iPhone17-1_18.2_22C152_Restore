@interface FMUnknownItemListCellView
- (_TtC6FindMy25FMUnknownItemListCellView)initWithCoder:(id)a3;
- (_TtC6FindMy25FMUnknownItemListCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation FMUnknownItemListCellView

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1002368DC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC6FindMy25FMUnknownItemListCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC6FindMy25FMUnknownItemListCellView *)sub_100237D40(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy25FMUnknownItemListCellView)initWithCoder:(id)a3
{
  return (_TtC6FindMy25FMUnknownItemListCellView *)sub_100237E74(a3);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy25FMUnknownItemListCellView_imageContainer);
}

@end