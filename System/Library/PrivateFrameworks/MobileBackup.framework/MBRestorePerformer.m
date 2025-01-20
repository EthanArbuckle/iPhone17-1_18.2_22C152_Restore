@interface MBRestorePerformer
- (BOOL)disposeAndReturnError:(id *)a3;
- (BOOL)fixUpAttributesWithDirectory:(id)a3 error:(id *)a4;
- (BOOL)placeAsset:(id)a3 assetType:(unint64_t)a4 compressionMethod:(char)a5 assetSignature:(id)a6 isHardlink:(BOOL)a7 error:(id *)a8;
- (BOOL)placeWithDirectory:(id)a3 error:(id *)a4;
- (BOOL)placeWithSymlink:(id)a3 symlinkTarget:(id)a4 isHardlink:(BOOL)a5 error:(id *)a6;
- (BOOL)placeWithZeroByteFile:(id)a3 isHardlink:(BOOL)a4 error:(id *)a5;
- (NSString)description;
- (_TtC7backupd18MBRestorePerformer)init;
- (_TtC7backupd18MBRestorePerformer)initWithIdentifier:(id)a3 destinationPath:(id)a4 policy:(id)a5 depot:(id)a6 progressModel:(id)a7 logger:(id)a8 error:(id *)a9;
- (_TtC7backupd28MBRestorablePlacementSummary)restorablePlacementSummary;
- (void)recordPlacingDurationWithStart:(id)a3 end:(id)a4;
@end

@implementation MBRestorePerformer

- (_TtC7backupd28MBRestorablePlacementSummary)restorablePlacementSummary
{
  return (_TtC7backupd28MBRestorablePlacementSummary *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC7backupd18MBRestorePerformer_restorablePlacementSummary));
}

- (_TtC7backupd18MBRestorePerformer)initWithIdentifier:(id)a3 destinationPath:(id)a4 policy:(id)a5 depot:(id)a6 progressModel:(id)a7 logger:(id)a8 error:(id *)a9
{
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  return (_TtC7backupd18MBRestorePerformer *)sub_100037B80(v13, v15, v16, v18, v19, v20, a7, a8);
}

- (BOOL)disposeAndReturnError:(id *)a3
{
  v3 = self;
  sub_100036FE8();

  return 1;
}

- (NSString)description
{
  v2 = self;
  sub_10003810C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)recordPlacingDurationWithStart:(id)a3 end:(id)a4
{
  uint64_t v5 = sub_100006FC8((uint64_t *)&unk_10047DE50);
  uint64_t v6 = v5 - 8;
  uint64_t v26 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v26 - v14;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd18MBRestorePerformer_restorablePlacementSummary);
  uint64_t v17 = &v8[*(int *)(v6 + 56)];
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v18(v8, v15, v9);
  v18(v17, v13, v9);
  id v19 = (unint64_t *)(v16 + OBJC_IVAR____TtC7backupd28MBRestorablePlacementSummary_durations);
  swift_beginAccess();
  unint64_t v20 = *v19;
  id v21 = self;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *id v19 = v20;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v20 = sub_10003E3E8(0, *(void *)(v20 + 16) + 1, 1, v20);
    *id v19 = v20;
  }
  unint64_t v24 = *(void *)(v20 + 16);
  unint64_t v23 = *(void *)(v20 + 24);
  if (v24 >= v23 >> 1)
  {
    unint64_t v20 = sub_10003E3E8(v23 > 1, v24 + 1, 1, v20);
    *id v19 = v20;
  }
  *(void *)(v20 + 16) = v24 + 1;
  sub_100029080((uint64_t)v8, v20+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(void *)(v26 + 72) * v24);
  swift_endAccess();

  v25 = *(void (**)(char *, uint64_t))(v10 + 8);
  v25(v13, v9);
  v25(v15, v9);
}

- (BOOL)placeWithDirectory:(id)a3 error:(id *)a4
{
  return sub_100038794(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_1000370B4);
}

- (BOOL)fixUpAttributesWithDirectory:(id)a3 error:(id *)a4
{
  return sub_100038794(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_10003792C);
}

- (BOOL)placeWithSymlink:(id)a3 symlinkTarget:(id)a4 isHardlink:(BOOL)a5 error:(id *)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  swift_unknownObjectRetain();
  uint64_t v12 = self;
  sub_1000374C4(a3, v9, v11, a5);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  return 1;
}

- (BOOL)placeWithZeroByteFile:(id)a3 isHardlink:(BOOL)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  v8 = self;
  sub_100037278(a3, a4);

  swift_unknownObjectRelease();
  return 1;
}

- (BOOL)placeAsset:(id)a3 assetType:(unint64_t)a4 compressionMethod:(char)a5 assetSignature:(id)a6 isHardlink:(BOOL)a7 error:(id *)a8
{
  swift_unknownObjectRetain();
  id v14 = a6;
  v15 = self;
  sub_100037728(a3, a4, a5, v14, a7);

  swift_unknownObjectRelease();
  return 1;
}

- (_TtC7backupd18MBRestorePerformer)init
{
  result = (_TtC7backupd18MBRestorePerformer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10001BFE4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7backupd18MBRestorePerformer___destinationRootPath));

  swift_bridgeObjectRelease();
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd18MBRestorePerformer_restorablePlacementSummary);
}

@end