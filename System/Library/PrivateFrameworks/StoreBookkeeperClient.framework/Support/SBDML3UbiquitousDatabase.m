@interface SBDML3UbiquitousDatabase
- (BOOL)_databaseHasEntryForEntity:(id)a3;
- (BOOL)_setValue:(id)a3 forDatabaseProperty:(id)a4;
- (BOOL)_updateUbiquitousDatabase_setBookmarkMetadataWithValuesFromTrackWithMetadataIdentifier:(id)a3 hasBeenPlayed:(BOOL)a4 playCount:(unint64_t)a5 bookmarkTime:(double)a6 timestamp:(double)a7 syncRevision:(int64_t)a8 usingConnection:(id)a9;
- (BOOL)hasLocalChangesToPush;
- (BOOL)hasRemoteChangesToPull;
- (BOOL)hasSyncedAtleastOnce;
- (BOOL)updateUbiquitousDatabaseByInsertingUbiquitousMetadataForTrackWithMetadataIdentifier:(id)a3 hasBeenPlayed:(BOOL)a4 playCount:(unint64_t)a5 bookmarkTime:(double)a6 timestamp:(double)a7 syncRevision:(int64_t)a8;
- (BOOL)updateUbiquitousDatabaseWithClientIdentity:(id)a3 persistUbiquitousMetadataWithEntity:(id)a4;
- (ML3MusicLibrary)musicLibrary;
- (NSDate)dateLastSynced;
- (NSDate)dateToSyncWithUbiquitousStore;
- (NSString)lastNotificationDomainVersion;
- (NSString)lastSyncedDomainVersion;
- (SBDML3UbiquitousDatabase)init;
- (SBDML3UbiquitousDatabase)initWithMusicLibrary:(id)a3;
- (id)_valueForDatabaseProperty:(id)a3;
- (id)readUbiquitousDatabaseMetadataValuesWithClientIdentity:(id)a3 identifier:(id)a4;
- (id)readUbiquitousDatabaseMetadataValuesWithClientIdentity:(id)a3 identifiers:(id)a4;
- (unint64_t)lastSyncedEntityRevision;
- (void)dumpUbiquitousMetadata;
- (void)setDateLastSynced:(id)a3;
- (void)setDateToSyncWithUbiquitousStore:(id)a3;
- (void)setLastNotificationDomainVersion:(id)a3;
- (void)setLastSyncedDomainVersion:(id)a3;
- (void)setLastSyncedEntityRevision:(unint64_t)a3;
- (void)updateMusicLibraryWithClientIdentity:(id)a3 applyUbiquitousBookmarkMetadataToTrackWithPersistentID:(int64_t)a4;
- (void)updateUbiquitousDatabaseByPerformingWriteTransactionWithBlock:(id)a3;
- (void)updateUbiquitousDatabaseByResetingSyncEntityRevisionForItemsWithMetadataIdentifiers:(id)a3;
- (void)updateUbiquitousDatabaseWithClientIdentity:(id)a3 removeUbiquitousMetadataFromTrackWithPersistentID:(int64_t)a4;
@end

@implementation SBDML3UbiquitousDatabase

- (void).cxx_destruct
{
}

- (ML3MusicLibrary)musicLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
  return (ML3MusicLibrary *)WeakRetained;
}

- (void)dumpUbiquitousMetadata
{
  id v2 = [(SBDML3UbiquitousDatabase *)self musicLibrary];
  [v2 performDatabaseTransactionWithBlock:&stru_100020C00];
}

- (BOOL)hasLocalChangesToPush
{
  unint64_t v3 = [(SBDML3UbiquitousDatabase *)self lastSyncedEntityRevision];
  v4 = [(SBDML3UbiquitousDatabase *)self musicLibrary];
  uint64_t v5 = ML3TrackPropertyStoreBookmarkMetadataEntityRevision;
  v6 = +[NSNumber numberWithUnsignedLongLong:v3];
  v7 = +[ML3ComparisonPredicate predicateWithProperty:v5 value:v6 comparison:3];
  v8 = +[ML3Track anyInLibrary:v4 predicate:v7];

  return v8 != 0;
}

- (BOOL)hasRemoteChangesToPull
{
  unint64_t v3 = [(SBDML3UbiquitousDatabase *)self lastSyncedDomainVersion];
  v4 = [(SBDML3UbiquitousDatabase *)self lastNotificationDomainVersion];
  char v5 = [v4 isEqual:v3] ^ 1;

  return v5;
}

- (BOOL)hasSyncedAtleastOnce
{
  id v2 = [(SBDML3UbiquitousDatabase *)self _valueForDatabaseProperty:@"MPUbiquitousBookmarkDomainVersionAnchorToken"];
  BOOL v3 = 0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || [v2 length] && (objc_msgSend(v2, "isEqualToString:", @"0") & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v2 integerValue]) {
        BOOL v3 = 1;
      }
    }
  }

  return v3;
}

- (id)readUbiquitousDatabaseMetadataValuesWithClientIdentity:(id)a3 identifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = sub_100009BE0;
    v21 = sub_100009BF0;
    id v22 = objc_alloc_init((Class)NSMutableArray);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100009BF8;
    v12[3] = &unk_100020BC0;
    id v13 = v6;
    id v14 = v7;
    id v9 = WeakRetained;
    id v15 = v9;
    v16 = &v17;
    [v9 databaseConnectionAllowingWrites:0 withBlock:v12];
    id v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)readUbiquitousDatabaseMetadataValuesWithClientIdentity:(id)a3 identifier:(id)a4
{
  id v12 = a4;
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSArray arrayWithObjects:&v12 count:1];

  id v9 = -[SBDML3UbiquitousDatabase readUbiquitousDatabaseMetadataValuesWithClientIdentity:identifiers:](self, "readUbiquitousDatabaseMetadataValuesWithClientIdentity:identifiers:", v7, v8, v12);

  id v10 = [v9 firstObject];

  return v10;
}

- (void)updateUbiquitousDatabaseByResetingSyncEntityRevisionForItemsWithMetadataIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    char v5 = +[ML3DatabaseStatementRenderer defaultRenderer];
    id v6 = objc_msgSend(v5, "statementWithPrefix:inParameterCount:", @"UPDATE cloud_kvs SET bookmark_sync_revision = 0 WHERE key", objc_msgSend(v4, "count"));
    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000A140;
    v9[3] = &unk_100020B20;
    id v10 = v6;
    id v11 = v4;
    id v8 = v6;
    [WeakRetained databaseConnectionAllowingWrites:1 withBlock:v9];
  }
}

- (void)updateMusicLibraryWithClientIdentity:(id)a3 applyUbiquitousBookmarkMetadataToTrackWithPersistentID:(int64_t)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000A278;
  v8[3] = &unk_100020E40;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
  id v11 = self;
  int64_t v12 = a4;
  id v6 = WeakRetained;
  id v7 = v9;
  [v6 performDatabaseTransactionWithBlock:v8];
}

- (void)updateUbiquitousDatabaseWithClientIdentity:(id)a3 removeUbiquitousMetadataFromTrackWithPersistentID:(int64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
  id v8 = [objc_alloc((Class)ML3Track) initWithPersistentID:a4 inLibrary:WeakRetained];
  id v9 = [v8 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataIdentifier];
  if ([v9 length])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000A8F0;
    v10[3] = &unk_100020B20;
    id v11 = v6;
    id v12 = v9;
    [WeakRetained databaseConnectionAllowingWrites:1 withBlock:v10];
  }
}

- (BOOL)_databaseHasEntryForEntity:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000AAC0;
  v8[3] = &unk_100020AF8;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [WeakRetained databaseConnectionAllowingWrites:0 withBlock:v8];

  LOBYTE(WeakRetained) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)WeakRetained;
}

- (BOOL)updateUbiquitousDatabaseWithClientIdentity:(id)a3 persistUbiquitousMetadataWithEntity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v8 = [v7 ubiquitousIdentifier];
  id v9 = [v8 length];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000AD0C;
    v14[3] = &unk_100020AD0;
    id v15 = v6;
    v16 = self;
    id v17 = v7;
    id v11 = WeakRetained;
    id v18 = v11;
    uint64_t v19 = &v20;
    [v11 performDatabaseTransactionWithBlock:v14];
    int v12 = *((unsigned __int8 *)v21 + 24);
  }
  else
  {
    int v12 = *((unsigned __int8 *)v21 + 24);
  }
  _Block_object_dispose(&v20, 8);

  return v12 != 0;
}

- (BOOL)updateUbiquitousDatabaseByInsertingUbiquitousMetadataForTrackWithMetadataIdentifier:(id)a3 hasBeenPlayed:(BOOL)a4 playCount:(unint64_t)a5 bookmarkTime:(double)a6 timestamp:(double)a7 syncRevision:(int64_t)a8
{
  id v14 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  if ([v14 length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000B728;
    v18[3] = &unk_100020A58;
    uint64_t v20 = &v26;
    v18[4] = self;
    BOOL v25 = a4;
    id v19 = v14;
    unint64_t v21 = a5;
    double v22 = a6;
    double v23 = a7;
    int64_t v24 = a8;
    [WeakRetained performDatabaseTransactionWithBlock:v18];
  }
  char v16 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v26, 8);

  return v16;
}

- (BOOL)_updateUbiquitousDatabase_setBookmarkMetadataWithValuesFromTrackWithMetadataIdentifier:(id)a3 hasBeenPlayed:(BOOL)a4 playCount:(unint64_t)a5 bookmarkTime:(double)a6 timestamp:(double)a7 syncRevision:(int64_t)a8 usingConnection:(id)a9
{
  BOOL v14 = a4;
  id v15 = a3;
  id v16 = a9;
  if (![v15 length])
  {
LABEL_7:
    BOOL v24 = 0;
    goto LABEL_8;
  }
  v29[0] = v15;
  id v17 = +[NSNumber numberWithUnsignedInteger:a5];
  v29[1] = v17;
  id v18 = +[NSNumber numberWithBool:v14];
  v29[2] = v18;
  id v19 = +[NSNumber numberWithDouble:a6];
  v29[3] = v19;
  uint64_t v20 = +[NSNumber numberWithDouble:a7];
  v29[4] = v20;
  unint64_t v21 = +[NSNumber numberWithLongLong:a8];
  v29[5] = v21;
  double v22 = +[NSArray arrayWithObjects:v29 count:6];
  unsigned __int8 v23 = [v16 executeUpdate:@"INSERT OR REPLACE INTO cloud_kvs (key, play_count_user, has_been_played, bookmark_time_ms, bookmark_sync_timestamp, bookmark_sync_revision) VALUES (?, ?, ?, ?, ?, ?)", v22, 0 withParameters error];

  if ((v23 & 1) == 0)
  {
    BOOL v25 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138412290;
      id v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "failed to update ubiquitous bookmarkmatadata for metadata identifier %@.", (uint8_t *)&v27, 0xCu);
    }

    goto LABEL_7;
  }
  BOOL v24 = 1;
LABEL_8:

  return v24;
}

- (NSDate)dateToSyncWithUbiquitousStore
{
  id v2 = [(SBDML3UbiquitousDatabase *)self _valueForDatabaseProperty:@"MPDateToSyncWithUbiquitousStore"];
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    BOOL v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDate *)v3;
}

- (void)setDateToSyncWithUbiquitousStore:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SBDML3UbiquitousDatabase *)self _setValue:v4 forDatabaseProperty:@"MPDateToSyncWithUbiquitousStore"];
}

- (NSString)lastNotificationDomainVersion
{
  return (NSString *)[(SBDML3UbiquitousDatabase *)self _valueForDatabaseProperty:@"MPUbiquitousBookmarkDomainVersionRemoteToken"];
}

- (void)setLastNotificationDomainVersion:(id)a3
{
}

- (NSDate)dateLastSynced
{
  id v2 = [(SBDML3UbiquitousDatabase *)self _valueForDatabaseProperty:@"MPDateLastSynced"];
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    BOOL v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDate *)v3;
}

- (void)setDateLastSynced:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SBDML3UbiquitousDatabase *)self _setValue:v4 forDatabaseProperty:@"MPDateLastSynced"];
}

- (NSString)lastSyncedDomainVersion
{
  return (NSString *)[(SBDML3UbiquitousDatabase *)self _valueForDatabaseProperty:@"MPUbiquitousBookmarkDomainVersionAnchorToken"];
}

- (void)setLastSyncedDomainVersion:(id)a3
{
}

- (unint64_t)lastSyncedEntityRevision
{
  id v2 = [(SBDML3UbiquitousDatabase *)self _valueForDatabaseProperty:@"MLUbiquitousBookmarkEntityRevisionAnchor"];
  id v3 = [v2 longLongValue];

  return (unint64_t)v3;
}

- (void)setLastSyncedEntityRevision:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(SBDML3UbiquitousDatabase *)self _setValue:v4 forDatabaseProperty:@"MLUbiquitousBookmarkEntityRevisionAnchor"];
}

- (BOOL)_setValue:(id)a3 forDatabaseProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "setting %@ to %@", (uint8_t *)&v12, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
  unsigned __int8 v10 = [WeakRetained setValue:v6 forDatabaseProperty:v7];

  return v10;
}

- (id)_valueForDatabaseProperty:(id)a3
{
  p_musicLibrary = &self->_musicLibrary;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_musicLibrary);
  id v6 = [WeakRetained valueForDatabaseProperty:v4];

  return v6;
}

- (void)updateUbiquitousDatabaseByPerformingWriteTransactionWithBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000BE34;
  v7[3] = &unk_100020A30;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained performDatabaseTransactionWithBlock:v7];
}

- (SBDML3UbiquitousDatabase)init
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDML3UbiquitousDatabase.m" lineNumber:39 description:@"use initWithMusicLibrary:"];

  return self;
}

- (SBDML3UbiquitousDatabase)initWithMusicLibrary:(id)a3
{
  id v4 = a3;
  if ([v4 supportsUPP])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBDML3UbiquitousDatabase;
    char v5 = [(SBDML3UbiquitousDatabase *)&v8 init];
    id v6 = v5;
    if (v5) {
      objc_storeWeak((id *)&v5->_musicLibrary, v4);
    }
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

@end