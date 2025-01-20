@interface REMCKServerChangeToken
+ (NSString)cdEntityName;
+ (id)addServerChangeTokenForAccount:(id)a3 ckServerChangeToken:(id)a4 zoneID:(id)a5 databaseScope:(int64_t)a6 context:(id)a7;
+ (id)fetchRequest;
+ (id)serverChangeTokenForAccount:(id)a3 zoneID:(id)a4 databaseScope:(int64_t)a5 context:(id)a6;
+ (id)serverChangeTokensMatchingPredicate:(id)a3 inContext:(id)a4;
- (CKServerChangeToken)serverChangeToken;
- (id)ic_loggingValues;
- (void)setServerChangeToken:(id)a3;
@end

@implementation REMCKServerChangeToken

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCKServerChangeToken"];
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCKServerChangeToken";
}

- (CKServerChangeToken)serverChangeToken
{
  serverChangeToken = self->_serverChangeToken;
  if (!serverChangeToken)
  {
    v4 = [(REMCKServerChangeToken *)self serverChangeTokenData];
    if (v4)
    {
      v5 = (CKServerChangeToken *)[objc_alloc((Class)CKServerChangeToken) initWithData:v4];
      v6 = self->_serverChangeToken;
      self->_serverChangeToken = v5;
    }
    serverChangeToken = self->_serverChangeToken;
  }

  return serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
  id v8 = a3;
  v5 = [(REMCKServerChangeToken *)self serverChangeToken];
  unsigned __int8 v6 = [v5 isEqual:v8];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serverChangeToken, a3);
    v7 = [v8 data];
    [(REMCKServerChangeToken *)self setServerChangeTokenData:v7];
  }
}

+ (id)addServerChangeTokenForAccount:(id)a3 ckServerChangeToken:(id)a4 zoneID:(id)a5 databaseScope:(int64_t)a6 context:(id)a7
{
  __int16 v8 = a6;
  id v12 = a5;
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  v16 = [a1 entity];
  v17 = [v16 name];

  if (!v17)
  {
    v24 = +[REMLog changeTracking];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_100753570((uint64_t)a1, v24);
    }
  }
  v18 = +[NSEntityDescription insertNewObjectForEntityForName:v17 inManagedObjectContext:v13];
  [v18 setAccount:v15];
  [v15 addCkServerChangeTokensObject:v18];

  [v18 setServerChangeToken:v14];
  v19 = [v12 zoneName];
  [v18 setZoneName:v19];

  v20 = [v12 ownerName];
  unsigned __int8 v21 = [v20 isEqualToString:CKCurrentUserDefaultName];

  if ((v21 & 1) == 0)
  {
    v22 = [v12 ownerName];
    [v18 setOwnerName:v22];
  }
  [v18 setDatabaseScope:v8];

  return v18;
}

+ (id)serverChangeTokenForAccount:(id)a3 zoneID:(id)a4 databaseScope:(int64_t)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11
    && ([v11 ownerName],
        id v13 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v14 = [v13 isEqualToString:CKCurrentUserDefaultName],
        v13,
        (v14 & 1) == 0))
  {
    id v15 = [v11 ownerName];
  }
  else
  {
    id v15 = 0;
  }
  v16 = +[NSPredicate predicateWithFormat:@"account == %@", v10];
  v27[0] = v16;
  [v11 zoneName];
  v17 = v26 = v10;
  v18 = +[NSPredicate predicateWithFormat:@"zoneName == %@", v17];
  v27[1] = v18;
  v19 = +[NSPredicate predicateWithFormat:@"ownerName == %@", v15];
  v27[2] = v19;
  v20 = +[NSPredicate predicateWithFormat:@"databaseScope == %ld", a5];
  v27[3] = v20;
  unsigned __int8 v21 = +[NSArray arrayWithObjects:v27 count:4];

  v22 = +[NSCompoundPredicate andPredicateWithSubpredicates:v21];
  v23 = [a1 serverChangeTokensMatchingPredicate:v22 inContext:v12];
  v24 = [v23 firstObject];

  return v24;
}

+ (id)serverChangeTokensMatchingPredicate:(id)a3 inContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = [a1 fetchRequest];
  [v8 setPredicate:v7];

  id v13 = 0;
  v9 = [v6 executeFetchRequest:v8 error:&v13];

  id v10 = v13;
  if (v10)
  {
    id v11 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1007535E8((uint64_t)v10, v11);
    }
  }

  return v9;
}

- (id)ic_loggingValues
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(REMCKServerChangeToken *)self managedObjectContext];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005E780;
  v8[3] = &unk_1008ADC88;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  [v4 performBlockAndWait:v8];

  id v6 = v5;
  return v6;
}

- (void).cxx_destruct
{
}

@end