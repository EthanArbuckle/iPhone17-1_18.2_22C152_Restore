@interface MediaSocialPostEntity
+ (id)databaseTable;
+ (id)newEntityValuesWithMediaSocialPost:(id)a3;
- (BOOL)deleteFromDatabase;
- (BOOL)hasActiivtyID;
- (BOOL)isOverPollDuration;
- (BOOL)isReadyToSend;
- (MediaSocialStatusPollRequest)statusPollRequest;
- (NSArray)contentItems;
- (NSArray)externalServiceDestinations;
- (NSArray)uploadedAttachments;
- (id)_insertUploadWithAttachment:(id)a3 properties:(id)a4 database:(id)a5;
- (id)allUploadPersistentIdentifiers;
- (id)insertEntitiesForAttachments:(id)a3 withProperties:(id)a4;
- (id)insertEntitiesForContentItems:(id)a3;
- (id)insertEntitiesForExternalDestinations:(id)a3;
- (void)updateWithPollingResponse:(id)a3;
@end

@implementation MediaSocialPostEntity

+ (id)newEntityValuesWithMediaSocialPost:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 accountIdentifier];
  if (v5) {
    [v4 setObject:v5 forKey:@"account_id"];
  }
  v6 = [v3 authorIdentifier];

  if (v6) {
    [v4 setObject:v6 forKey:@"author_id"];
  }
  v7 = [v3 authorType];

  if (v7) {
    [v4 setObject:v7 forKey:@"author_type"];
  }
  v8 = [v3 text];

  if (v8) {
    [v4 setObject:v8 forKey:@"message"];
  }
  if ([v3 isAttributed]) {
    [v4 setObject:&__kCFBooleanTrue forKey:@"is_attributed"];
  }

  return v4;
}

- (id)allUploadPersistentIdentifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"post_id" equalToLongLong:[(MediaSocialPostEntity *)self persistentID]];
  v5 = [(MediaSocialPostEntity *)self database];
  v6 = +[DirectUploadEntity queryWithDatabase:v5 predicate:v4];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005FD50;
  v9[3] = &unk_1003A3A80;
  id v7 = v3;
  id v10 = v7;
  [v6 enumeratePersistentIDsUsingBlock:v9];

  return v7;
}

- (NSArray)contentItems
{
  id v3 = +[NSMutableArray array];
  v13[0] = @"item_id";
  v13[1] = @"type";
  id v4 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"post_id" equalToLongLong:[(MediaSocialPostEntity *)self persistentID]];
  v5 = [(MediaSocialPostEntity *)self database];
  v6 = +[MediaSocialContentItemEntity queryWithDatabase:v5 predicate:v4];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005FF64;
  v11[3] = &unk_1003A3988;
  id v7 = v3;
  id v12 = v7;
  [v6 enumeratePersistentIDsAndProperties:v13 count:2 usingBlock:v11];
  id v8 = v7;

  for (uint64_t i = 1; i != -1; --i)

  return (NSArray *)v8;
}

- (NSArray)externalServiceDestinations
{
  id v3 = +[NSMutableArray array];
  v13[0] = @"access_token";
  v13[1] = @"page_access_token";
  void v13[2] = @"page_id";
  v13[3] = @"service_type";
  id v4 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"post_id" equalToLongLong:[(MediaSocialPostEntity *)self persistentID]];
  v5 = [(MediaSocialPostEntity *)self database];
  v6 = +[MediaSocialExternalTargetEntity queryWithDatabase:v5 predicate:v4];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000601AC;
  v11[3] = &unk_1003A3988;
  id v7 = v3;
  id v12 = v7;
  [v6 enumeratePersistentIDsAndProperties:v13 count:4 usingBlock:v11];
  id v8 = v7;

  for (uint64_t i = 3; i != -1; --i)

  return (NSArray *)v8;
}

- (id)insertEntitiesForAttachments:(id)a3 withProperties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  id v9 = [v6 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v10 = [objc_alloc((Class)NSNumber) initWithDouble:CFAbsoluteTimeGetCurrent()];
  [v9 setObject:v10 forKey:@"creation_time"];
  id v11 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", -[MediaSocialPostEntity persistentID](self, "persistentID"));
  [v9 setObject:v11 forKey:@"post_id"];
  [(MediaSocialPostEntity *)self database];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100060414;
  v18[3] = &unk_1003A49E0;
  v18[4] = self;
  id v19 = v9;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v8;
  id v21 = v12;
  id v13 = v20;
  id v14 = v9;
  [v7 enumerateObjectsUsingBlock:v18];

  v15 = v21;
  id v16 = v12;

  return v16;
}

- (id)insertEntitiesForContentItems:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  id v6 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", -[MediaSocialPostEntity persistentID](self, "persistentID"));
  [(MediaSocialPostEntity *)self database];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  void v13[2] = sub_100060744;
  v13[3] = &unk_1003A4A08;
  id v14 = v6;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v5;
  id v16 = v7;
  id v8 = v15;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v13];

  id v10 = v16;
  id v11 = v7;

  return v11;
}

- (id)insertEntitiesForExternalDestinations:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  id v6 = [(MediaSocialPostEntity *)self database];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  void v13[2] = sub_10006090C;
  v13[3] = &unk_1003A4A30;
  id v14 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", -[MediaSocialPostEntity persistentID](self, "persistentID"));
  id v15 = v6;
  id v7 = v5;
  id v16 = v7;
  id v8 = v6;
  id v9 = v14;
  [v4 enumerateObjectsUsingBlock:v13];

  id v10 = v16;
  id v11 = v7;

  return v11;
}

- (BOOL)isReadyToSend
{
  id v3 = [(MediaSocialPostEntity *)self valueForProperty:@"is_failed"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if (v4)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"state" value:&off_1003C9078 comparisonType:2];
    id v7 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"post_id" equalToLongLong:[(MediaSocialPostEntity *)self persistentID]];
    v13[0] = v7;
    v13[1] = v6;
    id v8 = +[NSArray arrayWithObjects:v13 count:2];
    id v9 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

    id v10 = [(MediaSocialPostEntity *)self database];
    id v11 = +[DirectUploadEntity anyInDatabase:v10 predicate:v9];

    if (v11) {
      LOBYTE(v5) = 0;
    }
    else {
      unsigned int v5 = ![(MediaSocialPostEntity *)self hasActiivtyID];
    }
  }
  return v5;
}

- (BOOL)hasActiivtyID
{
  id v4 = 0;
  unsigned int v5 = @"activity_id";
  [(MediaSocialPostEntity *)self getValues:&v4 forProperties:&v5 count:1];
  if (v4) {
    BOOL v2 = [v4 length] != 0;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

- (BOOL)isOverPollDuration
{
  v11[0] = @"poll_duration";
  v11[1] = @"creation_time";
  id v9 = 0;
  id v10 = 0;
  [(MediaSocialPostEntity *)self getValues:&v9 forProperties:v11 count:2];
  [v9 doubleValue];
  double v3 = v2;
  [v10 doubleValue];
  double v5 = v4;
  double Current = CFAbsoluteTimeGetCurrent();
  for (uint64_t i = 1; i != -1; --i)

  return v3 + v5 < Current;
}

- (MediaSocialStatusPollRequest)statusPollRequest
{
  double v3 = objc_alloc_init(MediaSocialStatusPollRequest);
  v9[0] = @"account_id";
  v9[1] = @"activity_id";
  v9[2] = @"poll_interval";
  v9[3] = @"source_app";
  void v9[4] = @"poll_duration";
  v9[5] = @"creation_time";
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  [(MediaSocialPostEntity *)self getValues:&v6 forProperties:v9 count:6];
  [(MediaSocialStatusPollRequest *)v3 setAccountIdentifier:(void)v6];
  [(MediaSocialStatusPollRequest *)v3 setActivityIdentifier:*((void *)&v6 + 1)];
  [(id)v7 doubleValue];
  -[MediaSocialStatusPollRequest setPollingInterval:](v3, "setPollingInterval:");
  [(MediaSocialStatusPollRequest *)v3 setPostIdentifier:[(MediaSocialPostEntity *)self persistentID]];
  [(MediaSocialStatusPollRequest *)v3 setSourceApplicationIdentifier:*((void *)&v7 + 1)];
  [(id)v8 doubleValue];
  -[MediaSocialStatusPollRequest setPollingDuration:](v3, "setPollingDuration:");
  [*((id *)&v8 + 1) doubleValue];
  -[MediaSocialStatusPollRequest setPostCreateTime:](v3, "setPostCreateTime:");
  for (uint64_t i = 5; i != -1; --i)

  return v3;
}

- (void)updateWithPollingResponse:(id)a3
{
  id v12 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  double v5 = [(MediaSocialPostEntity *)self valueForProperty:@"poll_count"];
  long long v6 = (char *)[v5 integerValue];

  id v7 = [objc_alloc((Class)NSNumber) initWithInteger:v6 + 1];
  [v4 setObject:v7 forKey:@"poll_count"];
  [v12 pollingInterval];
  if (v8 <= 2.22044605e-16)
  {
    [v12 pollDuration];
  }
  else
  {
    id v9 = [objc_alloc((Class)NSNumber) initWithDouble:v8];
    [v4 setObject:v9 forKey:@"poll_interval"];

    [v12 pollDuration];
    id v11 = [objc_alloc((Class)NSNumber) initWithDouble:v10];
    [v4 setObject:v11 forKey:@"poll_duration"];
  }
  [(MediaSocialPostEntity *)self setValuesWithDictionary:v4];
}

- (NSArray)uploadedAttachments
{
  double v3 = +[NSMutableArray array];
  id v4 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"post_id" equalToLongLong:[(MediaSocialPostEntity *)self persistentID]];
  double v5 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"state" equalToLongLong:2];
  v25[0] = v4;
  v25[1] = v5;
  long long v6 = +[NSArray arrayWithObjects:v25 count:2];
  id v7 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v6];

  id v8 = objc_alloc_init((Class)SSSQLiteQueryDescriptor);
  [v8 setEntityClass:objc_opt_class()];
  id v9 = +[DirectUploadEntity databaseTable];
  double v10 = +[NSString stringWithFormat:@"(%@.%@ != 0) ASC", v9, @"parent_upload_id"];
  [v8 setOrderingClause:v10];

  [v8 setPredicate:v7];
  v24[0] = @"album_id";
  v24[1] = @"asset_token";
  v24[2] = @"asset_token_type";
  v24[3] = @"category_name";
  v24[4] = @"description";
  v24[5] = @"is_explicit";
  v24[6] = @"parent_upload_id";
  v24[7] = @"parent_relationship_type";
  v24[8] = @"preview_frame_time";
  v24[9] = @"title";
  v24[10] = @"upload_time";
  v24[11] = @"uti";
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = [(MediaSocialPostEntity *)self database];
  id v13 = [objc_alloc((Class)SSSQLiteQuery) initWithDatabase:v12 descriptor:v8];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000612F4;
  v20[3] = &unk_1003A4A88;
  id v21 = v12;
  id v22 = v11;
  id v14 = v3;
  id v23 = v14;
  id v15 = v11;
  id v16 = v12;
  [v13 enumeratePersistentIDsAndProperties:v24 count:12 usingBlock:v20];
  id v17 = v14;

  for (uint64_t i = 11; i != -1; --i)

  return (NSArray *)v17;
}

+ (id)databaseTable
{
  return @"post";
}

- (BOOL)deleteFromDatabase
{
  double v2 = self;
  double v3 = [(MediaSocialPostEntity *)self database];
  id v4 = [(MediaSocialPostEntity *)v2 persistentID];
  double v5 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"post_id" equalToLongLong:v4];
  long long v6 = +[MediaSocialExternalTargetEntity queryWithDatabase:v3 predicate:v5];
  [v6 deleteAllEntities];
  id v7 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"post_id" equalToLongLong:v4];

  id v8 = +[DirectUploadEntity queryWithDatabase:v3 predicate:v7];

  [v8 deleteAllEntities];
  v10.receiver = v2;
  v10.super_class = (Class)MediaSocialPostEntity;
  LOBYTE(v2) = [(MediaSocialPostEntity *)&v10 deleteFromDatabase];

  return (char)v2;
}

- (id)_insertUploadWithAttachment:(id)a3 properties:(id)a4 database:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[DirectUploadEntity newEntityValuesWithMediaSocialAttachment:v7];
  [v10 addEntriesFromDictionary:v9];

  id v11 = [[DirectUploadEntity alloc] initWithPropertyValues:v10 inDatabase:v8];
  if (v11)
  {
    id v12 = [v7 artists];
    if ([v12 count]) {
      id v13 = [(DirectUploadEntity *)v11 insertEntitiesForArtists:v12 withProperties:0];
    }
  }

  return v11;
}

@end