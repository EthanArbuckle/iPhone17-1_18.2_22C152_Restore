@interface MCNewSubCalAccountPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (id)_accountFromPayload;
- (id)_reallyInstallInstaller:(id)a3 isInstalledByMDM:(BOOL)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6;
- (id)accountTypeIdentifiers;
- (id)unhashedAccountIdentifier;
- (void)remove;
- (void)setAsideWithInstaller:(id)a3;
- (void)unsetAside;
@end

@implementation MCNewSubCalAccountPayloadHandler

- (id)unhashedAccountIdentifier
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 hostname];
  if (v3)
  {
    v4 = +[NSString stringWithFormat:@"subcal|%@", v3];
  }
  else
  {
    v4 = 0;
  }
  uint64_t v5 = [v2 username];
  v6 = (void *)v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 stringByAppendingFormat:@"|%@", v5];

    v4 = (void *)v7;
  }

  return v4;
}

- (id)_accountFromPayload
{
  v3 = [(MCNewPayloadHandler *)self payload];
  v4 = sharedDAAccountStore();
  uint64_t v5 = [v4 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierSubscribedCalendar];

  id v6 = [objc_alloc((Class)ACAccount) initWithAccountType:v5];
  [v6 setManagingOwnerIdentifier:kMCAccountManagingOwnerIdentifier];
  uint64_t v7 = [v3 friendlyName];
  [v6 setManagingSourceName:v7];

  v8 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v9 = [v8 userMode];

  if (v9 == 1)
  {
    v10 = [(MCACAccountPayloadHandler *)self MCACAccountIdentifier];
    if (v10)
    {
      v11 = [v6 identifier];
      [v6 setAccountProperty:v11 forKey:@"MCAccountIdentifer"];

      [v6 setIdentifier:v10];
    }
    v12 = sharedDAAccountStore();
    v13 = [v6 identifier];
    v14 = [v12 accountWithIdentifier:v13];

    if (v14)
    {
      v15 = [v14 objectID];
      [v6 performSelector:"_setObjectID:" withObject:v15];
    }
  }
  v16 = [v5 supportedDataclasses];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v50;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(v16);
        }
        [v6 setProvisioned:1 forDataclass:*(void *)(*((void *)&v49 + 1) + 8 * i)];
      }
      id v18 = [v16 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v18);
  }
  v21 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v6];
  v22 = v21;
  if (v21)
  {
    [v21 setEnabled:1 forDADataclass:4];
    v23 = [v3 password];
    v24 = &__kCFBooleanTrue;
    if (!v23) {
      v24 = &__kCFBooleanFalse;
    }
    id v25 = v24;

    v26 = [v22 backingAccountInfo];
    [v26 setAccountProperty:v25 forKey:ACAccountPropertyShouldNeverUseSyncableCredential];

    v27 = [v3 accountDescription];
    if (v27)
    {
      [v22 setAccountDescription:v27];
    }
    else
    {
      v28 = [v3 hostname];
      [v22 setAccountDescription:v28];
    }
    v29 = [v3 hostname];
    [v22 setHost:v29];

    v30 = [v3 username];
    [v22 setUsername:v30];

    v31 = [v3 password];
    [v22 setPassword:v31];

    [v22 setUseSSL:[v3 useSSL]];
    v32 = [v22 backingAccountInfo];
    v33 = [(MCNewPayloadHandler *)self payload];
    v34 = [v33 UUID];
    [v32 setMcPayloadUUID:v34];

    v35 = [v22 backingAccountInfo];
    v36 = [(MCNewPayloadHandler *)self payload];
    v37 = [v36 profile];
    v38 = [v37 UUID];
    [v35 setMcProfileUUID:v38];

    v39 = [(MCNewPayloadHandler *)self payload];
    v40 = [v39 profile];
    v41 = [v40 identifier];

    if (v41)
    {
      v42 = [v22 backingAccountInfo];
      [v42 setMcConfigurationProfileIdentifier:v41];
    }
    else
    {
      v43 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v48 = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to retrieve profile identifier. Not setting profile identifier account property on subscribed calendar.", v48, 2u);
      }
    }
    v44 = [v22 backingAccountInfo];
    v45 = [v44 identifier];
    v46 = [(MCNewPayloadHandler *)self payload];
    [v46 setAcAccountIdentifier:v45];
  }

  return v22;
}

- (id)_reallyInstallInstaller:(id)a3 isInstalledByMDM:(BOOL)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [(MCNewPayloadHandler *)self payload];
  v14 = [v13 hostname];

  if (v14)
  {
    v15 = [(MCNewSubCalAccountPayloadHandler *)self _accountFromPayload];
    v16 = v15;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = sub_100063A00;
    v56 = sub_100063A10;
    id v57 = 0;
    if (v15)
    {
      if (v8)
      {
        [v15 setAccountBoolProperty:1 forKey:@"MCAccountIsManaged"];
        if ([v11 length]) {
          [v16 setAccountProperty:v11 forKey:ACAccountPropertyPersonaIdentifier];
        }
        if (v12) {
          [v16 setAccountProperty:v12 forKey:ACAccountPropertyRemoteManagingAccountIdentifier];
        }
      }
      id v17 = [v16 backingAccountInfo];
      [(MCACAccountPayloadHandler *)self markIfUpdatingOverInstalledAccount:v17];

      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x3032000000;
      long long v49 = sub_100063A00;
      long long v50 = sub_100063A10;
      dispatch_semaphore_t v51 = dispatch_semaphore_create(0);
      uint64_t v42 = 0;
      v43 = &v42;
      uint64_t v44 = 0x2020000000;
      char v45 = 1;
      id v18 = [v10 setAsideAccountIdentifiersForPayloadClass:objc_opt_class()];
      if ([v18 count])
      {
        uint64_t v19 = [v16 backingAccountInfo];
        v20 = +[DASharedAccountProperties DAAccountIdentifiersToIgnoreForUniquenessCheck];
        [v19 setAccountProperty:v18 forKey:v20];
      }
      v21 = sharedDAAccountStore();
      v22 = [v16 backingAccountInfo];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100063A18;
      v41[3] = &unk_1000EBE98;
      v41[4] = &v42;
      v41[5] = &v46;
      [v21 canSaveAccount:v22 withCompletionHandler:v41];

      dispatch_semaphore_wait((dispatch_semaphore_t)v47[5], 0xFFFFFFFFFFFFFFFFLL);
      if (*((unsigned char *)v43 + 24))
      {
        v23 = [v16 backingAccountInfo];
        [v23 setAuthenticated:1];

        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100063A34;
        v37[3] = &unk_1000EAF68;
        v39 = &v46;
        id v38 = v16;
        v40 = &v52;
        v24 = objc_retainBlock(v37);
        if ([v11 length]) {
          id v25 = +[DMCPersonaHelper performBlockUnderPersona:v11 block:v24];
        }
        else {
          ((void (*)(void *))v24[2])(v24);
        }

        v32 = v38;
      }
      else
      {
        v32 = MCErrorArray();
        v33 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCSubCalErrorDomain, 16002, v32, MCErrorTypeFatal, 0);
        id v34 = [v33 MCCopyAsPrimaryError];
        v35 = (void *)v53[5];
        v53[5] = (uint64_t)v34;
      }
      _Block_object_dispose(&v42, 8);
      _Block_object_dispose(&v46, 8);
    }
    else
    {
      v29 = MCErrorArray();
      uint64_t v30 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCSubCalErrorDomain, 16000, v29, MCErrorTypeFatal, 0);
      v31 = (void *)v53[5];
      v53[5] = v30;
    }
    id v28 = (id)v53[5];
    _Block_object_dispose(&v52, 8);
  }
  else
  {
    uint64_t v26 = MCSubCalErrorDomain;
    v27 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v26, 16001, v27, MCErrorTypeFatal, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [v10 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
  id v12 = [v11 BOOLValue];

  if (v12)
  {
    uint64_t v13 = kMDMPersonaKey;
    v14 = [v10 objectForKeyedSubscript:kMDMPersonaKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [v10 objectForKeyedSubscript:v13];
    }
    else
    {
      v15 = 0;
    }

    uint64_t v17 = kMCInstallProfileOptionManagingProfileIdentifier;
    id v18 = [v10 objectForKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = 0;
      goto LABEL_11;
    }
    uint64_t v19 = [v10 objectForKeyedSubscript:v17];

    if (v19)
    {
      v20 = +[ACAccountStore defaultStore];
      v21 = [v20 dmc_remoteManagementAccountForManagementProfileIdentifier:v19];

      v16 = [v21 identifier];

      id v18 = (void *)v19;
LABEL_11:

      goto LABEL_12;
    }
  }
  else
  {
    v15 = 0;
  }
  v16 = 0;
LABEL_12:
  v22 = [(MCNewSubCalAccountPayloadHandler *)self _reallyInstallInstaller:v9 isInstalledByMDM:v12 personaID:v15 rmAccountIdentifier:v16];
  v23 = v22;
  if (a6 && v22) {
    *a6 = v22;
  }

  return v23 == 0;
}

- (id)accountTypeIdentifiers
{
  uint64_t v4 = ACAccountTypeIdentifierSubscribedCalendar;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

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
  v10.receiver = self;
  v10.super_class = (Class)MCNewSubCalAccountPayloadHandler;
  [(MCNewPayloadHandler *)&v10 setAsideWithInstaller:v4];
  uint64_t v5 = [(MCACAccountPayloadHandler *)self _installedDAAccount];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 backingAccountInfo];
    [(MCACAccountPayloadHandler *)self setSetAsideAccount:v7];

    BOOL v8 = [v6 backingAccountInfo];
    id v9 = [v8 identifier];
    [v4 addSetAsideAccountIdentifier:v9 forPayloadClass:objc_opt_class()];
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

      uint64_t v7 = [v4 backingAccountInfo];
      BOOL v8 = [v7 accountPropertyForKey:@"MCAccountIdentifer"];

      if (v6 && (!v8 || ([v6 isEqualToString:v8] & 1) == 0))
      {
        id v9 = [(MCACAccountPayloadHandler *)self setAsideAccount];
        [v9 markAllPropertiesDirty];
        dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
        id v11 = sharedDAAccountStore();
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100064150;
        v15[3] = &unk_1000EBEC0;
        id v16 = v9;
        dispatch_semaphore_t v17 = v10;
        id v12 = v10;
        id v13 = v9;
        [v11 saveVerifiedAccount:v13 withCompletionHandler:v15];

        dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      }
      [(MCACAccountPayloadHandler *)self setSetAsideAccount:0];
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

  if (!v4)
  {
    if ([(MCACAccountPayloadHandler *)self updatedOverInstalledAccount])
    {
      uint64_t v7 = 0;
      goto LABEL_11;
    }
    BOOL v8 = [(MCACAccountPayloadHandler *)self _installedDAAccount];
    uint64_t v7 = [v8 backingAccountInfo];

    if (!v7) {
      goto LABEL_11;
    }
LABEL_10:
    +[MCFeatureOverrides accountRemovalTimeoutWithDefaultValue:600.0];
    -[MCACAccountPayloadHandler _synchronouslyDeleteAccountAndAssociatedData:timeout:completion:](self, "_synchronouslyDeleteAccountAndAssociatedData:timeout:completion:", v7, 0);
    goto LABEL_11;
  }
  uint64_t v5 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v6 = [v5 userMode];

  if (v6 == 1) {
    [(MCACAccountPayloadHandler *)self _installedSetAsideACAccount];
  }
  else {
  uint64_t v7 = [(MCACAccountPayloadHandler *)self setAsideAccount];
  }
  [(MCACAccountPayloadHandler *)self setSetAsideAccount:0];
  if (v7) {
    goto LABEL_10;
  }
LABEL_11:
}

@end