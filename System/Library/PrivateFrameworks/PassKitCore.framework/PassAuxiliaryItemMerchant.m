@interface PassAuxiliaryItemMerchant
+ (id)_predicateForAuxiliaryItemIdentifier:(id)a3;
+ (id)_predicateForMapsBrandPersistentID:(int64_t)a3;
+ (id)_predicateForMapsMerchantPersistentID:(int64_t)a3;
+ (id)_predicateForPassPersistentID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertPassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 mapsBrandPersistentID:(int64_t)a5 mapsMerchantPersistentID:(int64_t)a6 inDatabase:(id)a7;
+ (id)itemIdentifiersForPassPersisentID:(int64_t)a3 inDatabase:(id)a4;
+ (id)merchantForPassAuxiliaryItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAllPassAuxiliaryItemMerchantsForPassPersisentID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 inDatabase:(id)a5;
- (id)initPassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 mapsBrandPersistentID:(int64_t)a5 mapsMerchantPersistentID:(int64_t)a6 inDatabase:(id)a7;
@end

@implementation PassAuxiliaryItemMerchant

+ (id)databaseTable
{
  return @"cardiff";
}

+ (id)insertPassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 mapsBrandPersistentID:(int64_t)a5 mapsMerchantPersistentID:(int64_t)a6 inDatabase:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initPassAuxiliaryItemMerchantForItemIdentifier:v13 passPersistentID:a4 mapsBrandPersistentID:a5 mapsMerchantPersistentID:a6 inDatabase:v12];

  return v14;
}

- (id)initPassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 mapsBrandPersistentID:(int64_t)a5 mapsMerchantPersistentID:(int64_t)a6 inDatabase:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100020C0C;
  v31 = sub_1000210F8;
  id v32 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100367144;
  v19[3] = &unk_10074B508;
  id v14 = v12;
  int64_t v24 = a4;
  int64_t v25 = a5;
  int64_t v26 = a6;
  id v20 = v14;
  v23 = &v27;
  v15 = self;
  v21 = v15;
  id v16 = v13;
  id v22 = v16;
  sub_10000817C((uint64_t)v16, v19);
  id v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v17;
}

+ (void)deletePassAuxiliaryItemMerchantForItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [a1 _predicateForAuxiliaryItemIdentifier:a3];
  v22[0] = v9;
  v10 = [a1 _predicateForPassPersistentID:a4];
  v22[1] = v10;
  v11 = +[NSArray arrayWithObjects:v22 count:2];
  id v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

  id v13 = [a1 queryWithDatabase:v8 predicate:v12];
  v21[0] = @"c";
  v21[1] = @"d";
  id v14 = +[NSArray arrayWithObjects:v21 count:2];
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_1003673B8;
  v19 = &unk_100731258;
  id v20 = v8;
  id v15 = v8;
  [v13 enumeratePersistentIDsAndProperties:v14 usingBlock:&v16];

  objc_msgSend(v13, "deleteAllEntities", v16, v17, v18, v19);
}

+ (void)deleteAllPassAuxiliaryItemMerchantsForPassPersisentID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPassPersistentID:a3];
  id v16 = v7;
  id v8 = +[NSArray arrayWithObjects:&v16 count:1];
  v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  v10 = [a1 queryWithDatabase:v6 predicate:v9];
  v15[0] = @"c";
  v15[1] = @"d";
  v11 = +[NSArray arrayWithObjects:v15 count:2];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003675F0;
  v13[3] = &unk_100731258;
  id v14 = v6;
  id v12 = v6;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v13];

  [v10 deleteAllEntities];
}

+ (id)merchantForPassAuxiliaryItemIdentifier:(id)a3 passPersistentID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  int64_t v25 = sub_100020C0C;
  int64_t v26 = sub_1000210F8;
  id v27 = 0;
  v10 = [a1 _predicateForAuxiliaryItemIdentifier:v8];
  v29[0] = v10;
  v11 = [a1 _predicateForPassPersistentID:a4];
  v29[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v29 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  id v14 = [a1 queryWithDatabase:v9 predicate:v13];
  v28[0] = @"c";
  v28[1] = @"d";
  id v15 = +[NSArray arrayWithObjects:v28 count:2];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1003678F0;
  v19[3] = &unk_10074B530;
  id v16 = v9;
  id v20 = v16;
  v21 = &v22;
  [v14 enumeratePersistentIDsAndProperties:v15 usingBlock:v19];

  id v17 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v17;
}

+ (id)itemIdentifiersForPassPersisentID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100020C0C;
  v19 = sub_1000210F8;
  id v20 = objc_alloc_init((Class)NSMutableSet);
  v7 = [a1 _predicateForPassPersistentID:a3];
  uint64_t v22 = v7;
  id v8 = +[NSArray arrayWithObjects:&v22 count:1];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  v10 = [a1 queryWithDatabase:v6 predicate:v9];
  CFStringRef v21 = @"b";
  v11 = +[NSArray arrayWithObjects:&v21 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100367C24;
  v14[3] = &unk_1007339F8;
  v14[4] = &v15;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v14];

  id v12 = [(id)v16[5] copy];
  _Block_object_dispose(&v15, 8);

  return v12;
}

+ (id)_predicateForAuxiliaryItemIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForPassPersistentID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForMapsBrandPersistentID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"c" equalToValue:v3];

  return v4;
}

+ (id)_predicateForMapsMerchantPersistentID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:v3];

  return v4;
}

@end