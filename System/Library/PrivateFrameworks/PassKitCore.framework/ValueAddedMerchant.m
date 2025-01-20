@interface ValueAddedMerchant
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPersistentID:(id)a3;
+ (id)_propertySettersForValueAddedMerchant;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4;
+ (id)anyInDatabase:(id)a3 withPersistentID:(id)a4;
+ (id)databaseTable;
+ (id)insertValueAddedMerchant:(id)a3 inDatabase:(id)a4;
- (ValueAddedMerchant)initWithValueAddedMerchant:(id)a3 inDatabase:(id)a4;
- (id)valueAddedMerchant;
- (void)updateWithValueAddedMerchant:(id)a3;
@end

@implementation ValueAddedMerchant

- (ValueAddedMerchant)initWithValueAddedMerchant:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSMutableDictionary dictionary];
  v9 = [v7 identifier];
  v10 = [v9 hexEncoding];

  [v8 setObjectOrNull:v10 forKey:@"identifier"];
  id v11 = [v7 timesPresented];

  [v8 setInteger:v11 forKey:@"times_presented"];
  v12 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];

  return v12;
}

+ (id)insertValueAddedMerchant:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithValueAddedMerchant:v7 inDatabase:v6];

  return v8;
}

- (void)updateWithValueAddedMerchant:(id)a3
{
  id v4 = a3;
  database = self->super._database;
  id v10 = v4;
  id v6 = [v4 identifier];
  id v7 = [v6 hexEncoding];
  id v8 = +[ValueAddedMerchant anyInDatabase:database withIdentifier:v7];

  if (v8)
  {
    v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 timesPresented]);
    [v8 setValue:v9 forProperty:@"times_presented"];
  }
}

+ (id)databaseTable
{
  return @"value_added_merchant";
}

+ (id)anyInDatabase:(id)a3 withPersistentID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPersistentID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForIdentifier:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)_predicateForPersistentID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

- (id)valueAddedMerchant
{
  id v3 = objc_alloc_init((Class)PKValueAddedMerchant);
  id v4 = +[ValueAddedMerchant _propertySettersForValueAddedMerchant];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003C5BC8;
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

+ (id)_propertySettersForValueAddedMerchant
{
  v4[0] = @"identifier";
  v4[1] = @"times_presented";
  v5[0] = &stru_10074EAB0;
  v5[1] = &stru_10074EAD0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end