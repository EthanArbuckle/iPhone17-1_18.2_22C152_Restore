@interface DirectUploadEntity
+ (id)databaseTable;
+ (id)newEntityValuesWithMediaSocialAttachment:(id)a3;
- (BOOL)deleteFromDatabase;
- (MediaSocialPostEntity)postEntity;
- (NSArray)artists;
- (id)insertEntitiesForArtists:(id)a3 withProperties:(id)a4;
- (int64_t)setFailedWithError:(id)a3;
- (void)deleteAssetFile;
- (void)resetStatusProperties;
- (void)setProcessingWithResponse:(id)a3;
@end

@implementation DirectUploadEntity

+ (id)newEntityValuesWithMediaSocialAttachment:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 albumIdentifier];
  if (v5) {
    [v4 setObject:v5 forKey:@"album_id"];
  }
  v6 = [v3 assetURL];

  if (v6) {
    [v4 setObject:v6 forKey:@"asset_url"];
  }
  v7 = [v3 attachmentDescription];

  if (v7) {
    [v4 setObject:v7 forKey:@"description"];
  }
  v8 = [v3 categoryName];

  if (v8) {
    [v4 setObject:v8 forKey:@"category_name"];
  }
  v9 = [v3 subtitle];

  if (v9) {
    [v4 setObject:v9 forKey:@"subtitle"];
  }
  v10 = [v3 title];

  if (v10) {
    [v4 setObject:v10 forKey:@"title"];
  }
  v11 = [v3 UTI];

  if (v11) {
    [v4 setObject:v11 forKey:@"uti"];
  }
  v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 deletesAssetWhenFinished]);
  [v4 setObject:v12 forKey:@"owns_asset"];

  v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isExplicitContent]);
  [v4 setObject:v13 forKey:@"is_explicit"];

  [v3 previewFrameTimestamp];
  v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v14 forKey:@"preview_frame_time"];

  [v4 setObject:SSVDirectUploadKindFuse forKey:@"kind"];
  return v4;
}

- (NSArray)artists
{
  id v3 = +[NSMutableArray array];
  v15[0] = @"artist_id";
  v15[1] = @"name";
  id v4 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"upload_id" equalToLongLong:[(DirectUploadEntity *)self persistentID]];
  v5 = [(DirectUploadEntity *)self database];
  CFStringRef v14 = @"order_index";
  v6 = +[NSArray arrayWithObjects:&v14 count:1];
  v7 = +[DirectUploadArtistEntity queryWithDatabase:v5 predicate:v4 orderingProperties:v6];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001009CC;
  v12[3] = &unk_1003A3988;
  id v8 = v3;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v15 count:2 usingBlock:v12];
  id v9 = v8;

  for (uint64_t i = 1; i != -1; --i)

  return (NSArray *)v9;
}

- (void)deleteAssetFile
{
  v26[0] = @"asset_url";
  v26[1] = @"owns_asset";
  uint64_t v24 = 0;
  id v25 = 0;
  [(DirectUploadEntity *)self getValues:&v24 forProperties:v26 count:2];
  if ([v25 BOOLValue]) {
    BOOL v2 = v24 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    id v3 = objc_alloc((Class)NSURL);
    id v4 = [v3 initWithString:v24];
    if (![v4 isFileURL])
    {
LABEL_20:

      goto LABEL_21;
    }
    id v5 = objc_alloc_init((Class)NSFileManager);
    id v17 = 0;
    unsigned __int8 v6 = [v5 removeItemAtURL:v4 error:&v17];
    id v7 = v17;
    if (v6)
    {
LABEL_19:

      goto LABEL_20;
    }
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      v12 = objc_opt_class();
      int v18 = 138412802;
      v19 = v12;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v4;
      id v13 = v12;
      LODWORD(v16) = 32;
      CFStringRef v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_18:

        goto LABEL_19;
      }
      v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v18, v16);
      free(v14);
      SSFileLog();
    }

    goto LABEL_18;
  }
LABEL_21:
  for (uint64_t i = 1; i != -1; --i)
}

- (id)insertEntitiesForArtists:(id)a3 withProperties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  id v9 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", -[DirectUploadEntity persistentID](self, "persistentID"));
  [(DirectUploadEntity *)self database];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100100DF8;
  v17[3] = &unk_1003A6798;
  id v18 = v9;
  id v19 = v6;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v8;
  id v21 = v10;
  id v11 = v20;
  id v12 = v6;
  id v13 = v9;
  [v7 enumerateObjectsUsingBlock:v17];

  CFStringRef v14 = v21;
  id v15 = v10;

  return v15;
}

- (MediaSocialPostEntity)postEntity
{
  id v3 = [(DirectUploadEntity *)self valueForProperty:@"post_id"];
  id v4 = [v3 longLongValue];

  if (v4)
  {
    id v5 = [MediaSocialPostEntity alloc];
    id v6 = [(DirectUploadEntity *)self database];
    id v7 = [(MediaSocialPostEntity *)v5 initWithPersistentID:v4 inDatabase:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)resetStatusProperties
{
  id v4 = +[NSNull null];
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:v4 forKey:@"error_code"];
  [v3 setObject:v4 forKey:@"error_domain"];
  [v3 setObject:v4 forKey:@"error_message"];
  [v3 setObject:&off_1003C92A0 forKey:@"state"];
  [(DirectUploadEntity *)self setValuesWithDictionary:v3];
}

- (int64_t)setFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v5 setObject:&off_1003C92B8 forKey:@"state"];
  id v6 = [(DirectUploadEntity *)self valueForProperty:@"failure_count"];
  id v7 = (char *)[v6 integerValue] + 1;

  id v8 = +[NSNumber numberWithInteger:v7];
  [v5 setObject:v8 forKey:@"failure_count"];

  if (v4)
  {
    id v9 = [v4 domain];
    if (v9) {
      [v5 setObject:v9 forKey:@"error_domain"];
    }
    id v10 = [v4 localizedDescription];

    if (v10) {
      [v5 setObject:v10 forKey:@"error_message"];
    }
    id v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
    [v5 setObject:v11 forKey:@"error_code"];
  }
  else
  {
    [v5 setObject:&off_1003C92D0 forKey:@"error_code"];
    [v5 setObject:SSErrorDomain forKey:@"error_domain"];
  }
  [(DirectUploadEntity *)self setValuesWithDictionary:v5];

  return (int64_t)v7;
}

- (void)setProcessingWithResponse:(id)a3
{
  id v10 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:&off_1003C92E8 forKey:@"state"];
  id v5 = [v10 assetToken];
  if (v5) {
    [v4 setObject:v5 forKey:@"asset_token"];
  }
  id v6 = [v10 assetTokenType];
  if (v6) {
    [v4 setObject:v6 forKey:@"asset_token_type"];
  }
  id v7 = objc_alloc((Class)NSNumber);
  id v8 = +[NSDate date];
  [v8 timeIntervalSince1970];
  id v9 = objc_msgSend(v7, "initWithDouble:");

  [v4 setObject:v9 forKey:@"upload_time"];
  [(DirectUploadEntity *)self setValuesWithDictionary:v4];
}

+ (id)databaseTable
{
  return @"upload";
}

- (BOOL)deleteFromDatabase
{
  BOOL v2 = self;
  id v3 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"upload_id" equalToLongLong:[(DirectUploadEntity *)self persistentID]];
  id v4 = [(DirectUploadEntity *)v2 database];
  id v5 = +[DirectUploadArtistEntity queryWithDatabase:v4 predicate:v3];

  [v5 deleteAllEntities];
  [(DirectUploadEntity *)v2 deleteAssetFile];
  v7.receiver = v2;
  v7.super_class = (Class)DirectUploadEntity;
  LOBYTE(v2) = [(DirectUploadEntity *)&v7 deleteFromDatabase];

  return (char)v2;
}

@end