@interface SeymourCatalogItemDataProvider
- (BOOL)isSeymourWorkout:(id)a3;
- (_TtC10FitnessApp30SeymourCatalogItemDataProvider)init;
- (void)deleteArchivedSessionForWorkout:(id)a3;
- (void)fetchCatalogArtworkForCatalogItemViewModel:(id)a3 imageSize:(CGSize)a4 completion:(id)a5;
- (void)fetchCatalogItemViewModelForWorkout:(id)a3 completion:(id)a4;
- (void)fetchScoreSummaryForWorkout:(id)a3 healthStore:(id)a4 completion:(id)a5;
@end

@implementation SeymourCatalogItemDataProvider

- (BOOL)isSeymourWorkout:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_1007194DC(v4);

  return v6 & 1;
}

- (void)fetchCatalogItemViewModelForWorkout:(id)a3 completion:(id)a4
{
  char v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_10048F2DC(v7, v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)deleteArchivedSessionForWorkout:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002DD720(v4, (uint64_t)v5);
}

- (void)fetchCatalogArtworkForCatalogItemViewModel:(id)a3 imageSize:(CGSize)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  v10 = self;
  sub_100485D1C(v9, (uint64_t)sub_1004961E0, v8);

  swift_release();
}

- (void)fetchScoreSummaryForWorkout:(id)a3 healthStore:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  sub_10049397C(v11, v12, (void (*)(void))sub_1002460B8, v9, v11, v10);

  swift_release_n();

  swift_release();
}

- (_TtC10FitnessApp30SeymourCatalogItemDataProvider)init
{
  result = (_TtC10FitnessApp30SeymourCatalogItemDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_archivedSessionClient);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_artworkImageLoader);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_bookmarkClient);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_catalogClient);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_configurationClient);
  swift_unknownObjectRelease();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_mediaTagStringBuilder);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_recommendationClient);
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_catalogItemViewModelCache));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp30SeymourCatalogItemDataProvider_stackViewModelCache));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end