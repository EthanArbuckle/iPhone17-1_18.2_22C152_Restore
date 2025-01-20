@interface PaymentMessage
+ (id)_paymentMessagesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForMessageDateNewerThanDate:(id)a3;
+ (id)_predicateForMessageType:(unint64_t)a3;
+ (id)_predicateForNonExpiredMessages;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentPass:(id)a3;
+ (id)_predicateForServiceIdentifier:(id)a3;
+ (id)_propertySettersForPaymentMessage;
+ (id)anyInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withServiceIdentifier:(id)a4 forPassWithUniqueIdentifier:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPaymentMessage:(id)a3 withPaymentPass:(id)a4 paymentApplication:(id)a5 inDatabase:(id)a6;
+ (id)messagesInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)paymentMessagesInDatabase:(id)a3 forPaymentPassUniqueIdentifier:(id)a4;
+ (unint64_t)numberOfPaymentMessagesInDatabase:(id)a3 forPassUniqueIdentifier:(id)a4 newerThanDate:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)archiveMessagesOfType:(unint64_t)a3 forPass:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5;
- (BOOL)isArchived;
- (PaymentMessage)initWithPaymentMessage:(id)a3 paymentPass:(id)a4 paymentApplication:(id)a5 inDatabase:(id)a6;
- (id)paymentMessage;
- (void)archive;
- (void)updateWithPaymentMessage:(id)a3;
@end

@implementation PaymentMessage

- (PaymentMessage)initWithPaymentMessage:(id)a3 paymentPass:(id)a4 paymentApplication:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[NSMutableDictionary dictionary];
  id v15 = [v12 persistentID];

  v16 = +[NSNumber numberWithLongLong:v15];
  [v14 setObjectOrNull:v16 forKey:@"pass_pid"];

  id v17 = [v11 persistentID];
  v18 = +[NSNumber numberWithLongLong:v17];
  [v14 setObjectOrNull:v18 forKey:@"payment_application_pid"];

  v19 = [v13 identifier];
  [v14 setObjectOrNull:v19 forKey:@"identifier"];

  v20 = [v13 serviceIdentifier];
  [v14 setObjectOrNull:v20 forKey:@"service_identifier"];

  v21 = [v13 content];
  [v14 setObjectOrNull:v21 forKey:@"content"];

  v22 = [v13 messageDate];
  [v14 setObjectOrNull:v22 forKey:@"message_date"];

  v23 = [v13 expirationDate];
  [v14 setObjectOrNull:v23 forKey:@"expiration_date"];

  objc_msgSend(v14, "setBool:forKey:", objc_msgSend(v13, "messageType") != 0, @"message_type");
  id v24 = [v13 allowDeepLink];

  [v14 setBool:v24 forKey:@"allow_deep_link"];
  [v14 setBool:0 forKey:@"archived"];
  v25 = [(SQLiteEntity *)self initWithPropertyValues:v14 inDatabase:v10];

  return v25;
}

+ (id)databaseTable
{
  return @"payment_message";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"payment_application_pid";
  }
  return 0;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  CFStringRef v9 = @"pass.unique_id";
  id v6 = a3;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];
  unsigned int v8 = objc_msgSend(v7, "containsObject:", v6, v9);

  if (v8) {
    [v5 addObject:@"JOIN pass ON pass.pid = payment_message.pass_pid"];
  }
}

+ (id)insertPaymentMessage:(id)a3 withPaymentPass:(id)a4 paymentApplication:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithPaymentMessage:v13 paymentPass:v12 paymentApplication:v11 inDatabase:v10];

  return v14;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentPass:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5
{
  id v8 = a4;
  CFStringRef v9 = [a1 _predicateForPaymentPass:a3];
  CFStringRef v18 = @"message_date";
  id v10 = +[NSArray arrayWithObjects:&v18 count:1];
  CFStringRef v17 = @"DESC";
  id v11 = +[NSArray arrayWithObjects:&v17 count:1];
  id v12 = [a1 queryWithDatabase:v8 predicate:v9 orderingProperties:v10 orderingDirections:v11];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10031D138;
  v14[3] = &unk_100748F08;
  id v15 = v8;
  int64_t v16 = a5;
  id v13 = v8;
  [v12 enumeratePersistentIDsUsingBlock:v14];
}

+ (void)archiveMessagesOfType:(unint64_t)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  CFStringRef v9 = [a1 _predicateForPaymentPass:a4];
  id v10 = [a1 _predicateForMessageType:a3];
  v17[0] = v9;
  v17[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v17 count:2];
  id v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

  id v13 = [a1 queryWithDatabase:v8 predicate:v12];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10031D338;
  v15[3] = &unk_100731020;
  id v16 = v8;
  id v14 = v8;
  [v13 enumeratePersistentIDsUsingBlock:v15];
}

+ (id)messagesInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForIdentifier:a4];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_10031D4B0;
  id v16 = &unk_100730E38;
  id v17 = v6;
  id v18 = objc_alloc_init((Class)NSMutableSet);
  id v9 = v18;
  id v10 = v6;
  [v8 enumeratePersistentIDsUsingBlock:&v13];
  id v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);

  return v11;
}

+ (id)anyInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPassWithUniqueIdentifier:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withServiceIdentifier:(id)a4 forPassWithUniqueIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 _predicateForPassWithUniqueIdentifier:a5];
  id v11 = [a1 _predicateForServiceIdentifier:v8];

  v16[0] = v10;
  v16[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v16 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  uint64_t v14 = [a1 anyInDatabase:v9 predicate:v13];

  return v14;
}

+ (id)paymentMessagesInDatabase:(id)a3 forPaymentPassUniqueIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPassWithUniqueIdentifier:a4];
  id v12 = v7;
  id v8 = +[NSArray arrayWithObjects:&v12 count:1];

  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];
  id v10 = [a1 _paymentMessagesInDatabase:v6 matchingPredicate:v9];

  return v10;
}

+ (unint64_t)numberOfPaymentMessagesInDatabase:(id)a3 forPassUniqueIdentifier:(id)a4 newerThanDate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _predicateForPassWithUniqueIdentifier:a4];
  v16[0] = v10;
  id v11 = [a1 _predicateForMessageDateNewerThanDate:v8];

  v16[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v16 count:2];

  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];
  id v14 = [a1 countInDatabase:v9 predicate:v13];

  return (unint64_t)v14;
}

- (void)updateWithPaymentMessage:(id)a3
{
  id v4 = a3;
  id v9 = +[NSMutableDictionary dictionary];
  id v5 = [v4 content];
  [v9 setObjectOrNull:v5 forKey:@"content"];

  id v6 = [v4 messageDate];
  [v9 setObjectOrNull:v6 forKey:@"message_date"];

  v7 = [v4 expirationDate];
  [v9 setObjectOrNull:v7 forKey:@"expiration_date"];

  objc_msgSend(v9, "setBool:forKey:", objc_msgSend(v4, "messageType") != 0, @"message_type");
  objc_msgSend(v9, "setBool:forKey:", objc_msgSend(v4, "allowDeepLink"), @"allow_deep_link");
  id v8 = [v4 isArchived];

  [v9 setBool:v8 forKey:@"archived"];
  [(SQLiteEntity *)self setValuesWithDictionary:v9];
}

- (void)archive
{
}

- (id)paymentMessage
{
  id v3 = objc_alloc_init((Class)PKPaymentMessage);
  id v4 = +[PaymentMessage _propertySettersForPaymentMessage];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10031DB1C;
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

- (BOOL)isArchived
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"archived"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

+ (id)_paymentMessagesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSMutableSet set];
  id v9 = [a1 _propertySettersForPaymentMessage];
  id v10 = +[SQLiteEntity queryWithDatabase:v7 predicate:v6];

  id v11 = [v9 allKeys];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  void v17[2] = sub_10031DCC0;
  v17[3] = &unk_10072EAD8;
  id v20 = a1;
  id v18 = v9;
  id v12 = v8;
  id v19 = v12;
  id v13 = v9;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];

  id v14 = v19;
  id v15 = v12;

  return v15;
}

+ (id)_predicateForPaymentPass:(id)a3
{
  unsigned __int8 v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForServiceIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"service_identifier" equalToValue:a3];
}

+ (id)_predicateForNonExpiredMessages
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"archived" equalToValue:&__kCFBooleanFalse];
}

+ (id)_predicateForMessageType:(unint64_t)a3
{
  unsigned __int8 v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"message_type" equalToValue:v3];

  return v4;
}

+ (id)_predicateForMessageDateNewerThanDate:(id)a3
{
  unsigned __int8 v3 = (void *)_SQLValueForDate();
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"message_date" greaterThanValue:v3];

  return v4;
}

+ (id)_propertySettersForPaymentMessage
{
  v4[0] = @"identifier";
  v4[1] = @"service_identifier";
  v5[0] = &stru_100748F48;
  v5[1] = &stru_100748F68;
  v4[2] = @"content";
  v4[3] = @"message_date";
  v5[2] = &stru_100748F88;
  v5[3] = &stru_100748FA8;
  v4[4] = @"expiration_date";
  v4[5] = @"message_type";
  v5[4] = &stru_100748FC8;
  v5[5] = &stru_100748FE8;
  v4[6] = @"allow_deep_link";
  v4[7] = @"archived";
  v5[6] = &stru_100749008;
  v5[7] = &stru_100749028;
  v4[8] = @"payment_application_pid";
  v5[8] = &stru_100749048;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  return v2;
}

@end