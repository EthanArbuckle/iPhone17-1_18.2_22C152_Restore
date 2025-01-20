@interface RateLimiter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)groups;
- (NSDate)lastJudgment;
- (NSDate)overloadUntil;
- (NSDictionary)config;
- (NSString)assetType;
- (RateLimiter)initWithCoder:(id)a3;
- (RateLimiter)initWithConfig:(id)a3;
- (id)consumeTokenFromBucket:(id)a3 config:(id)a4 name:(id)a5 at:(id)a6;
- (id)diagnostics;
- (id)getPropertyValue:(id)a3 object:(id)a4;
- (int64_t)judge:(id)a3 at:(id)a4 limitTime:(id *)a5;
- (unint64_t)stateSize;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setAssetType:(id)a3;
- (void)setConfig:(id)a3;
- (void)setGroups:(id)a3;
- (void)setLastJudgment:(id)a3;
- (void)setOverloadUntil:(id)a3;
- (void)trim:(id)a3;
@end

@implementation RateLimiter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overloadUntil, 0);
  objc_storeStrong((id *)&self->_lastJudgment, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_assetType, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

- (void)setOverloadUntil:(id)a3
{
}

- (NSDate)overloadUntil
{
  return self->_overloadUntil;
}

- (void)setLastJudgment:(id)a3
{
}

- (NSDate)lastJudgment
{
  return self->_lastJudgment;
}

- (void)setGroups:(id)a3
{
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setAssetType:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setConfig:(id)a3
{
}

- (NSDictionary)config
{
  return self->_config;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_groups forKey:@"RLgroups"];
  [v4 encodeObject:self->_overloadUntil forKey:@"RLoverloadedUntil"];
  [v4 encodeObject:self->_lastJudgment forKey:@"RLlastJudgment"];
  [v4 encodeObject:self->_assetType forKey:@"RLassetType"];
  if (!self->_assetType) {
    [v4 encodeObject:self->_config forKey:@"RLconfig"];
  }
}

- (id)getPropertyValue:(id)a3 object:(id)a4
{
  v6 = (NSString *)a3;
  id v7 = a4;
  if ([(NSString *)v6 isEqualToString:@"accessGroup"]
    || [(NSString *)v6 isEqualToString:@"uuid"])
  {
    SEL v8 = NSSelectorFromString(v6);
    v9 = ((void (*)(id, SEL))[v7 methodForSelector:v8])(v7, v8);
  }
  else
  {
    v10 = sub_10000B070("SecCritical");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(RateLimiter *)self config];
      v12 = [v11 objectForKeyedSubscript:@"general"];
      v13 = [v12 objectForKeyedSubscript:@"name"];
      int v15 = 138412546;
      v16 = v13;
      __int16 v17 = 2112;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "RateLimter[%@]: \"%@\" is not an approved selector string", (uint8_t *)&v15, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)diagnostics
{
  v3 = [(RateLimiter *)self config];
  id v4 = [v3 objectForKeyedSubscript:@"general"];
  v5 = [v4 objectForKeyedSubscript:@"name"];
  v6 = [(RateLimiter *)self config];
  id v7 = [(RateLimiter *)self groups];
  SEL v8 = [(RateLimiter *)self overloadUntil];
  v9 = [(RateLimiter *)self lastJudgment];
  v10 = +[NSString stringWithFormat:@"RateLimiter[%@]\nconfig:%@\ngroups:%@\noverloaded:%@\nlastJudgment:%@", v5, v6, v7, v8, v9];

  return v10;
}

- (unint64_t)stateSize
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(RateLimiter *)self groups];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) count];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)trim:(id)a3
{
  id v35 = a3;
  id v4 = [(RateLimiter *)self config];
  unint64_t v5 = [v4 objectForKeyedSubscript:@"general"];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"maxItemAge"];
  unsigned int v7 = [v6 intValue];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(RateLimiter *)self groups];
  id v8 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10008A708;
        v36[3] = &unk_1002F8968;
        id v37 = v35;
        unsigned int v38 = v7;
        v13 = [v12 keysOfEntriesPassingTest:v36];
        v14 = [v13 allObjects];
        [v12 removeObjectsForKeys:v14];
      }
      id v9 = [obj countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v9);
  }

  unint64_t v15 = [(RateLimiter *)self stateSize];
  v16 = [(RateLimiter *)self config];
  __int16 v17 = [v16 objectForKeyedSubscript:@"general"];
  v18 = [v17 objectForKeyedSubscript:@"maxStateSize"];
  id v19 = [v18 unsignedIntegerValue];

  if (v15 <= (unint64_t)v19)
  {
    [(RateLimiter *)self setOverloadUntil:0];
  }
  else
  {
    v20 = [(RateLimiter *)self config];
    v21 = [v20 objectForKeyedSubscript:@"general"];
    v22 = [v21 objectForKeyedSubscript:@"overloadDuration"];
    v23 = [v35 dateByAddingTimeInterval:[v22 unsignedIntValue]];
    [(RateLimiter *)self setOverloadUntil:v23];

    v24 = sub_1000CD884(@"ratelimiter", 0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id obja = [(RateLimiter *)self config];
      v25 = [obja objectForKeyedSubscript:@"general"];
      v26 = [v25 objectForKeyedSubscript:@"name"];
      unint64_t v27 = [(RateLimiter *)self stateSize];
      v28 = [(RateLimiter *)self config];
      v29 = [v28 objectForKeyedSubscript:@"general"];
      v30 = [v29 objectForKeyedSubscript:@"maxStateSize"];
      id v31 = [v30 unsignedLongValue];
      v32 = [(RateLimiter *)self overloadUntil];
      *(_DWORD *)buf = 138413058;
      v44 = v26;
      __int16 v45 = 2048;
      unint64_t v46 = v27;
      __int16 v47 = 2048;
      id v48 = v31;
      __int16 v49 = 2112;
      v50 = v32;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "RateLimiter[%@] state size %lu exceeds max %lu, overloaded until %@", buf, 0x2Au);
    }
  }
}

- (void)reset
{
  id v12 = (id)objc_opt_new();
  id v3 = [(RateLimiter *)self config];
  id v4 = [v3 objectForKeyedSubscript:@"groups"];
  id v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      unsigned int v7 = objc_opt_new();
      [v12 addObject:v7];

      ++v6;
      id v8 = [(RateLimiter *)self config];
      id v9 = [v8 objectForKeyedSubscript:@"groups"];
      id v10 = [v9 count];
    }
    while (v6 < (unint64_t)v10);
  }
  [(RateLimiter *)self setGroups:v12];
  long long v11 = +[NSDate distantPast];
  [(RateLimiter *)self setLastJudgment:v11];

  [(RateLimiter *)self setOverloadUntil:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(RateLimiter *)self config];
    unsigned int v7 = [v5 config];
    if (![v6 isEqual:v7])
    {
      unsigned __int8 v15 = 0;
LABEL_30:

      goto LABEL_31;
    }
    id v8 = [(RateLimiter *)self groups];
    id v9 = [v5 groups];
    if (![v8 isEqual:v9])
    {
      unsigned __int8 v15 = 0;
LABEL_29:

      goto LABEL_30;
    }
    id v10 = [(RateLimiter *)self lastJudgment];
    long long v11 = [v5 lastJudgment];
    v29 = v10;
    if (![v10 isEqual:v11])
    {
      unsigned __int8 v15 = 0;
LABEL_28:

      goto LABEL_29;
    }
    id v12 = [(RateLimiter *)self overloadUntil];
    if (v12 || ([v5 overloadUntil], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = [(RateLimiter *)self overloadUntil];
      unint64_t v27 = [v5 overloadUntil];
      v28 = v13;
      if (!objc_msgSend(v13, "isEqual:"))
      {
        unsigned __int8 v15 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v26 = v12;
      int v14 = 1;
    }
    else
    {
      v26 = 0;
      v23 = 0;
      int v14 = 0;
    }
    v16 = [(RateLimiter *)self assetType];
    if (v16 || ([v5 assetType], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v24 = v14;
      v25 = v11;
      __int16 v17 = [(RateLimiter *)self assetType];
      v18 = [v5 assetType];
      unsigned __int8 v15 = [v17 isEqualToString:v18];

      if (v16)
      {

        long long v11 = v25;
        if (v24)
        {
          id v12 = v26;
          goto LABEL_24;
        }
        id v12 = v26;
LABEL_25:
        if (!v12) {

        }
        goto LABEL_28;
      }
      long long v11 = v25;
      LOBYTE(v14) = v24;
      id v19 = v22;
    }
    else
    {
      id v19 = 0;
      unsigned __int8 v15 = 1;
    }

    id v12 = v26;
    if (v14) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  unsigned __int8 v15 = 0;
LABEL_31:

  return v15;
}

- (id)consumeTokenFromBucket:(id)a3 config:(id)a4 name:(id)a5 at:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 objectForKeyedSubscript:@"capacity"];
  unsigned int v14 = [v13 intValue];
  unsigned __int8 v15 = [v10 objectForKeyedSubscript:@"rate"];
  v16 = [v12 dateByAddingTimeInterval:-(v14 * [v15 intValue])];

  __int16 v17 = [v9 objectForKeyedSubscript:v11];
  v18 = v17;
  if (!v17 || ([v17 timeIntervalSinceDate:v16], v19 < 0.0))
  {
    id v20 = v16;

    v18 = v20;
  }
  uint64_t v21 = [v10 objectForKeyedSubscript:@"rate"];
  v22 = [v18 dateByAddingTimeInterval:(double)(int)[v21 intValue]];

  [v9 setObject:v22 forKeyedSubscript:v11];
  [v22 timeIntervalSinceDate:v12];
  if (v23 > 0.0) {
    int v24 = v22;
  }
  else {
    int v24 = 0;
  }
  id v25 = v24;

  return v25;
}

- (int64_t)judge:(id)a3 at:(id)a4 limitTime:(id *)a5
{
  id v10 = a3;
  id v57 = a4;
  id v11 = (void *)CFPreferencesCopyValue(@"DisableKeychainRateLimiting", @"com.apple.security", kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 BOOLValue])
  {
    if (qword_10035CD88 != -1) {
      dispatch_once(&qword_10035CD88, &stru_1002F8920);
    }
    dispatch_source_merge_data((dispatch_source_t)qword_10035CD90, 1uLL);
    int64_t v12 = 0;
    *a5 = 0;
    goto LABEL_37;
  }
  v13 = [(RateLimiter *)self overloadUntil];

  if (v13)
  {
    unsigned int v14 = [(RateLimiter *)self overloadUntil];
    [v57 timeIntervalSinceDate:v14];
    double v16 = v15;

    if (v16 >= 0.0) {
      [(RateLimiter *)self trim:v57];
    }
    __int16 v17 = [(RateLimiter *)self overloadUntil];

    if (v17)
    {
      *a5 = [(RateLimiter *)self overloadUntil];
LABEL_21:
      int64_t v12 = 4;
      goto LABEL_37;
    }
  }
  v53 = a5;
  v18 = [(RateLimiter *)self lastJudgment];
  id v54 = v10;
  if (!v18)
  {
LABEL_16:
    unint64_t v22 = [(RateLimiter *)self stateSize];
    double v23 = [(RateLimiter *)self config];
    int v24 = [v23 objectForKeyedSubscript:@"general"];
    id v25 = [v24 objectForKeyedSubscript:@"maxStateSize"];
    id v26 = [v25 unsignedIntegerValue];

    if (v18)
    {
    }
    id v10 = v54;
    if (v22 <= (unint64_t)v26) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  a5 = [(RateLimiter *)self lastJudgment];
  [v57 timeIntervalSinceDate:a5];
  double v20 = v19;
  uint64_t v21 = [(RateLimiter *)self config];
  id v5 = [v21 objectForKeyedSubscript:@"general"];
  unint64_t v6 = [v5 objectForKeyedSubscript:@"maxItemAge"];
  if (v20 <= (double)(int)[v6 intValue])
  {
    v55 = v21;
    goto LABEL_16;
  }

LABEL_19:
  [(RateLimiter *)self trim:v57];
  unint64_t v27 = [(RateLimiter *)self overloadUntil];

  if (v27)
  {
    [(RateLimiter *)self overloadUntil];
    id v11 = v52;
    id *v53 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_22:
  v28 = +[NSDate distantPast];
  v29 = [(RateLimiter *)self groups];
  id v30 = [v29 count];

  if (!v30) {
    goto LABEL_35;
  }
  unint64_t v31 = 0;
  int64_t v12 = 0;
  do
  {
    v32 = [(RateLimiter *)self config];
    v33 = [v32 objectForKeyedSubscript:@"groups"];
    v34 = [v33 objectAtIndexedSubscript:v31];

    id v35 = [v34 objectForKeyedSubscript:@"property"];
    if (v31)
    {
      uint64_t v36 = [(RateLimiter *)self getPropertyValue:v35 object:v10];

      id v35 = (void *)v36;
    }
    if (v35)
    {
      id v37 = [(RateLimiter *)self groups];
      unsigned int v38 = [v37 objectAtIndexedSubscript:v31];
      long long v39 = [(RateLimiter *)self consumeTokenFromBucket:v38 config:v34 name:v35 at:v57];

      if (v39)
      {
        uint64_t v40 = [v28 laterDate:v39];

        long long v41 = [v34 objectForKeyedSubscript:@"badness"];
        signed int v42 = [v41 intValue];

        if (v12 <= v42) {
          int64_t v12 = v42;
        }
        v28 = (void *)v40;
      }
    }
    else
    {
      long long v39 = sub_1000CD884(@"ratelimiter", 0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        [(RateLimiter *)self config];
        int64_t v56 = v12;
        v44 = v43 = v28;
        __int16 v45 = [v44 objectForKeyedSubscript:@"general"];
        unint64_t v46 = [v45 objectForKeyedSubscript:@"name"];
        __int16 v47 = [v34 objectForKeyedSubscript:@"property"];
        *(_DWORD *)buf = 138412546;
        v59 = v46;
        __int16 v60 = 2112;
        v61 = v47;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "RateLimiter[%@]: Got nil instead of property named %@", buf, 0x16u);

        id v10 = v54;
        v28 = v43;
        int64_t v12 = v56;
      }
    }

    ++v31;
    id v48 = [(RateLimiter *)self groups];
    id v49 = [v48 count];
  }
  while (v31 < (unint64_t)v49);
  v50 = v28;
  if (!v12)
  {
LABEL_35:
    int64_t v12 = 0;
    v50 = 0;
  }
  id *v53 = v50;
  [(RateLimiter *)self setLastJudgment:v57];

  id v11 = v52;
LABEL_37:

  return v12;
}

- (RateLimiter)initWithCoder:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v27.receiver = self;
    v27.super_class = (Class)RateLimiter;
    id v5 = [(RateLimiter *)&v27 init];
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
      uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"RLgroups"];
      groups = v5->_groups;
      v5->_groups = (NSArray *)v10;

      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RLoverLoadedUntil"];
      overloadUntil = v5->_overloadUntil;
      v5->_overloadUntil = (NSDate *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RLlastJudgment"];
      lastJudgment = v5->_lastJudgment;
      v5->_lastJudgment = (NSDate *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RLassetType"];
      assetType = v5->_assetType;
      v5->_assetType = (NSString *)v16;

      if (!v5->_assetType)
      {
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = objc_opt_class();
        uint64_t v21 = objc_opt_class();
        unint64_t v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, v19, v20, v21, objc_opt_class(), 0);
        uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"RLconfig"];
        config = v5->_config;
        v5->_config = (NSDictionary *)v23;
      }
    }
    self = v5;
    id v25 = self;
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (RateLimiter)initWithConfig:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RateLimiter;
  uint64_t v6 = [(RateLimiter *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    assetType = v7->_assetType;
    v7->_assetType = 0;

    [(RateLimiter *)v7 reset];
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end