@interface CreditAccountDetails
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForCreditAccountDetails;
+ (id)anyInDatabase:(id)a3 withAccountPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteCreditAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteVirtualCardEncryptedDataForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (CreditAccountDetails)initWithCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountDetails;
- (void)updateWithCreditAccountDetails:(id)a3;
@end

@implementation CreditAccountDetails

+ (id)databaseTable
{
  return @"clementines";
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

- (CreditAccountDetails)initWithCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [a3 creditDetails];
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [v9 lastUpdatedDate];
  v13 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v13 forKey:@"b"];

  v14 = [v9 createdDate];
  v15 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v15 forKey:@"n"];

  v16 = [v9 mergeDate];
  v17 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v17 forKey:@"o"];

  v18 = [v9 countryCode];
  [v10 setObjectOrNull:v18 forKey:@"c"];

  v19 = [v9 currencyCode];
  [v10 setObjectOrNull:v19 forKey:@"d"];

  v20 = [v9 productTimeZone];
  v21 = [v20 name];
  [v10 setObjectOrNull:v21 forKey:@"m"];

  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "termsAcceptanceRequired"), @"f");
  v22 = [v9 termsURL];
  v23 = [v22 absoluteString];
  [v10 setObjectOrNull:v23 forKey:@"h"];

  v24 = [v9 termsIdentifier];
  [v10 setObjectOrNull:v24 forKey:@"g"];

  v25 = [v9 associatedPassURL];
  v26 = [v25 absoluteString];
  [v10 setObjectOrNull:v26 forKey:@"i"];

  v27 = [v9 associatedPassSerialNumber];
  [v10 setObjectOrNull:v27 forKey:@"j"];

  v28 = [v9 associatedPassTypeIdentifier];
  [v10 setObjectOrNull:v28 forKey:@"k"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "cardType"), @"l");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "rewardsDestination"), @"p");
  v29 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  id v30 = [(SQLiteEntity *)v29 persistentID];
  v31 = [v9 rates];
  id v32 = +[CreditAccountRates insertAccountRates:v31 forCreditAccountDetailsPID:v30 inDatabase:v8];

  v33 = [v9 accountSummary];
  id v34 = +[CreditAccountSummary insertAccountSummary:v33 forCreditAccountDetailsPID:v30 inDatabase:v8];

  v35 = [v9 virtualCards];
  id v36 = +[VirtualCard insertOrUpdateVirtualCards:v35 forCreditAccountDetailsPID:v30 inDatabase:v8];

  v37 = [v9 installmentPlans];
  v38 = +[NSNumber numberWithUnsignedLongLong:v30];
  id v39 = +[CreditInstallmentPlan insertOrUpdateInstallmentPlans:v37 forCreditAccountDetailsPID:v38 inDatabase:v8];

  return v29;
}

+ (id)insertCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountDetails:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteCreditAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (void)deleteVirtualCardEncryptedDataForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  +[VirtualCard deleteVirtualCardEncryptedDataForCreditAccountDetailsPID:inDatabase:](VirtualCard, "deleteVirtualCardEncryptedDataForCreditAccountDetailsPID:inDatabase:", [v8 persistentID], v6);
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)v2 database];
  +[CreditAccountSummary deleteCreditAccountSummaryForCreditAccountDetailsPID:v3 inDatabase:v4];
  +[CreditAccountRates deleteCreditAccountRatesForCreditAccountDetailsPID:v3 inDatabase:v4];
  +[VirtualCard deleteVirtualCardsForCreditAccountDetailsPID:v3 inDatabase:v4];
  v5 = +[NSNumber numberWithUnsignedLongLong:v3];
  +[CreditInstallmentPlan deleteInstallmentPlansForCreditAccountDetailsPID:v5 inDatabase:v4];

  v7.receiver = v2;
  v7.super_class = (Class)CreditAccountDetails;
  LOBYTE(v2) = [(SQLiteEntity *)&v7 deleteFromDatabase];

  return (char)v2;
}

+ (id)creditAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 accountDetails];

  return v9;
}

+ (id)anyInDatabase:(id)a3 withAccountPID:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = [a1 _predicateForAccountPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (void)updateCreditAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForAccountPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updateWithCreditAccountDetails:v12];
  }
  else {
    id v11 = +[CreditAccountDetails insertCreditAccountDetails:v12 forAccountPID:a4 inDatabase:v8];
  }
}

- (void)updateWithCreditAccountDetails:(id)a3
{
  id v31 = [a3 creditDetails];
  v4 = +[NSMutableDictionary dictionary];
  v5 = [v31 lastUpdatedDate];
  id v6 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v6 forKey:@"b"];

  objc_super v7 = [v31 createdDate];
  id v8 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v8 forKey:@"n"];

  id v9 = [v31 mergeDate];
  id v10 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v10 forKey:@"o"];

  id v11 = [v31 countryCode];
  [v4 setObjectOrNull:v11 forKey:@"c"];

  id v12 = [v31 currencyCode];
  [v4 setObjectOrNull:v12 forKey:@"d"];

  v13 = [v31 productTimeZone];
  v14 = [v13 name];
  [v4 setObjectOrNull:v14 forKey:@"m"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v31, "termsAcceptanceRequired"), @"f");
  v15 = [v31 termsURL];
  v16 = [v15 absoluteString];
  [v4 setObjectOrNull:v16 forKey:@"h"];

  v17 = [v31 termsIdentifier];
  [v4 setObjectOrNull:v17 forKey:@"g"];

  v18 = [v31 associatedPassURL];
  v19 = [v18 absoluteString];
  [v4 setObjectOrNull:v19 forKey:@"i"];

  v20 = [v31 associatedPassSerialNumber];
  [v4 setObjectOrNull:v20 forKey:@"j"];

  v21 = [v31 associatedPassTypeIdentifier];
  [v4 setObjectOrNull:v21 forKey:@"k"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v31, "cardType"), @"l");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v31, "rewardsDestination"), @"p");
  int64_t v22 = [(SQLiteEntity *)self persistentID];
  v23 = [(SQLiteEntity *)self database];
  v24 = [v31 rates];
  +[CreditAccountRates updateCreditAccountRates:v24 forCreditAccountDetailsPID:v22 inDatabase:v23];

  v25 = [v31 accountSummary];
  +[CreditAccountSummary updateCreditAccountSummary:v25 forCreditAccountDetailsPID:v22 inDatabase:v23];

  v26 = [v31 virtualCards];
  id v27 = +[VirtualCard insertOrUpdateVirtualCards:v26 forCreditAccountDetailsPID:v22 inDatabase:v23];

  v28 = [v31 installmentPlans];
  v29 = +[NSNumber numberWithUnsignedLongLong:v22];
  id v30 = +[CreditInstallmentPlan insertOrUpdateInstallmentPlans:v28 forCreditAccountDetailsPID:v29 inDatabase:v23];

  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForCreditAccountDetails
{
  v4[0] = @"b";
  v4[1] = @"n";
  v5[0] = &stru_10074F6C8;
  v5[1] = &stru_10074F6E8;
  v4[2] = @"o";
  v4[3] = @"c";
  v5[2] = &stru_10074F708;
  v5[3] = &stru_10074F728;
  v4[4] = @"d";
  v4[5] = @"m";
  v5[4] = &stru_10074F748;
  v5[5] = &stru_10074F768;
  v4[6] = @"f";
  v4[7] = @"h";
  v5[6] = &stru_10074F788;
  v5[7] = &stru_10074F7A8;
  v4[8] = @"g";
  v4[9] = @"i";
  v5[8] = &stru_10074F7C8;
  v5[9] = &stru_10074F7E8;
  v4[10] = @"j";
  v4[11] = @"k";
  v5[10] = &stru_10074F808;
  v5[11] = &stru_10074F828;
  v4[12] = @"l";
  v4[13] = @"p";
  v5[12] = &stru_10074F848;
  v5[13] = &stru_10074F868;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:14];
  return v2;
}

- (id)accountDetails
{
  id v3 = objc_alloc_init((Class)PKCreditAccountDetails);
  v4 = [(id)objc_opt_class() _propertySettersForCreditAccountDetails];
  v5 = [v4 allKeys];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003DAB6C;
  v17[3] = &unk_10072DDD8;
  v17[4] = self;
  id v18 = v4;
  id v19 = v3;
  id v6 = v3;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v17];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  id v10 = +[CreditAccountRates creditAccountRatesForCreditAccountDetailsPID:v8 inDatabase:v9];
  [v6 setRates:v10];

  id v11 = +[CreditAccountSummary creditAccountSummaryForCreditAccountDetailsPID:v8 inDatabase:v9];
  [v6 setAccountSummary:v11];

  id v12 = +[VirtualCard virtualCardsForCreditAccountDetailsPID:v8 inDatabase:v9];
  [v6 setVirtualCards:v12];

  v13 = +[NSNumber numberWithUnsignedLongLong:v8];
  v14 = +[CreditInstallmentPlan installmentPlansForCreditAccountDetailsPID:v13 inDatabase:v9];
  [v6 setInstallmentPlans:v14];

  id v15 = [objc_alloc((Class)PKAccountDetails) initWithCreditDetails:v6];
  return v15;
}

@end