@interface DynamicAssociatedDomain
+ (id)_objectsWithQuery:(id)a3 inDatabase:(id)a4;
+ (id)_propertySetters;
+ (id)_propertyValuesFor:(id)a3;
+ (id)associatedDomainsInDatabase:(id)a3;
+ (id)databaseTable;
+ (void)deleteAssociatedDomainsInDatabase:(id)a3;
+ (void)insertAssociatedDomains:(id)a3 inDatabase:(id)a4;
- (DynamicAssociatedDomain)initWithDomain:(id)a3 inDatabase:(id)a4;
@end

@implementation DynamicAssociatedDomain

+ (id)databaseTable
{
  return @"bacon";
}

- (DynamicAssociatedDomain)initWithDomain:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() _propertyValuesFor:v7];

  v9 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v9;
}

+ (id)associatedDomainsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = [a1 queryWithDatabase:v4 predicate:0];
  id v6 = [a1 _objectsWithQuery:v5 inDatabase:v4];

  return v6;
}

+ (void)insertAssociatedDomains:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
        v12 = [[DynamicAssociatedDomain alloc] initWithDomain:v11 inDatabase:v6];
        v13 = [v11 patterns];
        +[DynamicAssociatedDomainPattern insertPatterns:v13 forDomainPID:[(SQLiteEntity *)v12 persistentID] inDatabase:v6];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

+ (void)deleteAssociatedDomainsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = [a1 queryWithDatabase:v4 predicate:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100145644;
  v7[3] = &unk_100731020;
  id v8 = v4;
  id v6 = v4;
  [v5 enumeratePersistentIDsUsingBlock:v7];
  [v5 deleteAllEntities];
}

+ (id)_objectsWithQuery:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _propertySetters];
  id v9 = objc_alloc_init((Class)NSMutableArray);
  v10 = [v8 allKeys];
  long long v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_1001457B0;
  v19 = &unk_10072DE00;
  id v23 = a1;
  id v20 = v8;
  id v21 = v6;
  id v11 = v9;
  id v22 = v11;
  id v12 = v6;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v16];

  if (objc_msgSend(v11, "count", v16, v17, v18, v19)) {
    id v14 = [v11 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

+ (id)_propertyValuesFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 host];

  [v4 setObjectOrNull:v5 forKey:@"a"];
  return v4;
}

+ (id)_propertySetters
{
  CFStringRef v4 = @"a";
  id v5 = &stru_100739CC8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

@end