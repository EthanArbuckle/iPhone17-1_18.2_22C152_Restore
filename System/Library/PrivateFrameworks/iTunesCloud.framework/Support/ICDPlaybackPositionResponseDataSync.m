@interface ICDPlaybackPositionResponseDataSync
- (ICDPlaybackPositionResponseDataSync)initWithResponseDictionary:(id)a3 forDomain:(id)a4;
- (NSArray)conflictedKeys;
- (NSArray)deletedKeys;
- (NSArray)successfullyDeletedKeys;
- (NSArray)successfullyUpdatedKeys;
- (NSArray)updatedKeys;
- (NSString)syncAnchor;
- (id)metadataWithPlaybackPositionKey:(id)a3 failuresOkay:(BOOL)a4;
- (id)payloadDataForUpdateResponseKey:(id)a3;
- (void)_deserializeResponseDictionary:(id)a3;
@end

@implementation ICDPlaybackPositionResponseDataSync

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successfullyDeletedKeys, 0);
  objc_storeStrong((id *)&self->_successfullyUpdatedKeys, 0);
  objc_storeStrong((id *)&self->_deletedKeys, 0);
  objc_storeStrong((id *)&self->_conflictedKeys, 0);
  objc_storeStrong((id *)&self->_updatedKeys, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);

  objc_storeStrong((id *)&self->_responseOpEntiesByKey, 0);
}

- (NSArray)successfullyDeletedKeys
{
  return self->_successfullyDeletedKeys;
}

- (NSArray)successfullyUpdatedKeys
{
  return self->_successfullyUpdatedKeys;
}

- (NSArray)deletedKeys
{
  return self->_deletedKeys;
}

- (NSArray)conflictedKeys
{
  return self->_conflictedKeys;
}

- (NSArray)updatedKeys
{
  return self->_updatedKeys;
}

- (NSString)syncAnchor
{
  return self->_syncAnchor;
}

- (void)_deserializeResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100056C98;
    v19[3] = &unk_1001BAD50;
    id v6 = v4;
    id v20 = v6;
    v7 = objc_retainBlock(v19);
    ((void (*)(void *, NSArray *, const __CFString *, const __CFString *, Block_layout *))v7[2])(v7, self->_deletedKeys, @"peer-ops", @"deletes", &stru_1001BAD90);
    updatedKeys = self->_updatedKeys;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100056F84;
    v18[3] = &unk_1001BADB8;
    v18[4] = self;
    ((void (*)(void *, NSArray *, const __CFString *, const __CFString *, void *))v7[2])(v7, updatedKeys, @"peer-ops", @"puts", v18);
    ((void (*)(void *, NSArray *, const __CFString *, const __CFString *, Block_layout *))v7[2])(v7, self->_conflictedKeys, @"ops", @"rejected", &stru_1001BADD8);
    successfullyUpdatedKeys = self->_successfullyUpdatedKeys;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100056FB8;
    v17[3] = &unk_1001BADB8;
    v17[4] = self;
    ((void (*)(void *, NSArray *, const __CFString *, const __CFString *, void *))v7[2])(v7, successfullyUpdatedKeys, @"ops", @"put-ok", v17);
    successfullyDeletedKeys = self->_successfullyDeletedKeys;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100056FE4;
    v16[3] = &unk_1001BADB8;
    v16[4] = self;
    ((void (*)(void *, NSArray *, const __CFString *, const __CFString *, void *))v7[2])(v7, successfullyDeletedKeys, @"ops", @"deleted-ok", v16);
    v11 = [v6 valueForKey:@"version"];
    syncAnchor = self->_syncAnchor;
    self->_syncAnchor = v11;

    if ((_NSIsNSString() & 1) == 0)
    {
      char v13 = objc_opt_respondsToSelector();
      v14 = self->_syncAnchor;
      if (v13)
      {
        v15 = [(NSString *)v14 stringValue];
        v14 = self->_syncAnchor;
      }
      else
      {
        v15 = 0;
      }
      self->_syncAnchor = v15;
    }
  }
}

- (id)metadataWithPlaybackPositionKey:(id)a3 failuresOkay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(ICDPlaybackPositionResponseDataSync *)self payloadDataForUpdateResponseKey:v6];
  if (v7)
  {
    v8 = [(ICDPlaybackPositionResponseDataBase *)self metadataWithItemIdentifier:v6 keyValueStorePayload:v7 failuresOkay:v4];
  }
  else
  {
    v9 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "metadataWithItemIdentifier - keyValueStorePayload=nil", v11, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)payloadDataForUpdateResponseKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_responseOpEntiesByKey objectForKey:v4];
  id v6 = [v5 objectForKey:@"value"];

  uint64_t v7 = [(ICDPlaybackPositionResponseDataBase *)self dataByInflatingWithNoZipHeader:v6];
  if (v7)
  {
    id v8 = (id)v7;
    v9 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138543618;
      v12 = self;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@ successfully unzipped data for key %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (ICDPlaybackPositionResponseDataSync)initWithResponseDictionary:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ICDPlaybackPositionResponseDataSync;
  uint64_t v7 = [(ICDPlaybackPositionResponseDataBase *)&v21 initWithDomain:a4];
  if (v7)
  {
    uint64_t v8 = +[NSMutableDictionary dictionary];
    responseOpEntiesByKey = v7->_responseOpEntiesByKey;
    v7->_responseOpEntiesByKey = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSMutableArray array];
    updatedKeys = v7->_updatedKeys;
    v7->_updatedKeys = (NSArray *)v10;

    uint64_t v12 = +[NSMutableArray array];
    deletedKeys = v7->_deletedKeys;
    v7->_deletedKeys = (NSArray *)v12;

    uint64_t v14 = +[NSMutableArray array];
    conflictedKeys = v7->_conflictedKeys;
    v7->_conflictedKeys = (NSArray *)v14;

    uint64_t v16 = +[NSMutableArray array];
    successfullyUpdatedKeys = v7->_successfullyUpdatedKeys;
    v7->_successfullyUpdatedKeys = (NSArray *)v16;

    uint64_t v18 = +[NSMutableArray array];
    successfullyDeletedKeys = v7->_successfullyDeletedKeys;
    v7->_successfullyDeletedKeys = (NSArray *)v18;

    [(ICDPlaybackPositionResponseDataSync *)v7 _deserializeResponseDictionary:v6];
  }

  return v7;
}

@end