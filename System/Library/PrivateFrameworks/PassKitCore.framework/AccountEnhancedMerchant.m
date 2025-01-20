@interface AccountEnhancedMerchant
+ (id)_anyInDatabase:(id)a3 withPrivateIdentifier:(id)a4 accountPID:(int64_t)a5;
+ (id)_enhancedMerchantsWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_insertAccountEnhancedMerchant:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForPrivateIdentifier:(id)a3;
+ (id)_predicateForPrivateIdentifier:(id)a3 accountPID:(int64_t)a4;
+ (id)_propertySettersForAccountEnhancedMerchant;
+ (id)_propertyValuesForEnhancedMerchant:(id)a3 accountPID:(int64_t)a4;
+ (id)_queryForPredicate:(id)a3 database:(id)a4;
+ (id)accountEnhancedMerchantForPrivateIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)accountEnhancedMerchantsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deleteAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountEnhancedMerchantsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)populateAssociatedProgramIdentifiersForEnhancedMerchant:(id)a3 enhancedMerchantPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountEnhancedMerchant)initWithAccountEnhancedMerchant:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)accountEnhancedMerchant;
- (void)_updateWithAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4;
- (void)updateWithEnhancedMerchantProgramIdentifiers:(id)a3;
@end

@implementation AccountEnhancedMerchant

+ (id)databaseTable
{
  return @"quince";
}

- (AccountEnhancedMerchant)initWithAccountEnhancedMerchant:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[AccountEnhancedMerchant _propertyValuesForEnhancedMerchant:v9 accountPID:a4];
  v11 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  v12 = v11;
  v13 = [v9 enhancedRewardsProgramIdentifiers];

  [(AccountEnhancedMerchant *)v12 updateWithEnhancedMerchantProgramIdentifiers:v13];
  return v12;
}

+ (id)accountEnhancedMerchantsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 _enhancedMerchantsWithPredicate:v7 inDatabase:v6];

  return v8;
}

+ (id)_enhancedMerchantsWithPredicate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _queryForPredicate:a3 database:v6];
  id v8 = [a1 _propertySettersForAccountEnhancedMerchant];
  id v9 = +[NSMutableArray array];
  v10 = [v8 allKeys];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_1002CD004;
  v19 = &unk_10072DE00;
  id v20 = v8;
  id v21 = v6;
  id v22 = v9;
  id v23 = a1;
  id v11 = v9;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  id v14 = objc_msgSend(v11, "copy", v16, v17, v18, v19);
  return v14;
}

+ (id)_anyInDatabase:(id)a3 withPrivateIdentifier:(id)a4 accountPID:(int64_t)a5
{
  id v8 = a3;
  id v9 = [a1 _predicateForPrivateIdentifier:a4 accountPID:a5];
  if (v9)
  {
    v10 = [a1 anyInDatabase:v8 predicate:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)accountEnhancedMerchantForPrivateIdentifier:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  v5 = [a1 _anyInDatabase:a5 withPrivateIdentifier:a3 accountPID:a4];
  id v6 = [v5 accountEnhancedMerchant];

  return v6;
}

+ (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deleteAccountEnhancedMerchantsForAccountPID:a4 inDatabase:v9];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(a1, "insertOrUpdateAccountEnhancedMerchant:accountPID:inDatabase:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), a4, v9, (void)v15);
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

+ (void)insertOrUpdateAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [v12 privateIdentifier];
  id v10 = [a1 _anyInDatabase:v8 withPrivateIdentifier:v9 accountPID:a4];

  if (v10) {
    [v10 _updateWithAccountEnhancedMerchant:v12 accountPID:a4];
  }
  else {
    id v11 = [a1 _insertAccountEnhancedMerchant:v12 forAccountPID:a4 inDatabase:v8];
  }
}

+ (id)_insertAccountEnhancedMerchant:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountEnhancedMerchant:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAccountEnhancedMerchantsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a3 privateIdentifier];
  id v10 = [a1 _anyInDatabase:v8 withPrivateIdentifier:v9 accountPID:a4];

  [v10 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)self database];
  +[AccountEnhancedMerchantProgramIdentifier deleteEnhancedMerchantProgramIdentifiersForEnhancedMerchantPID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)AccountEnhancedMerchant;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

- (void)_updateWithAccountEnhancedMerchant:(id)a3 accountPID:(int64_t)a4
{
  id v6 = a3;
  id v8 = +[AccountEnhancedMerchant _propertyValuesForEnhancedMerchant:v6 accountPID:a4];
  [(SQLiteEntity *)self setValuesWithDictionary:v8];
  v7 = [v6 enhancedRewardsProgramIdentifiers];

  [(AccountEnhancedMerchant *)self updateWithEnhancedMerchantProgramIdentifiers:v7];
}

+ (id)_predicateForPrivateIdentifier:(id)a3
{
  if (a3)
  {
    v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  uint64_t v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPrivateIdentifier:(id)a3 accountPID:(int64_t)a4
{
  id v6 = [a1 _predicateForPrivateIdentifier:a3];
  uint64_t v7 = [a1 _predicateForAccountPID:a4];
  id v8 = (void *)v7;
  id v9 = 0;
  if (v6 && v7)
  {
    v12[0] = v6;
    v12[1] = v7;
    id v10 = +[NSArray arrayWithObjects:v12 count:2];
    id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];
  }
  return v9;
}

+ (id)_queryForPredicate:(id)a3 database:(id)a4
{
  CFStringRef v13 = @"c";
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v13 count:1];
  CFStringRef v12 = @"ASC";
  id v9 = +[NSArray arrayWithObjects:&v12 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  return v10;
}

+ (id)_propertySettersForAccountEnhancedMerchant
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100746448;
  v5[1] = &stru_100746468;
  v4[2] = @"d";
  v4[3] = @"ea";
  v5[2] = &stru_100746488;
  v5[3] = &stru_1007464A8;
  v4[4] = @"eb";
  v4[5] = @"f";
  v5[4] = &stru_1007464C8;
  v5[5] = &stru_1007464E8;
  v4[6] = @"g";
  v4[7] = @"h";
  v5[6] = &stru_100746508;
  v5[7] = &stru_100746528;
  v4[8] = @"i";
  v4[9] = @"j";
  v5[8] = &stru_100746548;
  v5[9] = &stru_100746568;
  v4[10] = @"k";
  v4[11] = @"l";
  v5[10] = &stru_100746588;
  v5[11] = &stru_1007465A8;
  v4[12] = @"ma";
  v4[13] = @"mb";
  v5[12] = &stru_1007465C8;
  v5[13] = &stru_1007465E8;
  v4[14] = @"n";
  v4[15] = @"o";
  v5[14] = &stru_100746608;
  v5[15] = &stru_100746628;
  v4[16] = @"p";
  v4[17] = @"q";
  v5[16] = &stru_100746648;
  v5[17] = &stru_100746668;
  v4[18] = @"r";
  v4[19] = @"s";
  v5[18] = &stru_100746688;
  v5[19] = &stru_1007466A8;
  v4[20] = @"t";
  v5[20] = &stru_1007466C8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:21];
  return v2;
}

- (id)accountEnhancedMerchant
{
  id v3 = objc_alloc_init((Class)PKAccountEnhancedMerchant);
  v4 = [(id)objc_opt_class() _propertySettersForAccountEnhancedMerchant];
  v5 = [v4 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002CE0E8;
  v14[3] = &unk_10072DDD8;
  v14[4] = self;
  id v15 = v4;
  id v6 = v3;
  id v16 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  id v8 = objc_opt_class();
  int64_t v9 = [(SQLiteEntity *)self persistentID];
  id v10 = [(SQLiteEntity *)self database];
  [v8 populateAssociatedProgramIdentifiersForEnhancedMerchant:v6 enhancedMerchantPID:v9 inDatabase:v10];

  id v11 = v16;
  id v12 = v6;

  return v12;
}

- (void)updateWithEnhancedMerchantProgramIdentifiers:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SQLiteEntity *)self persistentID];
  id v6 = [(SQLiteEntity *)self database];
  +[AccountEnhancedMerchantProgramIdentifier insertOrUpdateEnhancedMerchantProgramIdentifiers:v4 enhancedMerchantPID:v5 inDatabase:v6];
}

+ (void)populateAssociatedProgramIdentifiersForEnhancedMerchant:(id)a3 enhancedMerchantPID:(int64_t)a4 inDatabase:(id)a5
{
  id v10 = a3;
  id v7 = +[AccountEnhancedMerchantProgramIdentifier accountEnhancedMerchantProgramIdentifiersForEnhancedMerchantPID:a4 inDatabase:a5];
  if ([v7 count]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  [v10 setEnhancedRewardsProgramIdentifiers:v9];
}

+ (id)_propertyValuesForEnhancedMerchant:(id)a3 accountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = +[NSNumber numberWithLongLong:a4];
  [v6 setObjectOrNull:v7 forKey:@"a"];

  id v8 = [v5 privateIdentifier];
  [v6 setObjectOrNull:v8 forKey:@"b"];

  id v9 = [v5 name];
  [v6 setObjectOrNull:v9 forKey:@"c"];

  id v10 = [v5 detailedDescription];
  [v6 setObjectOrNull:v10 forKey:@"d"];

  id v11 = [v5 logoImage];
  id v12 = [v11 imageForScaleFactor:2];

  CFStringRef v13 = [v12 remoteURL];
  id v14 = [v13 absoluteString];
  [v6 setObjectOrNull:v14 forKey:@"ea"];

  id v15 = [v5 logoImage];
  id v16 = [v15 imageForScaleFactor:3];

  long long v17 = [v16 remoteURL];
  long long v18 = [v17 absoluteString];
  [v6 setObjectOrNull:v18 forKey:@"eb"];

  v19 = [v5 adamID];
  [v6 setObjectOrNull:v19 forKey:@"f"];

  id v20 = [v5 brandMUIDsAsJSONString];
  [v6 setObjectOrNull:v20 forKey:@"g"];

  id v21 = [v5 excludedMUIDsAsJSONString];
  [v6 setObjectOrNull:v21 forKey:@"h"];

  id v22 = [v5 website];
  id v23 = [v22 absoluteString];
  [v6 setObjectOrNull:v23 forKey:@"i"];

  v24 = [v5 loyaltyPassURL];
  v25 = [v24 absoluteString];
  [v6 setObjectOrNull:v25 forKey:@"j"];

  v26 = [v5 paymentIdentifiersAsJSONString];
  [v6 setObjectOrNull:v26 forKey:@"k"];

  v27 = [v5 disclosures];
  [v6 setObjectOrNull:v27 forKey:@"l"];

  v28 = [v5 iconImage];
  v29 = [v28 imageForScaleFactor:2];

  v30 = [v29 remoteURL];
  v31 = [v30 absoluteString];
  [v6 setObjectOrNull:v31 forKey:@"ma"];

  v32 = [v5 iconImage];
  v33 = [v32 imageForScaleFactor:3];

  v34 = [v33 remoteURL];
  v35 = [v34 absoluteString];
  [v6 setObjectOrNull:v35 forKey:@"mb"];

  v36 = [v5 mapsSearchText];
  [v6 setObjectOrNull:v36 forKey:@"n"];

  v37 = [v5 paymentSheetRewardsText];
  [v6 setObjectOrNull:v37 forKey:@"o"];

  objc_msgSend(v6, "setBool:forKey:", objc_msgSend(v5, "suppressPaymentSheetRewardsHint"), @"p");
  v38 = [v5 paymentSheetMerchantRewardsText];
  [v6 setObjectOrNull:v38 forKey:@"q"];

  v39 = [v5 paymentSheetOverrideStart];
  v40 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v40 forKey:@"r"];

  v41 = [v5 paymentSheetOverrideEnd];
  v42 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v42 forKey:@"s"];

  v43 = [v5 mapsSearchStringsAsJSONString];

  [v6 setObjectOrNull:v43 forKey:@"t"];
  id v44 = [v6 copy];

  return v44;
}

@end