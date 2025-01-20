@interface FMRenameItemDataSource
- (_TtC6FindMy22FMRenameItemDataSource)init;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation FMRenameItemDataSource

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8 = a3;
  v9 = self;
  sub_1000FDF44(a4, a5);
  uint64_t v11 = v10;

  if (v11)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }

  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v8 = a3;
  v9 = self;
  sub_1000FE0A8(a4, a5);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  unint64_t v3 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy22FMRenameItemDataSource_beaconRoles);
  if (!(v3 >> 62)) {
    return *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v6 = a3;
  v7 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy22FMRenameItemDataSource_beaconRoles);
  if ((v6 & 0xC000000000000001) == 0)
  {
    if (a4 < 0)
    {
      __break(1u);
    }
    else if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
    {
      v7 = *(void **)(v6 + 8 * a4 + 32);
      id v8 = a3;
      v9 = self;
      id v10 = v7;
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_11;
  }
  id v15 = a3;
  v16 = self;
  swift_bridgeObjectRetain();
  id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  swift_bridgeObjectRelease();
LABEL_5:
  id v11 = [v10 roles];

  sub_100006060(0, (unint64_t *)&unk_1006B1750);
  unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v12 >> 62)
  {
LABEL_11:
    swift_bridgeObjectRetain();
    int64_t v13 = _CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  int64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);

LABEL_7:
  swift_bridgeObjectRelease();
  return v13;
}

- (_TtC6FindMy22FMRenameItemDataSource)init
{
  result = (_TtC6FindMy22FMRenameItemDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMRenameItemDataSource_delegate);
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC6FindMy22FMRenameItemDataSource_item;
  uint64_t v4 = type metadata accessor for FMIPItem();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end