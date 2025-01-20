@interface LyonExternal
+ (_TtC10seserviced12LyonExternal)shared;
- (BOOL)blockRangingForReaderIdentifierWithReaderIdentifier:(id)a3 timeout:(double)a4 error:(id *)a5;
- (BOOL)unblockRangingForReaderIdentifierWithReaderIdentifier:(id)a3 error:(id *)a4;
- (BOOL)updatePreArmState:(BOOL)a3 for:(id)a4 error:(id *)a5;
- (_TtC10seserviced12LyonExternal)init;
- (id)getAllEndpoints;
- (id)getSupportedLyonVersions;
- (void)updatePassSelectionState:(BOOL)a3;
@end

@implementation LyonExternal

+ (_TtC10seserviced12LyonExternal)shared
{
  if (qword_1004538B0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100468998;

  return (_TtC10seserviced12LyonExternal *)v2;
}

- (id)getAllEndpoints
{
  sub_1002802F0((uint64_t)self, (uint64_t)a2);
  sub_10012AE84();
  sub_1001F7C04();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (BOOL)blockRangingForReaderIdentifierWithReaderIdentifier:(id)a3 timeout:(double)a4 error:(id *)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  v10 = self;
  sub_1002803E8(v7, v9, a4);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)unblockRangingForReaderIdentifierWithReaderIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  sub_1002805A0(v5, v7);
  swift_bridgeObjectRelease();

  return 1;
}

- (id)getSupportedLyonVersions
{
  sub_100280748();
  sub_10006C51C(&qword_10045A598);
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (BOOL)updatePreArmState:(BOOL)a3 for:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = self;
  sub_1002809B8(a3, (uint64_t)v7);

  return 1;
}

- (void)updatePassSelectionState:(BOOL)a3
{
}

- (_TtC10seserviced12LyonExternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(LyonExternal *)&v3 init];
}

@end