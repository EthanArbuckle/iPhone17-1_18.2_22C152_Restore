@interface SignedMapHead
+ (id)signedTypeWithObject:(id)a3;
+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5;
- (MapHead)parsedMapHead;
- (id)copyManagedObject:(id *)a3;
- (id)createManagedObjectWithError:(id *)a3;
- (id)diagnosticsJsonDictionary;
- (unint64_t)overrideBeginTime;
- (unint64_t)verifyMMD:(double)a3 error:(id *)a4;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setMMDVerifiedForMapHead:(unint64_t)a3 mmdError:(id)a4;
- (void)setOverrideBeginTime:(unint64_t)a3;
- (void)setOverrideBeginTimeFromLogEntry:(id)a3;
@end

@implementation SignedMapHead

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(SignedMapHead);
  [(SignedObjectHolder *)v10 setSignedObject:v9];

  [(SignedObjectHolder *)v10 setVerifier:v8];
  [(SignedObjectHolder *)v10 setDataStore:v7];

  return v10;
}

+ (id)signedTypeWithObject:(id)a3
{
  return +[SignedMapHead signedTypeWithObject:a3 verifier:0 dataStore:0];
}

- (id)diagnosticsJsonDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)SignedMapHead;
  v3 = [(SignedObjectHolder *)&v9 diagnosticsJsonDictionary];
  id v4 = [v3 mutableCopy];

  v5 = [(SignedMapHead *)self parsedMapHead];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 diagnosticsJsonDictionary];
    [v4 setObject:v7 forKeyedSubscript:@"mapHead"];
  }

  return v4;
}

- (void)setOverrideBeginTimeFromLogEntry:(id)a3
{
  id v7 = a3;
  if ([v7 hasSlh])
  {
    id v4 = [v7 slh];
    v5 = +[SignedLogHead signedTypeWithObject:v4];

    v6 = [v5 parsedLogHead];
    -[SignedMapHead setOverrideBeginTime:](self, "setOverrideBeginTime:", [v6 logBeginningMs]);
  }
}

- (id)copyManagedObject:(id *)a3
{
  v5 = [(SignedMapHead *)self parsedMapHead];
  v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 application]);
  id v7 = +[TransparencyApplication applicationIdentifierForValue:v6];

  id v8 = [(SignedObjectHolder *)self dataStore];
  objc_super v9 = [(SignedMapHead *)self parsedMapHead];
  v10 = [v9 mapHeadHash];
  unint64_t v11 = [(SignedMapHead *)self overrideBeginTime];
  if (v11)
  {
    id v12 = [(SignedMapHead *)self overrideBeginTime];
  }
  else
  {
    v18 = [(SignedMapHead *)self parsedMapHead];
    id v12 = [v18 logBeginningMs];
  }
  v13 = [(SignedMapHead *)self parsedMapHead];
  uint64_t v14 = (int)[v13 mapType];
  v15 = [(SignedMapHead *)self parsedMapHead];
  v16 = [v8 fetchTreeHead:v10 isMapHead:1 application:v7 logBeginTime:v12 logType:v14 revision:[v15 revision] error:a3];

  if (!v11) {
  return v16;
  }
}

- (id)createManagedObjectWithError:(id *)a3
{
  id v4 = [(SignedMapHead *)self parsedMapHead];
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 application]);
  uint64_t v6 = +[TransparencyApplication applicationIdentifierForValue:v5];

  id v7 = [(SignedObjectHolder *)self dataStore];
  id v8 = [(SignedObjectHolder *)self data];
  unint64_t v21 = [(SignedMapHead *)self overrideBeginTime];
  v22 = (void *)v6;
  if (v21)
  {
    id v20 = [(SignedMapHead *)self overrideBeginTime];
  }
  else
  {
    v19 = [(SignedMapHead *)self parsedMapHead];
    id v20 = [v19 logBeginningMs];
  }
  objc_super v9 = [(SignedMapHead *)self parsedMapHead];
  v10 = [v9 mapHeadHash];
  unint64_t v11 = [(SignedMapHead *)self parsedMapHead];
  uint64_t v12 = (int)[v11 mapType];
  v13 = [(SignedMapHead *)self parsedMapHead];
  id v14 = [v13 revision];
  v15 = [(SignedMapHead *)self parsedMapHead];
  LOWORD(v18) = [v15 populating];
  v16 = [v7 createMapHead:v8 application:v22 logBeginTime:v20 logHeadHash:v10 logType:v12 revision:v14 populating:v18 gossip:];

  if (!v21) {

  }
  return v16;
}

- (MapHead)parsedMapHead
{
  uint64_t v3 = [(SignedMapHead *)self mapHead];
  if (v3
    && (id v4 = (void *)v3,
        [(SignedMapHead *)self mapHead],
        v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    id v7 = [(SignedMapHead *)self mapHead];
    id v13 = 0;
    id v8 = +[TransparencyGPBMessage parseFromData:v7 error:&v13];
    id v9 = v13;

    if (v9)
    {
      if (qword_10032F2F8 != -1) {
        dispatch_once(&qword_10032F2F8, &stru_1002C9568);
      }
      v10 = qword_10032F300;
      if (os_log_type_enabled((os_log_t)qword_10032F300, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to parse map head from SignedMapHead: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (qword_10032F2F8 != -1) {
      dispatch_once(&qword_10032F2F8, &stru_1002C9548);
    }
    unint64_t v11 = qword_10032F300;
    if (os_log_type_enabled((os_log_t)qword_10032F300, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SMH missing map head", buf, 2u);
    }
    id v8 = 0;
  }

  return (MapHead *)v8;
}

- (unint64_t)verifyWithError:(id *)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001FF9A4;
  v12[3] = &unk_1002C5690;
  v12[4] = self;
  v5 = objc_retainBlock(v12);
  id v6 = [(SignedMapHead *)self parsedMapHead];
  id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 application]);
  id v8 = +[TransparencyApplication applicationIdentifierForValue:v7];

  id v9 = +[TransparencyAnalytics formatEventName:@"VerifySMHEvent" application:v8];
  id v10 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:v9 validateType:3 error:a3 block:v5];

  return (unint64_t)v10;
}

- (void)setMMDVerifiedForMapHead:(unint64_t)a3 mmdError:(id)a4
{
  id v6 = a4;
  id v7 = [(SignedObjectHolder *)self dataStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100200008;
  v9[3] = &unk_1002B9D28;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 performBlockAndWait:v9];
}

- (unint64_t)verifyMMD:(double)a3 error:(id *)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10020034C;
  v15[3] = &unk_1002C9630;
  v15[4] = self;
  *(double *)&v15[5] = a3;
  id v6 = objc_retainBlock(v15);
  id v14 = 0;
  id v7 = [(SignedMapHead *)self verifyWithError:&v14];
  id v8 = v14;
  +[TransparencyMapEntryVerifier storeSMHSignatureResult:v7 smh:self error:v8];
  if (a4 && v8) {
    *a4 = v8;
  }
  if (v7 == (id)1)
  {
    id v9 = [(SignedMapHead *)self parsedMapHead];
    id v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 application]);
    unint64_t v11 = +[TransparencyApplication applicationIdentifierForValue:v10];

    uint64_t v12 = +[TransparencyAnalytics formatEventName:@"VerifySMHEvent" application:v11];
    id v7 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:v12 error:a4 block:v6];
  }
  return (unint64_t)v7;
}

- (unint64_t)overrideBeginTime
{
  return self->_overrideBeginTime;
}

- (void)setOverrideBeginTime:(unint64_t)a3
{
  self->_overrideBeginTime = a3;
}

@end