@interface PaymentTransactionArchive
+ (id)_archivesForQuery:(id)a3;
+ (id)_predicateForCloudStoreZonePID:(int64_t)a3;
+ (id)_predicateForCounterpartImageDataIdentifier:(id)a3;
+ (id)_predicateForCounterpartImageDataPID:(int64_t)a3;
+ (id)_predicateForIsArchived:(BOOL)a3;
+ (id)_predicateForLocationType:(unint64_t)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForPIDs:(id)a3;
+ (id)_predicateForRecurringPaymentIdentifier:(id)a3;
+ (id)_predicateForRecurringPaymentPID:(int64_t)a3;
+ (id)_predicateForTransactionIdentifier:(id)a3;
+ (id)_predicateForTransactionPID:(int64_t)a3;
+ (id)_propertySettersForTransactionArchive;
+ (id)anyInDatabase:(id)a3 forCounterpartImageDataIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 forRecurringPaymentIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 forTransaction:(id)a4;
+ (id)anyInDatabase:(id)a3 forTransactionIdentifier:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertArchiveForCounterpartImageData:(id)a3 inDatabase:(id)a4;
+ (id)insertArchiveForRecurringPayment:(id)a3 inDatabase:(id)a4;
+ (id)insertTransactionArchiveForTransaction:(id)a3 inDatabase:(id)a4;
+ (id)transactionArchivesWithCloudStoreZone:(id)a3 isArchived:(BOOL)a4 inDatabase:(id)a5;
+ (id)transactionArchivesWithType:(unint64_t)a3 isArchived:(BOOL)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteArchiveForCounterpartImageDataPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteArchiveForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteArchiveForRecurringPaymentPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PaymentTransactionArchive)initWithCounterpartImageData:(id)a3 inDatabase:(id)a4;
- (PaymentTransactionArchive)initWithRecurringPayment:(id)a3 inDatabase:(id)a4;
- (PaymentTransactionArchive)initWithTransaction:(id)a3 inDatabase:(id)a4;
- (id)transactionArchive;
- (void)updateWithTransactionArchive:(id)a3;
@end

@implementation PaymentTransactionArchive

+ (id)databaseTable
{
  return @"payment_transaction_archive";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"payment_transaction_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"bokchoy_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"cumin_pid";
  }
  return 0;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v25 = v7;
  if (v7 == @"payment_transaction.identifier") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_6;
  }
  unsigned __int8 v8 = [(__CFString *)v7 isEqualToString:@"payment_transaction.identifier"];

  if (v8)
  {
LABEL_4:
    CFStringRef v9 = @"JOIN payment_transaction ON payment_transaction.pid = payment_transaction_archive.payment_transaction_pid";
LABEL_5:
    [v6 addObject:v9];
    goto LABEL_6;
  }
  v10 = v25;
  if (v10 == @"bokchoy.a"
    || (v11 = v10,
        unsigned __int8 v12 = [(__CFString *)v10 isEqualToString:@"bokchoy.a"],
        v11,
        (v12 & 1) != 0))
  {
    CFStringRef v9 = @"JOIN bokchoy ON bokchoy.pid = payment_transaction_archive.bokchoy_pid";
    goto LABEL_5;
  }
  v13 = v11;
  if (v13 == @"cumin.b"
    || (v14 = v13,
        unsigned __int8 v15 = [(__CFString *)v13 isEqualToString:@"cumin.b"],
        v14,
        (v15 & 1) != 0))
  {
    CFStringRef v9 = @"JOIN cumin ON cumin.pid = payment_transaction_archive.cumin_pid";
    goto LABEL_5;
  }
  v16 = v14;
  if (v16 == @"payment_transaction_archive_location.cloud_store_zone_pid") {
    goto LABEL_21;
  }
  v17 = v16;
  unsigned __int8 v18 = [@"payment_transaction_archive_location.cloud_store_zone_pid" isEqualToString:v16];

  if (v18) {
    goto LABEL_21;
  }
  v19 = v17;
  if (v19 == @"payment_transaction_archive_location.archived"
    || (v20 = v19,
        unsigned __int8 v21 = [@"payment_transaction_archive_location.archived" isEqualToString:v19], v20, (v21 & 1) != 0)|| (v22 = v20, v22 == @"payment_transaction_archive_location.type")|| (v23 = v22, v24 = objc_msgSend(@"payment_transaction_archive_location.type", "isEqualToString:", v22), v23, v24))
  {
LABEL_21:
    CFStringRef v9 = @"JOIN payment_transaction_archive_location ON payment_transaction_archive_location.archive_pid = payment_transaction_archive.pid";
    goto LABEL_5;
  }
LABEL_6:
}

+ (id)insertTransactionArchiveForTransaction:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithTransaction:v6 inDatabase:v5];

  return v7;
}

- (PaymentTransactionArchive)initWithTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = [v7 persistentID];

  v10 = +[NSNumber numberWithLongLong:v9];
  [v8 setObjectOrNull:v10 forKey:@"payment_transaction_pid"];

  id v11 = [v8 copy];
  unsigned __int8 v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v6];

  v13 = v12;
  return v13;
}

+ (id)insertArchiveForRecurringPayment:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithRecurringPayment:v6 inDatabase:v5];

  return v7;
}

- (PaymentTransactionArchive)initWithRecurringPayment:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = [v7 persistentID];

  v10 = +[NSNumber numberWithLongLong:v9];
  [v8 setObjectOrNull:v10 forKey:@"bokchoy_pid"];

  id v11 = [v8 copy];
  unsigned __int8 v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v6];

  v13 = v12;
  return v13;
}

+ (id)insertArchiveForCounterpartImageData:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithCounterpartImageData:v6 inDatabase:v5];

  return v7;
}

- (PaymentTransactionArchive)initWithCounterpartImageData:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = [v7 persistentID];

  v10 = +[NSNumber numberWithLongLong:v9];
  [v8 setObjectOrNull:v10 forKey:@"cumin_pid"];

  id v11 = [v8 copy];
  unsigned __int8 v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v6];

  v13 = v12;
  return v13;
}

- (void)updateWithTransactionArchive:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int64_t v5 = [(SQLiteEntity *)self persistentID];
    id v6 = [(SQLiteEntity *)self database];
    +[PaymentTransactionArchiveLocation deleteArchiveLocationsForArchivePID:v5 inDatabase:v6];

    id v10 = [v4 locations];

    int64_t v7 = [(SQLiteEntity *)self persistentID];
    id v8 = [(SQLiteEntity *)self database];
    id v9 = +[PaymentTransactionArchiveLocation insertOrUpdateTransactionArchiveLocations:v10 forArchivePID:v7 inDatabase:v8];
  }
}

+ (id)_predicateForTransactionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForTransactionIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction.identifier" equalToValue:a3];
}

+ (id)_predicateForRecurringPaymentIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"bokchoy.a" equalToValue:a3];
}

+ (id)_predicateForRecurringPaymentPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"bokchoy_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForCounterpartImageDataIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"cumin.b" equalToValue:a3];
}

+ (id)_predicateForCounterpartImageDataPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"cumin_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForCloudStoreZonePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction_archive_location.cloud_store_zone_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForIsArchived:(BOOL)a3
{
  v3 = +[NSNumber numberWithBool:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction_archive_location.archived" equalToValue:v3];

  return v4;
}

+ (id)_predicateForLocationType:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction_archive_location.type" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"pid" values:a3];
}

+ (void)deleteArchiveForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPID:a3];
  int64_t v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteArchiveForRecurringPaymentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForRecurringPaymentPID:a3];
  int64_t v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteArchiveForCounterpartImageDataPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForCounterpartImageDataPID:a3];
  int64_t v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)self database];
  +[PaymentTransactionArchiveLocation deleteArchiveLocationsForArchivePID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)PaymentTransactionArchive;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (id)anyInDatabase:(id)a3 forTransaction:(id)a4
{
  id v6 = a3;
  int64_t v7 = objc_msgSend(a1, "_predicateForTransactionPID:", objc_msgSend(a4, "persistentID"));
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 forTransactionIdentifier:(id)a4
{
  id v6 = a3;
  int64_t v7 = [a1 _predicateForTransactionIdentifier:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 forRecurringPaymentIdentifier:(id)a4
{
  id v6 = a3;
  int64_t v7 = [a1 _predicateForRecurringPaymentIdentifier:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 forCounterpartImageDataIdentifier:(id)a4
{
  id v6 = a3;
  int64_t v7 = [a1 _predicateForCounterpartImageDataIdentifier:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)transactionArchivesWithType:(unint64_t)a3 isArchived:(BOOL)a4 inDatabase:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = +[NSString stringWithFormat:@"SELECT DISTINCT payment_transaction_archive.pid FROM payment_transaction_archive, payment_transaction_archive_location WHERE payment_transaction_archive.pid = payment_transaction_archive_location.archive_pid AND type = %ld AND archived = %ld", a3, v5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10034A054;
  v14[3] = &unk_10073AA38;
  id v16 = objc_alloc_init((Class)NSMutableSet);
  id v17 = a1;
  id v15 = v8;
  id v10 = v16;
  id v11 = v8;
  sub_100012DC8((uint64_t)v11, v9, v14);
  id v12 = [v10 copy];

  return v12;
}

+ (id)transactionArchivesWithCloudStoreZone:(id)a3 isArchived:(BOOL)a4 inDatabase:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = +[CloudStoreZone anyInDatabase:v9 forCloudStoreZone:v8];
  id v11 = v10;
  if (v10)
  {
    id v12 = objc_msgSend(a1, "_predicateForCloudStoreZonePID:", objc_msgSend(v10, "persistentID"));
    v21[0] = v12;
    v13 = [a1 _predicateForLocationType:0];
    v21[1] = v13;
    v14 = [a1 _predicateForIsArchived:v6];
    v21[2] = v14;
    id v15 = +[NSArray arrayWithObjects:v21 count:3];
    id v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

    id v17 = [a1 queryWithDatabase:v9 predicate:v16];
    unsigned __int8 v18 = [a1 _archivesForQuery:v17];
  }
  else
  {
    id v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v8 zoneName];
      *(_DWORD *)buf = 138543362;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Error: no cloud store in local database for %{public}@", buf, 0xCu);
    }
    unsigned __int8 v18 = 0;
  }

  return v18;
}

- (id)transactionArchive
{
  id v3 = objc_alloc_init((Class)PKPaymentTransactionArchive);
  id v4 = +[PaymentTransactionArchive _propertySettersForTransactionArchive];
  CFStringRef v30 = @"payment_transaction.identifier";
  BOOL v5 = +[NSArray arrayWithObjects:&v30 count:1];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10034A630;
  v25[3] = &unk_10072DDD8;
  v25[4] = self;
  id v6 = v4;
  id v26 = v6;
  id v7 = v3;
  id v27 = v7;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v25];

  id v8 = [v7 identifier];
  id v9 = [v8 length];

  if (!v9)
  {
    CFStringRef v29 = @"bokchoy.a";
    id v10 = +[NSArray arrayWithObjects:&v29 count:1];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10034A69C;
    v22[3] = &unk_10072DDD8;
    v22[4] = self;
    id v23 = v6;
    id v24 = v7;
    [(SQLiteEntity *)self getValuesForProperties:v10 withApplier:v22];
  }
  id v11 = [v7 identifier];
  id v12 = [v11 length];

  if (!v12)
  {
    CFStringRef v28 = @"cumin.b";
    v13 = +[NSArray arrayWithObjects:&v28 count:1];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10034A708;
    v19[3] = &unk_10072DDD8;
    v19[4] = self;
    id v20 = v6;
    id v21 = v7;
    [(SQLiteEntity *)self getValuesForProperties:v13 withApplier:v19];
  }
  int64_t v14 = [(SQLiteEntity *)self persistentID];
  id v15 = [(SQLiteEntity *)self database];
  id v16 = +[PaymentTransactionArchiveLocation transactionArchiveLocationsForArchivePID:v14 inDatabase:v15];

  [v7 setLocations:v16];
  id v17 = v7;

  return v17;
}

+ (id)_archivesForQuery:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034A870;
  v7[3] = &unk_10072EAD8;
  id v10 = a1;
  id v8 = a3;
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v9 = v3;
  id v4 = v8;
  [v4 enumeratePersistentIDsAndProperties:0 usingBlock:v7];
  if ([v3 count]) {
    id v5 = [v3 copy];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)_propertySettersForTransactionArchive
{
  v4[0] = @"payment_transaction.identifier";
  v4[1] = @"bokchoy.a";
  v5[0] = &stru_10074A160;
  v5[1] = &stru_10074A180;
  v4[2] = @"cumin.b";
  v5[2] = &stru_10074A1A0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end