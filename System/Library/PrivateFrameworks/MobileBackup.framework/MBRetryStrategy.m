@interface MBRetryStrategy
+ (BOOL)couldRetryError:(id)a3;
- (BOOL)_consumeTokensAfterError:(id)a3 networkAvailable:(BOOL)a4 attempt:(unsigned int *)a5;
- (BOOL)_shouldRetryAfterError:(id)a3 networkAvailable:(BOOL)a4;
- (BOOL)_sleep:(double)a3;
- (BOOL)canRetryAfterError:(id)a3;
- (BOOL)shouldRetryAfterError:(id)a3;
- (BOOL)shouldRetryAfterError:(id)a3 connected:(BOOL)a4;
- (BOOL)shouldRetryWhenNetworkUnavailable;
- (MBDebugContext)debugContext;
- (MBNetworkAvailabilityProvider)networkAvailabilityProvider;
- (MBRetryStrategy)initWithDebugContext:(id)a3 networkAvailabilityProvider:(id)a4 engineMode:(int)a5 restoreType:(int)a6;
- (MBRetryStrategy)initWithEngine:(id)a3;
- (OS_dispatch_semaphore)retrySemaphore;
- (double)_backoffForError:(id)a3 networkAvailable:(BOOL)a4 attempt:(unsigned int)a5 backoffCache:(id)a6;
- (double)_sleepIntervalAfterError:(id)a3 networkAvailable:(BOOL)a4 attempt:(unsigned int)a5 backoffCache:(id)a6;
- (double)forcedRetryTimeInterval;
- (double)maxServiceRetryAfterInterval;
- (double)minSleepIntervalWhenConnected;
- (double)minSleepIntervalWhenDisconnected;
- (double)resetConsecutiveRetriesTimeInterval;
- (double)sleepIntervalAfterError:(id)a3;
- (double)sleepIntervalAfterError:(id)a3 networkAvailable:(BOOL)a4 attempt:(unsigned int)a5;
- (int64_t)lastConsecutiveRetryStartTime;
- (int64_t)lastNeedsReplenishingTime;
- (int64_t)lastRetryAttemptTime;
- (unsigned)consecutiveRetryCount;
- (unsigned)consecutiveRetryCountWhenConnected;
- (unsigned)consecutiveRetryCountWhenDisconnected;
- (unsigned)maxConsecutiveRetryCountWhenNetworkConnected;
- (unsigned)maxConsecutiveRetryCountWhenNetworkDisconnected;
- (unsigned)totalRetryCount;
- (void)_replenishTokensWithNetworkAvailable:(BOOL)a3;
- (void)cancel;
- (void)replenishRetryTokens;
- (void)reset;
- (void)setConsecutiveRetryCount:(unsigned int)a3;
- (void)setConsecutiveRetryCountWhenConnected:(unsigned int)a3;
- (void)setConsecutiveRetryCountWhenDisconnected:(unsigned int)a3;
- (void)setDebugContext:(id)a3;
- (void)setForcedRetryTimeInterval:(double)a3;
- (void)setLastConsecutiveRetryStartTime:(int64_t)a3;
- (void)setLastNeedsReplenishingTime:(int64_t)a3;
- (void)setLastRetryAttemptTime:(int64_t)a3;
- (void)setMaxServiceRetryAfterInterval:(double)a3;
- (void)setMinSleepIntervalWhenConnected:(double)a3;
- (void)setMinSleepIntervalWhenDisconnected:(double)a3;
- (void)setNetworkAvailabilityProvider:(id)a3;
- (void)setResetConsecutiveRetriesTimeInterval:(double)a3;
- (void)setRetrySemaphore:(id)a3;
- (void)setShouldRetryWhenNetworkUnavailable:(BOOL)a3;
- (void)setTotalRetryCount:(unsigned int)a3;
@end

@implementation MBRetryStrategy

- (MBRetryStrategy)initWithDebugContext:(id)a3 networkAvailabilityProvider:(id)a4 engineMode:(int)a5 restoreType:(int)a6
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MBRetryStrategy;
  v10 = [(MBRetryStrategy *)&v16 init];
  v11 = v10;
  if (v10)
  {
    v10->_engineMode = a5;
    v10->_restoreType = a6;
    if (!v9)
    {
      id v9 = +[MBDebugContext defaultDebugContext];
    }
    [v9 setInt:0 forName:@"RetryCount"];
    objc_storeStrong((id *)&v11->_debugContext, v9);
    [(MBRetryStrategy *)v11 setShouldRetryWhenNetworkUnavailable:1];
    [(MBRetryStrategy *)v11 setMaxServiceRetryAfterInterval:14400.0];
    [(MBRetryStrategy *)v11 setMinSleepIntervalWhenConnected:10.0];
    [(MBRetryStrategy *)v11 minSleepIntervalWhenConnected];
    [(MBRetryStrategy *)v11 setMinSleepIntervalWhenDisconnected:v12 + v12];
    double v13 = 1800.0;
    if (a5 == 1)
    {
      double v14 = 600.0;
    }
    else if (a5 == 2)
    {
      double v14 = 0.0;
    }
    else
    {
      double v13 = 600.0;
      double v14 = 600.0;
    }
    [(MBRetryStrategy *)v11 setResetConsecutiveRetriesTimeInterval:v13];
    [(MBRetryStrategy *)v11 setForcedRetryTimeInterval:v14];
    [(MBRetryStrategy *)v11 reset];
  }

  return v11;
}

- (MBRetryStrategy)initWithEngine:(id)a3
{
  id v4 = a3;
  id v5 = [v4 engineMode];
  if (v5 == 2) {
    id v6 = [v4 restoreType];
  }
  else {
    id v6 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    v7 = v4;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  id v9 = [v4 debugContext];
  v10 = [(MBRetryStrategy *)self initWithDebugContext:v9 networkAvailabilityProvider:v8 engineMode:v5 restoreType:v6];

  return v10;
}

- (unsigned)maxConsecutiveRetryCountWhenNetworkConnected
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int maxTokenCount = v2->_tokenBuckets[1].maxTokenCount;
  objc_sync_exit(v2);

  return maxTokenCount;
}

- (unsigned)maxConsecutiveRetryCountWhenNetworkDisconnected
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int maxTokenCount = v2->_tokenBuckets[0].maxTokenCount;
  objc_sync_exit(v2);

  return maxTokenCount;
}

- (void)reset
{
  v3 = [(MBRetryStrategy *)self debugContext];
  id v4 = [v3 time];

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  [(MBRetryStrategy *)self setRetrySemaphore:v5];

  obj = self;
  objc_sync_enter(obj);
  [(MBRetryStrategy *)obj setLastRetryAttemptTime:v4];
  [(MBRetryStrategy *)obj setLastConsecutiveRetryStartTime:v4];
  [(MBRetryStrategy *)obj setConsecutiveRetryCount:0];
  [(MBRetryStrategy *)obj setConsecutiveRetryCountWhenConnected:0];
  [(MBRetryStrategy *)obj setConsecutiveRetryCountWhenDisconnected:0];
  *(_OWORD *)&obj->_tokenBuckets[0].retryCount = xmmword_1003B3560;
  obj->_tokenBuckets[0].tokensPerInterval = 1;
  obj->_tokenBuckets[0].replenishInterval = 60;
  obj->_tokenBuckets[0].lastReplenishTime = (int64_t)v4;
  *(_OWORD *)&obj->_tokenBuckets[1].retryCount = xmmword_1003B3570;
  obj->_tokenBuckets[1].tokensPerInterval = 1;
  obj->_tokenBuckets[1].replenishInterval = 60;
  obj->_tokenBuckets[1].lastReplenishTime = (int64_t)v4;
  *(_OWORD *)&obj->_tokenBuckets[2].retryCount = xmmword_1003B3570;
  obj->_tokenBuckets[2].tokensPerInterval = 1;
  obj->_tokenBuckets[2].replenishInterval = 1800;
  obj->_tokenBuckets[2].lastReplenishTime = (int64_t)v4;
  if (obj->_engineMode == 2)
  {
    obj->_tokenBuckets[0].unsigned int maxTokenCount = 20;
    *(void *)&obj->_tokenBuckets[0].maxRetryCount = 0x14000000C8;
    obj->_tokenBuckets[1].unsigned int maxTokenCount = 20;
    *(void *)&obj->_tokenBuckets[1].maxRetryCount = 0x14000000C8;
    obj->_tokenBuckets[2].unsigned int maxTokenCount = 10;
    *(void *)&obj->_tokenBuckets[2].maxRetryCount = 0xA00000064;
  }
  objc_sync_exit(obj);
}

+ (BOOL)couldRetryError:(id)a3
{
  v3 = +[MBError underlyingErrorFromCKCancelationError:a3];
  if (+[MBError isError:v3 withCode:2])
  {
    id v4 = [v3 userInfo];
    dispatch_semaphore_t v5 = [v4 objectForKeyedSubscript:@"kMBUnderlyingErrorsKey"];

    if (!v5)
    {
      LOBYTE(v12) = 0;
      goto LABEL_30;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
        if ((+[MBError isError:v11 withCode:2] & 1) != 0
          || !+[MBRetryStrategy couldRetryError:v11])
        {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
          LOBYTE(v12) = 1;
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_28;
        }
      }
LABEL_24:
      LOBYTE(v12) = 0;
LABEL_28:

LABEL_30:
      goto LABEL_31;
    }
    goto LABEL_27;
  }
  if (+[MBError isCKPartialFailureError:v3])
  {
    double v13 = [v3 userInfo];
    dispatch_semaphore_t v5 = [v13 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = [v5 allValues];
    id v14 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
LABEL_16:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v6);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * v17);
        if (+[MBError isCKPartialFailureError:v18]
          || !+[MBRetryStrategy couldRetryError:v18])
        {
          goto LABEL_24;
        }
        if (v15 == (id)++v17)
        {
          id v15 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
          LOBYTE(v12) = 1;
          if (v15) {
            goto LABEL_16;
          }
          goto LABEL_28;
        }
      }
    }
LABEL_27:
    LOBYTE(v12) = 1;
    goto LABEL_28;
  }
  if (+[MBError isCKError:withCodes:](MBError, "isCKError:withCodes:", v3, 3, 4, 6, 21, 9, 1, 17, 0))
  {
    unsigned int v12 = !+[MBError isCKInternalError:v3 withCode:1000];
  }
  else if (+[MBError isError:withCodes:](MBError, "isError:withCodes:", v3, 308, 9, 300, 302, 401, 307, 17, 215, 0))
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    LOBYTE(v12) = +[MBError isRetryableXPCError:v3];
  }
LABEL_31:

  return v12;
}

- (BOOL)canRetryAfterError:(id)a3
{
  id v4 = a3;
  if (+[MBRetryStrategy couldRetryError:v4])
  {
    if (+[MBError isError:v4 withCode:2])
    {
      dispatch_semaphore_t v5 = [v4 userInfo];
      id v6 = [v5 objectForKeyedSubscript:@"kMBUnderlyingErrorsKey"];

      if (!v6)
      {
        BOOL v13 = 0;
        goto LABEL_38;
      }
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v7 = v6;
      id v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v32;
LABEL_6:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * v11);
          if ((+[MBError isError:v12 withCode:2] & 1) != 0
            || ![(MBRetryStrategy *)self canRetryAfterError:v12])
          {
            break;
          }
          if (v9 == (id)++v11)
          {
            id v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
            BOOL v13 = 1;
            if (v9) {
              goto LABEL_6;
            }
            goto LABEL_36;
          }
        }
LABEL_30:
        BOOL v13 = 0;
LABEL_36:

LABEL_38:
        goto LABEL_43;
      }
      goto LABEL_35;
    }
    if (+[MBError isCKPartialFailureError:v4])
    {
      id v14 = [v4 userInfo];
      id v6 = [v14 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v7 = [v6 allValues];
      id v15 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v28;
LABEL_22:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v7);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * v18);
          if (+[MBError isCKPartialFailureError:v19]
            || ![(MBRetryStrategy *)self canRetryAfterError:v19])
          {
            goto LABEL_30;
          }
          if (v16 == (id)++v18)
          {
            id v16 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
            BOOL v13 = 1;
            if (v16) {
              goto LABEL_22;
            }
            goto LABEL_36;
          }
        }
      }
LABEL_35:
      BOOL v13 = 1;
      goto LABEL_36;
    }
    if ([(MBRetryStrategy *)self shouldRetryWhenNetworkUnavailable]
      || !+[MBError isCKError:v4 withCode:3]
      && (+[MBError isError:v4 withCode:308] & 1) == 0)
    {
      goto LABEL_34;
    }
LABEL_42:
    BOOL v13 = 0;
    goto LABEL_43;
  }
  if (self->_restoreType == 1
    && (+[MBError isError:v4 withCode:308] & 1) != 0)
  {
LABEL_34:
    BOOL v13 = 1;
    goto LABEL_43;
  }
  if (!+[MBError isCKError:withCodes:](MBError, "isCKError:withCodes:", v4, 7, 23, 0)) {
    goto LABEL_42;
  }
  if (!+[MBError isNetworkDisconnectedError:v4])
  {
    long long v20 = [v4 userInfo];
    long long v21 = [v20 objectForKeyedSubscript:CKErrorRetryAfterKey];

    double v22 = 10.0;
    if (v21) {
      objc_msgSend(v21, "doubleValue", 10.0);
    }
    double v23 = fmax(v22, 10.0);
    [(MBRetryStrategy *)self maxServiceRetryAfterInterval];
    double v25 = v24;

    if (v23 >= v25) {
      goto LABEL_42;
    }
    goto LABEL_34;
  }
  BOOL v13 = [(MBRetryStrategy *)self shouldRetryWhenNetworkUnavailable];
LABEL_43:

  return v13;
}

- (double)_backoffForError:(id)a3 networkAvailable:(BOOL)a4 attempt:(unsigned int)a5 backoffCache:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = objc_alloc((Class)NSString);
  BOOL v13 = [v10 domain];
  id v14 = [v12 initWithFormat:@"%@|%ld", v13, objc_msgSend(v10, "code")];

  id v15 = self;
  objc_sync_enter(v15);
  id v16 = [v11 objectForKeyedSubscript:v14];
  uint64_t v17 = v16;
  if (v16)
  {
    [v16 doubleValue];
    double v19 = v18;
  }
  else
  {
    if (v8)
    {
      [(MBRetryStrategy *)v15 minSleepIntervalWhenConnected];
      double v21 = v20;
      if (v15->_engineMode == 2) {
        double v22 = 90.0;
      }
      else {
        double v22 = 60.0;
      }
      if (+[MBError isCKError:withCodes:](MBError, "isCKError:withCodes:", v10, 4, 3, 0)
        || (double v23 = 20.0,
            +[MBError isError:withCodes:](MBError, "isError:withCodes:", v10, 300, 308, 0)))
      {
        double v23 = 10.0;
      }
    }
    else
    {
      [(MBRetryStrategy *)v15 minSleepIntervalWhenDisconnected];
      double v21 = v24;
      if (v15->_engineMode == 2) {
        double v22 = 90.0;
      }
      else {
        double v22 = 60.0;
      }
      double v23 = 20.0;
    }
    double v25 = fmin(v22, fmax(v21, exp2((double)a5) * v23));
    uint32_t v26 = arc4random_uniform((v25 * 0.5));
    long long v27 = MBGetDefaultLog();
    double v19 = fmax(v21, v25 * 0.5) + (double)v26;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218752;
      double v31 = v19;
      __int16 v32 = 2048;
      double v33 = v25;
      __int16 v34 = 1024;
      uint32_t v35 = v26;
      __int16 v36 = 1024;
      unsigned int v37 = a5;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=retry= backoff, %.3f, %.3f, %u, %u", buf, 0x22u);
      _MBLog();
    }

    long long v28 = +[NSNumber numberWithDouble:v19];
    [v11 setObject:v28 forKeyedSubscript:v14];
  }
  objc_sync_exit(v15);

  return v19;
}

- (double)_sleepIntervalAfterError:(id)a3 networkAvailable:(BOOL)a4 attempt:(unsigned int)a5 backoffCache:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (v8) {
    [(MBRetryStrategy *)self minSleepIntervalWhenConnected];
  }
  else {
    [(MBRetryStrategy *)self minSleepIntervalWhenDisconnected];
  }
  double v13 = v12;
  if (!+[MBError isCKError:v10])
  {
    uint32_t v26 = [v10 domain];
    unsigned int v27 = [v26 isEqualToString:@"MBErrorDomain"];

    if (!v27)
    {
      double v20 = v13;
      if (+[MBError isRetryableXPCError:v10])
      {
        [(MBRetryStrategy *)self _backoffForError:v10 networkAvailable:v8 attempt:v7 backoffCache:v11];
        double v20 = v42;
      }
      goto LABEL_40;
    }
    if (+[MBError isError:v10 withCode:2])
    {
      id v53 = v10;
      long long v28 = [v10 userInfo];
      long long v29 = [v28 objectForKeyedSubscript:@"kMBUnderlyingErrorsKey"];

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v30 = v29;
      id v31 = [v30 countByEnumeratingWithState:&v55 objects:v63 count:16];
      double v20 = v13;
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v56;
        double v20 = v13;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(void *)v56 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            if ((+[MBError isError:v35 withCode:2] & 1) == 0)
            {
              [(MBRetryStrategy *)self _sleepIntervalAfterError:v35 networkAvailable:v8 attempt:v7 backoffCache:v11];
              double v20 = fmax(v20, v36);
            }
          }
          id v32 = [v30 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v32);
      }

      goto LABEL_28;
    }
    if (+[MBError isError:withCodes:](MBError, "isError:withCodes:", v10, 308, 0)
      || +[MBError isError:withCodes:](MBError, "isError:withCodes:", v10, 300, 0))
    {
      [(MBRetryStrategy *)self _backoffForError:v10 networkAvailable:v8 attempt:v7 backoffCache:v11];
      v44 = 0;
    }
    else
    {
      id v54 = 0;
      unsigned int v46 = +[MBError isRetryAfterError:v10 retryAfterDate:&v54];
      id v47 = v54;
      v44 = v47;
      if (!v46)
      {
        double v20 = v13;
        goto LABEL_39;
      }
      [v47 timeIntervalSinceNow];
      double v49 = ceil(v48);
      [(MBRetryStrategy *)self maxServiceRetryAfterInterval];
      double v43 = fmin(v49, v50);
    }
    double v20 = fmax(v13, v43);
LABEL_39:

    goto LABEL_40;
  }
  unsigned int v14 = +[MBError isCKPartialFailureError:v10];
  id v15 = [v10 userInfo];
  id v16 = v15;
  if (v14)
  {
    id v53 = v10;
    uint64_t v17 = [v15 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v52 = v17;
    double v18 = [v17 allValues];
    id v19 = [v18 countByEnumeratingWithState:&v59 objects:v64 count:16];
    double v20 = v13;
    if (v19)
    {
      id v21 = v19;
      uint64_t v22 = *(void *)v60;
      double v20 = v13;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v60 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v59 + 1) + 8 * (void)j);
          if (!+[MBError isCKPartialFailureError:v24])
          {
            [(MBRetryStrategy *)self _sleepIntervalAfterError:v24 networkAvailable:v8 attempt:v7 backoffCache:v11];
            double v20 = fmax(v20, v25);
          }
        }
        id v21 = [v18 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v21);
    }

LABEL_28:
    id v10 = v53;
    goto LABEL_40;
  }
  unsigned int v37 = [v15 objectForKeyedSubscript:CKErrorRetryAfterKey];

  [v37 doubleValue];
  double v39 = v38;
  [(MBRetryStrategy *)self maxServiceRetryAfterInterval];
  double v20 = fmax(v13, fmin(v39, v40));
  if (+[MBError isCKError:withCodes:](MBError, "isCKError:withCodes:", v10, 3, 0)
    || +[MBError isCKError:withCodes:](MBError, "isCKError:withCodes:", v10, 4, 0))
  {
    [(MBRetryStrategy *)self _backoffForError:v10 networkAvailable:v8 attempt:v7 backoffCache:v11];
    double v20 = fmax(v20, v41);
  }
  else if (+[MBError isCKError:withCodes:](MBError, "isCKError:withCodes:", v10, 6, 7, 23, 21, 9, 1, 0))
  {
    if (v37)
    {
      double v20 = ceil(v20);
    }
    else
    {
      [(MBRetryStrategy *)self _backoffForError:v10 networkAvailable:v8 attempt:v7 backoffCache:v11];
      double v20 = v51;
    }
  }

LABEL_40:
  return fmax(v20, v13);
}

- (double)sleepIntervalAfterError:(id)a3 networkAvailable:(BOOL)a4 attempt:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_opt_new();
  [(MBRetryStrategy *)self _sleepIntervalAfterError:v8 networkAvailable:v6 attempt:v5 backoffCache:v9];
  double v11 = v10;

  return v11;
}

- (double)sleepIntervalAfterError:(id)a3
{
  [(MBRetryStrategy *)self sleepIntervalAfterError:a3 networkAvailable:1 attempt:1];
  return result;
}

- (BOOL)_sleep:(double)a3
{
  uint64_t v5 = [(MBRetryStrategy *)self debugContext];
  unsigned int v6 = [v5 isFlagSet:@"RetryStrategyShouldNotSleep"];

  if (v6)
  {
    uint64_t v7 = [(MBRetryStrategy *)self debugContext];
    double v8 = (double)(int)[v7 intForName:@"RetryStrategyWouldSleep"];

    id v9 = [(MBRetryStrategy *)self debugContext];
    [v9 setInt:(int)(v8 + a3) forName:@"RetryStrategyWouldSleep"];

    return 1;
  }
  else
  {
    uint64_t v11 = [(MBRetryStrategy *)self retrySemaphore];
    if (!v11) {
      __assert_rtn("-[MBRetryStrategy _sleep:]", "MBRetryStrategy.m", 393, "semaphore && \"Retry after cancelation\"");
    }
    double v12 = v11;
    dispatch_time_t v13 = dispatch_time(0, 1000000 * (uint64_t)(a3 * 1000.0));
    intptr_t v14 = dispatch_semaphore_wait(v12, v13);
    if (!v14)
    {
      id v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v18 = a3;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=retry= Sleep canceled for (%.3fs)", buf, 0xCu);
        _MBLog();
      }

      [(MBRetryStrategy *)self setRetrySemaphore:0];
    }
    BOOL v10 = v14 != 0;
  }
  return v10;
}

- (BOOL)_shouldRetryAfterError:(id)a3 networkAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(MBRetryStrategy *)self debugContext];
  double v8 = [v7 time];

  id v9 = self;
  objc_sync_enter(v9);
  [(MBRetryStrategy *)v9 forcedRetryTimeInterval];
  if (v10 <= 0.0)
  {
    BOOL v13 = 0;
  }
  else
  {
    uint64_t v11 = [(MBRetryStrategy *)v9 lastRetryAttemptTime];
    [(MBRetryStrategy *)v9 forcedRetryTimeInterval];
    BOOL v13 = v12 < (double)(v8 - v11);
  }
  intptr_t v14 = [(MBRetryStrategy *)v9 lastConsecutiveRetryStartTime];
  [(MBRetryStrategy *)v9 resetConsecutiveRetriesTimeInterval];
  if (v15 >= (double)(v8 - v14))
  {
    objc_sync_exit(v9);

    if (v6) {
      goto LABEL_10;
    }
LABEL_17:
    double v20 = MBGetDefaultLog();
    BOOL v23 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v23)
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v45 = v9;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=retry= %{public}@: Forcing retry after success", buf, 0xCu);
        _MBLog();
      }
      goto LABEL_32;
    }
    if (v23)
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v45 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=retry= %{public}@: Not retrying after success", buf, 0xCu);
      _MBLog();
    }
LABEL_37:
    BOOL v37 = 0;
    goto LABEL_40;
  }
  id v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v45 = [(MBRetryStrategy *)v9 consecutiveRetryCountWhenConnected];
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = [(MBRetryStrategy *)v9 consecutiveRetryCountWhenDisconnected];
      LOWORD(v46) = 1024;
      *(_DWORD *)((char *)&v46 + 2) = [(MBRetryStrategy *)v9 consecutiveRetryCount];
      HIWORD(v46) = 2048;
      v47[0] = [(MBRetryStrategy *)v9 lastConsecutiveRetryStartTime];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=retry= Resetting the consecutive retry counters (%u/%u/%u/%ld)", buf, 0x1Eu);
    }

    id v18 = (id)[(MBRetryStrategy *)v9 consecutiveRetryCountWhenConnected];
    id v19 = (id)[(MBRetryStrategy *)v9 consecutiveRetryCountWhenDisconnected];
    id v41 = (id)[(MBRetryStrategy *)v9 consecutiveRetryCount];
    id v42 = [(MBRetryStrategy *)v9 lastConsecutiveRetryStartTime];
    id v39 = v18;
    id v40 = v19;
    _MBLog();
  }

  [(MBRetryStrategy *)v9 setConsecutiveRetryCount:0];
  [(MBRetryStrategy *)v9 setConsecutiveRetryCountWhenConnected:0];
  [(MBRetryStrategy *)v9 setConsecutiveRetryCountWhenDisconnected:0];
  [(MBRetryStrategy *)v9 setLastConsecutiveRetryStartTime:v8];
  objc_sync_exit(v9);

  [(MBRetryStrategy *)v9 replenishRetryTokens];
  [(MBRetryStrategy *)v9 _replenishTokensWithNetworkAvailable:v4];
  if (!v6) {
    goto LABEL_17;
  }
LABEL_10:
  double v20 = +[MBError loggableDescriptionForError:](MBError, "loggableDescriptionForError:", v6, v39, v40, v41, v42);
  if (![(MBRetryStrategy *)v9 canRetryAfterError:v6])
  {
    uint64_t v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)v45 = v9;
      *(_WORD *)&v45[8] = 2114;
      double v46 = *(double *)&v20;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=retry= %{public}@: Not retrying after unrecoverable error: %{public}@", buf, 0x16u);
      _MBLog();
    }

    goto LABEL_37;
  }
  [(MBRetryStrategy *)v9 _replenishTokensWithNetworkAvailable:v4];
  unsigned int v43 = 0;
  unsigned int v21 = [(MBRetryStrategy *)v9 _consumeTokensAfterError:v6 networkAvailable:v4 attempt:&v43];
  if (v21 | !v4 || !v13)
  {
    if (!v21)
    {
LABEL_34:
      double v36 = MBGetDefaultLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)v45 = v9;
        *(_WORD *)&v45[8] = 2114;
        double v46 = *(double *)&v20;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "=retry= %{public}@: Not retrying after error: %{public}@", buf, 0x16u);
        _MBLog();
      }

      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)v45 = v9;
      *(_WORD *)&v45[8] = 2114;
      double v46 = *(double *)&v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "=retry= %{public}@: Forcing retry after error: %{public}@", buf, 0x16u);
      _MBLog();
    }
  }
  uint64_t v25 = v43;
  uint32_t v26 = objc_opt_new();
  [(MBRetryStrategy *)v9 _sleepIntervalAfterError:v6 networkAvailable:v4 attempt:v25 backoffCache:v26];
  double v28 = v27;

  long long v29 = MBGetDefaultLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)v45 = v9;
    *(_WORD *)&v45[8] = 2048;
    double v46 = v28;
    LOWORD(v47[0]) = 2114;
    *(void *)((char *)v47 + 2) = v20;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "=retry= %{public}@: Sleeping for %.3fs after error: %{public}@", buf, 0x20u);
    _MBLog();
  }

  if (![(MBRetryStrategy *)v9 _sleep:v28]) {
    goto LABEL_34;
  }
  id v30 = MBGetDefaultLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)v45 = v9;
    *(_WORD *)&v45[8] = 2114;
    double v46 = *(double *)&v20;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "=retry= %{public}@: Retrying after error: %{public}@", buf, 0x16u);
    _MBLog();
  }

LABEL_32:
  id WeakRetained = objc_loadWeakRetained((id *)&v9->_networkAvailabilityProvider);
  unsigned int v32 = [WeakRetained isNetworkAvailable];

  uint64_t v33 = [(MBRetryStrategy *)v9 debugContext];
  id v34 = [v33 time];

  uint64_t v35 = v9;
  objc_sync_enter(v35);
  [v35 setLastRetryAttemptTime:v34];
  objc_msgSend(v35, "setConsecutiveRetryCount:", objc_msgSend(v35, "consecutiveRetryCount") + 1);
  objc_msgSend(v35, "setTotalRetryCount:", objc_msgSend(v35, "totalRetryCount") + 1);
  if (v32)
  {
    objc_msgSend(v35, "setConsecutiveRetryCountWhenConnected:", objc_msgSend(v35, "consecutiveRetryCountWhenConnected") + 1);
    [v35 setConsecutiveRetryCountWhenDisconnected:0];
  }
  else
  {
    objc_msgSend(v35, "setConsecutiveRetryCountWhenDisconnected:", objc_msgSend(v35, "consecutiveRetryCountWhenDisconnected") + 1);
    [v35 setConsecutiveRetryCountWhenConnected:0];
  }
  objc_sync_exit(v35);

  double v20 = [v35 debugContext];
  [v20 setInt:v35[40] forName:@"RetryCount"];
  BOOL v37 = 1;
LABEL_40:

  return v37;
}

- (BOOL)shouldRetryAfterError:(id)a3 connected:(BOOL)a4
{
  return [(MBRetryStrategy *)self _shouldRetryAfterError:a3 networkAvailable:a4];
}

- (BOOL)shouldRetryAfterError:(id)a3
{
  v3 = self;
  p_networkAvailabilityProvider = &self->_networkAvailabilityProvider;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_networkAvailabilityProvider);
  id v7 = [WeakRetained isNetworkAvailable];

  LOBYTE(v3) = [(MBRetryStrategy *)v3 shouldRetryAfterError:v5 connected:v7];
  return (char)v3;
}

- (void)cancel
{
  v2 = [(MBRetryStrategy *)self retrySemaphore];
  if (v2)
  {
    v3 = v2;
    dispatch_semaphore_signal(v2);
    v2 = v3;
  }
}

- (BOOL)_consumeTokensAfterError:(id)a3 networkAvailable:(BOOL)a4 attempt:(unsigned int *)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  BOOL v27 = v5;
  if (v5)
  {
    if (+[MBError isCKError:matchingSubErrors:withCodes:](MBError, "isCKError:matchingSubErrors:withCodes:", v7, 1, 3, 4, 6, 7, 23, 0)|| +[MBError isError:withCodes:](MBError, "isError:withCodes:", v7, 308, 300, 0))
    {
      unsigned int v8 = !+[MBError isNetworkDisconnectedError:v7];
    }
    else
    {
      unsigned int v8 = 2;
    }
    unsigned int v30 = v8;
  }
  else
  {
    unsigned int v30 = 0;
  }
  long long v29 = +[MBError loggableDescriptionForError:v7];
  id v9 = self;
  objc_sync_enter(v9);
  tokenBuckets = v9->_tokenBuckets;
  uint64_t v11 = &v9->_tokenBuckets[v30];
  unsigned int retryCount = v11->retryCount;
  p_unsigned int tokenCount = &v11->tokenCount;
  unsigned int tokenCount = v11->tokenCount;
  if (v11->retryCount < v11->maxRetryCount && tokenCount)
  {
    *p_unsigned int tokenCount = --tokenCount;
    v11->unsigned int retryCount = retryCount + 1;
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }
  id v16 = &tokenBuckets[v30];
  unsigned int maxTokenCount = v16->maxTokenCount;
  p_unsigned int maxTokenCount = &v16->maxTokenCount;
  *a5 = maxTokenCount - tokenCount;
  id v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    double v20 = v19;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v23 = *p_tokenCount;
      unsigned int v24 = *p_maxTokenCount;
      unsigned int v25 = v11->retryCount;
      unsigned int maxRetryCount = v11->maxRetryCount;
      int64_t lastReplenishTime = tokenBuckets[v30].lastReplenishTime;
      *(_DWORD *)buf = 138546690;
      unsigned int v32 = v9;
      __int16 v33 = 1024;
      BOOL v34 = v15;
      __int16 v35 = 1024;
      BOOL v36 = v27;
      __int16 v37 = 1024;
      unsigned int v38 = v30;
      __int16 v39 = 1024;
      unsigned int v40 = v23;
      __int16 v41 = 1024;
      unsigned int v42 = v24;
      __int16 v43 = 1024;
      unsigned int v44 = v25;
      __int16 v45 = 1024;
      unsigned int v46 = maxRetryCount;
      __int16 v47 = 2048;
      int64_t v48 = lastReplenishTime;
      __int16 v49 = 1024;
      unsigned int v50 = [(MBRetryStrategy *)v9 consecutiveRetryCountWhenConnected];
      __int16 v51 = 1024;
      unsigned int v52 = [(MBRetryStrategy *)v9 consecutiveRetryCountWhenDisconnected];
      __int16 v53 = 1024;
      unsigned int v54 = [(MBRetryStrategy *)v9 consecutiveRetryCount];
      __int16 v55 = 1024;
      unsigned int v56 = [(MBRetryStrategy *)v9 totalRetryCount];
      __int16 v57 = 2112;
      long long v58 = v29;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=retry= %{public}@: %d, isNetworkAvailable:%d, bucket[%d]:%u/%u|%u/%u|%lu, rc:%u|%u|%u|%u: %@", buf, 0x62u);
    }

    [(MBRetryStrategy *)v9 consecutiveRetryCountWhenConnected];
    [(MBRetryStrategy *)v9 consecutiveRetryCountWhenDisconnected];
    [(MBRetryStrategy *)v9 consecutiveRetryCount];
    [(MBRetryStrategy *)v9 totalRetryCount];
    _MBLog();
  }

  objc_sync_exit(v9);
  if (v15 && !*a5) {
    __assert_rtn("-[MBRetryStrategy _consumeTokensAfterError:networkAvailable:attempt:]", "MBRetryStrategy.m", 526, "!result || 0 < *attempt");
  }

  return v15;
}

- (void)_replenishTokensWithNetworkAvailable:(BOOL)a3
{
  if (atomic_exchange((atomic_uchar *volatile)&self->_needsReplenishing, 0))
  {
    BOOL v3 = a3;
    int64_t v5 = [(MBRetryStrategy *)self lastNeedsReplenishingTime];
    if (!v5) {
      __assert_rtn("-[MBRetryStrategy _replenishTokensWithNetworkAvailable:]", "MBRetryStrategy.m", 533, "lastNeedsReplenishingTime != 0");
    }
    int64_t v6 = v5;
    id v7 = [(MBRetryStrategy *)self debugContext];
    id v8 = [v7 time];

    id v9 = self;
    objc_sync_enter(v9);
    uint64_t v10 = 0;
    p_unsigned int tokenCount = &v9->_tokenBuckets[0].tokenCount;
    do
    {
      if (v10 || v3)
      {
        uint64_t v12 = *((void *)p_tokenCount + 2);
        uint64_t v13 = v6 - *((void *)p_tokenCount + 3);
        if (v13 < 0) {
          uint64_t v13 = *((void *)p_tokenCount + 3) - v6;
        }
        if (!v12) {
          __assert_rtn("-[MBRetryStrategy _replenishTokensWithNetworkAvailable:]", "MBRetryStrategy.m", 548, "replenishInterval != 0");
        }
        if (v13 >= v12)
        {
          uint64_t v14 = v13 / v12;
          if (v14 >= (uint64_t)&_mh_execute_header) {
            __assert_rtn("-[MBRetryStrategy _replenishTokensWithNetworkAvailable:]", "MBRetryStrategy.m", 553, "intervals <= UINT32_MAX");
          }
          unsigned int v15 = *p_tokenCount + p_tokenCount[2] * v14;
          if (p_tokenCount[1] < v15) {
            unsigned int v15 = p_tokenCount[1];
          }
          *p_unsigned int tokenCount = v15;
          *((void *)p_tokenCount + 3) = v8;
          id v16 = MBGetDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v17 = *p_tokenCount;
            unsigned int v18 = p_tokenCount[1];
            int v19 = *(p_tokenCount - 2);
            int v20 = *(p_tokenCount - 1);
            uint64_t v21 = *((void *)p_tokenCount + 3);
            *(_DWORD *)buf = 138545410;
            unsigned int v23 = v9;
            __int16 v24 = 1024;
            BOOL v25 = v3;
            __int16 v26 = 1024;
            int v27 = v10;
            __int16 v28 = 1024;
            unsigned int v29 = v17;
            __int16 v30 = 1024;
            unsigned int v31 = v18;
            __int16 v32 = 1024;
            int v33 = v19;
            __int16 v34 = 1024;
            int v35 = v20;
            __int16 v36 = 2048;
            uint64_t v37 = v21;
            __int16 v38 = 2048;
            int64_t v39 = v6;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=retry= %{public}@: isNetworkAvailable:%d, bucket[%d]:%u/%u,%u/%u,%ld,%ld", buf, 0x44u);
            _MBLog();
          }
        }
      }
      ++v10;
      p_tokenCount += 10;
    }
    while (v10 != 3);
    objc_sync_exit(v9);
  }
}

- (void)replenishRetryTokens
{
  BOOL v3 = [(MBRetryStrategy *)self debugContext];
  id v4 = [v3 time];

  [(MBRetryStrategy *)self setLastNeedsReplenishingTime:v4];
  if ((atomic_exchange((atomic_uchar *volatile)&self->_needsReplenishing, 1u) & 1) == 0)
  {
    int64_t v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v7 = self;
      __int16 v8 = 2048;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "=retry= %{public}@: scheduled token replenishing (%ld)", buf, 0x16u);
      _MBLog();
    }
  }
}

- (unsigned)consecutiveRetryCount
{
  return self->_consecutiveRetryCount;
}

- (void)setConsecutiveRetryCount:(unsigned int)a3
{
  self->_consecutiveRetryCount = a3;
}

- (BOOL)shouldRetryWhenNetworkUnavailable
{
  return self->_shouldRetryWhenNetworkUnavailable;
}

- (void)setShouldRetryWhenNetworkUnavailable:(BOOL)a3
{
  self->_shouldRetryWhenNetworkUnavailable = a3;
}

- (MBDebugContext)debugContext
{
  return self->_debugContext;
}

- (void)setDebugContext:(id)a3
{
}

- (MBNetworkAvailabilityProvider)networkAvailabilityProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkAvailabilityProvider);
  return (MBNetworkAvailabilityProvider *)WeakRetained;
}

- (void)setNetworkAvailabilityProvider:(id)a3
{
}

- (OS_dispatch_semaphore)retrySemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRetrySemaphore:(id)a3
{
}

- (int64_t)lastRetryAttemptTime
{
  return self->_lastRetryAttemptTime;
}

- (void)setLastRetryAttemptTime:(int64_t)a3
{
  self->_lastRetryAttemptTime = a3;
}

- (unsigned)consecutiveRetryCountWhenConnected
{
  return self->_consecutiveRetryCountWhenConnected;
}

- (void)setConsecutiveRetryCountWhenConnected:(unsigned int)a3
{
  self->_consecutiveRetryCountWhenConnected = a3;
}

- (unsigned)consecutiveRetryCountWhenDisconnected
{
  return self->_consecutiveRetryCountWhenDisconnected;
}

- (void)setConsecutiveRetryCountWhenDisconnected:(unsigned int)a3
{
  self->_consecutiveRetryCountWhenDisconnected = a3;
}

- (unsigned)totalRetryCount
{
  return self->_totalRetryCount;
}

- (void)setTotalRetryCount:(unsigned int)a3
{
  self->_totalRetryCount = a3;
}

- (int64_t)lastConsecutiveRetryStartTime
{
  return self->_lastConsecutiveRetryStartTime;
}

- (void)setLastConsecutiveRetryStartTime:(int64_t)a3
{
  self->_lastConsecutiveRetryStartTime = a3;
}

- (int64_t)lastNeedsReplenishingTime
{
  return self->_lastNeedsReplenishingTime;
}

- (void)setLastNeedsReplenishingTime:(int64_t)a3
{
  self->_lastNeedsReplenishingTime = a3;
}

- (double)resetConsecutiveRetriesTimeInterval
{
  return self->_resetConsecutiveRetriesTimeInterval;
}

- (void)setResetConsecutiveRetriesTimeInterval:(double)a3
{
  self->_resetConsecutiveRetriesTimeInterval = a3;
}

- (double)forcedRetryTimeInterval
{
  return self->_forcedRetryTimeInterval;
}

- (void)setForcedRetryTimeInterval:(double)a3
{
  self->_forcedRetryTimeInterval = a3;
}

- (double)maxServiceRetryAfterInterval
{
  return self->_maxServiceRetryAfterInterval;
}

- (void)setMaxServiceRetryAfterInterval:(double)a3
{
  self->_maxServiceRetryAfterInterval = a3;
}

- (double)minSleepIntervalWhenConnected
{
  return self->_minSleepIntervalWhenConnected;
}

- (void)setMinSleepIntervalWhenConnected:(double)a3
{
  self->_minSleepIntervalWhenConnected = a3;
}

- (double)minSleepIntervalWhenDisconnected
{
  return self->_minSleepIntervalWhenDisconnected;
}

- (void)setMinSleepIntervalWhenDisconnected:(double)a3
{
  self->_minSleepIntervalWhenDisconnected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retrySemaphore, 0);
  objc_destroyWeak((id *)&self->_networkAvailabilityProvider);
  objc_storeStrong((id *)&self->_debugContext, 0);
}

@end