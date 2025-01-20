@interface TransactionReleasedData
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_propertySettersForReleasedData;
+ (id)databaseTable;
+ (id)releasedDataForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertReleasedData:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)releasedData;
@end

@implementation TransactionReleasedData

+ (id)databaseTable
{
  return @"honey";
}

+ (void)insertReleasedData:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [a1 deleteEntitiesForPaymentTransactionPID:a4 inDatabase:v8];
  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = +[NSNumber numberWithLongLong:a4];
  [v19 setObject:v10 forKey:@"a"];

  v11 = [v9 documentType];
  [v19 setObjectOrNull:v11 forKey:@"document_type"];

  v12 = [v9 privacyPolicyURL];
  v13 = (void *)_SQLValueForURL();
  [v19 setObjectOrNull:v13 forKey:@"b"];

  v14 = [v9 certificateData];
  [v19 setObjectOrNull:v14 forKey:@"c"];

  v15 = [v9 merchantNameOverride];
  [v19 setObjectOrNull:v15 forKey:@"d"];

  id v16 = [objc_alloc((Class)a1) initWithPropertyValues:v19 inDatabase:v8];
  v17 = [v9 elements];
  +[TransactionReleasedDataElement insertReleasedDataElements:forPID:inDatabase:](TransactionReleasedDataElement, "insertReleasedDataElements:forPID:inDatabase:", v17, [v16 persistentID], v8);

  v18 = [v9 application];

  +[TransactionReleasedDataApplication insertReleasedDataApplication:forPID:inDatabase:](TransactionReleasedDataApplication, "insertReleasedDataApplication:forPID:inDatabase:", v18, [v16 persistentID], v8);
}

+ (id)releasedDataForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPaymentTransactionPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 releasedData];

  return v9;
}

- (id)releasedData
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"document_type"];
  if (v3)
  {
    id v4 = [objc_alloc((Class)PKTransactionReleasedData) initWithDocumentType:v3];
    v5 = [(id)objc_opt_class() _propertySettersForReleasedData];
    id v6 = [v5 allKeys];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100028D64;
    v15[3] = &unk_10072DDD8;
    v15[4] = self;
    id v16 = v5;
    id v7 = v4;
    id v17 = v7;
    id v8 = v5;
    [(SQLiteEntity *)self getValuesForProperties:v6 withApplier:v15];

    int64_t v9 = [(SQLiteEntity *)self persistentID];
    v10 = [(SQLiteEntity *)self database];
    v11 = +[TransactionReleasedDataElement releasedDataElementsForPID:v9 inDatabase:v10];
    [v7 setElements:v11];
    v12 = +[TransactionReleasedDataApplication releasedDataElementsForPID:v9 inDatabase:v10];
    [v7 setApplication:v12];
    id v13 = v7;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPaymentTransactionPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  +[TransactionReleasedDataElement deleteEntitiesForPID:inDatabase:](TransactionReleasedDataElement, "deleteEntitiesForPID:inDatabase:", [v8 persistentID], v6);
  +[TransactionReleasedDataApplication deleteEntitiesForPID:inDatabase:](TransactionReleasedDataApplication, "deleteEntitiesForPID:inDatabase:", [v8 persistentID], v6);

  [v8 deleteFromDatabase];
}

+ (id)_propertySettersForReleasedData
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10072E388;
  v5[1] = &stru_10072E3A8;
  v4[2] = @"d";
  v5[2] = &stru_10072E3C8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

@end