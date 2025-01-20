@interface APAttributionToken
+ (id)_createTokenDetailed:(BOOL)a3 error:(id *)a4;
+ (id)_getCachedToken:(BOOL)a3;
+ (id)keyChainLock;
+ (void)_generateOnDemandToken:(BOOL)a3 interval:(unint64_t)a4 completionHandler:(id)a5;
+ (void)_refillCacheWithTokensDetail:(BOOL)a3;
+ (void)createDetailed:(BOOL)a3 attributionTokenWithCompletionHandler:(id)a4;
+ (void)tokenWithDetail:(BOOL)a3 interval:(unint64_t)a4 completionHandler:(id)a5;
- (APAttributionToken)initWithCachedToken:(id)a3 detailed:(BOOL)a4;
- (APAttributionToken)initWithKey:(id)a3 payload:(id)a4 token:(id)a5 signature:(id)a6;
- (APAttributionToken)initWithKey:(id)a3 payload:(id)a4 token:(id)a5 signature:(id)a6 detailed:(BOOL)a7;
- (BOOL)isDetailed;
- (NSData)key;
- (NSData)payload;
- (NSData)token;
- (NSString)signedAttributionToken;
- (void)setPayload:(id)a3;
@end

@implementation APAttributionToken

- (APAttributionToken)initWithKey:(id)a3 payload:(id)a4 token:(id)a5 signature:(id)a6 detailed:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = [(APAttributionToken *)self init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_key, a3);
    objc_storeStrong((id *)&v18->_payload, a4);
    objc_storeStrong((id *)&v18->_token, a5);
    v18->_detailed = a7;
    [v15 appendData:v16];
    uint64_t v19 = [v15 base64EncodedStringWithOptions:0];
    signedAttributionToken = v18->_signedAttributionToken;
    v18->_signedAttributionToken = (NSString *)v19;
  }
  return v18;
}

- (APAttributionToken)initWithKey:(id)a3 payload:(id)a4 token:(id)a5 signature:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(APAttributionToken *)self init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_key, a3);
    objc_storeStrong((id *)&v16->_payload, a4);
    objc_storeStrong((id *)&v16->_token, a5);
    [v13 appendData:v14];
    uint64_t v17 = [v13 base64EncodedStringWithOptions:0];
    signedAttributionToken = v16->_signedAttributionToken;
    v16->_signedAttributionToken = (NSString *)v17;
  }
  return v16;
}

- (APAttributionToken)initWithCachedToken:(id)a3 detailed:(BOOL)a4
{
  id v7 = a3;
  v8 = [(APAttributionToken *)self init];
  if (v8)
  {
    id v9 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v7 options:0];
    uint64_t v10 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v9 bytes], 32);
    key = v8->_key;
    v8->_key = (NSData *)v10;

    id v12 = [v9 subdataWithRange:NSMakeRange(32, 8)];
    uint64_t v13 = +[NSData dataWithData:v12];
    payload = v8->_payload;
    v8->_payload = (NSData *)v13;

    id v15 = [v9 subdataWithRange:0, 32];
    uint64_t v16 = +[NSData dataWithData:v15];
    token = v8->_token;
    v8->_token = (NSData *)v16;

    objc_storeStrong((id *)&v8->_signedAttributionToken, a3);
    v8->_detailed = a4;
  }
  return v8;
}

+ (id)keyChainLock
{
  if (qword_1002889A8 != -1) {
    dispatch_once(&qword_1002889A8, &stru_1002341F8);
  }
  v2 = (void *)qword_1002889A0;

  return v2;
}

+ (void)tokenWithDetail:(BOOL)a3 interval:(unint64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v7 = (void (**)(id, APAttributionToken *, uint64_t, void))a5;
  v8 = APLogForCategory();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Generating Token", buf, 2u);
    }

    id v9 = +[APAttributionToken _getCachedToken:v6];
    if (v9)
    {
      uint64_t v10 = APLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Using cached Token", buf, 2u);
      }

      id v11 = [[APAttributionToken alloc] initWithCachedToken:v9 detailed:v6];
      id v12 = +[APAttributionTokenTracker defaultTracker];
      uint64_t v13 = [(APAttributionToken *)v11 signedAttributionToken];
      unsigned __int8 v14 = [v12 isTokenUsed:v13];

      if (v14)
      {
        id v15 = APPerfLogForCategory();
        uint64_t v16 = v15;
        unint64_t v17 = a4 - 1;
        if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
        {
          *(_DWORD *)buf = 134349314;
          unint64_t v30 = a4;
          __int16 v31 = 2114;
          CFStringRef v32 = @"keychain";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, a4, "Duplicate Token Found", "Duplicate Token Found id=%{public, name=id}lld cache=%{public, name=cache}@", buf, 0x16u);
        }

        +[APAttributionAnalytics sendTokenDuplicateAnalytics:@"TokenDupeKeychain"];
        v18 = APLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = [(APAttributionToken *)v11 signedAttributionToken];
          *(_DWORD *)buf = 138543362;
          unint64_t v30 = (unint64_t)v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "cached token has already been used %{public}@", buf, 0xCu);
        }
      }
      else
      {
        unint64_t v17 = a4 - 1;
      }
      v7[2](v7, v11, 1, 0);
      v20 = (void *)os_transaction_create();
      v21 = APPerfLogForCategory();
      v22 = v21;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_DWORD *)buf = 134349056;
        unint64_t v30 = a4;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, a4, "Cache GCD overhead", "id=%{public, name=id}lld", buf, 0xCu);
      }

      v23 = dispatch_get_global_queue(9, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100071EB8;
      block[3] = &unk_100234220;
      BOOL v28 = v6;
      id v26 = v20;
      unint64_t v27 = a4;
      id v24 = v20;
      dispatch_async(v23, block);
    }
    else
    {
      +[APAttributionToken _generateOnDemandToken:v6 interval:a4 completionHandler:v7];
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No handler", buf, 2u);
  }
}

+ (id)_getCachedToken:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[APAttributionToken keyChainLock];
  [v4 lock];

  id v5 = [objc_alloc((Class)APSettingsStorageKeychain) initWithDefaultValues:0];
  BOOL v6 = [[APAttributionTokenStore alloc] initWithStorage:v5];
  id v15 = 0;
  id v7 = [(APAttributionTokenStore *)v6 getToken:v3 error:&v15];
  id v8 = v15;
  if (v8)
  {
    id v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v8 code];
      id v11 = [v8 localizedDescription];
      *(_DWORD *)buf = 136643331;
      unint64_t v17 = "+[APAttributionToken _getCachedToken:]";
      __int16 v18 = 2048;
      id v19 = v10;
      __int16 v20 = 2114;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{sensitive}s Error reading token from token store %ld: %{public}@", buf, 0x20u);
    }
  }
  id v12 = +[APAttributionToken keyChainLock];
  [v12 unlock];

  if (v7) {
    id v13 = v7;
  }

  return v7;
}

+ (void)_generateOnDemandToken:(BOOL)a3 interval:(unint64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = generateRandomBytes(0x20uLL);
  id v9 = generatePayload(8, v6);
  id v10 = createTokenFromKey(v8, v9);
  id v11 = +[APMescalSigningService service];

  if (v11)
  {
    id v12 = (void *)os_transaction_create();
    id v13 = +[APMescalSigningService service];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000724BC;
    v17[3] = &unk_100234248;
    id v22 = v7;
    id v18 = v8;
    id v19 = v9;
    unint64_t v23 = a4;
    BOOL v24 = v6;
    id v20 = v10;
    id v21 = v12;
    id v14 = v12;
    [v13 rawSignatureForData:v20 waitTime:v17 completion:10.0];
  }
  else
  {
    id v15 = APLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Signing Service Not available", buf, 2u);
    }

    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = @"Error signing token, service not available";
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v14 = +[NSError errorWithDomain:@"com.apple.ap.attribution.token" code:1 userInfo:v16];

    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v14);
  }
}

+ (void)createDetailed:(BOOL)a3 attributionTokenWithCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  BOOL v6 = generateRandomBytes(0x20uLL);
  id v7 = generatePayload(8, v4);
  id v8 = createTokenFromKey(v6, v7);
  id v9 = +[APMescalSigningService service];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100072A50;
  v14[3] = &unk_100234270;
  id v15 = v6;
  id v16 = v7;
  id v17 = v8;
  id v18 = v5;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  id v13 = v5;
  [v9 rawSignatureForData:v10 waitTime:v14 completion:10.0];
}

+ (id)_createTokenDetailed:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  BOOL v6 = generateRandomBytes(0x20uLL);
  id v7 = generatePayload(8, v5);
  id v8 = createTokenFromKey(v6, v7);
  id v9 = APLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Mescal signing request for token", v14, 2u);
  }

  id v10 = +[APMescalSigningService service];
  id v11 = [v10 rawSignatureForData:v8 error:a4];

  if (v11 && !*a4) {
    id v12 = [[APAttributionToken alloc] initWithKey:v6 payload:v7 token:v8 signature:v11];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

+ (void)_refillCacheWithTokensDetail:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Refill cache with tokens", buf, 2u);
  }

  BOOL v5 = +[APAttributionToken keyChainLock];
  [v5 lock];

  id v6 = [objc_alloc((Class)APSettingsStorageKeychain) initWithDefaultValues:0];
  id v7 = [[APAttributionTokenStore alloc] initWithStorage:v6 andSize:5];
  id v32 = 0;
  unint64_t v8 = [(APAttributionTokenStore *)v7 tokenCount:v3 error:&v32];
  id v9 = v32;
  if (v9)
  {
    id v10 = v9;
    id v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v10 code];
      id v13 = [v10 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v34 = "+[APAttributionToken _refillCacheWithTokensDetail:]";
      __int16 v35 = 2048;
      id v36 = v12;
      __int16 v37 = 2114;
      v38 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Error reading token count store code %ld: %{public}@", buf, 0x20u);
    }
    id v14 = +[APAttributionToken keyChainLock];
    [v14 unlock];
  }
  else if (v8 < 5)
  {
    id v29 = v6;
    id v16 = +[NSMutableArray arrayWithCapacity:5];
    id v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = 5 - v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Attempt to fill (%d) tokens in cache", buf, 8u);
    }

    id v18 = 0;
    int v19 = v8 - 5;
    do
    {
      id v20 = v18;
      id v31 = v18;
      id v21 = +[APAttributionToken _createTokenDetailed:v3 error:&v31];
      id v18 = v31;

      if (v21)
      {
        id v22 = [v21 signedAttributionToken];
        [v16 addObject:v22];
      }
      else
      {
        id v22 = APLogForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          unint64_t v23 = [v18 localizedDescription];
          *(_DWORD *)buf = 138543362;
          v34 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error generating token %{public}@", buf, 0xCu);
        }
      }
    }
    while (!__CFADD__(v19++, 1));
    id v30 = v18;
    unsigned __int8 v25 = [(APAttributionTokenStore *)v7 addTokens:v16 isDetailed:v3 error:&v30];
    id v10 = v30;

    id v6 = v29;
    if ((v25 & 1) == 0)
    {
      NSErrorUserInfoKey v26 = APLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v27 = [v10 localizedDescription];
        *(_DWORD *)buf = 138543362;
        v34 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error refilling tokens %{public}@", buf, 0xCu);
      }
    }
    BOOL v28 = +[APAttributionToken keyChainLock];
    [v28 unlock];
  }
  else
  {
    id v15 = APLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "token cache full", buf, 2u);
    }

    id v10 = +[APAttributionToken keyChainLock];
    [v10 unlock];
  }
}

- (NSData)token
{
  return self->_token;
}

- (NSData)key
{
  return self->_key;
}

- (NSString)signedAttributionToken
{
  return self->_signedAttributionToken;
}

- (BOOL)isDetailed
{
  return self->_detailed;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_signedAttributionToken, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end