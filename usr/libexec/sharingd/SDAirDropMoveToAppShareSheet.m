@interface SDAirDropMoveToAppShareSheet
- (_TtC16DaemoniOSLibrary28SDAirDropMoveToAppShareSheet)init;
- (void)showShareSheetWith:(id)a3 completion:(id)a4;
@end

@implementation SDAirDropMoveToAppShareSheet

- (void)showShareSheetWith:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  type metadata accessor for URL();
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = v10;
  v13[6] = sub_1006A3F6C;
  v13[7] = v11;
  v14 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10028CFA8((uint64_t)v8, (uint64_t)&unk_10097E828, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (_TtC16DaemoniOSLibrary28SDAirDropMoveToAppShareSheet)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SDAirDropMoveToAppShareSheet *)&v3 init];
}

@end