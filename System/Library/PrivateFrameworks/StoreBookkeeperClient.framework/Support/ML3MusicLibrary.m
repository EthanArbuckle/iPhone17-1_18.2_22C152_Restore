@interface ML3MusicLibrary
- (BOOL)supportsUPP;
- (id)SBKBeginTransactionWithItemsToSyncEnumerationBlock:(id)a3;
- (id)SBKQueryForTracksNeedingPushWithEntityRevisionAnchor:(unint64_t)a3 orderingTerms:(id)a4;
- (id)SBKSQLQueryStringForItemsNeedingPush;
- (id)uppDatabase;
- (void)SBKCommitUniversalPlaybackPositionTransaction:(id)a3 domainVersion:(id)a4 metadataEnumerationBlock:(id)a5;
@end

@implementation ML3MusicLibrary

- (BOOL)supportsUPP
{
  return 1;
}

- (id)uppDatabase
{
  objc_getAssociatedObject(self, "__SBDML3UbiquitousDatabaseKey");
  v3 = (SBDML3UbiquitousDatabase *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = [[SBDML3UbiquitousDatabase alloc] initWithMusicLibrary:self];
    objc_setAssociatedObject(self, "__SBDML3UbiquitousDatabaseKey", v3, (void *)1);
  }
  return v3;
}

- (void)SBKCommitUniversalPlaybackPositionTransaction:(id)a3 domainVersion:(id)a4 metadataEnumerationBlock:(id)a5
{
  id v7 = a3;
  id v29 = a4;
  v8 = (void (**)(void))a5;
  v9 = [v7 musicLibrary];
  v30 = v7;
  id v28 = [v7 transactionEntityRevision];
  v10 = +[NSMutableDictionary dictionary];
  uint64_t v11 = v8[2](v8);
  if (v11)
  {
    v12 = (void *)v11;
    uint64_t v13 = ML3TrackPropertyStoreBookmarkMetadataIdentifier;
    do
    {
      v14 = [v12 itemIdentifier];
      v15 = +[ML3ComparisonPredicate predicateWithProperty:v13 equalToValue:v14];
      v16 = +[ML3Track anyInLibrary:v9 predicate:v15];

      if (v16)
      {
        [v10 setObject:v16 forKey:v12];
      }
      else
      {
        v17 = +[NSNull null];
        [v10 setObject:v17 forKey:v12];
      }
      uint64_t v18 = v8[2](v8);

      v12 = (void *)v18;
    }
    while (v18);
  }
  v19 = +[NSMutableArray array];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10000CF50;
  v36[3] = &unk_100020DF0;
  id v20 = v10;
  id v38 = v19;
  id v39 = v28;
  id v37 = v20;
  id v21 = v19;
  v22 = v9;
  [v9 performDatabaseTransactionWithBlock:v36];
  [v20 removeObjectsForKeys:v21];
  [v9 uppDatabase];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000CFE4;
  v31[3] = &unk_100020E40;
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = v29;
  id v34 = v20;
  id v35 = v28;
  id v23 = v32;
  id v24 = v29;
  id v25 = v20;
  [v23 updateUbiquitousDatabaseByPerformingWriteTransactionWithBlock:v31];
  v26 = [v30 ubiquitousIdentifiersToSync];
  [v23 updateUbiquitousDatabaseByResetingSyncEntityRevisionForItemsWithMetadataIdentifiers:v26];

  v27 = +[NSDate distantFuture];
  [v23 setDateToSyncWithUbiquitousStore:v27];
}

- (id)SBKBeginTransactionWithItemsToSyncEnumerationBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SBDPlaybackPositionTransaction);
  [(SBDPlaybackPositionTransaction *)v5 setMusicLibrary:self];
  v6 = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D738;
  v13[3] = &unk_100020DA0;
  id v7 = v5;
  v14 = v7;
  v15 = v6;
  v16 = v6;
  id v17 = v4;
  id v8 = v4;
  v9 = v6;
  [(ML3MusicLibrary *)v9 performReadOnlyDatabaseTransactionWithBlock:v13];
  v10 = v17;
  uint64_t v11 = v7;

  return v11;
}

- (id)SBKSQLQueryStringForItemsNeedingPush
{
  return +[NSString stringWithFormat:@"SELECT key FROM cloud_kvs LEFT OUTER JOIN item_kvs using (key) WHERE item_pid IS NULL AND bookmark_sync_timestamp != 0 AND bookmark_sync_revision >= ?"];
}

- (id)SBKQueryForTracksNeedingPushWithEntityRevisionAnchor:(unint64_t)a3 orderingTerms:(id)a4
{
  uint64_t v6 = ML3TrackPropertyRememberBookmarkTime;
  id v7 = a4;
  id v8 = +[ML3ComparisonPredicate predicateWithProperty:v6 equalToValue:&__kCFBooleanTrue];
  v9 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreBookmarkMetadataTimestamp value:&off_100021EA0 comparison:2];
  uint64_t v10 = ML3TrackPropertyStoreBookmarkMetadataEntityRevision;
  uint64_t v11 = +[NSNumber numberWithUnsignedLongLong:a3];
  v12 = +[ML3ComparisonPredicate predicateWithProperty:v10 value:v11 comparison:4];

  v17[0] = v8;
  v17[1] = v9;
  v17[2] = v12;
  uint64_t v13 = +[NSArray arrayWithObjects:v17 count:3];
  v14 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v13];

  v15 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:self predicate:v14 orderingTerms:v7];

  return v15;
}

@end