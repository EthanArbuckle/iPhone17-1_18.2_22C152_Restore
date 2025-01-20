@interface HIDTimestampSyncErrorHandler
- (BOOL)isMuted;
- (HIDTimestampSyncErrorHandler)initWithSubType:(id)a3;
- (NSString)subType;
- (void)reportFailure:(id)a3;
- (void)reportSuccess;
- (void)setSubType:(id)a3;
@end

@implementation HIDTimestampSyncErrorHandler

- (HIDTimestampSyncErrorHandler)initWithSubType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HIDTimestampSyncErrorHandler;
  v6 = [(HIDTimestampSyncErrorHandler *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subType, a3);
    v7->_consecutiveErrors = 0;
  }

  return v7;
}

- (void)reportFailure:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self->_consecutiveErrors + 1;
  self->_consecutiveErrors = v5;
  if (v5 > 0x1D)
  {
    if (v5 == 30)
    {
      if (qword_1000CD0B8 != -1) {
        dispatch_once(&qword_1000CD0B8, &stru_1000B1DD0);
      }
      v13 = (void *)qword_1000CD0B0;
      subType = self->_subType;
      v15 = +[NSProcessInfo processInfo];
      v16 = [v15 processName];
      v17 = [v13 signatureWithDomain:@"MobileBluetoothServices" type:@"HIDTimestampSync" subType:subType subtypeContext:0 detectedProcess:v16 triggerThresholdValues:0];

      unsigned __int8 v18 = [(id)qword_1000CD0B0 snapshotWithSignature:v17 duration:0 events:0 payload:0 actions:&stru_1000B1E10 reply:0.0];
      v19 = qword_1000CD178;
      if (v18)
      {
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 138412290;
          v35 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sent ABC snapshot for signature %@", (uint8_t *)&v34, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        sub_100071170((uint64_t)v17, v19, v20, v21, v22, v23, v24, v25);
      }
      v26 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100071084((uint64_t)v4, v26, v27, v28, v29, v30, v31, v32);
      }
      v33 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_1000710F0(v33);
      }
    }
  }
  else
  {
    v6 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100071084((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)reportSuccess
{
  self->_consecutiveErrors = 0;
}

- (BOOL)isMuted
{
  return self->_consecutiveErrors > 0x1D;
}

- (NSString)subType
{
  return self->_subType;
}

- (void)setSubType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end