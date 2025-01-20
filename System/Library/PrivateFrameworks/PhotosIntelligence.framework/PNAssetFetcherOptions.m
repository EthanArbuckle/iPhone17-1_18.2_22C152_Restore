@interface PNAssetFetcherOptions
- (CLSCurationContext)curationContext;
- (NSArray)fetchFilters;
- (NSArray)fetchLimiters;
- (NSArray)fetchSources;
- (NSArray)limiters;
- (PFPseudoRandomNumberGenerator)randomGenerator;
- (PHFetchOptions)fetchOptions;
- (PNAssetFetcherOptions)init;
- (PNAssetFetcherOptions)initWithFetchOptions:(id)a3 limit:(int64_t)a4 sampleBatchSize:(int64_t)a5;
- (PNAssetFetcherOptions)initWithPhotoLibrary:(id)a3 limit:(int64_t)a4 sampleBatchSize:(int64_t)a5;
- (id)curationPredicate;
- (id)initFetchOptionsWithExcludeUUIDs:(id)a3 minimumSceneVersion:(signed __int16)a4 predicate:(id)a5;
- (int64_t)limit;
- (int64_t)sampleBatchSize;
- (unint64_t)seed;
- (void)setCurationContext:(id)a3;
- (void)setFetchFilters:(id)a3;
- (void)setFetchLimiters:(id)a3;
- (void)setFetchSources:(id)a3;
- (void)setLimiters:(id)a3;
- (void)setSeed:(unint64_t)a3;
@end

@implementation PNAssetFetcherOptions

- (PNAssetFetcherOptions)initWithFetchOptions:(id)a3 limit:(int64_t)a4 sampleBatchSize:(int64_t)a5
{
  return (PNAssetFetcherOptions *)AssetFetcherOptions.init(fetchOptions:limit:sampleBatchSize:)((uint64_t)a3, a4, a5);
}

- (PNAssetFetcherOptions)initWithPhotoLibrary:(id)a3 limit:(int64_t)a4 sampleBatchSize:(int64_t)a5
{
  return (PNAssetFetcherOptions *)AssetFetcherOptions.init(photoLibrary:limit:sampleBatchSize:)(a3, a4, a5);
}

- (int64_t)limit
{
  return AssetFetcherOptions.limit.getter();
}

- (int64_t)sampleBatchSize
{
  return AssetFetcherOptions.sampleBatchSize.getter();
}

- (PHFetchOptions)fetchOptions
{
  id v2 = AssetFetcherOptions.fetchOptions.getter();
  return (PHFetchOptions *)v2;
}

- (NSArray)limiters
{
  AssetFetcherOptions.limiters.getter();
  type metadata accessor for AssetFetcherLimiter();
  id v2 = (void *)sub_2598444E0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setLimiters:(id)a3
{
  type metadata accessor for AssetFetcherLimiter();
  uint64_t v4 = sub_259844500();
  v5 = self;
  AssetFetcherOptions.limiters.setter(v4);
}

- (unint64_t)seed
{
  return AssetFetcherOptions.seed.getter();
}

- (void)setSeed:(unint64_t)a3
{
}

- (PFPseudoRandomNumberGenerator)randomGenerator
{
  id v2 = self;
  id v3 = sub_259547B84();

  return (PFPseudoRandomNumberGenerator *)v3;
}

- (CLSCurationContext)curationContext
{
  id v2 = self;
  id v3 = sub_259547D48();

  return (CLSCurationContext *)v3;
}

- (void)setCurationContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25954875C((uint64_t)v4);
}

- (id)initFetchOptionsWithExcludeUUIDs:(id)a3 minimumSceneVersion:(signed __int16)a4 predicate:(id)a5
{
  unint64_t v8 = sub_259844500();
  id v9 = a5;
  v10 = self;
  id v11 = sub_259547240(v8, a4, a5);

  swift_bridgeObjectRelease();
  return v11;
}

- (id)curationPredicate
{
  id v2 = self;
  id v3 = (void *)sub_2595478BC();

  return v3;
}

- (PNAssetFetcherOptions)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PNAssetFetcherOptions____lazy_storage___curationContext);
}

- (NSArray)fetchSources
{
  return (NSArray *)sub_259548C40(self, (uint64_t)a2, (void (*)(void))AssetFetcherOptions.fetchSources.getter);
}

- (void)setFetchSources:(id)a3
{
}

- (NSArray)fetchFilters
{
  return (NSArray *)sub_259548C40(self, (uint64_t)a2, (void (*)(void))AssetFetcherOptions.fetchFilters.getter);
}

- (void)setFetchFilters:(id)a3
{
}

- (NSArray)fetchLimiters
{
  id v2 = self;
  AssetFetcherOptions.fetchLimiters.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D610);
  id v3 = (void *)sub_2598444E0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setFetchLimiters:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D610);
  unint64_t v4 = sub_259844500();
  v5 = self;
  AssetFetcherOptions.fetchLimiters.setter(v4);
}

@end