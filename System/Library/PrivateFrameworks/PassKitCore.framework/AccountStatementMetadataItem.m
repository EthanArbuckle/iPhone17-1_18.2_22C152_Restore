@interface AccountStatementMetadataItem
+ (BOOL)allItemsAreProcessedForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_commonDictionaryForStatementMetadataItem:(id)a3;
+ (id)_metadataItemsWithQuery:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForStatementMetadataPID:(int64_t)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_propertySettersForAccountStatementMetadataItem;
+ (id)_queryforItems:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)accountStatementMetadataItemsForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)anyInDatabase:(id)a3 forStatementMetadataPID:(int64_t)a4 identifier:(id)a5 type:(unint64_t)a6;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountStatementMetadataItems:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAccountStatementMetadataItemsForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)markItems:(id)a3 asProcessed:(BOOL)a4 error:(unint64_t)a5 forStatementMetadataPID:(int64_t)a6 inDatabase:(id)a7;
+ (void)updateReportDate:(id)a3 forItems:(id)a4 forStatementMetadataPID:(int64_t)a5 inDatabase:(id)a6;
- (AccountStatementMetadataItem)initWithStatementMetadataItem:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)accountIdentifier;
- (id)identifier;
- (int64_t)reportCount;
- (unint64_t)accountType;
- (unint64_t)type;
- (void)markMetadataItemAsProcessed:(BOOL)a3 error:(unint64_t)a4;
- (void)updateReportDate:(id)a3;
- (void)updateWithStatementMetadataItem:(id)a3;
@end

@implementation AccountStatementMetadataItem

+ (id)databaseTable
{
  return @"account_statement_metadata_item";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"account_statement_metadata.account_identifier"
    || v7
    && (unsigned int v8 = [@"account_statement_metadata.account_identifier" isEqualToString:v7],
        v9,
        v8))
  {
    [v6 addObject:@"JOIN account_statement_metadata ON account_statement_metadata.pid = account_statement_metadata_item.account_statement_metadata_pid"];
  }
}

- (AccountStatementMetadataItem)initWithStatementMetadataItem:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForStatementMetadataItem:v9];

  [v10 setUnsignedLongLong:a4 forKey:@"account_statement_metadata_pid"];
  v11 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v11;
}

+ (id)insertOrUpdateAccountStatementMetadataItems:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v29 = objc_alloc_init((Class)NSMutableSet);
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v16 = [v15 identifier];
        objc_msgSend(a1, "anyInDatabase:forStatementMetadataPID:identifier:type:", v9, a4, v16, objc_msgSend(v15, "type"));
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17) {
          [v17 updateWithStatementMetadataItem:v15];
        }
        else {
          id v17 = [objc_alloc((Class)objc_opt_class()) initWithStatementMetadataItem:v15 forStatementMetadataPID:a4 inDatabase:v9];
        }
        v18 = [v17 identifier];
        objc_msgSend(v29, "pk_safelyAddObject:", v18);

        [v10 safelyAddObject:v17];
      }
      id v12 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }

  v19 = [v29 allObjects];
  v20 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"identifier" values:v19];

  v35[0] = v20;
  v21 = [a1 _predicateForStatementMetadataPID:a4];
  v35[1] = v21;
  v22 = +[NSArray arrayWithObjects:v35 count:2];
  v23 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v22];

  v24 = [a1 queryWithDatabase:v9 predicate:v23];
  if (([v24 deleteAllEntities] & 1) == 0)
  {
    v25 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to delete obsolete statement account metadata items", buf, 2u);
    }
  }
  id v26 = [v10 copy];

  return v26;
}

+ (void)deleteAccountStatementMetadataItemsForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForStatementMetadataPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)AccountStatementMetadataItem;
  return [(SQLiteEntity *)&v3 deleteFromDatabase];
}

+ (id)anyInDatabase:(id)a3 forStatementMetadataPID:(int64_t)a4 identifier:(id)a5 type:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [a1 _predicateForStatementMetadataPID:a4];
  uint64_t v13 = objc_msgSend(a1, "_predicateForIdentifier:", v10, v12);

  v19[1] = v13;
  v14 = [a1 _predicateForType:a6];
  v19[2] = v14;
  v15 = +[NSArray arrayWithObjects:v19 count:3];
  v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

  id v17 = [a1 anyInDatabase:v11 predicate:v16];

  return v17;
}

+ (id)accountStatementMetadataItemsForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForStatementMetadataPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _metadataItemsWithQuery:v8];

  return v9;
}

+ (id)_metadataItemsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForAccountStatementMetadataItem];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = [v5 allKeys];
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_1002ADD34;
  v16 = &unk_10072DE00;
  id v17 = v4;
  id v18 = v5;
  id v19 = v6;
  id v20 = a1;
  id v8 = v6;
  id v9 = v5;
  id v10 = v4;
  [v10 enumeratePersistentIDsAndProperties:v7 usingBlock:&v13];

  id v11 = objc_msgSend(v8, "copy", v13, v14, v15, v16);
  return v11;
}

+ (BOOL)allItemsAreProcessedForStatementMetadataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForStatementMetadataPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  CFStringRef v16 = @"has_been_processed";
  id v9 = +[NSArray arrayWithObjects:&v16 count:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002AE09C;
  v11[3] = &unk_100731280;
  v11[4] = &v12;
  [v8 enumerateProperties:v9 usingBlock:v11];

  LOBYTE(v9) = *((unsigned char *)v13 + 24) == 0;
  _Block_object_dispose(&v12, 8);

  return (char)v9;
}

- (void)updateWithStatementMetadataItem:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForStatementMetadataItem:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

- (void)markMetadataItemAsProcessed:(BOOL)a3 error:(unint64_t)a4
{
  v7 = [(SQLiteEntity *)self database];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002AE1E8;
  v8[3] = &unk_100745560;
  BOOL v9 = a3;
  v8[4] = self;
  v8[5] = a4;
  sub_10000817C((uint64_t)v7, v8);
}

- (void)updateReportDate:(id)a3
{
  id v4 = a3;
  id v5 = [(SQLiteEntity *)self database];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002AE3E0;
  v7[3] = &unk_100738A00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_10000817C((uint64_t)v5, v7);
}

+ (void)markItems:(id)a3 asProcessed:(BOOL)a4 error:(unint64_t)a5 forStatementMetadataPID:(int64_t)a6 inDatabase:(id)a7
{
  id v12 = a7;
  uint64_t v13 = [a1 _queryforItems:a3 forStatementMetadataPID:a6 inDatabase:v12];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002AE550;
  v15[3] = &unk_100745588;
  id v16 = v12;
  id v17 = a1;
  BOOL v19 = a4;
  unint64_t v18 = a5;
  id v14 = v12;
  [v13 enumeratePersistentIDsUsingBlock:v15];
}

+ (void)updateReportDate:(id)a3 forItems:(id)a4 forStatementMetadataPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [a1 _queryforItems:a4 forStatementMetadataPID:a5 inDatabase:v11];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002AE6D0;
  v15[3] = &unk_1007396C8;
  id v17 = v10;
  id v18 = a1;
  id v16 = v11;
  id v13 = v10;
  id v14 = v11;
  [v12 enumeratePersistentIDsUsingBlock:v15];
}

+ (id)_queryforItems:(id)a3 forStatementMetadataPID:(int64_t)a4 inDatabase:(id)a5
{
  int64_t v25 = a4;
  id v7 = a3;
  id v26 = a5;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v28 = *(void *)v30;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        id v12 = v8;
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "identifier", v25);
        char v15 = [a1 _predicateForIdentifier:v14];
        v33[0] = v15;
        id v16 = objc_msgSend(a1, "_predicateForType:", objc_msgSend(v13, "type"));
        v33[1] = v16;
        id v17 = +[NSArray arrayWithObjects:v33 count:2];
        id v18 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v17];

        id v8 = v12;
        [v12 safelyAddObject:v18];
      }
      id v10 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }

  id v19 = objc_alloc_init((Class)NSMutableArray);
  id v20 = [a1 _predicateForStatementMetadataPID:v25];
  [v19 safelyAddObject:v20];

  if ([v8 count])
  {
    v21 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v8];
    [v19 safelyAddObject:v21];
  }
  v22 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:](SQLiteCompoundPredicate, "predicateMatchingAllPredicates:", v19, v25);
  v23 = [a1 queryWithDatabase:v26 predicate:v22];

  return v23;
}

- (id)identifier
{
  return [(SQLiteEntity *)self valueForProperty:@"identifier"];
}

- (id)accountIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"account_statement_metadata.account_identifier"];
}

- (unint64_t)accountType
{
  objc_super v3 = [(SQLiteEntity *)self valueForProperty:@"account_statement_metadata_pid"];
  id v4 = [v3 longValue];

  id v5 = [(SQLiteEntity *)self database];
  id v6 = +[AccountStatementMetadata anyInDatabase:v5 forPID:v4];

  id v7 = [v6 accountType];
  return (unint64_t)v7;
}

- (unint64_t)type
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"type"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (int64_t)reportCount
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"report_count"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

+ (id)_predicateForStatementMetadataPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_statement_metadata_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForType:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForAccountStatementMetadataItem
{
  v4[0] = @"identifier";
  v4[1] = @"originator_altdsid";
  v5[0] = &stru_1007455C8;
  v5[1] = &stru_1007455E8;
  v4[2] = @"type";
  v4[3] = @"account_event_type";
  v5[2] = &stru_100745608;
  v5[3] = &stru_100745628;
  v4[4] = @"zone_name";
  v4[5] = @"has_been_processed";
  v5[4] = &stru_100745648;
  v5[5] = &stru_100745668;
  v4[6] = @"processed_attempt_count";
  v4[7] = @"last_processed_date";
  v5[6] = &stru_100745688;
  v5[7] = &stru_1007456A8;
  v4[8] = @"last_report_date";
  v4[9] = @"report_count";
  v5[8] = &stru_1007456C8;
  v5[9] = &stru_1007456E8;
  v4[10] = @"error";
  v5[10] = &stru_100745708;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:11];
  return v2;
}

+ (id)_commonDictionaryForStatementMetadataItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"identifier"];

  id v6 = [v3 zoneName];
  [v4 setObjectOrNull:v6 forKey:@"zone_name"];

  id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 type]);
  [v4 setObjectOrNull:v7 forKey:@"type"];

  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 accountEventType]);
  [v4 setObjectOrNull:v8 forKey:@"account_event_type"];

  id v9 = [v3 originatorAltDSID];
  [v4 setObjectOrNull:v9 forKey:@"originator_altdsid"];

  id v10 = [v3 lastReportDate];
  id v11 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v11 forKey:@"last_report_date"];

  id v12 = [v3 reportCount];
  id v13 = +[NSNumber numberWithInteger:v12];
  [v4 setObjectOrNull:v13 forKey:@"report_count"];

  return v4;
}

@end