@interface AppletSubcredentialInvitation
+ (BOOL)deleteInvitationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)_dictionaryFromSharedCredentialInvitation:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_propertySetters;
+ (id)addInvitation:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)invitationWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)invitationsInDatabase:(id)a3;
- (id)invitation;
@end

@implementation AppletSubcredentialInvitation

+ (id)invitationsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  v6 = [a1 queryWithDatabase:v4 predicate:v5];

  v7 = +[AppletSubcredentialInvitation _propertySetters];
  v8 = +[NSMutableSet set];
  v9 = [v7 allKeys];
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1004586BC;
  v17 = &unk_10072ED00;
  id v18 = v7;
  id v19 = v8;
  id v10 = v8;
  id v11 = v7;
  [v6 enumeratePersistentIDsAndProperties:v9 usingBlock:&v14];

  id v12 = objc_msgSend(v10, "copy", v14, v15, v16, v17);
  return v12;
}

+ (id)invitationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForIdentifier:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)addInvitation:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100020DF8;
  v21 = sub_1000211F0;
  id v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100458920;
  v12[3] = &unk_1007325B8;
  id v16 = a1;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v15 = &v17;
  sub_10000817C((uint64_t)v9, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

+ (BOOL)deleteInvitationWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  LOBYTE(v6) = [v8 deleteFromDatabase];
  return (char)v6;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_dictionaryFromSharedCredentialInvitation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"a"];

  id v6 = [v3 partnerIdentifier];
  [v4 setObjectOrNull:v6 forKey:@"b"];

  id v7 = [v3 brandIdentifier];
  [v4 setObjectOrNull:v7 forKey:@"l"];

  id v8 = [v3 pairedReaderIdentifier];
  [v4 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v3 recipientName];
  [v4 setObjectOrNull:v9 forKey:@"d"];

  id v10 = [v3 sharingSessionIdentifier];
  id v11 = v10;
  if (v10)
  {
    v21[0] = 0;
    v21[1] = 0;
    [v10 getUUIDBytes:v21];
    id v12 = +[NSData dataWithBytes:v21 length:16];
    [v4 setObjectOrNull:v12 forKey:@"e"];
  }
  else
  {
    id v12 = +[NSNull null];
    [v4 setObject:v12 forKey:@"e"];
  }

  id v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 entitlement]);
  [v4 setObjectOrNull:v13 forKey:@"f"];

  id v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isForWatch]);
  [v4 setObjectOrNull:v14 forKey:@"g"];

  uint64_t v15 = [v3 originatorIDSHandle];
  [v4 setObjectOrNull:v15 forKey:@"h"];

  id v16 = [v3 issuer];
  [v4 setObjectOrNull:v16 forKey:@"i"];

  uint64_t v17 = [v3 deviceModel];
  [v4 setObjectOrNull:v17 forKey:@"j"];

  id v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 supportedRadioTechnologies]);
  [v4 setObjectOrNull:v18 forKey:@"k"];

  id v19 = [v4 copy];
  return v19;
}

- (id)invitation
{
  id v3 = objc_alloc_init((Class)PKAppletSubcredentialSharingInvitation);
  id v4 = +[AppletSubcredentialInvitation _propertySetters];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100458E7C;
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

+ (id)_propertySetters
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_100752A30;
  v5[1] = &stru_100752A50;
  v4[2] = @"l";
  v4[3] = @"c";
  v5[2] = &stru_100752A70;
  v5[3] = &stru_100752A90;
  v4[4] = @"d";
  v4[5] = @"e";
  v5[4] = &stru_100752AB0;
  v5[5] = &stru_100752AD0;
  v4[6] = @"f";
  v4[7] = @"g";
  v5[6] = &stru_100752AF0;
  v5[7] = &stru_100752B10;
  v4[8] = @"h";
  v4[9] = @"i";
  v5[8] = &stru_100752B30;
  v5[9] = &stru_100752B50;
  v4[10] = @"j";
  v4[11] = @"k";
  v5[10] = &stru_100752B70;
  v5[11] = &stru_100752B90;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:12];
  return v2;
}

+ (id)databaseTable
{
  return @"palisades";
}

@end