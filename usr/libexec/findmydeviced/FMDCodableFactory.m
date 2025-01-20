@interface FMDCodableFactory
+ (id)_defaultClassTypeMap;
+ (id)_defaultObjectTypeKeys;
- (Class)classForObjectInfo:(id)a3;
- (FMDCodableFactory)init;
- (FMDCodableFactory)initWithClasses:(id)a3;
- (FMDCodableFactory)initWithObjectTypeKeys:(id)a3 andClassMap:(id)a4;
- (NSArray)objectTypeKeys;
- (NSDictionary)classTypeMapping;
- (NSDictionary)defaultClassTypeMapping;
- (NSString)description;
- (void)setClassTypeMapping:(id)a3;
- (void)setDefaultClassTypeMapping:(id)a3;
- (void)setObjectTypeKeys:(id)a3;
@end

@implementation FMDCodableFactory

- (FMDCodableFactory)init
{
  v8.receiver = self;
  v8.super_class = (Class)FMDCodableFactory;
  v2 = [(FMDCodableFactory *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[FMDCodableFactory _defaultClassTypeMap];
    classTypeMapping = v2->_classTypeMapping;
    v2->_classTypeMapping = (NSDictionary *)v3;

    uint64_t v5 = +[FMDCodableFactory _defaultObjectTypeKeys];
    objectTypeKeys = v2->_objectTypeKeys;
    v2->_objectTypeKeys = (NSArray *)v5;
  }
  return v2;
}

- (FMDCodableFactory)initWithClasses:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)FMDCodableFactory;
  uint64_t v5 = [(FMDCodableFactory *)&v31 init];
  if (v5)
  {
    v6 = +[FMDCodableFactory _defaultClassTypeMap];
    v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];

    objc_super v8 = +[FMDCodableFactory _defaultObjectTypeKeys];
    v9 = +[NSMutableSet setWithArray:v8];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v26 = v4;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v15 conformsToProtocol:&OBJC_PROTOCOL___FMDCodable])
          {
            v16 = [v15 objectType];
            [(NSDictionary *)v7 setObject:v15 forKey:v16];

            v17 = [v15 objectTypeKey];
            [v9 addObject:v17];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v38 count:16];
      }
      while (v12);
    }

    classTypeMapping = v5->_classTypeMapping;
    v5->_classTypeMapping = v7;
    v19 = v7;

    uint64_t v20 = [v9 allObjects];
    objectTypeKeys = v5->_objectTypeKeys;
    v5->_objectTypeKeys = (NSArray *)v20;

    v22 = sub_1000597E0();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [(FMDCodableFactory *)v5 objectTypeKeys];
      v24 = [(FMDCodableFactory *)v5 classTypeMapping];
      *(_DWORD *)buf = 138412802;
      v33 = v5;
      __int16 v34 = 2112;
      v35 = v23;
      __int16 v36 = 2112;
      v37 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Factory(%@) classes with object mappings: %@ and map %@", buf, 0x20u);
    }
    id v4 = v26;
  }

  return v5;
}

- (FMDCodableFactory)initWithObjectTypeKeys:(id)a3 andClassMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)FMDCodableFactory;
  objc_super v8 = [(FMDCodableFactory *)&v22 init];
  if (v8)
  {
    v9 = +[FMDCodableFactory _defaultClassTypeMap];
    id v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

    [(NSDictionary *)v10 addEntriesFromDictionary:v7];
    classTypeMapping = v8->_classTypeMapping;
    v8->_classTypeMapping = v10;
    id v12 = v10;

    uint64_t v13 = +[FMDCodableFactory _defaultObjectTypeKeys];
    v14 = +[NSSet setWithArray:v13];

    v15 = [v14 setByAddingObjectsFromArray:v6];
    uint64_t v16 = [v15 allObjects];
    objectTypeKeys = v8->_objectTypeKeys;
    v8->_objectTypeKeys = (NSArray *)v16;

    v18 = sub_1000597E0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(FMDCodableFactory *)v8 objectTypeKeys];
      uint64_t v20 = [(FMDCodableFactory *)v8 classTypeMapping];
      *(_DWORD *)buf = 138412802;
      v24 = v8;
      __int16 v25 = 2112;
      id v26 = v19;
      __int16 v27 = 2112;
      long long v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Factory(%@) key-value with object mappings: %@ and map %@", buf, 0x20u);
    }
  }

  return v8;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"%@(0x%p)", objc_opt_class(), self];
}

- (Class)classForObjectInfo:(id)a3
{
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = +[FMDCodableFactory _defaultClassTypeMap];
  id v6 = [v5 allKeys];

  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v12 = [v4 objectForKeyedSubscript:v11];

        if (v12)
        {
          v21 = +[FMDCodableFactory _defaultClassTypeMap];
          id v22 = [v21 objectForKey:v11];

          goto LABEL_21;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v13 = [(FMDCodableFactory *)self objectTypeKeys];
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    while (2)
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * (void)j);
        v19 = [v4 objectForKey:v18];

        if (v19)
        {
          v23 = [(FMDCodableFactory *)self classTypeMapping];
          v24 = [v4 objectForKey:v18];
          id v20 = [v23 objectForKey:v24];

          goto LABEL_20;
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  id v20 = 0;
LABEL_20:

  id v22 = v20;
LABEL_21:

  return (Class)v22;
}

+ (id)_defaultClassTypeMap
{
  if (qword_10031E6E0 != -1) {
    dispatch_once(&qword_10031E6E0, &stru_1002D9620);
  }
  v2 = (void *)qword_10031E6D8;

  return v2;
}

+ (id)_defaultObjectTypeKeys
{
  v2 = +[NSNull objectTypeKey];
  uint64_t v3 = +[NSURL objectTypeKey];
  v11[1] = v3;
  id v4 = +[NSDate objectTypeKey];
  v11[2] = v4;
  uint64_t v5 = +[NSNumber objectTypeKey];
  v11[3] = v5;
  id v6 = +[NSString objectTypeKey];
  v11[4] = v6;
  id v7 = +[NSArray objectTypeKey];
  v11[5] = v7;
  id v8 = +[NSDictionary objectTypeKey];
  v11[6] = v8;
  uint64_t v9 = +[NSArray arrayWithObjects:v11 count:7];

  return v9;
}

- (NSDictionary)defaultClassTypeMapping
{
  return self->_defaultClassTypeMapping;
}

- (void)setDefaultClassTypeMapping:(id)a3
{
}

- (NSDictionary)classTypeMapping
{
  return self->_classTypeMapping;
}

- (void)setClassTypeMapping:(id)a3
{
}

- (NSArray)objectTypeKeys
{
  return self->_objectTypeKeys;
}

- (void)setObjectTypeKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectTypeKeys, 0);
  objc_storeStrong((id *)&self->_classTypeMapping, 0);

  objc_storeStrong((id *)&self->_defaultClassTypeMapping, 0);
}

@end