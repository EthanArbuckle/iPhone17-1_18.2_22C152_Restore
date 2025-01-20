@interface TTSAssetMACompactAsset
- (BOOL)purgeable;
- (NSBundle)bundle;
- (TTSAssetQuality)quality;
@end

@implementation TTSAssetMACompactAsset

- (TTSAssetQuality)quality
{
  v2 = self;
  id v3 = sub_19CDAD858(&qword_1EB534668, (void **)&qword_1EB5345E0);

  return (TTSAssetQuality *)v3;
}

- (NSBundle)bundle
{
  v2 = self;
  id v3 = sub_19CE25278();

  return (NSBundle *)v3;
}

- (BOOL)purgeable
{
  return 0;
}

@end