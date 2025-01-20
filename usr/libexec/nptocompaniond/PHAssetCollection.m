@interface PHAssetCollection
+ (id)npto_fetchMemoriesWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)npto_fetchMemoriesWithOptions:(id)a3;
@end

@implementation PHAssetCollection

+ (id)npto_fetchMemoriesWithOptions:(id)a3
{
  return +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:a3];
}

+ (id)npto_fetchMemoriesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  return +[PHAssetCollection fetchAssetCollectionsWithType:4 localIdentifiers:a3 options:a4];
}

@end