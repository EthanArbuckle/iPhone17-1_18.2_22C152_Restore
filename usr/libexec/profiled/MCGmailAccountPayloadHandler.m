@interface MCGmailAccountPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (MCGmailAccountPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (NSDictionary)setAsideAccountDictionary;
- (id)MCACAccountIdentifier;
- (id)_installWithAccountDictionary:(id)a3;
- (id)accountDictionaryWithIsInstalledByMDM:(BOOL)a3 personaID:(id)a4 rmAccountIdentifier:(id)a5;
- (id)unhashedAccountIdentifier;
- (void)_remove;
- (void)remove;
- (void)setAside;
- (void)setSetAsideAccountDictionary:(id)a3;
- (void)unsetAside;
@end

@implementation MCGmailAccountPayloadHandler

- (MCGmailAccountPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MCGmailAccountPayloadHandler;
  return [(MCNewPayloadHandler *)&v5 initWithPayload:a3 profileHandler:a4];
}

- (id)unhashedAccountIdentifier
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 emailAddress];
  if (v3)
  {
    v4 = +[NSString stringWithFormat:@"google|%@", v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)MCACAccountIdentifier
{
  v2 = [(MCGmailAccountPayloadHandler *)self unhashedAccountIdentifier];
  v3 = [v2 MCHashedIdentifier];

  return v3;
}

- (id)accountDictionaryWithIsInstalledByMDM:(BOOL)a3 personaID:(id)a4 rmAccountIdentifier:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(MCNewPayloadHandler *)self payload];
  v11 = [v10 emailAddress];
  if (v11)
  {
    v12 = [v10 accountDescription];
    v26 = v8;
    if (![v12 length])
    {
      id v13 = v11;

      v12 = v13;
    }
    v14 = [v10 accountName];
    uint64_t v15 = [(MCGmailAccountPayloadHandler *)self unhashedAccountIdentifier];
    v16 = [v10 profile];
    v17 = [v16 displayName];
    v25 = (void *)v15;
    v18 = +[NSString stringWithFormat:@"%@|%@", v15, v17];

    v27[0] = MFMailAccountDescription;
    v27[1] = MFMailAccountUsername;
    v28[0] = v12;
    v28[1] = v11;
    v28[2] = v18;
    v27[2] = MailAccountManagedTag;
    v27[3] = @"MCAccountIsManaged";
    v19 = +[NSNumber numberWithBool:v6];
    v27[4] = MailAccountSSLEnabled;
    v28[3] = v19;
    v28[4] = &__kCFBooleanTrue;
    v20 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:5];
    v21 = +[NSMutableDictionary dictionaryWithDictionary:v20];

    if ([v14 length]) {
      [v21 setObject:v14 forKey:MailAccountFullUserName];
    }
    v22 = [v10 communicationServiceRules];

    if (v22)
    {
      v23 = [v10 communicationServiceRules];
      [v21 setObject:v23 forKeyedSubscript:kMCCommunicationServiceRulesAccountProperty];
    }
    id v8 = v26;
    if ([v26 length]) {
      [v21 setObject:v26 forKeyedSubscript:ACAccountPropertyPersonaIdentifier];
    }
    if (v9) {
      [v21 setObject:v9 forKeyedSubscript:ACAccountPropertyRemoteManagingAccountIdentifier];
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_installWithAccountDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  id v6 = +[GmailAccount newAccountWithDictionary:v5];

  v7 = [v6 persistentAccount];
  [v7 setManagingOwnerIdentifier:kMCAccountManagingOwnerIdentifier];
  id v8 = [(MCNewPayloadHandler *)self payload];
  id v9 = [v8 friendlyName];
  [v7 setManagingSourceName:v9];

  v10 = +[MDMCloudConfiguration sharedConfiguration];
  LODWORD(v9) = [v10 userMode];

  if (v9 == 1)
  {
    v11 = [(MCGmailAccountPayloadHandler *)self MCACAccountIdentifier];
    if (v11)
    {
      v12 = [v7 identifier];
      [v7 setAccountProperty:v12 forKey:@"MCAccountIdentifer"];

      [v7 setIdentifier:v11];
    }
  }
  id v13 = [(MCNewPayloadHandler *)self payload];
  v14 = [v13 UUID];
  [v7 setMcPayloadUUID:v14];

  uint64_t v15 = [(MCNewPayloadHandler *)self payload];
  v16 = [v15 profile];
  v17 = [v16 UUID];
  [v7 setMcProfileUUID:v17];

  v18 = [(MCNewPayloadHandler *)self payload];
  v19 = [v18 profile];
  v20 = [v19 identifier];

  if (v20)
  {
    [v7 setMcConfigurationProfileIdentifier:v20];
  }
  else
  {
    v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to retrieve profile identifier. Not setting profile identifier account property on Google account.", buf, 2u);
    }
  }
  [v7 setAccountProperty:&__kCFBooleanFalse forKey:ACAccountPropertyShouldNeverUseSyncableCredential];
  if (v6)
  {
    [v6 savePersistentAccount];
    v22 = 0;
  }
  else
  {
    v23 = [v4 objectForKey:MFMailAccountUsername];
    uint64_t v24 = MCGoogleErrorDomain;
    v25 = MCErrorArray();
    v22 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v24, 47000, v25, MCErrorTypeFatal, v23, 0);
  }
  v26 = [v6 persistentAccount];
  v27 = [v26 identifier];
  v28 = [(MCNewPayloadHandler *)self payload];
  [v28 setAcAccountIdentifier:v27];

  return v22;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v38 = a3;
  id v9 = a4;
  id v39 = a5;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_100086F00;
  v48 = sub_100086F10;
  id v49 = 0;
  v40 = v9;
  v10 = [v9 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
  id v11 = [v10 BOOLValue];

  if (!v11)
  {
    v14 = 0;
    goto LABEL_5;
  }
  uint64_t v12 = kMDMPersonaKey;
  id v13 = [v9 objectForKeyedSubscript:kMDMPersonaKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [v9 objectForKeyedSubscript:v12];
  }
  else
  {
    v14 = 0;
  }

  uint64_t v16 = kMCInstallProfileOptionManagingProfileIdentifier;
  v17 = [v9 objectForKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = 0;
    goto LABEL_11;
  }
  uint64_t v18 = [v9 objectForKeyedSubscript:v16];

  if (!v18)
  {
LABEL_5:
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  v19 = +[ACAccountStore defaultStore];
  v20 = [v19 dmc_remoteManagementAccountForManagementProfileIdentifier:v18];

  uint64_t v15 = [v20 identifier];

  v17 = (void *)v18;
LABEL_11:

LABEL_12:
  v21 = [(MCNewPayloadHandler *)self payload];
  v22 = [(MCGmailAccountPayloadHandler *)self accountDictionaryWithIsInstalledByMDM:v11 personaID:v14 rmAccountIdentifier:v15];
  v23 = [v22 objectForKey:MailAccountManagedTag];
  if (v22)
  {
    if ([v14 length])
    {
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100086F18;
      v41[3] = &unk_1000EBF58;
      v43 = &v44;
      v41[4] = self;
      id v42 = v22;
      id v24 = +[DMCPersonaHelper performBlockUnderPersona:v14 block:v41];
    }
    else
    {
      uint64_t v30 = [(MCGmailAccountPayloadHandler *)self _installWithAccountDictionary:v22];
      v31 = (void *)v45[5];
      v45[5] = v30;
    }
    if (!v45[5]) {
      [v21 setPersistentResourceID:v23];
    }
  }
  else
  {
    v25 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not create Google account description", buf, 2u);
    }
    v26 = [v21 emailAddress];
    v27 = MCErrorArray();
    uint64_t v28 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCGoogleErrorDomain, 47000, v27, MCErrorTypeFatal, v26, 0, v38);
    v29 = (void *)v45[5];
    v45[5] = v28;
  }
  uint64_t v32 = v45[5];
  if (v32)
  {
    v33 = _MCLogObjects[0];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = [(MCNewPayloadHandler *)self payload];
      v35 = [v34 friendlyName];
      v36 = [(id)v45[5] MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v51 = v35;
      __int16 v52 = 2114;
      v53 = v36;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Could not install Google payload %{public}@. Error: %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v44, 8);
  return v32 == 0;
}

- (BOOL)isInstalled
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 persistentResourceID];

  if (v3)
  {
    id v4 = +[ACAccountStore defaultStore];
    id v5 = [v4 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierGmail];
    [v4 accountsWithAccountType:v5];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      uint64_t v10 = MailAccountManagedTag;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) accountPropertyForKey:v10, (void)v16];
          id v13 = v12;
          if (v12 && ([v12 isEqualToString:v3] & 1) != 0)
          {

            BOOL v14 = 1;
            goto LABEL_14;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_14:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_remove
{
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 persistentResourceID];

  if (v3)
  {
    id v4 = +[ACAccountStore defaultStore];
    [v4 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierGmail];
    v29 = uint64_t v30 = v4;
    id v5 = [v4 accountsWithAccountType:];
    id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v41;
      uint64_t v11 = MailAccountManagedTag;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          BOOL v14 = [v13 accountPropertyForKey:v11];
          uint64_t v15 = v14;
          if (v14 && [v14 isEqualToString:v3]) {
            [v6 addObject:v13];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v9);
    }
    uint64_t v28 = v7;

    long long v16 = dispatch_group_create();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v6;
    id v17 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    long long v18 = v30;
    if (v17)
    {
      id v19 = v17;
      uint64_t v32 = *(void *)v37;
      uint64_t v20 = MailAccountManagedTag;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
          v23 = [v22 accountPropertyForKey:v20, v28];
          id v24 = [v23 componentsSeparatedByString:@"|"];
          if ((unint64_t)[v24 count] < 2)
          {
            id v26 = 0;
          }
          else
          {
            v25 = [v24 objectAtIndex:1];
            if ([v25 length]) {
              id v26 = v25;
            }
            else {
              id v26 = 0;
            }

            long long v18 = v30;
          }
          dispatch_group_enter(v16);
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_1000874B4;
          v33[3] = &unk_1000EBEC0;
          id v34 = v26;
          v35 = v16;
          id v27 = v26;
          [v18 removeAccount:v22 withCompletionHandler:v33];
        }
        id v19 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v19);
    }

    dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned int v4 = [v3 isSetAside];

  if (v4) {
    [(MCGmailAccountPayloadHandler *)self setSetAsideAccountDictionary:0];
  }
  else {
    [(MCGmailAccountPayloadHandler *)self _remove];
  }
  id v5 = [(MCNewPayloadHandler *)self payload];
  [v5 setPersistentResourceID:0];
}

- (void)setAside
{
  v3 = [(MCNewPayloadHandler *)self payload];
  unsigned int v4 = [v3 persistentResourceID];

  if (v4)
  {
    id v5 = +[ACAccountStore defaultStore];
    id v6 = [v5 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierGmail];
    [v5 accountsWithAccountType:v6];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      id v19 = v6;
      uint64_t v9 = *(void *)v21;
      uint64_t v10 = MailAccountManagedTag;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v13 = [v12 accountPropertyForKey:v10];
          BOOL v14 = v13;
          if (v13 && [v13 isEqualToString:v4])
          {
            id v17 = [v12 accountPropertyForKey:@"MCAccountIsManaged"];
            id v16 = [v17 BOOLValue];

            uint64_t v15 = [v12 accountPropertyForKey:ACAccountPropertyPersonaIdentifier];
            id v8 = [v12 accountPropertyForKey:ACAccountPropertyRemoteManagingAccountIdentifier];

            goto LABEL_13;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      uint64_t v15 = 0;
      id v16 = 0;
LABEL_13:
      id v6 = v19;
    }
    else
    {
      uint64_t v15 = 0;
      id v16 = 0;
    }

    long long v18 = [(MCGmailAccountPayloadHandler *)self accountDictionaryWithIsInstalledByMDM:v16 personaID:v15 rmAccountIdentifier:v8];
    [(MCGmailAccountPayloadHandler *)self setSetAsideAccountDictionary:v18];

    [(MCGmailAccountPayloadHandler *)self _remove];
  }
}

- (void)unsetAside
{
  v3 = [(MCGmailAccountPayloadHandler *)self setAsideAccountDictionary];

  if (v3)
  {
    id v5 = [(MCGmailAccountPayloadHandler *)self setAsideAccountDictionary];
    id v4 = [(MCGmailAccountPayloadHandler *)self _installWithAccountDictionary:v5];
  }
}

- (NSDictionary)setAsideAccountDictionary
{
  return self->_setAsideAccountDictionary;
}

- (void)setSetAsideAccountDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end