@interface MCNewEASAccountPayloadHandler
- (ACAccountCredential)setAsideAccountCredential;
- (BOOL)_isConfiguredWithSCEP;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (BOOL)stageForInstallationWithInstaller:(id)a3 interactionClient:(id)a4 outError:(id *)a5;
- (DAAccount)setAsideDAAccount;
- (id)_accountFromPayloadWithUserInputResponses:(id)a3 identityPersistentID:(id)a4 SMIMESigningIdentityPersistentID:(id)a5 SMIMEEncryptionIdentityPersistentID:(id)a6;
- (id)_endPointFQDNForPayload:(id)a3;
- (id)_errorFromPolicyPreflightError:(id)a3;
- (id)_errorFromValidationError:(id)a3;
- (id)_getClientRestrictionsFromServerCertificatePersistentID:(id)a3 SMIMESigningIdentityPersistentID:(id)a4 SMIMEEncryptionIdentityPersistentID:(id)a5 outError:(id *)a6;
- (id)_installTimePersistentIDForIdentityCertificateOutError:(id *)a3;
- (id)_installedACAccountOtherThanSelf;
- (id)_preflightTimePersistentIDForIdentityCertificateUserInputResponses:(id)a3 outError:(id *)a4;
- (id)accountTypeIdentifiers;
- (id)accountValidationCompletionHandler;
- (id)preflightCompletionHandler;
- (id)unhashedAccountIdentifier;
- (id)userInputFields;
- (void)_preflightWithAccount:(id)a3 completionHandler:(id)a4;
- (void)_preflightWithPreflighter:(id)a3 completionHandler:(id)a4;
- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5;
- (void)preflighter:(id)a3 error:(id)a4;
- (void)preflighter:(id)a3 needsComplianceWithMCFeatures:(id)a4 perAccountPolicies:(id)a5;
- (void)preflighter:(id)a3 successWithMCFeatures:(id)a4 perAccountPolicies:(id)a5 policyKey:(id)a6;
- (void)preflighterAccountOnlyRemoteWipeRequestResponseAcknowledged:(id)a3;
- (void)preflighterAccountOnlyRemoteWipeRequested:(id)a3;
- (void)preflighterRemoteWipeRequestResponseAcknowledged:(id)a3;
- (void)preflighterRemoteWipeRequested:(id)a3;
- (void)preflighterSuccessWithoutPolicyUpdate:(id)a3;
- (void)remove;
- (void)setAccountValidationCompletionHandler:(id)a3;
- (void)setAsideWithInstaller:(id)a3;
- (void)setPreflightCompletionHandler:(id)a3;
- (void)setSetAsideAccountCredential:(id)a3;
- (void)setSetAsideDAAccount:(id)a3;
- (void)setUserInputResponses:(id)a3;
- (void)unsetAside;
- (void)unstageFromInstallationWithInstaller:(id)a3;
@end

@implementation MCNewEASAccountPayloadHandler

- (id)userInputFields
{
  v54.receiver = self;
  v54.super_class = (Class)MCNewEASAccountPayloadHandler;
  v3 = [(MCNewPayloadHandler *)&v54 userInputFields];
  id v4 = [v3 mutableCopy];

  v5 = [(MCNewPayloadHandler *)self payload];
  v6 = [v5 accountDescription];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [v5 hostname];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      MCLocalizedString();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = v11;
  }
  v12 = [v5 emailAddress];

  if (!v12)
  {
    v13 = MCLocalizedString();
    v14 = MCLocalizedFormat();
    v15 = MCLocalizedString();
    v16 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kEASEmailAddressKey", v13, v14, 0, 0, 0, v15, 0, 2);
    [v4 addObject:v16];
  }
  v17 = [v5 embeddedCertificate];
  if (v17)
  {
    v18 = [v5 certificateUUID];
    BOOL v19 = v18 == 0;
  }
  else
  {
    BOOL v19 = 0;
  }

  unsigned __int8 v20 = [v5 hasCertificate];
  v21 = [v5 useOAuth];
  if (v21)
  {
    BOOL v22 = 0;
  }
  else if ([v5 hasCertificate])
  {
    v23 = [v5 username];
    BOOL v22 = [v23 length] != 0;
  }
  else
  {
    BOOL v22 = 1;
  }

  if (!v19
    || ([v5 embeddedCertificatePassword],
        v24 = objc_claimAutoreleasedReturnValue(),
        id v25 = [v24 length],
        v24,
        v25))
  {
    if (v20) {
      goto LABEL_28;
    }
    goto LABEL_20;
  }
  v32 = [v5 embeddedCertificateName];
  id v33 = [v32 length];

  if (v33)
  {
    v34 = [v5 embeddedCertificateName];
LABEL_26:
    v37 = MCLocalizedFormat();

    goto LABEL_27;
  }
  v35 = [v5 emailAddress];
  id v36 = [v35 length];

  if (v36)
  {
    v34 = [v5 emailAddress];
    goto LABEL_26;
  }
  v37 = MCLocalizedFormat();
LABEL_27:
  v38 = MCLocalizedString();
  v39 = MCLocalizedString();
  v40 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kEASCertPasswordKey", v38, v37, 0, 0, 0, v39, 0, 3);
  [v4 addObject:v40];

  if (v20) {
    goto LABEL_28;
  }
LABEL_20:
  v26 = [v5 username];
  id v27 = [v26 length];

  if (!v27)
  {
    v28 = MCLocalizedString();
    v29 = MCLocalizedFormat();
    v30 = MCLocalizedString();
    v31 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kEASUsernameKey", v28, v29, 0, 0, 0, v30, 0, 0);
    [v4 addObject:v31];
  }
LABEL_28:
  if (v22)
  {
    v41 = [v5 password];
    id v42 = [v41 length];

    if (!v42)
    {
      v43 = [v5 emailAddress];
      id v44 = [v43 length];

      if (v44)
      {
        v52 = [v5 emailAddress];
        v45 = MCLocalizedFormat();
      }
      else
      {
        v52 = v8;
        v45 = MCLocalizedFormat();
      }
      v46 = MCLocalizedString();
      if (objc_msgSend(v5, "hasCertificate", v52))
      {
        uint64_t v47 = MCLocalizedString();

        int v48 = 4;
        v46 = (void *)v47;
      }
      else
      {
        int v48 = 0;
      }
      v49 = MCLocalizedString();
      LODWORD(v53) = 3;
      HIDWORD(v53) = v48;
      v50 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", @"kEASPasswordKey", v49, v45, 0, 0, 0, v46, 0, v53);
      [v4 addObject:v50];
    }
  }

  return v4;
}

- (void)setUserInputResponses:(id)a3
{
  id v4 = a3;
  unsigned __int8 v20 = self;
  v5 = [(MCNewPayloadHandler *)self payload];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v25;
    uint64_t v10 = kMCIDUUIDKey;
    uint64_t v11 = kMCIDResponseKey;
    *(void *)&long long v7 = 138543618;
    long long v19 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 objectForKey:v10, v19];
        v15 = [v13 objectForKey:v11];
        if ([v14 isEqualToString:@"kEASEmailAddressKey"])
        {
          [v5 setEmailAddress:v15];
        }
        else if ([v14 isEqualToString:@"kEASCertPasswordKey"])
        {
          [v5 setEmbeddedCertificatePassword:v15];
        }
        else if ([v14 isEqualToString:@"kEASUsernameKey"])
        {
          [v5 setUsername:v15];
        }
        else if ([v14 isEqualToString:@"kEASPasswordKey"])
        {
          [v5 setPassword:v15];
        }
        else
        {
          os_log_t v16 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            v17 = v16;
            v18 = objc_opt_class();
            *(_DWORD *)buf = v19;
            v29 = v18;
            __int16 v30 = 2114;
            v31 = v14;
            id v21 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
  }

  v23.receiver = v20;
  v23.super_class = (Class)MCNewEASAccountPayloadHandler;
  [(MCNewPayloadHandler *)&v23 setUserInputResponses:obj];
}

- (id)unhashedAccountIdentifier
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 emailAddress];
  if (v3)
  {
    id v4 = +[NSString stringWithFormat:@"eas|%@", v3];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [v2 hostname];
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 stringByAppendingFormat:@"|%@", v5];

    id v4 = (void *)v7;
  }
  uint64_t v8 = [v2 username];
  uint64_t v9 = (void *)v8;
  if (v4 && v8)
  {
    uint64_t v10 = [v4 stringByAppendingFormat:@"|%@", v8];

    id v4 = (void *)v10;
  }

  return v4;
}

- (id)_accountFromPayloadWithUserInputResponses:(id)a3 identityPersistentID:(id)a4 SMIMESigningIdentityPersistentID:(id)a5 SMIMEEncryptionIdentityPersistentID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v147 = a5;
  id v12 = a6;
  id v146 = v12;
  if (!self->_account)
  {
    v13 = [(MCNewPayloadHandler *)self payload];
    id v14 = ACAccountTypeIdentifierExchange;
    v15 = [v13 hostname];
    unsigned int v16 = [v15 isEqualToString:@"m.hotmail.com"];

    if (v16)
    {
      id v17 = ACAccountTypeIdentifierHotmail;

      id v14 = v17;
    }
    v18 = sharedDAAccountStore();
    id obj = v14;
    long long v19 = [v18 accountTypeWithAccountTypeIdentifier:v14];

    id v20 = [objc_alloc((Class)ACAccount) initWithAccountType:v19];
    [v20 setManagingOwnerIdentifier:kMCAccountManagingOwnerIdentifier];
    id v21 = [v13 friendlyName];
    [v20 setManagingSourceName:v21];

    BOOL v22 = +[MDMCloudConfiguration sharedConfiguration];
    unsigned int v23 = [v22 userMode];

    if (v23 == 1)
    {
      long long v24 = [(MCACAccountPayloadHandler *)self MCACAccountIdentifier];
      if (v24)
      {
        long long v25 = [v20 identifier];
        [v20 setAccountProperty:v25 forKey:@"MCAccountIdentifer"];

        long long v26 = [v20 identifier];
        [v20 setAccountProperty:v26 forKey:@"MCNativeAccountIdentifer"];

        [v20 setIdentifier:v24];
      }
      long long v27 = sharedDAAccountStore();
      v28 = [v20 identifier];
      v29 = [v27 accountWithIdentifier:v28];

      if (v29)
      {
        __int16 v30 = [v29 objectID];
        [v20 performSelector:"_setObjectID:" withObject:v30];
      }
    }
    v154 = v19;
    v31 = [v19 supportedDataclasses];
    id v32 = [v31 mutableCopy];

    uint64_t v33 = kAccountDataclassNotes;
    [v32 removeObject:kAccountDataclassNotes];
    long long v164 = 0u;
    long long v165 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    id v34 = v32;
    id v35 = [v34 countByEnumeratingWithState:&v162 objects:v171 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v163;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v163 != v37) {
            objc_enumerationMutation(v34);
          }
          [v20 setProvisioned:1 forDataclass:*(void *)(*((void *)&v162 + 1) + 8 * i)];
        }
        id v36 = [v34 countByEnumeratingWithState:&v162 objects:v171 count:16];
      }
      while (v36);
    }

    v39 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v20];
    account = self->_account;
    self->_account = v39;

    v41 = self->_account;
    if (!v41) {
      goto LABEL_74;
    }
    -[ASAccount setEnabled:forDADataclass:](v41, "setEnabled:forDADataclass:", [v13 enableMail], 1);
    -[ASAccount setEnabled:forDADataclass:](self->_account, "setEnabled:forDADataclass:", [v13 enableContacts], 2);
    -[ASAccount setEnabled:forDADataclass:](self->_account, "setEnabled:forDADataclass:", [v13 enableCalendars], 4);
    -[ASAccount setEnabled:forDADataclass:](self->_account, "setEnabled:forDADataclass:", [v13 enableContacts], 8);
    -[ASAccount setEnabled:forDADataclass:](self->_account, "setEnabled:forDADataclass:", [v13 enableReminders], 16);
    id v42 = [v20 provisionedDataclasses];
    unsigned int v43 = [v42 containsObject:v33];

    if (v43) {
      -[ASAccount setEnabled:forDADataclass:](self->_account, "setEnabled:forDADataclass:", [v13 enableNotes], 32);
    }
    id v44 = [(ASAccount *)self->_account backingAccountInfo];
    v45 = [(MCNewPayloadHandler *)self payload];
    v46 = [v45 UUID];
    [v44 setMcPayloadUUID:v46];

    uint64_t v47 = [(ASAccount *)self->_account backingAccountInfo];
    int v48 = [(MCNewPayloadHandler *)self payload];
    v49 = [v48 profile];
    v50 = [v49 UUID];
    [v47 setMcProfileUUID:v50];

    v51 = [(ASAccount *)self->_account backingAccountInfo];
    v52 = [v13 communicationServiceRules];
    [v51 setCommunicationServiceRules:v52];

    uint64_t v53 = [(ASAccount *)self->_account backingAccountInfo];
    objc_super v54 = [v13 identifier];
    [v53 setMcAccountIdentifier:v54];

    if (([v13 enableNotes] & 1) == 0)
    {
      v55 = [(ASAccount *)self->_account backingAccountInfo];
      [v55 setMcEASAccountEnableNotes:&__kCFBooleanFalse];
    }
    if (([v13 enableMailUserOverridable] & 1) == 0)
    {
      v56 = [(ASAccount *)self->_account backingAccountInfo];
      [v56 setMcEnableMailUserOverridable:&__kCFBooleanFalse];
    }
    if (([v13 enableContactsUserOverridable] & 1) == 0)
    {
      v57 = [(ASAccount *)self->_account backingAccountInfo];
      [v57 setMcEnableContactsUserOverridable:&__kCFBooleanFalse];
    }
    if (([v13 enableCalendarsUserOverridable] & 1) == 0)
    {
      v58 = [(ASAccount *)self->_account backingAccountInfo];
      [v58 setMcEnableCalendarsUserOverridable:&__kCFBooleanFalse];
    }
    if (([v13 enableRemindersUserOverridable] & 1) == 0)
    {
      v59 = [(ASAccount *)self->_account backingAccountInfo];
      [v59 setMcEnableRemindersUserOverridable:&__kCFBooleanFalse];
    }
    if (([v13 enableNotesUserOverridable] & 1) == 0)
    {
      v60 = [(ASAccount *)self->_account backingAccountInfo];
      [v60 setMcEnableNotesUserOverridable:&__kCFBooleanFalse];
    }
    v61 = [(MCNewPayloadHandler *)self payload];
    v62 = [v61 profile];
    uint64_t v63 = [v62 identifier];

    if (v63)
    {
      v64 = [(ASAccount *)self->_account backingAccountInfo];
      [v64 setMcConfigurationProfileIdentifier:v63];
    }
    else
    {
      v65 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to retrieve profile identifier. Not setting profile identifier account property on Exchange account.", buf, 2u);
      }
    }
    v66 = self->_account;
    v67 = [v13 username];
    [(ASAccount *)v66 setUsername:v67];

    v68 = self->_account;
    v69 = [v13 hostname];
    [(ASAccount *)v68 setHost:v69];

    v70 = self->_account;
    v71 = [v13 useSSL];
    -[ASAccount setUseSSL:](v70, "setUseSSL:", [v71 BOOLValue]);

    v72 = [v13 mailNumberOfPastDaysToSync];

    if (v72)
    {
      v73 = self->_account;
      v74 = [v13 mailNumberOfPastDaysToSync];
      -[ASAccount setMailNumberOfPastDaysToSync:](v73, "setMailNumberOfPastDaysToSync:", [v74 intValue]);
    }
    v152 = (void *)v63;
    v75 = self->_account;
    v76 = [v13 accountDescription];
    [(ASAccount *)v75 setAccountDescription:v76];

    v77 = self->_account;
    v78 = [v13 emailAddress];
    [(ASAccount *)v77 setEmailAddress:v78];

    uint64_t v79 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 mustNotUseSynchronizableCredential]);
    v80 = [(ASAccount *)self->_account backingAccountInfo];
    v150 = (void *)v79;
    [v80 setAccountProperty:v79 forKey:ACAccountPropertyShouldNeverUseSyncableCredential];

    v81 = [v13 useOAuth];
    unsigned int v82 = [v81 BOOLValue];

    v83 = self->_account;
    if (v82)
    {
      [(ASAccount *)self->_account setAccountBoolProperty:1 forKey:kDAExchangeOAuthSupportedKey];
      id v84 = [objc_alloc((Class)ACAccountCredential) initWithOAuth2Token:&stru_1000ECAD0 refreshToken:0 expiryDate:0];
      v85 = self;
      v86 = [(ASAccount *)self->_account backingAccountInfo];
      [v86 setCredential:v84];

      v87 = [v13 OAuthSignInURL];

      if (v87)
      {
        v88 = self->_account;
        v89 = [v13 OAuthSignInURL];
        [(ASAccount *)v88 setAccountProperty:v89 forKey:kDAExchangeOAuthURI];

        v90 = [(MCNewEASAccountPayloadHandler *)self _endPointFQDNForPayload:v13];
        if (v90) {
          [(ASAccount *)self->_account setAccountProperty:v90 forKey:kDAEASEndPointFQDN];
        }
      }
      v91 = [v13 OAuthTokenRequestURL];

      if (!v91)
      {
LABEL_47:
        if ([v13 preventMove])
        {
          v94 = v85->_account;
          id v95 = [v13 preventMove];
          [(ASAccount *)v94 setAccountBoolProperty:v95 forKey:MFMailAccountRestrictMessageTransfersToOtherAccounts];
        }
        if ([v13 preventAppSheet])
        {
          v96 = v85->_account;
          id v97 = [v13 preventAppSheet];
          [(ASAccount *)v96 setAccountBoolProperty:v97 forKey:MFMailAccountRestrictSendingFromExternalProcesses];
        }
        if (![v13 SMIMEEnabled]) {
          goto LABEL_67;
        }
        if (v147) {
          -[ASAccount setSigningIdentityPersistentReference:](v85->_account, "setSigningIdentityPersistentReference:");
        }
        v98 = [v13 SMIMESigningEnabled];
        v99 = v98;
        if (v98)
        {
          v100 = v85->_account;
          uint64_t v101 = (uint64_t)[v98 BOOLValue];
          uint64_t v102 = MFMailAccountSigningEnabled;
          v103 = v100;
        }
        else
        {
          if (!v147) {
            goto LABEL_59;
          }
          v103 = v85->_account;
          uint64_t v102 = MFMailAccountSigningEnabled;
          uint64_t v101 = 1;
        }
        [(ASAccount *)v103 setAccountBoolProperty:v101 forKey:v102];
LABEL_59:
        if (v146) {
          -[ASAccount setEncryptionIdentityPersistentReference:](v85->_account, "setEncryptionIdentityPersistentReference:");
        }
        v104 = [v13 SMIMEEncryptionEnabled];
        v105 = v104;
        if (v104)
        {
          v106 = v85;
          v107 = v85->_account;
          uint64_t v108 = (uint64_t)[v104 BOOLValue];
          uint64_t v109 = MFMailAccountEncryptionEnabled;
          v110 = v107;
        }
        else
        {
          v106 = v85;
          if (!v146)
          {
LABEL_66:
            v111 = v106->_account;
            id v112 = [v13 SMIMEEncryptByDefaultUserOverrideable];
            [(ASAccount *)v111 setAccountBoolProperty:v112 forKey:MFMailAccountEncryptByDefaultUserOverrideable];
            v113 = v106->_account;
            id v114 = [v13 SMIMEPerMessageSwitchEnabled];
            [(ASAccount *)v113 setAccountBoolProperty:v114 forKey:MFMailAccountPerMessageEncryptionEnabled];
            v115 = v106->_account;
            id v116 = [v13 SMIMESigningUserOverrideable];
            [(ASAccount *)v115 setAccountBoolProperty:v116 forKey:MFMailAccountSigningUserOverrideable];
            v117 = v106->_account;
            id v118 = [v13 SMIMESigningIdentityUserOverrideable];
            [(ASAccount *)v117 setAccountBoolProperty:v118 forKey:MFMailAccountSigningIdentityUserOverrideable];
            v85 = v106;
            v119 = v106->_account;
            id v120 = [v13 SMIMEEncryptionIdentityUserOverrideable];
            [(ASAccount *)v119 setAccountBoolProperty:v120 forKey:MFMailAccountEncryptionIdentityUserOverrideable];

LABEL_67:
            if ([v13 syncDefaultFoldersOnly])
            {
              v121 = v85->_account;
              v122 = MCkASSyncDefaultFoldersOnly();
              [(ASAccount *)v121 setAccountBoolProperty:1 forKey:v122];
            }
            if ([v13 isRecentsSyncingDisabled]) {
              [(ASAccount *)v85->_account setAccountBoolProperty:1 forKey:MFMailAccountRestrictRecentsSyncing];
            }
            if ([v13 isMailDropEnabled]) {
              [(ASAccount *)v85->_account setAccountBoolProperty:1 forKey:MFMailAccountSupportsMailDrop];
            }

            self = v85;
LABEL_74:

            id v12 = v146;
            goto LABEL_75;
          }
          v110 = v85->_account;
          uint64_t v109 = MFMailAccountEncryptionEnabled;
          uint64_t v108 = 1;
        }
        [(ASAccount *)v110 setAccountBoolProperty:v108 forKey:v109];
        goto LABEL_66;
      }
      v92 = self->_account;
      v93 = [v13 OAuthTokenRequestURL];
      [(ASAccount *)v92 setAccountProperty:v93 forKey:kDAExchangeTokenRequestURI];
    }
    else
    {
      v85 = self;
      v93 = [v13 password];
      [(ASAccount *)v83 setPassword:v93];
    }

    goto LABEL_47;
  }
LABEL_75:
  if (v11) {
    [(ASAccount *)self->_account setIdentityCertificatePersistentID:v11 managedByProfile:1];
  }
  if (v10)
  {
    id v145 = v11;
    v148 = self;
    v123 = [(MCNewPayloadHandler *)self payload];
    v124 = [v123 emailAddress];
    v155 = [v123 embeddedCertificatePassword];
    v153 = [v123 username];
    v143 = v123;
    v151 = [v123 password];
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    id v144 = v10;
    id obja = v10;
    id v125 = [obja countByEnumeratingWithState:&v158 objects:v170 count:16];
    if (v125)
    {
      id v126 = v125;
      uint64_t v127 = *(void *)v159;
      uint64_t v128 = kMCIDUUIDKey;
      uint64_t v129 = kMCIDResponseKey;
      do
      {
        for (j = 0; j != v126; j = (char *)j + 1)
        {
          if (*(void *)v159 != v127) {
            objc_enumerationMutation(obja);
          }
          v131 = *(void **)(*((void *)&v158 + 1) + 8 * (void)j);
          v132 = [v131 objectForKey:v128];
          v133 = [v131 objectForKey:v129];
          if ([v132 isEqualToString:@"kEASEmailAddressKey"])
          {
            id v134 = v133;

            v124 = v134;
          }
          else if ([v132 isEqualToString:@"kEASCertPasswordKey"])
          {
            id v135 = v133;

            v155 = v135;
          }
          else if ([v132 isEqualToString:@"kEASUsernameKey"])
          {
            id v136 = v133;

            v153 = v136;
          }
          else if ([v132 isEqualToString:@"kEASPasswordKey"])
          {
            id v137 = v133;

            v151 = v137;
          }
          else
          {
            os_log_t v138 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v139 = v138;
              v140 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v167 = v140;
              __int16 v168 = 2114;
              v169 = v132;
              id v149 = v140;
              _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);
            }
          }
        }
        id v126 = [obja countByEnumeratingWithState:&v158 objects:v170 count:16];
      }
      while (v126);
    }

    self = v148;
    [(ASAccount *)v148->_account setEmailAddress:v124];
    [(ASAccount *)v148->_account setUsername:v153];
    [(ASAccount *)v148->_account setPassword:v151];

    id v10 = v144;
    id v11 = v145;
    id v12 = v146;
  }
  v141 = self->_account;

  return v141;
}

- (id)_endPointFQDNForPayload:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSURLComponents);
  uint64_t v5 = [v3 useSSL];
  if ([v5 BOOLValue]) {
    CFStringRef v6 = @"https";
  }
  else {
    CFStringRef v6 = @"http";
  }
  [v4 setScheme:v6];

  uint64_t v7 = [v3 hostname];

  [v4 setHost:v7];
  uint64_t v8 = [v4 string];

  return v8;
}

- (id)_errorFromValidationError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 code];
  if (v4 == (id)102)
  {
    uint64_t v10 = MCDAErrorDomain;
    CFStringRef v6 = MCErrorArray();
    uint64_t v7 = MCLocalizedErrorString();
    uint64_t v8 = MCUSEnglishErrorString();
    +[NSError MCErrorWithDomain:v10 code:18002 descriptionArray:v6 suggestion:v7 USEnglishSuggestion:v8 underlyingError:v3 errorType:MCErrorTypeRetryable];
  }
  else if (v4 == (id)101)
  {
    uint64_t v11 = MCDAErrorDomain;
    CFStringRef v6 = MCErrorArray();
    uint64_t v7 = MCLocalizedErrorString();
    uint64_t v8 = MCUSEnglishErrorString();
    +[NSError MCErrorWithDomain:v11 code:18001 descriptionArray:v6 suggestion:v7 USEnglishSuggestion:v8 underlyingError:v3 errorType:MCErrorTypeSkippable];
  }
  else
  {
    if (v4 == (id)100)
    {
      uint64_t v5 = MCDAErrorDomain;
      CFStringRef v6 = MCErrorArray();
      uint64_t v7 = MCLocalizedErrorString();
      uint64_t v8 = MCUSEnglishErrorString();
      uint64_t v9 = &MCErrorTypeSkippable;
    }
    else
    {
      id v12 = [v3 localizedDescription];
      id v13 = [v12 length];

      uint64_t v5 = MCDAErrorDomain;
      CFStringRef v6 = MCErrorArray();
      if (v13)
      {
        id v14 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v5, 18000, v6, v3, MCErrorTypeFatal, 0);
        goto LABEL_12;
      }
      uint64_t v7 = MCLocalizedErrorString();
      uint64_t v8 = MCUSEnglishErrorString();
      uint64_t v9 = &MCErrorTypeFatal;
    }
    +[NSError MCErrorWithDomain:v5 code:18000 descriptionArray:v6 suggestion:v7 USEnglishSuggestion:v8 underlyingError:v3 errorType:*v9];
  id v14 = };

LABEL_12:

  return v14;
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  os_log_t v10 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    id v12 = [v9 MCVerboseDescription];
    int v15 = 138543874;
    id v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    __int16 v19 = 2114;
    id v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "account %{public}@ is valid %d with error %{public}@", (uint8_t *)&v15, 0x1Cu);
  }
  if (!v9 && !v6)
  {
    id v9 = +[NSError errorWithDomain:DAAccountValidationDomain code:102 userInfo:0];
  }
  id v13 = [(MCNewEASAccountPayloadHandler *)self accountValidationCompletionHandler];

  if (v13)
  {
    id v14 = [(MCNewEASAccountPayloadHandler *)self accountValidationCompletionHandler];
    ((void (**)(void, id))v14)[2](v14, v9);

    [(MCNewEASAccountPayloadHandler *)self setAccountValidationCompletionHandler:0];
  }
}

- (void)_preflightWithAccount:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [(MCNewEASAccountPayloadHandler *)self setAccountValidationCompletionHandler:a4];
  sharedDAAccountStore();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = dataaccess_get_global_queue();
  [v6 checkValidityOnAccountStore:v8 withConsumer:self inQueue:v7];
}

- (id)_preflightTimePersistentIDForIdentityCertificateUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MCNewPayloadHandler *)self payload];
  id v8 = [v7 certificateUUID];

  if (v8)
  {
    id v9 = [(MCNewPayloadHandler *)self profileHandler];
    os_log_t v10 = [v7 certificateUUID];
    uint64_t v11 = [v9 payloadHandlerWithUUID:v10];

    if (v11)
    {
      id v42 = 0;
      id v12 = [v11 copyIdentityImmediatelyWithInteractionClient:0 outError:&v42];
      id v13 = v42;
      id v14 = 0;
      if (!v13 && v12)
      {
        v38 = a4;
        id v40 = v6;
        id v15 = [v11 accessibility];
        id v16 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v44 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Preflighting EAS identity, storing with accessibility %@", buf, 0xCu);
        }
        __int16 v17 = [v7 UUID];
        uint64_t v18 = kMCAppleIdentitiesKeychainGroup;
        __int16 v19 = [(MCNewPayloadHandler *)self profileHandler];
        id v20 = [v19 profile];
        +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v12, v17, v18, [v20 isInstalledForSystem], v15);
        id v14 = (id)objc_claimAutoreleasedReturnValue();

        id v21 = [v7 UUID];
        [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v14 andUUID:v21];

        CFRelease(v12);
        id v13 = 0;
        a4 = v38;
        id v6 = v40;
      }
    }
    else
    {
      id v13 = 0;
      id v14 = 0;
    }
  }
  else
  {
    BOOL v22 = [v7 embeddedCertificate];

    if (!v22)
    {

      id v14 = 0;
LABEL_18:
      id v14 = v14;
      id v13 = 0;
      id v36 = v14;
      goto LABEL_20;
    }
    uint64_t v11 = [v7 embeddedCertificate];
    unsigned int v23 = [v7 embeddedCertificatePassword];
    long long v24 = +[MCNewPayloadHandler prioritizeUserInput:v6 key:@"kEASCertPasswordKey" overField:v23];

    uint64_t v25 = MCKeychainCopyIdentityFromPKCS12();
    if (v25)
    {
      long long v26 = (const void *)v25;
      long long v27 = [v7 UUID];
      uint64_t v28 = kMCAppleIdentitiesKeychainGroup;
      [(MCNewPayloadHandler *)self profileHandler];
      v39 = v11;
      v29 = id v41 = v6;
      [v29 profile];
      __int16 v30 = v24;
      id v32 = v31 = a4;
      +[MCKeychain saveItem:withLabel:group:useSystemKeychain:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:", v26, v27, v28, [v32 isInstalledForSystem]);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      a4 = v31;
      long long v24 = v30;

      uint64_t v11 = v39;
      id v6 = v41;

      uint64_t v33 = [v7 UUID];
      [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v14 andUUID:v33];

      CFRelease(v26);
      id v13 = 0;
    }
    else
    {
      uint64_t v34 = MCEASErrorDomain;
      id v35 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v34, 21006, v35, MCErrorTypeFatal, 0);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      id v14 = 0;
    }
  }
  if (!v13) {
    goto LABEL_18;
  }
  if (a4)
  {
    id v13 = v13;
    id v36 = 0;
    *a4 = v13;
  }
  else
  {
    id v36 = 0;
  }
LABEL_20:

  return v36;
}

- (id)_installTimePersistentIDForIdentityCertificateOutError:(id *)a3
{
  uint64_t v5 = [(MCNewPayloadHandler *)self payload];
  id v6 = [v5 certificateUUID];

  if (v6)
  {
    uint64_t v7 = [(MCNewPayloadHandler *)self profileHandler];
    id v8 = [v5 certificateUUID];
    id v9 = [v7 persistentIDForCertificateUUID:v8];

LABEL_3:
    id v10 = 0;
    goto LABEL_4;
  }
  id v12 = [v5 embeddedCertificate];

  if (!v12)
  {
    id v9 = 0;
    goto LABEL_3;
  }
  id v13 = [v5 embeddedCertificate];
  id v14 = [v5 embeddedCertificatePassword];
  uint64_t v15 = MCKeychainCopyIdentityFromPKCS12();
  if (v15)
  {
    id v16 = (const void *)v15;
    uint64_t v25 = v14;
    long long v26 = v13;
    __int16 v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v28 = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Storing embedded identity for EAS, storing with accessibility %@", buf, 0xCu);
    }
    uint64_t v18 = [v5 UUID];
    uint64_t v19 = kMCAppleIdentitiesKeychainGroup;
    id v20 = [(MCNewPayloadHandler *)self profileHandler];
    id v21 = [v20 profile];
    id v9 = +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v16, v18, v19, [v21 isInstalledForSystem], kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly);

    BOOL v22 = [v5 UUID];
    [(MCNewPayloadHandler *)self _touchDependencyBetweenPersistentID:v9 andUUID:v22];

    CFRelease(v16);
    id v10 = 0;
    id v14 = v25;
    id v13 = v26;
  }
  else
  {
    uint64_t v23 = MCEASErrorDomain;
    long long v24 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v23, 21006, v24, MCErrorTypeFatal, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    id v9 = 0;
  }

  if (a3 && v10)
  {
    id v10 = v10;
    *a3 = v10;
  }
LABEL_4:

  return v9;
}

- (BOOL)_isConfiguredWithSCEP
{
  v2 = [(MCNewPayloadHandler *)self payload];
  id v3 = [v2 certificateUUID];

  if (!v3) {
    goto LABEL_4;
  }
  uint64_t v4 = [v2 profile];
  uint64_t v5 = [v2 certificateUUID];
  id v6 = [(id)v4 payloadWithUUID:v5];

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4) {
    BOOL v7 = 1;
  }
  else {
LABEL_4:
  }
    BOOL v7 = 0;

  return v7;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(MCNewPayloadHandler *)self payload];
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_1000717B4;
  id v35 = sub_1000717C4;
  id v36 = 0;
  if ([(MCNewEASAccountPayloadHandler *)self _isConfiguredWithSCEP])
  {
    id v8 = 0;
    id v9 = 0;
    id v10 = 0;
    goto LABEL_17;
  }
  uint64_t v11 = (id *)(v32 + 5);
  id obj = (id)v32[5];
  id v8 = [(MCNewEASAccountPayloadHandler *)self _preflightTimePersistentIDForIdentityCertificateUserInputResponses:v6 outError:&obj];
  objc_storeStrong(v11, obj);
  if (v32[5])
  {
    id v10 = 0;
    id v9 = 0;
    goto LABEL_15;
  }
  if (v8)
  {
    id v12 = [v7 UUID];
    [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v8 andUUID:v12];
  }
  if (![v7 SMIMEEnabled])
  {
    id v10 = 0;
    id v9 = 0;
LABEL_11:
    uint64_t v15 = [(MCNewEASAccountPayloadHandler *)self _accountFromPayloadWithUserInputResponses:v6 identityPersistentID:v8 SMIMESigningIdentityPersistentID:v9 SMIMEEncryptionIdentityPersistentID:v10];
    if (v15)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000717CC;
      v25[3] = &unk_1000EB5F0;
      long long v27 = &v31;
      id v16 = dispatch_semaphore_create(0);
      long long v26 = v16;
      [(MCNewEASAccountPayloadHandler *)self _preflightWithAccount:v15 completionHandler:v25];
      dispatch_time_t v17 = dispatch_time(0, 30000000000);
      dispatch_semaphore_wait(v16, v17);
      uint64_t v18 = v26;
    }
    else
    {
      id v16 = MCErrorArray();
      uint64_t v19 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCEASErrorDomain, 21004, v16, MCErrorTypeFatal, 0);
      uint64_t v18 = v32[5];
      v32[5] = v19;
    }

    goto LABEL_15;
  }
  id v13 = [v7 SMIMESigningIdentityUUID];
  id v14 = (id *)(v32 + 5);
  id v29 = (id)v32[5];
  id v9 = [(MCNewPayloadHandler *)self _temporaryPersistentIDForIdentityUUID:v13 outError:&v29];
  objc_storeStrong(v14, v29);

  if (v32[5])
  {
    id v10 = 0;
    goto LABEL_15;
  }
  uint64_t v23 = [v7 SMIMEEncryptionIdentityUUID];
  long long v24 = (id *)(v32 + 5);
  id v28 = (id)v32[5];
  id v10 = [(MCNewPayloadHandler *)self _temporaryPersistentIDForIdentityUUID:v23 outError:&v28];
  objc_storeStrong(v24, v28);

  if (!v32[5]) {
    goto LABEL_11;
  }
LABEL_15:
  if (v8)
  {
    id v20 = [v7 UUID];
    [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v8 andUUID:v20];
  }
LABEL_17:
  if (a4 && v32[5])
  {
    id v21 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCEASErrorDomain, 21007, v21, v32[5], MCErrorTypeSkippable, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v31, 8);

  return 1;
}

- (id)_errorFromPolicyPreflightError:(id)a3
{
  id v3 = a3;
  int v4 = MCEASOverSimplifiedStatusForError();
  uint64_t v5 = _MCLogObjects[0];
  BOOL v6 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR);
  if (v4 == 1)
  {
    if (v6)
    {
      int v13 = 138543362;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Got a network error during policy preflight: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v7 = MCEASErrorDomain;
    id v8 = MCLocalizedErrorString();
    id v9 = +[NSArray arrayWithObject:v8];
    id v10 = &MCErrorTypeSkippable;
  }
  else
  {
    if (v6)
    {
      int v13 = 138543362;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Got an unknown error back from my policy preflight: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v7 = MCEASErrorDomain;
    id v8 = MCLocalizedErrorString();
    id v9 = +[NSArray arrayWithObject:v8];
    id v10 = &MCErrorTypeFatal;
  }
  uint64_t v11 = +[NSError MCErrorWithDomain:v7 code:21000 descriptionArray:v9 underlyingError:v3 errorType:*v10];

  return v11;
}

- (void)_preflightWithPreflighter:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  account = self->_account;
  id v9 = +[DASharedAccountProperties DAAccountDoNotSaveReason];
  [(ASAccount *)account setAccountProperty:@"Preflighting for payload handler" forKey:v9];

  [v6 setDelegate:self];
  [v6 startPreflight];
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100071B58;
  v11[3] = &unk_1000EC050;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [(MCNewEASAccountPayloadHandler *)self setPreflightCompletionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)_getClientRestrictionsFromServerCertificatePersistentID:(id)a3 SMIMESigningIdentityPersistentID:(id)a4 SMIMEEncryptionIdentityPersistentID:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc((Class)MCASPolicyPreflighterClass());
  id v14 = [(MCNewEASAccountPayloadHandler *)self _accountFromPayloadWithUserInputResponses:0 identityPersistentID:v10 SMIMESigningIdentityPersistentID:v11 SMIMEEncryptionIdentityPersistentID:v12];
  id v15 = [v13 initWithAccount:v14 policyKey:0];

  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_1000717B4;
  uint64_t v37 = sub_1000717C4;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = sub_1000717B4;
  uint64_t v31 = sub_1000717C4;
  id v32 = 0;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071E8C;
  block[3] = &unk_1000EC078;
  block[4] = self;
  id v17 = v15;
  id v23 = v17;
  uint64_t v25 = &v27;
  long long v26 = &v33;
  uint64_t v18 = v16;
  long long v24 = v18;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_time_t v19 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v18, v19);
  [v17 invalidate];
  if (a6) {
    *a6 = (id) v34[5];
  }
  id v20 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

- (BOOL)stageForInstallationWithInstaller:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  id v6 = [(MCNewPayloadHandler *)self payload];
  if ([(MCNewEASAccountPayloadHandler *)self _isConfiguredWithSCEP])
  {
    id v7 = 0;
    id v8 = 0;
    id v9 = 0;
LABEL_24:
    BOOL v28 = 1;
    goto LABEL_25;
  }
  id v47 = 0;
  id v9 = [(MCNewEASAccountPayloadHandler *)self _preflightTimePersistentIDForIdentityCertificateUserInputResponses:0 outError:&v47];
  id v10 = v47;
  if (v10)
  {
    id v11 = v10;
    id v7 = 0;
    id v8 = 0;
    goto LABEL_18;
  }
  if (v9)
  {
    id v12 = [(MCNewPayloadHandler *)self payload];
    id v13 = [v12 UUID];
    [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v9 andUUID:v13];
  }
  if (![v6 SMIMEEnabled])
  {
    id v7 = 0;
    id v8 = 0;
LABEL_11:
    id v44 = 0;
    id v15 = [(MCNewEASAccountPayloadHandler *)self _getClientRestrictionsFromServerCertificatePersistentID:v9 SMIMESigningIdentityPersistentID:v8 SMIMEEncryptionIdentityPersistentID:v7 outError:&v44];
    id v11 = v44;
    if (!v11)
    {
      if (v15)
      {
        id v42 = [(MCNewEASAccountPayloadHandler *)self _accountFromPayloadWithUserInputResponses:0 identityPersistentID:v9 SMIMESigningIdentityPersistentID:v8 SMIMEEncryptionIdentityPersistentID:v7];
        dispatch_semaphore_t v16 = [v6 profile];
        BOOL v40 = [v16 installType] != (id)2;

        id v38 = [(MCNewPayloadHandler *)self profileHandler];
        id v36 = [v38 profile];
        id v17 = [v36 identifier];
        uint64_t v18 = [(MCNewPayloadHandler *)self profileHandler];
        dispatch_time_t v19 = [v18 profile];
        id v20 = [v19 UUID];
        id v41 = +[NSString stringWithFormat:@"%@-%@", v17, v20];

        id v32 = +[MCRestrictionManagerWriter sharedManager];
        uint64_t v35 = kEASAccountClientType;
        uint64_t v34 = [v42 persistentUUID];
        v39 = [(MCNewPayloadHandler *)self payload];
        uint64_t v37 = [v39 friendlyName];
        uint64_t v31 = MCLocalizedFormat();
        uint64_t v33 = [(MCNewPayloadHandler *)self payload];
        id v21 = [v33 friendlyName];
        BOOL v22 = MCLocalizedFormat();
        id v43 = 0;
        LOBYTE(v30) = 0;
        [v32 setClientRestrictions:v15 overrideRestrictions:0 appsAndOptions:0 system:v40 clientType:v35 clientUUID:v34 sender:v41 localizedClientDescription:v31 localizedWarning:v22 shouldRecomputeNag:v30 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:&v43];
        id v11 = v43;
      }
      else
      {
        id v11 = 0;
      }
    }

    goto LABEL_18;
  }
  id v14 = [v6 SMIMESigningIdentityUUID];
  id v46 = 0;
  id v8 = [(MCNewPayloadHandler *)self _temporaryPersistentIDForIdentityUUID:v14 outError:&v46];
  id v11 = v46;

  if (v11)
  {
    id v7 = 0;
    goto LABEL_18;
  }
  id v23 = [v6 SMIMEEncryptionIdentityUUID];
  id v45 = 0;
  id v7 = [(MCNewPayloadHandler *)self _temporaryPersistentIDForIdentityUUID:v23 outError:&v45];
  id v11 = v45;

  if (!v11) {
    goto LABEL_11;
  }
LABEL_18:
  if (v9)
  {
    long long v24 = [v6 UUID];
    [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v9 andUUID:v24];
  }
  if (!v11) {
    goto LABEL_24;
  }
  os_log_t v25 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    long long v26 = v25;
    uint64_t v27 = [v11 MCVerboseDescription];
    *(_DWORD *)buf = 138543362;
    v49 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error retrieving server policy for account. Error: %{public}@", buf, 0xCu);
  }
  BOOL v28 = 0;
LABEL_25:

  return v28;
}

- (void)unstageFromInstallationWithInstaller:(id)a3
{
  if (![(MCNewEASAccountPayloadHandler *)self _isConfiguredWithSCEP])
  {
    int v4 = [(MCNewPayloadHandler *)self payload];
    uint64_t v5 = [(MCNewEASAccountPayloadHandler *)self _preflightTimePersistentIDForIdentityCertificateUserInputResponses:0 outError:0];
    id v6 = 0;
    id v7 = 0;
    if ([v4 SMIMEEnabled])
    {
      id v8 = [v4 SMIMESigningIdentityUUID];
      id v7 = [(MCNewPayloadHandler *)self _temporaryPersistentIDForIdentityUUID:v8 outError:0];

      id v9 = [v4 SMIMEEncryptionIdentityUUID];
      id v6 = [(MCNewPayloadHandler *)self _temporaryPersistentIDForIdentityUUID:v9 outError:0];
    }
    if (v5)
    {
      id v10 = [v4 UUID];
      [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v5 andUUID:v10];
    }
    id v11 = [(MCNewEASAccountPayloadHandler *)self _accountFromPayloadWithUserInputResponses:0 identityPersistentID:v5 SMIMESigningIdentityPersistentID:v7 SMIMEEncryptionIdentityPersistentID:v6];
    id v12 = [(MCNewPayloadHandler *)self payload];
    id v13 = [v12 profile];
    id v14 = [v13 installType];

    if (v11)
    {
      BOOL v29 = v14 != (id)2;
      id v15 = [(MCNewPayloadHandler *)self profileHandler];
      [v15 profile];
      dispatch_semaphore_t v16 = v31 = v7;
      id v17 = [v16 identifier];
      [(MCNewPayloadHandler *)self profileHandler];
      v18 = id v32 = v4;
      [v18 profile];
      dispatch_time_t v19 = v30 = v6;
      id v20 = [v19 UUID];
      id v21 = +[NSString stringWithFormat:@"%@-%@", v17, v20];

      id v7 = v31;
      BOOL v22 = +[MCRestrictionManagerWriter sharedManager];
      uint64_t v23 = kEASAccountClientType;
      long long v24 = [v11 persistentUUID];
      LOBYTE(v28) = 1;
      uint64_t v25 = v23;
      int v4 = v32;
      [v22 setClientRestrictions:0 overrideRestrictions:0 appsAndOptions:0 system:v29 clientType:v25 clientUUID:v24 sender:v21 localizedClientDescription:0 localizedWarning:0 shouldRecomputeNag:v28 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:0];

      id v6 = v30;
    }
    else
    {
      long long v26 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Could not find an account, so could not set client restrictions.", buf, 2u);
      }
    }
    if (v5)
    {
      uint64_t v27 = [v4 UUID];
      [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v5 andUUID:v27];
    }
  }
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v75 = a3;
  id v9 = a4;
  id v73 = a5;
  id v10 = [(MCNewPayloadHandler *)self payload];
  uint64_t v93 = 0;
  v94 = (id *)&v93;
  uint64_t v95 = 0x3032000000;
  v96 = sub_1000717B4;
  id v97 = sub_1000717C4;
  id v98 = 0;
  id v11 = [v9 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
  unsigned int v12 = [v11 BOOLValue];

  if (!v12)
  {
    v76 = 0;
    goto LABEL_5;
  }
  uint64_t v13 = kMDMPersonaKey;
  id v14 = [v9 objectForKeyedSubscript:kMDMPersonaKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v76 = [v9 objectForKeyedSubscript:v13];
  }
  else
  {
    v76 = 0;
  }

  uint64_t v15 = kMCInstallProfileOptionManagingProfileIdentifier;
  dispatch_semaphore_t v16 = [v9 objectForKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v74 = 0;
    goto LABEL_11;
  }
  uint64_t v17 = [v9 objectForKeyedSubscript:v15];

  if (!v17)
  {
LABEL_5:
    v74 = 0;
    goto LABEL_12;
  }
  uint64_t v18 = +[ACAccountStore defaultStore];
  dispatch_time_t v19 = [v18 dmc_remoteManagementAccountForManagementProfileIdentifier:v17];

  v74 = [v19 identifier];

  dispatch_semaphore_t v16 = (void *)v17;
LABEL_11:

LABEL_12:
  id v20 = [v10 hostname];
  if (v20)
  {

LABEL_15:
    uint64_t v23 = v94;
    id v92 = v94[5];
    long long v24 = [(MCNewEASAccountPayloadHandler *)self _installTimePersistentIDForIdentityCertificateOutError:&v92];
    objc_storeStrong(v23 + 5, v92);
    if (v94[5])
    {
      uint64_t v25 = 0;
      long long v26 = 0;
LABEL_50:
      if (v24)
      {
        v66 = [v10 UUID];
        [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v24 andUUID:v66];
      }
      if (v25)
      {
        v67 = [v10 UUID];
        [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v25 andUUID:v67];
      }
      if (v26)
      {
        v68 = [v10 UUID];
        [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v26 andUUID:v68];
      }
      goto LABEL_56;
    }
    if ([v10 SMIMEEnabled])
    {
      uint64_t v27 = [(MCNewPayloadHandler *)self profileHandler];
      uint64_t v28 = [v10 SMIMESigningIdentityUUID];
      uint64_t v25 = [v27 persistentIDForCertificateUUID:v28];

      BOOL v29 = [(MCNewPayloadHandler *)self profileHandler];
      uint64_t v30 = [v10 SMIMEEncryptionIdentityUUID];
      long long v26 = [v29 persistentIDForCertificateUUID:v30];
    }
    else
    {
      long long v26 = 0;
      uint64_t v25 = 0;
    }
    uint64_t v34 = [(MCNewEASAccountPayloadHandler *)self _accountFromPayloadWithUserInputResponses:0 identityPersistentID:v24 SMIMESigningIdentityPersistentID:v25 SMIMEEncryptionIdentityPersistentID:v26];
    uint64_t v35 = v34;
    if (v34)
    {
      if (v12)
      {
        [v34 setAccountBoolProperty:1 forKey:@"MCAccountIsManaged"];
        if (v74) {
          [v35 setAccountProperty:v74 forKey:ACAccountPropertyRemoteManagingAccountIdentifier];
        }
      }
      if ([v10 overridePreviousPassword])
      {
        id v36 = [v35 backingAccountInfo];
        [v36 setAccountProperty:&__kCFBooleanFalse forKey:@"EASPayloadShouldPreserveOldPassword"];

        uint64_t v37 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "EAS Payload asked to override old password", buf, 2u);
        }
      }
      else
      {
        id v41 = [v35 backingAccountInfo];
        [v41 setAccountProperty:&__kCFBooleanTrue forKey:@"EASPayloadShouldPreserveOldPassword"];
      }
      v71 = +[MDMConfiguration sharedConfiguration];
      if (([v71 isUserEnrollment] & 1) != 0
        || ([v10 profile],
            id v42 = objc_claimAutoreleasedReturnValue(),
            unsigned int v43 = [v42 isUserEnrollmentProfile],
            v42,
            v43))
      {
        id v44 = [v71 easEnrollmentID];
        id v45 = MCkESExchangeDeviceID();
        [v35 setObject:v44 forKeyedSubscript:v45];

        id v46 = MCkESExchangeAccountWipeOnly();
        [v35 setObject:&__kCFBooleanTrue forKeyedSubscript:v46];

        [v35 setAccountProperty:v76 forKey:ACAccountPropertyPersonaIdentifier];
        id v47 = MCkESExchangeUserEnrollmentMode();
        [v35 setObject:&__kCFBooleanTrue forKeyedSubscript:v47];
      }
      int v48 = [v35 backingAccountInfo];
      [(MCACAccountPayloadHandler *)self markIfUpdatingOverInstalledAccount:v48];

      *(void *)buf = 0;
      v87 = buf;
      uint64_t v88 = 0x3032000000;
      v89 = sub_1000717B4;
      v90 = sub_1000717C4;
      dispatch_semaphore_t v91 = dispatch_semaphore_create(0);
      uint64_t v82 = 0;
      v83 = &v82;
      uint64_t v84 = 0x2020000000;
      char v85 = 1;
      v49 = [v75 setAsideAccountIdentifiersForPayloadClass:objc_opt_class()];
      if ([v49 count])
      {
        v50 = [v35 backingAccountInfo];
        v51 = +[DASharedAccountProperties DAAccountIdentifiersToIgnoreForUniquenessCheck];
        [v50 setAccountProperty:v49 forKey:v51];
      }
      v52 = sharedDAAccountStore();
      uint64_t v53 = [v35 backingAccountInfo];
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_10007323C;
      v81[3] = &unk_1000EBE98;
      v81[4] = &v82;
      v81[5] = buf;
      [v52 canSaveAccount:v53 withCompletionHandler:v81];

      dispatch_semaphore_wait(*((dispatch_semaphore_t *)v87 + 5), 0xFFFFFFFFFFFFFFFFLL);
      if (*((unsigned char *)v83 + 24))
      {
        objc_super v54 = [v35 backingAccountInfo];
        [v54 setAuthenticated:1];

        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_100073258;
        v77[3] = &unk_1000EAF68;
        uint64_t v79 = buf;
        id v78 = v35;
        v80 = &v93;
        v55 = objc_retainBlock(v77);
        if ([v76 length]) {
          id v56 = +[DMCPersonaHelper performBlockUnderPersona:v76 block:v55];
        }
        else {
          ((void (*)(void *))v55[2])(v55);
        }

        v57 = v78;
      }
      else
      {
        v57 = MCErrorArray();
        v58 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCEASErrorDomain, 21005, v57, MCErrorTypeFatal, 0);
        id v59 = [v58 MCCopyAsPrimaryError];
        id v60 = v94[5];
        v94[5] = v59;
      }
      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v38 = MCErrorArray();
      uint64_t v39 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCEASErrorDomain, 21004, v38, MCErrorTypeFatal, 0);
      v71 = (void *)v38;
      id v40 = v94[5];
      v94[5] = (id)v39;
    }
    v61 = [v35 backingAccountInfo];
    v62 = [v61 identifier];
    [v10 setAcAccountIdentifier:v62];

    if (v24)
    {
      uint64_t v63 = [v10 UUID];
      [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v24 andUUID:v63];
    }
    if (v25)
    {
      v64 = [v10 UUID];
      [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v25 andUUID:v64];
    }
    if (v26)
    {
      v65 = [v10 UUID];
      [(MCNewPayloadHandler *)self _retainDependencyBetweenPersistentID:v26 andUUID:v65];
    }
    if (v94[5]) {
      goto LABEL_50;
    }
LABEL_59:
    [v10 setCertificatePersistentID:v24];
    [v10 setSMIMESigningIdentityPersistentID:v25];
    [v10 setSMIMEEncryptionIdentityPersistentID:v26];
    BOOL v69 = 1;
    goto LABEL_60;
  }
  id v21 = [v10 useOAuth];
  unsigned __int8 v22 = [v21 BOOLValue];

  if (v22) {
    goto LABEL_15;
  }
  uint64_t v31 = MCErrorArray();
  uint64_t v32 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCEASErrorDomain, 21003, v31, MCErrorTypeFatal, 0);
  id v33 = v94[5];
  v94[5] = (id)v32;

  long long v26 = 0;
  uint64_t v25 = 0;
  long long v24 = 0;
  if (!v94[5]) {
    goto LABEL_59;
  }
LABEL_56:
  BOOL v69 = 0;
  if (a6) {
    *a6 = v94[5];
  }
LABEL_60:

  _Block_object_dispose(&v93, 8);
  return v69;
}

- (id)accountTypeIdentifiers
{
  v4[0] = ACAccountTypeIdentifierExchange;
  v4[1] = ACAccountTypeIdentifierHotmail;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (BOOL)isInstalled
{
  v2 = [(MCACAccountPayloadHandler *)self _installedDAAccount];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCNewEASAccountPayloadHandler;
  [(MCNewPayloadHandler *)&v12 setAsideWithInstaller:v4];
  uint64_t v5 = [(MCACAccountPayloadHandler *)self _installedDAAccount];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 backingAccountInfo];
    [(MCACAccountPayloadHandler *)self setSetAsideAccount:v7];

    id v8 = [v6 backingAccountInfo];
    id v9 = [v8 credential];
    [(MCNewEASAccountPayloadHandler *)self setSetAsideAccountCredential:v9];

    [(MCNewEASAccountPayloadHandler *)self setSetAsideDAAccount:v6];
    id v10 = [v6 backingAccountInfo];
    id v11 = [v10 identifier];
    [v4 addSetAsideAccountIdentifier:v11 forPayloadClass:objc_opt_class()];
  }
}

- (void)unsetAside
{
  id v14 = +[MDMCloudConfiguration sharedConfiguration];
  if ([v14 userMode] == 1)
  {
    BOOL v3 = [(MCACAccountPayloadHandler *)self setAsideAccount];

    if (v3)
    {
      id v4 = [(MCACAccountPayloadHandler *)self _installedDAAccount];
      uint64_t v5 = [(MCACAccountPayloadHandler *)self setAsideAccount];
      id v6 = [v5 accountPropertyForKey:@"MCAccountIdentifer"];

      id v7 = [v4 backingAccountInfo];
      id v8 = [v7 accountPropertyForKey:@"MCAccountIdentifer"];

      if (v6 && (!v8 || ([v6 isEqualToString:v8] & 1) == 0))
      {
        id v9 = [(MCACAccountPayloadHandler *)self setAsideAccount];
        [v9 markAllPropertiesDirty];
        dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
        id v11 = sharedDAAccountStore();
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000737EC;
        v15[3] = &unk_1000EBEC0;
        id v16 = v9;
        dispatch_semaphore_t v17 = v10;
        objc_super v12 = v10;
        id v13 = v9;
        [v11 saveVerifiedAccount:v13 withCompletionHandler:v15];

        dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      }
      [(MCACAccountPayloadHandler *)self setSetAsideAccount:0];
      [(MCNewEASAccountPayloadHandler *)self setSetAsideAccountCredential:0];
    }
  }
  else
  {
  }
}

- (void)remove
{
  BOOL v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v4 = [v3 isSetAside];

  if (v4)
  {
    objc_super v54 = [(MCNewEASAccountPayloadHandler *)self setAsideDAAccount];
    uint64_t v53 = [(MCNewEASAccountPayloadHandler *)self setAsideAccountCredential];
    uint64_t v5 = +[MDMCloudConfiguration sharedConfiguration];
    unsigned int v6 = [v5 userMode];

    if (v6 == 1)
    {
      id v7 = [(MCACAccountPayloadHandler *)self _installedSetAsideACAccount];
      id v8 = [(MCACAccountPayloadHandler *)self setAsideAccount];
      id v9 = [v8 accountPropertyForKey:@"MCNativeAccountIdentifer"];
      dispatch_semaphore_t v10 = [v7 accountPropertyForKey:@"MCNativeAccountIdentifer"];
      unsigned int v11 = [v9 isEqualToString:v10];

      if (v11)
      {
        id v52 = v7;
      }
      else
      {
        id v14 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v63 = (MCNewEASAccountPayloadHandler *)"-[MCNewEASAccountPayloadHandler remove]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s On Shared iPad, and current payload doesn't own any ACAccount.", buf, 0xCu);
        }
        id v52 = 0;
      }

      int v13 = v11 ^ 1;
    }
    else
    {
      id v52 = [v54 backingAccountInfo];
      int v13 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = [(MCACAccountPayloadHandler *)self updatedOverInstalledAccount];
    objc_super v54 = [(MCACAccountPayloadHandler *)self _installedDAAccount];
    if (v12)
    {
      int v13 = 0;
      id v52 = 0;
      uint64_t v53 = 0;
    }
    else
    {
      id v52 = [v54 backingAccountInfo];
      int v13 = 0;
      uint64_t v53 = 0;
    }
  }
  if (v54)
  {
    if (v53)
    {
      if (v13) {
        [(MCACAccountPayloadHandler *)self _installedSetAsideACAccount];
      }
      else {
      uint64_t v15 = [(MCNewEASAccountPayloadHandler *)self _installedACAccountOtherThanSelf];
      }
      id v16 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v15];
      dispatch_semaphore_t v17 = [v15 credential];
      uint64_t v18 = [v16 backingAccountInfo];
      dispatch_time_t v19 = [v18 accountPropertyForKey:@"EASPayloadShouldPreserveOldPassword"];
      unsigned int v20 = [v19 BOOLValue];

      os_log_t v21 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        unsigned __int8 v22 = v21;
        uint64_t v23 = [(MCNewEASAccountPayloadHandler *)self setAsideDAAccount];
        long long v24 = [v23 backingAccountInfo];
        *(_DWORD *)buf = 134219522;
        uint64_t v63 = self;
        __int16 v64 = 2080;
        v65 = "-[MCNewEASAccountPayloadHandler remove]";
        __int16 v66 = 2112;
        v67 = v53;
        __int16 v68 = 2112;
        BOOL v69 = v15;
        __int16 v70 = 1024;
        unsigned int v71 = v20;
        __int16 v72 = 2112;
        id v73 = v24;
        __int16 v74 = 1024;
        int v75 = v13;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%p %s - accountCredential %@, installedAccount %@ shouldPreservePassword %d setAsideDAAccount %@ lostAccountOwnership %d", buf, 0x40u);
      }
      if ((v13 & v20 & 1) != 0
        || (!v16 ? (char v25 = 1) : (char v25 = v13),
            (v25 & 1) == 0
         && ([(MCNewEASAccountPayloadHandler *)self setAsideDAAccount],
             long long v26 = objc_claimAutoreleasedReturnValue(),
             unsigned int v27 = [v26 isConsideredTheSame:v16],
             v26,
             v27)))
      {
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_10007414C;
        v56[3] = &unk_1000EC0C8;
        id v57 = v15;
        char v61 = v20;
        id v58 = v16;
        id v59 = v53;
        id v60 = v17;
        v51 = objc_retainBlock(v56);
      }
      else
      {
        v51 = 0;
      }
    }
    else
    {
      v51 = 0;
    }
    uint64_t v28 = [(MCNewPayloadHandler *)self payload];
    BOOL v29 = [v28 certificatePersistentID];
    if (v29)
    {
      uint64_t v30 = [v28 UUID];
      [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v29 andUUID:v30];
    }
    else
    {
      [v54 removeClientCertificateData];
    }
    uint64_t v31 = [v28 SMIMESigningIdentityPersistentID];
    if (v31)
    {
      uint64_t v32 = [v28 UUID];
      [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v31 andUUID:v32];
    }
    id v33 = [v28 SMIMEEncryptionIdentityPersistentID];
    if (v33)
    {
      uint64_t v34 = [v28 UUID];
      [(MCNewPayloadHandler *)self _releaseDependencyBetweenPersistentID:v33 andUUID:v34];
    }
    if (v52)
    {
      +[MCFeatureOverrides accountRemovalTimeoutWithDefaultValue:600.0];
      -[MCACAccountPayloadHandler _synchronouslyDeleteAccountAndAssociatedData:timeout:completion:](self, "_synchronouslyDeleteAccountAndAssociatedData:timeout:completion:", v52, v51);
    }
    else if (v51)
    {
      ((void (*)(void *, uint64_t, void))v51[2])(v51, 1, 0);
    }

    uint64_t v35 = +[MCRestrictionManagerWriter sharedManager];
    id v36 = [(MCNewPayloadHandler *)self payload];
    uint64_t v37 = [v36 profile];
    id v38 = [v37 installType];

    uint64_t v39 = [(MCNewPayloadHandler *)self profileHandler];
    id v40 = [v39 profile];
    id v41 = [v40 identifier];
    id v42 = [(MCNewPayloadHandler *)self profileHandler];
    unsigned int v43 = [v42 profile];
    uint64_t v44 = [v43 UUID];
    id v45 = +[NSString stringWithFormat:@"%@-%@", v41, v44];

    id v46 = [v54 persistentUUID];
    id v55 = 0;
    LOBYTE(v50) = 1;
    LOBYTE(v44) = [v35 setClientRestrictions:0 overrideRestrictions:0 appsAndOptions:0 system:v38 != (id)2 clientType:kEASAccountClientType clientUUID:v46 sender:v45 localizedClientDescription:0 localizedWarning:0 shouldRecomputeNag:v50 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:&v55];
    id v47 = v55;

    if ((v44 & 1) == 0)
    {
      int v48 = _MCLogObjects[0];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = [v47 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v63 = self;
        __int16 v64 = 2114;
        v65 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Error removing client restrictions: %{public}@, %{public}@", buf, 0x16u);
      }
    }
  }
}

- (id)_installedACAccountOtherThanSelf
{
  BOOL v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v4 = [v3 isSetAside];

  if (v4)
  {
    uint64_t v5 = [(MCACAccountPayloadHandler *)self installedACAccounts];
    unsigned int v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      long long v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Installed accounts %@", buf, 0xCu);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned __int8 v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v13 = [v12 identifier:v20];
          id v14 = [(MCACAccountPayloadHandler *)self setAsideAccount];
          uint64_t v15 = [v14 identifier];
          unsigned __int8 v16 = [v13 isEqualToString:v15];

          if ((v16 & 1) == 0)
          {
            uint64_t v18 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v26 = v12;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Installed account other than self %@", buf, 0xCu);
            }
            id v17 = v12;
            goto LABEL_17;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v17 = 0;
LABEL_17:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)preflighterSuccessWithoutPolicyUpdate:(id)a3
{
  unsigned int v4 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];

  if (v4)
  {
    uint64_t v5 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];
    v5[2](v5, 0, 0);

    [(MCNewEASAccountPayloadHandler *)self setPreflightCompletionHandler:0];
  }
}

- (void)preflighter:(id)a3 needsComplianceWithMCFeatures:(id)a4 perAccountPolicies:(id)a5
{
  id v8 = a4;
  unsigned int v6 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];

  if (v6)
  {
    id v7 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];
    ((void (**)(void, id, void))v7)[2](v7, v8, 0);

    [(MCNewEASAccountPayloadHandler *)self setPreflightCompletionHandler:0];
  }
}

- (void)preflighter:(id)a3 successWithMCFeatures:(id)a4 perAccountPolicies:(id)a5 policyKey:(id)a6
{
  id v9 = a4;
  id v7 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];

  if (v7)
  {
    id v8 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];
    ((void (**)(void, id, void))v8)[2](v8, v9, 0);

    [(MCNewEASAccountPayloadHandler *)self setPreflightCompletionHandler:0];
  }
}

- (void)preflighterRemoteWipeRequested:(id)a3
{
  uint64_t v4 = MCEASErrorDomain;
  uint64_t v5 = MCErrorArray();
  +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v4, 21001, v5, MCErrorTypeFatal, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  unsigned int v6 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];

  if (v6)
  {
    id v7 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];
    ((void (**)(void, void, id))v7)[2](v7, 0, v8);

    [(MCNewEASAccountPayloadHandler *)self setPreflightCompletionHandler:0];
  }
}

- (void)preflighterRemoteWipeRequestResponseAcknowledged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "My policy preflighter is wigging out. %{public}@", (uint8_t *)&v8, 0xCu);
  }
  unsigned int v6 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];

  if (v6)
  {
    id v7 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];
    v7[2](v7, 0, 0);

    [(MCNewEASAccountPayloadHandler *)self setPreflightCompletionHandler:0];
  }
}

- (void)preflighterAccountOnlyRemoteWipeRequested:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Account-only wipe requested by server.", buf, 2u);
  }
  uint64_t v6 = MCEASErrorDomain;
  id v7 = MCErrorArray();
  int v8 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v6, 21008, v7, MCErrorTypeFatal, 0);

  id v9 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];

  if (v9)
  {
    uint64_t v10 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];
    ((void (**)(void, void, void *))v10)[2](v10, 0, v8);

    [(MCNewEASAccountPayloadHandler *)self setPreflightCompletionHandler:0];
  }
}

- (void)preflighterAccountOnlyRemoteWipeRequestResponseAcknowledged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Account is being wiped per server account-only wipe request. My policy preflighter is wigging out. %{public}@", buf, 0xCu);
  }
  uint64_t v6 = MCEASErrorDomain;
  id v7 = MCErrorArray();
  int v8 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v6, 21008, v7, MCErrorTypeFatal, 0);

  id v9 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];

  if (v9)
  {
    uint64_t v10 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];
    ((void (**)(void, void, void *))v10)[2](v10, 0, v8);

    [(MCNewEASAccountPayloadHandler *)self setPreflightCompletionHandler:0];
  }
}

- (void)preflighter:(id)a3 error:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];

  if (v5)
  {
    uint64_t v6 = [(MCNewEASAccountPayloadHandler *)self preflightCompletionHandler];
    id v7 = [(MCNewEASAccountPayloadHandler *)self _errorFromPolicyPreflightError:v8];
    ((void (**)(void, void, void *))v6)[2](v6, 0, v7);

    [(MCNewEASAccountPayloadHandler *)self setPreflightCompletionHandler:0];
  }
}

- (DAAccount)setAsideDAAccount
{
  return self->_setAsideDAAccount;
}

- (void)setSetAsideDAAccount:(id)a3
{
}

- (ACAccountCredential)setAsideAccountCredential
{
  return self->_setAsideAccountCredential;
}

- (void)setSetAsideAccountCredential:(id)a3
{
}

- (id)accountValidationCompletionHandler
{
  return self->_accountValidationCompletionHandler;
}

- (void)setAccountValidationCompletionHandler:(id)a3
{
}

- (id)preflightCompletionHandler
{
  return self->_preflightCompletionHandler;
}

- (void)setPreflightCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preflightCompletionHandler, 0);
  objc_storeStrong(&self->_accountValidationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_setAsideAccountCredential, 0);
  objc_storeStrong((id *)&self->_setAsideDAAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_embeddedCertificatePersistentID, 0);
}

@end