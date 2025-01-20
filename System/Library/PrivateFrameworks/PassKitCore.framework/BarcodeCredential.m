@interface BarcodeCredential
+ (BOOL)removeAllBarcodeCredentialValuesForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (BOOL)removeAllBarcodeCredentialsForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (id)_barcodeCredentialsForQuery:(id)a3;
+ (id)_predicateForBarcodeCredentialWithValue:(BOOL)a3;
+ (id)_predicateForBarcodeIdentifier:(id)a3;
+ (id)_predicateForDisplayedAfterDate:(id)a3;
+ (id)_predicateForDisplayedBarcodeCredential;
+ (id)_predicateForPaymentApplicationPersistentID:(int64_t)a3;
+ (id)_predicateForUndisplayedBarcodeCredential;
+ (id)_predicateForUnexpiredBarcodeCredential;
+ (id)_propertySettersForBarcodeCredential;
+ (id)_queryForLastUsedBarcodeIdentifierForPaymentApplicationPID:(int64_t)a3 database:(id)a4;
+ (id)_queryForNumberOfBarcodeCredentialsDisplayedAfterDate:(id)a3 paymentApplicationPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_queryForValidBarcodeCredeitialsWithLimit:(int64_t)a3 paymentApplicationPID:(int64_t)a4 database:(id)a5;
+ (id)anyInDatabase:(id)a3 withBarcodeIdentifier:(id)a4;
+ (id)databaseTable;
+ (id)firstValidBarcodeCredentialForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (id)insertBarcodeCredentials:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (id)lastUsedBarcodeIdentifierForPaymentApplication:(id)a3 inDatabase:(id)a4;
+ (unint64_t)numberOfBarcodeCredentialsDisplayedAfterDate:(id)a3 paymentApplication:(id)a4 inDatabase:(id)a5;
+ (unint64_t)numberOfValidCredentialsForPaymentApplication:(id)a3 inDatabase:(id)a4;
- (BOOL)updateWithDisplayTimestamp:(id)a3;
- (BarcodeCredential)initWithBarcodeCredential:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5;
- (id)barcodeCredential;
@end

@implementation BarcodeCredential

+ (id)anyInDatabase:(id)a3 withBarcodeIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForBarcodeIdentifier:a4];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)firstValidBarcodeCredentialForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "_queryForValidBarcodeCredeitialsWithLimit:paymentApplicationPID:database:", 1, objc_msgSend(a3, "persistentID"), v6);

  v8 = +[BarcodeCredential _barcodeCredentialsForQuery:v7];
  v9 = [v8 firstObject];

  return v9;
}

+ (id)lastUsedBarcodeIdentifierForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "_queryForLastUsedBarcodeIdentifierForPaymentApplicationPID:database:", objc_msgSend(a3, "persistentID"), v6);

  v8 = +[BarcodeCredential _barcodeCredentialsForQuery:v7];
  v9 = [v8 firstObject];
  v10 = [v9 valueForProperty:@"a"];

  return v10;
}

+ (unint64_t)numberOfValidCredentialsForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "_queryForValidBarcodeCredeitialsWithLimit:paymentApplicationPID:database:", 0, objc_msgSend(a3, "persistentID"), v6);

  id v8 = [v7 countOfEntities];
  return (unint64_t)v8;
}

+ (unint64_t)numberOfBarcodeCredentialsDisplayedAfterDate:(id)a3 paymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_msgSend(a1, "_queryForNumberOfBarcodeCredentialsDisplayedAfterDate:paymentApplicationPID:inDatabase:", v9, objc_msgSend(a4, "persistentID"), v8);

  id v11 = [v10 countOfEntities];
  return (unint64_t)v11;
}

+ (BOOL)removeAllBarcodeCredentialValuesForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v8 = [a1 databaseTable];
  id v9 = +[NSString stringWithFormat:@"UPDATE %@ SET %@ = NULL WHERE %@ IS NOT NULL AND %@ = ?", v8, @"d", @"d", @"e"];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10043FA28;
  v12[3] = &unk_100732630;
  id v10 = v6;
  id v13 = v10;
  v14 = &v15;
  sub_100012DC8((uint64_t)v7, v9, v12);
  LOBYTE(v8) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v8;
}

+ (BOOL)removeAllBarcodeCredentialsForPaymentApplication:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v8 = [a1 databaseTable];
  id v9 = +[NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v8, @"e"];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10043FBEC;
  v12[3] = &unk_100732630;
  id v10 = v6;
  id v13 = v10;
  v14 = &v15;
  sub_100012DC8((uint64_t)v7, v9, v12);
  LOBYTE(v8) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v8;
}

+ (id)insertBarcodeCredentials:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  id v12 = 0;
  if (v9 && v11)
  {
    id v13 = objc_alloc_init((Class)NSMutableArray);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10043FDC0;
    v16[3] = &unk_1007361E8;
    id v17 = v8;
    id v14 = v13;
    id v18 = v14;
    id v21 = a1;
    id v19 = v9;
    id v20 = v10;
    sub_10000817C((uint64_t)v20, v16);
    if ([v14 count]) {
      id v12 = [v14 copy];
    }
    else {
      id v12 = 0;
    }
  }
  return v12;
}

- (BarcodeCredential)initWithBarcodeCredential:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v6 = 0;
  if (a3 && a4)
  {
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    id v13 = [v11 identifier];
    id v14 = (void *)_SQLValueForString();
    [v12 setObjectOrNull:v14 forKey:@"a"];

    uint64_t v15 = [v11 expirationTimestamp];
    v16 = (void *)_SQLValueForDate();
    [v12 setObjectOrNull:v16 forKey:@"b"];

    id v17 = [v11 value];

    id v18 = v17;
    if (!v18
      || (+[NSKeyedArchiver archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0], (id v19 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v19 = +[NSNull null];
    }

    [v12 setObjectOrNull:v19 forKey:@"d"];
    id v20 = [v10 persistentID];

    id v21 = +[NSNumber numberWithLongLong:v20];
    [v12 setObjectOrNull:v21 forKey:@"e"];

    v22 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v9];
    self = v22;

    id v6 = self;
  }

  return v6;
}

- (id)barcodeCredential
{
  id v3 = objc_alloc_init((Class)PKBarcodeCredential);
  v4 = +[BarcodeCredential _propertySettersForBarcodeCredential];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004401A8;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (BOOL)updateWithDisplayTimestamp:(id)a3
{
  v4 = (void *)_SQLValueForDate();
  LOBYTE(self) = [(SQLiteEntity *)self setValue:v4 forProperty:@"c"];

  return (char)self;
}

+ (id)_predicateForUnexpiredBarcodeCredential
{
  v2 = +[NSDate date];
  id v3 = (void *)_SQLValueForDate();
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" greaterThanValue:v3];

  return v4;
}

+ (id)_predicateForUndisplayedBarcodeCredential
{
  return +[SQLiteNullPredicate isNullPredicateWithProperty:@"c"];
}

+ (id)_predicateForDisplayedBarcodeCredential
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"c"];
}

+ (id)_predicateForPaymentApplicationPersistentID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"e" equalToValue:v3];

  return v4;
}

+ (id)_predicateForBarcodeCredentialWithValue:(BOOL)a3
{
  if (a3) {
    +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"d"];
  }
  else {
  id v3 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"d"];
  }
  return v3;
}

+ (id)_predicateForBarcodeIdentifier:(id)a3
{
  id v3 = (void *)_SQLValueForString();
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForDisplayedAfterDate:(id)a3
{
  id v3 = (void *)_SQLValueForDate();
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"c" greaterThanValue:v3];

  return v4;
}

+ (id)_queryForValidBarcodeCredeitialsWithLimit:(int64_t)a3 paymentApplicationPID:(int64_t)a4 database:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _predicateForBarcodeCredentialWithValue:1];
  v21[0] = v9;
  id v10 = [a1 _predicateForUnexpiredBarcodeCredential];
  v21[1] = v10;
  id v11 = [a1 _predicateForUndisplayedBarcodeCredential];
  v21[2] = v11;
  id v12 = [a1 _predicateForPaymentApplicationPersistentID:a4];
  v21[3] = v12;
  id v13 = +[NSArray arrayWithObjects:v21 count:4];
  id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  v20[0] = @"b";
  v20[1] = @"a";
  uint64_t v15 = +[NSArray arrayWithObjects:v20 count:2];
  v19[0] = @"ASC";
  v19[1] = @"ASC";
  v16 = +[NSArray arrayWithObjects:v19 count:2];
  id v17 = +[SQLiteEntity queryWithDatabase:v8 predicate:v14 orderingProperties:v15 orderingDirections:v16 limit:a3];

  return v17;
}

+ (id)_queryForLastUsedBarcodeIdentifierForPaymentApplicationPID:(int64_t)a3 database:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForDisplayedBarcodeCredential];
  v17[0] = v7;
  id v8 = [a1 _predicateForPaymentApplicationPersistentID:a3];
  v17[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v17 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  CFStringRef v16 = @"c";
  id v11 = +[NSArray arrayWithObjects:&v16 count:1];
  CFStringRef v15 = @"DESC";
  id v12 = +[NSArray arrayWithObjects:&v15 count:1];
  id v13 = +[SQLiteEntity queryWithDatabase:v6 predicate:v10 orderingProperties:v11 orderingDirections:v12 limit:1];

  return v13;
}

+ (id)_queryForNumberOfBarcodeCredentialsDisplayedAfterDate:(id)a3 paymentApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _predicateForPaymentApplicationPersistentID:a4];
  v16[0] = v10;
  id v11 = [a1 _predicateForDisplayedAfterDate:v9];

  v16[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v16 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  id v14 = +[SQLiteEntity queryWithDatabase:v8 predicate:v13];

  return v14;
}

+ (id)databaseTable
{
  return @"e_mei_shan";
}

+ (id)_propertySettersForBarcodeCredential
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_100751580;
  v5[1] = &stru_1007515A0;
  v4[2] = @"d";
  v5[2] = &stru_1007515C0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (id)_barcodeCredentialsForQuery:(id)a3
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100440BC0;
  id v10 = &unk_100730E38;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v12;
  id v4 = v11;
  [v4 enumeratePersistentIDsUsingBlock:&v7];
  id v5 = objc_msgSend(v3, "copy", v7, v8, v9, v10);

  return v5;
}

@end