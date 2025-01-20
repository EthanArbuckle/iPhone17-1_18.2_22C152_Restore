@interface ABSFavoritesSyncObject
+ (id)shaFile;
+ (int64_t)favoritesCount;
- (ABSFavoritesSyncObject)init;
- (NSArray)favoritesList;
- (NSString)sha;
- (id)createProtobufWithOptions:(id)a3;
- (id)description;
- (id)objectIdentifier;
- (int64_t)changeType;
- (void)setChangeType:(int64_t)a3;
- (void)setSha:(id)a3;
@end

@implementation ABSFavoritesSyncObject

- (ABSFavoritesSyncObject)init
{
  v9.receiver = self;
  v9.super_class = (Class)ABSFavoritesSyncObject;
  v2 = [(ABSFavoritesSyncObject *)&v9 init];
  if (v2)
  {
    v3 = +[ABSFavoritesSyncObject shaFile];
    id v4 = 0;
    do
    {
      v5 = v4;
      id v4 = v3;

      uint64_t v6 = +[NSArray arrayWithContentsOfFile:off_100069978];
      favoritesList = v2->_favoritesList;
      v2->_favoritesList = (NSArray *)v6;

      v3 = +[ABSFavoritesSyncObject shaFile];
    }
    while (![v4 isEqualToString:v3]);
    [(ABSFavoritesSyncObject *)v2 setSha:v4];
  }
  return v2;
}

+ (int64_t)favoritesCount
{
  v2 = +[NSArray arrayWithContentsOfFile:off_100069978];
  id v3 = [v2 count];

  return (int64_t)v3;
}

+ (id)shaFile
{
  v2 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", off_100069978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v2)
  {
    CC_SHA256_Init(&v9);
    id v3 = v2;
    CC_SHA256_Update(&v9, [v3 bytes], (CC_LONG)[v3 length]);
    CC_SHA256_Final(md, &v9);
    id v4 = [objc_alloc((Class)NSData) initWithBytesNoCopy:md length:32 freeWhenDone:0];
    v5 = [v4 base64EncodedDataWithOptions:0];
    uint64_t v6 = (__CFString *)[objc_alloc((Class)NSString) initWithData:v5 encoding:4];
  }
  else
  {
    v7 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)md = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Favorites file is empty.", md, 2u);
    }
    uint64_t v6 = @"0";
  }

  return v6;
}

- (id)objectIdentifier
{
  return @"None";
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (id)createProtobufWithOptions:(id)a3
{
  id v38 = a3;
  id v4 = [[ABSPBSyncObject alloc] initWithMemo:@"Favorites"];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = objc_alloc_init(ABSPBFavoritesSyncObject);
  [(ABSPBSyncObject *)v4 setFavoritesSyncObject:v6];

  p_favoritesList = &self->_favoritesList;
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self->_favoritesList, "count")];
  v37 = v4;
  CC_SHA256_CTX v9 = [(ABSPBSyncObject *)v4 favoritesSyncObject];
  [v9 setEntrys:v8];

  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_1000294C0;
  v50 = sub_1000294D0;
  id v51 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obj = *p_favoritesList;
  id v10 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v43;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v12);
        v14 = +[ABSContactsInterface sharedInstance];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_1000294D8;
        v39[3] = &unk_100055730;
        v39[4] = v13;
        v41 = &v46;
        v15 = v5;
        v40 = v15;
        [v14 accessAsync:v39];

        v16 = objc_alloc_init(ABSPBFavoritesEntry);
        v17 = [v13 objectForKeyedSubscript:@"ABIdentifier"];
        -[ABSPBFavoritesEntry setAbIdentifier:](v16, "setAbIdentifier:", [v17 integerValue]);

        v18 = [v38 objectForKeyedSubscript:off_100069A00];
        unsigned int v19 = [v18 hasPrefix:@"13V"];

        if (v19)
        {
          v20 = [v13 objectForKeyedSubscript:@"EntryType"];
          id v21 = [v20 intValue];

          if (v21 == -1)
          {
            dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
            goto LABEL_14;
          }
          [(ABSPBFavoritesEntry *)v16 setEntryType:v21];
        }
        else
        {
          v22 = [v13 objectForKeyedSubscript:@"EntryType"];
          -[ABSPBFavoritesEntry setEntryType:](v16, "setEntryType:", [v22 integerValue]);
        }
        v23 = [v13 objectForKeyedSubscript:@"Property"];
        -[ABSPBFavoritesEntry setProperty:](v16, "setProperty:", [v23 integerValue]);

        v24 = [v13 objectForKeyedSubscript:@"Value"];
        [(ABSPBFavoritesEntry *)v16 setValue:v24];

        v25 = [v13 objectForKeyedSubscript:@"Name"];
        [(ABSPBFavoritesEntry *)v16 setName:v25];

        v26 = [v13 objectForKeyedSubscript:@"Label"];
        [(ABSPBFavoritesEntry *)v16 setLabel:v26];

        v27 = [v13 objectForKeyedSubscript:@"ActionType"];
        [(ABSPBFavoritesEntry *)v16 setActionType:v27];

        v28 = [v13 objectForKeyedSubscript:@"BundleIdentifier"];
        [(ABSPBFavoritesEntry *)v16 setBundleIdentifier:v28];

        dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
        if (v47[5])
        {
          -[ABSPBFavoritesEntry setGuid:](v16, "setGuid:");
        }
        else
        {
          v29 = +[NSUUID UUID];
          v30 = [v29 UUIDString];
          [(ABSPBFavoritesEntry *)v16 setGuid:v30];
        }
        v31 = [(ABSPBSyncObject *)v37 favoritesSyncObject];
        v32 = [v31 entrys];
        [v32 addObject:v16];

LABEL_14:
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v33 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v52 count:16];
      id v10 = v33;
    }
    while (v33);
  }

  v34 = [(ABSPBSyncObject *)v37 data];
  _Block_object_dispose(&v46, 8);

  return v34;
}

- (id)description
{
  id v3 = +[NSMutableString stringWithString:@"<FavoritesSyncObject ["];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_favoritesList;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        CC_SHA256_CTX v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) objectForKeyedSubscript:@"ABUid"];
        [v3 appendFormat:@"%@, ", v9];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"-]>"];

  return v3;
}

- (NSArray)favoritesList
{
  return self->_favoritesList;
}

- (NSString)sha
{
  return self->_sha;
}

- (void)setSha:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sha, 0);

  objc_storeStrong((id *)&self->_favoritesList, 0);
}

@end