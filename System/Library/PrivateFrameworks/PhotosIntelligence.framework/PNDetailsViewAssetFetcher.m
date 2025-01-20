@interface PNDetailsViewAssetFetcher
+ (id)fetchAllAssetsForCollection:(id)a3 options:(id)a4;
+ (id)fetchEditorialAssetsForCollection:(id)a3 options:(id)a4;
+ (id)fetchMovieAssetsForCollection:(id)a3 options:(id)a4;
+ (id)fetchPreviewAssetsForCollection:(id)a3 options:(id)a4;
- (PNDetailsViewAssetFetcher)init;
@end

@implementation PNDetailsViewAssetFetcher

+ (id)fetchAllAssetsForCollection:(id)a3 options:(id)a4
{
  return sub_259356378((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(id, id))static PNDetailsViewAssetFetcher.fetchAllAssets(forCollection:options:));
}

+ (id)fetchPreviewAssetsForCollection:(id)a3 options:(id)a4
{
  return sub_259356378((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(id, id))static PNDetailsViewAssetFetcher.fetchPreviewAssets(forCollection:options:));
}

+ (id)fetchEditorialAssetsForCollection:(id)a3 options:(id)a4
{
  return sub_259356378((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(id, id))static PNDetailsViewAssetFetcher.fetchEditorialAssets(forCollection:options:));
}

+ (id)fetchMovieAssetsForCollection:(id)a3 options:(id)a4
{
  return sub_259356378((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(id, id))static PNDetailsViewAssetFetcher.fetchMovieAssets(forCollection:options:));
}

- (PNDetailsViewAssetFetcher)init
{
  return (PNDetailsViewAssetFetcher *)PNDetailsViewAssetFetcher.init()();
}

@end