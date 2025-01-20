@interface NPTOPhotosFaceFavoritesContentProvider
- (id)assetCollections;
@end

@implementation NPTOPhotosFaceFavoritesContentProvider

- (id)assetCollections
{
  return +[PHAssetCollection fetchAssetCollectionsWithType:2 subtype:203 options:0];
}

@end