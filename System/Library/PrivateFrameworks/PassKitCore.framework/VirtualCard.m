@interface VirtualCard
+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3;
+ (id)_predicateForVirtualCardIdentifier:(id)a3;
+ (id)_predicateForVirtualCardStatusUpdatePID:(int64_t)a3;
+ (id)_propertySettersForVirtualCard;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateVirtualCard:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateVirtualCards:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertVirtualCards:(id)a3 forVirtualCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)virtualCardForIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)virtualCardsForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)virtualCardsForVirtualCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteVirtualCardEncryptedDataForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteVirtualCardsForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteVirtualCardsForVirtualCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4;
- (VirtualCard)initWithVirtualCard:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (VirtualCard)initWithVirtualCard:(id)a3 forVirtualCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5;
- (id)virtualCard;
- (void)removeVirtualCardEncryptedData;
- (void)updateWithVirtualCard:(id)a3;
@end

@implementation VirtualCard

- (VirtualCard)initWithVirtualCard:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [v8 identifier];
  [v10 setObjectOrNull:v12 forKey:@"b"];

  v13 = [v8 cardholderName];
  [v10 setObjectOrNull:v13 forKey:@"c"];

  v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 state]);
  [v10 setObjectOrNull:v14 forKey:@"d"];

  v15 = [v8 FPANSuffix];
  [v10 setObjectOrNull:v15 forKey:@"e"];

  v16 = [v8 lastUpdatedDate];
  v17 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v17 forKey:@"f"];

  if ([v8 supportsLocalStorage])
  {
    v18 = [v8 encryptedData];
    v19 = [v18 base64EncodedStringWithOptions:0];
    [v10 setObjectOrNull:v19 forKey:@"g"];
  }
  else
  {
    [v10 setObjectOrNull:0 forKey:@"g"];
  }
  if ([v8 supportsLocalStorage])
  {
    v20 = [v8 ephemeralPublicKey];
    v21 = [v20 base64EncodedStringWithOptions:0];
    [v10 setObjectOrNull:v21 forKey:@"h"];
  }
  else
  {
    [v10 setObjectOrNull:0 forKey:@"h"];
  }
  v22 = [v8 expiration];
  [v10 setObjectOrNull:v22 forKey:@"i"];

  v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 type]);
  [v10 setObjectOrNull:v23 forKey:@"j"];

  v24 = [v8 lastAutoFilledBySafari];
  v25 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v25 forKey:@"l"];

  v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 supportsLocalStorage]);
  [v10 setObjectOrNull:v26 forKey:@"m"];

  v27 = [v8 securityCodeIdentifier];
  [v10 setObjectOrNull:v27 forKey:@"n"];

  v28 = [v8 securityCodeExpiration];
  v29 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v29 forKey:@"o"];

  v30 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 hasDynamicSecurityCode]);
  [v10 setObjectOrNull:v30 forKey:@"p"];

  v31 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v9];
  return v31;
}

+ (id)insertOrUpdateVirtualCard:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 identifier];
  id v11 = [a1 virtualCardForIdentifier:v10 inDatabase:v9];

  if (v11) {
    [v11 updateWithVirtualCard:v8];
  }
  else {
    id v11 = [objc_alloc((Class)a1) initWithVirtualCard:v8 forCreditAccountDetailsPID:a4 inDatabase:v9];
  }

  return v11;
}

+ (id)virtualCardForIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForVirtualCardIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)virtualCardsForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCreditAccountDetailsPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = +[NSMutableSet set];
  CFStringRef v21 = @"pid";
  v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100450E58;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertOrUpdateVirtualCards:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v36 = a5;
  v34 = +[NSMutableSet set];
  v33 = +[NSMutableSet set];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v32 = *(void *)v38;
    *(void *)&long long v9 = 138412290;
    long long v30 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "identifier", v30);
        v14 = [a1 _predicateForCreditAccountDetailsPID:a4];
        v44[0] = v14;
        v15 = [a1 _predicateForVirtualCardIdentifier:v13];
        v44[1] = v15;
        uint64_t v16 = +[NSArray arrayWithObjects:v44 count:2];
        v17 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v16];

        v18 = [a1 anyInDatabase:v36 predicate:v17];
        id v19 = PKLogFacilityTypeGetObject();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          if (v20)
          {
            *(_DWORD *)buf = v30;
            v43 = v13;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating virtual card with identifier: %@", buf, 0xCu);
          }

          [(VirtualCard *)v18 updateWithVirtualCard:v12];
        }
        else
        {
          if (v20)
          {
            *(_DWORD *)buf = v30;
            v43 = v13;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Inserting virtual card with identifier: %@", buf, 0xCu);
          }

          v18 = [[VirtualCard alloc] initWithVirtualCard:v12 forCreditAccountDetailsPID:a4 inDatabase:v36];
        }
        [v34 addObject:v13];
        CFStringRef v21 = [(VirtualCard *)v18 virtualCard];
        [v33 addObject:v21];
      }
      id v10 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v10);
  }

  v22 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Removing invalid leftover virtual cards for account", buf, 2u);
  }

  v23 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"b" values:v34];
  v41[0] = v23;
  v24 = [a1 _predicateForCreditAccountDetailsPID:a4];
  v41[1] = v24;
  v25 = +[NSArray arrayWithObjects:v41 count:2];
  v26 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v25];

  v27 = [a1 queryWithDatabase:v36 predicate:v26];
  [v27 deleteAllEntities];
  id v28 = [v33 copy];

  return v28;
}

- (void)updateWithVirtualCard:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  id v6 = [v4 identifier];
  [v5 setObjectOrNull:v6 forKey:@"b"];

  id v7 = [v4 cardholderName];
  [v5 setObjectOrNull:v7 forKey:@"c"];

  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 state]);
  [v5 setObjectOrNull:v8 forKey:@"d"];

  long long v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 type]);
  [v5 setObjectOrNull:v9 forKey:@"j"];

  id v10 = [v4 FPANSuffix];
  [v5 setObjectOrNull:v10 forKey:@"e"];

  id v11 = [v4 expiration];
  [v5 setObjectOrNull:v11 forKey:@"i"];

  id v12 = [v4 lastUpdatedDate];
  id v13 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v13 forKey:@"f"];

  v14 = [v4 lastAutoFilledBySafari];
  v15 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v15 forKey:@"l"];

  uint64_t v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 supportsLocalStorage]);
  [v5 setObjectOrNull:v16 forKey:@"m"];

  v17 = [v4 securityCodeIdentifier];
  [v5 setObjectOrNull:v17 forKey:@"n"];

  v18 = [v4 securityCodeExpiration];
  id v19 = (void *)_SQLValueForDate();
  [v5 setObjectOrNull:v19 forKey:@"o"];

  BOOL v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 hasDynamicSecurityCode]);
  [v5 setObjectOrNull:v20 forKey:@"p"];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1004517C0;
  v35[3] = &unk_10072E1E8;
  id v21 = v5;
  id v36 = v21;
  v22 = objc_retainBlock(v35);
  if ([v4 supportsLocalStorage])
  {
    uint64_t v23 = [v4 encryptedData];
    if (v23)
    {
      v24 = (void *)v23;
      v25 = [v4 ephemeralPublicKey];

      if (v25)
      {
        v26 = [v4 encryptedData];
        v27 = [v26 base64EncodedStringWithOptions:0];
        [v21 setObjectOrNull:v27 forKey:@"g"];

        id v28 = [v4 ephemeralPublicKey];
        v29 = [v28 base64EncodedStringWithOptions:0];
        [v21 setObjectOrNull:v29 forKey:@"h"];
      }
    }
  }
  else
  {
    ((void (*)(void *))v22[2])(v22);
  }
  long long v30 = [v4 lastUpdatedDate];
  v31 = [(SQLiteEntity *)self valueForProperty:@"f"];
  uint64_t v32 = (void *)_DateForSQLValue();

  if ([v32 compare:v30] == (id)-1) {
    ((void (*)(void *))v22[2])(v22);
  }
  v33 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = [(VirtualCard *)self virtualCard];
    *(_DWORD *)buf = 138412546;
    long long v38 = v34;
    __int16 v39 = 2112;
    id v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Updating old virtual card: %@\n with new virtual card: %@", buf, 0x16u);
  }
  [(SQLiteEntity *)self setValuesWithDictionary:v21];
}

- (void)removeVirtualCardEncryptedData
{
  v3 = +[NSMutableDictionary dictionary];
  [v3 setObjectOrNull:0 forKey:@"g"];
  [v3 setObjectOrNull:0 forKey:@"h"];
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing virtual card encrypted data from database", v5, 2u);
  }

  [(SQLiteEntity *)self setValuesWithDictionary:v3];
}

+ (void)deleteVirtualCardsForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForCreditAccountDetailsPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)deleteVirtualCardEncryptedDataForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004519F8;
  v5[3] = &unk_1007334D8;
  id v7 = a1;
  int64_t v8 = a3;
  id v6 = a4;
  id v4 = v6;
  sub_10000817C((uint64_t)v4, v5);
}

+ (id)databaseTable
{
  return @"raspberries";
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

+ (id)_predicateForVirtualCardIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForVirtualCardStatusUpdatePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"k" equalToValue:v3];

  return v4;
}

- (id)virtualCard
{
  id v3 = objc_alloc_init((Class)PKVirtualCard);
  id v4 = +[VirtualCard _propertySettersForVirtualCard];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100451D50;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  int64_t v8 = v13;
  id v9 = v6;

  return v9;
}

- (VirtualCard)initWithVirtualCard:(id)a3 forVirtualCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = +[NSMutableDictionary dictionary];
  id v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"k"];

  id v12 = [v9 identifier];
  [v10 setObjectOrNull:v12 forKey:@"b"];

  id v13 = [v9 cardholderName];
  [v10 setObjectOrNull:v13 forKey:@"c"];

  v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 state]);
  [v10 setObjectOrNull:v14 forKey:@"d"];

  v15 = [v9 FPANSuffix];
  [v10 setObjectOrNull:v15 forKey:@"e"];

  uint64_t v16 = [v9 lastUpdatedDate];
  v17 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v17 forKey:@"f"];

  v18 = [v9 encryptedData];
  id v19 = [v18 base64EncodedStringWithOptions:0];
  [v10 setObjectOrNull:v19 forKey:@"g"];

  BOOL v20 = [v9 ephemeralPublicKey];
  id v21 = [v20 base64EncodedStringWithOptions:0];
  [v10 setObjectOrNull:v21 forKey:@"h"];

  v22 = [v9 expiration];
  [v10 setObjectOrNull:v22 forKey:@"i"];

  uint64_t v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 type]);
  [v10 setObjectOrNull:v23 forKey:@"j"];

  v24 = [v9 lastAutoFilledBySafari];
  v25 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v25 forKey:@"l"];

  v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 supportsLocalStorage]);
  [v10 setObjectOrNull:v26 forKey:@"m"];

  v27 = [v9 securityCodeIdentifier];
  [v10 setObjectOrNull:v27 forKey:@"n"];

  id v28 = [v9 securityCodeExpiration];
  v29 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v29 forKey:@"o"];

  id v30 = [v9 hasDynamicSecurityCode];
  v31 = +[NSNumber numberWithBool:v30];
  [v10 setObjectOrNull:v31 forKey:@"p"];

  uint64_t v32 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v32;
}

+ (id)virtualCardsForVirtualCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForVirtualCardStatusUpdatePID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = +[NSMutableSet set];
  CFStringRef v21 = @"pid";
  id v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1004522BC;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)insertVirtualCards:(id)a3 forVirtualCardStatusUpdatePID:(int64_t)a4 inDatabase:(id)a5
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
        uint64_t v16 = [VirtualCard alloc];
        v17 = -[VirtualCard initWithVirtualCard:forVirtualCardStatusUpdatePID:inDatabase:](v16, "initWithVirtualCard:forVirtualCardStatusUpdatePID:inDatabase:", v15, a4, v8, (void)v20);
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

+ (void)deleteVirtualCardsForVirtualCardStatusUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForVirtualCardStatusUpdatePID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_propertySettersForVirtualCard
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_1007522A0;
  v5[1] = &stru_1007522C0;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_1007522E0;
  v5[3] = &stru_100752300;
  v4[4] = @"f";
  v4[5] = @"g";
  void v5[4] = &stru_100752320;
  v5[5] = &stru_100752340;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100752360;
  v5[7] = &stru_100752380;
  v4[8] = @"j";
  v4[9] = @"l";
  v5[8] = &stru_1007523A0;
  v5[9] = &stru_1007523C0;
  v4[10] = @"m";
  v4[11] = @"n";
  v5[10] = &stru_1007523E0;
  v5[11] = &stru_100752400;
  v4[12] = @"o";
  v4[13] = @"p";
  v5[12] = &stru_100752420;
  v5[13] = &stru_100752440;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:14];
  return v2;
}

@end