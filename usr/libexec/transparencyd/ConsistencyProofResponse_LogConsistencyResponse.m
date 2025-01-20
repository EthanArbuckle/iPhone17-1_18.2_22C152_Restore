@interface ConsistencyProofResponse_LogConsistencyResponse
+ (id)descriptor;
- (BOOL)forwards;
- (KTOptInManagerServer)optInServer;
- (NSDictionary)metadata;
- (NSNumber)startRevision;
- (TransparencyConsistencyProofVerifier)verifier;
- (TransparencyFollowUpProtocol)followUp;
- (TransparencyManagedDataStore)dataStore;
- (unint64_t)verifyWithError:(id *)a3;
- (void)checkSplitsFor:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setForwards:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setOptInServer:(id)a3;
- (void)setResult:(unint64_t)a3 treeHead:(id)a4 error:(id)a5;
- (void)setStartRevision:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation ConsistencyProofResponse_LogConsistencyResponse

+ (id)descriptor
{
  id v2 = (id)qword_10032ED08;
  if (!qword_10032ED08)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:ConsistencyProofResponse_LogConsistencyResponse messageName:@"LogConsistencyResponse" fileDescription:&unk_100324980 fields:&off_100324A58 fieldCount:3 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AFCD];
    [v2 setupContainingMessageClass:ConsistencyProofResponse];
    qword_10032ED08 = (uint64_t)v2;
  }
  return v2;
}

- (TransparencyConsistencyProofVerifier)verifier
{
  return (TransparencyConsistencyProofVerifier *)objc_getAssociatedObject(self, @"verifierKey");
}

- (void)setVerifier:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, @"dataStoreKey");
}

- (void)setDataStore:(id)a3
{
}

- (NSNumber)startRevision
{
  return (NSNumber *)objc_getAssociatedObject(self, @"startRevisionKey");
}

- (void)setStartRevision:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, @"metadata");
}

- (void)setMetadata:(id)a3
{
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = [(ConsistencyProofResponse_LogConsistencyResponse *)self metadata];
    id v8 = [v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v8 setObject:v9 forKeyedSubscript:v6];
    [(ConsistencyProofResponse_LogConsistencyResponse *)self setMetadata:v8];
  }
}

- (BOOL)forwards
{
  id v2 = objc_getAssociatedObject(self, @"directionKey");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setForwards:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, @"directionKey", v4, (void *)1);
}

- (KTOptInManagerServer)optInServer
{
  return (KTOptInManagerServer *)objc_getAssociatedObject(self, @"optInServerKey");
}

- (void)setOptInServer:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(self, @"optInServerKey", a3, (void *)1);
  }
}

- (TransparencyFollowUpProtocol)followUp
{
  return (TransparencyFollowUpProtocol *)objc_getAssociatedObject(self, @"followUpKey");
}

- (void)setFollowUp:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(self, @"followUpKey", a3, (void *)1);
  }
}

- (void)setResult:(unint64_t)a3 treeHead:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [v8 setUnsigned:"consistencyVerified" value:a3];
  if (a3 || !v8)
  {
    [v8 receiptTime];
    double v14 = v13;
    double Current = CFAbsoluteTimeGetCurrent();
    v16 = +[TransparencyAnalytics logger];
    v17 = +[NSNumber numberWithDouble:Current - v14];
    v18 = [v8 application];
    v19 = +[TransparencyAnalytics formatEventName:@"ConsistencyProofTime" application:v18];
    [v16 logMetric:v17 withName:v19];

    v11 = [v8 application];
    NSLog(@"%@", v11);
  }
  else
  {
    v10 = [(ConsistencyProofResponse_LogConsistencyResponse *)self dataStore];
    v11 = [v10 createSignedTreeHeadFailure];

    if (v9)
    {
      [v11 setErrorCode:[v9 code]];
      v12 = [v9 domain];
      [v11 setErrorDomain:v12];
    }
    else
    {
      [v11 setErrorCode:-120];
      [v11 setErrorDomain:kTransparencyErrorUnknown];
    }
    [v11 setSth:v8];
    [v11 setVerificationType:2];
    v20 = [(ConsistencyProofResponse_LogConsistencyResponse *)self dataStore];
    v21 = [v8 application];
    v22 = [(ConsistencyProofResponse_LogConsistencyResponse *)self optInServer];
    v23 = [v20 createFailureEvent:v9 application:v21 optInServer:v22];

    [v8 setFailureEvent:v23];
    v24 = [(ConsistencyProofResponse_LogConsistencyResponse *)self optInServer];
    v25 = [v24 getAggregateOptInState:0];

    if (qword_10032F2A8 != -1) {
      dispatch_once(&qword_10032F2A8, &stru_1002C8EA0);
    }
    v26 = (void *)qword_10032F2B0;
    if (os_log_type_enabled((os_log_t)qword_10032F2B0, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = [v23 eventId];
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      __int16 v34 = 2112;
      v35 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Created failure eventId %{public}@ for STH consistency validation, optInState %@", buf, 0x16u);
    }
    v29 = [(ConsistencyProofResponse_LogConsistencyResponse *)self followUp];
    v30 = [v8 application];
    v31 = [v23 eventId];
    [v29 postFollowup:v30 type:2 eventId:v31 errorCode:[v9 code] optInState:v25 infoLink:0 additionalInfo:0 error:0];
  }
}

- (void)checkSplitsFor:(id)a3
{
  id v4 = a3;
  v5 = [(ConsistencyProofResponse_LogConsistencyResponse *)self dataStore];
  id v6 = [v4 logHeadHash];
  v7 = [v4 application];
  id v51 = 0;
  id v8 = [v5 fetchTreeHeadsWithoutHash:v6 isMapHead:0 application:v7 logBeginTime:objc_msgSend(v4, "getUnsigned:") logType:objc_msgSend(v4, "logType") revision:objc_msgSend(v4, "getUnsigned:") error:&v51];
  id v39 = v51;

  v41 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-189 description:@"duplicate revision found with different head hash from consistent SLH"];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v8;
  id v46 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v48;
    v42 = v4;
    v43 = self;
    uint64_t v40 = kTransparencyResponseMetadataKeyServerHint;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v48 != v45) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v9);
        v11 = [v10 sth];
        v12 = +[SignedObjectHolder parseFromData:v11 error:0];

        if (v12)
        {
          double v13 = v4;
          double v14 = [(ConsistencyProofResponse_LogConsistencyResponse *)self verifier];
          v15 = [v14 trustedKeyStore];
          v16 = [v15 signatureVerifier];
          [v12 setVerifier:v16];

          if ([v12 verifyWithError:0] == (id)1)
          {
            v17 = self;
            v18 = [v12 parsedLogHead];
            v19 = v13;
            v20 = [v13 application];
            v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v18 application]);
            v22 = +[TransparencyApplication applicationIdentifierForValue:v21];
            if ([v20 isEqual:v22])
            {
              id v23 = [v13 getUnsigned:"logBeginTime"];
              if (v23 == [v18 logBeginningMs]
                && (id v24 = [v19 logType], v24 == (id)(int)objc_msgSend(v18, "logType"))
                && (id v25 = [v19 getUnsigned:"revision"], v25 == objc_msgSend(v18, "revision")))
              {
                v26 = [v19 logHeadHash];
                v27 = [v18 logHeadHash];
                unsigned __int8 v28 = [v26 isEqual:v27];

                if (v28)
                {
                  id v4 = v42;
                  self = v43;
                  goto LABEL_20;
                }
                self = v43;
                if (qword_10032F2A8 != -1) {
                  dispatch_once(&qword_10032F2A8, &stru_1002C8EC0);
                }
                v29 = (void *)qword_10032F2B0;
                if (os_log_type_enabled((os_log_t)qword_10032F2B0, OS_LOG_TYPE_ERROR))
                {
                  v30 = v29;
                  v31 = [v18 logHeadHash];
                  id v32 = [v42 revision];
                  *(_DWORD *)buf = 138412546;
                  v53 = v31;
                  __int16 v54 = 2048;
                  id v55 = v32;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "found inconsistent head hash %@ for revision %llu with consistent head hash", buf, 0x16u);
                }
                [(ConsistencyProofResponse_LogConsistencyResponse *)v43 setResult:0 treeHead:v10 error:v41];
                v33 = [v10 application];
                v20 = +[TransparencyAnalytics formatEventName:@"VerifyConsistencyProofEvent" application:v33];

                v21 = +[NSMutableDictionary dictionary];
                __int16 v34 = [(ConsistencyProofResponse_LogConsistencyResponse *)v43 metadata];
                v35 = [v34 objectForKeyedSubscript:v40];

                if (v35)
                {
                  v36 = [(ConsistencyProofResponse_LogConsistencyResponse *)v43 metadata];
                  v37 = [v36 objectForKeyedSubscript:v40];
                  [v21 setObject:v37 forKeyedSubscript:v40];
                }
                v22 = +[TransparencyAnalytics logger];
                [v22 logResultForEvent:v20 hardFailure:1 result:v41 withAttributes:v21];
                double v13 = v42;
              }
              else
              {
                double v13 = v19;
                self = v43;
              }
            }
            else
            {
              self = v17;
            }
          }
          else
          {
            v18 = [(ConsistencyProofResponse_LogConsistencyResponse *)self dataStore];
            [v18 deleteObject:v10];
          }
          id v4 = v13;
        }
        else
        {
          v18 = [(ConsistencyProofResponse_LogConsistencyResponse *)self dataStore];
          [v18 deleteObject:v10];
        }
LABEL_20:

        id v9 = (char *)v9 + 1;
      }
      while (v46 != v9);
      id v38 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
      id v46 = v38;
    }
    while (v38);
  }
}

- (unint64_t)verifyWithError:(id *)a3
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001F79B8;
  v14[3] = &unk_1002C5690;
  v14[4] = self;
  v5 = objc_retainBlock(v14);
  id v6 = [(ConsistencyProofResponse_LogConsistencyResponse *)self startSlh];
  v7 = +[SignedLogHead signedTypeWithObject:v6];

  id v8 = [v7 parsedLogHead];
  id v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 application]);
  v10 = +[TransparencyApplication applicationIdentifierForValue:v9];

  v11 = +[TransparencyAnalytics formatEventName:@"VerifyConsistencyProofEvent" application:v10];
  id v12 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:v11 validateType:3 error:a3 block:v5];

  return (unint64_t)v12;
}

@end