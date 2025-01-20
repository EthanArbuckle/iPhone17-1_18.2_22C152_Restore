@interface PhysicalCard
+ (id)_physicalCardsWithQuery:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForAccountPID:(int64_t)a3 physicalCardIdentifier:(id)a4;
+ (id)_predicateForPhysicalCardIdentifier:(id)a3;
+ (id)_predicateForPhysicalCardStatusUpdatePID:(int64_t)a3;
+ (id)_propertySettersForPhysicalCard;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePhysicalCard:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePhysicalCards:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertPhysicalCards:(id)a3 forPhysicalCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)physicalCardsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)physicalCardsForPhysicalCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)replacePhysicalCards:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePhysicalCardsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePhysicalCardsForPhysicalCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PhysicalCard)initWithPhysicalCard:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (PhysicalCard)initWithPhysicalCard:(id)a3 forPhysicalCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5;
- (id)physicalCard;
- (void)updateWithPhysicalCard:(id)a3;
@end

@implementation PhysicalCard

+ (id)databaseTable
{
  return @"blackberries";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"g";
  }
  return 0;
}

- (PhysicalCard)initWithPhysicalCard:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [v9 identifier];
  [v10 setObjectOrNull:v12 forKey:@"b"];

  v13 = [v9 accountUserAltDSID];
  [v10 setObjectOrNull:v13 forKey:@"k"];

  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 state]);
  [v10 setObjectOrNull:v14 forKey:@"c"];

  v15 = [v9 frontFaceImageURL];
  v16 = (void *)_SQLValueForURL();
  [v10 setObjectOrNull:v16 forKey:@"d"];

  v17 = [v9 nameOnCard];
  [v10 setObjectOrNull:v17 forKey:@"e"];

  v18 = [v9 lastUpdated];
  v19 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v19 forKey:@"f"];

  v20 = [v9 FPANSuffix];
  [v10 setObjectOrNull:v20 forKey:@"h"];

  v21 = [v9 trackingNumber];
  [v10 setObjectOrNull:v21 forKey:@"i"];

  v22 = [v9 shippingCompany];
  [v10 setObjectOrNull:v22 forKey:@"j"];

  v23 = [v9 activationCodeHash];
  [v10 setObjectOrNull:v23 forKey:@"activation_code_hash"];

  v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 expirationMonth]);
  [v10 setObjectOrNull:v24 forKey:@"expiration_month"];

  v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 expirationYear]);
  [v10 setObjectOrNull:v25 forKey:@"expiration_year"];

  v26 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  id v27 = [(SQLiteEntity *)v26 persistentID];
  v28 = [v9 orderActivity];

  id v29 = +[PhysicalCardOrderActivityEvent insertPhysicalCardOrderActivityEvents:v28 forPhysicalCardPID:v27 inDatabase:v8];
  return v26;
}

- (PhysicalCard)initWithPhysicalCard:(id)a3 forPhysicalCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"g"];

  v12 = [v9 identifier];
  [v10 setObjectOrNull:v12 forKey:@"b"];

  v13 = [v9 accountUserAltDSID];
  [v10 setObjectOrNull:v13 forKey:@"k"];

  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 state]);
  [v10 setObjectOrNull:v14 forKey:@"c"];

  v15 = [v9 frontFaceImageURL];
  v16 = (void *)_SQLValueForURL();
  [v10 setObjectOrNull:v16 forKey:@"d"];

  v17 = [v9 nameOnCard];
  [v10 setObjectOrNull:v17 forKey:@"e"];

  v18 = [v9 lastUpdated];
  v19 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v19 forKey:@"f"];

  v20 = [v9 FPANSuffix];
  [v10 setObjectOrNull:v20 forKey:@"h"];

  v21 = [v9 trackingNumber];
  [v10 setObjectOrNull:v21 forKey:@"i"];

  v22 = [v9 shippingCompany];
  [v10 setObjectOrNull:v22 forKey:@"j"];

  v23 = [v9 activationCodeHash];
  [v10 setObjectOrNull:v23 forKey:@"activation_code_hash"];

  v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 expirationMonth]);
  [v10 setObjectOrNull:v24 forKey:@"expiration_month"];

  id v25 = [v9 expirationYear];
  v26 = +[NSNumber numberWithUnsignedInteger:v25];
  [v10 setObjectOrNull:v26 forKey:@"expiration_year"];

  id v27 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v27;
}

+ (id)replacePhysicalCards:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 insertOrUpdatePhysicalCards:a3 forAccountPID:a4 inDatabase:v8];
  id v10 = objc_msgSend(v9, "pk_setByApplyingBlock:", &stru_10074E208);
  v11 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"b" values:v10];
  v18[0] = v11;
  v12 = [a1 _predicateForAccountPID:a4];
  v18[1] = v12;
  v13 = +[NSArray arrayWithObjects:v18 count:2];
  v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  v15 = [a1 queryWithDatabase:v8 predicate:v14];

  [v15 deleteAllEntities];
  id v16 = [v9 copy];

  return v16;
}

+ (id)insertOrUpdatePhysicalCards:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = objc_alloc_init((Class)NSMutableSet);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = objc_msgSend(a1, "insertOrUpdatePhysicalCard:forAccountPID:inDatabase:", *(void *)(*((void *)&v19 + 1) + 8 * i), a4, v9, (void)v19);
          if (v16) {
            [v10 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    id v17 = [v10 copy];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)insertOrUpdatePhysicalCard:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [v8 identifier];
    id v11 = [a1 _predicateForAccountPID:a4 physicalCardIdentifier:v10];
    id v12 = [a1 anyInDatabase:v9 predicate:v11];

    if (v12) {
      [v12 updateWithPhysicalCard:v8];
    }
    else {
      id v12 = [objc_alloc((Class)a1) initWithPhysicalCard:v8 forAccountPID:a4 inDatabase:v9];
    }
    id v13 = [v12 physicalCard];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)insertPhysicalCards:(id)a3 forPhysicalCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[NSMutableSet set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v16 = [PhysicalCard alloc];
        id v17 = -[PhysicalCard initWithPhysicalCard:forPhysicalCardStatusUpdatePID:inDatabase:](v16, "initWithPhysicalCard:forPhysicalCardStatusUpdatePID:inDatabase:", v15, a4, v8, (void)v20);
        if (v17) {
          [v9 addObject:v17];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  id v18 = [v9 copy];
  return v18;
}

- (void)updateWithPhysicalCard:(id)a3
{
  id v4 = a3;
  id v22 = +[NSMutableDictionary dictionary];
  v5 = [v4 identifier];
  [v22 setObjectOrNull:v5 forKey:@"b"];

  v6 = [v4 accountUserAltDSID];
  [v22 setObjectOrNull:v6 forKey:@"k"];

  id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 state]);
  [v22 setObjectOrNull:v7 forKey:@"c"];

  id v8 = [v4 frontFaceImageURL];
  id v9 = (void *)_SQLValueForURL();
  [v22 setObjectOrNull:v9 forKey:@"d"];

  id v10 = [v4 nameOnCard];
  [v22 setObjectOrNull:v10 forKey:@"e"];

  id v11 = [v4 lastUpdated];
  id v12 = (void *)_SQLValueForDate();
  [v22 setObjectOrNull:v12 forKey:@"f"];

  uint64_t v13 = [v4 FPANSuffix];
  [v22 setObjectOrNull:v13 forKey:@"h"];

  uint64_t v14 = [v4 trackingNumber];
  [v22 setObjectOrNull:v14 forKey:@"i"];

  uint64_t v15 = [v4 shippingCompany];
  [v22 setObjectOrNull:v15 forKey:@"j"];

  id v16 = [v4 activationCodeHash];
  [v22 setObjectOrNull:v16 forKey:@"activation_code_hash"];

  id v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 expirationMonth]);
  [v22 setObjectOrNull:v17 forKey:@"expiration_month"];

  id v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 expirationYear]);
  [v22 setObjectOrNull:v18 forKey:@"expiration_year"];

  int64_t v19 = [(SQLiteEntity *)self persistentID];
  long long v20 = [(SQLiteEntity *)self database];
  long long v21 = [v4 orderActivity];

  +[PhysicalCardOrderActivityEvent updateActivityEvents:v21 forPhysicalCardPID:v19 inDatabase:v20];
  [(SQLiteEntity *)self setValuesWithDictionary:v22];
}

+ (void)deletePhysicalCardsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deletePhysicalCardsForPhysicalCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPhysicalCardStatusUpdatePID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)self database];
  +[PhysicalCardOrderActivityEvent deleteActivityEventsForPhysicalCardPID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)PhysicalCard;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (id)physicalCardsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _physicalCardsWithQuery:v8];

  return v9;
}

+ (id)physicalCardsForPhysicalCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPhysicalCardStatusUpdatePID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _physicalCardsWithQuery:v8];

  return v9;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForAccountPID:(int64_t)a3 physicalCardIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountPID:a3];
  v12[0] = v7;
  id v8 = [a1 _predicateForPhysicalCardIdentifier:v6];

  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];

  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForPhysicalCardStatusUpdatePID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"g" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPhysicalCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

- (id)physicalCard
{
  id v3 = objc_alloc_init((Class)PKPhysicalCard);
  id v4 = [(id)objc_opt_class() _propertySettersForPhysicalCard];
  v5 = [v4 allKeys];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003B7990;
  v15[3] = &unk_10072DDD8;
  v15[4] = self;
  id v16 = v4;
  id v6 = v3;
  id v17 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v15];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  id v10 = +[PhysicalCardOrderActivityEvent physicalCardOrderActivityEventsForPhysicalCardPID:v8 inDatabase:v9];
  [v6 setOrderActivity:v10];

  id v11 = [v6 identifier];
  id v12 = +[AccountPhysicalCardShippingUpdate physicalCardShippingUpdatesForPhysicalCardWithIdentifier:v11 inDatabase:v9];

  [v6 setShippingActivity:v12];
  id v13 = v6;

  return v13;
}

+ (id)_physicalCardsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForPhysicalCard];
  id v6 = +[NSMutableSet set];
  id v7 = [v5 allKeys];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_1003B7B44;
  id v16 = &unk_10072DE00;
  id v20 = a1;
  id v17 = v5;
  id v18 = v4;
  id v8 = v6;
  id v19 = v8;
  id v9 = v4;
  id v10 = v5;
  [v9 enumeratePersistentIDsAndProperties:v7 usingBlock:&v13];

  if (objc_msgSend(v8, "count", v13, v14, v15, v16)) {
    id v11 = [v8 copy];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

+ (id)_propertySettersForPhysicalCard
{
  v4[0] = @"b";
  v4[1] = @"k";
  v5[0] = &stru_10074E248;
  v5[1] = &stru_10074E268;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_10074E288;
  v5[3] = &stru_10074E2A8;
  v4[4] = @"e";
  v4[5] = @"f";
  v5[4] = &stru_10074E2C8;
  v5[5] = &stru_10074E2E8;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_10074E308;
  v5[7] = &stru_10074E328;
  v4[8] = @"j";
  v4[9] = @"activation_code_hash";
  v5[8] = &stru_10074E348;
  v5[9] = &stru_10074E368;
  v4[10] = @"expiration_month";
  v4[11] = @"expiration_year";
  v5[10] = &stru_10074E388;
  v5[11] = &stru_10074E3A8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:12];
  return v2;
}

@end