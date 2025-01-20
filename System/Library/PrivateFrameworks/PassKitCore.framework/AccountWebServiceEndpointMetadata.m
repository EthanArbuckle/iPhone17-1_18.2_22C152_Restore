@interface AccountWebServiceEndpointMetadata
+ (id)_predicateFoEndpoint:(unint64_t)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForAccountPID:(int64_t)a3 endpoint:(unint64_t)a4;
+ (id)_propertySettersForAccountEndpointMetadata;
+ (id)_propertyValuesForAccountEndpointMetadata:(id)a3;
+ (id)anyInDatabase:(id)a3 accountIdentifier:(id)a4 endpoint:(unint64_t)a5;
+ (id)anyInDatabase:(id)a3 endpointMetadata:(id)a4;
+ (id)anyInDatabase:(id)a3 withAccountPID:(int64_t)a4 endpoint:(unint64_t)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateinitWithAccountEndpointMetadata:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountWebServiceEndpointMetadata)initWithAccountEndpointMetadata:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (id)endpointMetadata;
- (void)updateWithAccountEndpointMetadata:(id)a3;
@end

@implementation AccountWebServiceEndpointMetadata

+ (id)databaseTable
{
  return @"salmonberry";
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

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"pears.a"
    || v7
    && (unsigned int v8 = [(__CFString *)v7 isEqualToString:@"pears.a"], v9, v8))
  {
    [v6 addObject:@"JOIN pears ON pears.pid = salmonberry.a"];
  }
}

- (AccountWebServiceEndpointMetadata)initWithAccountEndpointMetadata:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForAccountEndpointMetadata:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

+ (id)insertOrUpdateinitWithAccountEndpointMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  id v9 = +[Account anyInDatabase:v7 withIdentifier:v8];

  if (v9)
  {
    id v10 = [v9 persistentID];
    v11 = objc_msgSend(a1, "anyInDatabase:withAccountPID:endpoint:", v7, v10, objc_msgSend(v6, "endpoint"));
    if (v11)
    {
      id v12 = v11;
      [v11 updateWithAccountEndpointMetadata:v6];
    }
    else
    {
      id v12 = [objc_alloc((Class)a1) initWithAccountEndpointMetadata:v6 accountPID:v10 inDatabase:v7];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)updateWithAccountEndpointMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForAccountEndpointMetadata:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)anyInDatabase:(id)a3 endpointMetadata:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 accountIdentifier];
  id v9 = [v6 endpoint];

  id v10 = [a1 anyInDatabase:v7 accountIdentifier:v8 endpoint:v9];

  return v10;
}

+ (id)anyInDatabase:(id)a3 accountIdentifier:(id)a4 endpoint:(unint64_t)a5
{
  id v8 = a3;
  id v9 = +[Account anyInDatabase:v8 withIdentifier:a4];
  id v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(a1, "anyInDatabase:withAccountPID:endpoint:", v8, objc_msgSend(v9, "persistentID"), a5);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)anyInDatabase:(id)a3 withAccountPID:(int64_t)a4 endpoint:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [a1 _predicateForAccountPID:a4 endpoint:a5];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (void)deleteEntitiesForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = [(SQLiteEntity *)self database];
  +[PayLaterFinancingPlan deletePayLaterFinancingPlansForAccountEndpointMetadataPID:[(SQLiteEntity *)v2 persistentID] inDatabase:v3];
  v5.receiver = v2;
  v5.super_class = (Class)AccountWebServiceEndpointMetadata;
  LOBYTE(v2) = [(SQLiteEntity *)&v5 deleteFromDatabase];

  return (char)v2;
}

+ (id)_predicateForAccountPID:(int64_t)a3 endpoint:(unint64_t)a4
{
  id v6 = [a1 _predicateForAccountPID:a3];
  v11[0] = v6;
  id v7 = [a1 _predicateFoEndpoint:a4];
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateFoEndpoint:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:v3];

  return v4;
}

- (id)endpointMetadata
{
  v3 = objc_alloc_init(PDAccountWebServiceEndpointMetadata);
  id v4 = [(id)objc_opt_class() _propertySettersForAccountEndpointMetadata];
  objc_super v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_1003BC420;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_propertyValuesForAccountEndpointMetadata:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  objc_super v5 = [v3 lastUpdated];
  id v6 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v6 forKey:@"b"];

  id v7 = [v3 localLastUpdated];
  id v8 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v8 forKey:@"e"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "isDirty"), @"c");
  id v9 = [v3 endpoint];

  [v4 setInteger:v9 forKey:@"d"];
  return v4;
}

+ (id)_propertySettersForAccountEndpointMetadata
{
  v4[0] = @"b";
  v4[1] = @"e";
  v5[0] = &stru_10074E618;
  v5[1] = &stru_10074E638;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_10074E658;
  v5[3] = &stru_10074E678;
  v4[4] = @"pears.a";
  v5[4] = &stru_10074E698;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

@end