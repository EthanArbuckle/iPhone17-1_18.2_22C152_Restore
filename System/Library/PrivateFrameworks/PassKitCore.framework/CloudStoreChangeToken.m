@interface CloudStoreChangeToken
+ (id)_predicateForZoneName:(id)a3;
+ (id)_propertyValuesForChangeToken:(id)a3 inZoneWithName:(id)a4;
+ (id)changeTokenForZoneWithName:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)saveChangeToken:(id)a3 forZoneWithName:(id)a4 inDatabase:(id)a5;
- (void)updateWithChangeToken:(id)a3 forZoneName:(id)a4;
@end

@implementation CloudStoreChangeToken

+ (id)databaseTable
{
  return @"cloud_store_token";
}

+ (void)saveChangeToken:(id)a3 forZoneWithName:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Deleting token for zone %{public}@", (uint8_t *)&v18, 0xCu);
    }

    v12 = [a1 _predicateForZoneName:v9];
    v16 = [a1 anyInDatabase:v10 predicate:v12];
    [v16 deleteFromDatabase];
    goto LABEL_12;
  }
  v11 = [a1 _predicateForZoneName:v9];
  v12 = [a1 anyInDatabase:v10 predicate:v11];

  v13 = PKLogFacilityTypeGetObject();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v14)
    {
      int v18 = 138412546;
      id v19 = v8;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Inserting new token %@ for zone %{public}@", (uint8_t *)&v18, 0x16u);
    }

    id v17 = objc_alloc((Class)a1);
    v16 = [a1 _propertyValuesForChangeToken:v8 inZoneWithName:v9];

LABEL_12:
    goto LABEL_13;
  }
  if (v14)
  {
    int v18 = 138412546;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating token %@ for zone %{public}@", (uint8_t *)&v18, 0x16u);
  }

  [v12 updateWithChangeToken:v8 forZoneName:v9];
LABEL_13:
}

+ (id)changeTokenForZoneWithName:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForZoneName:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  if (v8)
  {
    id v9 = [v8 valueForProperty:@"token_data"];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)updateWithChangeToken:(id)a3 forZoneName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() _propertyValuesForChangeToken:v7 inZoneWithName:v6];

  [(SQLiteEntity *)self setValuesWithDictionary:v8];
}

+ (id)_propertyValuesForChangeToken:(id)a3 inZoneWithName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 setObjectOrNull:v6 forKey:@"token_data"];

  [v7 setObjectOrNull:v5 forKey:@"zone_name"];
  id v8 = [v7 copy];

  return v8;
}

+ (id)_predicateForZoneName:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"zone_name" equalToValue:a3];
}

@end