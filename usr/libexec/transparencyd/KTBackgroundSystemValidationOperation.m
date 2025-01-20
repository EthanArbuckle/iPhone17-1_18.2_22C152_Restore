@interface KTBackgroundSystemValidationOperation
+ (id)lastDutyCycle:(id)a3;
+ (id)lastDutyCycleSuccess:(id)a3;
+ (id)sysdiagnoseInfo:(id)a3;
+ (void)addErrorToBackgroundOp:(id)a3 smDataStore:(id)a4 failureDataString:(id)a5 type:(id)a6 serverHint:(id)a7 failure:(id)a8;
+ (void)saveErrorToDB:(id)a3 smDataStore:(id)a4;
- (KTBackgroundSystemValidationOperation)initWithDependencies:(id)a3;
- (KTOperationDependencies)deps;
- (KTResultOperation)finishedOp;
- (NSUUID)opUUID;
- (OS_os_transaction)transaction;
- (id)opUUIDData;
- (void)groupStart;
- (void)recordBackgroundActivity;
- (void)saveErrorToDB;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setOpUUID:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation KTBackgroundSystemValidationOperation

- (KTBackgroundSystemValidationOperation)initWithDependencies:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KTBackgroundSystemValidationOperation;
  v5 = [(KTGroupOperation *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(KTBackgroundSystemValidationOperation *)v5 setDeps:v4];
    v7 = +[NSUUID UUID];
    [(KTBackgroundSystemValidationOperation *)v6 setOpUUID:v7];

    v8 = v6;
  }

  return v6;
}

- (id)opUUIDData
{
  v3 = [(KTBackgroundSystemValidationOperation *)self opUUID];

  if (v3)
  {
    v7[0] = 0;
    v7[1] = 0;
    id v4 = [(KTBackgroundSystemValidationOperation *)self opUUID];
    [v4 getUUIDBytes:v7];

    v5 = +[NSData dataWithBytes:v7 length:16];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)recordBackgroundActivity
{
  v3 = [(KTBackgroundSystemValidationOperation *)self deps];
  id v4 = [v3 smDataStore];
  v5 = &OBJC_METACLASS___TransparencyTranscript;
  uint64_t v6 = [v4 getSettingsDate:off_10031E2A0];

  v7 = [(KTBackgroundSystemValidationOperation *)self deps];
  v8 = [v7 smDataStore];
  uint64_t v9 = [v8 getSettingsNumber:off_10031E2A8];

  if (!(v6 | v9))
  {
    v12 = [(KTBackgroundSystemValidationOperation *)self deps];
    v13 = [v12 smDataStore];
    v14 = off_10031E2B0;
    v15 = +[NSDate now];
    [v13 setSettingsDate:v14 date:v15];
LABEL_6:

    goto LABEL_7;
  }
  if (!v6) {
    goto LABEL_8;
  }
  if ([(id)v9 unsignedIntegerValue] == (id)1)
  {
    objc_super v10 = [(KTBackgroundSystemValidationOperation *)self deps];
    v11 = [v10 smDataStore];
    [v11 setSettingsDate:off_10031E2B0 date:v6];

    v12 = [(KTBackgroundSystemValidationOperation *)self deps];
    v13 = [v12 smDataStore];
    [v13 setSettingsNumber:off_10031E2C0 number:&off_1002D9C18];
LABEL_7:

    goto LABEL_8;
  }
  if (![(id)v9 unsignedIntegerValue])
  {
    v32 = [(KTBackgroundSystemValidationOperation *)self deps];
    v33 = [v32 smDataStore];
    v12 = [v33 getSettingsNumber:off_10031E2C0];

    v34 = (char *)[v12 unsignedIntegerValue] + 1;
    v13 = [(KTBackgroundSystemValidationOperation *)self deps];
    v15 = [v13 smDataStore];
    v35 = off_10031E2C0;
    v36 = +[NSNumber numberWithUnsignedInteger:v34];
    v5 = &OBJC_METACLASS___TransparencyTranscript;
    [v15 setSettingsNumber:v35 number:v36];

    goto LABEL_6;
  }
LABEL_8:
  v16 = &OBJC_METACLASS___TransparencyTranscript;
  if (_os_feature_enabled_impl())
  {
    v17 = [(KTBackgroundSystemValidationOperation *)self deps];
    v18 = [v17 smDataStore];
    v19 = [v18 getSettingsDate:off_10031E2B0];

    v20 = [(KTBackgroundSystemValidationOperation *)self deps];
    v21 = [v20 smDataStore];
    v22 = [v21 getSettingsNumber:off_10031E2C0];

    +[TransparencySettings backgroundFollowupDelayPeriod];
    v24 = +[NSDate dateWithTimeIntervalSinceNow:-v23];
    if ([v19 compare:v24] == (id)-1)
    {
      id v25 = [v22 unsignedIntegerValue];
      id v26 = +[TransparencySettings backgroundFollowupFailureCount];

      v16 = &OBJC_METACLASS___TransparencyTranscript;
      if (v25 >= v26)
      {
        if (qword_100326710 != -1) {
          dispatch_once(&qword_100326710, &stru_1002B82F8);
        }
        v27 = qword_100326718;
        if (os_log_type_enabled((os_log_t)qword_100326718, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v64 = v22;
          __int16 v65 = 2112;
          v66 = v19;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "BackgroundSystemValidation: posting followup for %@ consistent background validation failures since %@", buf, 0x16u);
        }
        v28 = [(KTBackgroundSystemValidationOperation *)self deps];
        v29 = [v28 smDataStore];
        v16 = &OBJC_METACLASS___TransparencyTranscript;
        v30 = [v29 getSettingsData:off_10031E2B8];

        if (v30) {
          id v31 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:[v30 bytes]];
        }
        else {
          id v31 = 0;
        }
        v37 = [(KTBackgroundSystemValidationOperation *)self deps];
        v38 = [v37 cloudRecords];

        if (v38)
        {
          id v61 = v31;
          v62[1] = 0;
          v60 = v38;
          uint64_t v39 = kKTApplicationIdentifierIDS;
          uint64_t v40 = [v38 getAggregateOptInStateForApplication:error:];
          id v41 = 0;
          if (!v40)
          {
            if (qword_100326710 != -1) {
              dispatch_once(&qword_100326710, &stru_1002B8318);
            }
            v42 = qword_100326718;
            if (os_log_type_enabled((os_log_t)qword_100326718, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v64 = v41;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "BackgroundSystemValidation: failed getting optin state for followup: %@", buf, 0xCu);
            }
          }
          v58 = v41;
          v59 = v30;
          v43 = [(KTBackgroundSystemValidationOperation *)self deps];
          v44 = [v43 followup];
          v62[0] = 0;
          v45 = (void *)v40;
          [v44 postFollowup:v39 type:1 eventId:v61 errorCode:-388 optInState:v40 infoLink:0 additionalInfo:0 error:v62];
          id v46 = v62[0];

          v16 = &OBJC_METACLASS___TransparencyTranscript;
          if (v46)
          {
            if (qword_100326710 != -1) {
              dispatch_once(&qword_100326710, &stru_1002B8338);
            }
            v47 = qword_100326718;
            if (os_log_type_enabled((os_log_t)qword_100326718, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v64 = v46;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "BackgroundSystemValidation: failed to post followup: %@", buf, 0xCu);
            }
          }

          v30 = v59;
          v38 = v60;
          id v31 = v61;
        }
      }
    }
    else
    {

      v16 = &OBJC_METACLASS___TransparencyTranscript;
    }

    v5 = &OBJC_METACLASS___TransparencyTranscript;
  }
  v48 = [(KTBackgroundSystemValidationOperation *)self deps];
  v49 = [v48 smDataStore];
  [v49 setSettingsNumber:off_10031E2A8 number:&off_1002D9C30];

  v50 = [(KTBackgroundSystemValidationOperation *)self deps];
  v51 = [v50 smDataStore];
  cache = v16[17].cache;
  v53 = [(KTBackgroundSystemValidationOperation *)self opUUIDData];
  [v51 setSettingsData:cache data:v53];

  v54 = [(KTBackgroundSystemValidationOperation *)self deps];
  v55 = [v54 smDataStore];
  info = v5[16].info;
  v57 = +[NSDate now];
  [v55 setSettingsDate:info date:v57];
}

- (void)groupStart
{
  v3 = (void *)os_transaction_create();
  [(KTBackgroundSystemValidationOperation *)self setTransaction:v3];

  if (qword_100326710 != -1) {
    dispatch_once(&qword_100326710, &stru_1002B8358);
  }
  id v4 = (void *)qword_100326718;
  if (os_log_type_enabled((os_log_t)qword_100326718, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    uint64_t v6 = [(KTBackgroundSystemValidationOperation *)self opUUID];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "BackgroundSystemValidation: start %{public}@", buf, 0xCu);
  }
  [(KTBackgroundSystemValidationOperation *)self recordBackgroundActivity];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10001ED28;
  v58[3] = &unk_1002B8380;
  objc_copyWeak(&v59, (id *)buf);
  v7 = +[KTResultOperation named:@"background-finished" withBlockTakingSelf:v58];
  [(KTBackgroundSystemValidationOperation *)self setFinishedOp:v7];

  v8 = [(KTBackgroundSystemValidationOperation *)self finishedOp];
  [(KTGroupOperation *)self dependOnBeforeGroupFinished:v8];

  uint64_t v9 = [KTVerifyPendingSignaturesOperation alloc];
  objc_super v10 = [(KTBackgroundSystemValidationOperation *)self deps];
  v11 = [(KTBackgroundSystemValidationOperation *)self opUUID];
  v12 = [(KTVerifyPendingSignaturesOperation *)v9 initWithDependencies:v10 opId:v11];

  v13 = [KTVerifyMapHeadMMDOperation alloc];
  v14 = [(KTBackgroundSystemValidationOperation *)self deps];
  v15 = [(KTBackgroundSystemValidationOperation *)self opUUID];
  v16 = [(KTVerifyMapHeadMMDOperation *)v13 initWithDependencies:v14 opId:v15];

  v17 = [(KTBackgroundSystemValidationOperation *)self finishedOp];
  [v17 addSuccessDependency:v12];

  v18 = [(KTBackgroundSystemValidationOperation *)self finishedOp];
  [v18 addSuccessDependency:v16];

  v19 = [(KTGroupOperation *)self operationQueue];
  [v19 addOperation:v12];

  v20 = [(KTGroupOperation *)self operationQueue];
  [v20 addOperation:v16];

  v21 = [KTValidatePendingURIsOperation alloc];
  v22 = [(KTBackgroundSystemValidationOperation *)self opUUID];
  double v23 = [(KTBackgroundSystemValidationOperation *)self deps];
  uint64_t v24 = kKTApplicationIdentifierIDS;
  id v25 = [(KTValidatePendingURIsOperation *)v21 initWithApplication:kKTApplicationIdentifierIDS opId:v22 dependencies:v23];

  id v26 = [KTValidatePendingRequestsOperation alloc];
  v27 = [(KTBackgroundSystemValidationOperation *)self deps];
  v28 = [(KTBackgroundSystemValidationOperation *)self opUUID];
  v29 = [(KTValidatePendingRequestsOperation *)v26 initWithApplication:v24 dependencies:v27 opId:v28];

  [(KTValidatePendingURIsOperation *)v25 addNullableDependency:v12];
  [(KTValidatePendingRequestsOperation *)v29 addNullableDependency:v12];
  [(KTValidatePendingURIsOperation *)v25 addNullableDependency:v16];
  [(KTValidatePendingRequestsOperation *)v29 addNullableDependency:v16];
  v30 = [(KTBackgroundSystemValidationOperation *)self finishedOp];
  [v30 addSuccessDependency:v25];

  id v31 = [(KTBackgroundSystemValidationOperation *)self finishedOp];
  [v31 addSuccessDependency:v29];

  v32 = [(KTGroupOperation *)self operationQueue];
  [v32 addOperation:v25];

  v33 = [(KTGroupOperation *)self operationQueue];
  [v33 addOperation:v29];

  v34 = [KTVerifyConsistencyOperation alloc];
  v35 = [(KTBackgroundSystemValidationOperation *)self deps];
  v36 = [(KTBackgroundSystemValidationOperation *)self opUUID];
  v37 = [(KTVerifyConsistencyOperation *)v34 initWithDependencies:v35 opId:v36];

  v38 = [KTVerifyRevisionInclusionOperation alloc];
  uint64_t v39 = [(KTBackgroundSystemValidationOperation *)self deps];
  uint64_t v40 = [(KTBackgroundSystemValidationOperation *)self opUUID];
  id v41 = [(KTVerifyRevisionInclusionOperation *)v38 initWithDependencies:v39 opId:v40];

  [(KTVerifyConsistencyOperation *)v37 addNullableDependency:v25];
  [(KTVerifyConsistencyOperation *)v37 addNullableDependency:v29];
  [(KTVerifyRevisionInclusionOperation *)v41 addNullableDependency:v25];
  [(KTVerifyRevisionInclusionOperation *)v41 addNullableDependency:v29];
  v42 = [(KTBackgroundSystemValidationOperation *)self finishedOp];
  [v42 addSuccessDependency:v37];

  v43 = [(KTBackgroundSystemValidationOperation *)self finishedOp];
  [v43 addSuccessDependency:v41];

  v44 = [(KTGroupOperation *)self operationQueue];
  [v44 addOperation:v37];

  v45 = [(KTGroupOperation *)self operationQueue];
  [v45 addOperation:v41];

  id v46 = [KTGarbageCollectDBOperation alloc];
  v47 = [(KTBackgroundSystemValidationOperation *)self deps];
  v48 = [(KTGarbageCollectDBOperation *)v46 initWithDependencies:v47];

  v49 = [KTReportDBMetricsOperation alloc];
  v50 = [(KTBackgroundSystemValidationOperation *)self deps];
  v51 = [(KTReportDBMetricsOperation *)v49 initWithDependencies:v50];

  [(KTGarbageCollectDBOperation *)v48 addNullableDependency:v37];
  [(KTGarbageCollectDBOperation *)v48 addNullableDependency:v41];
  [(KTReportDBMetricsOperation *)v51 addNullableDependency:v48];
  v52 = [(KTBackgroundSystemValidationOperation *)self finishedOp];
  [v52 addNullableDependency:v48];

  v53 = [(KTBackgroundSystemValidationOperation *)self finishedOp];
  [v53 addNullableDependency:v51];

  v54 = [(KTGroupOperation *)self operationQueue];
  [v54 addOperation:v48];

  v55 = [(KTGroupOperation *)self operationQueue];
  [v55 addOperation:v51];

  v56 = [(KTGroupOperation *)self operationQueue];
  v57 = [(KTBackgroundSystemValidationOperation *)self finishedOp];
  [v56 addOperation:v57];

  objc_destroyWeak(&v59);
  objc_destroyWeak((id *)buf);
}

+ (id)lastDutyCycle:(id)a3
{
  v3 = [a3 smDataStore];
  id v4 = [v3 getSettingsDate:off_10031E2A0];

  return v4;
}

+ (id)lastDutyCycleSuccess:(id)a3
{
  v3 = [a3 smDataStore];
  id v4 = [v3 getSettingsDate:off_10031E2B0];

  return v4;
}

+ (id)sysdiagnoseInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 smDataStore];
  v5 = [v4 getSettingsDate:off_10031E2A0];

  uint64_t v6 = [v3 smDataStore];
  v37 = [v6 getSettingsDate:off_10031E2B0];

  v7 = [v3 smDataStore];
  v36 = [v7 getSettingsNumber:off_10031E2A8];

  v8 = [v3 smDataStore];
  v35 = [v8 getSettingsNumber:off_10031E2C0];

  uint64_t v9 = [v3 smDataStore];
  objc_super v10 = [v9 getSettingsData:off_10031E2B8];

  v11 = [v3 smDataStore];
  uint64_t v12 = [v11 getSettingsData:off_10031E2E0];

  v13 = [v3 smDataStore];
  uint64_t v14 = [v13 getSettingsData:off_10031E2D8];

  v15 = [v3 smDataStore];
  v16 = [v15 getSettingsData:off_10031E2D0];

  v33 = v10;
  if (v10) {
    id v34 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:[v10 bytes]];
  }
  else {
    id v34 = 0;
  }
  v17 = [v3 smDataStore];
  v18 = [v17 getSettingsData:off_10031E2C8];

  if (v18)
  {
    id v19 = objc_alloc_init((Class)KTNSErrorValueTransformer);
    v20 = [v19 transformedValue:v18];
  }
  else
  {
    v20 = 0;
  }
  if (v12) {
    id v21 = [objc_alloc((Class)NSString) initWithData:v12 encoding:4];
  }
  else {
    id v21 = 0;
  }
  v32 = (void *)v12;
  if (v14) {
    id v22 = [objc_alloc((Class)NSString) initWithData:v14 encoding:4];
  }
  else {
    id v22 = 0;
  }
  id v31 = (void *)v14;
  if (v16) {
    id v23 = [objc_alloc((Class)NSString) initWithData:v16 encoding:4];
  }
  else {
    id v23 = 0;
  }
  uint64_t v24 = +[NSMutableDictionary dictionary];
  id v25 = v5;
  id v26 = [v5 kt_toISO_8601_UTCString];
  [v24 setObject:v26 forKeyedSubscript:@"lastDutyCycle"];

  v27 = [v37 kt_toISO_8601_UTCString];
  [v24 setObject:v27 forKeyedSubscript:@"lastSuccess"];

  [v24 setObject:v36 forKeyedSubscript:@"lastResult"];
  [v24 setObject:v35 forKeyedSubscript:@"numSuccessiveFails"];
  v28 = [v34 UUIDString];
  [v24 setObject:v28 forKeyedSubscript:@"lastUUID"];

  if (v20)
  {
    v29 = +[TransparencyError diagnosticError:v20 depth:0];
    [v24 setObject:v29 forKeyedSubscript:@"lastError"];
  }
  [v24 setObject:v21 forKeyedSubscript:@"failureServerHints"];
  [v24 setObject:v22 forKeyedSubscript:@"failureType"];
  [v24 setObject:v23 forKeyedSubscript:@"failureData"];

  return v24;
}

+ (void)saveErrorToDB:(id)a3 smDataStore:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v9 = v5;
    id v6 = a3;
    id v7 = objc_alloc_init((Class)KTNSErrorValueTransformer);
    v8 = [v7 reverseTransformedValue:v6];

    if (v8) {
      [v9 setSettingsData:off_10031E2C8 data:v8];
    }

    id v5 = v9;
  }
}

- (void)saveErrorToDB
{
  id v5 = [(KTResultOperation *)self error];
  id v3 = [(KTBackgroundSystemValidationOperation *)self deps];
  id v4 = [v3 smDataStore];
  +[KTBackgroundSystemValidationOperation saveErrorToDB:v5 smDataStore:v4];
}

+ (void)addErrorToBackgroundOp:(id)a3 smDataStore:(id)a4 failureDataString:(id)a5 type:(id)a6 serverHint:(id)a7 failure:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v13)
  {
    id v19 = [v14 getSettingsData:off_10031E2B8];
    if (v19)
    {
      id v20 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:[v19 bytes]];
      if ([v13 isEqual:v20])
      {
        [v14 setSettingsNumber:off_10031E2A8 number:&off_1002D9C48];
        +[KTBackgroundSystemValidationOperation saveErrorToDB:v18 smDataStore:v14];
        id v21 = off_10031E2D0;
        id v22 = [v15 dataUsingEncoding:4];
        [v14 setSettingsData:v21 data:v22];

        id v23 = off_10031E2D8;
        uint64_t v24 = [v16 dataUsingEncoding:4];
        [v14 setSettingsData:v23 data:v24];

        id v25 = off_10031E2E0;
        id v26 = [v17 dataUsingEncoding:4];
        [v14 setSettingsData:v25 data:v26];

        if (qword_100326710 != -1) {
          dispatch_once(&qword_100326710, &stru_1002B83C0);
        }
        v27 = qword_100326718;
        if (os_log_type_enabled((os_log_t)qword_100326718, OS_LOG_TYPE_ERROR))
        {
          int v29 = 138543362;
          id v30 = v13;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "BackgroundSystemValidation: failed %{public}@", (uint8_t *)&v29, 0xCu);
        }
      }
    }
    else
    {
      if (qword_100326710 != -1) {
        dispatch_once(&qword_100326710, &stru_1002B83A0);
      }
      v28 = qword_100326718;
      if (os_log_type_enabled((os_log_t)qword_100326718, OS_LOG_TYPE_ERROR))
      {
        int v29 = 138543362;
        id v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "No saved background op UUID, but serverRPC has %{public}@", (uint8_t *)&v29, 0xCu);
      }
    }
  }
}

- (NSUUID)opUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 120, 1);
}

- (void)setOpUUID:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDeps:(id)a3
{
}

- (KTResultOperation)finishedOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);

  objc_storeStrong((id *)&self->_opUUID, 0);
}

@end