@interface XavierScoringService
- (_TtC19NewsPersonalization20XavierScoringService)init;
- (double)decayedPublisherDiversificationPenalty;
- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5;
- (id)limitItemsByMinimumItemQuality:(id)a3;
- (id)rankTagIDsDescending:(id)a3;
- (id)scoresForTagIDs:(id)a3;
- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5;
- (void)fetchAggregateMapForPersonalizingItem:(id)a3 completion:(id)a4;
- (void)prepareForUseWithCompletionHandler:(id)a3;
@end

@implementation XavierScoringService

- (_TtC19NewsPersonalization20XavierScoringService)init
{
  result = (_TtC19NewsPersonalization20XavierScoringService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19NewsPersonalization20XavierScoringService_aggregateStore));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization20XavierScoringService_userContextProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization20XavierScoringService_userEmbeddingProvider);
  sub_1DE758B14((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization20XavierScoringService_tabiScoringService, (uint64_t (*)(void))sub_1DE7583AC);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization20XavierScoringService_configurationManager);

  swift_release();
}

- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5
{
  uint64_t v8 = sub_1DE7B12B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DE526268(0, (unint64_t *)&qword_1EBEBBA50);
  unint64_t v12 = sub_1DE7B17E0();
  sub_1DE758458();
  v14 = &v11[*(int *)(v13 + 48)];
  FCFeedPersonalizationConfigurationSet.headlineContext.getter(a5, (uint64_t)v11);
  uint64_t v15 = sub_1DE7B12C0();
  v16 = (unsigned int *)MEMORY[0x1E4F7FC18];
  if (a5 != 3) {
    v16 = (unsigned int *)MEMORY[0x1E4F7FC28];
  }
  (*(void (**)(unsigned char *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v14, *v16, v15);
  (*(void (**)(unsigned char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4F7F690], v8);
  v17 = self;
  XavierScoringService.score(items:context:)(v12, (uint64_t)v11);
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  int64_t v22 = a4;
  sub_1DE7B11E0();
  uint64_t v18 = sub_1DE7B1810();
  swift_bridgeObjectRelease();
  id v19 = sub_1DE5603FC(v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v19;
}

- (void)fetchAggregateMapForPersonalizingItem:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain();
  v7 = self;
  sub_1DE758600((uint64_t)a3, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (id)limitItemsByMinimumItemQuality:(id)a3
{
  sub_1DE526268(0, (unint64_t *)&qword_1EBEBBA50);
  unint64_t v4 = sub_1DE7B17E0();
  v5 = self;
  XavierScoringService.limitItems(byMinimumItemQuality:)(v4);

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1DE7B17C0();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5
{
  sub_1DE526268(0, (unint64_t *)&qword_1EBEBBA50);
  sub_1DE7B17E0();
  v5 = (void *)sub_1DE7B17C0();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)prepareForUseWithCompletionHandler:(id)a3
{
  unint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  XavierScoringService.prepareForUse(completionHandler:)((uint64_t)sub_1DE7585F0, v5);

  swift_release();
}

- (double)decayedPublisherDiversificationPenalty
{
  v2 = self;
  double v3 = XavierScoringService.decayedPublisherDiversificationPenalty()();

  return v3;
}

- (id)rankTagIDsDescending:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1DE7B17E0();
    uint64_t v5 = self;
    uint64_t v8 = XavierScoringService.score(tags:)(v4);
    swift_bridgeObjectRetain();
    sub_1DE748DD0(&v8, MEMORY[0x1E4F80720], (uint64_t (*)(uint64_t))sub_1DE6A2EF0, (uint64_t (*)(void *))sub_1DE75287C);
    swift_bridgeObjectRelease();
    sub_1DE74363C(v8);

    swift_bridgeObjectRelease();
    swift_release();
    v6 = (void *)sub_1DE7B17C0();
    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    __break(1u);
    id result = (id)swift_release();
    __break(1u);
  }
  return result;
}

- (id)scoresForTagIDs:(id)a3
{
  if (a3) {
    uint64_t v4 = (void *)sub_1DE7B17E0();
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = self;
  v10.value._rawValue = v4;
  unint64_t v6 = (unint64_t)XavierScoringService.scores(forTagIDs:)(v10);

  swift_bridgeObjectRelease();
  if (v6)
  {
    sub_1DE526448(0, (unint64_t *)&qword_1EBEBBAD0);
    v7 = (void *)sub_1DE7B1540();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end