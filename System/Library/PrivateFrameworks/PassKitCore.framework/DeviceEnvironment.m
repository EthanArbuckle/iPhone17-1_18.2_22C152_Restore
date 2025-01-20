@interface DeviceEnvironment
+ (id)_predicateForDeviceEnvironmentWithClientIdentifier:(id)a3;
+ (id)_propertySettersForDeviceEnvironment;
+ (id)databaseTable;
+ (id)environmentForClient:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateEnvironment:(id)a3 forClient:(int64_t)a4 inDatabase:(id)a5;
- (DeviceEnvironment)initWithClientIdentifier:(id)a3 countryCode:(id)a4 deviceLanguage:(id)a5 database:(id)a6;
@end

@implementation DeviceEnvironment

+ (id)databaseTable
{
  return @"device_environment";
}

+ (id)environmentForClient:(int64_t)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v23 = 0;
  id v6 = 0;
  if (PKDeviceEnvironmentClientToString())
  {
    v7 = [a1 _propertySettersForDeviceEnvironment];
    v8 = [a1 _predicateForDeviceEnvironmentWithClientIdentifier:v23];
    v9 = +[SQLiteEntity queryWithDatabase:v5 predicate:v8];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = sub_100020C8C;
    v21 = sub_100021138;
    id v22 = 0;
    v10 = [v7 allKeys];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10037D504;
    v13[3] = &unk_100734F50;
    v15 = &v17;
    id v16 = a1;
    id v11 = v7;
    id v14 = v11;
    [v9 enumeratePersistentIDsAndProperties:v10 usingBlock:v13];

    id v6 = (id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  return v6;
}

+ (id)insertOrUpdateEnvironment:(id)a3 forClient:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100020C8C;
  id v23 = sub_100021138;
  id v24 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10037D6EC;
  v13[3] = &unk_10073AFF8;
  int64_t v17 = a4;
  id v18 = a1;
  id v16 = &v19;
  id v9 = a5;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  sub_10000817C((uint64_t)v9, v13);
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (DeviceEnvironment)initWithClientIdentifier:(id)a3 countryCode:(id)a4 deviceLanguage:(id)a5 database:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setObject:v13 forKeyedSubscript:@"client_identifier"];

  [v14 setObject:v12 forKeyedSubscript:@"country_code"];
  [v14 setObject:v11 forKeyedSubscript:@"device_language"];

  id v15 = [(SQLiteEntity *)self initWithPropertyValues:v14 inDatabase:v10];
  return v15;
}

+ (id)_propertySettersForDeviceEnvironment
{
  v4[0] = @"country_code";
  v4[1] = @"device_language";
  v5[0] = &stru_10074C0A0;
  v5[1] = &stru_10074C0C0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

+ (id)_predicateForDeviceEnvironmentWithClientIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"client_identifier" equalToValue:a3];
}

@end