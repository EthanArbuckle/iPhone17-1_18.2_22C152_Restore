@interface ML3MusicLibrary
- (BOOL)_updateUbiquitousDatabaseWithEntity:(id)a3 syncRevision:(int64_t)a4 usingConnection:(id)a5;
- (BOOL)removeAllUbiquitousMetadataUsingClientIdentity:(id)a3 error:(id *)a4;
- (BOOL)updateMusicLibraryWithClientIdentity:(id)a3 applyUbiquitousBookmarkMetadataToTrackWithPersistentID:(int64_t)a4;
- (BOOL)updateUbiquitousDatabaseWithClientIdentity:(id)a3 removeUbiquitousMetadataFromTrackWithPersistentID:(int64_t)a4 error:(id *)a5;
- (BOOL)updateWithEntity:(id)a3 clientIdentity:(id)a4;
- (NSDate)dateLastSynced;
- (NSString)lastNotificationDomainVersion;
- (NSString)lastSyncedDomainVersion;
- (id)_keyValueStoreItemIdentifierForItem:(id)a3;
- (id)_kvsEntityWithKVSKey:(id)a3 domain:(id)a4;
- (id)_queryForTracksNeedingPushWithEntityRevisionAnchor:(unint64_t)a3 orderingTerms:(id)a4;
- (id)_sqlQueryStringForItemsNeedingPush;
- (id)beginTransactionWithItemsToSyncWithDomain:(id)a3 enumerationBlock:(id)a4;
- (id)readUbiquitousDatabaseMetadataValuesForIdentifiers:(id)a3 forDomain:(id)a4 clientIdentity:(id)a5;
- (int64_t)icd_preferredVideoQuality;
- (int64_t)icd_sagaCloudAddToPlaylistBehavior;
- (int64_t)icd_sagaCloudFavoriteSongAddToLibraryBehavior;
- (int64_t)icd_sagaDatabaseUserVersion;
- (unint64_t)lastSyncedEntityRevision;
- (void)_populateMetadataValues:(id)a3 fromDataSourceTrack:(id)a4;
- (void)_updateDatabaseByResetingSyncEntityRevisionForItemsWithIdentifiers:(id)a3;
- (void)commitUniversalPlaybackPositions:(id)a3 context:(id)a4 domain:(id)a5 domainVersion:(id)a6;
- (void)icd_setPreferredVideoQuality:(int64_t)a3;
- (void)icd_setSagaCloudAddToPlaylistBehavior:(int64_t)a3;
- (void)icd_setSagaCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3;
- (void)icd_setSagaDatabaseUserVersion:(int64_t)a3;
- (void)setDateLastSynced:(id)a3;
- (void)setLastNotificationDomainVersion:(id)a3;
- (void)setLastSyncedDomainVersion:(id)a3;
- (void)setLastSyncedEntityRevision:(unint64_t)a3;
@end

@implementation ML3MusicLibrary

- (void)icd_setPreferredVideoQuality:(int64_t)a3
{
  if ((unint64_t)a3 >= 3) {
    a3 = -1;
  }
  [(ML3MusicLibrary *)self setPreferredVideoQuality:a3];
}

- (int64_t)icd_preferredVideoQuality
{
  int64_t result = (int64_t)[(ML3MusicLibrary *)self preferredVideoQuality];
  if ((unint64_t)result >= 3) {
    return -1;
  }
  return result;
}

- (void)icd_setSagaCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2 * (a3 == 2);
  }
  [(ML3MusicLibrary *)self setSagaCloudFavoriteSongAddToLibraryBehavior:v3];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v5 = (const __CFString *)ICCloudClientCloudFavoriteSongAddToLibraryBehaviorDidChangeNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, 0, 0, 1u);
}

- (void)icd_setSagaCloudAddToPlaylistBehavior:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2 * (a3 == 2);
  }
  [(ML3MusicLibrary *)self setSagaCloudAddToPlaylistBehavior:v3];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v5 = (const __CFString *)ICCloudClientCloudAddToPlaylistBehaviorDidChangeNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, 0, 0, 1u);
}

- (int64_t)icd_sagaCloudFavoriteSongAddToLibraryBehavior
{
  int64_t result = (int64_t)[(ML3MusicLibrary *)self sagaCloudAddToPlaylistBehavior];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (int64_t)icd_sagaCloudAddToPlaylistBehavior
{
  id v2 = [(ML3MusicLibrary *)self sagaCloudAddToPlaylistBehavior];
  if (v2 == (id)1) {
    return 1;
  }
  else {
    return 2 * (v2 == (id)2);
  }
}

- (void)icd_setSagaDatabaseUserVersion:(int64_t)a3
{
}

- (int64_t)icd_sagaDatabaseUserVersion
{
  return (int64_t)[(ML3MusicLibrary *)self sagaDatabaseUserVersion];
}

- (BOOL)_updateUbiquitousDatabaseWithEntity:(id)a3 syncRevision:(int64_t)a4 usingConnection:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 playbackPositionKey];
  id v10 = [v9 length];

  if (v10)
  {
    v11 = [v7 bookmarkTime];
    if (v11)
    {
      v12 = [v7 bookmarkTime];
      [v12 doubleValue];
      v14 = +[NSNumber numberWithDouble:v13 * 1000.0];
    }
    else
    {
      v14 = &off_1001CC1D0;
    }

    v16 = [v7 playbackPositionKey];
    v33[0] = v16;
    uint64_t v17 = [v7 userPlayCount];
    v18 = (void *)v17;
    if (v17) {
      v19 = (_UNKNOWN **)v17;
    }
    else {
      v19 = &off_1001CC1D0;
    }
    v33[1] = v19;
    uint64_t v20 = [v7 hasBeenPlayed];
    v21 = (void *)v20;
    if (v20) {
      v22 = (_UNKNOWN **)v20;
    }
    else {
      v22 = &off_1001CC1D0;
    }
    v33[2] = v22;
    v33[3] = v14;
    uint64_t v23 = [v7 bookmarkTimestamp];
    v24 = (void *)v23;
    if (v23) {
      v25 = (_UNKNOWN **)v23;
    }
    else {
      v25 = &off_1001CC1D0;
    }
    v33[4] = v25;
    v26 = +[NSNumber numberWithLongLong:a4];
    v33[5] = v26;
    v27 = +[NSArray arrayWithObjects:v33 count:6];
    unsigned __int8 v15 = [v8 executeUpdate:@"INSERT OR REPLACE INTO cloud_kvs (key, play_count_user, has_been_played, bookmark_time_ms, bookmark_sync_timestamp, bookmark_sync_revision) VALUES (?, ?, ?, ?, ?, ?)", v27, 0 withParameters error];

    if ((v15 & 1) == 0)
    {
      v28 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = [v7 playbackPositionKey];
        int v31 = 138412290;
        v32 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "failed to update ubiquitous bookmarkmatadata for identifier %@.", (uint8_t *)&v31, 0xCu);
      }
    }
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (void)_updateDatabaseByResetingSyncEntityRevisionForItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    CFStringRef v5 = +[ML3DatabaseStatementRenderer defaultRenderer];
    objc_msgSend(v5, "statementWithPrefix:inParameterCount:", @"UPDATE cloud_kvs SET bookmark_sync_revision = 0 WHERE key", objc_msgSend(v4, "count"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000B5DB0;
    v7[3] = &unk_1001BE540;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v4;
    id v6 = v8;
    [(ML3MusicLibrary *)self performDatabaseTransactionWithBlock:v7];
  }
}

- (id)_queryForTracksNeedingPushWithEntityRevisionAnchor:(unint64_t)a3 orderingTerms:(id)a4
{
  uint64_t v6 = ML3TrackPropertyRememberBookmarkTime;
  id v7 = a4;
  id v8 = +[ML3ComparisonPredicate predicateWithProperty:v6 equalToValue:&__kCFBooleanTrue];
  id v9 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreBookmarkMetadataTimestamp value:&off_1001CC1D0 comparison:2];
  uint64_t v10 = ML3TrackPropertyStoreBookmarkMetadataEntityRevision;
  v11 = +[NSNumber numberWithUnsignedLongLong:a3];
  v12 = +[ML3ComparisonPredicate predicateWithProperty:v10 value:v11 comparison:4];

  v17[0] = v8;
  v17[1] = v9;
  v17[2] = v12;
  double v13 = +[NSArray arrayWithObjects:v17 count:3];
  v14 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v13];

  unsigned __int8 v15 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:self predicate:v14 orderingTerms:v7];

  return v15;
}

- (id)_sqlQueryStringForItemsNeedingPush
{
  return +[NSString stringWithFormat:@"SELECT key FROM cloud_kvs LEFT OUTER JOIN item_kvs using (key) WHERE item_pid IS NULL AND bookmark_sync_timestamp != 0 AND bookmark_sync_revision >= ?"];
}

- (id)_keyValueStoreItemIdentifierForItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = ML3TrackPropertyStoreItemID;
  uint64_t v5 = ML3TrackPropertySubscriptionStoreItemID;
  v38[0] = ML3TrackPropertyStoreItemID;
  v38[1] = ML3TrackPropertySubscriptionStoreItemID;
  uint64_t v6 = ML3TrackPropertyMediaType;
  v38[2] = ML3TrackPropertyMediaType;
  id v7 = +[NSArray arrayWithObjects:v38 count:3];
  id v8 = sub_1000B6384(v3, v7);
  id v9 = [v8 objectForKey:v6];
  unsigned int v10 = [v9 unsignedIntValue];

  v11 = [v8 objectForKey:v4];
  char v12 = _NSIsNSString();
  double v13 = [v8 objectForKey:v4];
  v14 = v13;
  if (v12) {
    id v15 = [v13 longLongValue];
  }
  else {
    id v15 = [v13 unsignedLongLongValue];
  }
  id v16 = v15;

  if (!v16)
  {
    uint64_t v17 = [v8 objectForKey:v5];
    uint64_t v18 = _NSIsNSString();
    v19 = [v8 objectForKey:v5];
    uint64_t v20 = v19;
    if (v18) {
      id v21 = [v19 longLongValue];
    }
    else {
      id v21 = [v19 unsignedLongLongValue];
    }
    id v16 = v21;
  }
  if (v16 && v10 != 256 && v10 != 4096)
  {
    uint64_t v22 = +[NSString stringWithFormat:@"%llu", v16];
LABEL_13:
    uint64_t v23 = (void *)v22;
    goto LABEL_16;
  }
  v37[0] = ML3TrackPropertyFeedURL;
  v37[1] = ML3TrackPropertyPodcastExternalGUID;
  v24 = +[NSArray arrayWithObjects:v37 count:2];

  v25 = sub_1000B6384(v3, v24);

  uint64_t v26 = ICPlaybackPositionEntityIdentifierForProperties();
  if (v26) {
    goto LABEL_15;
  }
  uint64_t v28 = ML3TrackPropertyTitle;
  uint64_t v29 = ML3TrackPropertyArtist;
  v36[0] = ML3TrackPropertyTitle;
  v36[1] = ML3TrackPropertyArtist;
  uint64_t v30 = ML3TrackPropertyAlbum;
  v36[2] = ML3TrackPropertyAlbum;
  id v7 = +[NSArray arrayWithObjects:v36 count:3];

  id v8 = sub_1000B6384(v3, v7);

  uint64_t v22 = ICPlaybackPositionEntityIdentifierForProperties();
  if (v22) {
    goto LABEL_13;
  }
  v35[0] = v28;
  v35[1] = v30;
  v24 = +[NSArray arrayWithObjects:v35 count:2];

  v25 = sub_1000B6384(v3, v24);

  uint64_t v26 = ICPlaybackPositionEntityIdentifierForProperties();
  if (v26)
  {
LABEL_15:
    uint64_t v23 = (void *)v26;
    id v7 = v24;
    id v8 = v25;
  }
  else
  {
    v34[0] = v28;
    v34[1] = v29;
    id v7 = +[NSArray arrayWithObjects:v34 count:2];

    id v8 = sub_1000B6384(v3, v7);

    uint64_t v22 = ICPlaybackPositionEntityIdentifierForProperties();
    if (v22) {
      goto LABEL_13;
    }
    uint64_t v33 = v28;
    int v31 = +[NSArray arrayWithObjects:&v33 count:1];

    uint64_t v32 = sub_1000B6384(v3, v31);

    uint64_t v23 = ICPlaybackPositionEntityIdentifierForProperties();
    id v7 = v31;
    id v8 = (void *)v32;
  }
LABEL_16:

  return v23;
}

- (id)_kvsEntityWithKVSKey:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1000B6640;
  id v21 = sub_1000B6650;
  id v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B6658;
  v12[3] = &unk_1001BC790;
  id v8 = v6;
  id v13 = v8;
  id v16 = &v17;
  id v9 = v7;
  id v14 = v9;
  id v15 = self;
  [(ML3MusicLibrary *)self performDatabaseTransactionWithBlock:v12];
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v10;
}

- (void)_populateMetadataValues:(id)a3 fromDataSourceTrack:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(ML3MusicLibrary *)self _keyValueStoreItemIdentifierForItem:v6];
  [v16 setPlaybackPositionKey:v7];

  id v8 = [v6 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataTimestamp];
  [v16 setBookmarkTimestamp:v8];

  id v9 = [v6 valueForProperty:ML3TrackPropertyHasBeenPlayed];
  [v16 setHasBeenPlayed:v9];

  id v10 = [v6 valueForProperty:ML3TrackPropertyPlayCountUser];
  [v16 setUserPlayCount:v10];

  v11 = [v6 valueForProperty:ML3TrackPropertyBookmarkTime];

  [v16 setBookmarkTime:v11];
  char v12 = [v16 bookmarkTime];

  if (v12)
  {
    id v13 = [v16 bookmarkTime];
    [v13 doubleValue];
    id v15 = +[NSNumber numberWithDouble:v14 / 1000.0];
    [v16 setBookmarkTime:v15];
  }
}

- (BOOL)updateUbiquitousDatabaseWithClientIdentity:(id)a3 removeUbiquitousMetadataFromTrackWithPersistentID:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_1000B6640;
  id v22 = sub_1000B6650;
  id v23 = 0;
  id v9 = [objc_alloc((Class)ML3Track) initWithPersistentID:a4 inLibrary:self];
  id v10 = [v9 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataIdentifier];
  if ([v10 length])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B6CB4;
    v13[3] = &unk_1001BC740;
    id v14 = v8;
    id v16 = &v24;
    id v15 = v10;
    uint64_t v17 = &v18;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v13];
  }
  if (*((unsigned char *)v25 + 24))
  {
    BOOL v11 = 1;
  }
  else
  {
    *a5 = (id) v19[5];
    BOOL v11 = *((unsigned char *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (BOOL)updateWithEntity:(id)a3 clientIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = [v6 playbackPositionKey];
  id v10 = [v9 length];

  if (v10)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v21 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000B6FB0;
    v14[3] = &unk_1001BC718;
    id v15 = v7;
    id v16 = v6;
    uint64_t v18 = v8;
    uint64_t v19 = buf;
    uint64_t v17 = v18;
    [(ML3MusicLibrary *)v18 performDatabaseTransactionWithBlock:v14];
    BOOL v11 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    char v12 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@ Entity has no playbackPositionKey. entity=%{public}@", buf, 0x16u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)updateMusicLibraryWithClientIdentity:(id)a3 applyUbiquitousBookmarkMetadataToTrackWithPersistentID:(int64_t)a4
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B7960;
  v8[3] = &unk_1001BC6A0;
  id v6 = a3;
  id v9 = v6;
  id v10 = self;
  BOOL v11 = &v13;
  int64_t v12 = a4;
  [(ML3MusicLibrary *)self performDatabaseTransactionWithBlock:v8];
  LOBYTE(a4) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return a4;
}

- (BOOL)removeAllUbiquitousMetadataUsingClientIdentity:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = sub_1000B6640;
  uint64_t v17 = sub_1000B6650;
  id v18 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B7F34;
  v9[3] = &unk_1001BC650;
  id v6 = a3;
  id v10 = v6;
  BOOL v11 = &v19;
  int64_t v12 = &v13;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v9];
  if (*((unsigned char *)v20 + 24))
  {
    BOOL v7 = 1;
  }
  else
  {
    *a4 = (id) v14[5];
    BOOL v7 = *((unsigned char *)v20 + 24) != 0;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

- (id)readUbiquitousDatabaseMetadataValuesForIdentifiers:(id)a3 forDomain:(id)a4 clientIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = sub_1000B6640;
    char v22 = sub_1000B6650;
    id v23 = objc_alloc_init((Class)NSMutableArray);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B8180;
    v13[3] = &unk_1001BCEA0;
    id v14 = v10;
    id v15 = v8;
    id v16 = v9;
    uint64_t v17 = &v18;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v13];
    id v11 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v11 = &__NSArray0__struct;
  }

  return v11;
}

- (void)commitUniversalPlaybackPositions:(id)a3 context:(id)a4 domain:(id)a5 domainVersion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v35 = a5;
  id v36 = a6;
  v37 = v11;
  id v34 = [v11 transactionEntityRevision];
  int64_t v12 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting commit", buf, 0xCu);
  }
  uint64_t v13 = self;

  id v14 = +[NSMutableDictionary dictionary];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v10;
  id v15 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v49;
    uint64_t v18 = ML3TrackPropertyStoreBookmarkMetadataIdentifier;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v21 = [v20 playbackPositionKey];
        if (v21)
        {
          char v22 = +[ML3ComparisonPredicate predicateWithProperty:v18 equalToValue:v21];
          id v23 = +[ML3Track anyInLibrary:v13 predicate:v22];

          if (v23)
          {
            [v14 setObject:v23 forKey:v20];
          }
          else
          {
            uint64_t v24 = +[NSNull null];
            [v14 setObject:v24 forKey:v20];
          }
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v16);
  }

  v25 = +[NSMutableArray array];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000B8954;
  v44[3] = &unk_1001BC5B0;
  id v26 = v14;
  id v45 = v26;
  id v47 = v34;
  id v27 = v25;
  id v46 = v27;
  [(ML3MusicLibrary *)v13 performDatabaseTransactionWithBlock:v44];
  uint64_t v28 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v13;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Done Updating Local Items", buf, 0xCu);
  }

  [v26 removeObjectsForKeys:v27];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000B89E8;
  v39[3] = &unk_1001BC600;
  v39[4] = v13;
  id v40 = v36;
  id v41 = v26;
  id v42 = v35;
  id v43 = v34;
  id v29 = v35;
  id v30 = v26;
  id v31 = v36;
  [(ML3MusicLibrary *)v13 performDatabaseTransactionWithBlock:v39];
  uint64_t v32 = [v37 ubiquitousIdentifiersToSync];
  [(ML3MusicLibrary *)v13 _updateDatabaseByResetingSyncEntityRevisionForItemsWithIdentifiers:v32];

  uint64_t v33 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v13;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ Done Updating ubiquitous_bookmarks table (all items)", buf, 0xCu);
  }
}

- (id)beginTransactionWithItemsToSyncWithDomain:(id)a3 enumerationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B8F5C;
  v15[3] = &unk_1001BC560;
  v15[4] = self;
  id v8 = [[ICDPlaybackPositionDatabaseContext alloc] initWithLibrary:self];
  id v16 = v8;
  id v17 = v6;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = self;
  [(ML3MusicLibrary *)v11 performReadOnlyDatabaseTransactionWithBlock:v15];
  int64_t v12 = v18;
  uint64_t v13 = v8;

  return v13;
}

- (void)setLastNotificationDomainVersion:(id)a3
{
}

- (NSString)lastNotificationDomainVersion
{
  return (NSString *)[(ML3MusicLibrary *)self valueForDatabaseProperty:@"MPUbiquitousBookmarkDomainVersionRemoteToken"];
}

- (void)setDateLastSynced:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MPDateLastSynced"];
}

- (NSDate)dateLastSynced
{
  id v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MPDateLastSynced"];
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    id v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v3 = 0;
  }

  return (NSDate *)v3;
}

- (void)setLastSyncedDomainVersion:(id)a3
{
}

- (NSString)lastSyncedDomainVersion
{
  return (NSString *)[(ML3MusicLibrary *)self valueForDatabaseProperty:@"MPUbiquitousBookmarkDomainVersionAnchorToken"];
}

- (void)setLastSyncedEntityRevision:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLUbiquitousBookmarkEntityRevisionAnchor"];
}

- (unint64_t)lastSyncedEntityRevision
{
  id v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLUbiquitousBookmarkEntityRevisionAnchor"];
  id v3 = [v2 longLongValue];

  return (unint64_t)v3;
}

@end