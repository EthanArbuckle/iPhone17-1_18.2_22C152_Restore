@interface NSError
+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5;
+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlying:(id)a6;
+ (void)setDefaultRetryIntervalForTests:(double)a3;
- (BOOL)_isCKServerInternalError;
- (BOOL)_isRetryableAKError;
- (BOOL)_isRetryableNSURLError;
- (BOOL)ckksIsCKErrorRecordChangedError;
- (BOOL)isCKInternalServerHTTPError;
- (BOOL)isCKKSServerPluginError:(int64_t)a3;
- (BOOL)isCKServerInternalError;
- (BOOL)isCuttlefishError:(int64_t)a3;
- (BOOL)isRetryable;
- (double)cuttlefishRetryAfter;
- (double)retryInterval;
@end

@implementation NSError

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlying:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  [v12 setObject:v10 forKeyedSubscript:NSLocalizedDescriptionKey];

  [v12 setObject:v9 forKeyedSubscript:NSUnderlyingErrorKey];
  v13 = +[NSError errorWithDomain:v11 code:a4 userInfo:v12];

  return (NSError *)v13;
}

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  return +[NSError errorWithDomain:a3 code:a4 description:a5 underlying:0];
}

- (BOOL)isCKInternalServerHTTPError
{
  v3 = [(NSError *)self userInfo];
  v4 = [v3 objectForKeyedSubscript:NSUnderlyingErrorKey];

  v5 = [(NSError *)self domain];
  if ([v5 isEqualToString:CKErrorDomain])
  {
    NSInteger v6 = [(NSError *)self code];
    BOOL v7 = 0;
    if (v6 == 15 && v4)
    {
      v8 = [v4 domain];
      if ([v8 isEqualToString:CKUnderlyingErrorDomain]) {
        BOOL v7 = [v4 code] == (id)2001;
      }
      else {
        BOOL v7 = 0;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isCKServerInternalError
{
  v3 = [(NSError *)self userInfo];
  v4 = [v3 objectForKeyedSubscript:NSUnderlyingErrorKey];

  v5 = [(NSError *)self domain];
  if ([v5 isEqualToString:CKErrorDomain])
  {
    NSInteger v6 = [(NSError *)self code];
    BOOL v7 = 0;
    if (v6 == 15 && v4)
    {
      v8 = [v4 domain];
      if ([v8 isEqualToString:CKUnderlyingErrorDomain]) {
        BOOL v7 = [v4 code] == (id)2000;
      }
      else {
        BOOL v7 = 0;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isCKKSServerPluginError:(int64_t)a3
{
  v5 = [(NSError *)self userInfo];
  NSInteger v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];

  BOOL v7 = [v6 userInfo];
  v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

  id v9 = [(NSError *)self domain];
  if ([v9 isEqualToString:CKErrorDomain])
  {
    BOOL v10 = 0;
    if ((id)[(NSError *)self code] == (id)15 && v6)
    {
      id v11 = [v6 domain];
      if (![v11 isEqualToString:CKUnderlyingErrorDomain]
        || ([v6 code] == (id)6000 ? (BOOL v12 = v8 == 0) : (BOOL v12 = 1), v12))
      {
        BOOL v10 = 0;
      }
      else
      {
        v13 = [v8 domain];
        if ([v13 isEqualToString:@"CloudkitKeychainService"]) {
          BOOL v10 = [v8 code] == (id)a3;
        }
        else {
          BOOL v10 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)ckksIsCKErrorRecordChangedError
{
  v3 = [(NSError *)self userInfo];
  v4 = [v3 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  v5 = [(NSError *)self domain];
  if (![v5 isEqualToString:CKErrorDomain] || (id)-[NSError code](self, "code") != (id)2)
  {

    goto LABEL_18;
  }

  if (!v4)
  {
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  NSInteger v6 = [v4 objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        BOOL v12 = [v11 domain];
        if (![v12 isEqualToString:CKErrorDomain])
        {

LABEL_21:
          BOOL v14 = 0;
          goto LABEL_22;
        }
        if ([v11 code] == (id)22 || objc_msgSend(v11, "code") == (id)14)
        {
        }
        else
        {
          id v13 = [v11 code];

          if (v13 != (id)11) {
            goto LABEL_21;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_22:

LABEL_19:
  return v14;
}

- (double)retryInterval
{
  v2 = self;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = sub_1001AFCAC;
  long long v18 = sub_1001AFCBC;
  id v19 = 0;
  v3 = [(NSError *)v2 domain];
  unsigned int v4 = [v3 isEqualToString:@"CKErrorDomain"];

  if (v4)
  {
    if ((id)[(NSError *)v2 code] == (id)2)
    {
      v5 = [(NSError *)v2 userInfo];
      NSInteger v6 = [v5 objectForKeyedSubscript:@"CKPartialErrors"];

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1001AFCC4;
      v13[3] = &unk_100306A60;
      v13[4] = &v14;
      [v6 enumerateKeysAndObjectsUsingBlock:v13];
    }
    else
    {
      NSInteger v6 = [(NSError *)v2 userInfo];
      uint64_t v7 = [v6 objectForKeyedSubscript:@"CKRetryAfter"];
      id v8 = (void *)v15[5];
      v15[5] = v7;
    }
  }
  uint64_t v9 = (void *)v15[5];
  if (v9)
  {
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }
  _Block_object_dispose(&v14, 8);

  [(NSError *)v2 cuttlefishRetryAfter];
  if (v11 >= result) {
    double result = v11;
  }
  if (result == 0.0) {
    return *(double *)&qword_10035C278;
  }
  return result;
}

- (double)cuttlefishRetryAfter
{
  v2 = self;
  v3 = [(NSError *)v2 domain];
  double v4 = 0.0;
  if (![v3 isEqualToString:@"CKErrorDomain"]) {
    goto LABEL_9;
  }
  id v5 = [(NSError *)v2 code];

  if (v5 == (id)15)
  {
    NSInteger v6 = [(NSError *)v2 userInfo];
    v3 = [v6 objectForKeyedSubscript:NSUnderlyingErrorKey];

    uint64_t v7 = [v3 domain];
    if ([v7 isEqualToString:@"CKInternalErrorDomain"])
    {
      id v8 = [v3 code];

      if (v8 != (id)6000)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v9 = [v3 userInfo];
      uint64_t v7 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];

      double v10 = [v7 domain];
      LODWORD(v9) = [v10 isEqualToString:@"CuttlefishError"];

      if (v9)
      {
        double v11 = [v7 userInfo];
        BOOL v12 = [v11 objectForKeyedSubscript:@"retryafter"];

        if (v12)
        {
          [v12 doubleValue];
          double v4 = v13;
        }
      }
    }

    goto LABEL_9;
  }
LABEL_10:

  return v4;
}

- (BOOL)isRetryable
{
  if ([(NSError *)self isCuttlefishError:1021]
    || [(NSError *)self isCuttlefishError:1019]
    || [(NSError *)self isCuttlefishError:1002]
    || [(NSError *)self isCuttlefishError:1004]
    || [(NSError *)self isCuttlefishError:1016]
    || [(NSError *)self isCuttlefishError:1017]
    || [(NSError *)self isCuttlefishError:1038])
  {
    goto LABEL_8;
  }
  double v4 = [(NSError *)self domain];
  unsigned int v5 = [v4 isEqualToString:@"com.apple.security.trustedpeers.container"];

  if (v5)
  {
    LOBYTE(v3) = (id)[(NSError *)self code] == (id)36;
    return v3;
  }
  if ([(NSError *)self _isRetryableNSURLError]) {
    goto LABEL_8;
  }
  NSInteger v6 = [(NSError *)self domain];
  unsigned int v7 = [v6 isEqualToString:@"CKErrorDomain"];

  if (v7)
  {
    id v8 = [(NSError *)self userInfo];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"CKRetryAfter"];

    if (!v9)
    {
      unint64_t v10 = [(NSError *)self code];
      if (v10 >= 8) {
        LOBYTE(v3) = 0;
      }
      else {
        return (0x98u >> v10) & 1;
      }
      return v3;
    }
LABEL_8:
    LOBYTE(v3) = 1;
    return v3;
  }
  if ([(NSError *)self _isCKServerInternalError]) {
    goto LABEL_8;
  }

  LOBYTE(v3) = [(NSError *)self _isRetryableAKError];
  return v3;
}

- (BOOL)_isRetryableAKError
{
  BOOL v3 = [(NSError *)self userInfo];
  double v4 = [v3 objectForKeyedSubscript:NSUnderlyingErrorKey];

  unsigned int v5 = [(NSError *)self domain];
  unsigned __int8 v6 = 0;
  if ([v5 isEqualToString:@"AKAuthenticationError"] && v4) {
    unsigned __int8 v6 = [v4 _isRetryableNSURLError];
  }

  return v6;
}

- (BOOL)_isRetryableNSURLError
{
  v2 = self;
  BOOL v3 = [(NSError *)v2 domain];
  unsigned int v4 = [v3 isEqualToString:NSURLErrorDomain];

  if (v4) {
    BOOL v5 = (((unint64_t)[(NSError *)v2 code] + 1009) & 0xFFFFFFFFFFFFFFF7) == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isCuttlefishError:(int64_t)a3
{
  unsigned int v4 = self;
  BOOL v5 = [(NSError *)v4 domain];
  if (![v5 isEqualToString:@"CKErrorDomain"]) {
    goto LABEL_8;
  }
  id v6 = [(NSError *)v4 code];

  if (v6 == (id)15)
  {
    unsigned int v7 = [(NSError *)v4 userInfo];
    BOOL v5 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v8 = [v5 domain];
    if (![v8 isEqualToString:@"CKInternalErrorDomain"]) {
      goto LABEL_11;
    }
    id v9 = [v5 code];

    if (v9 == (id)6000)
    {
      unint64_t v10 = [v5 userInfo];
      id v8 = [v10 objectForKeyedSubscript:NSUnderlyingErrorKey];

      double v11 = [v8 domain];
      if ([v11 isEqualToString:@"CuttlefishError"])
      {
        id v12 = [v8 code];

        if (v12 == (id)a3)
        {
          BOOL v13 = 1;
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
      }
LABEL_11:
      BOOL v13 = 0;
      goto LABEL_12;
    }
LABEL_8:
    BOOL v13 = 0;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)_isCKServerInternalError
{
  BOOL v3 = [(NSError *)self userInfo];
  unsigned int v4 = [v3 objectForKeyedSubscript:NSUnderlyingErrorKey];

  BOOL v5 = [(NSError *)self domain];
  if ([v5 isEqualToString:@"CKErrorDomain"])
  {
    NSInteger v6 = [(NSError *)self code];
    BOOL v7 = 0;
    if (v6 == 15 && v4)
    {
      id v8 = [v4 domain];
      if ([v8 isEqualToString:@"CKInternalErrorDomain"]) {
        BOOL v7 = [v4 code] == (id)2000;
      }
      else {
        BOOL v7 = 0;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (void)setDefaultRetryIntervalForTests:(double)a3
{
  qword_10035C278 = *(void *)&a3;
}

@end