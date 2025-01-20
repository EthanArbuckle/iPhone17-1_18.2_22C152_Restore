@interface MBRestoreATCEngine
- (BOOL)runWithError:(id *)a3;
- (BOOL)shouldCancelVerification;
- (MBAssetFetchSummary)assetFetchSummary;
- (MBPersona)persona;
- (_TtC7backupd18MBRestoreATCEngine)initWithRootPath:(id)a3 policy:(id)a4 depot:(id)a5 fetcher:(id)a6 plan:(id)a7 progress:(id)a8 verifier:(id)a9 logger:(id)a10 error:(id *)a11;
- (_TtC7backupd18MBRestoreATCEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5;
- (_TtC7backupd28MBRestorablePlacementSummary)restorablePlacementSummary;
- (int)engineMode;
- (int)restoreType;
- (void)cleanUpAfterError:(id)a3;
- (void)fetcher:(id)a3 didReceiveAsset:(id)a4 decrypter:(id)a5 path:(id)a6;
- (void)fetcher:(id)a3 failedFetchingAsset:(id)a4 withFetchError:(id)a5;
@end

@implementation MBRestoreATCEngine

- (_TtC7backupd18MBRestoreATCEngine)initWithRootPath:(id)a3 policy:(id)a4 depot:(id)a5 fetcher:(id)a6 plan:(id)a7 progress:(id)a8 verifier:(id)a9 logger:(id)a10 error:(id *)a11
{
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  id v19 = a4;
  id v20 = a5;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  return (_TtC7backupd18MBRestoreATCEngine *)sub_100024554(v16, v18, v19, v20, (uint64_t)a6, a7, a8, a9, a10);
}

- (MBPersona)persona
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7backupd18MBRestoreATCEngine__policy) persona];
  return (MBPersona *)v2;
}

- (int)restoreType
{
  return [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7backupd18MBRestoreATCEngine__policy) restoreType];
}

- (int)engineMode
{
  return 2;
}

- (MBAssetFetchSummary)assetFetchSummary
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7backupd18MBRestoreATCEngine__fetcher) fetchSummary];
  return (MBAssetFetchSummary *)v2;
}

- (_TtC7backupd28MBRestorablePlacementSummary)restorablePlacementSummary
{
  return (_TtC7backupd28MBRestorablePlacementSummary *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7backupd18MBRestoreATCEngine__performer)
                                                                                               + OBJC_IVAR____TtC7backupd18MBRestorePerformer_restorablePlacementSummary));
}

- (BOOL)runWithError:(id *)a3
{
  v3 = self;
  sub_100024B44();

  return 1;
}

- (void)cleanUpAfterError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_1000272E0((uint64_t)a3);
}

- (void)fetcher:(id)a3 didReceiveAsset:(id)a4 decrypter:(id)a5 path:(id)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  v9 = (char *)a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_100028808(v9, a5);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)fetcher:(id)a3 failedFetchingAsset:(id)a4 withFetchError:(id)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  id v10 = a5;
  v9 = self;
  sub_100028BF0(v8, (uint64_t)v10);
  swift_unknownObjectRelease();
}

- (BOOL)shouldCancelVerification
{
  return [(MBEngine *)self isCanceled];
}

- (_TtC7backupd18MBRestoreATCEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  result = (_TtC7backupd18MBRestoreATCEngine *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7backupd18MBRestoreATCEngine__performer);
}

@end