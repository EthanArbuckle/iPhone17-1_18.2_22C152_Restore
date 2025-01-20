@interface OfflineFeedsForegroundWorker
- (_TtC7NewsUI228OfflineFeedsForegroundWorker)init;
- (void)audioPlaylistDidChange:(id)a3;
- (void)networkReachabilityConnectivityDidChange:(id)a3;
- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4;
- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6;
@end

@implementation OfflineFeedsForegroundWorker

- (_TtC7NewsUI228OfflineFeedsForegroundWorker)init
{
  result = (_TtC7NewsUI228OfflineFeedsForegroundWorker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228OfflineFeedsForegroundWorker_offlineFeedsSupervisor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228OfflineFeedsForegroundWorker_offlineFeatures);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI228OfflineFeedsForegroundWorker_sharedItemManager;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  uint64_t updated = type metadata accessor for OfflineFeedUpdateCondition(0);
  MEMORY[0x1F4188790](updated);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = 0;
  v13[1] = 0;
  swift_storeEnumTagMultiPayload();
  id v11 = a3;
  v12 = self;
  sub_1DF1CFF8C(v13, (uint64_t)v10);
  sub_1DF1D11A0((uint64_t)v10);
}

- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4
{
  uint64_t updated = type metadata accessor for OfflineFeedUpdateCondition(0);
  MEMORY[0x1F4188790](updated);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = xmmword_1DFE3D510;
  swift_storeEnumTagMultiPayload();
  id v9 = a3;
  v10 = self;
  sub_1DF1CFF8C((uint64_t *)&v11, (uint64_t)v8);
  sub_1DF1D11A0((uint64_t)v8);
}

- (void)audioPlaylistDidChange:(id)a3
{
  uint64_t updated = type metadata accessor for OfflineFeedUpdateCondition(0);
  MEMORY[0x1F4188790](updated);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = xmmword_1DFE3D520;
  swift_storeEnumTagMultiPayload();
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1DF1CFF8C((uint64_t *)&v8, (uint64_t)v6);
  sub_1DF1D11A0((uint64_t)v6);
  swift_unknownObjectRelease();
}

- (void)networkReachabilityConnectivityDidChange:(id)a3
{
  if (a3)
  {
    v3 = self;
    if (objc_msgSend((id)swift_unknownObjectRetain(), sel_isNetworkReachable)) {
      sub_1DF1CFA6C();
    }
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

@end