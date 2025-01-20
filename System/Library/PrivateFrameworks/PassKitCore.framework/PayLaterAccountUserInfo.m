@interface PayLaterAccountUserInfo
+ (id)_predicateForAccountDetailsPID:(int64_t)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterAccountUserInfo:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterAccountUserInfoForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterAccountUserInfoForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterAccountUserInfo)initWithPayLaterAccountUserInfo:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation PayLaterAccountUserInfo

+ (id)databaseTable
{
  return @"okra";
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

- (PayLaterAccountUserInfo)initWithPayLaterAccountUserInfo:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = +[NSNumber numberWithLongLong:a4];
  [v8 setObjectOrNull:v9 forKey:@"a"];

  v10 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v7];
  return v10;
}

+ (id)insertOrUpdatePayLaterAccountUserInfo:(id)a3 forAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _predicateForAccountDetailsPID:a4];
  id v11 = [a1 anyInDatabase:v9 predicate:v10];

  if (!v11) {
    id v11 = [objc_alloc((Class)objc_opt_class()) initWithPayLaterAccountUserInfo:v8 forAccountDetailsPID:a4 inDatabase:v9];
  }
  id v12 = [v11 persistentID];
  +[PayLaterAccountUserInfoValue deletePayLaterAccountUserInfoValueForUserInfoPID:v12 inDatabase:v9];
  v13 = [v8 emailAddress];
  v14 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v13 userInfoPID:v12 inDatabase:v9];

  v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v14 persistentID]);
  [v11 setValue:v15 forProperty:@"b"];

  v16 = [v8 firstName];
  v17 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v16 userInfoPID:v12 inDatabase:v9];

  v18 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v17 persistentID]);
  [v11 setValue:v18 forProperty:@"c"];

  v19 = [v8 lastName];
  v20 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v19 userInfoPID:v12 inDatabase:v9];

  v21 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v20 persistentID]);
  [v11 setValue:v21 forProperty:@"d"];

  v22 = [v8 dateOfBirth];
  v23 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v22 userInfoPID:v12 inDatabase:v9];

  v24 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v23 persistentID]);
  [v11 setValue:v24 forProperty:@"e"];

  v25 = [v8 phoneNumber];
  v26 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v25 userInfoPID:v12 inDatabase:v9];

  v27 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v26 persistentID]);
  [v11 setValue:v27 forProperty:@"f"];

  v28 = [v8 street1];
  v29 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v28 userInfoPID:v12 inDatabase:v9];

  v30 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v29 persistentID]);
  [v11 setValue:v30 forProperty:@"g"];

  v31 = [v8 street2];
  v32 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v31 userInfoPID:v12 inDatabase:v9];

  v33 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v32 persistentID]);
  [v11 setValue:v33 forProperty:@"h"];

  v34 = [v8 city];
  v35 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v34 userInfoPID:v12 inDatabase:v9];

  v36 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v35 persistentID]);
  [v11 setValue:v36 forProperty:@"i"];

  v37 = [v8 state];
  v38 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v37 userInfoPID:v12 inDatabase:v9];

  v39 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v38 persistentID]);
  [v11 setValue:v39 forProperty:@"j"];

  v40 = [v8 postalCode];
  v41 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v40 userInfoPID:v12 inDatabase:v9];

  v42 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v41 persistentID]);
  [v11 setValue:v42 forProperty:@"k"];

  v43 = [v8 ssn];
  v44 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v43 userInfoPID:v12 inDatabase:v9];

  v45 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v44 persistentID]);
  [v11 setValue:v45 forProperty:@"l"];

  v46 = [v8 yearlyIncome];
  v47 = +[PayLaterAccountUserInfoValue insertPayLaterAccountUserInfoValue:v46 userInfoPID:v12 inDatabase:v9];

  v48 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v47 persistentID]);
  [v11 setValue:v48 forProperty:@"m"];

  return v11;
}

+ (void)deletePayLaterAccountUserInfoForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)self database];
  +[PayLaterAccountUserInfoValue deletePayLaterAccountUserInfoValueForUserInfoPID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)PayLaterAccountUserInfo;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (id)payLaterAccountUserInfoForAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  if (v8)
  {
    id v9 = objc_alloc_init((Class)PKPayLaterAccountUserInfo);
    v10 = [v8 valueForProperty:@"b"];
    id v11 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v10 inDatabase:v6];

    [v9 setEmailAddress:v11];
    id v12 = [v8 valueForProperty:@"c"];
    v13 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v12 inDatabase:v6];

    [v9 setFirstName:v13];
    v14 = [v8 valueForProperty:@"d"];
    v15 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v14 inDatabase:v6];

    [v9 setLastName:v15];
    v16 = [v8 valueForProperty:@"e"];
    v17 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v16 inDatabase:v6];

    [v9 setDateOfBirth:v17];
    v18 = [v8 valueForProperty:@"f"];
    v19 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v18 inDatabase:v6];

    [v9 setPhoneNumber:v19];
    v20 = [v8 valueForProperty:@"g"];
    v21 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v20 inDatabase:v6];

    [v9 setStreet1:v21];
    v22 = [v8 valueForProperty:@"h"];
    v23 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v22 inDatabase:v6];

    [v9 setStreet2:v23];
    v24 = [v8 valueForProperty:@"i"];
    v25 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v24 inDatabase:v6];

    [v9 setCity:v25];
    v26 = [v8 valueForProperty:@"j"];
    v27 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v26 inDatabase:v6];

    [v9 setState:v27];
    v28 = [v8 valueForProperty:@"k"];
    v29 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v28 inDatabase:v6];

    [v9 setPostalCode:v29];
    v30 = [v8 valueForProperty:@"l"];
    v31 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v30 inDatabase:v6];

    [v9 setSsn:v31];
    v32 = [v8 valueForProperty:@"m"];
    v33 = +[PayLaterAccountUserInfoValue payLaterAccountUserInfoValueForPID:v32 inDatabase:v6];

    [v9 setYearlyIncome:v33];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)_predicateForAccountDetailsPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

@end