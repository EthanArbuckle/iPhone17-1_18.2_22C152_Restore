@interface SagaSetAlbumItemPropertyOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaSetAlbumItemPropertyOperation)initWithCoder:(id)a3;
- (SagaSetAlbumItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 albumPersistentID:(int64_t)a5 albumItemProperties:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaSetAlbumItemPropertyOperation

- (void).cxx_destruct
{
}

- (void)main
{
  uint64_t v4 = [(NSDictionary *)self->_albumItemProperties objectForKeyedSubscript:ML3AlbumPropertyLikedState];
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v48 = ML3TrackPropertyAlbumLikedState;
    *(void *)buf = v4;
    v6 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v48 count:1];
  }
  else
  {
    v6 = 0;
  }

  if ([v6 count])
  {
    v7 = +[NSString stringWithFormat:@"SagaSetAlbumItemPropertyOperation - (album_persistent_id = %lld)", self->_albumPersistentID];
    id v8 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v7];
    [v8 beginTransaction];
    v9 = [(CloudLibraryOperation *)self musicLibrary];
    v10 = [(CloudLibraryOperation *)self clientIdentity];
    [v9 setClientIdentity:v10];

    int64_t albumPersistentID = self->_albumPersistentID;
    v12 = [(CloudLibraryOperation *)self musicLibrary];
    id v13 = +[ML3Album newWithPersistentID:albumPersistentID inLibrary:v12];

    if ([v13 existsInLibrary])
    {
      v39 = v7;
      v14 = [(CloudLibraryOperation *)self musicLibrary];
      v15 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyAlbumPersistentID equalToInt64:self->_albumPersistentID];
      v16 = +[ML3Track queryWithLibrary:v14 predicate:v15];

      if ([v16 countOfEntities])
      {
        v38 = v3;
        v17 = +[NSMutableArray array];
        v18 = +[NSMutableArray array];
        uint64_t v47 = ML3TrackPropertyStoreSagaID;
        v19 = +[NSArray arrayWithObjects:&v47 count:1];
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100127860;
        v42[3] = &unk_1001BEE98;
        id v20 = v17;
        id v43 = v20;
        id v21 = v18;
        id v44 = v21;
        id v45 = v6;
        [v16 enumeratePersistentIDsAndProperties:v19 usingBlock:v42];

        id v22 = [v20 count];
        v23 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            id v25 = [v20 count];
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v25;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Sending edit request for %lu items", buf, 0xCu);
          }

          v26 = [(CloudLibraryOperation *)self connection];
          v27 = +[ICBulkSetItemPropertyRequest requestWithDatabaseID:itemIDs:properties:useLongIDs:](ICBulkSetItemPropertyRequest, "requestWithDatabaseID:itemIDs:properties:useLongIDs:", [v26 databaseID], v20, v21, 0);
          [v27 setVerificationInteractionLevel:2];
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_1001278C8;
          v40[3] = &unk_1001BEEC0;
          v40[4] = self;
          dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
          id v28 = v21;
          v29 = v41;
          [v26 sendRequest:v27 withResponseHandler:v40];
          dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);

          id v21 = v28;
        }
        else
        {
          if (v24)
          {
            int64_t v35 = self->_albumPersistentID;
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v35;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Album with pid = %lld has zero tracks with cloud_ids in the database, skipping updates to cloud library.", buf, 0xCu);
          }

          [(CloudLibraryOperation *)self setStatus:1];
        }

        v3 = v38;
      }
      else
      {
        v33 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v34 = self->_albumPersistentID;
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Album with pid = %lld has zero tracks in the database, skipping updates to cloud library.", buf, 0xCu);
        }

        [(CloudLibraryOperation *)self setStatus:1];
      }
      v7 = v39;
    }
    else
    {
      v31 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v32 = self->_albumPersistentID;
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Album with pid = %lld is not in the database, skipping updates to cloud library.", buf, 0xCu);
      }

      [(CloudLibraryOperation *)self setStatus:1];
    }
    v36 = [(CloudLibraryOperation *)self musicLibrary];
    v37 = MSVTCCIdentityForCurrentProcess();
    [v36 setClientIdentity:v37];

    [v8 endTransaction];
  }
  else
  {
    v30 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No valid album item properties to set, skipping updates to cloud library.", buf, 2u);
    }

    [(CloudLibraryOperation *)self setStatus:1];
  }
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaSetAlbumItemPropertyOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_albumPersistentID, @"SagaSetAlbumItemPropertyOperationAlbumPersistentIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_albumItemProperties forKey:@"SagaSetAlbumItemPropertyOperationAlbumItemPropertiesKey"];
}

- (SagaSetAlbumItemPropertyOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SagaSetAlbumItemPropertyOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_int64_t albumPersistentID = (int64_t)[v4 decodeInt64ForKey:@"SagaSetAlbumItemPropertyOperationAlbumPersistentIDKey"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SagaSetAlbumItemPropertyOperationAlbumItemPropertiesKey"];
    albumItemProperties = v5->_albumItemProperties;
    v5->_albumItemProperties = (NSDictionary *)v10;
  }
  return v5;
}

- (SagaSetAlbumItemPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 albumPersistentID:(int64_t)a5 albumItemProperties:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SagaSetAlbumItemPropertyOperation;
  v11 = [(CloudLibraryOperation *)&v16 initWithConfiguration:a3 clientIdentity:a4];
  v12 = v11;
  if (v11)
  {
    v11->_int64_t albumPersistentID = a5;
    objc_super v13 = (NSDictionary *)[v10 copy];
    albumItemProperties = v12->_albumItemProperties;
    v12->_albumItemProperties = v13;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end