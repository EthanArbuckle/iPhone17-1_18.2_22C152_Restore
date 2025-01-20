@interface TCCCollectionFetcher
- (TCCCollectionFetcher)init;
- (id)fetchAssetsForTCCWithLimit:(int64_t)a3 seed:(id)a4;
- (id)init:(id)a3;
@end

@implementation TCCCollectionFetcher

- (id)init:(id)a3
{
  return TCCCollectionFetcher.init(_:)((uint64_t)a3);
}

- (id)fetchAssetsForTCCWithLimit:(int64_t)a3 seed:(id)a4
{
  v6 = self;
  id v7 = a4;
  v12.value.super.super.isa = (Class)a4;
  unint64_t v8 = (unint64_t)TCCCollectionFetcher.fetchAssetsForTCC(limit:seed:)(a3, v12);

  if (v8)
  {
    sub_25935633C(0, (unint64_t *)&qword_26B2F83C0);
    v9 = (void *)sub_2598444E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (TCCCollectionFetcher)init
{
}

- (void).cxx_destruct
{
}

@end