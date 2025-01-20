@interface SubscriptionStatusOperation
- (BOOL)_carrierBundleStatusIsValidForCachedStatus:(id)a3;
- (BOOL)allowsBypassOfPrivacyAcknowledgement;
- (BOOL)authenticatesIfNecessary;
- (NSString)localizedAuthenticationReason;
- (NSString)reason;
- (SSAuthenticationContext)authenticationContext;
- (id)_getInitialStatus:(id *)a3;
- (id)_loadStatusOnce:(id *)a3;
- (id)statusBlock;
- (int64_t)carrierBundleProvisioningStyle;
- (void)_cacheAccountEligibilityWithStatus:(id)a3;
- (void)run;
- (void)setAllowsBypassOfPrivacyAcknowledgement:(BOOL)a3;
- (void)setAuthenticatesIfNecessary:(BOOL)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setCarrierBundleProvisioningStyle:(int64_t)a3;
- (void)setLocalizedAuthenticationReason:(id)a3;
- (void)setReason:(id)a3;
- (void)setStatusBlock:(id)a3;
@end

@implementation SubscriptionStatusOperation

- (BOOL)allowsBypassOfPrivacyAcknowledgement
{
  [(SubscriptionStatusOperation *)self lock];
  BOOL allowsBypassOfPrivacyAcknowledgement = self->_allowsBypassOfPrivacyAcknowledgement;
  [(SubscriptionStatusOperation *)self unlock];
  return allowsBypassOfPrivacyAcknowledgement;
}

- (BOOL)authenticatesIfNecessary
{
  [(SubscriptionStatusOperation *)self lock];
  BOOL authenticatesIfNecessary = self->_authenticatesIfNecessary;
  [(SubscriptionStatusOperation *)self unlock];
  return authenticatesIfNecessary;
}

- (SSAuthenticationContext)authenticationContext
{
  [(SubscriptionStatusOperation *)self lock];
  id v3 = [(SSAuthenticationContext *)self->_authenticationContext copy];
  [(SubscriptionStatusOperation *)self unlock];

  return (SSAuthenticationContext *)v3;
}

- (int64_t)carrierBundleProvisioningStyle
{
  [(SubscriptionStatusOperation *)self lock];
  int64_t carrierBundleProvisioningStyle = self->_carrierBundleProvisioningStyle;
  [(SubscriptionStatusOperation *)self unlock];
  return carrierBundleProvisioningStyle;
}

- (NSString)localizedAuthenticationReason
{
  [(SubscriptionStatusOperation *)self lock];
  id v3 = [(NSString *)self->_localizedAuthenticationReason copy];
  [(SubscriptionStatusOperation *)self unlock];

  return (NSString *)v3;
}

- (NSString)reason
{
  [(SubscriptionStatusOperation *)self lock];
  id v3 = [(NSString *)self->_reason copy];
  [(SubscriptionStatusOperation *)self unlock];

  return (NSString *)v3;
}

- (void)setAllowsBypassOfPrivacyAcknowledgement:(BOOL)a3
{
  [(SubscriptionStatusOperation *)self lock];
  self->_BOOL allowsBypassOfPrivacyAcknowledgement = a3;

  [(SubscriptionStatusOperation *)self unlock];
}

- (void)setAuthenticatesIfNecessary:(BOOL)a3
{
  [(SubscriptionStatusOperation *)self lock];
  self->_BOOL authenticatesIfNecessary = a3;

  [(SubscriptionStatusOperation *)self unlock];
}

- (void)setAuthenticationContext:(id)a3
{
  v6 = (SSAuthenticationContext *)a3;
  [(SubscriptionStatusOperation *)self lock];
  if (self->_authenticationContext != v6)
  {
    v4 = (SSAuthenticationContext *)[(SSAuthenticationContext *)v6 copy];
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;
  }
  [(SubscriptionStatusOperation *)self unlock];
}

- (void)setCarrierBundleProvisioningStyle:(int64_t)a3
{
  [(SubscriptionStatusOperation *)self lock];
  self->_int64_t carrierBundleProvisioningStyle = a3;

  [(SubscriptionStatusOperation *)self unlock];
}

- (void)setLocalizedAuthenticationReason:(id)a3
{
  v6 = (NSString *)a3;
  [(SubscriptionStatusOperation *)self lock];
  if (self->_localizedAuthenticationReason != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    localizedAuthenticationReason = self->_localizedAuthenticationReason;
    self->_localizedAuthenticationReason = v4;
  }
  [(SubscriptionStatusOperation *)self unlock];
}

- (void)setReason:(id)a3
{
  v6 = (NSString *)a3;
  [(SubscriptionStatusOperation *)self lock];
  if (self->_reason != v6)
  {
    v4 = (NSString *)[(NSString *)v6 copy];
    reason = self->_reason;
    self->_reason = v4;
  }
  [(SubscriptionStatusOperation *)self unlock];
}

- (void)setStatusBlock:(id)a3
{
  id v6 = a3;
  [(SubscriptionStatusOperation *)self lock];
  if (self->_statusBlock != v6)
  {
    id v4 = [v6 copy];
    id statusBlock = self->_statusBlock;
    self->_id statusBlock = v4;
  }
  [(SubscriptionStatusOperation *)self unlock];
}

- (id)statusBlock
{
  [(SubscriptionStatusOperation *)self lock];
  id v3 = [self->_statusBlock copy];
  [(SubscriptionStatusOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)run
{
  [(SubscriptionStatusOperation *)self lock];
  BOOL allowsBypassOfPrivacyAcknowledgement = self->_allowsBypassOfPrivacyAcknowledgement;
  id v4 = (void (**)(id, void *, uint64_t, void *))[self->_statusBlock copy];
  [(SubscriptionStatusOperation *)self unlock];
  int v5 = MKBDeviceUnlockedSinceBoot();
  if ((+[SSDevice deviceIsAppleWatch] & 1) != 0
    || (+[SSDevice deviceIsAudioAccessory] & 1) != 0)
  {
    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v20 = +[SSPrivacyController shouldDisplayPrivacyLinkWithIdentifier:SSPrivacyIdentifierMusicStore];
    unsigned int v6 = v20;
    BOOL v21 = allowsBypassOfPrivacyAcknowledgement || v20 == 0;
    if (!v21)
    {
      v15 = SSError();
      SSErrorWithUnderlyingError();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v16 = +[SSLogConfig sharedAccountsConfig];
      if (!v16)
      {
        v16 = +[SSLogConfig sharedConfig];
      }
      unsigned int v22 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        int v23 = v22 | 2;
      }
      else {
        int v23 = v22;
      }
      v19 = [v16 OSLogObject];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        v23 &= 2u;
      }
      if (!v23) {
        goto LABEL_36;
      }
LABEL_34:
      int v60 = 138543362;
      id v61 = (id)objc_opt_class();
      id v24 = v61;
      LODWORD(v54) = 12;
      v53 = &v60;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_37:

        goto LABEL_38;
      }
      v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v60, v54);
      free(v25);
      v53 = (int *)v19;
      SSFileLog();
LABEL_36:

      goto LABEL_37;
    }
  }
  if (v5 <= 0)
  {
    v15 = SSError();
    SSErrorWithUnderlyingError();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v16 = +[SSLogConfig sharedAccountsConfig];
    if (!v16)
    {
      v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    v19 = [v16 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (!v18) {
      goto LABEL_36;
    }
    goto LABEL_34;
  }
  id v59 = 0;
  v7 = [(SubscriptionStatusOperation *)self _getInitialStatus:&v59];
  id v8 = v59;
  if (v7)
  {
    if ((v6 & 1) == 0) {
      [(SubscriptionStatusOperation *)self _cacheAccountEligibilityWithStatus:v7];
    }
    if (!MGGetBoolAnswer())
    {
      [v7 setCarrierBundlingStatus:2];
      BOOL v27 = 0;
      uint64_t v28 = 1;
      goto LABEL_40;
    }
    v9 = +[SSVTelephonyController sharedController];
    unsigned __int8 v10 = [v9 isPhoneNumberAccessRestricted];

    if (v10) {
      goto LABEL_87;
    }
    id v11 = [v7 carrierBundlingStatus];
    int64_t v12 = [(SubscriptionStatusOperation *)self carrierBundleProvisioningStyle];
    if (v12 == 1)
    {
      BOOL v14 = 0;
      if (v11 != (id)1 && v11 != (id)4) {
        BOOL v14 = [v7 accountStatus] != (id)3;
      }
      if ([v7 carrierBundlingStatus] == (id)4)
      {
        BOOL v13 = [v7 accountStatus] == 0;
        goto LABEL_67;
      }
    }
    else
    {
      if (v12 == 2)
      {
        BOOL v13 = 0;
        BOOL v14 = 1;
        goto LABEL_67;
      }
      BOOL v14 = 0;
    }
    BOOL v13 = 0;
LABEL_67:
    id v43 = +[SSVSubscriptionStatusCoordinator copyStatusFromUserDefaults];
    if (v43
      && [(SubscriptionStatusOperation *)self _carrierBundleStatusIsValidForCachedStatus:v43])
    {
      if (v11 != (id)1 && v11 != (id)4) {
        objc_msgSend(v7, "setCarrierBundlingStatus:", objc_msgSend(v43, "carrierBundlingStatus"));
      }
      v44 = [v43 cellularOperatorName];
      [v7 setCellularOperatorName:v44];

      v45 = [v43 phoneNumber];
      [v7 setPhoneNumber:v45];

      v46 = [v43 sessionIdentifier];
      [v7 setSessionIdentifier:v46];
    }
    if (v13)
    {
      int v29 = 1;
      BOOL v27 = v14;
LABEL_41:
      v30 = objc_alloc_init(CarrierBundlingEligibilityOperation);
      v31 = [(SubscriptionStatusOperation *)self reason];
      unsigned int v32 = [v31 isEqualToString:SSVSubscriptionStatusRequestReasonDeepLink];

      if (v32) {
        [(CarrierBundlingEligibilityOperation *)v30 setDeepLink:1];
      }
      id v58 = 0;
      unsigned int v33 = [(SubscriptionStatusOperation *)self runSubOperation:v30 returningError:&v58];
      id v34 = v58;
      v35 = v34;
      if (!v33)
      {
        v37 = [v34 domain];
        if ([v37 isEqualToString:@"CarrierBundlingEligibilityErrorDomain"]) {
          objc_msgSend(v7, "setCarrierBundlingErrorCode:", objc_msgSend(v35, "code"));
        }
        [v7 setCarrierBundlingStatus:0];
        if (v29) {
          v4[2](v4, v7, 1, v35);
        }
LABEL_86:

        if ((v29 | !v27))
        {
LABEL_88:
          v48 = [v7 accountIdentifier];
          v49 = +[SSAccountStore defaultStore];
          v50 = [v49 activeAccount];
          v51 = [v50 uniqueIdentifier];

          if (!v51 || v48 == v51)
          {
            if (v6)
            {
LABEL_97:

              uint64_t v26 = 1;
              goto LABEL_98;
            }
          }
          else if (!v48 || ((v6 | [v48 isEqualToNumber:v51] ^ 1) & 1) != 0)
          {
            goto LABEL_97;
          }
          id v52 = +[SSVSubscriptionStatusCoordinator copyStatusFromUserDefaults];
          +[SSVSubscriptionStatusCoordinator updateUserDefaultsWithStatus:v7];
          if (([v7 isEqualToStatus:v52] & 1) == 0) {
            +[SSVSubscriptionStatusCoordinator sendChangeNotification];
          }

          goto LABEL_97;
        }
LABEL_87:
        v4[2](v4, v7, 1, 0);
        goto LABEL_88;
      }
      v36 = [(CarrierBundlingEligibilityOperation *)v30 eligibilityResponse];
      v37 = v36;
      int v57 = v29;
      if (v29 && [v36 bundlingStatus] == (id)1) {
        v4[2](v4, v7, 1, 0);
      }
      v38 = [(CarrierBundlingEligibilityOperation *)v30 cellularProviderName];
      [v7 setCellularOperatorName:v38];

      v39 = [(CarrierBundlingEligibilityOperation *)v30 phoneNumber];
      [v7 setPhoneNumber:v39];

      uint64_t v40 = (uint64_t)[v37 bundlingStatus];
      if (v40 == 1)
      {
        if (![v7 accountStatus])
        {
          uint64_t v40 = 4;
LABEL_77:
          [v7 setCarrierBundlingStatus:v40];
          goto LABEL_78;
        }
        if ([v7 carrierBundlingStatus] == (id)4)
        {
LABEL_78:
          if ([v37 isFamilySubscription]) {
            [v7 setFamilySubscription:1];
          }
          v47 = [v37 SMSSessionIdentifier];
          if (!v47)
          {
            v47 = [v37 headerEnrichmentSessionIdentifier];
          }
          [v7 setSessionIdentifier:v47];
          if (v57 && [v37 bundlingStatus] != (id)1) {
            v4[2](v4, v7, 1, 0);
          }

          int v29 = v57;
          goto LABEL_86;
        }
      }
      unsigned int v56 = v6;
      v41 = [v35 domain];
      if ([v41 isEqualToString:SSErrorDomain])
      {
        BOOL v55 = v27;
        id v42 = [v35 code];

        BOOL v21 = v42 == (id)124;
        BOOL v27 = v55;
        if (v21) {
          uint64_t v40 = 2;
        }
      }
      else
      {
      }
      unsigned int v6 = v56;
      goto LABEL_77;
    }
    BOOL v27 = v14;
    uint64_t v28 = !v14;
LABEL_40:
    v4[2](v4, v7, v28, 0);
    int v29 = 0;
    goto LABEL_41;
  }
LABEL_38:
  v4[2](v4, 0, 1, v8);
  uint64_t v26 = 0;
LABEL_98:
  -[SubscriptionStatusOperation setError:](self, "setError:", v8, v53);
  [(SubscriptionStatusOperation *)self setStatusBlock:0];
  [(SubscriptionStatusOperation *)self setSuccess:v26];
}

- (void)_cacheAccountEligibilityWithStatus:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountIdentifier];
  if (v4)
  {
    int v5 = +[SSAccountStore defaultStore];
    unsigned int v6 = [v5 accountWithUniqueIdentifier:v4];
    if (!v6)
    {
LABEL_18:

      goto LABEL_19;
    }
    if ([v3 accountStatus] == (id)3) {
      v7 = &__kCFBooleanTrue;
    }
    else {
      v7 = &__kCFBooleanFalse;
    }
    [v6 setEligibility:v7 forServiceType:0];
    id v8 = +[SSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int64_t v12 = objc_opt_class();
      id v16 = v12;
      BOOL v13 = [v6 accountName];
      SSHashIfNeeded();
      int v17 = 138543618;
      int v18 = v12;
      __int16 v19 = 2114;
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = 22;
      BOOL v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_17:

        [v5 saveAccount:v6 verifyCredentials:0 completion:0];
        goto LABEL_18;
      }
      id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v17, v15);
      free(v14);
      SSFileLog();
    }

    goto LABEL_17;
  }
LABEL_19:
}

- (BOOL)_carrierBundleStatusIsValidForCachedStatus:(id)a3
{
  id v5 = a3;
  unsigned int v6 = +[SSVTelephonyController sharedController];
  unsigned int v7 = [v6 isPhoneNumberAccessRestricted];

  if (v7)
  {
    BOOL v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SubscriptionStatusOperation.m" lineNumber:360 description:@"Phone number access is restricted."];
  }
  unint64_t v8 = (unint64_t)[v5 carrierBundlingStatus];
  unsigned __int8 v9 = 0;
  if (v8 <= 4 && ((1 << v8) & 0x16) != 0)
  {
    int v10 = +[ISNetworkObserver sharedInstance];
    id v11 = [v10 phoneNumber];

    int64_t v12 = [v5 phoneNumber];
    if (v11 == v12) {
      unsigned __int8 v9 = 1;
    }
    else {
      unsigned __int8 v9 = [v11 isEqualToString:v12];
    }
  }
  return v9;
}

- (id)_getInitialStatus:(id *)a3
{
  id v4 = [(SubscriptionStatusOperation *)self authenticationContext];
  id v5 = v4;
  if (v4) {
    BOOL v6 = (unint64_t)[v4 promptStyle] < 2;
  }
  else {
    BOOL v6 = [(SubscriptionStatusOperation *)self authenticatesIfNecessary];
  }
  id v7 = 0;
  unint64_t v8 = 0;
  char v9 = 1;
  while (1)
  {
    int v10 = v8;
    id v11 = v7;
    id v23 = v7;
    unint64_t v8 = [(SubscriptionStatusOperation *)self _loadStatusOnce:&v23];
    id v7 = v23;

    if (!v8 || !v6) {
      break;
    }
    if ((([v8 accountStatus] == (id)1) & v9) == 0)
    {
      goto LABEL_20;
    }
    id v14 = [v5 mutableCopy];
    if (!v14)
    {
      id v15 = objc_alloc((Class)SSMutableAuthenticationContext);
      id v16 = +[SSAccountStore defaultStore];
      int v17 = [v16 activeAccount];
      id v14 = [v15 initWithAccount:v17];
    }
    int v18 = [v14 reasonDescription];

    if (!v18)
    {
      __int16 v19 = [(SubscriptionStatusOperation *)self localizedAuthenticationReason];
      [v14 setReasonDescription:v19];
    }
    [v14 setCanCreateNewAccount:0];
    [v14 setPromptStyle:1];
    unsigned __int8 v20 = [(SubscriptionStatusOperation *)self copyAccountID:0 credentialSource:0 byAuthenticatingWithContext:v14 returningError:0];

    char v9 = 0;
    if ((v20 & 1) == 0) {
      goto LABEL_20;
    }
  }
  if (a3 && !v8) {
    *a3 = v7;
  }
LABEL_20:

  return v8;
}

- (id)_loadStatusOnce:(id *)a3
{
  id v5 = +[SSAccountStore defaultStore];
  BOOL v6 = [v5 activeAccount];
  id v7 = [v6 uniqueIdentifier];

  id v8 = objc_alloc_init((Class)ISStoreURLOperation);
  [v8 setCanSendGUIDParameter:0];
  char v9 = +[DaemonProtocolDataProvider provider];
  [v8 setDataProvider:v9];

  int v10 = [(SubscriptionStatusOperation *)self authenticationContext];
  [v8 setAuthenticationContext:v10];
  id v11 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  int64_t v12 = +[SSDevice currentDevice];
  BOOL v13 = [v12 uniqueDeviceIdentifier];

  if (v13) {
    [v11 setValue:v13 forRequestParameter:@"guid"];
  }
  [v11 setURLBagKey:@"getSubscriptionStatusSrv"];

  [v8 setRequestProperties:v11];
  id v23 = 0;
  unsigned int v14 = [(SubscriptionStatusOperation *)self runSubOperation:v8 returningError:&v23];
  id v15 = v23;
  if (!v14)
  {
    id v20 = 0;
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  id v16 = [v8 dataProvider];
  int v17 = [v16 output];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v18 = [v17 objectForKey:@"failureType"];
    __int16 v19 = v18;
    if (v18)
    {
      [v18 integerValue];
      SSError();
      id v20 = 0;
      id v21 = v15;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = objc_alloc_init((Class)SSVSubscriptionStatus);
      [v20 setValuesUsingStatusDictionary:v17];
      id v21 = [v8 authenticatedAccountDSID];
      if (!v21)
      {
        id v21 = [v10 requiredUniqueIdentifier];
        if (!v21) {
          id v21 = v7;
        }
      }
      [v20 setAccountIdentifier:v21];
    }
  }
  else
  {
    id v20 = 0;
  }

  if (a3)
  {
LABEL_16:
    if (!v20) {
      *a3 = v15;
    }
  }
LABEL_18:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusBlock, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_localizedAuthenticationReason, 0);

  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end