@interface BKAudiobookPersistenceMediaLibraryLocalItems
- (BOOL)isLocal;
- (NSString)shortName;
- (id)_mediaQueryFromAudiobook:(id)a3;
@end

@implementation BKAudiobookPersistenceMediaLibraryLocalItems

- (NSString)shortName
{
  return (NSString *)@"Media Library (local items)";
}

- (BOOL)isLocal
{
  return 1;
}

- (id)_mediaQueryFromAudiobook:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BKAudiobookPersistenceMediaLibraryLocalItems;
  id v4 = a3;
  v5 = [(BKAudiobookPersistenceMediaLibrary *)&v10 _mediaQueryFromAudiobook:v4];
  v6 = -[BKAudiobookPersistenceMediaLibrary _storeIDFromAudiobook:](self, "_storeIDFromAudiobook:", v4, v10.receiver, v10.super_class);

  v7 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanFalse forProperty:MPMediaItemPropertyIsCloudItem];
  [v5 addFilterPredicate:v7];

  if ([v6 length])
  {
    v8 = +[MPMediaPropertyPredicate predicateWithValue:v6 forProperty:MPMediaItemPropertyStorePlaylistID];
    [v5 addFilterPredicate:v8];
  }

  return v5;
}

@end