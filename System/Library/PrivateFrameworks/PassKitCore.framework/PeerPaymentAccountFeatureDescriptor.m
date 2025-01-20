@interface PeerPaymentAccountFeatureDescriptor
+ (BOOL)updateFeatureDescriptorsSupportedForPeerPaymentAccount:(id)a3 inDatabase:(id)a4;
+ (id)_peerPaymentAccountFeatureDescriptorsWithQuery:(id)a3;
+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3;
+ (id)_propertySettersForPeerPaymentAccountFeatureDescriptor;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)featureDescriptorsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertFeatureDescriptors:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteFeatureDescriptorsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (PeerPaymentAccountFeatureDescriptor)initWithFeatureDescriptor:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)peerPaymentAccountFeatureDescriptor;
@end

@implementation PeerPaymentAccountFeatureDescriptor

+ (id)databaseTable
{
  return @"peer_payment_account_feature_descriptor";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"peer_payment_account_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertFeatureDescriptors:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[NSMutableSet set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v17 = objc_alloc((Class)a1);
        id v18 = objc_msgSend(v17, "initWithFeatureDescriptor:forPeerPaymentAccountPID:inDatabase:", v16, a4, v9, (void)v21);
        if (v18) {
          [v10 addObject:v18];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  id v19 = [v10 copy];
  return v19;
}

+ (void)deleteFeatureDescriptorsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPeerPaymentAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)featureDescriptorsForPeerPaymentAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPeerPaymentAccountPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _peerPaymentAccountFeatureDescriptorsWithQuery:v8];

  return v9;
}

- (PeerPaymentAccountFeatureDescriptor)initWithFeatureDescriptor:(id)a3 forPeerPaymentAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v37 = a5;
  id v8 = +[NSMutableDictionary dictionary];
  id v9 = +[NSNumber numberWithLongLong:a4];
  [v8 setObjectOrNull:v9 forKey:@"peer_payment_account_pid"];

  v10 = [v7 identifier];
  [v8 setObjectOrNull:v10 forKey:@"identifier"];

  id v11 = [v7 minimumAmount];
  id v12 = PKCurrencyDecimalToStorageNumber();
  [v8 setObjectOrNull:v12 forKey:@"minimum_amount"];

  id v13 = [v7 maximumAmount];
  uint64_t v14 = PKCurrencyDecimalToStorageNumber();
  [v8 setObjectOrNull:v14 forKey:@"maximum_amount"];

  v15 = [v7 supportedNetworks];
  uint64_t v16 = [v15 componentsJoinedByString:@","];
  [v8 setObjectOrNull:v16 forKey:@"supported_networks"];

  id v17 = [v7 amountSuggestions];
  if (v17)
  {
    id v18 = +[NSKeyedArchiver archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
  }
  else
  {
    id v18 = 0;
  }
  [v8 setObjectOrNull:v18 forKey:@"a"];
  id v19 = [v7 thresholdSuggestions];
  if (v19)
  {
    v20 = +[NSKeyedArchiver archivedDataWithRootObject:v19 requiringSecureCoding:1 error:0];
  }
  else
  {
    v20 = 0;
  }
  [v8 setObjectOrNull:v20 forKey:@"b"];
  long long v21 = [v7 frequencyOptions];
  if (v21)
  {
    long long v22 = +[NSKeyedArchiver archivedDataWithRootObject:v21 requiringSecureCoding:1 error:0];
  }
  else
  {
    long long v22 = 0;
  }
  [v8 setObjectOrNull:v22 forKey:@"c"];
  long long v23 = [v7 productTimeZone];
  long long v24 = [v23 name];
  [v8 setObjectOrNull:v24 forKey:@"d"];

  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "maximumPayments"), @"e");
  objc_msgSend(v8, "setInteger:forKey:", objc_msgSend(v7, "endProcessingHour"), @"f");
  [v7 proactiveFetchPeriod];
  objc_msgSend(v8, "setDouble:forKey:", @"g");
  v25 = [v7 merchantIdentifier];
  [v8 setObjectOrNull:v25 forKey:@"merchant_identifier"];

  v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 merchantCapabilities]);
  [v8 setObjectOrNull:v26 forKey:@"merchant_capabilities"];

  v27 = [v7 feePercentage];
  v28 = PKCurrencyDecimalToStorageNumber();
  [v8 setObjectOrNull:v28 forKey:@"fee_percentage"];

  v29 = [v7 minimumFee];
  v30 = PKCurrencyDecimalToStorageNumber();
  [v8 setObjectOrNull:v30 forKey:@"minimum_fee"];

  v31 = [v7 maximumFee];
  v32 = PKCurrencyDecimalToStorageNumber();
  [v8 setObjectOrNull:v32 forKey:@"maximum_fee"];

  v33 = [v7 osVersionRange];
  v34 = (void *)_SQLValueForOSVersionRequirementRange();
  [v8 setObjectOrNull:v34 forKey:@"os_version_requirement_range"];

  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v7, "isSupported"), @"h");
  v35 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v37];

  return v35;
}

+ (BOOL)updateFeatureDescriptorsSupportedForPeerPaymentAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(a1, "_predicateForPeerPaymentAccountPID:", objc_msgSend(v6, "persistentID"));
  if (v8)
  {
    id v9 = [a1 queryWithDatabase:v7 predicate:v8];
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10041CA10;
    v12[3] = &unk_100749300;
    id v13 = v7;
    uint64_t v14 = &v15;
    [v9 enumeratePersistentIDsUsingBlock:v12];
    BOOL v10 = *((unsigned char *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)_predicateForPeerPaymentAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"peer_payment_account_pid" equalToValue:v3];

  return v4;
}

- (id)peerPaymentAccountFeatureDescriptor
{
  id v3 = objc_alloc_init((Class)PKPeerPaymentAccountFeatureDescriptor);
  v4 = [(id)objc_opt_class() _propertySettersForPeerPaymentAccountFeatureDescriptor];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10041CC50;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_peerPaymentAccountFeatureDescriptorsWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForPeerPaymentAccountFeatureDescriptor];
  id v6 = +[NSMutableSet set];
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10041CDDC;
  v12[3] = &unk_10072EAD8;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = [v8 copy];
  return v10;
}

+ (id)_propertySettersForPeerPaymentAccountFeatureDescriptor
{
  v4[0] = @"identifier";
  v4[1] = @"minimum_amount";
  v5[0] = &stru_10074FF90;
  v5[1] = &stru_10074FFB0;
  v4[2] = @"maximum_amount";
  v4[3] = @"supported_networks";
  v5[2] = &stru_10074FFD0;
  v5[3] = &stru_10074FFF0;
  v4[4] = @"a";
  v4[5] = @"b";
  v5[4] = &stru_100750010;
  v5[5] = &stru_100750030;
  v4[6] = @"c";
  v4[7] = @"d";
  v5[6] = &stru_100750050;
  v5[7] = &stru_100750070;
  v4[8] = @"e";
  v4[9] = @"f";
  v5[8] = &stru_100750090;
  v5[9] = &stru_1007500B0;
  v4[10] = @"g";
  v4[11] = @"merchant_identifier";
  v5[10] = &stru_1007500D0;
  v5[11] = &stru_1007500F0;
  v4[12] = @"merchant_capabilities";
  v4[13] = @"fee_percentage";
  v5[12] = &stru_100750110;
  v5[13] = &stru_100750130;
  v4[14] = @"minimum_fee";
  v4[15] = @"maximum_fee";
  v5[14] = &stru_100750150;
  v5[15] = &stru_100750170;
  v4[16] = @"os_version_requirement_range";
  v4[17] = @"h";
  v5[16] = &stru_100750190;
  v5[17] = &stru_1007501B0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:18];
  return v2;
}

@end