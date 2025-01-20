@interface SignedMutationTimestamp
+ (id)signedTypeWithObject:(id)a3;
+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5;
- (NSString)application;
- (id)createManagedObject:(id)a3 uri:(id)a4 serverHint:(id)a5 error:(id *)a6;
- (id)diagnosticsJsonDictionary;
- (id)parsedMutationWithError:(id *)a3;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setApplication:(id)a3;
@end

@implementation SignedMutationTimestamp

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(SignedMutationTimestamp);
  [(SignedObjectHolder *)v10 setSignedObject:v9];

  [(SignedObjectHolder *)v10 setVerifier:v8];
  [(SignedObjectHolder *)v10 setDataStore:v7];

  return v10;
}

+ (id)signedTypeWithObject:(id)a3
{
  return +[SignedMutationTimestamp signedTypeWithObject:a3 verifier:0 dataStore:0];
}

- (id)parsedMutationWithError:(id *)a3
{
  uint64_t v5 = [(SignedMutationTimestamp *)self mutation];
  if (v5
    && (v6 = (void *)v5,
        [(SignedMutationTimestamp *)self mutation],
        id v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 length],
        v7,
        v6,
        v8))
  {
    id v9 = [(SignedMutationTimestamp *)self mutation];
    v10 = +[IdsMutation parseFromData:v9 error:a3];
  }
  else
  {
    if (a3)
    {
      *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-4 description:@"SMT missing mutation"];
    }
    if (qword_10032EFF8 != -1) {
      dispatch_once(&qword_10032EFF8, &stru_1002C5AB8);
    }
    v11 = qword_10032F000;
    if (os_log_type_enabled((os_log_t)qword_10032F000, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SMT missing mutation", v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)createManagedObject:(id)a3 uri:(id)a4 serverHint:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(SignedMutationTimestamp *)self parsedMutationWithError:a6];
  if (v13)
  {
    v14 = [(SignedObjectHolder *)self dataStore];
    v15 = [(SignedObjectHolder *)self data];
    [v13 mutationMs];
    v16 = [(SignedObjectHolder *)self signature];
    v17 = [v16 signingKeySpkihash];
    uint64_t v18 = +[NSDate now];
    id v19 = v10;
    v20 = (void *)v18;
    id v21 = v11;
    v22 = v19;
    v29 = v21;
    v23 = [v14 createMutation:v15 application:x0 uri:x1 mutationMs:x2 spkiHash:x3 receiptTime:x4];

    if (v23)
    {
      [v23 setReceiptServerHint:v12];
      id v24 = v23;
      id v10 = v22;
      id v11 = v29;
    }
    else
    {
      if (a6)
      {
        *a6 = +[TransparencyError errorWithDomain:kTransparencyErrorAlloc code:-60 description:@"failed to create KTMutation entity"];
      }
      id v10 = v22;
      if (qword_10032EFF8 != -1) {
        dispatch_once(&qword_10032EFF8, &stru_1002C5AF8);
      }
      id v11 = v29;
      v27 = qword_10032F000;
      if (os_log_type_enabled((os_log_t)qword_10032F000, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "failed to create KTMutation entity", buf, 2u);
      }
    }
  }
  else
  {
    if (a6)
    {
      +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorDecode, -73, *a6);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (qword_10032EFF8 != -1) {
      dispatch_once(&qword_10032EFF8, &stru_1002C5AD8);
    }
    v25 = qword_10032F000;
    if (os_log_type_enabled((os_log_t)qword_10032F000, OS_LOG_TYPE_ERROR))
    {
      if (a6) {
        id v26 = *a6;
      }
      else {
        id v26 = 0;
      }
      *(_DWORD *)buf = 138412290;
      id v31 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "mutation failed to parse: %@", buf, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

- (id)diagnosticsJsonDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)SignedMutationTimestamp;
  v3 = [(SignedObjectHolder *)&v9 diagnosticsJsonDictionary];
  id v4 = [v3 mutableCopy];

  uint64_t v5 = [(SignedMutationTimestamp *)self parsedMutationWithError:0];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 diagnosticsJsonDictionary];
    [v4 setObject:v7 forKeyedSubscript:@"mutation"];
  }

  return v4;
}

- (unint64_t)verifyWithError:(id *)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001B5BEC;
  v10[3] = &unk_1002C5690;
  v10[4] = self;
  uint64_t v5 = objc_retainBlock(v10);
  v6 = [(SignedMutationTimestamp *)self application];
  id v7 = +[TransparencyAnalytics formatEventName:@"VerifySmtEvent" application:v6];
  id v8 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:v7 validateType:3 error:a3 block:v5];

  return (unint64_t)v8;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
}

@end