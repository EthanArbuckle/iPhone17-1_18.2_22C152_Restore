@interface SignedLogHead
+ (id)signedTypeWithObject:(id)a3;
+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5;
- (BOOL)gossip;
- (LogHead)parsedLogHead;
- (id)copyManagedObject:(id *)a3;
- (id)createManagedObjectWithError:(id *)a3;
- (id)diagnosticsJsonDictionary;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setGossip:(BOOL)a3;
- (void)storeSignatureResult:(unint64_t)a3 signatureError:(id *)a4;
@end

@implementation SignedLogHead

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(SignedLogHead);
  [(SignedObjectHolder *)v10 setSignedObject:v9];

  [(SignedObjectHolder *)v10 setVerifier:v8];
  [(SignedObjectHolder *)v10 setDataStore:v7];

  return v10;
}

+ (id)signedTypeWithObject:(id)a3
{
  return +[SignedLogHead signedTypeWithObject:a3 verifier:0 dataStore:0];
}

- (id)diagnosticsJsonDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)SignedLogHead;
  v3 = [(SignedObjectHolder *)&v8 diagnosticsJsonDictionary];
  id v4 = [v3 mutableCopy];

  v5 = [(SignedLogHead *)self parsedLogHead];
  v6 = [v5 diagnosticsJsonDictionary];
  [v4 setObject:v6 forKeyedSubscript:@"logHead"];

  return v4;
}

- (LogHead)parsedLogHead
{
  uint64_t v3 = [(SignedLogHead *)self logHead];
  if (v3
    && (id v4 = (void *)v3,
        [(SignedLogHead *)self logHead],
        v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    id v7 = [(SignedLogHead *)self logHead];
    id v13 = 0;
    objc_super v8 = +[TransparencyGPBMessage parseFromData:v7 error:&v13];
    id v9 = v13;

    if (v9)
    {
      if (qword_10015B368 != -1) {
        dispatch_once(&qword_10015B368, &stru_1001369E0);
      }
      v10 = qword_10015B370;
      if (os_log_type_enabled((os_log_t)qword_10015B370, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to parse log head from Signed Log Head: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (qword_10015B368 != -1) {
      dispatch_once(&qword_10015B368, &stru_1001369C0);
    }
    v11 = qword_10015B370;
    if (os_log_type_enabled((os_log_t)qword_10015B370, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SLH missing log head", buf, 2u);
    }
    objc_super v8 = 0;
  }

  return (LogHead *)v8;
}

- (id)copyManagedObject:(id *)a3
{
  v5 = [(SignedLogHead *)self parsedLogHead];
  id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 application]);
  id v7 = +[TransparencyApplication applicationIdentifierForValue:v6];

  objc_super v8 = [(SignedObjectHolder *)self dataStore];
  id v9 = [(SignedLogHead *)self parsedLogHead];
  v10 = [v9 logHeadHash];
  v11 = [(SignedLogHead *)self parsedLogHead];
  id v12 = [v11 logBeginningMs];
  id v13 = [(SignedLogHead *)self parsedLogHead];
  uint64_t v14 = (int)[v13 logType];
  id v15 = [(SignedLogHead *)self parsedLogHead];
  v16 = [v8 fetchTreeHead:v10 isMapHead:0 application:v7 logBeginTime:v12 logType:v14 revision:[v15 revision] error:a3];

  return v16;
}

- (id)createManagedObjectWithError:(id *)a3
{
  id v4 = [(SignedLogHead *)self parsedLogHead];
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 application]);
  v19 = +[TransparencyApplication applicationIdentifierForValue:v5];

  id v6 = [(SignedObjectHolder *)self dataStore];
  id v7 = [(SignedObjectHolder *)self data];
  objc_super v8 = [(SignedLogHead *)self parsedLogHead];
  id v18 = [v8 logBeginningMs];
  id v9 = [(SignedLogHead *)self parsedLogHead];
  v10 = [v9 logHeadHash];
  v11 = [(SignedLogHead *)self parsedLogHead];
  uint64_t v12 = (int)[v11 logType];
  id v13 = [(SignedLogHead *)self parsedLogHead];
  id v14 = [v13 revision];
  LOBYTE(v17) = [(SignedLogHead *)self gossip];
  id v15 = [v6 createTreeHead:v7 isMapHead:0 application:v19 logBeginTime:v18 logHeadHash:v10 logType:v12 revision:v14 gossip:v17];

  return v15;
}

- (void)storeSignatureResult:(unint64_t)a3 signatureError:(id *)a4
{
  id v7 = [(SignedObjectHolder *)self dataStore];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013E04;
  v8[3] = &unk_100136A28;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  [v7 performBlockAndWait:v8];
}

- (unint64_t)verifyWithError:(id *)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000141C4;
  v12[3] = &unk_100136328;
  v12[4] = self;
  v5 = objc_retainBlock(v12);
  id v6 = [(SignedLogHead *)self parsedLogHead];
  id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 application]);
  objc_super v8 = +[TransparencyApplication applicationIdentifierForValue:v7];

  id v9 = +[TransparencyAnalytics formatEventName:@"VerifySTHEvent" application:v8];
  id v10 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:v9 validateType:3 error:a3 block:v5];

  return (unint64_t)v10;
}

- (BOOL)gossip
{
  return self->_gossip;
}

- (void)setGossip:(BOOL)a3
{
  self->_gossip = a3;
}

@end