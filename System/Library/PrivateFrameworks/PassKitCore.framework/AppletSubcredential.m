@interface AppletSubcredential
+ (id)_predicateForAppletSubcredentialIdentifier:(id)a3;
+ (id)_predicateForAppletSubcredentialPID:(int64_t)a3;
+ (id)_predicateForAppletSubcredentialWithPairedReaderIdentifier:(id)a3;
+ (id)_predicateForAppletSubcredentialWithPaymentApplicationPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)appletSubcredentialWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)appletSubcredentialWithPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)appletSubcredentialsInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4;
+ (id)appletSubcredentialsWithPairedReaderIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)credentialIdentifiersForAidInDatabase:(id)a3;
+ (id)databaseTable;
+ (id)dictionaryFromAppletSubcredential:(id)a3 paymentApplication:(id)a4;
+ (id)insertOrUpdateAppletSubcredential:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (id)setAppletSubcredentials:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4;
- (AppletSubcredential)initWithAppletSubcredential:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)appletSubcredential;
- (int64_t)paymentApplicationPID;
- (void)updateAliroGroupResolvingKeys:(id)a3;
- (void)updateWithAppletSubcredential:(id)a3 paymentApplication:(id)a4;
@end

@implementation AppletSubcredential

+ (id)databaseTable
{
  return @"whitney";
}

+ (id)appletSubcredentialsInDatabase:(id)a3 forPaymentApplicationPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForAppletSubcredentialWithPaymentApplicationPID:a4];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];
  v9 = +[NSMutableSet set];
  CFStringRef v21 = @"pid";
  v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1003520DC;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)_predicateForAppletSubcredentialWithPaymentApplicationPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)credentialIdentifiersForAidInDatabase:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100351FEC;
  v6[3] = &unk_10074A7A0;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = v4;
  sub_1000128B8((uint64_t)v3, @"select payment_application.aid, whitney.b from whitney join payment_application on payment_application.pid == whitney.a", 1, v6);

  return v4;
}

+ (id)appletSubcredentialWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAppletSubcredentialIdentifier:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)appletSubcredentialsWithPairedReaderIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAppletSubcredentialWithPairedReaderIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];
  id v9 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v21 = @"pid";
  v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100352354;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)appletSubcredentialWithPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAppletSubcredentialPID:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (void)deleteEntitiesInDatabase:(id)a3 forPaymentApplication:(id)a4
{
  id v6 = a3;
  objc_msgSend(a1, "_predicateForAppletSubcredentialWithPaymentApplicationPID:", objc_msgSend(a4, "persistentID"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)insertOrUpdateAppletSubcredential:(id)a3 withPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 identifier];
  id v12 = [a1 appletSubcredentialWithIdentifier:v11 inDatabase:v10];

  if (v12)
  {
    if (![v8 allSupportedRadioTechnologies])
    {
      id v13 = [v12 appletSubcredential];
      id v14 = [v13 allSupportedRadioTechnologies];

      [v8 setAllSupportedRadioTechnologies:v14];
    }
    if (![v8 supportedRadioTechnologies])
    {
      v15 = [v12 appletSubcredential];
      id v16 = [v15 supportedRadioTechnologies];

      [v8 setSupportedRadioTechnologies:v16];
    }
    [v12 updateWithAppletSubcredential:v8 paymentApplication:v9];
  }
  else
  {
    id v12 = [objc_alloc((Class)a1) initWithAppletSubcredential:v8 forPaymentApplication:v9 inDatabase:v10];
  }

  return v12;
}

+ (id)setAppletSubcredentials:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100352738;
  v17[3] = &unk_1007361E8;
  id v21 = objc_alloc_init((Class)NSMutableSet);
  id v22 = a1;
  id v18 = v10;
  id v19 = v9;
  id v20 = v8;
  id v11 = v21;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  sub_10000817C((uint64_t)v14, v17);
  id v15 = [v11 copy];

  return v15;
}

- (AppletSubcredential)initWithAppletSubcredential:(id)a3 forPaymentApplication:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[AppletSubcredential dictionaryFromAppletSubcredential:v8 paymentApplication:v9];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100020BAC;
  v30 = sub_1000210C8;
  id v31 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100352B14;
  v19[3] = &unk_10074A7C8;
  v25 = &v26;
  id v12 = self;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  id v14 = v10;
  id v22 = v14;
  id v15 = v8;
  id v23 = v15;
  id v16 = v9;
  id v24 = v16;
  sub_10000817C((uint64_t)v14, v19);
  v17 = (AppletSubcredential *)(id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

+ (id)dictionaryFromAppletSubcredential:(id)a3 paymentApplication:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = [v5 sharingConfiguration];
  if ([v5 isShareable])
  {
    uint64_t v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 maxNumberOfSharedCredentials]);
    uint64_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 numberOfShareableCredentials]);
    uint64_t v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 sharingRequiresPassword]);
    id v12 = [v8 activationOptions];
    id v13 = [v12 identifiers];

    if (v6)
    {
LABEL_3:
      uint64_t v14 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 persistentID]);
      goto LABEL_6;
    }
  }
  else
  {
    id v13 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = +[NSNull null];
LABEL_6:
  v41 = v6;
  v36 = (void *)v14;
  [v7 setObjectOrNull:v14 forKey:@"a"];
  id v15 = [v5 identifier];
  [v7 setObjectOrNull:v15 forKey:@"b"];

  id v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 state]);
  [v7 setObjectOrNull:v16 forKey:@"c"];

  [v7 setObjectOrNull:v9 forKey:@"d"];
  [v7 setObjectOrNull:v11 forKey:@"h"];
  v17 = [v13 componentsJoinedByString:@","];
  [v7 setObjectOrNull:v17 forKey:@"o"];

  [v7 setObjectOrNull:v10 forKey:@"k"];
  id v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 supportedRadioTechnologies]);
  [v7 setObjectOrNull:v18 forKey:@"l"];

  id v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isOnlineImmobilizerToken]);
  [v7 setObjectOrNull:v19 forKey:@"n"];

  id v20 = [v5 partnerIdentifier];
  if (v20) {
    [v7 setObjectOrNull:v20 forKey:@"e"];
  }
  v40 = v8;
  id v21 = [v5 pairedReaderIdentifier];
  if (v21) {
    [v7 setObjectOrNull:v21 forKey:@"f"];
  }
  v39 = (void *)v9;
  id v22 = [v5 brandIdentifier];
  if (v22) {
    [v7 setObjectOrNull:v22 forKey:@"p"];
  }
  v38 = (void *)v10;
  id v23 = [v5 endpointIdentifier];
  if (v23) {
    [v7 setObjectOrNull:v23 forKey:@"g"];
  }
  v37 = v13;
  id v24 = [v5 sharingSessionIdentifier];
  v25 = v24;
  if (v24)
  {
    v42[0] = 0;
    v42[1] = 0;
    [v24 getUUIDBytes:v42];
    uint64_t v26 = +[NSData dataWithBytes:v42 length:16];
    [v7 setObjectOrNull:v26 forKey:@"i"];
  }
  v27 = (void *)v11;
  uint64_t v28 = [v5 originatorIDSHandle];
  if (v28) {
    [v7 setObjectOrNull:v28 forKey:@"j"];
  }
  v29 = [v5 isoFormat];
  [v7 setObjectOrNull:v29 forKey:@"m"];

  v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 allSupportedRadioTechnologies]);
  [v7 setObjectOrNull:v30 forKey:@"q"];

  [v5 carKeyVehicleVersion];
  id v31 = PKAppletSubcredentialCarKeyVehicleVersionToString();
  [v7 setObject:v31 forKey:@"r"];

  [v5 carKeyServerVersion];
  v32 = PKAppletSubcredentialCarKeyServerVersionToString();
  [v7 setObject:v32 forKey:@"s"];

  [v5 keyClass];
  v33 = PKAppletSubcredentialKeyClassToString();
  [v7 setObjectOrNull:v33 forKey:@"t"];

  [v5 credentialAuthorityType];
  v34 = PKAppletSubcredentialCredentialAuthorityTypeToString();
  [v7 setObjectOrNull:v34 forKey:@"u"];

  return v7;
}

- (void)updateWithAppletSubcredential:(id)a3 paymentApplication:(id)a4
{
  id v6 = a3;
  id v8 = +[AppletSubcredential dictionaryFromAppletSubcredential:v6 paymentApplication:a4];
  [(SQLiteEntity *)self setValuesWithDictionary:v8];
  id v7 = [v6 aliroGroupResolvingKeys];

  [(AppletSubcredential *)self updateAliroGroupResolvingKeys:v7];
}

- (void)updateAliroGroupResolvingKeys:(id)a3
{
  id v4 = a3;
  [(SQLiteEntity *)self database];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003532CC;
  v7[3] = &unk_100733610;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  sub_10000817C((uint64_t)v6, v7);
}

- (id)appletSubcredential
{
  id v3 = objc_alloc_init((Class)PKAppletSubcredential);
  id v4 = objc_alloc_init((Class)PKAppletSubcredentialSharingConfirguration);
  [v3 setSharingConfiguration:v4];
  id v5 = +[AppletSubcredential _propertySetters];
  id v6 = [v5 allKeys];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_10035350C;
  id v18 = &unk_10072EDD0;
  id v19 = v5;
  id v7 = v3;
  id v20 = v7;
  id v8 = v5;
  [(SQLiteEntity *)self getValuesForProperties:v6 withApplier:&v15];

  uint64_t v9 = objc_msgSend(v7, "identifier", v15, v16, v17, v18);
  id v10 = +[PassEntitlement passEntitlementsForSubcredentialIdentifier:v9 inDatabase:self->super._database];

  uint64_t v11 = objc_msgSend(v10, "pk_firstObjectPassingTest:", &stru_10074A808);
  [v7 setEntitlement:v11];

  id v12 = +[AppletSubcredentialAliroGroupResolvingKey aliroGroupResolvingKeysInDatabase:self->super._database forAppletSubcredentialPID:[(SQLiteEntity *)self persistentID]];
  [v7 setAliroGroupResolvingKeys:v12];
  id v13 = v7;

  return v13;
}

- (int64_t)paymentApplicationPID
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"a"];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  id v3 = [(SQLiteEntity *)self database];
  id v4 = [(SQLiteEntity *)v2 persistentID];
  id v5 = [(SQLiteEntity *)[PaymentApplication alloc] initWithPersistentID:[(AppletSubcredential *)v2 paymentApplicationPID] inDatabase:v3];
  +[AppletSubcredentialRangingSuspensionReasons deleteRangingSuspensionReasonsForCredential:v2 forPaymentApplication:v5 inDatabase:v3];

  +[AppletSubcredentialAliroGroupResolvingKey deleteEntitiesInDatabase:v3 forAppletSubcredentialPID:v4];
  v7.receiver = v2;
  v7.super_class = (Class)AppletSubcredential;
  LOBYTE(v2) = [(SQLiteEntity *)&v7 deleteFromDatabase];

  return (char)v2;
}

+ (id)_predicateForAppletSubcredentialPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForAppletSubcredentialIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_predicateForAppletSubcredentialWithPairedReaderIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"f" equalToValue:a3];
}

+ (id)_propertySetters
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10074A848;
  v5[1] = &stru_10074A868;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_10074A888;
  v5[3] = &stru_10074A8A8;
  v4[4] = @"f";
  v4[5] = @"p";
  v5[4] = &stru_10074A8C8;
  v5[5] = &stru_10074A8E8;
  v4[6] = @"g";
  v4[7] = @"h";
  v5[6] = &stru_10074A908;
  v5[7] = &stru_10074A928;
  v4[8] = @"i";
  v4[9] = @"j";
  v5[8] = &stru_10074A948;
  v5[9] = &stru_10074A968;
  v4[10] = @"k";
  v4[11] = @"l";
  v5[10] = &stru_10074A988;
  v5[11] = &stru_10074A9A8;
  v4[12] = @"m";
  v4[13] = @"n";
  v5[12] = &stru_10074A9C8;
  v5[13] = &stru_10074A9E8;
  v4[14] = @"o";
  v4[15] = @"q";
  v5[14] = &stru_10074AA08;
  v5[15] = &stru_10074AA28;
  v4[16] = @"r";
  v4[17] = @"s";
  v5[16] = &stru_10074AA48;
  v5[17] = &stru_10074AA68;
  v4[18] = @"t";
  v4[19] = @"u";
  v5[18] = &stru_10074AA88;
  v5[19] = &stru_10074AAA8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:20];
  return v2;
}

@end