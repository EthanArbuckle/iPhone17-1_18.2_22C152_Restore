@interface TransparencyMapInclusionProofVerifier
- (NSString)application;
- (TransparencyMapInclusionProofVerifier)initWithKeyBag:(id)a3 application:(id)a4;
- (TransparencyPublicKeyBag)keyBag;
- (unint64_t)verifyInclusionProofWithMapEntry:(id)a3 perAppLogEntry:(id)a4 topLevelTreeEntry:(id)a5 error:(id *)a6;
- (unint64_t)verifyPerApplicationTreeEntry:(id)a3 mapHead:(id)a4 topLevelTreeEntry:(id)a5 error:(id *)a6;
- (void)setApplication:(id)a3;
- (void)setInclusionResult:(unint64_t)a3 mapHead:(id)a4 failure:(id)a5;
@end

@implementation TransparencyMapInclusionProofVerifier

- (TransparencyMapInclusionProofVerifier)initWithKeyBag:(id)a3 application:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransparencyMapInclusionProofVerifier;
  v9 = [(TransparencyMapInclusionProofVerifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyBag, a3);
    objc_storeStrong((id *)&v10->_application, a4);
  }

  return v10;
}

- (void)setInclusionResult:(unint64_t)a3 mapHead:(id)a4 failure:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 dataStore];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000B310;
  v12[3] = &unk_100136238;
  id v14 = v8;
  unint64_t v15 = a3;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlockAndWait:v12];
}

- (unint64_t)verifyPerApplicationTreeEntry:(id)a3 mapHead:(id)a4 topLevelTreeEntry:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000B838;
    v23[3] = &unk_1001362E0;
    id v13 = v10;
    id v24 = v13;
    id v25 = v11;
    v26 = self;
    id v14 = objc_retainBlock(v23);
    unint64_t v15 = [(TransparencyMapInclusionProofVerifier *)self application];
    v16 = +[TransparencyAnalytics formatEventName:@"VerifyPATInclusionProofEvent" application:v15];
    unint64_t v17 = (unint64_t)+[TransparencyAnalytics doKTResultWithAnalyticsForEventName:v16 validateType:3 error:a6 block:v14];

    if (v17 == 1)
    {
      if (v12)
      {
        v18 = [v13 slh];
        v19 = +[SignedLogHead signedTypeWithObject:v18];

        unint64_t v17 = (unint64_t)[v12 verifyTLTEntryForPerApplicationLogHead:v19 error:a6];
      }
      else
      {
        if (qword_10015B318 != -1) {
          dispatch_once(&qword_10015B318, &stru_100136300);
        }
        v21 = qword_10015B320;
        unint64_t v17 = 1;
        if (os_log_type_enabled((os_log_t)qword_10015B320, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          unint64_t v17 = 1;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "failed to get TLT inclusion proof for PAT head; deferring inclusion verification",
            buf,
            2u);
        }
      }
    }
  }
  else
  {
    if (qword_10015B318 != -1) {
      dispatch_once(&qword_10015B318, &stru_100136258);
    }
    v20 = qword_10015B320;
    if (os_log_type_enabled((os_log_t)qword_10015B320, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "failed to get PAT inclusion proof for PAM head; deferring inclusion verification",
        buf,
        2u);
    }
    [(TransparencyMapInclusionProofVerifier *)self setInclusionResult:2 mapHead:v11 failure:0];
    unint64_t v17 = 1;
  }

  return v17;
}

- (unint64_t)verifyInclusionProofWithMapEntry:(id)a3 perAppLogEntry:(id)a4 topLevelTreeEntry:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000C064;
  v27[3] = &unk_100136328;
  id v13 = v10;
  id v28 = v13;
  id v14 = objc_retainBlock(v27);
  unint64_t v15 = [(TransparencyMapInclusionProofVerifier *)self application];
  v16 = +[TransparencyAnalytics formatEventName:@"VerifyMapInclusionProofEvent" application:v15];
  id v17 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:v16 validateType:3 error:a6 block:v14];

  v18 = [v13 smh];
  v19 = +[SignedMapHead signedTypeWithObject:v18];

  v20 = [v13 dataStore];
  [v19 setDataStore:v20];

  if (v11)
  {
    [v19 setOverrideBeginTimeFromLogEntry:v11];
  }
  else
  {
    id v26 = v12;
    v21 = [v13 metadata];
    v22 = [v21 objectForKeyedSubscript:@"overrideLogBeginTime"];
    id v23 = [v22 longLongValue];

    if (v23)
    {
      [v19 setOverrideBeginTime:v23];
      id v12 = v26;
    }
    else
    {
      if (qword_10015B318 != -1) {
        dispatch_once(&qword_10015B318, &stru_100136348);
      }
      id v12 = v26;
      id v24 = qword_10015B320;
      if (os_log_type_enabled((os_log_t)qword_10015B320, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "verifyInclusionProofWithMapEntry couldn't find an override time despite needing one. This SMH will leak to long-term gc: %@", buf, 0xCu);
      }
    }
  }
  if (v17 == (id)1) {
    id v17 = [(TransparencyMapInclusionProofVerifier *)self verifyPerApplicationTreeEntry:v11 mapHead:v19 topLevelTreeEntry:v12 error:a6];
  }

  return (unint64_t)v17;
}

- (TransparencyPublicKeyBag)keyBag
{
  return (TransparencyPublicKeyBag *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong((id *)&self->_keyBag, 0);
}

@end