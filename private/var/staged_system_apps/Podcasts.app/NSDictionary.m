@interface NSDictionary
- (NSNumber)domainVersion;
- (NSNumber)dsid;
- (NSNumber)storeId;
- (NSString)domain;
- (NSString)triggeredBy;
- (NSString)type;
- (id)mt_valueOrNilForKey:(id)a3 type:(Class)a4;
- (id)queryString;
@end

@implementation NSDictionary

- (id)queryString
{
  v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = self;
  id v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = [v9 description];
        v11 = [(NSDictionary *)v4 objectForKey:v9];
        v12 = [v11 description];

        v13 = [v10 pf_stringWithPercentEscape];
        v14 = [v12 pf_stringWithPercentEscape];
        v15 = +[NSString stringWithFormat:@"%@=%@", v13, v14, (void)v18];
        [v3 addObject:v15];
      }
      id v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  v16 = [v3 componentsJoinedByString:@"&"];

  return v16;
}

- (id)mt_valueOrNilForKey:(id)a3 type:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSDictionary *)self objectForKey:v6];
  if (v7)
  {
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      goto LABEL_11;
    }
    v10 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a4);
      v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      int v15 = 138543874;
      id v16 = v7;
      __int16 v17 = 2114;
      Class v18 = v12;
      __int16 v19 = 2114;
      long long v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Notifications: Trying to cast %{public}@ from %{public}@ to %{public}@ fails", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    v9 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543874;
      id v16 = v6;
      __int16 v17 = 2114;
      Class v18 = a4;
      __int16 v19 = 2114;
      long long v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Notifications: Failed to parse %{public}@ as type %{public}@ from notification %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (NSNumber)dsid
{
  uint64_t v3 = objc_opt_class();

  return (NSNumber *)[(NSDictionary *)self mt_valueOrNilForKey:@"dsid" type:v3];
}

- (NSString)domain
{
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(NSDictionary *)self mt_valueOrNilForKey:@"domain" type:v3];
}

- (NSNumber)domainVersion
{
  uint64_t v3 = objc_opt_class();

  return (NSNumber *)[(NSDictionary *)self mt_valueOrNilForKey:@"domainVersion" type:v3];
}

- (NSNumber)storeId
{
  uint64_t v3 = objc_opt_class();

  return (NSNumber *)[(NSDictionary *)self mt_valueOrNilForKey:@"storeAdamId" type:v3];
}

- (NSString)type
{
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(NSDictionary *)self mt_valueOrNilForKey:@"type" type:v3];
}

- (NSString)triggeredBy
{
  uint64_t v3 = objc_opt_class();

  return (NSString *)[(NSDictionary *)self mt_valueOrNilForKey:@"triggered-by" type:v3];
}

@end