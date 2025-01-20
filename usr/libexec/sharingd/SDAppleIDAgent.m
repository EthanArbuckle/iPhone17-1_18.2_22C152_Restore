@interface SDAppleIDAgent
+ (id)sharedAgent;
- (BOOL)_wasIdentityLinkedOnce;
- (BOOL)_wasOldAgentIdentityQueried;
- (BOOL)eduModeEnabled;
- (SDAppleIDAgent)init;
- (__SecIdentity)_copyIdentityForAppleID:(id)a3;
- (__SecIdentity)copyIdentityForAppleID:(id)a3;
- (id)_accountForAppleID:(id)a3;
- (id)_detailedDescription;
- (id)_metaInfoValueForKey:(id)a3;
- (id)_statusInfo;
- (id)accountForAppleID:(id)a3;
- (id)accountStatusForAppleID:(id)a3;
- (id)detailedDescription;
- (id)myAccount;
- (id)statusInfo;
- (id)validationRecordInfoForAppleID:(id)a3;
- (id)verifiedIdentityForCertificateChain:(id)a3 emailOrPhone:(id)a4 error:(id *)a5;
- (id)verifiedIdentityForEmailOrPhone:(id)a3;
- (int)_ensureEduModeDevicesAreCleanedUp;
- (int)_performKeyVerificationForIdentity:(id)a3;
- (int)_performKeychainCount;
- (int64_t)_accountState;
- (unint64_t)_keychainCleanupTag;
- (void)_activate;
- (void)_addObservers;
- (void)_checkIfAppleIDCertificateChainIsValidForIdentity:(id)a3 completion:(id)a4;
- (void)_cleanUpAccount:(id)a3;
- (void)_clearAccount;
- (void)_ensurePeriodicVerifyTimerStarted;
- (void)_ensurePeriodicVerifyTimerStopped;
- (void)_ensurePushStarted;
- (void)_ensurePushStopped;
- (void)_ensureThrottledRetryTimerStartedWithSuggestedDelay:(unint64_t)a3;
- (void)_ensureThrottledRetryTimerStopped;
- (void)_handleAccountIdentifierValidationRecordMismatch;
- (void)_handleAppleIDChangedNotification;
- (void)_handleAppleIDSignedInNotification;
- (void)_handleAppleIDSignedOutNotification;
- (void)_handleCertificateStatusUpdate:(int64_t)a3 forAppleID:(id)a4;
- (void)_handleFindPersonResponse:(id)a3 forRequest:(id)a4 emailOrPhone:(id)a5 withError:(id)a6 queue:(id)a7 completion:(id)a8;
- (void)_handleInfoResponse:(id)a3 forAppleID:(id)a4 infoRequest:(id)a5 certificateSerialNumber:(id)a6 withError:(id)a7 completion:(id)a8;
- (void)_handleKeyBagFirstUnlockNotification;
- (void)_handleKeyVerificationFailure;
- (void)_handlePeriodicVerifyTimerFired;
- (void)_handleReceivedCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5;
- (void)_handleReceivedIdentity:(id)a3 forAppleID:(id)a4 identityRequest:(id)a5 withError:(id)a6 completion:(id)a7;
- (void)_handleServerTaskCompletionWithError:(id)a3;
- (void)_handleThrottledRetryTimerFired;
- (void)_handleUILockStatusChange;
- (void)_handleUILockStatusChangedNotification;
- (void)_handleUntrustedAppleIDCertificateChainForIdentity:(id)a3;
- (void)_invalidate;
- (void)_performOtherTaskWithInfo:(id)a3 completion:(id)a4;
- (void)_performServerTaskWithInfo:(id)a3 completion:(id)a4;
- (void)_personInfoWithEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_prefsChanged;
- (void)_removeObservers;
- (void)_requestIdentityForAppleID:(id)a3 certificateToken:(id)a4 privateKeyPersistentReference:(id)a5 withCompletion:(id)a6;
- (void)_requestInfoForAppleID:(id)a3 completion:(id)a4;
- (void)_setCurrentAppleIDContactInfo:(id)a3 validationRecord:(id)a4;
- (void)_setCurrentAppleIDIdentity:(id)a3;
- (void)_setMetaInfoValue:(id)a3 forKey:(id)a4;
- (void)_update;
- (void)_updateAppleID;
- (void)_updateMyInfo;
- (void)_verifyState;
- (void)_verifyStateWithDelay:(double)a3;
- (void)activate;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)handleAppleIDChangedNotification;
- (void)handleAppleIDSignedInNotification;
- (void)handleAppleIDSignedOutNotification;
- (void)handleKeyBagFirstUnlockNotification;
- (void)handleUILockStatusChangedNotification;
- (void)invalidate;
- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4;
- (void)personInfoWithEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)prefsChanged;
- (void)queryVerifiedIdentityForEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)requestWithInfo:(id)a3 completion:(id)a4;
- (void)verifiedIdentityForEmailOrPhone:(id)a3 completion:(id)a4;
- (void)verifiedIdentityForEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation SDAppleIDAgent

- (SDAppleIDAgent)init
{
  v11.receiver = self;
  v11.super_class = (Class)SDAppleIDAgent;
  v2 = [(SDAppleIDAgent *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate date];
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;

    uint64_t v5 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[NSMutableArray array];
    findPersonRequests = v2->_findPersonRequests;
    v2->_findPersonRequests = (NSMutableArray *)v7;

    pushEnvironment = v2->_pushEnvironment;
    v2->_pushEnvironment = (NSString *)@"production";
  }
  return v2;
}

- (void)dealloc
{
  if (self->_pushConnection)
  {
    v2 = (SDAppleIDAgent *)FatalErrorF();
    [(SDAppleIDAgent *)v2 eduModeEnabled];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SDAppleIDAgent;
    [(SDAppleIDAgent *)&v4 dealloc];
  }
}

- (BOOL)eduModeEnabled
{
  if (qword_100980208 != -1) {
    dispatch_once(&qword_100980208, &stru_1008CF338);
  }
  return byte_100980200;
}

- (id)_accountForAppleID:(id)a3
{
  return [(SDAppleIDDatabaseManager *)self->_dbManager accountForAppleID:a3];
}

- (int64_t)_accountState
{
  if (self->_appleID)
  {
    SEL v3 = +[SDStatusMonitor sharedMonitor];
    unsigned __int8 v4 = [v3 deviceWasUnlockedOnce];

    if (v4)
    {
      uint64_t v5 = [(SDAppleIDAgent *)self _accountForAppleID:self->_appleID];
      if (v5)
      {
        v6 = v5;
        uint64_t v7 = [v5 altDSID];

        if (v7)
        {
          v8 = [v6 identity];
          if (v8)
          {
            v9 = v8;
            id v10 = [v8 copyCertificate];
            if (v10)
            {
              objc_super v11 = v10;
              id v12 = [v9 copyIntermediateCertificate];
              if (v12)
              {
                v13 = v12;
                id v14 = [v9 copyPrivateKey];
                if (v14)
                {
                  if ([v9 certificateExpired])
                  {
                    if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
                      LogPrintF();
                    }
                    int64_t v17 = 5;
                  }
                  else if ([v9 isInvalid])
                  {
                    if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
                      LogPrintF();
                    }
                    int64_t v17 = 2;
                  }
                  else
                  {
                    v15 = [v6 validationRecord];
                    unsigned int v16 = [v15 isInvalid];

                    if (v16)
                    {
                      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
                        LogPrintF();
                      }
                      int64_t v17 = 3;
                    }
                    else
                    {
                      int64_t v17 = 1;
                    }
                  }
                }
                else
                {
                  if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
                    LogPrintF();
                  }
                  int64_t v17 = 11;
                }
                CFRelease(v11);
                CFRelease(v13);
                if (v14) {
                  CFRelease(v14);
                }
              }
              else
              {
                if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
                  LogPrintF();
                }
                CFRelease(v11);
                int64_t v17 = 12;
              }
            }
            else
            {
              if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              int64_t v17 = 6;
            }
            goto LABEL_15;
          }
          if (self->_identityRequest)
          {
            if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            v9 = 0;
            int64_t v17 = 4;
            goto LABEL_15;
          }
          if (dword_100968E10 > 30 || dword_100968E10 == -1 && !_LogCategory_Initialize())
          {
LABEL_76:
            v9 = 0;
            int64_t v17 = 10;
            goto LABEL_15;
          }
        }
        else if (dword_100968E10 > 60 || dword_100968E10 == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_76;
        }
        LogPrintF();
        goto LABEL_76;
      }
      if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v9 = 0;
      v6 = 0;
      int64_t v17 = 9;
    }
    else
    {
      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v9 = 0;
      v6 = 0;
      int64_t v17 = 14;
    }
  }
  else
  {
    if (dword_100968E10 <= 50 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v9 = 0;
    v6 = 0;
    int64_t v17 = 13;
  }
LABEL_15:

  return v17;
}

- (void)_activate
{
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDAppleIDAgent *)self _prefsChanged];
  [(SDAppleIDAgent *)self _addObservers];
  [(SDAppleIDAgent *)self _ensurePushStarted];
  [(SDAppleIDAgent *)self _ensurePeriodicVerifyTimerStarted];

  [(SDAppleIDAgent *)self _ensureEduModeDevicesAreCleanedUp];
}

- (void)_addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleAppleIDSignedInNotification" name:@"com.apple.sharingd.AppleAccountSignIn" object:0];
  [v3 addObserver:self selector:"handleAppleIDSignedOutNotification" name:@"com.apple.sharingd.AppleAccountSignOut" object:0];
  [v3 addObserver:self selector:"handleAppleIDChangedNotification" name:@"com.apple.sharingd.AppleIDChanged" object:0];
  [v3 addObserver:self selector:"handleUILockStatusChangedNotification" name:@"com.apple.sharingd.UILockStatusChanged" object:0];
  [v3 addObserver:self selector:"handleKeyBagFirstUnlockNotification" name:@"com.apple.sharingd.KeyBagFirstUnlock" object:0];
}

- (void)_invalidate
{
  [(SDAppleIDAgent *)self _removeObservers];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = self->_findPersonRequests;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) invalidate:v16];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_findPersonRequests removeAllObjects];
  identityRequest = self->_identityRequest;
  if (identityRequest)
  {
    [(SDAppleIDIdentityRequest *)identityRequest invalidate];
    v9 = self->_identityRequest;
    self->_identityRequest = 0;
  }
  infoRequest = self->_infoRequest;
  if (infoRequest)
  {
    [(SDAppleIDServerTask *)infoRequest invalidate];
    objc_super v11 = self->_infoRequest;
    self->_infoRequest = 0;
  }
  testIdentityRequest = self->_testIdentityRequest;
  if (testIdentityRequest)
  {
    [(SDAppleIDIdentityRequest *)testIdentityRequest invalidate];
    v13 = self->_testIdentityRequest;
    self->_testIdentityRequest = 0;

    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  [(SDAppleIDAgent *)self _ensurePushStopped];
  [(SDAppleIDAgent *)self _ensurePeriodicVerifyTimerStopped];
  [(SDAppleIDAgent *)self _ensureThrottledRetryTimerStopped];
  task = self->_task;
  if (task)
  {
    [(SDAppleIDServerTask *)task invalidate];
    v15 = self->_task;
    self->_task = 0;

    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_cleanUpAccount:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (v4)
  {
    id v5 = [v4 certificateToken];

    if (v5)
    {
      uint64_t v6 = [v13 certificateTokenCreationDate];
      id v5 = [v6 dateByAddingTimeInterval:259200.0];

      uint64_t v7 = [v13 certificateTokenCreationDate];
      if (!v7
        || (v8 = (void *)v7,
            +[NSDate date],
            v9 = objc_claimAutoreleasedReturnValue(),
            id v10 = [v9 compare:v5],
            v9,
            v8,
            v10 == (id)1))
      {
        if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [v13 setCertificateToken:0];
        [v13 setPrivateKeyPersistentReference:0];
        dbManager = self->_dbManager;
        id v12 = [v13 appleID];
        [(SDAppleIDDatabaseManager *)dbManager setCertificateToken:0 privateKeyPersistentReference:0 forAppleID:v12];
      }
    }
  }
  else
  {
    id v5 = 0;
  }
}

- (void)_clearAccount
{
  identityRequest = self->_identityRequest;
  if (identityRequest)
  {
    [(SDAppleIDIdentityRequest *)identityRequest invalidate];
    id v4 = self->_identityRequest;
    self->_identityRequest = 0;
  }
  infoRequest = self->_infoRequest;
  if (infoRequest)
  {
    [(SDAppleIDServerTask *)infoRequest invalidate];
    uint64_t v6 = self->_infoRequest;
    self->_infoRequest = 0;
  }
  [(SDAppleIDDatabaseManager *)self->_dbManager removeAppleID:self->_appleID];
  [(SDAppleIDDatabaseManager *)self->_dbManager clearPersonInfoCache];
  [(SDAppleIDAgent *)self _ensureThrottledRetryTimerStopped];

  sub_10017E46C();
}

- (__SecIdentity)_copyIdentityForAppleID:(id)a3
{
  id v3 = [(SDAppleIDDatabaseManager *)self->_dbManager identityForAppleID:a3];
  id v4 = (__SecIdentity *)[v3 copyIdentity];

  return v4;
}

- (void)_ensurePushStarted
{
  if (!self->_pushConnection)
  {
    if (self->_agentEnabled)
    {
      unsigned int v3 = [(NSString *)self->_pushEnvironment isEqualToString:@"production"];
      id v4 = &off_100968E88;
      if (!v3) {
        id v4 = &off_100968E90;
      }
      id v5 = (*v4)();
      uint64_t v6 = (APSConnection *)[objc_alloc(off_100968E98()) initWithEnvironmentName:v5 namedDelegatePort:@"com.apple.coreservices.appleid.aps" queue:self->_dispatchQueue];
      pushConnection = self->_pushConnection;
      self->_pushConnection = v6;

      [(APSConnection *)self->_pushConnection setDelegate:self];
      v8 = self->_pushConnection;
      CFStringRef v10 = @"com.apple.idmsauthagent";
      v9 = +[NSArray arrayWithObjects:&v10 count:1];
      [(APSConnection *)v8 setEnabledTopics:v9];

      [(APSConnection *)self->_pushConnection requestTokenForTopic:@"com.apple.idmsauthagent" identifier:0];
      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (id)_detailedDescription
{
  NSAppendPrintF();
  id v128 = 0;
  NSAppendPrintF();
  id v3 = v128;

  NSAppendPrintF();
  id v4 = v3;

  pushEnvironment = self->_pushEnvironment;
  NSAppendPrintF();
  id v5 = v4;

  if ([(SDAppleIDAgent *)self eduModeEnabled]) {
    uint64_t v6 = "yes";
  }
  else {
    uint64_t v6 = "no";
  }
  v91 = v6;
  NSAppendPrintF();
  id v7 = v5;

  if (self->_agentEnabled)
  {
    v8 = -[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", self->_appleID, v91);
    v9 = [v8 identity];
    appleID = self->_appleID;
    NSAppendPrintF();
    id v10 = v7;

    objc_super v11 = objc_msgSend(v8, "contactInfo:", appleID);
    v93 = [v11 firstName];
    NSAppendPrintF();
    id v12 = v10;

    id v13 = [v8 contactInfo:v93];
    v94 = [v13 lastName];
    NSAppendPrintF();
    id v14 = v12;

    v95 = [v8 altDSID];
    NSAppendPrintF();
    id v15 = v14;

    long long v16 = [v8 validationRecord:v95];
    long long v17 = [v16 data];
    if (v17) {
      long long v18 = "yes";
    }
    else {
      long long v18 = "no";
    }
    v96 = v18;
    NSAppendPrintF();
    id v19 = v15;

    v20 = [v8 validationRecord:v96];
    v97 = [v20 altDSID];
    NSAppendPrintF();
    id v21 = v19;

    v22 = [v8 validationRecord:v97];
    v98 = [v22 validStartDate];
    NSAppendPrintF();
    id v23 = v21;

    v24 = [v8 validationRecord:v98];
    id v99 = [v24 suggestedValidDuration];
    NSAppendPrintF();
    id v25 = v23;

    v26 = [v8 validationRecord:v99];
    v100 = [v26 nextCheckDate];
    NSAppendPrintF();
    id v27 = v25;

    v28 = [v8 validationRecord:v100];
    if ([v28 needsUpdate]) {
      v29 = "yes";
    }
    else {
      v29 = "no";
    }
    v101 = v29;
    NSAppendPrintF();
    id v30 = v27;

    v31 = [v8 validationRecord:v101];
    if ([v31 isInvalid]) {
      v32 = "yes";
    }
    else {
      v32 = "no";
    }
    v102 = v32;
    NSAppendPrintF();
    id v33 = v30;

    v34 = [v8 contactInfo:v102];
    v35 = [v34 validatedEmailAddresses];
    v103 = [v35 componentsJoinedByString:@", "];
    NSAppendPrintF();
    id v36 = v33;

    v37 = [v8 validationRecord:v103];
    v38 = [v37 validatedEmailHashes];
    v104 = SFShortHashArrayDescription();
    NSAppendPrintF();
    id v39 = v36;

    v40 = [v8 contactInfo:v104];
    v41 = [v40 validatedPhoneNumbers];
    v105 = [v41 componentsJoinedByString:@", "];
    NSAppendPrintF();
    id v42 = v39;

    v43 = [v8 validationRecord:v105];
    v44 = [v43 validatedPhoneHashes];
    v106 = SFShortHashArrayDescription();
    NSAppendPrintF();
    id v45 = v42;

    v46 = [v8 privateKeyPersistentReference:v106];
    v47 = "yes";
    if (!v46) {
      v47 = "no";
    }
    v107 = v47;
    NSAppendPrintF();
    id v48 = v45;

    v49 = [v9 privateKeyPersistentReference:v107];
    if (v49) {
      v50 = "yes";
    }
    else {
      v50 = "no";
    }
    v108 = v50;
    NSAppendPrintF();
    id v51 = v48;

    v52 = [v9 certificatePersistentReference:v108];
    if (v52) {
      v53 = "yes";
    }
    else {
      v53 = "no";
    }
    v109 = v53;
    NSAppendPrintF();
    id v54 = v51;

    v110 = [v9 accountIdentifier:v109];
    NSAppendPrintF();
    id v55 = v54;

    v111 = [v9 certificateExpirationDate:v110];
    NSAppendPrintF();
    id v56 = v55;

    v112 = [v9 serialNumber:v111];
    NSAppendPrintF();
    id v57 = v56;

    v113 = [v8 certificateToken:v112];
    NSAppendPrintF();
    id v58 = v57;

    v59 = [v8 validationRecord:v113];

    if (v59 && v9)
    {
      v60 = [v8 validationRecord];
      v61 = [v60 altDSID];

      if (v61)
      {
        id v42 = [v9 accountIdentifier];
        if ([v42 hasSuffix:v61]) {
          v62 = "yes";
        }
        else {
          v62 = "no";
        }
        v114 = v62;
        NSAppendPrintF();
        id v63 = v58;

        id v58 = v42;
      }
      else
      {
        NSAppendPrintF();
        id v63 = v58;
      }

      id v58 = v63;
    }
    v64 = [v9 intermediateCertificatePersistentReference:v114];
    if (v64) {
      v65 = "yes";
    }
    else {
      v65 = "no";
    }
    v115 = v65;
    NSAppendPrintF();
    id v66 = v58;

    v116 = [v9 intermediateCertificateExpirationDate:v115];
    NSAppendPrintF();
    id v67 = v66;

    v117 = [v9 intermediateCertificateSerialNumber:v116];
    NSAppendPrintF();
    id v68 = v67;

    v69 = [v9 certificatePersistentReference:v117];
    if (v69)
    {
      id v42 = [v9 privateKeyPersistentReference];
      if (v42) {
        v70 = "yes";
      }
      else {
        v70 = "no";
      }
    }
    else
    {
      v70 = "no";
    }
    v118 = v70;
    NSAppendPrintF();
    id v71 = v68;

    if (v69) {
    if (objc_msgSend(v9, "isInvalid", v118))
    }
      v72 = "yes";
    else {
      v72 = "no";
    }
    v119 = v72;
    NSAppendPrintF();
    id v73 = v71;

    if (objc_msgSend(v9, "needsRenewal", v119)) {
      v74 = "yes";
    }
    else {
      v74 = "no";
    }
    v120 = v74;
    NSAppendPrintF();
    id v75 = v73;

    v76 = +[SDStatusMonitor sharedMonitor];
    if ([v76 deviceWasUnlockedOnce]) {
      v77 = "yes";
    }
    else {
      v77 = "no";
    }
    v121 = v77;
    NSAppendPrintF();
    id v78 = v75;

    if ([(SDAppleIDAgent *)self _wasOldAgentIdentityQueried]) {
      v79 = "yes";
    }
    else {
      v79 = "no";
    }
    v122 = v79;
    NSAppendPrintF();
    id v80 = v78;

    [(SDAppleIDAgent *)self _metaInfoValueForKey:@"OldAgentIdentityWasUsed", v122];
    uint64_t v81 = CFGetInt64();
    if (v81) {
      v82 = "yes";
    }
    else {
      v82 = "no";
    }
    v123 = (void *)v82;
    NSAppendPrintF();
    id v83 = v80;

    if (v81)
    {
      v123 = [(SDAppleIDAgent *)self _metaInfoValueForKey:@"OldAgentCertificateSN", v123];
      NSAppendPrintF();
      id v84 = v83;

      id v83 = v84;
    }
    v124 = [(SDAppleIDAgent *)self _metaInfoValueForKey:@"LastSignInDate", v123];
    NSAppendPrintF();
    id v85 = v83;

    v125 = [(SDAppleIDAgent *)self _metaInfoValueForKey:@"LastSignOutDate", v124];
    NSAppendPrintF();
    id v86 = v85;

    v126 = [(SDAppleIDAgent *)self _metaInfoValueForKey:@"LastSignOutAppleID", v125];
    NSAppendPrintF();
    id v87 = v86;

    v127 = [(SDAppleIDAgent *)self _metaInfoValueForKey:@"LastAllGoodDate", v126];
    NSAppendPrintF();
    id v88 = v87;

    [(SDAppleIDAgent *)self _accountState];
    NSAppendPrintF();
    id v7 = v88;
  }

  return v7;
}

- (void)_checkIfAppleIDCertificateChainIsValidForIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = 201203;
    id v9 = [v6 copyCertificate];
    id v10 = [v6 copyIntermediateCertificate];
    objc_super v11 = v10;
    if (v9)
    {
      if (v10)
      {
        v23[0] = v9;
        v23[1] = v10;
        id v12 = +[NSArray arrayWithObjects:v23 count:2];
        long long v17 = _NSConcreteStackBlock;
        uint64_t v18 = 3221225472;
        id v19 = sub_10019E1B4;
        v20 = &unk_1008CF360;
        id v21 = self;
        id v22 = v7;
        SFAppleIDVerifyCertificateChain();

LABEL_5:
        CFRelease(v9);
        goto LABEL_6;
      }
      int v8 = 201222;
    }
  }
  else
  {
    id v9 = 0;
    objc_super v11 = 0;
    int v8 = -6705;
  }
  if (v7)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10019E228;
    block[3] = &unk_1008CCCD8;
    id v15 = v7;
    int v16 = v8;
    dispatch_async(dispatchQueue, block);
  }
  if (v9) {
    goto LABEL_5;
  }
LABEL_6:
  if (v11) {
    CFRelease(v11);
  }
}

- (int)_ensureEduModeDevicesAreCleanedUp
{
  if ([(SDAppleIDAgent *)self eduModeEnabled])
  {
    id v3 = self->_appleID;
    if (![(SDAppleIDAgent *)self _keychainCleanupTag])
    {
      id v4 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10019E320;
      block[3] = &unk_1008CBB30;
      uint64_t v9 = 0;
      id v3 = v3;
      id v7 = v3;
      int v8 = self;
      dispatch_async(v4, block);
    }
  }
  else
  {
    id v3 = 0;
  }

  return 0;
}

- (void)_ensurePushStopped
{
  pushConnection = self->_pushConnection;
  if (pushConnection)
  {
    [(APSConnection *)pushConnection shutdown];
    [(APSConnection *)self->_pushConnection setDelegate:0];
    id v4 = self->_pushConnection;
    self->_pushConnection = 0;

    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_ensurePeriodicVerifyTimerStarted
{
  if (!self->_periodicVerifyTimer)
  {
    if (self->_agentEnabled)
    {
      id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      periodicVerifyTimer = self->_periodicVerifyTimer;
      self->_periodicVerifyTimer = v3;

      id v5 = self->_periodicVerifyTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10019E714;
      handler[3] = &unk_1008CA4B8;
      handler[4] = self;
      dispatch_source_set_event_handler(v5, handler);
      SFDispatchTimerSet();
      dispatch_resume((dispatch_object_t)self->_periodicVerifyTimer);
      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_ensurePeriodicVerifyTimerStopped
{
  periodicVerifyTimer = self->_periodicVerifyTimer;
  if (periodicVerifyTimer)
  {
    id v4 = periodicVerifyTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_periodicVerifyTimer;
    self->_periodicVerifyTimer = 0;

    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_ensureThrottledRetryTimerStartedWithSuggestedDelay:(unint64_t)a3
{
  if (self->_throttledRetryTimer)
  {
    if (dword_100968E10 > 30 || dword_100968E10 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_26;
    }
LABEL_22:
    LogPrintF();
LABEL_26:
    id v6 = 0;
    id v4 = 0;
    goto LABEL_16;
  }
  if (!self->_agentEnabled)
  {
    if (dword_100968E10 > 30 || dword_100968E10 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  if (a3)
  {
    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = 0;
    id v4 = 0;
  }
  else
  {
    sub_10017E508();
    id v4 = +[NSDate date];
    id v5 = sub_10017E690();
    id v6 = v5;
    if (!v4 || !v5) {
      goto LABEL_16;
    }
    [v5 timeIntervalSinceDate:v4];
  }
  id v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  throttledRetryTimer = self->_throttledRetryTimer;
  self->_throttledRetryTimer = v7;

  uint64_t v9 = self->_throttledRetryTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10019EAD0;
  handler[3] = &unk_1008CA4B8;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  SFDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_throttledRetryTimer);
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_16:
}

- (void)_ensureThrottledRetryTimerStopped
{
  throttledRetryTimer = self->_throttledRetryTimer;
  if (throttledRetryTimer)
  {
    id v4 = throttledRetryTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_throttledRetryTimer;
    self->_throttledRetryTimer = 0;

    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_handleAccountIdentifierValidationRecordMismatch
{
  if (self->_appleID)
  {
    [(SDAppleIDAgent *)self _setCurrentAppleIDIdentity:0];
    [(SDAppleIDAgent *)self _setCurrentAppleIDContactInfo:0 validationRecord:0];
    [(SDAppleIDAgent *)self _verifyStateWithDelay:30.0];
  }
  else if (dword_100968E10 <= 90 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_handleAppleIDChangedNotification
{
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(SDAppleIDAgent *)self _verifyStateWithDelay:15.0];
}

- (void)_handleAppleIDSignedInNotification
{
  if (self->_agentEnabled)
  {
    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = +[NSDate date];
    [(SDAppleIDAgent *)self _setMetaInfoValue:v3 forKey:@"LastSignInDate"];

    [(SDAppleIDAgent *)self _updateAppleID];
    sub_10017E46C();
    [(SDAppleIDAgent *)self _verifyStateWithDelay:15.0];
  }
}

- (void)_handleAppleIDSignedOutNotification
{
  if (self->_agentEnabled)
  {
    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = +[NSDate date];
    [(SDAppleIDAgent *)self _setMetaInfoValue:v3 forKey:@"LastSignOutDate"];

    [(SDAppleIDAgent *)self _setMetaInfoValue:self->_appleID forKey:@"LastSignOutAppleID"];
    [(SDAppleIDAgent *)self _clearAccount];
    appleID = self->_appleID;
    self->_appleID = 0;

    [(SDAppleIDAgent *)self _verifyState];
  }
}

- (void)_handleCertificateStatusUpdate:(int64_t)a3 forAppleID:(id)a4
{
  id v12 = a4;
  if (([v12 isEqualToString:self->_appleID] & 1) == 0)
  {
    if (dword_100968E10 > 60 || dword_100968E10 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_36;
    }
LABEL_32:
    LogPrintF();
LABEL_36:
    id v7 = 0;
    goto LABEL_20;
  }
  uint64_t v6 = [(SDAppleIDDatabaseManager *)self->_dbManager accountForAppleID:v12];
  if (!v6)
  {
    if (dword_100968E10 > 60 || dword_100968E10 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_36;
    }
    goto LABEL_32;
  }
  id v7 = (void *)v6;
  switch(a3)
  {
    case 0:
      int v8 = +[AKURLBag sharedBag];
      [v8 IDMSEnvironment];
      uint64_t v9 = [v7 altDSID];
      SFMetricsLogUnexpectedEvent();

      goto LABEL_5;
    case 1:
      break;
    case 2:
      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        goto LABEL_26;
      }
      break;
    case 3:
    case 4:
    case 5:
LABEL_5:
      if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
      {
        if ((unint64_t)a3 > 5) {
          CFStringRef v10 = @"?";
        }
        else {
          CFStringRef v10 = *(&off_1008CF658 + a3);
        }
        CFStringRef v11 = v10;
        LogPrintF();
      }
      -[SDAppleIDAgent _setCurrentAppleIDIdentity:](self, "_setCurrentAppleIDIdentity:", 0, v11);
      break;
    default:
      if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
LABEL_26:
      }
        LogPrintF();
      break;
  }
LABEL_20:
}

- (void)_handleFindPersonResponse:(id)a3 forRequest:(id)a4 emailOrPhone:(id)a5 withError:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)a7);
  v37 = (void (**)(void, void, void))v16;
  if (!v16)
  {
    id v18 = 0;
    int v19 = 0;
    id v20 = 0;
    id v21 = 0;
LABEL_26:
    id v22 = 0;
    goto LABEL_12;
  }
  if (v15)
  {
    id v20 = v15;
    id v18 = 0;
    int v19 = 0;
    id v21 = 0;
    id v16 = 0;
    goto LABEL_26;
  }
  id v18 = 0;
  int v19 = -6762;
  id v20 = 0;
  id v21 = 0;
  id v16 = 0;
  id v22 = 0;
  if (v13 && v14)
  {
    id v22 = +[NSMutableDictionary dictionaryWithDictionary:v13];
    CFStringGetTypeID();
    id v21 = CFDictionaryGetTypedValue();
    id v43 = v14;
    id v23 = +[NSArray arrayWithObjects:&v43 count:1];
    id v40 = 0;
    int v19 = sub_1002303CC(v23, 1, &v40);
    id v18 = v40;

    if (v19)
    {
      id v20 = 0;
      id v16 = 0;
      goto LABEL_12;
    }
    if (!v18 || [v18 count] != (id)1)
    {
      id v20 = 0;
      id v16 = 0;
LABEL_32:
      int v19 = -6762;
      goto LABEL_12;
    }
    v24 = [v18 firstObject];
    unsigned __int8 v25 = [v21 isEqualToString:v24];

    if (v25)
    {
      [v22 setObject:v14 forKeyedSubscript:@"MatchedValue"];
      id v16 = [objc_alloc((Class)SFAppleIDPersonInfo) initWithDictionary:v22];
      if (v16)
      {
        [(SDAppleIDDatabaseManager *)self->_dbManager addPersonInfoToCache:v16];
        int v19 = 0;
        id v20 = 0;
        goto LABEL_12;
      }
      id v20 = 0;
      goto LABEL_32;
    }
    if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v20 = 0;
    id v16 = 0;
    int v19 = -6712;
  }
LABEL_12:
  id v36 = v21;
  [v17 invalidate];
  [(NSMutableArray *)self->_findPersonRequests removeObject:v17];

  if (v19)
  {
    id v39 = v15;
    id v35 = v13;
    v26 = v22;
    uint64_t v27 = v19;
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    id v28 = v14;
    uint64_t v29 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v30 = (void *)v29;
    CFStringRef v31 = @"?";
    if (v29) {
      CFStringRef v31 = (const __CFString *)v29;
    }
    CFStringRef v42 = v31;
    v32 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    uint64_t v33 = v27;
    id v22 = v26;
    uint64_t v34 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v33 userInfo:v32];

    id v14 = v28;
    id v20 = (id)v34;
    id v13 = v35;
    id v15 = v39;
  }
  if (v20 && dword_100968E10 <= 90 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v37) {
    ((void (**)(void, id, id))v37)[2](v37, v16, v20);
  }
}

- (void)_handleInfoResponse:(id)a3 forAppleID:(id)a4 infoRequest:(id)a5 certificateSerialNumber:(id)a6 withError:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = (SDAppleIDServerTask *)a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v55 = v16;
  if (!v15)
  {
    NSErrorDomain v38 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
    uint64_t v39 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v40 = (void *)v39;
    CFStringRef v41 = @"?";
    if (v39) {
      CFStringRef v41 = (const __CFString *)v39;
    }
    CFStringRef v67 = v41;
    CFStringRef v42 = &v67;
    id v43 = &v66;
    goto LABEL_46;
  }
  if (v18)
  {
    id v28 = v18;
LABEL_47:
    id v20 = 0;
    goto LABEL_35;
  }
  if (!v14)
  {
    NSErrorDomain v38 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
    uint64_t v44 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v40 = (void *)v44;
    CFStringRef v45 = @"?";
    if (v44) {
      CFStringRef v45 = (const __CFString *)v44;
    }
    CFStringRef v65 = v45;
    CFStringRef v42 = &v65;
    id v43 = &v64;
LABEL_46:
    v46 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v43 count:1];
    id v28 = +[NSError errorWithDomain:v38 code:-6705 userInfo:v46];

    goto LABEL_47;
  }
  if (self->_infoRequest != v16)
  {
    if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v20 = 0;
    id v23 = 0;
    id v28 = 0;
    goto LABEL_36;
  }
  if (!v17 || ([v17 isEqualToString:&stru_1008E7020] & 1) != 0)
  {
    id v20 = 0;
LABEL_8:
    uint64_t v21 = 0;
    goto LABEL_9;
  }
  CFStringGetTypeID();
  id v30 = CFDictionaryGetTypedValue();
  id v20 = v30;
  if (v30 && ([v30 isEqualToString:v17] & 1) == 0)
  {
    if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      v52 = v20;
      id v53 = v17;
      LogPrintF();
    }
    NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
    uint64_t v32 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v33 = (void *)v32;
    CFStringRef v34 = @"?";
    if (v32) {
      CFStringRef v34 = (const __CFString *)v32;
    }
    CFStringRef v63 = v34;
    id v35 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1, v52, v53);
    NSErrorDomain v36 = NSOSStatusErrorDomain;
    uint64_t v37 = 201207;
    goto LABEL_34;
  }
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  if (!(Int64Ranged << 32))
  {
    if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_8;
  }
  uint64_t v21 = (int)Int64Ranged;
LABEL_9:
  [(SDAppleIDAgent *)self _handleCertificateStatusUpdate:v21 forAppleID:v15];
  id v22 = [objc_alloc((Class)SFAppleIDContactInfo) initWithDictionary:v14];
  if (!v22)
  {
    NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
    uint64_t v47 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v33 = (void *)v47;
    CFStringRef v48 = @"?";
    if (v47) {
      CFStringRef v48 = (const __CFString *)v47;
    }
    CFStringRef v61 = v48;
    id v35 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    NSErrorDomain v36 = NSOSStatusErrorDomain;
    uint64_t v37 = -6762;
LABEL_34:
    id v28 = +[NSError errorWithDomain:v36 code:v37 userInfo:v35];

LABEL_35:
    id v23 = 0;
    goto LABEL_36;
  }
  id v23 = v22;
  id v24 = [objc_alloc((Class)SFAppleIDValidationRecord) initWithDictionary:v14];
  if (v24)
  {
    unsigned __int8 v25 = v24;
    v26 = [v24 data];
    id v56 = v15;
    id v27 = v25;
    id v23 = v23;
    id v57 = v19;
    SFAppleIDParseValidationRecordData();

    id v28 = 0;
    goto LABEL_12;
  }
  NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
  uint64_t v49 = +[NSString stringWithUTF8String:DebugGetErrorString()];
  id v54 = (void *)v49;
  CFStringRef v50 = @"?";
  if (v49) {
    CFStringRef v50 = (const __CFString *)v49;
  }
  CFStringRef v59 = v50;
  id v51 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  id v28 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6762 userInfo:v51];

LABEL_36:
  id v27 = 0;
LABEL_12:
  [(SDAppleIDServerTask *)self->_infoRequest invalidate];
  infoRequest = self->_infoRequest;
  self->_infoRequest = 0;

  if (v28)
  {
    if (dword_100968E10 <= 90 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v19) {
      (*((void (**)(id, id))v19 + 2))(v19, v28);
    }
  }
}

- (void)_handleKeyBagFirstUnlockNotification
{
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(SDAppleIDAgent *)self _handleUILockStatusChange];
}

- (void)_handleKeyVerificationFailure
{
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDAppleIDAgent *)self _setCurrentAppleIDIdentity:0];
  [(SDAppleIDAgent *)self _setCurrentAppleIDContactInfo:0 validationRecord:0];

  [(SDAppleIDAgent *)self _verifyStateWithDelay:30.0];
}

- (void)_handleServerTaskCompletionWithError:(id)a3
{
  id v10 = a3;
  id v4 = +[NSDate date];
  [(SDAppleIDDatabaseManager *)self->_dbManager setLastConnectionDate:v4];
  id v5 = v10;
  if (v10)
  {
    if (dword_100968E10 <= 60)
    {
      if (dword_100968E10 != -1 || (v6 = _LogCategory_Initialize(), id v5 = v10, v6))
      {
        id v9 = v5;
        LogPrintF();
      }
    }
    if (NSErrorToOSStatus() != -6723
      && NSErrorToOSStatus() != 201224
      && NSErrorToOSStatus() != 201225
      && NSErrorToOSStatus() != 201226
      && NSErrorToOSStatus() != 201229)
    {
      if (NSErrorToOSStatus() == 201215) {
        sub_10022EC58(self->_appleID);
      }
      id v7 = [v10 userInfo:v9];
      uint64_t Int64 = CFDictionaryGetInt64();

      [(SDAppleIDAgent *)self _ensureThrottledRetryTimerStartedWithSuggestedDelay:Int64];
    }
  }
  else
  {
    [(SDAppleIDDatabaseManager *)self->_dbManager setLastSuccessfulConnectionDate:v4];
    sub_10017E46C();
    [(SDAppleIDAgent *)self _verifyState];
  }
}

- (void)_handleUILockStatusChangedNotification
{
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(SDAppleIDAgent *)self _handleUILockStatusChange];
}

- (void)_handleUILockStatusChange
{
  if (self->_agentEnabled)
  {
    id v3 = +[SDStatusMonitor sharedMonitor];
    unsigned int v4 = [v3 deviceWasUnlockedOnce];

    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v4)
    {
      if (self->_throttledRetryTimer)
      {
        if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        [(SDAppleIDAgent *)self _verifyState];
      }
    }
  }
}

- (void)_handleUntrustedAppleIDCertificateChainForIdentity:(id)a3
{
  id v9 = a3;
  unsigned int v4 = [(SDAppleIDDatabaseManager *)self->_dbManager accountForAppleID:self->_appleID];
  id v5 = v4;
  if (!v4)
  {
    if (dword_100968E10 > 30 || dword_100968E10 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_5;
    }
LABEL_13:
    LogPrintF();
    goto LABEL_5;
  }
  int v6 = [v4 identity];

  if (!v6)
  {
    if (dword_100968E10 > 30 || dword_100968E10 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  id v7 = [v5 identity];
  unsigned int v8 = [v7 isEqual:v9];

  if (v8)
  {
    [(SDAppleIDAgent *)self _setCurrentAppleIDIdentity:0];
    [(SDAppleIDAgent *)self _verifyState];
  }
LABEL_5:
}

- (void)_handleReceivedCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8 && v10 && v9)
  {
    [(SDAppleIDDatabaseManager *)self->_dbManager setCertificateToken:v10 privateKeyPersistentReference:v8 forAppleID:v9];
    sub_10017E46C();
  }
}

- (void)_handleReceivedIdentity:(id)a3 forAppleID:(id)a4 identityRequest:(id)a5 withError:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (SDAppleIDIdentityRequest *)a5;
  id v15 = a6;
  id v16 = (void (**)(id, id))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v15)
  {
    id v17 = v15;
    goto LABEL_7;
  }
  if (!v12)
  {
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    uint64_t v19 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v20 = (void *)v19;
    CFStringRef v21 = @"?";
    if (v19) {
      CFStringRef v21 = (const __CFString *)v19;
    }
    CFStringRef v30 = v21;
    id v22 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    NSErrorDomain v23 = NSOSStatusErrorDomain;
    uint64_t v24 = -6705;
    goto LABEL_17;
  }
  if (([v13 isEqualToString:self->_appleID] & 1) == 0)
  {
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    uint64_t v25 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v20 = (void *)v25;
    CFStringRef v26 = @"?";
    if (v25) {
      CFStringRef v26 = (const __CFString *)v25;
    }
    CFStringRef v28 = v26;
    id v22 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    NSErrorDomain v23 = NSOSStatusErrorDomain;
    uint64_t v24 = -6709;
LABEL_17:
    id v17 = +[NSError errorWithDomain:v23 code:v24 userInfo:v22];

    goto LABEL_7;
  }
  if (self->_identityRequest == v14)
  {
    [(SDAppleIDDatabaseManager *)self->_dbManager setCertificateToken:0 privateKeyPersistentReference:0 forAppleID:v13];
    [(SDAppleIDAgent *)self _setCurrentAppleIDIdentity:v12];
  }
  else if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v17 = 0;
LABEL_7:
  [(SDAppleIDIdentityRequest *)self->_identityRequest invalidate];
  identityRequest = self->_identityRequest;
  self->_identityRequest = 0;

  if (v16) {
    v16[2](v16, v17);
  }
}

- (void)_handlePeriodicVerifyTimerFired
{
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_throttledRetryTimer)
  {
    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    [(SDAppleIDAgent *)self _verifyState];
  }
}

- (void)_handleThrottledRetryTimerFired
{
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDAppleIDAgent *)self _ensureThrottledRetryTimerStopped];

  [(SDAppleIDAgent *)self _verifyState];
}

- (unint64_t)_keychainCleanupTag
{
  [(SDAppleIDAgent *)self _metaInfoValueForKey:@"KeychainCleanupTag"];

  return CFGetInt64();
}

- (id)_metaInfoValueForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_agentMetaInfo objectForKeyedSubscript:a3];
}

- (int)_performKeyVerificationForIdentity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SDAppleIDAgent *)self _metaInfoValueForKey:@"LastKeyVerificationDate"];
    int v6 = +[NSDate date];
    id v7 = v6;
    if (v5 && ([v6 timeIntervalSinceDate:v5], v8 <= 86400.0))
    {
      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      LODWORD(v9) = 0;
    }
    else
    {
      mach_absolute_time();
      id v9 = [v4 verifyKeys];
      mach_absolute_time();
      if (v9)
      {
        if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
        {
          id v15 = v9;
          LogPrintF();
        }
        id v10 = [v4 altDSID:v15];
        SFMetricsLogUnexpectedEvent();
      }
      v17[0] = &off_100902D48;
      v16[0] = @"operation";
      v16[1] = @"durationMs";
      CFStringRef v11 = +[NSNumber numberWithUnsignedLongLong:UpTicksToMilliseconds()];
      v17[1] = v11;
      v16[2] = @"success";
      id v12 = +[NSNumber numberWithInt:v9 == 0];
      v17[2] = v12;
      id v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
      SFMetricsLog();

      [(SDAppleIDAgent *)self _setMetaInfoValue:v7 forKey:@"LastKeyVerificationDate"];
    }
  }
  else
  {
    if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    LODWORD(v9) = 0;
    id v5 = 0;
    id v7 = 0;
  }

  return (int)v9;
}

- (int)_performKeychainCount
{
  id v3 = [(SDAppleIDAgent *)self _metaInfoValueForKey:@"LastKeychainCountDate"];
  id v4 = +[NSDate date];
  id v5 = v4;
  if (v3)
  {
    [v4 timeIntervalSinceDate:v3];
    if (v6 <= 259200.0)
    {
LABEL_14:
      int v7 = 0;
      goto LABEL_15;
    }
  }
  mach_absolute_time();
  int v7 = SFAppleIDCertificateAndKeyCounts();
  mach_absolute_time();
  if (!v7)
  {
    v17[0] = @"certCount";
    double v8 = +[NSNumber numberWithUnsignedInteger:0];
    v18[0] = v8;
    v17[1] = @"privKeyCount";
    id v9 = +[NSNumber numberWithUnsignedInteger:0];
    v18[1] = v9;
    v17[2] = @"pubKeyCount";
    id v10 = +[NSNumber numberWithUnsignedInteger:0];
    v18[2] = v10;
    void v17[3] = @"latencyMs";
    CFStringRef v11 = +[NSNumber numberWithInt:UpTicksToMilliseconds()];
    v18[3] = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
    SFMetricsLog();

    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [(SDAppleIDAgent *)self _setMetaInfoValue:v5, @"LastKeychainCountDate", 0, 0, 0 forKey];
    }
    else
    {
      [(SDAppleIDAgent *)self _setMetaInfoValue:v5, @"LastKeychainCountDate", v14, v15, v16 forKey];
    }
    goto LABEL_14;
  }
  if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_15:

  return v7;
}

- (void)_performOtherTaskWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 objectForKeyedSubscript:@"requestType"];
  if (![v8 isEqualToString:@"createAndFetchCert"])
  {
    if ([v8 isEqualToString:@"triggerPush"])
    {
      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001A18DC;
      block[3] = &unk_1008CAD20;
      void block[4] = self;
      id v37 = v7;
      dispatch_async(dispatchQueue, block);
      id v18 = v37;
    }
    else if ([v8 isEqualToString:@"triggerVerify"])
    {
      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SDAppleIDAgent *)self _handlePeriodicVerifyTimerFired];
      if (!v7) {
        goto LABEL_35;
      }
      uint64_t v19 = self->_dispatchQueue;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1001A1944;
      v34[3] = &unk_1008CCFF0;
      id v35 = v7;
      dispatch_async(v19, v34);
      id v18 = v35;
    }
    else
    {
      if (![v8 isEqualToString:@"removeAppleID"])
      {
        if ([v8 isEqualToString:@"setMetaInfo"])
        {
          if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          uint64_t v21 = [v6 objectForKeyedSubscript:@"key"];
          if (v21)
          {
            uint64_t v16 = (void *)v21;
            uint64_t v15 = [v6 objectForKeyedSubscript:@"value"];
            id v22 = +[NSNull null];
            unsigned int v23 = [v15 isEqual:v22];

            if (v23)
            {

              uint64_t v15 = 0;
            }
            [(SDAppleIDAgent *)self _setMetaInfoValue:v15 forKey:v16];
            if (v7)
            {
              uint64_t v24 = self->_dispatchQueue;
              v30[0] = _NSConcreteStackBlock;
              v30[1] = 3221225472;
              v30[2] = sub_1001A197C;
              v30[3] = &unk_1008CCFF0;
              id v31 = v7;
              dispatch_async(v24, v30);
            }
            goto LABEL_36;
          }
        }
        else if (dword_100968E10 <= 90 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        id v9 = 0;
LABEL_46:
        int v25 = -6705;
        if (!v7)
        {
LABEL_48:
          uint64_t v15 = 0;
          uint64_t v16 = 0;
          uint64_t v14 = 0;
          goto LABEL_37;
        }
LABEL_47:
        CFStringRef v26 = self->_dispatchQueue;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1001A1998;
        v27[3] = &unk_1008CCCD8;
        id v28 = v7;
        int v29 = v25;
        dispatch_async(v26, v27);

        goto LABEL_48;
      }
      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(SDAppleIDAgent *)self _clearAccount];
      if (!v7)
      {
LABEL_35:
        uint64_t v15 = 0;
        uint64_t v16 = 0;
LABEL_36:
        uint64_t v14 = 0;
        id v9 = 0;
        goto LABEL_37;
      }
      id v20 = self->_dispatchQueue;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1001A1960;
      v32[3] = &unk_1008CCFF0;
      id v33 = v7;
      dispatch_async(v20, v32);
      id v18 = v33;
    }

    goto LABEL_35;
  }
  id v9 = [v6 objectForKeyedSubscript:@"appleID"];
  if (!v9) {
    goto LABEL_46;
  }
  p_testIdentityRequest = &self->_testIdentityRequest;
  testIdentityRequest = self->_testIdentityRequest;
  if (testIdentityRequest)
  {
    [(SDAppleIDIdentityRequest *)testIdentityRequest invalidate];
    id v12 = *p_testIdentityRequest;
    *p_testIdentityRequest = 0;
  }
  id v13 = [[SDAppleIDIdentityRequest alloc] initWithAppleID:v9];
  if (!v13)
  {
    int v25 = -6728;
    if (!v7) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  uint64_t v14 = v13;
  [(SDAppleIDIdentityRequest *)v13 setDispatchQueue:self->_dispatchQueue];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1001A1840;
  v38[3] = &unk_1008CF3B0;
  v38[4] = self;
  id v39 = v7;
  [(SDAppleIDIdentityRequest *)v14 setResponseHandler:v38];
  objc_storeStrong((id *)&self->_testIdentityRequest, v14);
  [(SDAppleIDIdentityRequest *)self->_testIdentityRequest activate];

  uint64_t v15 = 0;
  uint64_t v16 = 0;
LABEL_37:
}

- (void)_performServerTaskWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v44 = a4;
  uint64_t v61 = 0;
  NSErrorUserInfoKey v62 = &v61;
  uint64_t v63 = 0x2020000000;
  int v64 = 0;
  uint64_t v57 = 0;
  NSErrorUserInfoKey v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v53 = 0;
  id v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  CFStringRef v42 = v6;
  id v43 = [v6 objectForKeyedSubscript:@"requestType"];
  if ([v43 isEqualToString:@"createCert"])
  {
    id v7 = [v6 objectForKeyedSubscript:@"appleID"];
    if (v7)
    {
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      if (v8)
      {
        dispatch_semaphore_t v9 = v8;
        id v10 = dispatch_get_global_queue(0, 0);
        v52[2] = _NSConcreteStackBlock;
        v52[3] = (id)3221225472;
        v52[4] = sub_1001A2468;
        v52[5] = &unk_1008CF3D8;
        v52[7] = &v61;
        v52[8] = &v57;
        v52[9] = &v53;
        CFStringRef v11 = v9;
        v52[6] = v11;
        SFAppleIDCreateKeyPair();

        dispatch_time_t v12 = dispatch_time(0, 15000000000);
        if (dispatch_semaphore_wait(v11, v12))
        {
          if (dword_100968E10 <= 50 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_6;
        }
        id v13 = v62;
        if (*((_DWORD *)v62 + 6))
        {
LABEL_6:
          id v39 = 0;
          id v40 = 0;
          id v37 = 0;
          NSErrorDomain v38 = 0;
          id v14 = 0;
          uint64_t v15 = 0;
          CFStringRef v41 = 0;
          uint64_t v16 = 0;
LABEL_24:
          id v20 = 0;
          id v18 = 0;
          goto LABEL_36;
        }
        if (v54[3] && v58[3])
        {
          v52[1] = 0;
          int v24 = SFAppleIDCreateCertificateRequestPEMStringForKeyPair();
          id v25 = 0;
          uint64_t v16 = v25;
          id v13 = v62;
          *((_DWORD *)v62 + 6) = v24;
          if (v24)
          {
            id v39 = 0;
            id v40 = 0;
            id v37 = 0;
            NSErrorDomain v38 = 0;
            id v14 = 0;
            uint64_t v15 = 0;
            CFStringRef v41 = 0;
            goto LABEL_24;
          }
          if (v25)
          {
            CFStringRef v69 = @"csr";
            id v70 = v25;
            id v14 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
            id v39 = 0;
            id v40 = 0;
            id v37 = 0;
            NSErrorDomain v38 = 0;
            uint64_t v19 = 0;
            uint64_t v15 = 0;
            CFStringRef v41 = 0;
            id v20 = 0;
LABEL_32:
            id v18 = 0;
            goto LABEL_33;
          }
          id v39 = 0;
          id v40 = 0;
          id v37 = 0;
          NSErrorDomain v38 = 0;
          id v14 = 0;
          uint64_t v15 = 0;
          CFStringRef v41 = 0;
        }
        else
        {
          id v39 = 0;
          id v40 = 0;
          id v37 = 0;
          NSErrorDomain v38 = 0;
          id v14 = 0;
          uint64_t v15 = 0;
          CFStringRef v41 = 0;
          uint64_t v16 = 0;
        }
        id v20 = 0;
        id v18 = 0;
        goto LABEL_64;
      }
      id v39 = 0;
      id v40 = 0;
      id v37 = 0;
      NSErrorDomain v38 = 0;
      id v14 = 0;
      CFStringRef v11 = 0;
      uint64_t v15 = 0;
      CFStringRef v41 = 0;
      uint64_t v16 = 0;
      id v20 = 0;
      id v18 = 0;
      id v13 = v62;
      int v36 = -6728;
LABEL_53:
      *((_DWORD *)v13 + 6) = v36;
      goto LABEL_36;
    }
    goto LABEL_57;
  }
  if (![v43 isEqualToString:@"fetchCert"])
  {
    if ([v43 isEqualToString:@"getMyInfo"])
    {
      id v7 = [v6 objectForKeyedSubscript:@"appleID"];
      if (v7)
      {
        id v20 = [v6 objectForKeyedSubscript:@"certificateSN"];
        uint64_t v21 = [v6 objectForKeyedSubscript:@"vrid"];
        uint64_t v15 = (void *)v21;
        if (v20) {
          CFStringRef v22 = v20;
        }
        else {
          CFStringRef v22 = &stru_1008E7020;
        }
        v65[0] = @"serialNumber";
        v65[1] = @"clientAidvrId";
        if (v21) {
          CFStringRef v23 = (const __CFString *)v21;
        }
        else {
          CFStringRef v23 = &stru_1008E7020;
        }
        v66[0] = v22;
        v66[1] = v23;
        uint64_t v19 = 2;
        id v14 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
        id v39 = 0;
        id v40 = 0;
        id v37 = 0;
        NSErrorDomain v38 = 0;
        CFStringRef v11 = 0;
        CFStringRef v41 = 0;
        uint64_t v16 = 0;
        goto LABEL_32;
      }
      goto LABEL_57;
    }
    if ([v43 isEqualToString:@"findPerson"])
    {
      CFStringRef v41 = [v6 objectForKeyedSubscript:@"emails"];
      uint64_t v26 = [v6 objectForKeyedSubscript:@"phones"];
      id v40 = (void *)v26;
      if (__PAIR128__((unint64_t)v41, v26) != 0)
      {
        id v39 = +[NSMutableDictionary dictionary];
        if (v41)
        {
          v52[0] = 0;
          int v27 = sub_1002303CC(v41, 0, v52);
          id v28 = v52[0];
          id v13 = v62;
          *((_DWORD *)v62 + 6) = v27;
          NSErrorDomain v38 = v28;
          if (v27)
          {
            id v37 = 0;
LABEL_48:
            id v14 = 0;
            CFStringRef v11 = 0;
            uint64_t v15 = 0;
            uint64_t v16 = 0;
            id v20 = 0;
            id v18 = 0;
            id v7 = 0;
            goto LABEL_36;
          }
          if (!v28)
          {
            id v37 = 0;
            NSErrorDomain v38 = 0;
            goto LABEL_71;
          }
          [v39 setObject:v28 forKeyedSubscript:@"emails"];
        }
        else
        {
          NSErrorDomain v38 = 0;
        }
        if (!v40)
        {
          id v37 = 0;
LABEL_56:
          id v7 = self->_appleID;
          id v14 = v39;
          CFStringRef v11 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 0;
          id v20 = 0;
          id v18 = 0;
          uint64_t v19 = 3;
          id v39 = v14;
          goto LABEL_33;
        }
        id v51 = 0;
        int v34 = sub_1002303CC(v40, 0, &v51);
        id v35 = v51;
        id v13 = v62;
        *((_DWORD *)v62 + 6) = v34;
        id v37 = v35;
        if (v34) {
          goto LABEL_48;
        }
        if (v35)
        {
          [v39 setObject:v35 forKeyedSubscript:@"phones"];
          goto LABEL_56;
        }
        id v37 = 0;
LABEL_71:
        id v14 = 0;
        CFStringRef v11 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        id v20 = 0;
        id v18 = 0;
        id v7 = 0;
LABEL_64:
        int v36 = -6762;
        goto LABEL_53;
      }
    }
    else if (dword_100968E10 <= 90 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v39 = 0;
    id v40 = 0;
    id v37 = 0;
    NSErrorDomain v38 = 0;
    id v14 = 0;
    CFStringRef v11 = 0;
    uint64_t v15 = 0;
    CFStringRef v41 = 0;
    uint64_t v16 = 0;
    id v20 = 0;
    id v18 = 0;
    id v7 = 0;
LABEL_52:
    id v13 = v62;
    int v36 = -6705;
    goto LABEL_53;
  }
  id v7 = [v6 objectForKeyedSubscript:@"appleID"];
  if (!v7)
  {
LABEL_57:
    id v39 = 0;
    id v40 = 0;
    id v37 = 0;
    NSErrorDomain v38 = 0;
    id v14 = 0;
    CFStringRef v11 = 0;
    uint64_t v15 = 0;
    CFStringRef v41 = 0;
    uint64_t v16 = 0;
    id v20 = 0;
    id v18 = 0;
    goto LABEL_52;
  }
  uint64_t v17 = [v6 objectForKeyedSubscript:@"certificateToken"];
  id v18 = (void *)v17;
  if (!v17)
  {
    id v39 = 0;
    id v40 = 0;
    id v37 = 0;
    NSErrorDomain v38 = 0;
    id v14 = 0;
    CFStringRef v11 = 0;
    uint64_t v15 = 0;
    CFStringRef v41 = 0;
    uint64_t v16 = 0;
    id v20 = 0;
    goto LABEL_52;
  }
  CFStringRef v67 = @"certificateToken";
  uint64_t v68 = v17;
  uint64_t v19 = 1;
  id v14 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  id v39 = 0;
  id v40 = 0;
  id v37 = 0;
  NSErrorDomain v38 = 0;
  CFStringRef v11 = 0;
  uint64_t v15 = 0;
  CFStringRef v41 = 0;
  uint64_t v16 = 0;
  id v20 = 0;
LABEL_33:
  task = self->_task;
  if (task)
  {
    [(SDAppleIDServerTask *)task invalidate];
    CFStringRef v30 = self->_task;
    self->_task = 0;
  }
  id v31 = [[SDAppleIDServerTask alloc] initWithType:v19 appleID:v7 info:v14];
  uint64_t v32 = self->_task;
  self->_task = v31;

  [(SDAppleIDServerTask *)self->_task setDispatchQueue:self->_dispatchQueue];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1001A2494;
  v48[3] = &unk_1008CF400;
  v48[4] = self;
  uint64_t v50 = v19;
  id v49 = v44;
  [(SDAppleIDServerTask *)self->_task setResponseHandler:v48];

  [(SDAppleIDServerTask *)self->_task activate];
  *((_DWORD *)v62 + 6) = 0;
LABEL_36:
  if (v44 && *((_DWORD *)v62 + 6))
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A255C;
    block[3] = &unk_1008CCCB0;
    id v46 = v44;
    uint64_t v47 = &v61;
    dispatch_async(dispatchQueue, block);
  }
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v61, 8);
}

- (void)_personInfoWithEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    dispatch_time_t v12 = self->_dispatchQueue;
    if (v12)
    {
      if (v9) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v26 = +[NSAssertionHandler currentHandler];
      [v26 handleFailureInMethod:a2 object:self file:@"SDAppleIDAgent.m" lineNumber:1784 description:@"inQueue and _dispatchQueue both nil."];

      dispatch_time_t v12 = 0;
      if (v9) {
        goto LABEL_6;
      }
    }
LABEL_23:
    uint64_t v19 = 0;
    if (!v11)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      id v18 = 0;
      goto LABEL_20;
    }
    int v21 = -6705;
    uint64_t v17 = 0;
    id v18 = 0;
LABEL_12:
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1001A2BC0;
    v27[3] = &unk_1008CCCD8;
    id v28 = v11;
    int v29 = v21;
    dispatch_async((dispatch_queue_t)v12, v27);

    id v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_19;
  }
  dispatch_time_t v12 = (OS_dispatch_queue *)v10;
  if (!v9) {
    goto LABEL_23;
  }
LABEL_6:
  if (!v11)
  {
    uint64_t v19 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    id v18 = 0;
    goto LABEL_20;
  }
  uint64_t v13 = [(SDAppleIDDatabaseManager *)self->_dbManager cachedPersonInfoWithEmailOrPhone:v9];
  if (!v13)
  {
    uint64_t v19 = +[NSMutableDictionary dictionary];
    if (v19)
    {
      id v39 = v9;
      id v20 = +[NSArray arrayWithObjects:&v39 count:1];
      id v35 = 0;
      int v21 = sub_1002303CC(v20, 0, &v35);
      id v18 = v35;

      if (v21)
      {
        uint64_t v17 = 0;
      }
      else
      {
        if (v18 && [v18 count] == (id)1)
        {
          unsigned int v22 = [v9 containsString:@"@"];
          CFStringRef v23 = @"phones";
          if (v22) {
            CFStringRef v23 = @"emails";
          }
          uint64_t v17 = v23;
          [v19 setObject:v18 forKeyedSubscript:v17];
          int v24 = [[SDAppleIDServerTask alloc] initWithType:3 appleID:self->_appleID info:v19];
          if (v24)
          {
            id v25 = v24;
            [(SDAppleIDServerTask *)v24 setDispatchQueue:v12];
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_1001A2B1C;
            v30[3] = &unk_1008CF428;
            void v30[4] = self;
            uint64_t v16 = v25;
            id v31 = v16;
            id v32 = v9;
            id v33 = v12;
            id v34 = v11;
            [(SDAppleIDServerTask *)v16 setResponseHandler:v30];

            [(NSMutableArray *)self->_findPersonRequests addObject:v16];
            [(SDAppleIDServerTask *)v16 activate];
            id v15 = 0;
            goto LABEL_19;
          }
        }
        else
        {
          uint64_t v17 = 0;
        }
        int v21 = -6762;
      }
    }
    else
    {
      uint64_t v17 = 0;
      id v18 = 0;
      int v21 = -6728;
    }
    goto LABEL_12;
  }
  id v14 = (void *)v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A2B04;
  block[3] = &unk_1008CB7D8;
  id v38 = v11;
  id v15 = v14;
  id v37 = v15;
  dispatch_async((dispatch_queue_t)v12, block);

  uint64_t v16 = 0;
  uint64_t v17 = 0;
  id v18 = 0;
  uint64_t v19 = v38;
LABEL_19:

  uint64_t v19 = v15;
LABEL_20:
}

- (void)_prefsChanged
{
  if ([(SDAppleIDAgent *)self eduModeEnabled])
  {
    if (dword_100968E10 <= 40 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = CFPrefs_GetInt64() != 0;
  }
  if (self->_agentEnabled != v3)
  {
    if (dword_100968E10 <= 40 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      id v4 = "yes";
      if (v3) {
        id v5 = "no";
      }
      else {
        id v5 = "yes";
      }
      if (!v3) {
        id v4 = "no";
      }
      id v11 = v5;
      uint64_t v13 = v4;
      LogPrintF();
    }
    self->_agentEnabled = v3;
    *(_WORD *)&self->_updatePush = 257;
  }
  BOOL v6 = CFPrefs_GetInt64() != 0;
  if (self->_linkIdentityEnabled != v6)
  {
    if (dword_100968E10 <= 40 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      id v7 = "yes";
      if (v6) {
        dispatch_semaphore_t v8 = "no";
      }
      else {
        dispatch_semaphore_t v8 = "yes";
      }
      if (!v6) {
        id v7 = "no";
      }
      id v11 = v8;
      uint64_t v13 = v7;
      LogPrintF();
    }
    self->_linkIdentityEnabled = v6;
    self->_updatePeriodicVerifyTimer = 1;
  }
  CFStringGetTypeID();
  id v9 = (void *)CFPrefs_CopyTypedValue();
  [v9 lowercaseString:v11, v13];
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (([(__CFString *)v10 isEqualToString:@"production"] & 1) == 0
    && ([(__CFString *)v10 isEqualToString:@"development"] & 1) == 0)
  {

    id v10 = @"production";
  }
  if (([(__CFString *)v10 isEqualToString:self->_pushEnvironment] & 1) == 0)
  {
    if (dword_100968E10 <= 40 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
    {
      pushEnvironment = self->_pushEnvironment;
      id v14 = v10;
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_pushEnvironment, v10);
    self->_updatePush = 1;
  }
  [(SDAppleIDAgent *)self _update];
}

- (void)_removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)_requestInfoForAppleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    NSErrorDomain v22 = NSOSStatusErrorDomain;
    uint64_t v23 = -6705;
LABEL_29:
    id v21 = +[NSError errorWithDomain:v22 code:v23 userInfo:0];
    id v9 = 0;
    id v11 = 0;
    uint64_t v16 = 0;
    uint64_t v13 = 0;
    goto LABEL_30;
  }
  if (self->_infoRequest)
  {
    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    NSErrorDomain v22 = NSOSStatusErrorDomain;
    uint64_t v23 = 201225;
    goto LABEL_29;
  }
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
  {
    id v29 = v6;
    LogPrintF();
  }
  dispatch_semaphore_t v8 = -[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", v6, v29);
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 identity];
    id v11 = [v10 serialNumber];

    dispatch_time_t v12 = [v9 validationRecord];
    uint64_t v13 = [v12 identifier];
  }
  else
  {
    id v11 = 0;
    uint64_t v13 = 0;
  }
  if (v11) {
    CFStringRef v14 = v11;
  }
  else {
    CFStringRef v14 = &stru_1008E7020;
  }
  v40[0] = @"serialNumber";
  v40[1] = @"clientAidvrId";
  if (v13) {
    CFStringRef v15 = v13;
  }
  else {
    CFStringRef v15 = &stru_1008E7020;
  }
  v41[0] = v14;
  v41[1] = v15;
  uint64_t v16 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
  uint64_t v17 = [[SDAppleIDServerTask alloc] initWithType:2 appleID:v6 info:v16];
  [(SDAppleIDServerTask *)v17 setDispatchQueue:self->_dispatchQueue];
  if (v17)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1001A3508;
    v33[3] = &unk_1008CF428;
    v33[4] = self;
    id v34 = v6;
    id v18 = v17;
    id v35 = v18;
    id v11 = v11;
    int v36 = v11;
    id v37 = v7;
    [(SDAppleIDServerTask *)v18 setResponseHandler:v33];

    infoRequest = self->_infoRequest;
    self->_infoRequest = v18;
    id v20 = v18;

    [(SDAppleIDServerTask *)self->_infoRequest activate];
    id v21 = 0;
LABEL_18:

    goto LABEL_19;
  }
  NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
  uint64_t v24 = +[NSString stringWithUTF8String:DebugGetErrorString()];
  id v25 = (void *)v24;
  CFStringRef v26 = @"?";
  if (v24) {
    CFStringRef v26 = (const __CFString *)v24;
  }
  CFStringRef v39 = v26;
  int v27 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  id v21 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6762 userInfo:v27];

LABEL_30:
  if (v7 && v21)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A35AC;
    block[3] = &unk_1008CB7D8;
    id v32 = (SDAppleIDServerTask *)v7;
    id v21 = v21;
    id v31 = v21;
    dispatch_async(dispatchQueue, block);

    id v20 = v32;
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_requestIdentityForAppleID:(id)a3 certificateToken:(id)a4 privateKeyPersistentReference:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    if (!self->_identityRequest)
    {
      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
      {
        CFStringRef v14 = "yes";
        if (!v12) {
          CFStringRef v14 = "no";
        }
        id v30 = v10;
        id v31 = v11;
        id v32 = v14;
        LogPrintF();
      }
      CFStringRef v15 = [SDAppleIDIdentityRequest alloc];
      if (v11 && v12)
      {
        uint64_t v16 = [(SDAppleIDIdentityRequest *)v15 initWithAppleID:v10 certificateToken:v11 privateKeyPersistentReference:v12];
      }
      else
      {
        uint64_t v16 = -[SDAppleIDIdentityRequest initWithAppleID:](v15, "initWithAppleID:", v10, v30, v31, v32);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        void v40[2] = sub_1001A3A48;
        v40[3] = &unk_1008CF450;
        v40[4] = self;
        id v41 = v10;
        [(SDAppleIDIdentityRequest *)v16 setCertificateTokenHandler:v40];
      }
      -[SDAppleIDIdentityRequest setDispatchQueue:](v16, "setDispatchQueue:", self->_dispatchQueue, v30, v31, v32);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1001A3AE4;
      v36[3] = &unk_1008CF478;
      v36[4] = self;
      id v37 = v10;
      uint64_t v17 = v16;
      NSErrorUserInfoKey v38 = v17;
      id v39 = v13;
      [(SDAppleIDIdentityRequest *)v17 setResponseHandler:v36];

      identityRequest = self->_identityRequest;
      self->_identityRequest = v17;
      uint64_t v19 = v17;

      [(SDAppleIDIdentityRequest *)self->_identityRequest activate];
      id v20 = 0;
      goto LABEL_14;
    }
    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    uint64_t v27 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    NSErrorDomain v22 = (void *)v27;
    CFStringRef v28 = @"?";
    if (v27) {
      CFStringRef v28 = (const __CFString *)v27;
    }
    CFStringRef v43 = v28;
    uint64_t v24 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    NSErrorDomain v25 = NSOSStatusErrorDomain;
    uint64_t v26 = 201224;
  }
  else
  {
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    uint64_t v21 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    NSErrorDomain v22 = (void *)v21;
    CFStringRef v23 = @"?";
    if (v21) {
      CFStringRef v23 = (const __CFString *)v21;
    }
    CFStringRef v45 = v23;
    uint64_t v24 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    NSErrorDomain v25 = NSOSStatusErrorDomain;
    uint64_t v26 = -6705;
  }
  id v20 = +[NSError errorWithDomain:v25 code:v26 userInfo:v24];

  if (v13 && v20)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A3B84;
    block[3] = &unk_1008CB7D8;
    id v35 = (SDAppleIDIdentityRequest *)v13;
    id v20 = v20;
    id v34 = v20;
    dispatch_async(dispatchQueue, block);

    uint64_t v19 = v35;
LABEL_14:
  }
}

- (void)_setCurrentAppleIDIdentity:(id)a3
{
}

- (void)_setCurrentAppleIDContactInfo:(id)a3 validationRecord:(id)a4
{
}

- (void)_setMetaInfoValue:(id)a3 forKey:(id)a4
{
  [(NSMutableDictionary *)self->_agentMetaInfo setObject:a3 forKeyedSubscript:a4];
  agentMetaInfo = self->_agentMetaInfo;
  dbManager = self->_dbManager;

  [(SDAppleIDDatabaseManager *)dbManager setMetaInfo:agentMetaInfo];
}

- (id)_statusInfo
{
  id v3 = +[NSMutableDictionary dictionary];
  if (v3)
  {
    id v4 = [(SDAppleIDDatabaseManager *)self->_dbManager statusInfo];
    [v3 addEntriesFromDictionary:v4];

    id v5 = +[NSNumber numberWithInteger:[(SDAppleIDAgent *)self _accountState]];
    [v3 setObject:v5 forKeyedSubscript:@"AccountState"];

    id v6 = [(SDAppleIDAgent *)self _detailedDescription];
    [v3 setObject:v6 forKeyedSubscript:@"AgentDescription"];

    id v7 = v3;
  }

  return v3;
}

- (void)_update
{
  if (self->_updatePush)
  {
    [(SDAppleIDAgent *)self _ensurePushStopped];
    [(SDAppleIDAgent *)self _ensurePushStarted];
    self->_updatePush = 0;
  }
  if (self->_updatePeriodicVerifyTimer)
  {
    [(SDAppleIDAgent *)self _ensurePeriodicVerifyTimerStopped];
    [(SDAppleIDAgent *)self _ensurePeriodicVerifyTimerStarted];
    self->_updatePeriodicVerifyTimer = 0;
  }
}

- (void)_updateAppleID
{
  id v3 = +[SDStatusMonitor sharedMonitor];
  id obj = [v3 myAppleID];

  appleID = self->_appleID;
  if (appleID) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = obj == 0;
  }
  if (!v5 || !(BOOL v6 = -[NSString isEqualToString:](appleID, "isEqualToString:")))
  {
    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_appleID) {
      [(SDAppleIDAgent *)self _clearAccount];
    }
    objc_storeStrong((id *)&self->_appleID, obj);
  }

  _objc_release_x2(v6);
}

- (void)_updateMyInfo
{
  if (self->_appleID)
  {
    [(SDAppleIDAgent *)self _setCurrentAppleIDContactInfo:0 validationRecord:0];
    [(SDAppleIDAgent *)self _verifyState];
  }
  else if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_verifyState
{
  if (!self->_agentEnabled)
  {
LABEL_67:
    BOOL v5 = 0;
    goto LABEL_68;
  }
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = +[SDStatusMonitor sharedMonitor];
  unsigned __int8 v4 = [v3 deviceWasUnlockedOnce];

  if ((v4 & 1) == 0)
  {
    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_67;
  }
  if (self->_dbManager)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v6 = +[SDAppleIDDatabaseManager sharedManager];
    dbManager = self->_dbManager;
    self->_dbManager = v6;

    BOOL v5 = [(SDAppleIDDatabaseManager *)self->_dbManager metaInfo];
    dispatch_semaphore_t v8 = +[NSMutableDictionary dictionary];
    agentMetaInfo = self->_agentMetaInfo;
    self->_agentMetaInfo = v8;

    id v10 = self->_agentMetaInfo;
    if (!v10)
    {
LABEL_68:
      id v11 = 0;
      goto LABEL_65;
    }
    if (v5) {
      [(NSMutableDictionary *)v10 addEntriesFromDictionary:v5];
    }
  }
  [(SDAppleIDAgent *)self _updateAppleID];
  if (!self->_appleID)
  {
    if (dword_100968E10 > 30 || dword_100968E10 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_68;
    }
LABEL_46:
    LogPrintF();
    goto LABEL_68;
  }
  -[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    [(SDAppleIDDatabaseManager *)self->_dbManager addAppleID:self->_appleID];
    id v11 = [(SDAppleIDDatabaseManager *)self->_dbManager accountForAppleID:self->_appleID];
    if (!v11)
    {
      if (dword_100968E10 > 30 || dword_100968E10 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_68;
      }
      goto LABEL_46;
    }
  }
  [(SDAppleIDAgent *)self _cleanUpAccount:v11];
  id v12 = [v11 identity];

  if (!v12)
  {
    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    appleID = self->_appleID;
    int v36 = [v11 certificateToken];
    id v37 = [v11 privateKeyPersistentReference];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1001A4740;
    v46[3] = &unk_1008CA5A8;
    v46[4] = self;
    NSErrorUserInfoKey v38 = v46;
    goto LABEL_34;
  }
  id v13 = [v11 identity];
  if ([v13 isInvalid])
  {

LABEL_18:
    if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    appleID = self->_appleID;
    int v36 = [v11 certificateToken];
    id v37 = [v11 privateKeyPersistentReference];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1001A47C0;
    v45[3] = &unk_1008CA5A8;
    v45[4] = self;
    NSErrorUserInfoKey v38 = v45;
LABEL_34:
    [(SDAppleIDAgent *)self _requestIdentityForAppleID:appleID certificateToken:v36 privateKeyPersistentReference:v37 withCompletion:v38];

    goto LABEL_65;
  }
  CFStringRef v14 = [v11 identity];
  unsigned int v15 = [v14 needsRenewal];

  if (v15) {
    goto LABEL_18;
  }
  uint64_t v16 = [v11 identity];
  unsigned int v17 = [(SDAppleIDAgent *)self _performKeyVerificationForIdentity:v16];

  if (!v17)
  {
    [(SDAppleIDAgent *)self _performKeychainCount];
    id v18 = [v11 validationRecord];

    if (!v18)
    {
      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v39 = self->_appleID;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1001A4840;
      v44[3] = &unk_1008CA5A8;
      v44[4] = self;
      id v40 = v44;
      goto LABEL_37;
    }
    uint64_t v19 = [v11 validationRecord];
    if ([v19 needsUpdate])
    {

LABEL_25:
      if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v39 = self->_appleID;
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1001A48C0;
      v43[3] = &unk_1008CA5A8;
      v43[4] = self;
      id v40 = v43;
LABEL_37:
      [(SDAppleIDAgent *)self _requestInfoForAppleID:v39 completion:v40];
      goto LABEL_65;
    }
    id v20 = [v11 validationRecord];
    unsigned int v21 = [v20 isInvalid];

    if (v21) {
      goto LABEL_25;
    }
    NSErrorDomain v22 = [v11 identity];
    uint64_t v23 = [v22 accountIdentifier];
    if (v23)
    {
      uint64_t v24 = (void *)v23;
      NSErrorDomain v25 = [v11 validationRecord];
      uint64_t v26 = [v25 altDSID];
      if (v26)
      {
        uint64_t v27 = (void *)v26;
        [v11 identity];
        v28 = NSErrorUserInfoKey v42 = v5;
        id v29 = [v28 accountIdentifier];
        id v30 = [v11 validationRecord];
        [v30 altDSID];
        id v31 = v41 = v22;
        unsigned __int8 v32 = [v29 hasSuffix:v31];

        BOOL v5 = v42;
        if (v32)
        {
          id v33 = [v11 validationRecord];
          id v34 = [v33 data];
          id v11 = v11;
          SFAppleIDParseValidationRecordData();

          goto LABEL_65;
        }
        goto LABEL_60;
      }
    }
LABEL_60:
    if (dword_100968E10 <= 60 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SDAppleIDAgent *)self _handleAccountIdentifierValidationRecordMismatch];
    goto LABEL_65;
  }
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDAppleIDAgent *)self _handleKeyVerificationFailure];
LABEL_65:
}

- (void)_verifyStateWithDelay:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A4E90;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_wasIdentityLinkedOnce
{
  return CFGetInt64() != 0;
}

- (BOOL)_wasOldAgentIdentityQueried
{
  return CFGetInt64() != 0;
}

- (id)accountForAppleID:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(SDAppleIDAgent *)v5 _accountForAppleID:v4];
  objc_sync_exit(v5);

  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  return v6;
}

- (id)accountStatusForAppleID:(id)a3
{
  id v4 = self;
  id v5 = a3;
  objc_sync_enter(v4);
  BOOL v6 = v4->_appleID;
  objc_sync_exit(v4);

  unsigned int v7 = [(NSString *)v6 isEqualToString:v5];
  if (v7)
  {
    dispatch_semaphore_t v8 = [(SDAppleIDAgent *)v4 statusInfo];
  }
  else
  {
    dispatch_semaphore_t v8 = 0;
  }

  return v8;
}

- (void)activate
{
  id obj = self;
  objc_sync_enter(obj);
  [(SDAppleIDAgent *)obj _activate];
  objc_sync_exit(obj);
}

- (void)verifiedIdentityForEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (OS_dispatch_queue *)a4;
  id v10 = a5;
  id v11 = v10;
  dispatchQueue = v9;
  if (!v9) {
    dispatchQueue = self->_dispatchQueue;
  }
  if (v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001A5248;
    v14[3] = &unk_1008CF4F0;
    id v15 = v8;
    id v16 = v11;
    id v13 = dispatchQueue;
    [(SDAppleIDAgent *)self queryVerifiedIdentityForEmailOrPhone:v15 queue:v13 completion:v14];
  }
}

- (void)verifiedIdentityForEmailOrPhone:(id)a3 completion:(id)a4
{
}

- (id)verifiedIdentityForEmailOrPhone:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unsigned int v17 = sub_1001A550C;
  id v18 = sub_1001A551C;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  if (v5)
  {
    BOOL v6 = dispatch_get_global_queue(2, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001A5524;
    v11[3] = &unk_1008CF518;
    id v13 = &v14;
    unsigned int v7 = v5;
    id v12 = v7;
    [(SDAppleIDAgent *)self verifiedIdentityForEmailOrPhone:v4 queue:v6 completion:v11];

    dispatch_time_t v8 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v7, v8))
    {
      if (dword_100968E10 <= 50 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)verifiedIdentityForCertificateChain:(id)a3 emailOrPhone:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    NSErrorDomain v15 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    uint64_t v16 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    unsigned int v17 = (void *)v16;
    CFStringRef v18 = @"?";
    if (v16) {
      CFStringRef v18 = (const __CFString *)v16;
    }
    CFStringRef v38 = v18;
    id v19 = &v38;
    id v20 = &v37;
    goto LABEL_16;
  }
  if (!v8)
  {
    NSErrorDomain v15 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    uint64_t v21 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    unsigned int v17 = (void *)v21;
    CFStringRef v22 = @"?";
    if (v21) {
      CFStringRef v22 = (const __CFString *)v21;
    }
    CFStringRef v36 = v22;
    id v19 = &v36;
    id v20 = &v35;
LABEL_16:
    uint64_t v23 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v20 count:1];
    NSErrorDomain v24 = v15;
    uint64_t v25 = -6705;
    goto LABEL_21;
  }
  if ((SFAppleIDVerifyCertificateChainSync() & 1) == 0)
  {
    id v12 = 0;
    id v13 = 0;
    id v11 = 0;
    goto LABEL_7;
  }
  id v9 = [v7 objectAtIndexedSubscript:0];

  if (v9)
  {
    int v10 = SFAppleIDCommonNameForCertificate();
    id v11 = 0;
    if (!v10)
    {
      id v12 = [[SDAppleIDVerifiedIdentity alloc] initWithAccountIdentifier:v11 emailOrPhone:v8];
      id v13 = 0;
      goto LABEL_7;
    }
    uint64_t v28 = v10;
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    uint64_t v29 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    unsigned int v17 = (void *)v29;
    CFStringRef v30 = @"?";
    if (v29) {
      CFStringRef v30 = (const __CFString *)v29;
    }
    CFStringRef v32 = v30;
    uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v28 userInfo:v23];
    goto LABEL_25;
  }
  NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
  uint64_t v26 = +[NSString stringWithUTF8String:DebugGetErrorString()];
  unsigned int v17 = (void *)v26;
  CFStringRef v27 = @"?";
  if (v26) {
    CFStringRef v27 = (const __CFString *)v26;
  }
  CFStringRef v34 = v27;
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  NSErrorDomain v24 = NSOSStatusErrorDomain;
  uint64_t v25 = -6762;
LABEL_21:
  id v13 = +[NSError errorWithDomain:v24 code:v25 userInfo:v23];
  id v11 = 0;
LABEL_25:

  id v12 = 0;
  if (a5 && v13)
  {
    id v13 = v13;
    id v12 = 0;
    *a5 = v13;
  }
LABEL_7:

  return v12;
}

- (__SecIdentity)copyIdentityForAppleID:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(SDAppleIDAgent *)v5 _copyIdentityForAppleID:v4];
  objc_sync_exit(v5);

  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  return v6;
}

- (void)queryVerifiedIdentityForEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (OS_dispatch_queue *)a4;
  id v10 = a5;
  id v11 = v10;
  dispatchQueue = v9;
  if (!v9) {
    dispatchQueue = self->_dispatchQueue;
  }
  if (v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001A5C30;
    v14[3] = &unk_1008CF540;
    id v15 = v8;
    id v16 = v11;
    id v13 = dispatchQueue;
    [(SDAppleIDAgent *)self personInfoWithEmailOrPhone:v15 queue:v13 completion:v14];
  }
}

- (id)detailedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(SDAppleIDAgent *)v2 _detailedDescription];
  objc_sync_exit(v2);

  return v3;
}

- (void)invalidate
{
  id obj = self;
  objc_sync_enter(obj);
  [(SDAppleIDAgent *)obj _invalidate];
  objc_sync_exit(obj);
}

- (id)myAccount
{
  if (self->_appleID)
  {
    id v3 = self;
    objc_sync_enter(v3);
    id v4 = [(SDAppleIDAgent *)v3 _accountForAppleID:self->_appleID];
    objc_sync_exit(v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4
{
}

- (void)personInfoWithEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = self;
  objc_sync_enter(v10);
  [(SDAppleIDAgent *)v10 _personInfoWithEmailOrPhone:v11 queue:v8 completion:v9];
  objc_sync_exit(v10);
}

- (void)prefsChanged
{
  id obj = self;
  objc_sync_enter(obj);
  [(SDAppleIDAgent *)obj _prefsChanged];
  objc_sync_exit(obj);
}

- (void)requestWithInfo:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [v9 objectForKeyedSubscript:@"requestType"];
  if (([v8 isEqualToString:@"createCert"] & 1) != 0
    || ([v8 isEqualToString:@"fetchCert"] & 1) != 0
    || ([v8 isEqualToString:@"getMyInfo"] & 1) != 0
    || [v8 isEqualToString:@"findPerson"])
  {
    [(SDAppleIDAgent *)v7 _performServerTaskWithInfo:v9 completion:v6];
  }
  else
  {
    [(SDAppleIDAgent *)v7 _performOtherTaskWithInfo:v9 completion:v6];
  }

  objc_sync_exit(v7);
}

+ (id)sharedAgent
{
  if (qword_100980210 != -1) {
    dispatch_once(&qword_100980210, &stru_1008CF560);
  }
  v2 = (void *)gSDAppleIDAgent;

  return v2;
}

- (id)statusInfo
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(SDAppleIDAgent *)v2 _statusInfo];
  objc_sync_exit(v2);

  return v3;
}

- (id)validationRecordInfoForAppleID:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = self;
  objc_sync_enter(v5);
  id v6 = +[NSMutableDictionary dictionary];
  if (v6)
  {
    id v7 = [(SDAppleIDAgent *)v5 _accountForAppleID:v4];
    id v8 = [v7 validationRecord];
    id v9 = [v8 data];
    [v6 setValue:v9 forKey:@"AppleIDAccountValidationRecordData"];

    id v10 = v6;
  }
  objc_sync_exit(v5);

  return v6;
}

- (void)handleAppleIDChangedNotification
{
  id obj = self;
  objc_sync_enter(obj);
  [(SDAppleIDAgent *)obj _handleAppleIDChangedNotification];
  objc_sync_exit(obj);
}

- (void)handleAppleIDSignedInNotification
{
  id obj = self;
  objc_sync_enter(obj);
  [(SDAppleIDAgent *)obj _handleAppleIDSignedInNotification];
  objc_sync_exit(obj);
}

- (void)handleAppleIDSignedOutNotification
{
  id obj = self;
  objc_sync_enter(obj);
  [(SDAppleIDAgent *)obj _handleAppleIDSignedOutNotification];
  objc_sync_exit(obj);
}

- (void)handleKeyBagFirstUnlockNotification
{
  id obj = self;
  objc_sync_enter(obj);
  [(SDAppleIDAgent *)obj _handleKeyBagFirstUnlockNotification];
  objc_sync_exit(obj);
}

- (void)handleUILockStatusChangedNotification
{
  id obj = self;
  objc_sync_enter(obj);
  [(SDAppleIDAgent *)obj _handleUILockStatusChangedNotification];
  objc_sync_exit(obj);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDAppleIDAgent/didReceiveToken", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  os_activity_scope_leave(&state);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDAppleIDAgent/didReceivePublicToken", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (dword_100968E10 <= 30 && (dword_100968E10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  os_activity_scope_leave(&state);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDAppleIDAgent/didReceiveIncomingMessage", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100968E10 <= 50 && (dword_100968E10 != -1 || _LogCategory_Initialize()))
  {
    id v10 = [v7 topic];
    LogPrintF();
  }
  id v9 = self;
  objc_sync_enter(v9);
  [(SDAppleIDAgent *)v9 _updateMyInfo];
  objc_sync_exit(v9);

  os_activity_scope_leave(&state);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttledRetryTimer, 0);
  objc_storeStrong((id *)&self->_testIdentityRequest, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_pushEnvironment, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_periodicVerifyTimer, 0);
  objc_storeStrong((id *)&self->_infoRequest, 0);
  objc_storeStrong((id *)&self->_identityRequest, 0);
  objc_storeStrong((id *)&self->_findPersonRequests, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dbManager, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_appleID, 0);

  objc_storeStrong((id *)&self->_agentMetaInfo, 0);
}

@end