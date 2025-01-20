@interface PNTCCCollectionFetcherWrapper
+ (id)fetchCuratedAssetsForTCCWithLimit:(int64_t)a3 seed:(id)a4 library:(id)a5;
@end

@implementation PNTCCCollectionFetcherWrapper

+ (id)fetchCuratedAssetsForTCCWithLimit:(int64_t)a3 seed:(id)a4 library:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[TCCCollectionFetcher alloc] init:v7];

  v10 = [v9 fetchAssetsForTCCWithLimit:a3 seed:v8];

  return v10;
}

@end