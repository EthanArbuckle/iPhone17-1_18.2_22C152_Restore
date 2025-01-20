@interface MusicIndexRequestHandler
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation MusicIndexRequestHandler

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v4 = a4;
  v5 = +[MLMediaLibraryService sharedMediaLibraryService];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003BEC;
  v7[3] = &unk_100004070;
  id v8 = v4;
  id v6 = v4;
  [v5 updateSpotlightIndexForBundleID:@"com.apple.Music" withCompletion:v7];
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = +[MLMediaLibraryService sharedMediaLibraryService];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003CD0;
  v10[3] = &unk_100004070;
  id v11 = v6;
  id v9 = v6;
  [v8 updateSpotlightIndexMetadataForItemsWithIdentifiers:v7 bundleID:@"com.apple.Music" withCompletion:v10];
}

@end