@interface AssociatedPassTypeIdentifier
+ (id)_associatedPassTypeIdentifiersInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_propertySettersForAssociatedPassTypeIdentifier;
+ (id)associatedPassTypeIdentifiersInDatabase:(id)a3 forPass:(id)a4;
+ (id)associatedPassTypeIdentifiersInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)insertAssociatedPassTypeIdentifiers:(id)a3 forPass:(id)a4 inDatabase:(id)a5;
- (AssociatedPassTypeIdentifier)initWithPassTypeIdentifier:(id)a3 pass:(id)a4 inDatabase:(id)a5;
@end

@implementation AssociatedPassTypeIdentifier

+ (id)databaseTable
{
  return @"associated_pass_type_identifier";
}

+ (id)associatedPassTypeIdentifiersInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPassPID:a4];
  v8 = [a1 _associatedPassTypeIdentifiersInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_associatedPassTypeIdentifiersInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSMutableSet set];
  v9 = [a1 _propertySettersForAssociatedPassTypeIdentifier];
  v10 = +[SQLiteEntity queryWithDatabase:v7 predicate:v6];

  v11 = [v9 allKeys];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10038EED0;
  v17[3] = &unk_10072EAD8;
  id v20 = a1;
  id v18 = v9;
  id v12 = v8;
  id v19 = v12;
  id v13 = v9;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];

  v14 = v19;
  id v15 = v12;

  return v15;
}

+ (id)_propertySettersForAssociatedPassTypeIdentifier
{
  CFStringRef v4 = @"identifier";
  v5 = &stru_10074CF50;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  else {
    return 0;
  }
}

- (AssociatedPassTypeIdentifier)initWithPassTypeIdentifier:(id)a3 pass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[NSMutableDictionary dictionary];
  id v12 = [v10 dataUsingEncoding:4];
  id v13 = [v12 SHA256Hash];
  v14 = [v13 hexEncoding];

  [v11 setObjectOrNull:v10 forKey:@"identifier"];
  [v11 setObjectOrNull:v14 forKey:@"identifier_hash"];
  id v15 = [v9 persistentID];

  v16 = +[NSNumber numberWithLongLong:v15];
  [v11 setObject:v16 forKey:@"pass_pid"];

  v17 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v17;
}

+ (void)insertAssociatedPassTypeIdentifiers:(id)a3 forPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v8);
        }

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

+ (id)_predicateForPass:(id)a3
{
  id v4 = [a3 persistentID];
  return [a1 _predicateForPassPID:v4];
}

+ (id)associatedPassTypeIdentifiersInDatabase:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPass:a4];
  id v8 = [a1 _associatedPassTypeIdentifiersInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPass:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

@end