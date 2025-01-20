@interface NPTOPhotosFaceRecentsContentProvider
- (id)assetCollections;
@end

@implementation NPTOPhotosFaceRecentsContentProvider

- (id)assetCollections
{
  return +[PHAssetCollection fetchAssetCollectionsWithType:2 subtype:209 options:0];
}

@end