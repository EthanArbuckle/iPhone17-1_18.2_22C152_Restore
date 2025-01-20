@interface PLCloudFeedAssetsEntry
+ (id)entityName;
- (BOOL)shouldBeRemovedFromPhotoLibrary:(id)a3;
- (NSMutableOrderedSet)mutableEntryAssets;
- (void)willSave;
@end

@implementation PLCloudFeedAssetsEntry

- (void)willSave
{
  v7.receiver = self;
  v7.super_class = (Class)PLCloudFeedAssetsEntry;
  [(PLCloudFeedEntry *)&v7 willSave];
  v3 = [(PLCloudFeedAssetsEntry *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(PLCloudFeedAssetsEntry *)self changedValues];
    v5 = [v4 objectForKeyedSubscript:@"entryAssets"];

    if (v5)
    {
      v6 = [v3 delayedSaveActions];
      [v6 recordCloudFeedAssetsEntryForAssetUpdate:self];
    }
  }
}

- (BOOL)shouldBeRemovedFromPhotoLibrary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLCloudFeedAssetsEntry;
  unsigned __int8 v4 = [(PLCloudFeedEntry *)&v8 shouldBeRemovedFromPhotoLibrary:a3];
  int64_t v5 = [(PLCloudFeedEntry *)self entryType];
  if ((v4 & 1) == 0 && v5 != 4)
  {
    v6 = [(PLCloudFeedAssetsEntry *)self entryAssets];
    unsigned __int8 v4 = [v6 count] == 0;
  }
  return v4;
}

- (NSMutableOrderedSet)mutableEntryAssets
{
  return (NSMutableOrderedSet *)[(PLCloudFeedAssetsEntry *)self mutableOrderedSetValueForKey:@"entryAssets"];
}

+ (id)entityName
{
  return @"CloudFeedAssetsEntry";
}

@end