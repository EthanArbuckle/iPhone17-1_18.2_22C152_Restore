@interface KTApplicationPublicKeyStore
- (BOOL)detectEpochChangeAndResetData:(unint64_t)a3 patLogBeginningMs:(unint64_t)a4 mapStillPopulating:(BOOL)a5 dataStore:(id)a6;
- (BOOL)detectResetForPAT:(unint64_t)a3;
- (BOOL)detectResetForTLT:(unint64_t)a3;
- (BOOL)inResetWindow;
- (BOOL)ready;
- (BOOL)readyWithRefresh:(BOOL)a3;
- (BOOL)storeExpired;
- (BOOL)triggerRefreshFromServerStatus:(int)a3;
- (BOOL)unsupported;
- (BOOL)updateWithPublicKeyResponse:(id)a3 dataStore:(id)a4 error:(id *)a5;
- (KTApplicationPublicKeyStore)initWithApplication:(id)a3 dataStore:(id)a4 diskState:(id)a5 contextStore:(id)a6 settings:(id)a7 error:(id *)a8;
- (KTApplicationPublicKeyStore)initWithApplication:(id)a3 dataStore:(id)a4 response:(id)a5 contextStore:(id)a6 settings:(id)a7 error:(id *)a8;
- (KTContextStore)contextStore;
- (KTContextStore)store;
- (KTPublicKeyStoreDelegateProtocol)delegate;
- (NSDate)receiptTime;
- (NSString)application;
- (NSString)treeRollInfoURL;
- (TransparencyPublicKeyBag)keyBag;
- (TransparencySettingsProtocol)settings;
- (TransparencyTrustedKeyStore)appSmtKeyStore;
- (TransparencyTrustedKeyStore)appSthKeyStore;
- (TransparencyTrustedKeyStore)tltKeyStore;
- (VRFPublicKey)vrfKey;
- (id)copyKeyStoreState;
- (id)createTLTApplicationPublicKeyStore;
- (int)patEarliestVersion;
- (int)tltEarliestVersion;
- (unint64_t)patLogBeginningMs;
- (unint64_t)shutDown;
- (unint64_t)tltLogBeginningMs;
- (void)clearDataForPAT:(unint64_t)a3 dataStore:(id)a4;
- (void)clearDataForTLT:(unint64_t)a3 dataStore:(id)a4;
- (void)clearState:(id *)a3;
- (void)notifyTreeResetDetected:(BOOL)a3 logTimestamp:(unint64_t)a4;
- (void)setApplication:(id)a3;
- (void)setContextStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyBag:(id)a3;
- (void)setReceiptTime:(id)a3;
- (void)setSettings:(id)a3;
- (void)startKeyStoreStateSampler;
@end

@implementation KTApplicationPublicKeyStore

- (BOOL)readyWithRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(KTApplicationPublicKeyStore *)self keyBag];
  uint64_t v6 = [v5 vrfKey];
  if (!v6) {
    goto LABEL_15;
  }
  v7 = (void *)v6;
  v8 = [(KTApplicationPublicKeyStore *)self keyBag];
  uint64_t v9 = [v8 appSthKeyStore];
  if (!v9)
  {

LABEL_15:
    return 0;
  }
  v10 = (void *)v9;
  v11 = [(KTApplicationPublicKeyStore *)self keyBag];
  v12 = [v11 tltKeyStore];

  if (!v12) {
    return 0;
  }
  v13 = [(KTApplicationPublicKeyStore *)self keyBag];
  v14 = [v13 vrfKey];
  unsigned int v15 = [v14 needsRefresh];

  if (v15)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C6EF8);
    }
    v16 = (void *)qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = [(KTApplicationPublicKeyStore *)self application];
      int v49 = 138412290;
      v50 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Trusted VRF key need refresh: %@", (uint8_t *)&v49, 0xCu);
    }
  }
  v19 = [(KTApplicationPublicKeyStore *)self keyBag];
  v20 = [v19 appSthKeyStore];
  v21 = [v20 signatureVerifier];
  unsigned int v22 = [v21 needsRefresh];

  if (v22)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C6F18);
    }
    v23 = (void *)qword_10032F140;
    char v24 = 0;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v23;
      v26 = [(KTApplicationPublicKeyStore *)self application];
      int v49 = 138412290;
      v50 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Trusted application STH signing keys need refresh: %@", (uint8_t *)&v49, 0xCu);

      char v24 = 0;
    }
  }
  else
  {
    char v24 = v15 ^ 1;
  }
  v28 = [(KTApplicationPublicKeyStore *)self application];
  unsigned __int8 v29 = [v28 isEqualToString:kKTApplicationIdentifierTLT];

  if ((v29 & 1) == 0)
  {
    v30 = [(KTApplicationPublicKeyStore *)self keyBag];
    uint64_t v31 = [v30 appSmtKeyStore];
    if (v31)
    {
      v32 = (void *)v31;
      v33 = [(KTApplicationPublicKeyStore *)self keyBag];
      v34 = [v33 appSmtKeyStore];
      v35 = [v34 signatureVerifier];
      unsigned int v36 = [v35 needsRefresh];

      if (!v36) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C6F38);
    }
    v37 = (void *)qword_10032F140;
    char v24 = 0;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
    {
      v38 = v37;
      v39 = [(KTApplicationPublicKeyStore *)self application];
      int v49 = 138412290;
      v50 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Trusted application SMT signing keys need refresh: %@", (uint8_t *)&v49, 0xCu);

      char v24 = 0;
    }
  }
LABEL_28:
  v40 = [(KTApplicationPublicKeyStore *)self keyBag];
  v41 = [v40 tltKeyStore];
  v42 = [v41 signatureVerifier];
  unsigned int v43 = [v42 needsRefresh];

  if (v43)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C6F58);
    }
    v44 = (void *)qword_10032F140;
    char v24 = 0;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      v46 = [(KTApplicationPublicKeyStore *)self application];
      int v49 = 138412290;
      v50 = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Trusted TLT signing keys need refresh: %@", (uint8_t *)&v49, 0xCu);

      char v24 = 0;
    }
  }
  if ((v24 & 1) == 0 && v3)
  {
    v47 = [(KTApplicationPublicKeyStore *)self delegate];
    v48 = [(KTApplicationPublicKeyStore *)self application];
    [v47 storeNeedsUpdate:v48];

    return 0;
  }
  return v24;
}

- (BOOL)ready
{
  return [(KTApplicationPublicKeyStore *)self readyWithRefresh:1];
}

- (BOOL)storeExpired
{
  BOOL v3 = [(KTApplicationPublicKeyStore *)self receiptTime];
  [v3 timeIntervalSinceNow];
  double v5 = v4;
  double v6 = (double)(uint64_t)-kKTPublicKeysResponseRefresh;

  if (v5 < v6)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C6F78);
    }
    v7 = (void *)qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      uint64_t v9 = [(KTApplicationPublicKeyStore *)self application];
      int v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Public Keys Response older than refresh time period: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return v5 < v6;
}

- (BOOL)triggerRefreshFromServerStatus:(int)a3
{
  if (a3 != 6) {
    return 0;
  }
  double v4 = [(KTApplicationPublicKeyStore *)self receiptTime];
  [v4 timeIntervalSinceNow];
  double v6 = v5;
  double v7 = (double)(uint64_t)-kKTPublicKeysResponseRefreshInvalidRequest;

  if (v6 >= v7) {
    return 0;
  }
  if (qword_10032F138 != -1) {
    dispatch_once(&qword_10032F138, &stru_1002C6F98);
  }
  v8 = (void *)qword_10032F140;
  if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    v10 = [(KTApplicationPublicKeyStore *)self application];
    int v23 = 138543362;
    char v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Got invalid request status and public keys response for %{public}@ is old; setting key store as needs refresh",
      (uint8_t *)&v23,
      0xCu);
  }
  int v11 = [(KTApplicationPublicKeyStore *)self keyBag];
  v12 = [v11 vrfKey];
  BOOL v13 = 1;
  [v12 setNeedsRefresh:1];

  v14 = [(KTApplicationPublicKeyStore *)self keyBag];
  unsigned int v15 = [v14 appSmtKeyStore];
  v16 = [v15 signatureVerifier];
  [v16 setNeedsRefresh:1];

  v17 = [(KTApplicationPublicKeyStore *)self keyBag];
  v18 = [v17 appSthKeyStore];
  v19 = [v18 signatureVerifier];
  [v19 setNeedsRefresh:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = [(KTApplicationPublicKeyStore *)self application];
  [WeakRetained storeNeedsUpdate:v21];

  return v13;
}

- (void)clearState:(id *)a3
{
  obj = self;
  objc_sync_enter(obj);
  [(KTApplicationPublicKeyStore *)obj setKeyBag:0];
  objc_sync_exit(obj);
}

- (VRFPublicKey)vrfKey
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  BOOL v3 = [v2 vrfKey];

  return (VRFPublicKey *)v3;
}

- (TransparencyTrustedKeyStore)appSmtKeyStore
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  BOOL v3 = [v2 appSmtKeyStore];

  return (TransparencyTrustedKeyStore *)v3;
}

- (TransparencyTrustedKeyStore)appSthKeyStore
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  BOOL v3 = [v2 appSthKeyStore];

  return (TransparencyTrustedKeyStore *)v3;
}

- (TransparencyTrustedKeyStore)tltKeyStore
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  BOOL v3 = [v2 tltKeyStore];

  return (TransparencyTrustedKeyStore *)v3;
}

- (BOOL)unsupported
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  unsigned __int8 v3 = [v2 unsupported];

  return v3;
}

- (unint64_t)patLogBeginningMs
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  id v3 = [v2 patLogBeginningMs];

  return (unint64_t)v3;
}

- (unint64_t)tltLogBeginningMs
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  id v3 = [v2 tltLogBeginningMs];

  return (unint64_t)v3;
}

- (int)tltEarliestVersion
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  int v3 = [v2 tltEarliestVersion];

  return v3;
}

- (int)patEarliestVersion
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  int v3 = [v2 patEarliestVersion];

  return v3;
}

- (unint64_t)shutDown
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  id v3 = [v2 shutDown];

  return (unint64_t)v3;
}

- (NSString)treeRollInfoURL
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  id v3 = [v2 treeRollInfoURL];

  return (NSString *)v3;
}

- (id)copyKeyStoreState
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  id v3 = [v2 diskStoreDictionary];

  return v3;
}

- (void)notifyTreeResetDetected:(BOOL)a3 logTimestamp:(unint64_t)a4
{
  BOOL v5 = a3;
  double v7 = +[TransparencyAnalytics logger];
  v8 = v7;
  if (v5)
  {
    [v7 noteEventNamed:@"ktTLTResetEvent"];

    notify_post("com.apple.Transparency.TLTReset");
    notify_post("com.apple.Transparency.KT.IDSReset");
    notify_post("com.apple.Transparency.KT.FTReset");
    notify_post("com.apple.Transparency.KT.MPReset");
  }
  else
  {
    v10 = [(KTApplicationPublicKeyStore *)self application];
    int v11 = +[TransparencyAnalytics formatEventName:@"TreeResetEvent" application:v10];
    [v8 noteEventNamed:v11];

    v12 = [(KTApplicationPublicKeyStore *)self application];
    LODWORD(v11) = [v12 isEqualToString:kKTApplicationIdentifierIDS];

    if (v11)
    {
      notify_post("com.apple.Transparency.KT.IDSReset");
      BOOL v13 = [(KTApplicationPublicKeyStore *)self delegate];
      v14 = [(KTApplicationPublicKeyStore *)self application];
      unsigned int v15 = [v13 optInStateForKeyStore:v14 error:0];

      v16 = [(KTApplicationPublicKeyStore *)self contextStore];
      v17 = [v16 followup];
      v18 = [(KTApplicationPublicKeyStore *)self application];
      v19 = +[NSUUID UUID];
      v20 = [(KTApplicationPublicKeyStore *)self treeRollInfoURL];
      CFStringRef v29 = @"logBeginMs";
      v21 = +[NSNumber numberWithUnsignedLongLong:a4];
      v30 = v21;
      unsigned int v22 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      [v17 postFollowup:v18 type:3 eventId:v19 errorCode:0 optInState:v15 infoLink:v20 additionalInfo:v22 error:0];

      return;
    }
    int v23 = [(KTApplicationPublicKeyStore *)self application];
    unsigned int v24 = [v23 isEqualToString:kKTApplicationIdentifierIDSFaceTime];

    if (v24)
    {
      uint64_t v9 = "com.apple.Transparency.KT.FTReset";
      goto LABEL_4;
    }
    v25 = [(KTApplicationPublicKeyStore *)self application];
    unsigned int v26 = [v25 isEqualToString:kKTApplicationIdentifierIDSMultiplex];

    if (v26)
    {
      uint64_t v9 = "com.apple.Transparency.KT.MPReset";
      goto LABEL_4;
    }
    v27 = [(KTApplicationPublicKeyStore *)self application];
    unsigned int v28 = [v27 isEqualToString:kKTApplicationIdentifierCloudKit];

    if (!v28) {
      return;
    }
  }
  uint64_t v9 = "com.apple.Transparency.KT.CKReset";
LABEL_4:

  notify_post(v9);
}

- (BOOL)detectResetForTLT:(unint64_t)a3
{
  BOOL v5 = [(KTApplicationPublicKeyStore *)self keyBag];
  if (![v5 tltLogBeginningMs])
  {

    return 0;
  }
  double v6 = [(KTApplicationPublicKeyStore *)self keyBag];
  id v7 = [v6 tltLogBeginningMs];

  if ((unint64_t)v7 >= a3) {
    return 0;
  }
  if (qword_10032F138 != -1) {
    dispatch_once(&qword_10032F138, &stru_1002C6FB8);
  }
  v8 = (void *)qword_10032F140;
  if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    v10 = [(KTApplicationPublicKeyStore *)self keyBag];
    int v12 = 134218240;
    id v13 = [v10 tltLogBeginningMs];
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Detected a TLT reset from %llu to %llu", (uint8_t *)&v12, 0x16u);
  }
  return 1;
}

- (void)clearDataForTLT:(unint64_t)a3 dataStore:(id)a4
{
  id v6 = a4;
  id v7 = [(KTApplicationPublicKeyStore *)self contextStore];
  [v7 clearGossip];

  uint64_t v8 = kKTApplicationIdentifierTLT;
  id v23 = 0;
  LOBYTE(a3) = [v6 deleteSTHs:kKTApplicationIdentifierTLT logBeginMsLessThan:a3 error:&v23];
  id v9 = v23;
  if ((a3 & 1) == 0)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C6FD8);
    }
    v10 = qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to delete TLT STHs from prior epoch: %@", buf, 0xCu);
    }
  }
  id v22 = v9;
  unsigned __int8 v11 = [v6 deleteDownloadRecords:v8 error:&v22];
  id v12 = v22;

  if ((v11 & 1) == 0)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C6FF8);
    }
    id v13 = qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "failed to delete TLT download records: %@", buf, 0xCu);
    }
  }
  id v21 = v12;
  unsigned __int8 v14 = [v6 deleteServerRPCs:v8 error:&v21];
  id v15 = v21;

  if ((v14 & 1) == 0)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C7018);
    }
    v16 = qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to delete TLT server RPCs: %@", buf, 0xCu);
    }
  }
  id v20 = v15;
  unsigned __int8 v17 = [v6 resetRequestsForTLTReset:&v20];
  id v18 = v20;

  if ((v17 & 1) == 0)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C7038);
    }
    v19 = qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "failed to delete stored requests for all applications: %@", buf, 0xCu);
    }
  }
}

- (BOOL)detectResetForPAT:(unint64_t)a3
{
  BOOL v5 = [(KTApplicationPublicKeyStore *)self keyBag];
  if (![v5 patLogBeginningMs])
  {

    return 0;
  }
  id v6 = [(KTApplicationPublicKeyStore *)self keyBag];
  id v7 = [v6 patLogBeginningMs];

  if ((unint64_t)v7 >= a3) {
    return 0;
  }
  if (qword_10032F138 != -1) {
    dispatch_once(&qword_10032F138, &stru_1002C7058);
  }
  uint64_t v8 = (void *)qword_10032F140;
  if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    v10 = [(KTApplicationPublicKeyStore *)self keyBag];
    int v12 = 134218240;
    id v13 = [v10 patLogBeginningMs];
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Detected a PAT reset from %llu to %llu", (uint8_t *)&v12, 0x16u);
  }
  return 1;
}

- (void)clearDataForPAT:(unint64_t)a3 dataStore:(id)a4
{
  id v6 = a4;
  id v7 = [(KTApplicationPublicKeyStore *)self keyBag];
  uint64_t v8 = [v7 trustedAppSigningKeys];
  id v9 = [v8 allKeys];

  v10 = [(KTApplicationPublicKeyStore *)self application];
  id v44 = 0;
  unsigned __int8 v11 = [v6 deleteSMTsWithSPKINotIn:v9 application:v10 error:&v44];
  id v12 = v44;

  if ((v11 & 1) == 0)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C7078);
    }
    id v13 = (void *)qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = v13;
      unint64_t v15 = [(KTApplicationPublicKeyStore *)self application];
      *(_DWORD *)buf = 138412546;
      v46 = v15;
      __int16 v47 = 2112;
      id v48 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to delete %@ PAT SMTs from prior epoch: %@", buf, 0x16u);
    }
  }
  v16 = [(KTApplicationPublicKeyStore *)self application];
  id v43 = v12;
  unsigned __int8 v17 = [v6 deleteSTHs:v16 logBeginMsLessThan:a3 error:&v43];
  id v18 = v43;

  if ((v17 & 1) == 0)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C7098);
    }
    v19 = (void *)qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      id v20 = v19;
      id v21 = [(KTApplicationPublicKeyStore *)self application];
      *(_DWORD *)buf = 138412546;
      v46 = v21;
      __int16 v47 = 2112;
      id v48 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to delete %@ PAT STHs from prior epoch: %@", buf, 0x16u);
    }
  }
  id v22 = [(KTApplicationPublicKeyStore *)self application];
  id v42 = v18;
  unsigned __int8 v23 = [v6 deleteDownloadRecords:v22 error:&v42];
  id v24 = v42;

  if ((v23 & 1) == 0)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C70B8);
    }
    id v25 = (void *)qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      unsigned int v26 = v25;
      v27 = [(KTApplicationPublicKeyStore *)self application];
      *(_DWORD *)buf = 138412546;
      v46 = v27;
      __int16 v47 = 2112;
      id v48 = v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "failed to delete %@ download records: %@", buf, 0x16u);
    }
  }
  unsigned int v28 = [(KTApplicationPublicKeyStore *)self application];
  id v41 = v24;
  unsigned __int8 v29 = [v6 deleteServerRPCs:v28 error:&v41];
  id v30 = v41;

  if ((v29 & 1) == 0)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C70D8);
    }
    uint64_t v31 = (void *)qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      v32 = v31;
      v33 = [(KTApplicationPublicKeyStore *)self application];
      *(_DWORD *)buf = 138412546;
      v46 = v33;
      __int16 v47 = 2112;
      id v48 = v30;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "failed to delete %@ server RPCs: %@", buf, 0x16u);
    }
  }
  v34 = [(KTApplicationPublicKeyStore *)self application];
  id v40 = v30;
  unsigned __int8 v35 = [v6 resetRequestsForApplication:v34 error:&v40];
  id v36 = v40;

  if ((v35 & 1) == 0)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C70F8);
    }
    v37 = (void *)qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      v38 = v37;
      v39 = [(KTApplicationPublicKeyStore *)self application];
      *(_DWORD *)buf = 138412546;
      v46 = v39;
      __int16 v47 = 2112;
      id v48 = v36;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "failed to delete stored requests for %@: %@", buf, 0x16u);
    }
  }
}

- (BOOL)detectEpochChangeAndResetData:(unint64_t)a3 patLogBeginningMs:(unint64_t)a4 mapStillPopulating:(BOOL)a5 dataStore:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  unsigned int v11 = [(KTApplicationPublicKeyStore *)self detectResetForTLT:a3];
  if (v11)
  {
    [(KTApplicationPublicKeyStore *)self clearDataForTLT:a3 dataStore:v10];
    [(KTApplicationPublicKeyStore *)self notifyTreeResetDetected:1 logTimestamp:a3];
  }
  unsigned int v12 = [(KTApplicationPublicKeyStore *)self detectResetForPAT:a4];
  if (v12)
  {
    [(KTApplicationPublicKeyStore *)self clearDataForPAT:a4 dataStore:v10];
    if (v6)
    {
      if (qword_10032F138 != -1) {
        dispatch_once(&qword_10032F138, &stru_1002C7118);
      }
      id v13 = qword_10032F140;
      if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134217984;
        unint64_t v17 = a4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notifying about PAT reset %llu", (uint8_t *)&v16, 0xCu);
      }
      [(KTApplicationPublicKeyStore *)self notifyTreeResetDetected:0 logTimestamp:a4];
    }
    else
    {
      if (qword_10032F138 != -1) {
        dispatch_once(&qword_10032F138, &stru_1002C7138);
      }
      __int16 v14 = qword_10032F140;
      if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134217984;
        unint64_t v17 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not notifying about PAT reset %llu", (uint8_t *)&v16, 0xCu);
      }
    }
  }

  return v11 | v12;
}

- (BOOL)inResetWindow
{
  v2 = [(KTApplicationPublicKeyStore *)self keyBag];
  id v3 = [v2 patLogBeginningMs];
  double v4 = (double)((unint64_t)v3 + kKTMaximumResetFailureWindowMs);
  +[NSDate kt_currentTimeMs];
  BOOL v6 = v5 < v4;

  return v6;
}

- (void)startKeyStoreStateSampler
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_1001CF088;
  v7[4] = sub_1001CF098;
  id v8 = 0;
  id v8 = [(KTApplicationPublicKeyStore *)self application];
  id v3 = [(KTApplicationPublicKeyStore *)self application];
  double v4 = +[NSString stringWithFormat:@"KeyStoreState-%@", v3];

  double v5 = +[TransparencyAnalytics logger];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001CF0A0;
  v6[3] = &unk_1002C7160;
  v6[4] = self;
  v6[5] = v7;
  [v5 addMultiSamplerForName:v4 withTimeInterval:v6 block:SFAnalyticsSamplerIntervalOncePerReport];

  _Block_object_dispose(v7, 8);
}

- (KTApplicationPublicKeyStore)initWithApplication:(id)a3 dataStore:(id)a4 response:(id)a5 contextStore:(id)a6 settings:(id)a7 error:(id *)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v26.receiver = self;
  v26.super_class = (Class)KTApplicationPublicKeyStore;
  id v20 = [(KTApplicationPublicKeyStore *)&v26 init];
  id v21 = v20;
  if (!v20) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v20->_application, a3);
  [(KTApplicationPublicKeyStore *)v21 setSettings:v19];
  if ([(KTApplicationPublicKeyStore *)v21 updateWithPublicKeyResponse:v17 dataStore:v16 error:a8])
  {
    [(KTApplicationPublicKeyStore *)v21 startKeyStoreStateSampler];
    [(KTApplicationPublicKeyStore *)v21 setContextStore:v18];
LABEL_4:
    id v22 = v21;
    goto LABEL_13;
  }
  if (qword_10032F138 != -1) {
    dispatch_once(&qword_10032F138, &stru_1002C7180);
  }
  unsigned __int8 v23 = qword_10032F140;
  if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
  {
    if (a8) {
      id v24 = *a8;
    }
    else {
      id v24 = 0;
    }
    *(_DWORD *)buf = 138543618;
    id v28 = v15;
    __int16 v29 = 2112;
    id v30 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to create key bag from public key response for %{public}@: %@", buf, 0x16u);
  }
  id v22 = 0;
LABEL_13:

  return v22;
}

- (BOOL)updateWithPublicKeyResponse:(id)a3 dataStore:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [TransparencyPublicKeyBag alloc];
  unsigned int v11 = [(KTApplicationPublicKeyStore *)self application];
  unsigned int v12 = [(KTApplicationPublicKeyStore *)self settings];
  id v13 = [(TransparencyPublicKeyBag *)v10 initWithPublicKeysResponse:v8 application:v11 settings:v12 error:a5];

  if (!v13)
  {
LABEL_35:
    [(KTApplicationPublicKeyStore *)self setKeyBag:0];
    BOOL v35 = 0;
    goto LABEL_36;
  }
  __int16 v14 = [(TransparencyPublicKeyBag *)v13 vrfKey];

  if (!v14)
  {
    if (a5)
    {
      id v36 = [(KTApplicationPublicKeyStore *)self application];
      *a5 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -166, @"missing VRF key in KT %@ key bag", v36 code description];
    }
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C71A0);
    }
    v37 = (void *)qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      v38 = v37;
      v39 = [(KTApplicationPublicKeyStore *)self application];
      *(_DWORD *)buf = 138543362;
      id v53 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "missing VRF key in KT %{public}@ key bag", buf, 0xCu);
    }
    goto LABEL_35;
  }
  if ([(KTApplicationPublicKeyStore *)self detectEpochChangeAndResetData:[(TransparencyPublicKeyBag *)v13 tltLogBeginningMs] patLogBeginningMs:[(TransparencyPublicKeyBag *)v13 patLogBeginningMs] mapStillPopulating:[(TransparencyPublicKeyBag *)v13 mapStillPopulating] dataStore:v9])
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C71C0);
    }
    id v15 = qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "processPatConfigProof detected a tree reset", buf, 2u);
    }
  }
  id v41 = self;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v16 = [(TransparencyPublicKeyBag *)v13 verifiedLogHeads];
  id v17 = [v16 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v49;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v49 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        [v21 setDataStore:v9];
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_1001CFB18;
        v46[3] = &unk_1002B7D58;
        v46[4] = v21;
        id v47 = v9;
        [v47 performBlockAndWait:v46];
      }
      id v18 = [v16 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v18);
  }

  id v22 = [(TransparencyPublicKeyBag *)v13 verifiedSignedMapHead];

  if (v22)
  {
    unsigned __int8 v23 = [(TransparencyPublicKeyBag *)v13 verifiedSignedMapHead];
    [v23 setDataStore:v9];
    id v24 = [(KTApplicationPublicKeyStore *)v41 application];
    id v45 = 0;
    id v25 = [v9 newestMapRevision:v24 logBeginMs:objc_msgSend(v23, "overrideBeginTime") error:&v45];
    id v26 = v45;

    if (v26)
    {
      if (qword_10032F138 != -1) {
        dispatch_once(&qword_10032F138, &stru_1002C7200);
      }
      v27 = qword_10032F140;
      if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "processPamHeadInPatProof couldn't fetch newest map revision: %@", buf, 0xCu);
      }
    }
    id v28 = [v23 parsedMapHead];
    id v29 = [v28 revision];

    if (v29 > v25)
    {
      if (qword_10032F138 != -1) {
        dispatch_once(&qword_10032F138, &stru_1002C7220);
      }
      id v30 = (void *)qword_10032F140;
      if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = v30;
        v32 = [(KTApplicationPublicKeyStore *)v41 application];
        v33 = [v23 parsedMapHead];
        id v34 = [v33 revision];
        *(_DWORD *)buf = 138412546;
        id v53 = v32;
        __int16 v54 = 2048;
        id v55 = v34;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "processPamHeadInPatProof storing SMH for %@ rev %llu", buf, 0x16u);
      }
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1001CFD78;
      v42[3] = &unk_1002B7D58;
      id v43 = v23;
      id v44 = v9;
      [v44 performBlockAndWait:v42];
    }
  }
  [(KTApplicationPublicKeyStore *)v41 setKeyBag:v13];
  BOOL v35 = 1;
LABEL_36:

  return v35;
}

- (KTApplicationPublicKeyStore)initWithApplication:(id)a3 dataStore:(id)a4 diskState:(id)a5 contextStore:(id)a6 settings:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)KTApplicationPublicKeyStore;
  id v18 = [(KTApplicationPublicKeyStore *)&v27 init];
  uint64_t v19 = v18;
  if (!v18) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v18->_application, a3);
  [(KTApplicationPublicKeyStore *)v19 setSettings:v17];
  id v20 = [TransparencyPublicKeyBag alloc];
  id v21 = [(KTApplicationPublicKeyStore *)v19 settings];
  id v22 = [(TransparencyPublicKeyBag *)v20 initWithDiskKeyStore:v15 application:v14 settings:v21 error:a8];

  if (v22)
  {
    [(KTApplicationPublicKeyStore *)v19 setKeyBag:v22];
    [(KTApplicationPublicKeyStore *)v19 startKeyStoreStateSampler];
    [(KTApplicationPublicKeyStore *)v19 setContextStore:v16];

LABEL_4:
    unsigned __int8 v23 = v19;
    goto LABEL_13;
  }
  if (qword_10032F138 != -1) {
    dispatch_once(&qword_10032F138, &stru_1002C7280);
  }
  id v24 = qword_10032F140;
  if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
  {
    if (a8) {
      id v25 = *a8;
    }
    else {
      id v25 = 0;
    }
    *(_DWORD *)buf = 138543618;
    id v29 = v14;
    __int16 v30 = 2112;
    id v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to create key bag from disk for %{public}@: %@", buf, 0x16u);
  }
  unsigned __int8 v23 = 0;
LABEL_13:

  return v23;
}

- (id)createTLTApplicationPublicKeyStore
{
  id v3 = objc_alloc_init(KTApplicationPublicKeyStore);
  [(KTApplicationPublicKeyStore *)v3 setApplication:kKTApplicationIdentifierTLT];
  double v4 = [(KTApplicationPublicKeyStore *)self keyBag];
  id v5 = [v4 copyTltBag];
  [(KTApplicationPublicKeyStore *)v3 setKeyBag:v5];

  BOOL v6 = [(KTApplicationPublicKeyStore *)self receiptTime];
  [(KTApplicationPublicKeyStore *)v3 setReceiptTime:v6];

  id v7 = [(KTApplicationPublicKeyStore *)self contextStore];
  [(KTApplicationPublicKeyStore *)v3 setContextStore:v7];

  id v8 = [(KTApplicationPublicKeyStore *)self settings];
  [(KTApplicationPublicKeyStore *)v3 setSettings:v8];

  return v3;
}

- (TransparencyPublicKeyBag)keyBag
{
  return (TransparencyPublicKeyBag *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKeyBag:(id)a3
{
}

- (KTContextStore)store
{
  return (KTContextStore *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)receiptTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReceiptTime:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setApplication:(id)a3
{
}

- (KTContextStore)contextStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextStore);

  return (KTContextStore *)WeakRetained;
}

- (void)setContextStore:(id)a3
{
}

- (KTPublicKeyStoreDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (KTPublicKeyStoreDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contextStore);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_receiptTime, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_keyBag, 0);
}

@end