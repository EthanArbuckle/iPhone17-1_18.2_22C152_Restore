@interface GKFairPlaySAPSession
- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3;
- (BOOL)isComplete;
- (GKFairPlaySAPSession)init;
- (NSString)SAPVersion;
- (id)exchangeData:(id)a3 error:(id *)a4;
- (id)processSignedData:(id)a3 withSignature:(id)a4 error:(id *)a5;
- (id)signatureForData:(id)a3 error:(id *)a4;
- (id)signatureStringForData:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)setSAPVersion:(id)a3;
@end

@implementation GKFairPlaySAPSession

- (GKFairPlaySAPSession)init
{
  v8.receiver = self;
  v8.super_class = (Class)GKFairPlaySAPSession;
  v2 = [(GKFairPlaySAPSession *)&v8 init];
  v3 = v2;
  if (v2)
  {
    if (![(GKFairPlaySAPSession *)v2 _getHardwareInfo:&v2->_hardwareInfo])
    {
LABEL_8:

      return 0;
    }
    sub_1001F6070((uint64_t)&v3->_session, (uint64_t)&v3->_hardwareInfo);
    if (v4)
    {
      int v5 = v4;
      if (!os_log_GKGeneral) {
        GKOSLoggers();
      }
      v6 = os_log_GKHTTP;
      if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MESCAL:Could not create SAP session: %d", buf, 8u);
      }
      goto LABEL_8;
    }
  }
  return v3;
}

- (void)dealloc
{
  session = self->_session;
  if (session) {
    sub_1001E735C((uint64_t)session);
  }

  v4.receiver = self;
  v4.super_class = (Class)GKFairPlaySAPSession;
  [(GKFairPlaySAPSession *)&v4 dealloc];
}

- (id)exchangeData:(id)a3 error:(id *)a4
{
  session = self->_session;
  if (session)
  {
    v15 = 0;
    unsigned int v14 = 0;
    char v13 = -1;
    sub_10021D1C0(200, (uint64_t)&self->_hardwareInfo, (uint64_t)session, (uint64_t)[a3 bytes], (uint64_t)[a3 length], (uint64_t)&v15, (uint64_t)&v14, (uint64_t)&v13);
    if (v7)
    {
      int v8 = v7;
      if (!os_log_GKGeneral) {
        GKOSLoggers();
      }
      v9 = os_log_GKHTTP;
      if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "MESCAL:Could not SAP exchange: %li", buf, 0xCu);
      }
      v11 = +[NSError errorWithDomain:@"GKFairPlay" code:v8 userInfo:0];
      CFDataRef v10 = 0;
    }
    else
    {
      CFDataRef v10 = sub_100119014(v15, v14);
      v11 = 0;
      self->_complete = v13 == 0;
    }
  }
  else
  {
    CFDataRef v10 = 0;
    v11 = 0;
  }
  if (a4 && !v10) {
    *a4 = v11;
  }
  return v10;
}

- (id)processSignedData:(id)a3 withSignature:(id)a4 error:(id *)a5
{
  if (!self->_session)
  {
    id v7 = 0;
    goto LABEL_14;
  }
  id v7 = [a3 mutableCopy];
  [a4 bytes];
  [a4 length];
  [v7 mutableBytes];
  [v7 length];
  sub_10020C988();
  int v9 = v8;
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  CFDataRef v10 = os_log_GKHTTP;
  if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    uint64_t v16 = objc_opt_class();
    __int16 v17 = 2048;
    v18 = (NSError *)v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "SIGNATURE VERIF1:%@: processed signature of SAP response: %li", (uint8_t *)&v15, 0x16u);
  }
  if (!v9)
  {
LABEL_14:
    v11 = 0;
    if (!a5) {
      return v7;
    }
    goto LABEL_15;
  }
  v11 = +[NSError errorWithDomain:@"GKFairPlay" code:v9 userInfo:0];
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  v12 = os_log_GKHTTP;
  if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = objc_opt_class();
    int v15 = 138412546;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SIGNATURE VERIF2:%@: Could not process SAP response: %@", (uint8_t *)&v15, 0x16u);
  }

  id v7 = 0;
  if (a5)
  {
LABEL_15:
    if (!v7) {
      *a5 = v11;
    }
  }
  return v7;
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  session = self->_session;
  if (!session)
  {
    CFDataRef v9 = 0;
    goto LABEL_9;
  }
  uint64_t v13 = 0;
  unsigned int v12 = 0;
  sub_1001F85B4((uint64_t)session, (uint64_t)[a3 bytes], (uint64_t)[a3 length], (uint64_t)&v13, (uint64_t)&v12);
  if (!v6)
  {
    CFDataRef v9 = sub_100119014(v13, v12);
LABEL_9:
    CFDataRef v10 = 0;
    if (!a4) {
      return v9;
    }
    goto LABEL_12;
  }
  int v7 = v6;
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  int v8 = os_log_GKHTTP;
  if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Could not SAP sign: %li", buf, 0xCu);
  }
  CFDataRef v10 = +[NSError errorWithDomain:@"GKFairPlay" code:v7 userInfo:0];
  CFDataRef v9 = 0;
  if (a4)
  {
LABEL_12:
    if (!v9) {
      *a4 = v10;
    }
  }
  return v9;
}

- (id)signatureStringForData:(id)a3 error:(id *)a4
{
  int v7 = 0;
  id v5 = [(GKFairPlaySAPSession *)self signatureForData:a3 error:&v7];
  id result = [v5 length];
  if (result) {
    id result = [v5 base64EncodedStringWithOptions:0];
  }
  if (a4)
  {
    if (!result) {
      *a4 = v7;
    }
  }
  return result;
}

- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3
{
  sub_100211248(0, 0, (uint64_t)a3);
  int v4 = v3;
  if (v3)
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    id v5 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100119500(v5);
    }
  }
  return v4 == 0;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (NSString)SAPVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSAPVersion:(id)a3
{
}

@end