@interface MCNewEmailAccountPayloadHandler
+ (id)MCACAccountIdentifierWithIncomingAccountInfo:(id)a3;
+ (id)MCACAccountIdentifierWithOutgoingAccountInfo:(id)a3;
+ (id)unhashedAccountIdentifierWithType:(id)a3 hostname:(id)a4 username:(id)a5;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (MCNewEmailAccountPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (NSString)incomingACAccountIdentifier;
- (NSString)outgoingACAccountIdentifier;
- (id)_authSchemeForAuthenticationMethod:(id)a3;
- (id)_errorFromValidationError:(id)a3;
- (id)_incomingAccountInfoDictionaryWithUserInput:(id)a3 isPreflight:(BOOL)a4 outError:(id *)a5;
- (id)_incomingAccountWithAccountInfo:(id)a3;
- (id)_installWithIncomingAccountInfo:(id)a3 outgoingAccountInfo:(id)a4 isInstalledByMDM:(BOOL)a5 personaID:(id)a6 rmAccountIdentifier:(id)a7;
- (id)_outgoingAccountInfoDictionaryWithUserInput:(id)a3;
- (id)_outgoingAccountWithAccountInfo:(id)a3;
- (id)_persistentIDForCertificateUUID:(id)a3 notFoundLocErrorString:(id)a4 badLocErrorString:(id)a5 outError:(id *)a6;
- (id)_removeAccountWithPersistentResourceID:(id)a3 fromArray:(id)a4 outArray:(id *)a5;
- (id)userInputFields;
- (void)_remove;
- (void)_removePersonaIDForMailAccountWithPersistentResourceID:(id)a3;
- (void)_validateIncomingAccountOnThread;
- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5;
- (void)remove;
- (void)setAside;
- (void)setIncomingACAccountIdentifier:(id)a3;
- (void)setOutgoingACAccountIdentifier:(id)a3;
- (void)unsetAside;
@end

@implementation MCNewEmailAccountPayloadHandler

- (MCNewEmailAccountPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MCNewEmailAccountPayloadHandler;
  v4 = [(MCNewPayloadHandler *)&v8 initWithPayload:a3 profileHandler:a4];
  if (v4)
  {
    v5 = (NSConditionLock *)[objc_alloc((Class)NSConditionLock) initWithCondition:0];
    validationLock = v4->_validationLock;
    v4->_validationLock = v5;
  }
  return v4;
}

- (id)userInputFields
{
  v3 = +[NSMutableArray array];
  v4 = [(MCNewPayloadHandler *)self payload];
  v5 = [v4 emailAccountName];

  if (!v5)
  {
    uint64_t v6 = kMCEAPEmailAccountNameKey;
    v7 = MCLocalizedString();
    objc_super v8 = [v4 emailAccountDescription];
    v9 = MCLocalizedFormat();
    v10 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v6, v7, v9, 0, 0, 0, 0, 0, 6);
    [v3 addObject:v10];
  }
  v11 = [v4 emailAddress];

  if (!v11)
  {
    uint64_t v12 = kMCEAPEmailAddressKey;
    v13 = MCLocalizedString();
    v14 = [v4 displayName];
    v15 = MCLocalizedFormat();
    v16 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v12, v13, v15, 0, 0, 0, 0, 0, 2);
    [v3 addObject:v16];
  }
  v17 = [v4 incomingMailServerUsername];

  if (!v17)
  {
    v18 = [v4 emailAccountDescription];
    if (v18) {
      [v4 emailAccountDescription];
    }
    else {
    v19 = [v4 incomingMailServerHostname];
    }
    v20 = MCLocalizedFormat();

    uint64_t v21 = kMCEAPIncomingMailServerUsernameKey;
    v22 = MCLocalizedString();
    v23 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v21, v22, v20, 0, 0, 0, 0, 0, 0);
    [v3 addObject:v23];
  }
  v24 = [v4 incomingMailServerAuthentication];
  uint64_t v25 = kMCEmailAccountPayloadAuthenticationTypeNone;
  if (([v24 isEqualToString:kMCEmailAccountPayloadAuthenticationTypeNone] & 1) == 0)
  {
    v26 = [v4 incomingPassword];

    if (v26) {
      goto LABEL_17;
    }
    v27 = [v4 emailAccountDescription];
    if (v27) {
      [v4 emailAccountDescription];
    }
    else {
    v28 = [v4 incomingMailServerHostname];
    }
    v24 = MCLocalizedFormat();

    uint64_t v29 = kMCEAPIncomingPasswordKey;
    v30 = MCLocalizedString();
    v31 = MCLocalizedString();
    v32 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v29, v30, v24, 0, 0, 0, v31, 0, 3);
    [v3 addObject:v32];
  }
LABEL_17:
  v33 = [v4 outgoingMailServerAuthentication];
  unsigned __int8 v34 = [v33 isEqualToString:v25];

  if (v34) {
    goto LABEL_32;
  }
  v35 = [v4 emailAccountDescription];
  if (v35) {
    [v4 emailAccountDescription];
  }
  else {
  v49 = [v4 outgoingMailServerHostname];
  }
  v36 = MCLocalizedFormat();

  v37 = [v4 outgoingMailServerUsername];

  if (!v37)
  {
    uint64_t v38 = kMCEAPOutgoingMailServerUsernameKey;
    v39 = MCLocalizedString();
    v40 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v38, v39, v36, 0, 0, 0, 0, 0, 0);
    [v3 addObject:v40];
  }
  uint64_t v41 = [v4 outgoingPassword];
  if (v41)
  {
    v42 = (void *)v41;
LABEL_30:

    goto LABEL_31;
  }
  if (([v4 outgoingPasswordSameAsIncomingPassword] & 1) == 0)
  {
    v43 = [v4 emailAccountDescription];
    if (v43) {
      [v4 emailAccountDescription];
    }
    else {
    v44 = [v4 outgoingMailServerHostname];
    }
    uint64_t v45 = MCLocalizedFormat();

    uint64_t v46 = kMCEAPOutgoingPasswordKey;
    v42 = MCLocalizedString();
    v47 = +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v46, v42, v45, 0, 0, 0, 0, 0, 3);
    [v3 addObject:v47];

    v36 = (void *)v45;
    goto LABEL_30;
  }
LABEL_31:

LABEL_32:

  return v3;
}

- (id)_authSchemeForAuthenticationMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kMCEmailAccountPayloadAuthenticationTypeCRAMMD5])
  {
    v4 = (id *)&MFAuthSchemeCramMd5;
LABEL_7:
    v5 = (__CFString *)*v4;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:kMCEmailAccountPayloadAuthenticationTypeNTLM])
  {
    v4 = (id *)&MFAuthSchemeNTLM;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:kMCEmailAccountPayloadAuthenticationTypeHTTPMD5])
  {
    v4 = (id *)&MFAuthSchemeDigestMD5;
    goto LABEL_7;
  }
  v5 = &stru_1000ECAD0;
LABEL_8:

  return v5;
}

- (id)_persistentIDForCertificateUUID:(id)a3 notFoundLocErrorString:(id)a4 badLocErrorString:(id)a5 outError:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (!a3)
  {
    id v18 = 0;
    goto LABEL_13;
  }
  id v12 = a3;
  v13 = [(MCNewPayloadHandler *)self profileHandler];
  v14 = [v13 persistentIDForCertificateUUID:v12];

  if (v14)
  {
    v15 = [(MCNewPayloadHandler *)self profileHandler];
    v16 = [v15 profile];
    id v17 = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", v14, [v16 isInstalledForSystem]);

    if (v17)
    {
      CFRelease(v17);
      goto LABEL_11;
    }
    uint64_t v26 = MCEmailErrorDomain;
    v20 = [(MCNewPayloadHandler *)self payload];
    uint64_t v21 = [v20 friendlyName];
    uint64_t v29 = v21;
    v22 = MCErrorArray();
    uint64_t v23 = MCErrorTypeFatal;
    uint64_t v24 = v26;
    uint64_t v25 = 7004;
  }
  else
  {
    uint64_t v19 = MCEmailErrorDomain;
    v20 = [(MCNewPayloadHandler *)self payload];
    uint64_t v21 = [v20 friendlyName];
    uint64_t v29 = v21;
    v22 = MCErrorArray();
    uint64_t v23 = MCErrorTypeFatal;
    uint64_t v24 = v19;
    uint64_t v25 = 7003;
  }
  +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v24, v25, v22, v23, v29, 0);
  id v27 = (id)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    if (a6)
    {
      id v27 = v27;
      id v18 = 0;
      *a6 = v27;
    }
    else
    {
      id v18 = 0;
    }
    goto LABEL_12;
  }
LABEL_11:
  id v18 = v14;
  id v27 = 0;
LABEL_12:

LABEL_13:

  return v18;
}

+ (id)MCACAccountIdentifierWithIncomingAccountInfo:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"MCNewEmailAccountPayloadHandlerAccountType"];
  v5 = [v3 objectForKey:MailAccountHostname];
  uint64_t v6 = [v3 objectForKey:MFMailAccountUsername];

  v7 = +[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:v4 hostname:v5 username:v6];
  objc_super v8 = [v7 MCHashedIdentifier];

  return v8;
}

+ (id)MCACAccountIdentifierWithOutgoingAccountInfo:(id)a3
{
  uint64_t v3 = MailAccountHostname;
  id v4 = a3;
  v5 = [v4 objectForKey:v3];
  uint64_t v6 = [v4 objectForKey:MFMailAccountUsername];

  v7 = +[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:@"smtp" hostname:v5 username:v6];
  objc_super v8 = [v7 MCHashedIdentifier];

  return v8;
}

+ (id)unhashedAccountIdentifierWithType:(id)a3 hostname:(id)a4 username:(id)a5
{
  id v7 = a5;
  objc_super v8 = 0;
  if (a3)
  {
    if (a4)
    {
      v9 = +[NSString stringWithFormat:@"%@|%@", a3, a4];
      objc_super v8 = v9;
      if (v7)
      {
        if (v9)
        {
          uint64_t v10 = [v9 stringByAppendingFormat:@"|%@", v7];

          objc_super v8 = (void *)v10;
        }
      }
    }
  }

  return v8;
}

- (id)_incomingAccountInfoDictionaryWithUserInput:(id)a3 isPreflight:(BOOL)a4 outError:(id *)a5
{
  BOOL v69 = a4;
  id v6 = a3;
  id v7 = +[NSMutableDictionary dictionary];
  objc_super v8 = [(MCNewPayloadHandler *)self payload];
  uint64_t v9 = kMCEAPEmailAddressKey;
  uint64_t v10 = [v8 emailAddress];
  uint64_t v11 = +[MCNewPayloadHandler prioritizeUserInput:v6 key:v9 overField:v10];

  uint64_t v12 = kMCEAPIncomingMailServerUsernameKey;
  v13 = [v8 incomingMailServerUsername];
  v75 = +[MCNewPayloadHandler prioritizeUserInput:v6 key:v12 overField:v13];

  uint64_t v14 = kMCEAPIncomingMailServerHostnameKey;
  v15 = [v8 incomingMailServerHostname];
  v16 = +[MCNewPayloadHandler prioritizeUserInput:v6 key:v14 overField:v15];

  uint64_t v17 = kMCEAPIncomingPasswordKey;
  id v18 = [v8 incomingPassword];
  v74 = +[MCNewPayloadHandler prioritizeUserInput:v6 key:v17 overField:v18];

  uint64_t v19 = kMCEAPEmailAccountDescriptionKey;
  v20 = [v8 emailAccountDescription];
  v73 = +[MCNewPayloadHandler prioritizeUserInput:v6 key:v19 overField:v20];

  uint64_t v21 = kMCEAPEmailAccountNameKey;
  v22 = [v8 emailAccountName];
  uint64_t v23 = +[MCNewPayloadHandler prioritizeUserInput:v6 key:v21 overField:v22];

  if (v11)
  {
    uint64_t v24 = +[NSArray arrayWithObject:v11];
    [v7 MCSetObjectIfNotNil:v24 forKey:MailAccountEmailAddresses];
  }
  [v7 MCSetObjectIfNotNil:v75 forKey:MFMailAccountUsername];
  [v7 MCSetObjectIfNotNil:v16 forKey:MailAccountHostname];
  uint64_t v25 = MailAccountPassword;
  [v7 MCSetObjectIfNotNil:v74 forKey:MailAccountPassword];
  [v7 MCSetObjectIfNotNil:v73 forKey:MFMailAccountDescription];
  v71 = (void *)v23;
  [v7 MCSetObjectIfNotNil:v23 forKey:MailAccountFullUserName];
  uint64_t v26 = [v8 incomingMailServerPortNumber];
  [v7 MCSetObjectIfNotNil:v26 forKey:MailAccountPortNumber];

  if ([v8 incomingMailServerUseSSL])
  {
    id v27 = +[NSNumber numberWithInt:1];
    [v7 setObject:v27 forKey:MailAccountSSLEnabled];
  }
  if ([v8 preventMove])
  {
    v28 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 preventMove]);
    [v7 setObject:v28 forKey:MFMailAccountRestrictMessageTransfersToOtherAccounts];
  }
  if ([v8 preventAppSheet])
  {
    uint64_t v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 preventAppSheet]);
    [v7 setObject:v29 forKey:MFMailAccountRestrictSendingFromExternalProcesses];
  }
  if ([v8 isRecentsSyncingDisabled])
  {
    v30 = +[NSNumber numberWithBool:1];
    [v7 setObject:v30 forKey:MFMailAccountRestrictRecentsSyncing];
  }
  if ([v8 isMailDropEnabled])
  {
    v31 = +[NSNumber numberWithBool:1];
    [v7 setObject:v31 forKey:MFMailAccountSupportsMailDrop];
  }
  v72 = (void *)v11;
  v32 = [v8 emailAccountType];
  unsigned int v33 = [v32 isEqualToString:kMCEmailAccountPayloadTypeIMAP];

  if (v33) {
    unsigned __int8 v34 = @"imap";
  }
  else {
    unsigned __int8 v34 = @"pop";
  }
  [v7 setValue:v34 forKey:@"MCNewEmailAccountPayloadHandlerAccountType"];
  v35 = [v8 incomingMailServerAuthentication];
  v36 = [(MCNewEmailAccountPayloadHandler *)self _authSchemeForAuthenticationMethod:v35];
  [v7 setObject:v36 forKey:MFMailAccountAuthenticationScheme];

  v37 = [v7 objectForKey:v25];

  if (v37) {
    uint64_t v38 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v38 = &__kCFBooleanFalse;
  }
  [v7 setObject:v38 forKey:ACAccountPropertyShouldNeverUseSyncableCredential];
  v39 = [v8 incomingMailServerIMAPPathPrefix];
  if (v39 && [(__CFString *)v34 isEqualToString:@"imap"]) {
    [v7 setObject:v39 forKey:IMAPServerPathPrefix];
  }
  v40 = +[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:v34 hostname:v16 username:v75];
  uint64_t v41 = [v8 profile];
  v42 = [v41 displayName];
  v43 = +[NSString stringWithFormat:@"%@|%@", v40, v42];

  [v7 setObject:v43 forKey:MailAccountManagedTag];
  if (![v8 SMIMEEnabled])
  {
    id v48 = 0;
    goto LABEL_52;
  }
  v44 = [v8 SMIMESigningIdentityUUID];

  if (v44)
  {
    uint64_t v45 = [v8 SMIMESigningIdentityUUID];
    if (v69)
    {
      uint64_t v79 = 0;
      uint64_t v46 = (id *)&v79;
      uint64_t v47 = [(MCNewPayloadHandler *)self _temporaryPersistentIDForIdentityUUID:v45 outError:&v79];
    }
    else
    {
      uint64_t v78 = 0;
      uint64_t v46 = (id *)&v78;
      uint64_t v47 = [(MCNewEmailAccountPayloadHandler *)self _persistentIDForCertificateUUID:v45 notFoundLocErrorString:@"EMAIL_ERROR_SMIME_SIGNING_CERT_NOT_FOUND_P_PAYLOAD" badLocErrorString:@"EMAIL_ERROR_SMIME_SIGNING_CERT_BAD_P_PAYLOAD" outError:&v78];
    }
    v49 = (void *)v47;
    id v48 = *v46;

    if (v48) {
      goto LABEL_51;
    }
    if (!v49)
    {
      uint64_t v61 = MCEmailErrorDomain;
      v52 = [(MCNewPayloadHandler *)self payload];
      v68 = [v52 friendlyName];
      v57 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v61, 7003, v57, MCErrorTypeFatal, v68, 0);
      id v48 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    }
    [v7 setObject:v49 forKey:@"MCSMIMESigningIdentityPersistentID"];
  }
  v49 = [v8 SMIMESigningEnabled];
  if (v49)
  {
    [v7 setObject:v49 forKey:MFMailAccountSigningEnabled];
  }
  else
  {
    v50 = [v8 SMIMESigningIdentityUUID];

    if (v50)
    {
      v51 = +[NSNumber numberWithBool:1];
      [v7 setObject:v51 forKey:MFMailAccountSigningEnabled];
    }
  }
  v52 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 SMIMESigningUserOverrideable]);
  [v7 setObject:v52 forKey:MFMailAccountSigningUserOverrideable];
  v68 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 SMIMESigningIdentityUserOverrideable]);
  [v7 setObject:forKey:];
  v53 = [v8 SMIMEEncryptionIdentityUUID];

  if (!v53)
  {
LABEL_42:
    v57 = [v8 SMIMEEncryptionEnabled];
    if (v57)
    {
      [v7 setObject:v57 forKey:MFMailAccountEncryptionEnabled];
    }
    else
    {
      v58 = [v8 SMIMEEncryptionIdentityUUID];

      if (v58)
      {
        v59 = +[NSNumber numberWithBool:1];
        [v7 setObject:v59 forKey:MFMailAccountEncryptionEnabled];
      }
    }
    if ([v8 SMIMEEncryptByDefaultUserOverrideable]) {
      [v7 setObject:&__kCFBooleanTrue forKey:MFMailAccountEncryptByDefaultUserOverrideable];
    }
    v60 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 SMIMEEncryptionIdentityUserOverrideable]);
    [v7 setObject:v60 forKey:MFMailAccountEncryptionIdentityUserOverrideable];

    id v48 = 0;
    goto LABEL_50;
  }
  v67 = v52;
  v54 = [v8 SMIMEEncryptionIdentityUUID];
  if (v69)
  {
    uint64_t v77 = 0;
    v55 = (id *)&v77;
    uint64_t v56 = [(MCNewPayloadHandler *)self _temporaryPersistentIDForIdentityUUID:v54 outError:&v77];
  }
  else
  {
    uint64_t v76 = 0;
    v55 = (id *)&v76;
    uint64_t v56 = [(MCNewEmailAccountPayloadHandler *)self _persistentIDForCertificateUUID:v54 notFoundLocErrorString:@"EMAIL_ERROR_SMIME_ENCRYPTION_CERT_NOT_FOUND_P_PAYLOAD" badLocErrorString:@"EMAIL_ERROR_SMIME_ENCRYPTION_CERT_BAD_P_PAYLOAD" outError:&v76];
  }
  v57 = (void *)v56;
  id v48 = *v55;

  if (!v48)
  {
    [v7 setObject:v57 forKey:@"MCSMIMEEncryptionIdentityPersistentID"];

    v52 = v67;
    goto LABEL_42;
  }
  v52 = v67;
LABEL_50:

LABEL_51:
LABEL_52:

  if (v48)
  {
    os_log_t v62 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v63 = v62;
      v64 = [v48 MCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      v81 = v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Cannot create incoming account dictionary. Error: %{public}@", buf, 0xCu);
    }
    id v65 = 0;
    if (a5) {
      *a5 = v48;
    }
  }
  else
  {
    id v65 = v7;
  }

  return v65;
}

- (id)_incomingAccountWithAccountInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"MCNewEmailAccountPayloadHandlerAccountType"];
  unsigned int v6 = [v5 isEqualToString:@"imap"];
  id v7 = (objc_class *)objc_opt_class();
  objc_super v8 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v9 = [v8 userMode];

  if (v9 == 1)
  {
    uint64_t v45 = v5;
    uint64_t v10 = +[ACAccountStore defaultStore];
    uint64_t v11 = v10;
    uint64_t v12 = &ACAccountTypeIdentifierIMAP;
    if (!v6) {
      uint64_t v12 = &ACAccountTypeIdentifierPOP;
    }
    v13 = [v10 accountTypeWithAccountTypeIdentifier:*v12];
    id v14 = [objc_alloc((Class)ACAccount) initWithAccountType:v13];
    [v14 setManagingOwnerIdentifier:kMCAccountManagingOwnerIdentifier];
    v15 = [(MCNewPayloadHandler *)self payload];
    v16 = [v15 friendlyName];
    [v14 setManagingSourceName:v16];

    uint64_t v17 = +[MCNewEmailAccountPayloadHandler MCACAccountIdentifierWithIncomingAccountInfo:v4];
    if (v17)
    {
      id v18 = [v14 identifier];
      [v14 setAccountProperty:v18 forKey:@"MCAccountIdentifer"];

      [v14 setIdentifier:v17];
    }
    uint64_t v19 = [v11 supportedDataclassesForAccountType:v13, v11];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v20 = [v19 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v51;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v51 != v22) {
            objc_enumerationMutation(v19);
          }
          [v14 setProvisioned:1 forDataclass:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        }
        id v21 = [v19 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v21);
    }
    [v14 setAuthenticated:1];
    id v24 = [v4 mutableCopy];
    uint64_t v25 = NSStringFromClass(v7);
    [v24 setObject:v25 forKey:MFMailAccountClass];

    id v26 = [[v7 alloc] initWithPersistentAccount:v14];
    [v26 _setAccountProperties:v24];

    v5 = v45;
  }
  else
  {
    id v26 = [(objc_class *)v7 newAccountWithDictionary:v4];
    uint64_t v27 = kMCAccountManagingOwnerIdentifier;
    v28 = [v26 persistentAccount];
    [v28 setManagingOwnerIdentifier:v27];

    uint64_t v29 = [(MCNewPayloadHandler *)self payload];
    v30 = [v29 friendlyName];
    v31 = [v26 persistentAccount];
    [v31 setManagingSourceName:v30];
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v32 = [v26 persistentAccount];
  unsigned int v33 = [v32 provisionedDataclasses];

  id v34 = [v33 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v47;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
        v39 = [v26 persistentAccount];
        [v39 setEnabled:1 forDataclass:v38];
      }
      id v35 = [v33 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v35);
  }

  v40 = [v26 persistentAccount];
  uint64_t v41 = [v40 identifier];
  incomingACAccountIdentifier = self->_incomingACAccountIdentifier;
  self->_incomingACAccountIdentifier = v41;

  return v26;
}

- (id)_outgoingAccountInfoDictionaryWithUserInput:(id)a3
{
  id v4 = a3;
  v5 = [(MCNewPayloadHandler *)self payload];
  unsigned int v6 = +[NSMutableDictionary dictionary];
  uint64_t v7 = kMCEAPOutgoingMailServerUsernameKey;
  objc_super v8 = [v5 outgoingMailServerUsername];
  unsigned int v9 = +[MCNewPayloadHandler prioritizeUserInput:v4 key:v7 overField:v8];

  uint64_t v10 = kMCEAPOutgoingMailServerHostnameKey;
  uint64_t v11 = [v5 outgoingMailServerHostname];
  uint64_t v12 = +[MCNewPayloadHandler prioritizeUserInput:v4 key:v10 overField:v11];

  uint64_t v13 = kMCEAPIncomingPasswordKey;
  id v14 = [v5 incomingPassword];
  v15 = +[MCNewPayloadHandler prioritizeUserInput:v4 key:v13 overField:v14];

  uint64_t v16 = kMCEAPOutgoingPasswordKey;
  uint64_t v17 = [v5 outgoingPassword];
  id v18 = +[MCNewPayloadHandler prioritizeUserInput:v4 key:v16 overField:v17];

  [v6 MCSetObjectIfNotNil:v9 forKey:MFMailAccountUsername];
  [v6 MCSetObjectIfNotNil:v12 forKey:MailAccountHostname];
  uint64_t v19 = [v5 outgoingMailServerPortNumber];
  [v6 MCSetObjectIfNotNil:v19 forKey:MailAccountPortNumber];

  if (v15 && [v5 outgoingPasswordSameAsIncomingPassword])
  {
    uint64_t v20 = MailAccountPassword;
    id v21 = v6;
    uint64_t v22 = v15;
  }
  else
  {
    uint64_t v20 = MailAccountPassword;
    if (!v18) {
      goto LABEL_7;
    }
    id v21 = v6;
    uint64_t v22 = v18;
  }
  [v21 setObject:v22 forKey:v20];
LABEL_7:
  uint64_t v23 = [v5 outgoingMailServerAuthentication];
  id v24 = [(MCNewEmailAccountPayloadHandler *)self _authSchemeForAuthenticationMethod:v23];
  [v6 setObject:v24 forKey:MFMailAccountAuthenticationScheme];

  uint64_t v25 = [v6 objectForKey:v20];

  if (v25) {
    id v26 = &__kCFBooleanTrue;
  }
  else {
    id v26 = &__kCFBooleanFalse;
  }
  [v6 setObject:v26 forKey:ACAccountPropertyShouldNeverUseSyncableCredential];
  uint64_t v27 = +[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:@"smtp" hostname:v12 username:v9];
  v28 = [v5 profile];
  uint64_t v29 = [v28 displayName];
  v30 = +[NSString stringWithFormat:@"%@|%@", v27, v29];

  [v6 setObject:v30 forKey:MailAccountManagedTag];
  v31 = [v5 outgoingMailServerAuthentication];
  LOBYTE(v29) = [v31 isEqualToString:kMCEmailAccountPayloadAuthenticationTypeNone];

  if ((v29 & 1) == 0)
  {
    v32 = +[NSNumber numberWithInt:1];
    [v6 setObject:v32 forKey:DeliveryAccountShouldUseAuthentication];
  }
  if ([v5 outgoingMailServerUseSSL])
  {
    unsigned int v33 = +[NSNumber numberWithInt:1];
    [v6 setObject:v33 forKey:MailAccountSSLEnabled];
  }

  return v6;
}

- (id)_outgoingAccountWithAccountInfo:(id)a3
{
  id v4 = a3;
  v5 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v6 = [v5 userMode];

  if (v6 == 1)
  {
    uint64_t v7 = +[ACAccountStore defaultStore];
    objc_super v8 = [v7 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierSMTP];
    id v9 = [objc_alloc((Class)ACAccount) initWithAccountType:v8];
    [v9 setManagingOwnerIdentifier:kMCAccountManagingOwnerIdentifier];
    uint64_t v10 = [(MCNewPayloadHandler *)self payload];
    uint64_t v11 = [v10 friendlyName];
    [v9 setManagingSourceName:v11];

    uint64_t v12 = +[MCNewEmailAccountPayloadHandler MCACAccountIdentifierWithOutgoingAccountInfo:v4];
    if (v12)
    {
      uint64_t v13 = [v9 identifier];
      [v9 setAccountProperty:v13 forKey:@"MCAccountIdentifer"];

      [v9 setIdentifier:v12];
    }
    id v14 = [v7 supportedDataclassesForAccountType:v8];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          [v9 setProvisioned:1 forDataclass:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        }
        id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v16);
    }
    [v9 setAuthenticated:1];
    id v19 = [v4 mutableCopy];
    uint64_t v20 = (objc_class *)objc_opt_class();
    id v21 = NSStringFromClass(v20);
    [v19 setObject:v21 forKey:MFMailAccountClass];

    id v22 = [objc_alloc((Class)SMTPAccount) initWithPersistentAccount:v9];
    [v22 _setAccountProperties:v19];
  }
  else
  {
    id v22 = +[SMTPAccount newAccountWithDictionary:v4];
    uint64_t v23 = kMCAccountManagingOwnerIdentifier;
    id v24 = [v22 persistentAccount];
    [v24 setManagingOwnerIdentifier:v23];

    uint64_t v7 = [(MCNewPayloadHandler *)self payload];
    objc_super v8 = [v7 friendlyName];
    id v9 = [v22 persistentAccount];
    [v9 setManagingSourceName:v8];
  }

  uint64_t v25 = [v22 persistentAccount];
  id v26 = [v25 identifier];
  outgoingACAccountIdentifier = self->_outgoingACAccountIdentifier;
  self->_outgoingACAccountIdentifier = v26;

  return v22;
}

- (void)_validateIncomingAccountOnThread
{
  self->_validationResult = 0;
  self->_validationDone = 0;
  id v4 = objc_alloc_init((Class)MFAccountValidator);
  [v4 setDelegate:self];
  [v4 validateAccount:self->_incomingAccount useSSL:self->_incomingAccountUsesSSL];
  while (!self->_validationDone)
  {
    id v5 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:0.3];
    unsigned int v6 = +[NSRunLoop currentRunLoop];
    [v6 runUntilDate:v5];
  }
  [(NSConditionLock *)self->_validationLock lockWhenCondition:1];
  [(NSConditionLock *)self->_validationLock unlockWithCondition:2];
}

- (id)_errorFromValidationError:(id)a3
{
  if (!a3)
  {
    objc_super v8 = 0;
    goto LABEL_15;
  }
  id v3 = a3;
  id v4 = (char *)[v3 code];
  id v5 = MCErrorTypeSkippable;
  if ((unint64_t)(v4 - 1043) >= 3)
  {
    if (v4 == (char *)1030)
    {
      uint64_t v7 = 7002;
      goto LABEL_10;
    }
    unsigned int v6 = (id *)&MCErrorTypeFatal;
    if (v4 == (char *)1032)
    {
      unsigned int v6 = (id *)&MCErrorTypeRetryable;
      uint64_t v7 = 7001;
    }
    else
    {
      uint64_t v7 = 7002;
    }
  }
  else
  {
    unsigned int v6 = (id *)&MCErrorTypeRetryable;
    uint64_t v7 = 7000;
  }
  id v9 = *v6;

  id v5 = v9;
LABEL_10:
  uint64_t v10 = [v3 localizedDescription];

  if (!v10)
  {
    uint64_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = (int)v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Validation error %u does not have a description.", buf, 8u);
    }
    uint64_t v10 = MCLocalizedFormat();
  }
  uint64_t v12 = MCEmailErrorDomain;
  uint64_t v13 = MCErrorArrayFromLocalizedDescription();
  objc_super v8 = +[NSError MCErrorWithDomain:v12 code:v7 descriptionArray:v13 errorType:v5];

LABEL_15:

  return v8;
}

- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5
{
  id v7 = a3;
  objc_super v8 = (DeliveryAccount *)a4;
  if (![v7 accountIsValid])
  {
    self->_validationResult = 0;
    if (self->_incomingAccount == v8)
    {
      os_log_t v15 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      uint64_t v11 = v15;
      uint64_t v12 = [v7 error];
      uint64_t v13 = [v12 MCVerboseDescription];
      int v19 = 138543362;
      uint64_t v20 = v13;
      id v14 = "Error validating incoming server information: %{public}@";
    }
    else
    {
      if (self->_outgoingAccount != v8) {
        goto LABEL_13;
      }
      os_log_t v10 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      uint64_t v11 = v10;
      uint64_t v12 = [v7 error];
      uint64_t v13 = [v12 MCVerboseDescription];
      int v19 = 138543362;
      uint64_t v20 = v13;
      id v14 = "Error validating outgoing server information: %{public}@";
    }
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, 0xCu);

    goto LABEL_13;
  }
  outgoingAccount = self->_outgoingAccount;
  if (self->_incomingAccount == v8)
  {
    [v7 validateAccount:outgoingAccount useSSL:self->_outgoingAccountUsesSSL];
    goto LABEL_16;
  }
  if (outgoingAccount == v8)
  {
    self->_validationResult = 1;
LABEL_13:
    if (!self->_validationResult)
    {
      int v16 = [v7 error];
      uint64_t v17 = [(MCNewEmailAccountPayloadHandler *)self _errorFromValidationError:v16];
      validationError = self->_validationError;
      self->_validationError = v17;
    }
    self->_validationDone = 1;
  }
LABEL_16:
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = [(MCNewPayloadHandler *)self payload];
  id v44 = 0;
  objc_super v8 = [(MCNewEmailAccountPayloadHandler *)self _incomingAccountInfoDictionaryWithUserInput:v6 isPreflight:1 outError:&v44];
  id v9 = v44;
  if (v9)
  {
    id v10 = v9;

    goto LABEL_17;
  }
  uint64_t v11 = [(MCNewEmailAccountPayloadHandler *)self _outgoingAccountInfoDictionaryWithUserInput:v6];
  uint64_t v12 = [(MCNewEmailAccountPayloadHandler *)self _incomingAccountWithAccountInfo:v8];
  incomingAccount = self->_incomingAccount;
  self->_incomingAccount = v12;

  self->_incomingAccountUsesSSL = [v7 incomingMailServerUseSSL];
  id v14 = [(MCNewEmailAccountPayloadHandler *)self _outgoingAccountWithAccountInfo:v11];
  outgoingAccount = self->_outgoingAccount;
  self->_outgoingAccount = v14;

  self->_outgoingAccountUsesSSL = [v7 outgoingMailServerUseSSL];
  if (!self->_incomingAccount)
  {
    long long v30 = [v7 emailAccountType];
    unsigned int v31 = [v30 isEqualToString:kMCEmailAccountPayloadTypeIMAP];

    uint64_t v32 = MCEmailErrorDomain;
    v28 = [v7 emailAccountDescription];
    v43 = v28;
    MCErrorArray();
    if (v31) {
      unsigned int v33 = {;
    }
      uint64_t v34 = MCErrorTypeFatal;
      uint64_t v35 = v32;
      uint64_t v36 = 7005;
    }
    else {
      unsigned int v33 = {;
    }
      uint64_t v34 = MCErrorTypeFatal;
      uint64_t v35 = v32;
      uint64_t v36 = 7006;
    }
    goto LABEL_15;
  }
  if (!self->_outgoingAccount)
  {
    uint64_t v37 = MCEmailErrorDomain;
    v28 = [v7 emailAccountDescription];
    v43 = v28;
    unsigned int v33 = MCErrorArray();
    uint64_t v34 = MCErrorTypeFatal;
    uint64_t v35 = v37;
    uint64_t v36 = 7007;
LABEL_15:
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v35, v36, v33, v34, v43, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  os_log_t v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = v16;
    id v18 = [v7 emailAccountDescription];
    *(_DWORD *)buf = 138543362;
    long long v46 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Validating account “%{public}@”", buf, 0xCu);
  }
  [(NSConditionLock *)self->_validationLock lock];
  [(NSConditionLock *)self->_validationLock unlockWithCondition:1];
  int v19 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:self selector:"_validateIncomingAccountOnThread" object:0];
  validationThread = self->_validationThread;
  self->_validationThread = v19;

  [(NSThread *)self->_validationThread start];
  [(NSConditionLock *)self->_validationLock lockWhenCondition:2];
  [(NSConditionLock *)self->_validationLock unlock];
  id v21 = self->_validationThread;
  self->_validationThread = 0;

  id v22 = self->_incomingAccount;
  self->_incomingAccount = 0;

  uint64_t v23 = self->_outgoingAccount;
  self->_outgoingAccount = 0;

  os_log_t v24 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = v24;
    id v26 = [v7 emailAccountDescription];
    uint64_t v27 = MCStringForBool();
    *(_DWORD *)buf = 138543618;
    long long v46 = v26;
    __int16 v47 = 2114;
    long long v48 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Validation of account “%{public}@” done. Result: %{public}@", buf, 0x16u);
  }
  v28 = self->_validationError;
  validationError = self->_validationError;
  self->_validationError = 0;

  if (self->_validationResult)
  {
    id v10 = 0;
  }
  else
  {
    v28 = v28;
    id v10 = v28;
  }
LABEL_16:

  if (!v10)
  {
    BOOL v41 = 1;
    goto LABEL_23;
  }
LABEL_17:
  os_log_t v38 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v39 = v38;
    v40 = [v10 MCVerboseDescription];
    *(_DWORD *)buf = 138543362;
    long long v46 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Account validation failed. Error: %{public}@", buf, 0xCu);
  }
  if (a4)
  {
    id v10 = v10;
    BOOL v41 = 0;
    *a4 = v10;
  }
  else
  {
    BOOL v41 = 0;
  }
LABEL_23:

  return v41;
}

- (id)_installWithIncomingAccountInfo:(id)a3 outgoingAccountInfo:(id)a4 isInstalledByMDM:(BOOL)a5 personaID:(id)a6 rmAccountIdentifier:(id)a7
{
  BOOL v68 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v69 = a7;
  v71 = v11;
  id v14 = [(MCNewEmailAccountPayloadHandler *)self _incomingAccountWithAccountInfo:v11];
  os_log_t v15 = [(MCNewPayloadHandler *)self payload];
  os_log_t v16 = [v15 profile];
  uint64_t v17 = [v16 UUID];
  uint64_t v18 = kMCAccountProfileUUIDKey;
  [v14 setAccountProperty:v17 forKey:kMCAccountProfileUUIDKey];

  int v19 = [(MCNewPayloadHandler *)self payload];
  uint64_t v20 = [v19 UUID];
  uint64_t v21 = kMCAccountPayloadUUIDKey;
  [v14 setAccountProperty:v20 forKey:kMCAccountPayloadUUIDKey];

  id v22 = [(MCNewPayloadHandler *)self payload];
  uint64_t v23 = [v22 profile];
  os_log_t v24 = [v23 identifier];
  uint64_t v25 = ACAccountPropertyConfigurationProfileIdentifier;
  [v14 setAccountProperty:v24 forKey:ACAccountPropertyConfigurationProfileIdentifier];

  v70 = v12;
  id v26 = [(MCNewEmailAccountPayloadHandler *)self _outgoingAccountWithAccountInfo:v12];
  uint64_t v27 = [(MCNewPayloadHandler *)self payload];
  v28 = [v27 profile];
  long long v29 = [v28 UUID];
  [v26 setAccountProperty:v29 forKey:v18];

  long long v30 = v13;
  unsigned int v31 = [(MCNewPayloadHandler *)self payload];
  uint64_t v32 = [v31 UUID];
  [v26 setAccountProperty:v32 forKey:v21];

  unsigned int v33 = [(MCNewPayloadHandler *)self payload];
  uint64_t v34 = [v33 profile];
  uint64_t v35 = [v34 identifier];
  [v26 setAccountProperty:v35 forKey:v25];

  [v14 setDeliveryAccount:v26];
  uint64_t v36 = +[MailAccount mailAccounts];
  id v37 = [v36 mutableCopy];

  [v37 addObject:v14];
  v67 = v37;
  if ([v13 length])
  {
    uint64_t v38 = ACAccountPropertyPersonaIdentifier;
    [v14 setAccountProperty:v13 forKey:ACAccountPropertyPersonaIdentifier];
    [v26 setAccountProperty:v13 forKey:v38];
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_10002AB88;
    v85[3] = &unk_1000EAC80;
    id v86 = v37;
    id v39 = +[DMCPersonaHelper performBlockUnderPersona:v13 block:v85];
  }
  else
  {
    +[MailAccount setMailAccounts:v37];
  }
  if (v69)
  {
    uint64_t v40 = ACAccountPropertyRemoteManagingAccountIdentifier;
    [v14 setAccountProperty:v69 forKey:ACAccountPropertyRemoteManagingAccountIdentifier];
    [v26 setAccountProperty:v69 forKey:v40];
  }
  id v72 = v13;
  BOOL v41 = [(MCNewPayloadHandler *)self payload];
  if (v68) {
    [v14 setValueInAccountProperties:&__kCFBooleanTrue forKey:@"MCAccountIsManaged"];
  }
  if ([v41 SMIMEEnabled])
  {
    v42 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v41 SMIMEPerMessageSwitchEnabled]);
    [v14 setAccountProperty:v42 forKey:MFMailAccountPerMessageEncryptionEnabled];
  }
  if ([v13 length])
  {
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_10002AB9C;
    v83[3] = &unk_1000EAC80;
    id v84 = v14;
    id v43 = +[DMCPersonaHelper performBlockUnderPersona:v13 block:v83];
  }
  else
  {
    [v14 savePersistentAccount];
  }
  +[DeliveryAccount addDeliveryAccount:v26];
  if (v68) {
    [v26 setValueInAccountProperties:&__kCFBooleanTrue forKey:@"MCAccountIsManaged"];
  }
  if ([v41 SMIMEEnabled])
  {
    id v44 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v41 SMIMEPerMessageSwitchEnabled]);
    [v26 setAccountProperty:v44 forKey:MFMailAccountPerMessageEncryptionEnabled];
  }
  if ([v13 length])
  {
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10002ABA4;
    v81[3] = &unk_1000EAC80;
    id v82 = v26;
    id v45 = +[DMCPersonaHelper performBlockUnderPersona:v13 block:v81];
  }
  else
  {
    [v26 savePersistentAccount];
  }
  long long v46 = v71;
  if ([v41 SMIMEEnabled])
  {
    __int16 v47 = [v71 objectForKey:@"MCSMIMESigningIdentityPersistentID"];
    if (v47)
    {
      long long v48 = [v71 objectForKey:MailAccountEmailAddresses];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v49 = [v48 countByEnumeratingWithState:&v77 objects:v90 count:16];
      if (v49)
      {
        id v50 = v49;
        uint64_t v51 = *(void *)v78;
        do
        {
          for (i = 0; i != v50; i = (char *)i + 1)
          {
            if (*(void *)v78 != v51) {
              objc_enumerationMutation(v48);
            }
            [v14 setSigningIdentityPersistentReference:v47 forAddress:*(void *)(*((void *)&v77 + 1) + 8 * i)];
          }
          id v50 = [v48 countByEnumeratingWithState:&v77 objects:v90 count:16];
        }
        while (v50);
      }
      [v41 setSMIMESigningIdentityPersistentID:v47];

      long long v46 = v71;
    }
    long long v53 = [v46 objectForKey:@"MCSMIMEEncryptionIdentityPersistentID"];
    if (v53)
    {
      v54 = [v46 objectForKey:MailAccountEmailAddresses];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v55 = [v54 countByEnumeratingWithState:&v73 objects:v89 count:16];
      if (v55)
      {
        id v56 = v55;
        uint64_t v57 = *(void *)v74;
        do
        {
          for (j = 0; j != v56; j = (char *)j + 1)
          {
            if (*(void *)v74 != v57) {
              objc_enumerationMutation(v54);
            }
            [v14 setEncryptionIdentityPersistentReference:v53 forAddress:*(void *)(*((void *)&v73 + 1) + 8 * (void)j)];
          }
          id v56 = [v54 countByEnumeratingWithState:&v73 objects:v89 count:16];
        }
        while (v56);
      }
      [v41 setSMIMEEncryptionIdentityPersistentID:v53];

      long long v46 = v71;
    }

    long long v30 = v72;
  }
  v87[0] = @"IncomingAccountInfo";
  v87[1] = @"OutgoingAccountInfo";
  v88[0] = v46;
  v88[1] = v70;
  v59 = +[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
  v60 = +[NSPropertyListSerialization dataWithPropertyList:v59 format:200 options:0 error:0];
  if (v60)
  {
    uint64_t v61 = [(MCNewPayloadHandler *)self payload];
    os_log_t v62 = [v61 UUID];
    v63 = [(MCNewPayloadHandler *)self profileHandler];
    v64 = [v63 profile];
    +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setData:forService:account:label:description:useSystemKeychain:outError:", v60, @"MCEmailAccount", v62, 0, 0, [v64 isInstalledForSystem], 0);

    long long v46 = v71;
    long long v30 = v72;
  }
  id v65 = [v14 accountPropertyForKey:MailAccountManagedTag];

  return v65;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  id v9 = [v8 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
  id v10 = [v9 BOOLValue];

  if (!v10)
  {
    id v13 = 0;
    goto LABEL_5;
  }
  uint64_t v11 = kMDMPersonaKey;
  id v12 = [v8 objectForKeyedSubscript:kMDMPersonaKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v8 objectForKeyedSubscript:v11];
  }
  else
  {
    id v13 = 0;
  }

  uint64_t v15 = kMCInstallProfileOptionManagingProfileIdentifier;
  os_log_t v16 = [v8 objectForKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = 0;
    goto LABEL_11;
  }
  uint64_t v17 = [v8 objectForKeyedSubscript:v15];

  if (!v17)
  {
LABEL_5:
    id v14 = 0;
    goto LABEL_12;
  }
  uint64_t v18 = +[ACAccountStore defaultStore];
  int v19 = [v18 dmc_remoteManagementAccountForManagementProfileIdentifier:v17];

  id v14 = [v19 identifier];

  os_log_t v16 = (void *)v17;
LABEL_11:

LABEL_12:
  uint64_t v20 = [(MCNewPayloadHandler *)self userInputResponses];
  id v32 = 0;
  uint64_t v21 = [(MCNewEmailAccountPayloadHandler *)self _incomingAccountInfoDictionaryWithUserInput:v20 isPreflight:0 outError:&v32];
  id v22 = v32;

  if (v22)
  {

    os_log_t v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      os_log_t v24 = v23;
      uint64_t v25 = [(MCNewPayloadHandler *)self payload];
      id v26 = [v25 friendlyName];
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v26;
      __int16 v35 = 2114;
      id v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Could not install email payload %{public}@. Error: %{public}@", buf, 0x16u);
    }
    if (a6) {
      *a6 = [v22 MCCopyAsPrimaryError];
    }
  }
  else
  {
    uint64_t v27 = [(MCNewPayloadHandler *)self userInputResponses];
    v28 = [(MCNewEmailAccountPayloadHandler *)self _outgoingAccountInfoDictionaryWithUserInput:v27];

    long long v29 = [(MCNewEmailAccountPayloadHandler *)self _installWithIncomingAccountInfo:v21 outgoingAccountInfo:v28 isInstalledByMDM:v10 personaID:v13 rmAccountIdentifier:v14];
    long long v30 = [(MCNewPayloadHandler *)self payload];
    [v30 setPersistentResourceID:v29];
    [v30 setIncomingACAccountIdentifier:self->_incomingACAccountIdentifier];
    [v30 setOutgoingACAccountIdentifier:self->_outgoingACAccountIdentifier];
  }
  return v22 == 0;
}

- (BOOL)isInstalled
{
  v2 = [(MCNewPayloadHandler *)self payload];
  id v3 = [v2 persistentResourceID];

  +[MailAccount mailAccounts];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = MailAccountManagedTag;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) accountPropertyForKey:v8, v13];
        if (v10 && ([v3 isEqualToString:v10] & 1) != 0)
        {

          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (id)_removeAccountWithPersistentResourceID:(id)a3 fromArray:(id)a4 outArray:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v22;
    uint64_t v14 = MailAccountManagedTag;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v17 = [v16 accountPropertyForKey:v14];
        if (v17 && ([v6 isEqualToString:v17] & 1) != 0)
        {
          id v18 = v16;

          id v12 = v18;
        }
        else
        {
          [v8 addObject:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }

  if (a5) {
    *a5 = v8;
  }

  return v12;
}

- (void)_removePersonaIDForMailAccountWithPersistentResourceID:(id)a3
{
  id v3 = a3;
  id v4 = +[ACAccountStore defaultStore];
  v33[0] = ACAccountTypeIdentifierPOP;
  v33[1] = ACAccountTypeIdentifierAol;
  v33[2] = ACAccountTypeIdentifierYahoo;
  v33[3] = ACAccountTypeIdentifierGmail;
  v33[4] = ACAccountTypeIdentifierIMAP;
  v33[5] = ACAccountTypeIdentifierIMAPMail;
  id v5 = +[NSArray arrayWithObjects:v33 count:6];
  long long v22 = v4;
  id v6 = [v4 accountsWithAccountTypeIdentifiers:v5 error:0];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v25;
    uint64_t v12 = MailAccountManagedTag;
    uint64_t v21 = ACAccountPropertyPersonaIdentifier;
    *(void *)&long long v9 = 138412546;
    long long v20 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v15 = [v14 accountPropertyForKey:v12, v20];
        if (v15)
        {
          if ([v3 isEqualToString:v15])
          {
            long long v16 = [v14 personaIdentifier];

            if (v16)
            {
              uint64_t v17 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                long long v29 = v14;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Removing personaIdentifier for mail account: %@", buf, 0xCu);
              }
              [v14 setAccountProperty:0 forKey:v21];
              id v23 = 0;
              [v22 saveVerifiedAccount:v14 error:&v23];
              id v18 = v23;
              if (v18)
              {
                int v19 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v20;
                  long long v29 = v14;
                  __int16 v30 = 2114;
                  id v31 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to remove personaIdentifier for mail account: %@, error: %{public}@", buf, 0x16u);
                }
              }
            }
          }
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v10);
  }
}

- (void)_remove
{
  id v3 = [(MCNewPayloadHandler *)self payload];
  id v4 = [v3 persistentResourceID];

  [(MCNewEmailAccountPayloadHandler *)self _removePersonaIDForMailAccountWithPersistentResourceID:v4];
  +[MailAccount reloadAccounts];
  id v5 = +[MailAccount mailAccounts];
  id v13 = 0;
  id v6 = [(MCNewEmailAccountPayloadHandler *)self _removeAccountWithPersistentResourceID:v4 fromArray:v5 outArray:&v13];
  id v7 = v13;

  if (v6)
  {
    id v8 = [v6 deliveryAccount];
    +[DeliveryAccount removeDeliveryAccount:v8];

    +[MailAccount setMailAccounts:v7];
    [v6 removePersistentAccount];
    long long v9 = [(MCNewPayloadHandler *)self payload];
    id v10 = [v9 UUID];
    uint64_t v11 = [(MCNewPayloadHandler *)self profileHandler];
    uint64_t v12 = [v11 profile];
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", @"MCEmailAccount", v10, 0, 0, [v12 isInstalledForSystem], 0);
  }
}

- (void)remove
{
  id v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v4 = [v3 isSetAside];

  if (v4)
  {
    setAsideAccountInfo = self->_setAsideAccountInfo;
    self->_setAsideAccountInfo = 0;
  }
  else
  {
    [(MCNewEmailAccountPayloadHandler *)self _remove];
  }
  id v6 = [(MCNewPayloadHandler *)self payload];
  [v6 setPersistentResourceID:0];
}

- (void)setAside
{
  id v3 = [(MCNewPayloadHandler *)self payload];
  unsigned int v4 = [v3 UUID];
  id v5 = [(MCNewPayloadHandler *)self profileHandler];
  id v6 = [v5 profile];
  id v7 = +[MCKeychain dataFromService:account:label:description:useSystemKeychain:outError:](MCKeychain, "dataFromService:account:label:description:useSystemKeychain:outError:", @"MCEmailAccount", v4, 0, 0, [v6 isInstalledForSystem], 0);

  +[MailAccount mailAccounts];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    long long v24 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v10 = MailAccountManagedTag;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v13 = [v12 accountPropertyForKey:v10, v24];
        if (v13)
        {
          uint64_t v14 = [(MCNewPayloadHandler *)self payload];
          long long v15 = [v14 persistentResourceID];
          unsigned int v16 = [v15 isEqualToString:v13];

          if (v16)
          {
            int v19 = [v12 valueInAccountPropertiesForKey:@"MCAccountIsManaged"];
            LOBYTE(v8) = [v19 BOOLValue];

            long long v20 = [v12 persistentAccount];
            id v18 = [v20 objectForKeyedSubscript:ACAccountPropertyPersonaIdentifier];

            uint64_t v21 = [v12 persistentAccount];
            uint64_t v17 = [v21 objectForKeyedSubscript:ACAccountPropertyRemoteManagingAccountIdentifier];

            goto LABEL_12;
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    uint64_t v17 = 0;
    id v18 = 0;
LABEL_12:
    id v7 = v24;
  }
  else
  {
    uint64_t v17 = 0;
    id v18 = 0;
  }

  if (v7)
  {
    long long v22 = +[NSPropertyListSerialization MCSafePropertyListWithData:v7 options:0 format:0 error:0];
    setAsideAccountInfo = self->_setAsideAccountInfo;
    self->_setAsideAccountInfo = v22;

    self->_wasInstalledByMDM = (char)v8;
    objc_storeStrong((id *)&self->_personaID, v18);
    objc_storeStrong((id *)&self->_rmAccountIdentifier, v17);
  }
  [(MCNewEmailAccountPayloadHandler *)self _remove];
}

- (void)unsetAside
{
  setAsideAccountInfo = self->_setAsideAccountInfo;
  if (setAsideAccountInfo)
  {
    unsigned int v4 = [(NSDictionary *)setAsideAccountInfo objectForKey:@"IncomingAccountInfo"];
    id v5 = [(NSDictionary *)self->_setAsideAccountInfo objectForKey:@"OutgoingAccountInfo"];
    id v6 = [(MCNewEmailAccountPayloadHandler *)self _installWithIncomingAccountInfo:v4 outgoingAccountInfo:v5 isInstalledByMDM:self->_wasInstalledByMDM personaID:self->_personaID rmAccountIdentifier:self->_rmAccountIdentifier];

    id v7 = self->_setAsideAccountInfo;
    self->_setAsideAccountInfo = 0;
  }
}

- (NSString)incomingACAccountIdentifier
{
  return self->_incomingACAccountIdentifier;
}

- (void)setIncomingACAccountIdentifier:(id)a3
{
}

- (NSString)outgoingACAccountIdentifier
{
  return self->_outgoingACAccountIdentifier;
}

- (void)setOutgoingACAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingACAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_incomingACAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_validationError, 0);
  objc_storeStrong((id *)&self->_outgoingAccount, 0);
  objc_storeStrong((id *)&self->_incomingAccount, 0);
  objc_storeStrong((id *)&self->_rmAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_setAsideAccountInfo, 0);
  objc_storeStrong((id *)&self->_validationThread, 0);

  objc_storeStrong((id *)&self->_validationLock, 0);
}

@end