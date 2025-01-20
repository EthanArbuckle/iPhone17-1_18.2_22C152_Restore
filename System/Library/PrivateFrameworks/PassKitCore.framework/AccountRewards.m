@interface AccountRewards
+ (id)_predicateForEventPID:(int64_t)a3;
+ (id)_propertySettersForAccountRewards;
+ (id)databaseTable;
+ (id)insertRewards:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)rewardsWithEventPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteRewardsWithEventPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)currencyAmount;
- (id)rewards;
@end

@implementation AccountRewards

+ (id)rewardsWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEventPID:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  v9 = +[NSMutableSet set];
  CFStringRef v21 = @"pid";
  v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_10008D888;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertRewards:(id)a3 forEventPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  id v11 = [v9 currencyAmount];
  id v12 = [v11 amount];
  id v13 = PKCurrencyDecimalToStorageNumber();

  v14 = [v9 identifier];
  [v10 setObjectOrNull:v14 forKey:@"b"];

  [v10 setObjectOrNull:v13 forKey:@"c"];
  v15 = [v9 currencyAmount];
  uint64_t v16 = [v15 currency];
  [v10 setObjectOrNull:v16 forKey:@"d"];

  v17 = [v9 status];
  [v10 setObjectOrNull:v17 forKey:@"f"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "type"), @"e");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "statusCode"), @"g");
  v18 = +[NSNumber numberWithLongLong:a4];
  [v10 setObject:v18 forKey:@"a"];

  id v19 = [objc_alloc((Class)a1) initWithPropertyValues:v10 inDatabase:v8];
  id v20 = [v19 persistentID];
  CFStringRef v21 = [v9 transactionIdentifiers];
  +[AccountRewardsIdentifier insertIdentifiers:v21 forAccountRewardsPID:v20 inDatabase:v8];

  v22 = [v9 rewardsAddedIdentifiers];
  +[AccountRewardsIdentifier insertIdentifiers:v22 forAccountRewardsPID:v20 inDatabase:v8];

  v23 = [v9 rewards];

  +[PaymentTransactionReward updatePaymentTransactionRewards:v23 forAccountRewardsPID:v20 inDatabase:v8];
  return v19;
}

- (id)rewards
{
  id v3 = objc_alloc_init((Class)PKAccountRewards);
  v4 = +[AccountRewards _propertySettersForAccountRewards];
  v5 = [v4 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008DD34;
  v13[3] = &unk_10072DDD8;
  id v14 = v4;
  id v6 = v3;
  id v15 = v6;
  uint64_t v16 = self;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v13];

  id v8 = +[AccountRewardsIdentifier identifiersWithAccountRewardsPID:self->super._persistentID inDatabase:self->super._database];
  [v6 setTransactionIdentifiers:v8];

  id v9 = +[AccountRewardsIdentifier identifiersWithAccountRewardsPID:self->super._persistentID inDatabase:self->super._database];
  [v6 setRewardsAddedIdentifiers:v9];

  v10 = +[PaymentTransactionReward paymentTransactionRewardsInDatabase:self->super._database forAccountRewardsPID:self->super._persistentID];
  [v6 setRewards:v10];

  id v11 = v6;
  return v11;
}

- (id)currencyAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"c"];
  v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  v5 = [(SQLiteEntity *)self valueForProperty:@"d"];
  if (v4)
  {
    id v6 = +[NSDecimalNumber notANumber];
    unsigned __int8 v7 = [v4 isEqualToNumber:v6];

    id v8 = 0;
    if ((v7 & 1) == 0 && v5) {
      id v8 = [objc_alloc((Class)PKCurrencyAmount) initWithAmount:v4 currency:v5 exponent:0];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (void)deleteRewardsWithEventPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = [a1 _predicateForEventPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  +[AccountRewardsIdentifier deleteIdentifiersWithAccountRewardsPID:self->super._persistentID inDatabase:self->super._database];
  +[AccountRewardsIdentifier deleteIdentifiersWithAccountRewardsPID:self->super._persistentID inDatabase:self->super._database];
  id v3 = [(SQLiteEntity *)self valueForProperty:@"b"];
  v4 = +[PaymentTransaction anyInDatabase:self->super._database withReferenceIdentifier:v3];
  v5 = v4;
  if (v4 && [v4 transactionType] != (id)14) {
    [v5 setValue:&off_10078AA88 forProperty:@"ac"];
  }
  v8.receiver = self;
  v8.super_class = (Class)AccountRewards;
  BOOL v6 = [(SQLiteEntity *)&v8 deleteFromDatabase];

  return v6;
}

+ (id)databaseTable
{
  return @"avocados";
}

+ (id)_predicateForEventPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForAccountRewards
{
  v4[0] = @"b";
  v4[1] = @"e";
  v5[0] = &stru_100732B40;
  v5[1] = &stru_100732B60;
  v4[2] = @"f";
  v4[3] = @"g";
  v5[2] = &stru_100732B80;
  v5[3] = &stru_100732BA0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end