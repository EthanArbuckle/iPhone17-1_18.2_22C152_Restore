@interface SavingsAccountDetails
+ (id)_commonDictionaryForSavingsDetails:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForSavingsAccountDetails;
+ (id)accountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateSavingsAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteSavingsAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (SavingsAccountDetails)initWithSavingsAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountDetails;
- (void)updateWithDetails:(id)a3;
@end

@implementation SavingsAccountDetails

+ (id)databaseTable
{
  return @"pomegranate";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  else {
    return 0;
  }
}

- (SavingsAccountDetails)initWithSavingsAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [a3 savingsDetails];
  v10 = [(id)objc_opt_class() _commonDictionaryForSavingsDetails:v9];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  id v13 = [(SQLiteEntity *)v12 persistentID];
  v14 = [v9 accountSummary];
  id v15 = +[SavingsAccountSummary insertSavingsAccountSummary:v14 forSavingsAccountDetailsPID:v13 inDatabase:v8];

  v16 = [v9 fccStepUpDetails];
  if (v16) {
    id v17 = +[SavingsAccountStepUpDetails insertSavingsAccountStepUpDetails:v16 forSavingsAccountDetailsPID:v13 inDatabase:v8];
  }
  else {
    +[SavingsAccountStepUpDetails deleteSavingsAccountStepUpForSavingsAccountDetailsPID:v13 inDatabase:v8];
  }

  return v12;
}

+ (id)insertOrUpdateSavingsAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _predicateForAccountPID:a4];
  id v11 = [a1 anyInDatabase:v9 predicate:v10];

  if (v11) {
    [v11 updateWithDetails:v8];
  }
  else {
    id v11 = [objc_alloc((Class)objc_opt_class()) initWithSavingsAccountDetails:v8 forAccountPID:a4 inDatabase:v9];
  }

  return v11;
}

+ (void)deleteSavingsAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)v2 database];
  +[SavingsAccountSummary deleteSavingsAccountSummaryForSavingsAccountDetailsPID:v3 inDatabase:v4];
  +[SavingsAccountStepUpDetails deleteSavingsAccountStepUpForSavingsAccountDetailsPID:v3 inDatabase:v4];
  v6.receiver = v2;
  v6.super_class = (Class)SavingsAccountDetails;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

+ (id)accountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 accountDetails];

  return v9;
}

- (void)updateWithDetails:(id)a3
{
  id v9 = [a3 savingsDetails];
  v4 = [(id)objc_opt_class() _commonDictionaryForSavingsDetails:v9];
  int64_t v5 = [(SQLiteEntity *)self persistentID];
  id v6 = [(SQLiteEntity *)self database];
  v7 = [v9 accountSummary];
  +[SavingsAccountSummary updateSavingsAccountSummary:v7 forSavingsAccountDetailsPID:v5 inDatabase:v6];

  id v8 = [v9 fccStepUpDetails];
  if (v8) {
    +[SavingsAccountStepUpDetails updateSavingsAccountStepUpDetails:v8 forSavingsAccountDetailsPID:v5 inDatabase:v6];
  }
  else {
    +[SavingsAccountStepUpDetails deleteSavingsAccountStepUpForSavingsAccountDetailsPID:v5 inDatabase:v6];
  }
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForSavingsAccountDetails
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100737F78;
  v5[1] = &stru_100737F98;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100737FB8;
  v5[3] = &stru_100737FD8;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100737FF8;
  v5[5] = &stru_100738018;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100738038;
  v5[7] = &stru_100738058;
  v4[8] = @"k";
  v4[9] = @"l";
  v5[8] = &stru_100738078;
  v5[9] = &stru_100738098;
  v4[10] = @"m";
  v4[11] = @"n";
  v5[10] = &stru_1007380B8;
  v5[11] = &stru_1007380D8;
  v4[12] = @"o";
  v4[13] = @"p";
  v5[12] = &stru_1007380F8;
  v5[13] = &stru_100738118;
  v4[14] = @"fcc_step_up_required";
  v5[14] = &stru_100738138;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:15];
  return v2;
}

- (id)accountDetails
{
  id v3 = objc_alloc_init((Class)PKSavingsAccountDetails);
  v4 = [(id)objc_opt_class() _propertySettersForSavingsAccountDetails];
  int64_t v5 = [v4 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100115384;
  v14[3] = &unk_10072DDD8;
  v14[4] = self;
  id v15 = v4;
  id v16 = v3;
  id v6 = v3;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  v10 = +[SavingsAccountSummary savingsAccountSummaryForSavingsAccountDetailsPID:v8 inDatabase:v9];
  [v6 setAccountSummary:v10];

  id v11 = +[SavingsAccountStepUpDetails savingsAccountStepUpDetailsForSavingsAccountDetailsPID:v8 inDatabase:v9];
  [v6 setFccStepUpDetails:v11];

  id v12 = [objc_alloc((Class)PKAccountDetails) initWithSavingsDetails:v6];
  return v12;
}

+ (id)_commonDictionaryForSavingsDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  int64_t v5 = [v3 lastUpdatedDate];
  id v6 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v6 forKey:@"b"];

  id v7 = [v3 createdDate];
  int64_t v8 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v3 countryCode];
  [v4 setObjectOrNull:v9 forKey:@"d"];

  v10 = [v3 currencyCode];
  [v4 setObjectOrNull:v10 forKey:@"e"];

  id v11 = [v3 productTimeZone];
  id v12 = [v11 name];
  [v4 setObjectOrNull:v12 forKey:@"f"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "moreInfoRequired"), @"g");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "fccStepUpRequired"), @"fcc_step_up_required");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "termsAcceptanceRequired"), @"h");
  id v13 = [v3 termsIdentifier];
  [v4 setObjectOrNull:v13 forKey:@"i"];

  v14 = [v3 privacyPolicyURL];
  id v15 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v15 forKey:@"k"];

  id v16 = [v3 businessChatIdentifier];
  [v4 setObjectOrNull:v16 forKey:@"l"];

  id v17 = [v3 contactWebsite];
  v18 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v18 forKey:@"m"];

  v19 = [v3 contactNumber];
  [v4 setObjectOrNull:v19 forKey:@"n"];

  v20 = [v3 routingNumber];
  [v4 setObjectOrNull:v20 forKey:@"o"];

  v21 = [v3 accountNumber];

  [v4 setObjectOrNull:v21 forKey:@"p"];
  return v4;
}

@end