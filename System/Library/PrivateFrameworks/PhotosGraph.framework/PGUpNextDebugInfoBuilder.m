@interface PGUpNextDebugInfoBuilder
- (BOOL)rootMemoryIsAggregation;
- (BOOL)wantsVerboseDebugInfo;
- (NSArray)featureWeightVectors;
- (NSArray)momentUUIDs;
- (NSString)debugInfo;
- (NSString)inputDebugInfo;
- (NSString)rootMemoryNodeUniqueIdentifier;
- (_TtC11PhotosGraph24PGUpNextDebugInfoBuilder)init;
- (void)addSuggestionFilteringLog:(id)a3;
- (void)setFeatureWeightVectors:(id)a3;
- (void)setInputDebugInfo:(id)a3;
- (void)setMomentUUIDs:(id)a3;
- (void)setRootMemoryIsAggregation:(BOOL)a3;
- (void)setRootMemoryNodeUniqueIdentifier:(id)a3;
- (void)setWantsVerboseDebugInfo:(BOOL)a3;
@end

@implementation PGUpNextDebugInfoBuilder

- (BOOL)wantsVerboseDebugInfo
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_wantsVerboseDebugInfo;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsVerboseDebugInfo:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_wantsVerboseDebugInfo;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSString)inputDebugInfo
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setInputDebugInfo:(id)a3
{
  uint64_t v4 = sub_1D1EBDE60();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_inputDebugInfo);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)rootMemoryIsAggregation
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_rootMemoryIsAggregation;
  swift_beginAccess();
  return *v2;
}

- (void)setRootMemoryIsAggregation:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_rootMemoryIsAggregation;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSString)rootMemoryNodeUniqueIdentifier
{
  v2 = (char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_rootMemoryNodeUniqueIdentifier;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1D1EBDE30();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setRootMemoryNodeUniqueIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1D1EBDE60();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_rootMemoryNodeUniqueIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)momentUUIDs
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_momentUUIDs);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1D1EBE190();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setMomentUUIDs:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1D1EBE1B0();
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_momentUUIDs);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)featureWeightVectors
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_featureWeightVectors);
  swift_beginAccess();
  if (*v2)
  {
    sub_1D18E4770();
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1D1EBE190();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setFeatureWeightVectors:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1D18E4770();
    uint64_t v3 = sub_1D1EBE1B0();
  }
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_featureWeightVectors);
  swift_beginAccess();
  *uint64_t v5 = v3;
  swift_bridgeObjectRelease();
}

- (_TtC11PhotosGraph24PGUpNextDebugInfoBuilder)init
{
  return (_TtC11PhotosGraph24PGUpNextDebugInfoBuilder *)PGUpNextDebugInfoBuilder.init()();
}

- (void)addSuggestionFilteringLog:(id)a3
{
  uint64_t v4 = sub_1D1EBDE60();
  uint64_t v6 = v5;
  v7 = (void **)((char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_suggestionFilteringLogs);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1D183F880(0, v8[2] + 1, 1, v8);
    uint64_t *v7 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1D183F880((void *)(v11 > 1), v12 + 1, 1, v8);
    uint64_t *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = v4;
  v13[5] = v6;
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (NSString)debugInfo
{
  v2 = self;
  PGUpNextDebugInfoBuilder.debugInfo.getter();

  uint64_t v3 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end