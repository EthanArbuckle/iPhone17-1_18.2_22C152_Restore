@interface CKKSAnalytics
+ (id)databasePath;
+ (id)logger;
- (BOOL)isCKPartialError:(id)a3;
- (id)createErrorAttributes:(id)a3 depth:(unint64_t)a4 attributes:(id)a5;
- (id)dateOfLastSuccessForEvent:(id)a3 zoneName:(id)a4;
- (id)datePropertyForKey:(id)a3 zoneName:(id)a4;
- (id)errorChain:(id)a3 depth:(unint64_t)a4;
- (void)addCKPartialError:(id)a3 error:(id)a4 depth:(unint64_t)a5;
- (void)logRecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5;
- (void)logRecoverableError:(id)a3 forEvent:(id)a4 zoneName:(id)a5 withAttributes:(id)a6;
- (void)logSuccessForEvent:(id)a3 zoneName:(id)a4;
- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5;
- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 zoneName:(id)a5 withAttributes:(id)a6;
- (void)noteEvent:(id)a3 zoneName:(id)a4;
- (void)noteMetric:(id)a3 count:(int64_t)a4;
- (void)recordRecoveredTLKMetrics:(id)a3 tlkRecoveryResults:(id)a4 uniqueTLKsRecoveredEvent:(id)a5 totalSharesRecoveredEvent:(id)a6 totalRecoverableTLKSharesEvent:(id)a7 totalRecoverableTLKsEvent:(id)a8 totalViewsWithSharesEvent:(id)a9;
- (void)setDateProperty:(id)a3 forKey:(id)a4 zoneName:(id)a5;
@end

@implementation CKKSAnalytics

- (void)recordRecoveredTLKMetrics:(id)a3 tlkRecoveryResults:(id)a4 uniqueTLKsRecoveredEvent:(id)a5 totalSharesRecoveredEvent:(id)a6 totalRecoverableTLKSharesEvent:(id)a7 totalRecoverableTLKsEvent:(id)a8 totalViewsWithSharesEvent:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v36 = a9;
  v19 = [v15 successfulKeysRecovered];
  v38 = v16;
  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v16, [v19 count]);

  v39 = v15;
  v37 = v17;
  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v17, [v15 totalTLKSharesRecovered]);
  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v18, [v14 count]);
  v20 = +[NSMutableSet set];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v21 = v14;
  id v22 = [v21 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v45;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [*(id *)(*((void *)&v44 + 1) + 8 * i) tlkUUID];
        [v20 addObject:v26];
      }
      id v23 = [v21 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v23);
  }

  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v18, [v20 count]);
  v27 = +[NSMutableDictionary dictionary];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v28 = v21;
  id v29 = [v28 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v41;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
        v34 = [v33 zoneID];
        v35 = [v33 zoneID];
        [v27 setObject:v34 forKeyedSubscript:v35];
      }
      id v30 = [v28 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v30);
  }

  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v36, [v27 count]);
}

- (void)noteMetric:(id)a3 count:(int64_t)a4
{
  id v6 = a3;
  id v9 = +[NSString stringWithFormat:@"%@%lld", v6, a4];
  [(CKKSAnalytics *)self logResultForEvent:v9 hardFailure:0 result:0];
  v7 = +[NSDate date];
  [(CKKSAnalytics *)self setDateProperty:v7 forKey:v9];

  id v8 = [objc_alloc((Class)NSNumber) initWithLong:a4];
  [(CKKSAnalytics *)self setNumberProperty:v8 forKey:v6];
}

- (id)datePropertyForKey:(id)a3 zoneName:(id)a4
{
  v5 = +[NSString stringWithFormat:@"%@-%@", a3, a4];
  id v6 = [(CKKSAnalytics *)self datePropertyForKey:v5];

  return v6;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4 zoneName:(id)a5
{
  id v8 = a3;
  id v9 = +[NSString stringWithFormat:@"%@-%@", a4, a5];
  [(CKKSAnalytics *)self setDateProperty:v8 forKey:v9];
}

- (id)dateOfLastSuccessForEvent:(id)a3 zoneName:(id)a4
{
  v5 = +[NSString stringWithFormat:@"last_success_%@-%@", a4, a3];
  id v6 = [(CKKSAnalytics *)self datePropertyForKey:v5];

  return v6;
}

- (void)noteEvent:(id)a3 zoneName:(id)a4
{
  id v5 = +[NSString stringWithFormat:@"%@-%@", a4, a3];
  [(CKKSAnalytics *)self noteEventNamed:v5];
}

- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    id v9 = a4;
    id v10 = a3;
    v11 = +[NSMutableDictionary dictionary];
    v12 = v11;
    if (v8) {
      [v11 setValuesForKeysWithDictionary:v8];
    }
    v13 = [v10 userInfo];
    id v14 = [v13 objectForKeyedSubscript:NSUnderlyingErrorKey];
    id v15 = [(CKKSAnalytics *)self errorChain:v14 depth:0];
    [v12 setObject:v15 forKeyedSubscript:@"errorChain"];

    [(CKKSAnalytics *)self addCKPartialError:v12 error:v10 depth:0];
    v20[0] = @"recoverableError";
    v20[1] = @"zone";
    v21[0] = &__kCFBooleanFalse;
    v21[1] = @"OTBottledPeer";
    v20[2] = @"errorDomain";
    id v16 = [v10 domain];
    v21[2] = v16;
    v20[3] = @"errorCode";
    id v17 = [v10 code];

    id v18 = +[NSNumber numberWithInteger:v17];
    v21[3] = v18;
    v19 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
    [v12 setValuesForKeysWithDictionary:v19];

    [(CKKSAnalytics *)self logHardFailureForEventNamed:v9 withAttributes:v12];
  }
}

- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 zoneName:(id)a5 withAttributes:(id)a6
{
  id v10 = a6;
  if (a3)
  {
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v14 = +[NSMutableDictionary dictionary];
    id v15 = v14;
    if (v10) {
      [v14 setValuesForKeysWithDictionary:v10];
    }
    id v16 = [v13 userInfo];
    id v17 = [v16 objectForKeyedSubscript:NSUnderlyingErrorKey];
    id v18 = [(CKKSAnalytics *)self errorChain:v17 depth:0];
    [v15 setObject:v18 forKeyedSubscript:@"errorChain"];

    [(CKKSAnalytics *)self addCKPartialError:v15 error:v13 depth:0];
    v23[0] = @"recoverableError";
    v23[1] = @"zone";
    v24[0] = &__kCFBooleanFalse;
    v24[1] = v11;
    v23[2] = @"errorDomain";
    v19 = [v13 domain];
    v24[2] = v19;
    v23[3] = @"errorCode";
    id v20 = [v13 code];

    id v21 = +[NSNumber numberWithInteger:v20];
    v24[3] = v21;
    id v22 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

    [v15 setValuesForKeysWithDictionary:v22];
    [(CKKSAnalytics *)self logHardFailureForEventNamed:v12 withAttributes:v15];
  }
}

- (void)logRecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    id v9 = a4;
    id v10 = a3;
    id v11 = +[NSMutableDictionary dictionary];
    id v12 = v11;
    if (v8) {
      [v11 setValuesForKeysWithDictionary:v8];
    }
    v21[0] = &__kCFBooleanTrue;
    v20[0] = @"recoverableError";
    v20[1] = @"errorDomain";
    id v13 = [v10 domain];
    v21[1] = v13;
    v20[2] = @"errorCode";
    id v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 code]);
    v21[2] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    [v12 setValuesForKeysWithDictionary:v15];

    id v16 = [v10 userInfo];
    id v17 = [v16 objectForKeyedSubscript:NSUnderlyingErrorKey];
    id v18 = [(CKKSAnalytics *)self errorChain:v17 depth:0];
    [v12 setObject:v18 forKeyedSubscript:@"errorChain"];

    [(CKKSAnalytics *)self addCKPartialError:v12 error:v10 depth:0];
    v19.receiver = self;
    v19.super_class = (Class)CKKSAnalytics;
    [(CKKSAnalytics *)&v19 logSoftFailureForEventNamed:v9 withAttributes:v12];
  }
}

- (void)logRecoverableError:(id)a3 forEvent:(id)a4 zoneName:(id)a5 withAttributes:(id)a6
{
  id v10 = a6;
  if (a3)
  {
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v14 = +[NSMutableDictionary dictionary];
    id v15 = v14;
    if (v10) {
      [v14 setValuesForKeysWithDictionary:v10];
    }
    v23[0] = @"recoverableError";
    v23[1] = @"zone";
    v24[0] = &__kCFBooleanTrue;
    v24[1] = v11;
    v23[2] = @"errorDomain";
    id v16 = [v13 domain];
    v24[2] = v16;
    v23[3] = @"errorCode";
    id v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 code]);
    v24[3] = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    [v15 setValuesForKeysWithDictionary:v18];

    objc_super v19 = [v13 userInfo];
    id v20 = [v19 objectForKeyedSubscript:NSUnderlyingErrorKey];
    id v21 = [(CKKSAnalytics *)self errorChain:v20 depth:0];
    [v15 setObject:v21 forKeyedSubscript:@"errorChain"];

    [(CKKSAnalytics *)self addCKPartialError:v15 error:v13 depth:0];
    v22.receiver = self;
    v22.super_class = (Class)CKKSAnalytics;
    [(CKKSAnalytics *)&v22 logSoftFailureForEventNamed:v12 withAttributes:v15];
  }
}

- (id)createErrorAttributes:(id)a3 depth:(unint64_t)a4 attributes:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[NSMutableDictionary dictionary];
  id v10 = v9;
  if (v7) {
    [v9 setValuesForKeysWithDictionary:v7];
  }
  v19[0] = &__kCFBooleanTrue;
  v18[0] = @"recoverableError";
  v18[1] = @"errorDomain";
  id v11 = [v8 domain];
  v19[1] = v11;
  v18[2] = @"errorCode";
  id v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 code]);
  v19[2] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  [v10 setValuesForKeysWithDictionary:v13];

  id v14 = [v8 userInfo];
  id v15 = [v14 objectForKeyedSubscript:NSUnderlyingErrorKey];
  id v16 = [(CKKSAnalytics *)self errorChain:v15 depth:0];
  [v10 setObject:v16 forKeyedSubscript:@"errorChain"];

  [(CKKSAnalytics *)self addCKPartialError:v10 error:v8 depth:0];

  return v10;
}

- (id)errorChain:(id)a3 depth:(unint64_t)a4
{
  id v6 = a3;
  if (a4 <= 5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16[0] = @"domain";
    id v7 = [v6 domain];
    v16[1] = @"code";
    v17[0] = v7;
    id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    v17[1] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    id v10 = [v9 mutableCopy];

    id v11 = [v6 userInfo];
    id v12 = [v11 objectForKeyedSubscript:NSUnderlyingErrorKey];
    unint64_t v13 = a4 + 1;
    id v14 = [(CKKSAnalytics *)self errorChain:v12 depth:v13];
    [v10 setObject:v14 forKeyedSubscript:@"child"];

    [(CKKSAnalytics *)self addCKPartialError:v10 error:v6 depth:v13];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)addCKPartialError:(id)a3 error:(id)a4 depth:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v26 = self;
  if (![(CKKSAnalytics *)self isCKPartialError:v9]) {
    goto LABEL_20;
  }
  id v10 = [v9 userInfo];
  id v11 = [v10 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  id v24 = v9;
  v25 = v8;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v23 = v11;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v13) {
    goto LABEL_18;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v28;
  unint64_t v16 = a5 + 1;
  while (2)
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v28 != v15) {
        objc_enumerationMutation(v12);
      }
      id v18 = [v12 objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i), v23, v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v19 = [v18 domain];
        if ([v19 isEqualToString:CKErrorDomain])
        {
          id v20 = [v18 code];

          if (v20 == (id)22) {
            goto LABEL_14;
          }
        }
        else
        {
        }
        uint64_t v21 = [(CKKSAnalytics *)v26 errorChain:v18 depth:v16];
        if (v21)
        {
          objc_super v22 = (void *)v21;
          [v25 setObject:v21 forKeyedSubscript:@"oneCloudKitPartialFailure"];

          goto LABEL_18;
        }
      }
LABEL_14:
    }
    id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_18:

  id v9 = v24;
  id v8 = v25;
  id v11 = v23;
LABEL_19:

LABEL_20:
}

- (BOOL)isCKPartialError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqualToString:CKErrorDomain]) {
    BOOL v5 = [v3 code] == (id)2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)logSuccessForEvent:(id)a3 zoneName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSString stringWithFormat:@"%@-%@", v6, v7];
  [(CKKSAnalytics *)self logSuccessForEventNamed:v8];

  id v10 = +[NSDate date];
  id v9 = +[NSString stringWithFormat:@"last_success_%@-%@", v6, v7];

  [(CKKSAnalytics *)self setDateProperty:v10 forKey:v9];
}

+ (id)logger
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKKSAnalytics;
  v2 = [super logger];

  return v2;
}

+ (id)databasePath
{
  if (qword_10035D130 != -1) {
    dispatch_once(&qword_10035D130, &stru_100304ED0);
  }

  return +[CKKSAnalytics defaultAnalyticsDatabasePath:@"ckks_analytics"];
}

@end