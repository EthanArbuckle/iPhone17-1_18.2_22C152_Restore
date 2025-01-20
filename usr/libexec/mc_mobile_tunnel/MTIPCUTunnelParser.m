@interface MTIPCUTunnelParser
- (BOOL)_isLockdownModeEnabled;
- (BOOL)_isXPCInterruptionError:(id)a3;
- (MTIPCUTunnelParser)init;
- (NSData)challenge;
- (NSData)challengeCertificate;
- (NSMutableDictionary)CSR;
- (NSString)hostIdentifier;
- (id)_commandFlush:(id)a3;
- (id)_commandGetEncryptionKey:(id)a3;
- (id)_commandGetProfileList:(id)a3;
- (id)_commandHello:(id)a3;
- (id)_commandInstallProfile:(id)a3;
- (id)_commandRemoveProfile:(id)a3;
- (id)_commandSetCertificate:(id)a3;
- (id)_commandSetWiFiPower:(id)a3;
- (id)_commandStoreProfile:(id)a3;
- (id)_configuratorCloudConfigurationErrorWithCloudConfigDetails:(id)a3 error:(id)a4;
- (id)_configuratorProvisionalEnrollmentErrorWithDetails:(id)a3 error:(id)a4;
- (id)_underlyingCloudConfigErrorFromError:(id)a3;
- (id)escalationBlock;
- (int64_t)downloadAndApplyCloudConfigurationCommandRetryCount;
- (int64_t)setCloudConfigurationCommandRetryCount;
- (void)_commandDownloadAndApplyCloudConfiguration:(id)a3 completionBlock:(id)a4;
- (void)_commandEraseDevice:(id)a3 completionBlock:(id)a4;
- (void)_commandEscalate:(id)a3 completionBlock:(id)a4;
- (void)_commandEscalateResponse:(id)a3 completionBlock:(id)a4;
- (void)_commandEstablishProvisionalEnrollmentRequest:(id)a3 completionBlock:(id)a4;
- (void)_commandGetCloudConfiguration:(id)a3 completionBlock:(id)a4;
- (void)_commandGetStoredProfile:(id)a3 completionBlock:(id)a4;
- (void)_commandPollMDMIfNetworkTetheredRequest:(id)a3 completionBlock:(id)a4;
- (void)_commandSetCloudConfiguration:(id)a3 completionBlock:(id)a4;
- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)setCSR:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setChallengeCertificate:(id)a3;
- (void)setDownloadAndApplyCloudConfigurationCommandRetryCount:(int64_t)a3;
- (void)setEscalationBlock:(id)a3;
- (void)setHostIdentifier:(id)a3;
- (void)setSetCloudConfigurationCommandRetryCount:(int64_t)a3;
@end

@implementation MTIPCUTunnelParser

- (MTIPCUTunnelParser)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTIPCUTunnelParser;
  result = [(MTIPCUTunnelParser *)&v3 init];
  if (result)
  {
    result->_downloadAndApplyCloudConfigurationCommandRetryCount = 0;
    result->_setCloudConfigurationCommandRetryCount = 0;
  }
  return result;
}

- (id)_commandFlush:(id)a3
{
  objc_super v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Flushing command queue.", v6, 2u);
  }
  +[MDMMCInterface flush];
  v4 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];

  return v4;
}

- (id)_commandHello:(id)a3
{
  return +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
}

- (id)_commandGetEncryptionKey:(id)a3
{
  v4 = (os_log_t *)DMCLogObjects();
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000B4A8();
  }
  v5 = [(MTIPCUTunnelParser *)self hostIdentifier];

  if (!v5) {
    goto LABEL_19;
  }
  v6 = [(MTIPCUTunnelParser *)self hostIdentifier];
  v7 = +[MDMConfiguration sharedConfiguration];
  v8 = [v7 personaID];
  v9 = (__SecCertificate *)DMCHCUCopyCertificateFromKeychainForMappedLabel();

  if (v9)
  {
    SecCertificateNotValidAfter();
    double v11 = v10;
    SecCertificateNotValidBefore();
    double v13 = v12;
    double Current = CFAbsoluteTimeGetCurrent();
    if (v13 < Current && v11 > Current)
    {
      v20 = SecCertificateCopyData(v9);
      v21 = +[NSData DMCDataWithCFData:v20];
      CFRelease(v9);
      CFStringRef v22 = @"PublicKey";
LABEL_15:
      CFRelease(v20);
      if (v21)
      {
        v27[0] = kMCTPStatusKey;
        v27[1] = v22;
        v28[0] = kMCTPStatusAcknowledged;
        v28[1] = v21;
        v23 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

        goto LABEL_20;
      }
      goto LABEL_17;
    }
    v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "iPCU client certificate is no longer valid. Requesting a new one.", v26, 2u);
    }
    CFRelease(v9);
  }
  v17 = [(MTIPCUTunnelParser *)self hostIdentifier];

  if (v17)
  {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    [(MTIPCUTunnelParser *)self setCSR:v18];

    v19 = [(MTIPCUTunnelParser *)self CSR];
    v20 = (const void *)DMCHCUCreateCSR();

    v21 = +[NSData DMCDataWithCFData:v20];
    CFStringRef v22 = @"CSR";
    goto LABEL_15;
  }
LABEL_17:
  v24 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Cannot retrieve the device certificate for the connected host.", v26, 2u);
  }
LABEL_19:
  v23 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusCommandFormatError];
LABEL_20:

  return v23;
}

- (id)_commandGetProfileList:(id)a3
{
  objc_super v3 = (os_log_t *)DMCLogObjects();
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000B530();
  }
  v4 = +[MDMMCInterface ipcuProfileList];

  return v4;
}

- (id)_commandRemoveProfile:(id)a3
{
  id v3 = a3;
  v4 = (os_log_t *)DMCLogObjects();
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000B5B8();
  }
  v5 = [v3 objectForKey:kMCTPProfileIdentifier];

  v6 = +[MDMMCInterface ipcuRemoveProfileWithIdentifier:v5];

  if (v6)
  {
    v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v9 = [v6 DMCVerboseDescription];
      int v13 = 138543362;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v10 = +[MTIPCUTunnelParser responseWithError:v6];
  }
  else
  {
    uint64_t v10 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
  }
  double v11 = (void *)v10;

  return v11;
}

- (id)_commandSetCertificate:(id)a3
{
  id v4 = a3;
  v5 = (os_log_t *)DMCLogObjects();
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000B640();
  }
  uint64_t v6 = [(MTIPCUTunnelParser *)self hostIdentifier];
  if (v6
    && (v7 = (void *)v6,
        [(MTIPCUTunnelParser *)self CSR],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v9 = [v4 objectForKey:@"CertificateData"];
    uint64_t v10 = [(MTIPCUTunnelParser *)self hostIdentifier];
    double v11 = [(MTIPCUTunnelParser *)self CSR];
    double v12 = +[MDMConfiguration sharedConfiguration];
    int v13 = [v12 personaID];
    v14 = DMCHCUSetCertificateDataForMappedLabel();

    [(MTIPCUTunnelParser *)self setCSR:0];
    v15 = *(NSObject **)DMCLogObjects();
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Created new iPCU client identity.", v19, 2u);
      }
      uint64_t v16 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not create new iPCU client identity.", v19, 2u);
      }
      v20[0] = @"Error";
      v20[1] = kMCTPStatusKey;
      v21[0] = @"Could not create identity with certificate";
      v21[1] = kMCTPStatusError;
      v20[2] = @"Goodbye";
      v21[2] = &__kCFBooleanTrue;
      uint64_t v16 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    }
    v17 = (void *)v16;
  }
  else
  {
    v17 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusCommandFormatError];
  }

  return v17;
}

- (id)_commandInstallProfile:(id)a3
{
  id v4 = a3;
  v5 = (os_log_t *)DMCLogObjects();
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000B6C8();
  }
  uint64_t v6 = kMCTPPayloadKey;
  v7 = [v4 objectForKey:kMCTPPayloadKey];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = +[NSPropertyListSerialization dataWithPropertyList:v7 format:100 options:0 error:0];

      v7 = (void *)v8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = objc_opt_new();
      [v9 setProfileData:v7];
      [v9 setStyle:0];
      uint64_t v10 = +[DMFConnection systemConnection];
      id v26 = 0;
      id v11 = [v10 performRequest:v9 error:&v26];
      id v12 = v26;

      if (!v12)
      {
LABEL_19:

        if (v12) {
          +[MTIPCUTunnelParser responseWithError:v12];
        }
        else {
        v19 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
        }

        goto LABEL_23;
      }
      if ([v12 code] == (id)2000)
      {
        unsigned int v13 = [(MTIPCUTunnelParser *)self _isLockdownModeEnabled];
        uint64_t v14 = DMCInstallationErrorDomain;
        if (v13)
        {
          v15 = DMCErrorArray();
          uint64_t v16 = DMCErrorTypeFatal;
          uint64_t v17 = v14;
          uint64_t v18 = 4021;
        }
        else
        {
          v15 = DMCErrorArray();
          uint64_t v16 = DMCErrorTypeFatal;
          uint64_t v17 = v14;
          uint64_t v18 = 4020;
        }
        +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v17, v18, v15, v16, 0);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      v21 = [v12 userInfo];
      v15 = [v21 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if (v15)
      {
        id v22 = v15;
        v15 = v22;
LABEL_17:
        id v23 = v22;

        id v12 = v23;
      }
    }
    else
    {
      uint64_t v20 = DMCTunnelErrorDomain;
      uint64_t v25 = v6;
      v9 = DMCErrorArray();
      v15 = +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v20, 14000, v9, DMCErrorTypeFatal, v25, 0);
      id v12 = [v15 DMCCopyAsPrimaryError];
    }

    goto LABEL_19;
  }
  v19 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusErrorPayloadEmpty];
LABEL_23:

  return v19;
}

- (BOOL)_isLockdownModeEnabled
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v3 = [v2 isLockdownModeEnabled];

  return v3;
}

- (id)_commandStoreProfile:(id)a3
{
  id v3 = a3;
  id v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Storing profile", buf, 2u);
  }
  v5 = [v3 objectForKeyedSubscript:@"ProfileData"];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v10 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusCommandFormatError];
    goto LABEL_18;
  }
  char v14 = 0;
  id v13 = 0;
  uint64_t v6 = +[MDMMCInterface profileIdentifierForProfileData:v5 allowEmptyPayload:1 outIsSupervisionProfile:0 outProfileSigner:0 outMayInstallCloudProfile:&v14 outError:&v13];
  id v7 = v13;
  if (!v6)
  {
    uint64_t v10 = +[MTIPCUTunnelParser responseWithError:v7];
    goto LABEL_17;
  }
  uint64_t v8 = [v3 objectForKeyedSubscript:@"Purpose"];
  if (!v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v8 isEqualToString:@"PostSetupInstallation"] & 1) == 0)
  {
    id v11 = &kMCTPStatusCommandFormatError;
LABEL_14:
    uint64_t v9 = +[MTIPCUTunnelParser responseWithStatus:*v11];
    goto LABEL_15;
  }
  if (![v8 isEqualToString:@"PostSetupInstallation"] || v14)
  {
    +[MDMMCInterface storeProfileData:v5 completion:&stru_100010930];
    id v11 = &kMCTPStatusAcknowledged;
    goto LABEL_14;
  }
  uint64_t v9 = +[MTIPCUTunnelParser responseWithError:v7];
LABEL_15:
  uint64_t v10 = (void *)v9;

LABEL_17:
LABEL_18:

  return v10;
}

- (void)_commandGetStoredProfile:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Retrieving stored profile", buf, 2u);
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"Purpose"];

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v8 isEqualToString:@"PostSetupInstallation"] & 1) != 0)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000086E8;
      v10[3] = &unk_100010958;
      id v11 = v5;
      +[MDMMCInterface storedProfileDataWithCompletion:v10];
      uint64_t v9 = v11;
LABEL_9:

      goto LABEL_10;
    }
  }
  if (v5)
  {
    uint64_t v9 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusCommandFormatError];
    (*((void (**)(id, void *))v5 + 2))(v5, v9);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_commandGetCloudConfiguration:(id)a3 completionBlock:(id)a4
{
  id v7 = (void (**)(id, void *))a4;
  id v4 = +[MDMMCInterface cloudConfigurationDetails];
  id v5 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
  id v6 = v5;
  if (v4) {
    [v5 setObject:v4 forKeyedSubscript:@"CloudConfiguration"];
  }
  if (v7) {
    v7[2](v7, v6);
  }
}

- (void)_commandSetCloudConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = +[MDMMCInterface cloudConfigurationDetails];
  if (v8)
  {
    uint64_t v9 = DMCTunnelErrorDomain;
    uint64_t v10 = DMCErrorArray();
    id v11 = +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v9, 14002, v10, DMCErrorTypeFatal, 0);

    if (v7)
    {
      id v12 = +[MTIPCUTunnelParser responseWithError:v11];
      v7[2](v7, v12);
    }
  }
  else
  {
    id v13 = [v6 objectForKeyedSubscript:@"CloudConfiguration"];
    id v14 = [v13 mutableCopy];

    [v14 setObject:&off_100011418 forKeyedSubscript:kCCConfigurationSourceKey];
    v15 = [v14 objectForKeyedSubscript:kCCConfigurationURLKey];
    if (v15)
    {
    }
    else
    {
      uint64_t v16 = [v14 objectForKeyedSubscript:kCCConfigurationWebURLKey];

      if (!v16)
      {
        [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationUICompleteKey];
        [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationWasAppliedKey];
      }
    }
    [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCIsMandatoryKey];
    [v14 setObject:&__kCFBooleanFalse forKeyedSubscript:kCCIsMDMUnremovable];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100008AB8;
    v17[3] = &unk_100010980;
    v17[4] = self;
    id v18 = v6;
    v19 = v7;
    +[MDMMCInterface storeCloudConfigurationDetails:v14 completion:v17];
  }
}

- (id)_underlyingCloudConfigErrorFromError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  id v5 = [v3 userInfo];
  id v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if (!v6
    || ([v6 domain],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 isEqualToString:DEPCloudConfigErrorDomain],
        v7,
        (v8 & 1) == 0))
  {

LABEL_5:
    id v6 = 0;
  }

  return v6;
}

- (id)_configuratorProvisionalEnrollmentErrorWithDetails:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = [(MTIPCUTunnelParser *)self _underlyingCloudConfigErrorFromError:v5];
  id v7 = v6;
  unsigned __int8 v8 = v5;
  if (v6)
  {
    if ([v6 code] == (id)33014) {
      unsigned __int8 v8 = v7;
    }
    else {
      unsigned __int8 v8 = v5;
    }
  }
  id v9 = v8;

  return v9;
}

- (id)_configuratorCloudConfigurationErrorWithCloudConfigDetails:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = [(MTIPCUTunnelParser *)self _underlyingCloudConfigErrorFromError:v5];
  id v7 = v6;
  unsigned __int8 v8 = v5;
  if (v6)
  {
    if ([v6 code] == (id)33005) {
      unsigned __int8 v8 = v7;
    }
    else {
      unsigned __int8 v8 = v5;
    }
  }
  id v9 = v8;

  return v9;
}

- (BOOL)_isXPCInterruptionError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:NSCocoaErrorDomain]) {
    BOOL v5 = [v3 code] == (id)4097 || [v3 code] == (id)4099;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_commandDownloadAndApplyCloudConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Download and apply cloud configuration", buf, 2u);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000900C;
  v17[3] = &unk_1000109D0;
  v17[4] = self;
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  id v11 = objc_retainBlock(v17);
  id v12 = +[MDMMCInterface mdmProfileIdentifier];

  if (v12)
  {
    id v13 = [(id)objc_opt_class() responseWithStatus:kMCTPStatusAcknowledged];
    ((void (*)(void *, void *))v11[2])(v11, v13);
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000091A0;
    v14[3] = &unk_100010AF8;
    v14[4] = self;
    uint64_t v16 = v11;
    id v15 = v9;
    +[MDMMCInterface retrieveCloudConfigurationDetailsCompletion:v14];
  }
}

- (void)_commandPollMDMIfNetworkTetheredRequest:(id)a3 completionBlock:(id)a4
{
  id v4 = a4;
  BOOL v5 = +[MDMClient sharedClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009BB8;
  v7[3] = &unk_100010B20;
  id v8 = v4;
  id v6 = v4;
  [v5 simulatePushIfNetworkTetheredWithCompletion:v7];
}

- (void)_commandEraseDevice:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = [v5 objectForKeyedSubscript:@"PreserveDataPlan"];
  if (!v7)
  {
    uint64_t v8 = 1;
LABEL_5:
    id v9 = [v5 objectForKeyedSubscript:@"DisallowProximitySetup"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v13 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusCommandFormatError];
        v6[2](v6, v13);
        goto LABEL_12;
      }
      id v10 = [v9 BOOLValue];
    }
    else
    {
      id v10 = 0;
    }
    id v11 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
    v6[2](v6, v11);

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    id v13 = objc_alloc_init((Class)DDRResetOptions);
    [v13 setHideProgress:1];
    [v13 setEraseDataPlan:v8];
    [v13 setDisallowProximitySetup:v10];
    id v14 = [objc_alloc((Class)DDRResetRequest) initWithMode:4 options:v13 reason:@"mc_mobile_tunnel erase device command"];
    id v15 = +[DDRResetService sharedInstance];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100009FC8;
    v17[3] = &unk_100010B48;
    dispatch_semaphore_t v18 = v12;
    uint64_t v16 = v12;
    [v15 resetWithRequest:v14 completion:v17];

    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v7 BOOLValue] ^ 1;
    goto LABEL_5;
  }
  id v9 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusCommandFormatError];
  v6[2](v6, v9);
LABEL_13:
}

- (void)_commandEscalate:(id)a3 completionBlock:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = [a3 objectForKeyedSubscript:@"SupervisorCertificate"];
  uint64_t v8 = +[MDMMCInterface cloudConfigurationDetails];
  id v9 = [v8 objectForKeyedSubscript:kCCSupervisorHostCertificatesKey];

  if ([v9 containsObject:v7])
  {
    [(MTIPCUTunnelParser *)self setChallengeCertificate:v7];
    arc4random_buf(&v13, 8uLL);
    id v10 = +[NSData dataWithBytes:&v13 length:8];
    [(MTIPCUTunnelParser *)self setChallenge:v10];

    id v11 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
    dispatch_semaphore_t v12 = [(MTIPCUTunnelParser *)self challenge];
    [v11 setObject:v12 forKeyedSubscript:@"Challenge"];

    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v11 = +[MTIPCUTunnelParser responseWithStatus:@"CertificateRejected"];
  if (v6) {
LABEL_5:
  }
    v6[2](v6, v11);
LABEL_6:
}

- (void)_commandEscalateResponse:(id)a3 completionBlock:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = [a3 objectForKeyedSubscript:@"SignedRequest"];
  SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
  if (!BasicX509) {
    goto LABEL_18;
  }
  SecPolicyRef v9 = BasicX509;
  id v28 = 0;
  *(void *)buf = 0;
  id v27 = 0;
  if (!SecCMSVerifyCopyDataAndAttributes())
  {
    id v11 = v27;
    id v10 = v28;
    dispatch_semaphore_t v12 = [v27 objectForKeyedSubscript:kSecCMSAllCerts];
    if (![v12 count])
    {
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v13 = [v12 objectAtIndexedSubscript:0];

    CFDataRef v14 = SecCertificateCopyData((SecCertificateRef)v13);
    id v15 = [(MTIPCUTunnelParser *)self challengeCertificate];
    unsigned int v16 = [(__CFData *)v14 isEqualToData:v15];

    if (v16)
    {
      uint64_t v17 = [(MTIPCUTunnelParser *)self challenge];
      unsigned __int8 v18 = [v28 isEqualToData:v17];

      if (v18)
      {

        CFRelease(v9);
        [(MTIPCUTunnelParser *)self setChallenge:0];
        [(MTIPCUTunnelParser *)self setChallengeCertificate:0];
        id v19 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Escalation accepted.", buf, 2u);
        }
        uint64_t v20 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
        v21 = [(MTIPCUTunnelParser *)self escalationBlock];

        if (v21)
        {
          id v22 = [(MTIPCUTunnelParser *)self escalationBlock];
          v22[2]();
        }
        goto LABEL_21;
      }
      id v23 = *(NSObject **)DMCLogObjects();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_WORD *)id v26 = 0;
      v24 = "Escalation response does not contain the expected challenge.";
    }
    else
    {
      id v23 = *(NSObject **)DMCLogObjects();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_15:

        goto LABEL_16;
      }
      *(_WORD *)id v26 = 0;
      v24 = "Escalation response was signed using a different certificate.";
    }
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v24, v26, 2u);
    goto LABEL_15;
  }
LABEL_17:
  CFRelease(v9);
LABEL_18:
  -[MTIPCUTunnelParser setChallenge:](self, "setChallenge:", 0, *(void *)v26);
  [(MTIPCUTunnelParser *)self setChallengeCertificate:0];
  uint64_t v25 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Escalation rejected.", buf, 2u);
  }
  uint64_t v20 = +[MTIPCUTunnelParser responseWithStatus:@"SignedRequestRejected"];
LABEL_21:
  if (v6) {
    v6[2](v6, v20);
  }
}

- (void)_commandEstablishProvisionalEnrollmentRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Establish Provisional Enrollment", buf, 2u);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000A7F0;
  v17[3] = &unk_100010B70;
  id v9 = v7;
  id v18 = v9;
  id v10 = objc_retainBlock(v17);
  if (DMCIsSetupBuddyDone())
  {
    id v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Provisional Enrollment rejected because device is not still in Buddy", buf, 2u);
    }
    dispatch_semaphore_t v12 = [(id)objc_opt_class() responseWithStatus:@"ProvisionalEnrollmentRejected"];
    ((void (*)(void *, void *))v10[2])(v10, v12);
  }
  else
  {
    dispatch_semaphore_t v12 = [v6 objectForKeyedSubscript:@"Nonce"];
    if (v12)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000A8D0;
      v15[3] = &unk_100010B98;
      v15[4] = self;
      unsigned int v16 = v10;
      +[MDMMCInterface enrollProvisionallyWithNonce:v12 completion:v15];
    }
    else
    {
      uint64_t v13 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Nonce token not received.", buf, 2u);
      }
      CFDataRef v14 = [(id)objc_opt_class() responseWithStatus:@"NonceNotReceived"];
      ((void (*)(void *, void *))v10[2])(v10, v14);
    }
  }
}

- (id)_commandSetWiFiPower:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"PowerState"];
  unsigned int v4 = [v3 BOOLValue];

  id v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = DMCStringForBool();
    *(_DWORD *)buf = 138543362;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting WiFi power: %{public}@", buf, 0xCu);
  }
  uint64_t v8 = WiFiManagerClientCreate();
  if (v8)
  {
    id v9 = (const void *)v8;
    CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop();
    if (WiFiManagerClientGetPower() == v4
      || (WiFiManagerClientSetPower(), WiFiManagerClientGetPower() == v4))
    {
      CFRunLoopGetCurrent();
      WiFiManagerClientUnscheduleFromRunLoop();
      CFRelease(v9);
      id v10 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusAcknowledged];
      goto LABEL_14;
    }
    uint64_t v17 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to set WiFi power.", buf, 2u);
    }
    CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(v9);
    id v18 = [@"TUNNEL_ERROR_COULD_NOT_SET_WIFI_POWER" DMCAppendGreenteaSuffix];
    uint64_t v13 = DMCUnformattedErrorArray();

    uint64_t v14 = DMCTunnelErrorDomain;
    uint64_t v15 = DMCErrorTypeFatal;
    uint64_t v16 = 14005;
  }
  else
  {
    id v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create WiFi manager client.", buf, 2u);
    }
    dispatch_semaphore_t v12 = [@"TUNNEL_ERROR_COULD_NOT_CREATE_WIFI_MANAGER_CLIENT" DMCAppendGreenteaSuffix];
    uint64_t v13 = DMCUnformattedErrorArray();

    uint64_t v14 = DMCTunnelErrorDomain;
    uint64_t v15 = DMCErrorTypeFatal;
    uint64_t v16 = 14004;
  }
  id v19 = +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v14, v16, v13, v15, 0);
  id v10 = +[MTIPCUTunnelParser responseWithError:v19];

LABEL_14:

  return v10;
}

- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  id v11 = [v8 objectForKey:@"IPCUIdentifier"];

  if (v11)
  {
    dispatch_semaphore_t v12 = [v8 objectForKey:@"IPCUIdentifier"];
    id v13 = [v12 copy];
    [(MTIPCUTunnelParser *)self setHostIdentifier:v13];

    uint64_t v14 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = v14;
      uint64_t v16 = [(MTIPCUTunnelParser *)self hostIdentifier];
      *(_DWORD *)buf = 138543362;
      v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Got iPCU Identifier: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v17 = [v8 objectForKey:@"HostCertificateData"];
  id v18 = [(MTIPCUTunnelParser *)self hostIdentifier];

  if (v18 && v17)
  {
    id v19 = [(MTIPCUTunnelParser *)self hostIdentifier];
    uint64_t v20 = +[MDMConfiguration sharedConfiguration];
    v21 = [v20 personaID];
    id v22 = (const void *)DMCHCUCopyHostCertificateForMappedLabel();

    if (v22)
    {
      CFRelease(v22);
    }
    else
    {
      id v23 = [(MTIPCUTunnelParser *)self hostIdentifier];
      +[MDMMCInterface storeCertificateData:v17 forHostIdentifier:v23];
    }
  }
  v24 = [v8 objectForKey:kMCTPRequestTypeKey];
  uint64_t v25 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v24;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Attempting to perform Unsupervised request: %{public}@", buf, 0xCu);
  }
  if (!v24)
  {
    uint64_t v26 = +[MTIPCUTunnelParser responseWithStatus:kMCTPStatusCommandFormatError];
    goto LABEL_29;
  }
  if ([v24 isEqualToString:@"GetEncryptionKey"])
  {
    uint64_t v26 = [(MTIPCUTunnelParser *)self _commandGetEncryptionKey:v8];
    goto LABEL_29;
  }
  if ([v24 isEqualToString:@"SetCertificate"])
  {
    uint64_t v26 = [(MTIPCUTunnelParser *)self _commandSetCertificate:v8];
    goto LABEL_29;
  }
  if ([v24 isEqualToString:@"HelloHostIdentifier"])
  {
    uint64_t v26 = [(MTIPCUTunnelParser *)self _commandHello:v8];
    goto LABEL_29;
  }
  if ([v24 isEqualToString:@"Flush"])
  {
    uint64_t v26 = [(MTIPCUTunnelParser *)self _commandFlush:v8];
    goto LABEL_29;
  }
  if ([v24 isEqualToString:@"GetProfileList"])
  {
    uint64_t v26 = [(MTIPCUTunnelParser *)self _commandGetProfileList:v8];
    goto LABEL_29;
  }
  if ([v24 isEqualToString:@"InstallProfile"])
  {
    uint64_t v26 = [(MTIPCUTunnelParser *)self _commandInstallProfile:v8];
    goto LABEL_29;
  }
  if ([v24 isEqualToString:@"RemoveProfile"])
  {
    uint64_t v26 = [(MTIPCUTunnelParser *)self _commandRemoveProfile:v8];
    goto LABEL_29;
  }
  if ([v24 isEqualToString:@"StoreProfile"])
  {
    uint64_t v26 = [(MTIPCUTunnelParser *)self _commandStoreProfile:v8];
    goto LABEL_29;
  }
  if ([v24 isEqualToString:@"GetStoredProfile"])
  {
    [(MTIPCUTunnelParser *)self _commandGetStoredProfile:v8 completionBlock:v10];
LABEL_53:
    id v27 = 0;
    goto LABEL_31;
  }
  if ([v24 isEqualToString:@"GetCloudConfiguration"])
  {
    [(MTIPCUTunnelParser *)self _commandGetCloudConfiguration:v8 completionBlock:v10];
    goto LABEL_53;
  }
  if ([v24 isEqualToString:@"SetCloudConfiguration"])
  {
    [(MTIPCUTunnelParser *)self _commandSetCloudConfiguration:v8 completionBlock:v10];
    goto LABEL_53;
  }
  if ([v24 isEqualToString:@"DownloadAndApplyCloudConfiguration"])
  {
    [(MTIPCUTunnelParser *)self _commandDownloadAndApplyCloudConfiguration:v8 completionBlock:v10];
    goto LABEL_53;
  }
  if ([v24 isEqualToString:@"PollMDMIfNetworkTethered"])
  {
    [(MTIPCUTunnelParser *)self _commandPollMDMIfNetworkTetheredRequest:v8 completionBlock:v10];
    goto LABEL_53;
  }
  if ([v24 isEqualToString:@"Escalate"])
  {
    [(MTIPCUTunnelParser *)self _commandEscalate:v8 completionBlock:v10];
    goto LABEL_53;
  }
  if ([v24 isEqualToString:@"EscalateResponse"])
  {
    [(MTIPCUTunnelParser *)self _commandEscalateResponse:v8 completionBlock:v10];
    goto LABEL_53;
  }
  if ([v24 isEqualToString:@"EstablishProvisionalEnrollment"])
  {
    [(MTIPCUTunnelParser *)self _commandEstablishProvisionalEnrollmentRequest:v8 completionBlock:v10];
    goto LABEL_53;
  }
  if ([v24 isEqualToString:@"EraseDevice"])
  {
    [(MTIPCUTunnelParser *)self _commandEraseDevice:v8 completionBlock:v10];
    goto LABEL_53;
  }
  if (![v24 isEqualToString:@"SetWiFiPowerState"])
  {
    v28.receiver = self;
    v28.super_class = (Class)MTIPCUTunnelParser;
    [(MTIPCUTunnelParser *)&v28 processRequest:v8 assertion:v9 completionBlock:v10];
    goto LABEL_53;
  }
  uint64_t v26 = [(MTIPCUTunnelParser *)self _commandSetWiFiPower:v8];
LABEL_29:
  id v27 = (void *)v26;
  if (v10) {
    v10[2](v10, v26);
  }
LABEL_31:
}

- (id)escalationBlock
{
  return self->_escalationBlock;
}

- (void)setEscalationBlock:(id)a3
{
}

- (NSMutableDictionary)CSR
{
  return self->_CSR;
}

- (void)setCSR:(id)a3
{
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void)setHostIdentifier:(id)a3
{
}

- (NSData)challengeCertificate
{
  return self->_challengeCertificate;
}

- (void)setChallengeCertificate:(id)a3
{
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (int64_t)downloadAndApplyCloudConfigurationCommandRetryCount
{
  return self->_downloadAndApplyCloudConfigurationCommandRetryCount;
}

- (void)setDownloadAndApplyCloudConfigurationCommandRetryCount:(int64_t)a3
{
  self->_downloadAndApplyCloudConfigurationCommandRetryCount = a3;
}

- (int64_t)setCloudConfigurationCommandRetryCount
{
  return self->_setCloudConfigurationCommandRetryCount;
}

- (void)setSetCloudConfigurationCommandRetryCount:(int64_t)a3
{
  self->_setCloudConfigurationCommandRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_challengeCertificate, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_CSR, 0);

  objc_storeStrong(&self->_escalationBlock, 0);
}

@end