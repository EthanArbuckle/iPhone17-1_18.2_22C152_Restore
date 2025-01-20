@interface AccountTransfer
+ (id)_commonInitWithTransfer:(id)a3 accountIdentifier:(id)a4;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForNoEventPID;
+ (id)_predicateForTransactionReferenceIdentifier:(id)a3;
+ (id)_predicateForTransactionServiceIdentifier:(id)a3;
+ (id)_propertySetterForFundingDetailsName;
+ (id)_propertySettersForAccountTransfer;
+ (id)_transfersFromQuery:(id)a3;
+ (id)databaseTable;
+ (id)insertTransfer:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)insertTransfer:(id)a3 forEventPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6;
+ (id)transfersForTransactionReferenceIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)transfersForTransactionServiceIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)transfersWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteTransferWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteTransfersWithAccountIdentifier:(id)a3 inDatabase:(id)a4;
- (id)transfer;
@end

@implementation AccountTransfer

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"grapes.d"
    || v7
    && (unsigned int v8 = [(__CFString *)v7 isEqualToString:@"grapes.d"],
        v9,
        v8))
  {
    [v6 addObject:@"LEFT JOIN grapes ON grapes.pid = zucchini.a"];
  }
}

+ (id)transfersForTransactionServiceIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForTransactionServiceIdentifier:a3];
  CFStringRef v14 = @"grapes.d";
  unsigned int v8 = +[NSArray arrayWithObjects:&v14 count:1];
  CFStringRef v13 = @"DESC";
  v9 = +[NSArray arrayWithObjects:&v13 count:1];
  v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  v11 = [a1 _transfersFromQuery:v10];

  return v11;
}

+ (id)transfersForTransactionReferenceIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForTransactionReferenceIdentifier:a3];
  CFStringRef v14 = @"grapes.d";
  unsigned int v8 = +[NSArray arrayWithObjects:&v14 count:1];
  CFStringRef v13 = @"DESC";
  v9 = +[NSArray arrayWithObjects:&v13 count:1];
  v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  v11 = [a1 _transfersFromQuery:v10];

  return v11;
}

+ (id)transfersWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEventPID:a3];
  unsigned int v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = [a1 _transfersFromQuery:v8];
  v10 = +[NSSet setWithArray:v9];

  return v10;
}

+ (id)_transfersFromQuery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  v13[0] = @"pid";
  v13[1] = @"grapes.d";
  id v5 = +[NSArray arrayWithObjects:v13 count:2];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002972A8;
  v10[3] = &unk_10072ED00;
  id v11 = v3;
  id v12 = v4;
  id v6 = v4;
  id v7 = v3;
  [v7 enumeratePersistentIDsAndProperties:v5 usingBlock:v10];

  id v8 = [v6 copy];
  return v8;
}

+ (id)insertTransfer:(id)a3 forEventPID:(int64_t)a4 accountIdentifier:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = [a1 _commonInitWithTransfer:a3 accountIdentifier:a5];
  id v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObject:v12 forKey:@"a"];

  id v13 = [objc_alloc((Class)a1) initWithPropertyValues:v11 inDatabase:v10];
  return v13;
}

+ (id)insertTransfer:(id)a3 accountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [a1 _commonInitWithTransfer:a3 accountIdentifier:a4];
  id v10 = [objc_alloc((Class)a1) initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

+ (id)_commonInitWithTransfer:(id)a3 accountIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = [v5 identifier];
  [v7 setObjectOrNull:v8 forKey:@"b"];

  v9 = [v5 referenceIdentifier];
  [v7 setObjectOrNull:v9 forKey:@"e"];

  id v10 = [v5 clientReferenceIdentifier];
  [v7 setObjectOrNull:v10 forKey:@"p"];

  id v11 = [v5 currencyAmount];
  id v12 = [v11 amount];
  id v13 = PKCurrencyDecimalToStorageNumber();

  [v7 setObjectOrNull:v13 forKey:@"c"];
  CFStringRef v14 = [v5 holdAmount];
  v15 = [v14 amount];
  v16 = PKCurrencyDecimalToStorageNumber();

  [v7 setObjectOrNull:v16 forKey:@"y"];
  v17 = [v5 currencyAmount];
  v18 = [v17 currency];
  [v7 setObjectOrNull:v18 forKey:@"d"];

  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "type"), @"g");
  v19 = [v5 transferDate];
  v20 = (void *)_SQLValueForDate();
  [v7 setObjectOrNull:v20 forKey:@"f"];

  v21 = [v5 transferStatusDate];
  v22 = (void *)_SQLValueForDate();
  [v7 setObjectOrNull:v22 forKey:@"q"];

  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "state"), @"h");
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v5, "statusCode"), @"k");
  objc_msgSend(v7, "setBool:forKey:", objc_msgSend(v5, "cancellable"), @"w");
  v23 = [v5 cancellationExpiryDate];
  v24 = (void *)_SQLValueForDate();
  [v7 setObjectOrNull:v24 forKey:@"x"];

  v25 = [v5 expectedCompletionDate];
  v26 = (void *)_SQLValueForDate();
  [v7 setObjectOrNull:v26 forKey:@"z"];

  v27 = [v5 externalAccount];
  v28 = [v27 identifier];
  [v7 setObjectOrNull:v28 forKey:@"l"];

  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v27, "type"), @"m");
  v29 = [v27 accountSuffix];
  [v7 setObjectOrNull:v29 forKey:@"n"];

  if ([v27 type] == (id)1 || objc_msgSend(v27, "type") == (id)5)
  {
    v30 = [v27 fundingDetails];
    v31 = [v30 name];
    [v7 setObjectOrNull:v31 forKey:@"v"];
  }
  v32 = [v5 scheduleDetails];
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v32, "frequency"), @"i");
  objc_msgSend(v7, "setInteger:forKey:", objc_msgSend(v32, "scheduledDay"), @"u");
  v33 = [v32 scheduledDate];
  v34 = (void *)_SQLValueForDate();
  [v7 setObjectOrNull:v34 forKey:@"r"];

  v35 = [v32 transferTermsIdentifier];
  [v7 setObjectOrNull:v35 forKey:@"s"];

  [v7 setObjectOrNull:v6 forKey:@"t"];
  return v7;
}

- (id)transfer
{
  id v3 = objc_alloc_init((Class)PKAccountTransfer);
  id v4 = objc_alloc_init((Class)PKAccountTransferExternalAccount);
  id v5 = objc_alloc_init((Class)PKAccountTransferScheduleDetails);
  [v3 setExternalAccount:v4];
  [v3 setScheduleDetails:v5];
  id v6 = +[AccountTransfer _propertySettersForAccountTransfer];
  id v7 = [v6 allKeys];
  id v8 = [v7 mutableCopy];

  id v9 = [v8 count];
  [v8 addObject:@"d"];
  id v10 = [v8 count];
  [v8 addObject:@"c"];
  id v11 = [v8 count];
  [v8 addObject:@"y"];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100297BEC;
  v28[3] = &unk_100744220;
  id v12 = v6;
  id v29 = v12;
  id v13 = v3;
  id v30 = v13;
  id v31 = v9;
  id v32 = v10;
  id v33 = v11;
  [(SQLiteEntity *)self getValuesForProperties:v8 withApplier:v28];
  CFStringRef v14 = [v13 externalAccount];
  if ([v14 type] == (id)1)
  {

LABEL_4:
    id v17 = objc_alloc_init((Class)PKAccountPaymentFundingDetailsBankAccount);
    v18 = [v13 externalAccount];
    [v18 setFundingDetails:v17];

    v19 = +[AccountTransfer _propertySetterForFundingDetailsName];
    v20 = [v19 allKeys];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100297D50;
    v25[3] = &unk_10072EDD0;
    id v26 = v19;
    id v27 = v13;
    id v21 = v19;
    [(SQLiteEntity *)self getValuesForProperties:v20 withApplier:v25];

    goto LABEL_5;
  }
  v15 = [v13 externalAccount];
  id v16 = [v15 type];

  if (v16 == (id)5) {
    goto LABEL_4;
  }
LABEL_5:
  v22 = v30;
  id v23 = v13;

  return v23;
}

+ (void)deleteTransferWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForEventPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)deleteTransfersWithAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _predicateForNoEventPID];
  v13[0] = v8;
  id v9 = [a1 _predicateForAccountIdentifier:v7];

  v13[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v13 count:2];
  id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  id v12 = [a1 queryWithDatabase:v6 predicate:v11];

  [v12 deleteAllEntities];
}

+ (id)databaseTable
{
  return @"zucchini";
}

+ (id)_predicateForTransactionServiceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];
  v9[0] = v4;
  id v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"e" equalToValue:v3];

  v9[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v9 count:2];
  id v7 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v6];

  return v7;
}

+ (id)_predicateForTransactionReferenceIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"p" equalToValue:a3];
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForNoEventPID
{
  return +[SQLiteNullPredicate isNullPredicateWithProperty:@"a"];
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"t" equalToValue:a3];
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_propertySettersForAccountTransfer
{
  v4[0] = @"b";
  v4[1] = @"e";
  v5[0] = &stru_100744260;
  v5[1] = &stru_100744280;
  v4[2] = @"p";
  v4[3] = @"g";
  v5[2] = &stru_1007442A0;
  v5[3] = &stru_1007442C0;
  v4[4] = @"f";
  v4[5] = @"q";
  v5[4] = &stru_1007442E0;
  v5[5] = &stru_100744300;
  v4[6] = @"h";
  v4[7] = @"k";
  v5[6] = &stru_100744320;
  v5[7] = &stru_100744340;
  v4[8] = @"w";
  v4[9] = @"x";
  v5[8] = &stru_100744360;
  v5[9] = &stru_100744380;
  v4[10] = @"z";
  v4[11] = @"l";
  v5[10] = &stru_1007443A0;
  v5[11] = &stru_1007443C0;
  v4[12] = @"m";
  v4[13] = @"n";
  v5[12] = &stru_1007443E0;
  v5[13] = &stru_100744400;
  v4[14] = @"i";
  v4[15] = @"u";
  v5[14] = &stru_100744420;
  v5[15] = &stru_100744440;
  v4[16] = @"r";
  v4[17] = @"s";
  v5[16] = &stru_100744460;
  v5[17] = &stru_100744480;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:18];
  return v2;
}

+ (id)_propertySetterForFundingDetailsName
{
  CFStringRef v4 = @"v";
  id v5 = &stru_1007444A0;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

@end