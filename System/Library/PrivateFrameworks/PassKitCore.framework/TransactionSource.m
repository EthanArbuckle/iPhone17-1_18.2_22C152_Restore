@interface TransactionSource
+ (id)_predicateForAccountPersistentID:(int64_t)a3;
+ (id)_predicateForAccountUserPersistentID:(int64_t)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPIDs:(id)a3;
+ (id)_predicateForPaymentApplicationPersistentID:(int64_t)a3;
+ (id)_predicateForPeerPaymentAccountPersistentID:(int64_t)a3;
+ (id)_predicateForPersistentID:(int64_t)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4;
+ (id)databaseTable;
+ (id)insertTransactionSourceWithType:(unint64_t)a3 inDatabase:(id)a4;
+ (id)transactionSourceIdentifiersInDatabase:(id)a3 ofType:(unint64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)associateTransactionSourcesToPaymentTransactions:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forAccount:(id)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forAccountUser:(id)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4;
+ (void)deleteEntitiesInDatabase:(id)a3 forPeerPaymentAccount:(id)a4;
+ (void)updateTransactionSourceIdentifier:(id)a3 toNewTransactionSourceIdentifier:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (TransactionSource)initWithTransactionSourceType:(unint64_t)a3 inDatabase:(id)a4;
- (id)_commonDictionary;
- (id)identifier;
- (unint64_t)type;
@end

@implementation TransactionSource

+ (id)databaseTable
{
  return @"transaction_source";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v19 = v7;
  if (v7 == @"payment_application.pid") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_6;
  }
  unsigned __int8 v8 = [@"payment_application.pid" isEqualToString:v7];

  if (v8)
  {
LABEL_4:
    CFStringRef v9 = @"JOIN payment_application ON payment_application.transaction_source_pid = transaction_source.pid";
LABEL_5:
    [v6 addObject:v9];
    goto LABEL_6;
  }
  v10 = v19;
  if (v10 == @"peer_payment_account.pid"
    || (v11 = v10,
        unsigned __int8 v12 = [@"peer_payment_account.pid" isEqualToString:v10],
        v11,
        (v12 & 1) != 0))
  {
    CFStringRef v9 = @"JOIN peer_payment_account ON peer_payment_account.transaction_source_pid = transaction_source.pid";
    goto LABEL_5;
  }
  v13 = v11;
  if (v13 == @"gooseberry.pid"
    || (v14 = v13,
        unsigned __int8 v15 = [@"gooseberry.pid" isEqualToString:v13],
        v14,
        (v15 & 1) != 0))
  {
    CFStringRef v9 = @"JOIN gooseberry ON gooseberry.transaction_source_pid = transaction_source.pid";
    goto LABEL_5;
  }
  v16 = v14;
  if (v16 == @"pears.pid"
    || (v17 = v16, unsigned int v18 = [@"pears.pid" isEqualToString:v16], v17, v18))
  {
    CFStringRef v9 = @"JOIN pears ON pears.transaction_source_pid = transaction_source.pid";
    goto LABEL_5;
  }
LABEL_6:
}

- (TransactionSource)initWithTransactionSourceType:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [(TransactionSource *)self _commonDictionary];
  unsigned __int8 v8 = +[NSNumber numberWithUnsignedInteger:a3];
  [v7 setObjectOrNull:v8 forKey:@"type"];

  CFStringRef v9 = [(SQLiteEntity *)self initWithPropertyValues:v7 inDatabase:v6];
  return v9;
}

+ (id)insertTransactionSourceWithType:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithTransactionSourceType:a3 inDatabase:v6];

  return v7;
}

- (id)_commonDictionary
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = +[NSUUID UUID];
  v4 = [v3 UUIDString];

  [v2 setObjectOrNull:v4 forKey:@"identifier"];
  return v2;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForIdentifier:a4];
  unsigned __int8 v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPersistentID:a4];
  unsigned __int8 v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)transactionSourceIdentifiersInDatabase:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForType:a4];
  unsigned __int8 v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v16 = @"identifier";
  v10 = +[NSArray arrayWithObjects:&v16 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008C3F4;
  v14[3] = &unk_100731258;
  id v15 = v9;
  id v11 = v9;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:v14];

  id v12 = [v11 copy];
  return v12;
}

+ (void)associateTransactionSourcesToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v6 allKeys];
  id v9 = [a1 _predicateForPIDs:v8];
  v10 = +[SQLiteEntity queryWithDatabase:v7 predicate:v9];

  CFStringRef v17 = @"identifier";
  id v11 = +[NSArray arrayWithObjects:&v17 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008C5EC;
  v14[3] = &unk_10072ED00;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v14];
}

+ (void)updateTransactionSourceIdentifier:(id)a3 toNewTransactionSourceIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 anyInDatabase:v10 withIdentifier:v8];
  id v12 = [a1 anyInDatabase:v10 withIdentifier:v9];
  if (!v8 || !v9)
  {
    CFStringRef v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138413058;
      id v22 = v9;
      __int16 v23 = 2112;
      v24 = v12;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      v28 = v11;
      unsigned int v18 = "A transaction source does not exist for newTransactionSourceIdentifier %@, %@ or oldTransactionSourceIdentifier %@, %@";
      v19 = v17;
      uint32_t v20 = 42;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, v20);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  id v13 = [v11 type];
  if (v13 != [v12 type])
  {
    CFStringRef v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      unsigned int v18 = "The new and old transaction source types do not match";
LABEL_14:
      v19 = v17;
      uint32_t v20 = 2;
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  id v14 = v9;
  if (v8 == v14)
  {

LABEL_12:
    CFStringRef v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      unsigned int v18 = "The new and old transaction source identifiers match, no need to migrate.";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  id v15 = v14;
  unsigned int v16 = [v8 isEqualToString:v14];

  if (v16) {
    goto LABEL_12;
  }
  +[PaymentTransaction updateTransactionsWithTransactionSource:v11 toTransactionSource:v12 inDatabase:v10];
LABEL_17:
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  objc_msgSend(a1, "_predicateForPaymentApplicationPersistentID:", objc_msgSend(a4, "persistentID"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPeerPaymentAccount:(id)a4
{
  id v6 = a3;
  objc_msgSend(a1, "_predicateForPeerPaymentAccountPersistentID:", objc_msgSend(a4, "persistentID"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesInDatabase:(id)a3 forAccountUser:(id)a4
{
  id v6 = a3;
  objc_msgSend(a1, "_predicateForAccountUserPersistentID:", objc_msgSend(a4, "persistentID"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesInDatabase:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  objc_msgSend(a1, "_predicateForAccountPersistentID:", objc_msgSend(a4, "persistentID"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = [(SQLiteEntity *)self database];
  +[PaymentTransaction deleteEntitiesForTransactionSource:self inDatabase:v3];

  int64_t v4 = [(SQLiteEntity *)self persistentID];
  id v5 = [(SQLiteEntity *)self database];
  +[CloudStoreRecordFetchTask deleteAllEntriesForTransactionSourcePID:v4 inDatabase:v5];

  v7.receiver = self;
  v7.super_class = (Class)TransactionSource;
  return [(SQLiteEntity *)&v7 deleteFromDatabase];
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  int64_t v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPaymentApplicationPersistentID:(int64_t)a3
{
  int64_t v4 = +[NSNumber numberWithLongLong:a3];
  id v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_application.pid" equalToValue:v4];
  v10[0] = v5;
  id v6 = [a1 _predicateForType:0];
  v10[1] = v6;
  objc_super v7 = +[NSArray arrayWithObjects:v10 count:2];

  id v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  return v8;
}

+ (id)_predicateForPeerPaymentAccountPersistentID:(int64_t)a3
{
  int64_t v4 = +[NSNumber numberWithLongLong:a3];
  id v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"peer_payment_account.pid" equalToValue:v4];
  v10[0] = v5;
  id v6 = [a1 _predicateForType:1];
  v10[1] = v6;
  objc_super v7 = +[NSArray arrayWithObjects:v10 count:2];

  id v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  return v8;
}

+ (id)_predicateForAccountUserPersistentID:(int64_t)a3
{
  int64_t v4 = +[NSNumber numberWithLongLong:a3];
  id v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"gooseberry.pid" equalToValue:v4];
  v10[0] = v5;
  id v6 = [a1 _predicateForType:2];
  v10[1] = v6;
  objc_super v7 = +[NSArray arrayWithObjects:v10 count:2];

  id v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  return v8;
}

+ (id)_predicateForAccountPersistentID:(int64_t)a3
{
  int64_t v4 = +[NSNumber numberWithLongLong:a3];
  id v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"pears.pid" equalToValue:v4];
  v10[0] = v5;
  id v6 = [a1 _predicateForType:3];
  v10[1] = v6;
  objc_super v7 = +[NSArray arrayWithObjects:v10 count:2];

  id v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  return v8;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForPersistentID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  int64_t v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"pid" values:a3];
}

- (id)identifier
{
  return [(SQLiteEntity *)self valueForProperty:@"identifier"];
}

- (unint64_t)type
{
  id v2 = [(SQLiteEntity *)self valueForProperty:@"type"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

@end