@interface NSDictionary
+ (id)objectType;
+ (id)objectTypeKey;
- (BOOL)BOOLForCaseInsensitiveStringKey:(id)a3;
- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4;
- (NSDictionary)initWithFMDCoder:(id)a3 error:(id *)a4;
- (id)flattenedArrayFromObject:(id)a3 parentIndices:(id)a4;
- (id)fm_flattenedArrayWithParentIndices:(id)a3;
- (id)objectForCaseInsensitiveStringKey:(id)a3;
- (id)stringForCaseInsensitiveStringKey:(id)a3;
@end

@implementation NSDictionary

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v6 = self;
  id v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v18 = *(void *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v10);
        v12 = +[NSString stringWithFormat:@"FM.key.%ld", (char *)v10 + v9];
        id v20 = 0;
        [v5 encodeObject:v11 forKey:v12 error:&v20];
        id v13 = v20;

        v14 = [(NSDictionary *)v6 objectForKey:v11];
        v15 = +[NSString stringWithFormat:@"FM.object.%ld", (char *)v10 + v9];
        id v19 = v13;
        [v5 encodeObject:v14 forKey:v15 error:&v19];
        id v16 = v19;

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSDictionary *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      v9 += (uint64_t)v10;
    }
    while (v8);
  }

  return 1;
}

- (NSDictionary)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v30 = +[NSMutableDictionary dictionary];
  uint64_t v5 = 0;
  id v6 = 0;
  while (1)
  {
    id v7 = +[NSSet setWithObject:&OBJC_PROTOCOL___FMDCodable];
    id v8 = +[NSString stringWithFormat:@"FM.key.%ld", v5];
    id v32 = v6;
    uint64_t v9 = [v4 decodeObjectOfProtocols:v7 forKey:v8 error:&v32];
    id v10 = v32;

    if (v10)
    {
      v14 = [v10 userInfo];
      v15 = +[NSMutableDictionary dictionaryWithDictionary:v14];

      NSErrorUserInfoKey v37 = NSLocalizedFailureReasonErrorKey;
      id v16 = +[NSString stringWithFormat:@"Unexpected object nil for key FM.key.%lu", v5];
      v38 = v16;
      v17 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      uint64_t v18 = +[NSError errorWithDomain:@"FMDictionaryError" code:-1 userInfo:v17];
      [v15 setObject:v18 forKeyedSubscript:NSUnderlyingErrorKey];

      id v19 = [v10 domain];
      id v20 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, [v10 code], v15);

      goto LABEL_11;
    }
    if (!v9)
    {
      id v20 = 0;
      goto LABEL_12;
    }
    uint64_t v11 = +[NSSet setWithObject:&OBJC_PROTOCOL___FMDCodable];
    v12 = +[NSString stringWithFormat:@"FM.object.%ld", v5];
    id v31 = 0;
    id v13 = [v4 decodeObjectOfProtocols:v11 forKey:v12 error:&v31];
    id v6 = v31;

    if (!v13) {
      break;
    }
    [v30 setObject:v13 forKey:v9];

    ++v5;
  }
  if (v6)
  {
    long long v21 = [v6 userInfo];
    v15 = +[NSMutableDictionary dictionaryWithDictionary:v21];

    NSErrorUserInfoKey v35 = NSLocalizedFailureReasonErrorKey;
    long long v22 = +[NSString stringWithFormat:@"Unexpected object nil for key FM.object.%lu", v5];
    v36 = v22;
    long long v23 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    long long v24 = +[NSError errorWithDomain:@"FMDictionaryError" code:-1 userInfo:v23];
    [v15 setObject:v24 forKeyedSubscript:NSUnderlyingErrorKey];

    id v19 = [v6 domain];
    id v20 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, [v6 code], v15);
  }
  else
  {
    NSErrorUserInfoKey v33 = NSLocalizedFailureReasonErrorKey;
    v15 = +[NSString stringWithFormat:@"Unexpected object nil for key FM.object.%lu", v5];
    v34 = v15;
    id v19 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v20 = +[NSError errorWithDomain:@"FMDictionaryError" code:-1 userInfo:v19];
  }
LABEL_11:

LABEL_12:
  if (v20)
  {
    v25 = sub_1000597E0();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10023CE30((uint64_t)v20, v25);
    }

    if (a4) {
      *a4 = v20;
    }
  }
  v26 = [(NSDictionary *)self initWithDictionary:v30];

  return v26;
}

+ (id)objectType
{
  return @"FM.dictionary";
}

+ (id)objectTypeKey
{
  return @"dictionaryType";
}

- (id)stringForCaseInsensitiveStringKey:(id)a3
{
  v3 = [(NSDictionary *)self objectForCaseInsensitiveStringKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)BOOLForCaseInsensitiveStringKey:(id)a3
{
  v3 = [(NSDictionary *)self objectForCaseInsensitiveStringKey:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)objectForCaseInsensitiveStringKey:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self;
  id v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (!objc_msgSend(v9, "compare:options:", v4, 1, (void)v11))
        {
          id v6 = [(NSDictionary *)v5 objectForKeyedSubscript:v9];
          goto LABEL_11;
        }
      }
      id v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)fm_flattenedArrayWithParentIndices:(id)a3
{
  return [(NSDictionary *)self flattenedArrayFromObject:self parentIndices:a3];
}

- (id)flattenedArrayFromObject:(id)a3 parentIndices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100078A24;
  v28 = sub_100078A34;
  uint64_t v9 = &__NSArray0__struct;
  if (v7) {
    uint64_t v9 = v7;
  }
  id v29 = v9;
  id v10 = +[NSMutableArray array];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v6;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100078A3C;
    v22[3] = &unk_1002DBFD8;
    v23[3] = v11;
    v23[4] = v12;
    v23[0] = v10;
    v23[1] = self;
    v23[2] = &v24;
    [v13 enumerateKeysAndObjectsUsingBlock:v22];
    long long v14 = (void **)v23;
LABEL_7:
    id v16 = *v14;
    v17 = v6;
    goto LABEL_9;
  }
  if (objc_opt_isKindOfClass())
  {
    id v15 = v6;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100078B74;
    v20[3] = &unk_1002DC000;
    v21[2] = &v24;
    v21[0] = v10;
    v21[1] = self;
    [v15 enumerateObjectsUsingBlock:v20];
    long long v14 = (void **)v21;
    goto LABEL_7;
  }
  v17 = [(id)v25[5] componentsJoinedByString:@"_"];
  id v16 = +[NSString stringWithFormat:@"%@_%@", v17, v6];
  [v10 addObject:v16];
LABEL_9:

  uint64_t v18 = [v10 sortedArrayUsingSelector:"compare:"];

  _Block_object_dispose(&v24, 8);

  return v18;
}

@end