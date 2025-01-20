@interface CKKSRateLimiter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKKSRateLimiter)init;
- (CKKSRateLimiter)initWithCoder:(id)a3;
- (NSDate)overloadUntil;
- (NSDictionary)config;
- (NSMutableDictionary)buckets;
- (id)consumeTokenFromBucket:(id)a3 type:(int)a4 at:(id)a5;
- (id)diagnostics;
- (id)topOffendingAccessGroups:(unint64_t)a3;
- (int)capacity:(int)a3;
- (int)judge:(id)a3 at:(id)a4 limitTime:(id *)a5;
- (int)rate:(int)a3;
- (unint64_t)stateSize;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setBuckets:(id)a3;
- (void)setConfig:(id)a3;
- (void)setOverloadUntil:(id)a3;
- (void)trim:(id)a3;
@end

@implementation CKKSRateLimiter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overloadUntil, 0);
  objc_storeStrong((id *)&self->_buckets, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

- (void)setOverloadUntil:(id)a3
{
}

- (NSDate)overloadUntil
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBuckets:(id)a3
{
}

- (NSMutableDictionary)buckets
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)topOffendingAccessGroups:(unint64_t)a3
{
  v5 = +[NSDate date];
  v6 = [(CKKSRateLimiter *)self buckets];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004581C;
  v21[3] = &unk_1002F81A0;
  id v7 = v5;
  id v22 = v7;
  v8 = [v6 keysOfEntriesPassingTest:v21];

  if ([v8 count])
  {
    v9 = [(CKKSRateLimiter *)self buckets];
    v10 = [v8 allObjects];
    v11 = +[NSDate date];
    v12 = [v9 objectsForKeys:v10 notFoundMarker:v11];
    v13 = [v8 allObjects];
    v14 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v13];

    v15 = [v14 keysSortedByValueUsingSelector:"compare:"];
    v16 = [v15 reverseObjectEnumerator];
    v17 = [v16 allObjects];

    if ((unint64_t)[v17 count] <= a3)
    {
      id v18 = v17;
    }
    else
    {
      [v17 subarrayWithRange:0, a3];
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)diagnostics
{
  v3 = [(CKKSRateLimiter *)self config];
  v4 = [v3 description];
  v5 = +[NSMutableString stringWithFormat:@"RateLimiter config: %@\n", v4];

  v6 = [(CKKSRateLimiter *)self overloadUntil];

  if (v6)
  {
    id v7 = [(CKKSRateLimiter *)self overloadUntil];
    v8 = [(CKKSRateLimiter *)self buckets];
    [v5 appendFormat:@"Overloaded until %@, %lu total buckets\n", v7, [v8 count]];
  }
  else
  {
    id v7 = [(CKKSRateLimiter *)self buckets];
    [v5 appendFormat:@"Not overloaded, %lu total buckets\n", [v7 count]];
  }

  v9 = [(CKKSRateLimiter *)self topOffendingAccessGroups:10];
  v10 = v9;
  if (v9)
  {
    id v11 = [v9 count];
    v12 = [(CKKSRateLimiter *)self buckets];
    v13 = [v10 objectAtIndexedSubscript:0];
    v14 = [v12 objectForKeyedSubscript:v13];
    v15 = [(CKKSRateLimiter *)self buckets];
    v16 = [v10 objectAtIndexedSubscript:(char *)[v10 count] - 1];
    v17 = [v15 objectForKeyedSubscript:v16];
    [v5 appendFormat:@"%lu congested buckets. Top offenders: \n%@ range %@ to %@\n", v11, v10, v14, v17];
  }
  else
  {
    [v5 appendString:@"No buckets congested"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKSRateLimiter *)self buckets];
  [v4 encodeObject:v5 forKey:@"buckets"];
}

- (void)trim:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKSRateLimiter *)self config];
  v6 = [v5 objectForKeyedSubscript:@"trimTime"];
  unsigned int v7 = [v6 intValue];

  v8 = [(CKKSRateLimiter *)self buckets];
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_100045D60;
  v21 = &unk_1002F8968;
  id v22 = v4;
  unsigned int v23 = v7;
  id v9 = v4;
  v10 = [v8 keysOfEntriesPassingTest:&v18];

  if (objc_msgSend(v10, "count", v18, v19, v20, v21))
  {
    [(CKKSRateLimiter *)self setOverloadUntil:0];
    id v11 = [(CKKSRateLimiter *)self buckets];
    v12 = [v10 allObjects];
    [v11 removeObjectsForKeys:v12];
LABEL_5:

    goto LABEL_6;
  }
  v13 = [(CKKSRateLimiter *)self buckets];
  v14 = [v13 objectForKeyedSubscript:@"All"];
  v15 = [(CKKSRateLimiter *)self config];
  v16 = [v15 objectForKeyedSubscript:@"overloadDuration"];
  v17 = [v14 dateByAddingTimeInterval:[v16 unsignedIntValue]];
  [(CKKSRateLimiter *)self setOverloadUntil:v17];

  id v11 = sub_10000B070("SecCritical");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(CKKSRateLimiter *)self overloadUntil];
    *(_DWORD *)buf = 138412290;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "RateLimiter overloaded until %@", buf, 0xCu);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)reset
{
  v3 = objc_opt_new();
  [(CKKSRateLimiter *)self setBuckets:v3];

  [(CKKSRateLimiter *)self setOverloadUntil:0];
}

- (unint64_t)stateSize
{
  v2 = [(CKKSRateLimiter *)self buckets];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (int)judge:(id)a3 at:(id)a4 limitTime:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [(CKKSRateLimiter *)self overloadUntil];

  if (v11)
  {
    v12 = [(CKKSRateLimiter *)self overloadUntil];
    [v10 timeIntervalSinceDate:v12];
    double v14 = v13;

    if (v14 >= 0.0) {
      [(CKKSRateLimiter *)self trim:v10];
    }
    v15 = [(CKKSRateLimiter *)self overloadUntil];

    if (v15)
    {
      v16 = [(CKKSRateLimiter *)self overloadUntil];
      *a5 = [v16 copy];
LABEL_17:
      int v27 = 5;
      goto LABEL_31;
    }
  }
  v17 = [(CKKSRateLimiter *)self buckets];
  v16 = [v17 objectForKeyedSubscript:@"All"];

  v42 = a5;
  if (!v16)
  {
    id v41 = v9;
    goto LABEL_11;
  }
  [v10 timeIntervalSinceDate:v16];
  double v19 = v18;
  v17 = [(CKKSRateLimiter *)self config];
  id v5 = [v17 objectForKeyedSubscript:@"trimTime"];
  if (v19 <= (double)(int)[v5 intValue])
  {
    id v41 = v9;
LABEL_11:
    v20 = [(CKKSRateLimiter *)self buckets];
    id v21 = [v20 count];
    id v22 = [(CKKSRateLimiter *)self config];
    unsigned int v23 = [v22 objectForKeyedSubscript:@"trimSize"];
    unint64_t v24 = [v23 unsignedIntValue];

    if (v16)
    {
    }
    BOOL v25 = (unint64_t)v21 >= v24;
    id v9 = v41;
    if (!v25) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }

LABEL_15:
  [(CKKSRateLimiter *)self trim:v10];
  v26 = [(CKKSRateLimiter *)self overloadUntil];

  if (v26)
  {
    id *v42 = [(CKKSRateLimiter *)self overloadUntil];
    goto LABEL_17;
  }
LABEL_18:
  id v28 = [(CKKSRateLimiter *)self consumeTokenFromBucket:@"All" type:0 at:v10];
  int v27 = v28 != 0;
  v29 = [v9 accessgroup];
  v30 = +[NSString stringWithFormat:@"G:%@", v29];
  v31 = [(CKKSRateLimiter *)self consumeTokenFromBucket:v30 type:1 at:v10];

  if (v31)
  {
    if (v28)
    {
      uint64_t v32 = [v28 laterDate:v31];

      id v28 = (id)v32;
    }
    else
    {
      id v28 = v31;
    }
    v33 = [v10 dateByAddingTimeInterval:2 * -[CKKSRateLimiter rate:](self, "rate:", 1)];
    [v31 timeIntervalSinceDate:v33];
    if (v34 >= 0.0) {
      int v27 = 3;
    }
    else {
      int v27 = 2;
    }
  }
  v35 = [v9 uuid];
  v36 = +[NSString stringWithFormat:@"U:%@", v35];
  v37 = [(CKKSRateLimiter *)self consumeTokenFromBucket:v36 type:2 at:v10];

  if (v37)
  {
    if (v28)
    {
      uint64_t v38 = [v28 laterDate:v37];

      int v27 = 4;
      id v28 = (id)v38;
    }
    else
    {
      id v28 = v37;
      int v27 = 4;
    }
  }
  id v39 = v28;
  id *v42 = v39;

LABEL_31:
  return v27;
}

- (id)consumeTokenFromBucket:(id)a3 type:(int)a4 at:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [[v9 dateByAddingTimeInterval:-(-[CKKSRateLimiter capacity:](self, "capacity:", v6) * -[CKKSRateLimiter rate:](self, "rate:", v6))];
  id v11 = [(CKKSRateLimiter *)self buckets];
  v12 = [v11 objectForKeyedSubscript:v8];

  if (!v12 || ([v12 timeIntervalSinceDate:v10], v13 < 0.0))
  {
    id v14 = v10;

    v12 = v14;
  }
  v15 = [v12 dateByAddingTimeInterval:-[CKKSRateLimiter rate:](self, "rate:", v6)];

  v16 = [(CKKSRateLimiter *)self buckets];
  [v16 setObject:v15 forKeyedSubscript:v8];

  [v15 timeIntervalSinceDate:v9];
  if (v17 <= 0.0) {
    id v18 = 0;
  }
  else {
    id v18 = [v15 copy];
  }

  return v18;
}

- (int)capacity:(int)a3
{
  switch(a3)
  {
    case 2:
      id v3 = [(CKKSRateLimiter *)self config];
      id v4 = v3;
      CFStringRef v5 = @"capacityUUID";
      goto LABEL_7;
    case 1:
      id v3 = [(CKKSRateLimiter *)self config];
      id v4 = v3;
      CFStringRef v5 = @"capacityGroup";
      goto LABEL_7;
    case 0:
      id v3 = [(CKKSRateLimiter *)self config];
      id v4 = v3;
      CFStringRef v5 = @"capacityAll";
LABEL_7:
      uint64_t v6 = [v3 objectForKeyedSubscript:v5];
      unsigned int v7 = [v6 intValue];

      LODWORD(self) = v7;
      break;
  }
  return (int)self;
}

- (int)rate:(int)a3
{
  switch(a3)
  {
    case 2:
      id v3 = [(CKKSRateLimiter *)self config];
      id v4 = v3;
      CFStringRef v5 = @"rateUUID";
      goto LABEL_7;
    case 1:
      id v3 = [(CKKSRateLimiter *)self config];
      id v4 = v3;
      CFStringRef v5 = @"rateGroup";
      goto LABEL_7;
    case 0:
      id v3 = [(CKKSRateLimiter *)self config];
      id v4 = v3;
      CFStringRef v5 = @"rateAll";
LABEL_7:
      uint64_t v6 = [v3 objectForKeyedSubscript:v5];
      unsigned int v7 = [v6 intValue];

      LODWORD(self) = v7;
      break;
  }
  return (int)self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(CKKSRateLimiter *)self config];
    unsigned int v7 = [v5 config];
    if (![v6 isEqual:v7])
    {
      unsigned __int8 v13 = 0;
LABEL_15:

      goto LABEL_16;
    }
    id v8 = [(CKKSRateLimiter *)self buckets];
    id v9 = [v5 buckets];
    if (![v8 isEqual:v9])
    {
      unsigned __int8 v13 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v10 = [(CKKSRateLimiter *)self overloadUntil];
    if (v10 || ([v5 overloadUntil], (v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v11 = [(CKKSRateLimiter *)self overloadUntil];
      v12 = [v5 overloadUntil];
      unsigned __int8 v13 = [v11 isEqual:v12];

      if (v10)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v15 = 0;
      unsigned __int8 v13 = 1;
    }

    goto LABEL_13;
  }
  unsigned __int8 v13 = 0;
LABEL_16:

  return v13;
}

- (CKKSRateLimiter)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKKSRateLimiter;
  id v5 = [(CKKSRateLimiter *)&v31 init];
  if (v5)
  {
    uint64_t v6 = &SecPolicyXPCArrayCopyArray_ptr;
    if (v4)
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(), 0);
      id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"buckets"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_18:

        BOOL v25 = 0;
        goto LABEL_19;
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v11 = v10;
      id v12 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v28;
        while (2)
        {
          v15 = 0;
          do
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || ([(NSMutableDictionary *)v11 objectForKeyedSubscript:v16],
                  double v17 = objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  char isKindOfClass = objc_opt_isKindOfClass(),
                  v17,
                  (isKindOfClass & 1) == 0))
            {

              goto LABEL_18;
            }
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
          uint64_t v6 = &SecPolicyXPCArrayCopyArray_ptr;
          if (v13) {
            continue;
          }
          break;
        }
      }

      double v19 = (NSMutableDictionary *)[(NSMutableDictionary *)v11 mutableCopy];
      buckets = v5->_buckets;
      v5->_buckets = v19;
    }
    else
    {
      uint64_t v21 = objc_opt_new();
      id v11 = v5->_buckets;
      v5->_buckets = (NSMutableDictionary *)v21;
    }

    overloadUntil = v5->_overloadUntil;
    v5->_overloadUntil = 0;

    objc_msgSend(v6[498], "dictionaryWithObjectsAndKeys:", &off_1003259D8, @"rateAll", &off_1003259F0, @"rateGroup", &off_100325A08, @"rateUUID", &off_100325A20, @"capacityAll", &off_100325A38, @"capacityGroup", &off_100325A50, @"capacityUUID", &off_100325A68, @"trimSize", &off_100325A80, @"trimTime", &off_100325A98,
      @"overloadDuration",
    uint64_t v23 = 0);
    config = v5->_config;
    v5->_config = (NSDictionary *)v23;
  }
  BOOL v25 = v5;
LABEL_19:

  return v25;
}

- (CKKSRateLimiter)init
{
  return [(CKKSRateLimiter *)self initWithCoder:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end