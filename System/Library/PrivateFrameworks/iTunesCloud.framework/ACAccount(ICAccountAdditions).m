@interface ACAccount(ICAccountAdditions)
- (BOOL)ic_isSandboxed;
- (id)ic_DSID;
- (id)ic_ageVerificationExpirationDate;
- (id)ic_automaticDownloadKinds;
- (id)ic_description;
- (id)ic_privateListeningEnabledForHomeUsers;
- (id)ic_storefront;
- (id)ic_uniqueIdentifier;
- (uint64_t)ic_activeMediaTypes;
- (uint64_t)ic_altDSID;
- (uint64_t)ic_cloudLibraryStateReason;
- (uint64_t)ic_firstName;
- (uint64_t)ic_homeUserIdentifiers;
- (uint64_t)ic_isActiveLockerAccount;
- (uint64_t)ic_isAutomaticDownloadsEnabledForMediaKindMusic;
- (uint64_t)ic_isCloudBackupEnabled;
- (uint64_t)ic_isITunesAccount;
- (uint64_t)ic_isManageable;
- (uint64_t)ic_isManagedAppleID;
- (uint64_t)ic_isSubscriptionStatusEnabled;
- (uint64_t)ic_isU18MinorAccount;
- (uint64_t)ic_lastName;
- (uint64_t)ic_mergeWithCloudLibraryPreference;
- (uint64_t)ic_privacyAcknowledgementVersions;
- (uint64_t)ic_privateListeningEnabled;
- (uint64_t)ic_setAltDSID:()ICAccountAdditions;
- (uint64_t)ic_setCloudLibraryStateReason:()ICAccountAdditions;
- (uint64_t)ic_setDSID:()ICAccountAdditions;
- (uint64_t)ic_setFirstName:()ICAccountAdditions;
- (uint64_t)ic_setLastName:()ICAccountAdditions;
- (uint64_t)ic_setMergeWithCloudLibraryPreference:()ICAccountAdditions;
- (uint64_t)ic_setPrivateListeningEnabled:()ICAccountAdditions;
- (uint64_t)ic_setStorefront:()ICAccountAdditions;
- (void)ic_setActiveLockerAccount:()ICAccountAdditions;
- (void)ic_setAgeVerificationExpirationDate:()ICAccountAdditions;
- (void)ic_setAutomaticDownloadKinds:()ICAccountAdditions;
- (void)ic_setManagedAppleID:()ICAccountAdditions;
- (void)ic_setPrivateListeningEnabledForHomeUsers:()ICAccountAdditions;
- (void)ic_setSandboxed:()ICAccountAdditions;
- (void)ic_setSubscriptionStatusEnabled:()ICAccountAdditions;
- (void)ic_setUniqueIdentifier:()ICAccountAdditions;
@end

@implementation ACAccount(ICAccountAdditions)

- (uint64_t)ic_isITunesAccount
{
  v2 = [a1 accountType];
  v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F17890]];

  if (!v4) {
    return 0;
  }
  v5 = +[ICDeviceInfo currentDeviceInfo];
  int v6 = [v5 isMac];

  if (!v6) {
    return 1;
  }
  v7 = objc_msgSend(a1, "ic_activeMediaTypes");
  BOOL v8 = ![v7 count]
    || [v7 containsObject:@"com.apple.AppleMediaServices.accountmediatype.itunes"];

  return v8;
}

- (uint64_t)ic_isActiveLockerAccount
{
  v1 = [a1 accountPropertyForKey:@"isActiveLockerAccount"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)ic_isManageable
{
  uint64_t v2 = +[ICDeviceInfo currentDeviceInfo];
  if (([v2 isAppleTV] & 1) == 0 && (objc_msgSend(v2, "isAudioAccessory") & 1) == 0)
  {
    uint64_t v6 = [a1 isActive];
    goto LABEL_16;
  }
  int v3 = [v2 isAppleTV];
  char v4 = [a1 isActive];
  if (v3)
  {
    if ((v4 & 1) == 0)
    {
      if ((objc_msgSend(a1, "ic_isLocalAccount") & 1) == 0)
      {
        v5 = objc_msgSend(a1, "ic_DSID");
        uint64_t v6 = v5 != 0;

        goto LABEL_16;
      }
LABEL_11:
      uint64_t v6 = 0;
      goto LABEL_16;
    }
LABEL_8:
    uint64_t v6 = 1;
    goto LABEL_16;
  }
  if (v4) {
    goto LABEL_8;
  }
  if (objc_msgSend(a1, "ic_isLocalAccount")) {
    goto LABEL_11;
  }
  v7 = objc_msgSend(a1, "ic_homeUserIdentifiers");
  if ([v7 count])
  {
    BOOL v8 = objc_msgSend(a1, "ic_DSID");
    uint64_t v6 = v8 != 0;
  }
  else
  {
    uint64_t v6 = 0;
  }

LABEL_16:
  return v6;
}

- (id)ic_description
{
  v72[0] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 identifier];
  int v3 = [a1 username];
  char v4 = +[ICDeviceInfo currentDeviceInfo];
  char v5 = [v4 isInternalBuild];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = &stru_1EF5F5C40;
    if (v3) {
      uint64_t v6 = v3;
    }
    v7 = v6;
    memset(v67, 0, sizeof(v67));
    CC_SHA1_Init((CC_SHA1_CTX *)v67);
    BOOL v8 = v7;
    CC_SHA1_Update((CC_SHA1_CTX *)v67, (const void *)[(__CFString *)v8 UTF8String], [(__CFString *)v8 length]);

    memset(&v68[8], 0, 64);
    *(void *)v68 = 4001;
    CC_SHA1_Final(&v68[8], (CC_SHA1_CTX *)v67);
    v69[0] = *(_OWORD *)v68;
    v69[1] = *(_OWORD *)&v68[16];
    v69[2] = *(_OWORD *)&v68[32];
    v69[3] = *(_OWORD *)&v68[48];
    uint64_t v70 = *(void *)&v68[64];
    if (*(uint64_t *)v68 > 3999)
    {
      if (*(uint64_t *)v68 > 4255)
      {
        if (*(void *)v68 == 4256)
        {
          v50 = (unsigned __int8 *)v69 + 8;
          v51 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
          v52 = v51;
          for (uint64_t i = 0; i != 64; i += 2)
          {
            unsigned int v54 = *v50++;
            v55 = &v51[i];
            char *v55 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v54 >> 4];
            v55[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v54 & 0xF];
          }
          id v21 = [NSString alloc];
          v22 = v52;
          uint64_t v23 = 64;
        }
        else
        {
          if (*(void *)v68 != 4512) {
            goto LABEL_60;
          }
          v28 = (unsigned __int8 *)v69 + 8;
          v29 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
          v30 = v29;
          for (uint64_t j = 0; j != 128; j += 2)
          {
            unsigned int v32 = *v28++;
            v33 = &v29[j];
            char *v33 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v32 >> 4];
            v33[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v32 & 0xF];
          }
          id v21 = [NSString alloc];
          v22 = v30;
          uint64_t v23 = 128;
        }
      }
      else if (*(void *)v68 == 4000)
      {
        v40 = (unsigned __int8 *)v69 + 8;
        v41 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
        v42 = v41;
        for (uint64_t k = 0; k != 32; k += 2)
        {
          unsigned int v44 = *v40++;
          v45 = &v41[k];
          char *v45 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v44 >> 4];
          v45[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v44 & 0xF];
        }
        id v21 = [NSString alloc];
        v22 = v42;
        uint64_t v23 = 32;
      }
      else
      {
        if (*(void *)v68 != 4001) {
          goto LABEL_60;
        }
        v15 = (unsigned __int8 *)v69 + 8;
        v16 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
        v17 = v16;
        for (uint64_t m = 0; m != 40; m += 2)
        {
          unsigned int v19 = *v15++;
          v20 = &v16[m];
          char *v20 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v19 >> 4];
          v20[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v19 & 0xF];
        }
        id v21 = [NSString alloc];
        v22 = v17;
        uint64_t v23 = 40;
      }
    }
    else
    {
      if (*(uint64_t *)v68 <= 2999)
      {
        if (*(void *)v68 == 1000)
        {
          uint64_t v34 = *((void *)&v69[0] + 1);
          v35 = (char *)v72 + 1;
          uint64_t quot = *((void *)&v69[0] + 1);
          do
          {
            lldiv_t v37 = lldiv(quot, 10);
            uint64_t quot = v37.quot;
            if (v37.rem >= 0) {
              LOBYTE(v38) = v37.rem;
            }
            else {
              uint64_t v38 = -v37.rem;
            }
            *(v35 - 2) = v38 + 48;
            v14 = (const UInt8 *)(v35 - 2);
            --v35;
          }
          while (v37.quot);
          if (v34 < 0)
          {
            *(v35 - 2) = 45;
            v14 = (const UInt8 *)(v35 - 2);
          }
          v13 = (char *)((char *)v72 - (char *)v14);
          goto LABEL_38;
        }
        if (*(void *)v68 == 2000)
        {
          uint64_t v9 = DWORD2(v69[0]);
          v10 = v72;
          do
          {
            ldiv_t v11 = ldiv(v9, 10);
            uint64_t v9 = v11.quot;
            if (v11.rem >= 0) {
              LOBYTE(v12) = v11.rem;
            }
            else {
              uint64_t v12 = -v11.rem;
            }
            *((unsigned char *)v10 - 1) = v12 + 48;
            v10 = (void *)((char *)v10 - 1);
          }
          while (v11.quot);
          v13 = (char *)((char *)v72 - (char *)v10);
          v14 = (const UInt8 *)v10;
LABEL_38:
          CFStringRef v39 = CFStringCreateWithBytes(0, v14, (CFIndex)v13, 0x8000100u, 0);
LABEL_49:
          v56 = (__CFString *)v39;
LABEL_50:

          int v3 = v56;
          goto LABEL_51;
        }
LABEL_60:
        v65 = [MEMORY[0x1E4F28B00] currentHandler];
        v66 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
        [v65 handleFailureInFunction:v66 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

        v56 = &stru_1EF5F5C40;
        goto LABEL_50;
      }
      if (*(void *)v68 == 3000)
      {
        LODWORD(v71[0]) = bswap32(DWORD2(v69[0]));
        v46 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v47 = 0;
        v48 = v46 + 1;
        do
        {
          unint64_t v49 = *((unsigned __int8 *)v71 + v47);
          *(v48 - 1) = MSVFastHexStringFromBytes_hexCharacters_41692[v49 >> 4];
          unsigned char *v48 = MSVFastHexStringFromBytes_hexCharacters_41692[v49 & 0xF];
          v48 += 2;
          ++v47;
        }
        while (v47 != 4);
        id v21 = [NSString alloc];
        v22 = v46;
        uint64_t v23 = 8;
      }
      else
      {
        if (*(void *)v68 != 3001) {
          goto LABEL_60;
        }
        v71[0] = bswap64(*((unint64_t *)&v69[0] + 1));
        v24 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v25 = 0;
        v26 = v24 + 1;
        do
        {
          unint64_t v27 = *((unsigned __int8 *)v71 + v25);
          *(v26 - 1) = MSVFastHexStringFromBytes_hexCharacters_41692[v27 >> 4];
          unsigned char *v26 = MSVFastHexStringFromBytes_hexCharacters_41692[v27 & 0xF];
          v26 += 2;
          ++v25;
        }
        while (v25 != 8);
        id v21 = [NSString alloc];
        v22 = v24;
        uint64_t v23 = 16;
      }
    }
    CFStringRef v39 = (CFStringRef)[v21 initWithBytesNoCopy:v22 length:v23 encoding:4 freeWhenDone:1];
    goto LABEL_49;
  }
LABEL_51:
  if (objc_msgSend(a1, "ic_isITunesAccount"))
  {
    v57 = NSString;
    v58 = objc_msgSend(a1, "ic_DSID");
    v59 = ICCreateLoggableValueForDSID(v58);
    v60 = [v57 stringWithFormat:@"<%@ (%@) [DSID=%@, isActive=%d]>", v3, v2, v59, objc_msgSend(a1, "isActive")];
  }
  else
  {
    v61 = [a1 accountType];
    v62 = [v61 identifier];
    int v63 = [v62 isEqualToString:*MEMORY[0x1E4F17750]];

    if (v63) {
      [NSString stringWithFormat:@"<%@ (%@) [primary=%d]>", v3, v2, objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38])];
    }
    else {
    v60 = [a1 description];
    }
  }

  return v60;
}

- (id)ic_DSID
{
  v1 = [a1 accountPropertyForKey:@"dsid"];
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v1, "longLongValue"));

  return v2;
}

- (id)ic_storefront
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v1 = [a1 accountPropertyForKey:@"storefrontID"];
  if (_NSIsNSString())
  {
    id v2 = v1;
  }
  else
  {
    if (v1)
    {
      int v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        int v6 = 138543618;
        id v7 = (id)objc_opt_class();
        __int16 v8 = 2114;
        uint64_t v9 = v1;
        id v4 = v7;
        _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_FAULT, "unexpected storefront value type. propertyType=%{public}@ propertyValue=%{public}@", (uint8_t *)&v6, 0x16u);
      }
    }
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)ic_privateListeningEnabled
{
  return [a1 accountPropertyForKey:@"musicPrivateListeningEnabled"];
}

- (id)ic_privateListeningEnabledForHomeUsers
{
  v1 = [a1 accountPropertyForKey:@"musicPrivateListeningEnabledForHomeUsers"];
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
  if (_NSIsNSDictionary())
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __71__ACAccount_ICAccountAdditions__ic_privateListeningEnabledForHomeUsers__block_invoke;
    v4[3] = &unk_1E5ACBB50;
    id v5 = v2;
    [v1 enumerateKeysAndObjectsUsingBlock:v4];
  }

  return v2;
}

- (uint64_t)ic_privacyAcknowledgementVersions
{
  return [a1 accountPropertyForKey:@"privacyAcknowledgement"];
}

- (uint64_t)ic_mergeWithCloudLibraryPreference
{
  return [a1 accountPropertyForKey:@"mergeToCloudLibraryPreference"];
}

- (uint64_t)ic_lastName
{
  return [a1 accountPropertyForKey:@"lastName"];
}

- (uint64_t)ic_isU18MinorAccount
{
  v0 = +[ICDefaults standardDefaults];
  uint64_t v1 = [v0 cachedU18MinorAccountStatus];

  return v1;
}

- (uint64_t)ic_isSubscriptionStatusEnabled
{
  uint64_t v1 = [a1 accountPropertyForKey:@"eligibleServices"];
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 0);
  int v3 = [v1 objectForKey:v2];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)ic_isSandboxed
{
  uint64_t v1 = [a1 accountPropertyForKey:@"scope"];
  BOOL v2 = [v1 integerValue] == 1;

  return v2;
}

- (uint64_t)ic_isManagedAppleID
{
  uint64_t v1 = [a1 accountPropertyForKey:@"isManagedAppleID"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)ic_homeUserIdentifiers
{
  return MEMORY[0x1E4F1CBF0];
}

- (uint64_t)ic_firstName
{
  return [a1 accountPropertyForKey:@"firstName"];
}

- (uint64_t)ic_cloudLibraryStateReason
{
  return [a1 accountPropertyForKey:@"cloudLibraryStateReason"];
}

- (uint64_t)ic_altDSID
{
  return [a1 accountPropertyForKey:@"altDSID"];
}

- (id)ic_ageVerificationExpirationDate
{
  uint64_t v1 = objc_msgSend(a1, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E4F4D9C0]);
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(objc_msgSend(v1, "longLongValue") / 1000));
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)ic_activeMediaTypes
{
  return [a1 accountPropertyForKey:@"activeMediaTypes"];
}

- (void)ic_setPrivateListeningEnabledForHomeUsers:()ICAccountAdditions
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
    id v5 = a3;
    int v6 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__ACAccount_ICAccountAdditions__ic_setPrivateListeningEnabledForHomeUsers___block_invoke;
    v8[3] = &unk_1E5ACBB78;
    id v7 = v6;
    id v9 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else
  {
    id v7 = 0;
  }
  [a1 setAccountProperty:v7 forKey:@"musicPrivateListeningEnabledForHomeUsers"];
}

- (uint64_t)ic_setPrivateListeningEnabled:()ICAccountAdditions
{
  return [a1 setAccountProperty:a3 forKey:@"musicPrivateListeningEnabled"];
}

- (uint64_t)ic_isAutomaticDownloadsEnabledForMediaKindMusic
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend(a1, "ams_automaticDownloadKinds");
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = +[ICUpdateAutomaticDownloadMediaKindsRequest automaticDownloadMediaKindsForMusic];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    LODWORD(v6) = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [v1 containsObject:*(void *)(*((void *)&v9 + 1) + 8 * i)] & v6;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (void)ic_setAutomaticDownloadKinds:()ICAccountAdditions
{
  if (a3)
  {
    uint64_t v4 = [a3 allObjects];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [a1 setAccountProperty:v4 forKey:@"automaticDownloadKinds"];
}

- (id)ic_automaticDownloadKinds
{
  uint64_t v1 = objc_msgSend(a1, "ams_automaticDownloadKinds");
  if ([v1 count])
  {
    uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithArray:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)ic_setCloudLibraryStateReason:()ICAccountAdditions
{
  return [a1 setAccountProperty:a3 forKey:@"cloudLibraryStateReason"];
}

- (void)ic_setSubscriptionStatusEnabled:()ICAccountAdditions
{
  id v5 = [a1 accountPropertyForKey:@"eligibleServices"];
  uint64_t v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  long long v9 = v8;

  long long v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 0);
  long long v11 = [NSNumber numberWithBool:a3];
  [v9 setObject:v11 forKey:v10];

  id v12 = (id)[v9 copy];
  [a1 setAccountProperty:v12 forKey:@"eligibleServices"];
}

- (uint64_t)ic_setMergeWithCloudLibraryPreference:()ICAccountAdditions
{
  return [a1 setAccountProperty:a3 forKey:@"mergeToCloudLibraryPreference"];
}

- (void)ic_setAgeVerificationExpirationDate:()ICAccountAdditions
{
  [a3 timeIntervalSince1970];
  id v5 = [NSNumber numberWithLongLong:(uint64_t)v4];
  objc_msgSend(a1, "ams_setAccountFlagValue:forAccountFlag:", v5, *MEMORY[0x1E4F4D9C0]);
}

- (void)ic_setManagedAppleID:()ICAccountAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setAccountProperty:v2 forKey:@"isManagedAppleID"];
}

- (uint64_t)ic_isCloudBackupEnabled
{
  return [a1 isEnabledForDataclass:*MEMORY[0x1E4F17A68]];
}

- (void)ic_setActiveLockerAccount:()ICAccountAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setAccountProperty:v2 forKey:@"isActiveLockerAccount"];
}

- (void)ic_setSandboxed:()ICAccountAdditions
{
  id v4 = [NSNumber numberWithInteger:a3];
  [a1 setAccountProperty:v4 forKey:@"scope"];
}

- (void)ic_setUniqueIdentifier:()ICAccountAdditions
{
  id v4 = [a3 stringValue];
  [a1 setAccountProperty:v4 forKey:@"dsid"];
}

- (id)ic_uniqueIdentifier
{
  uint64_t v1 = [a1 accountPropertyForKey:@"dsid"];
  id v2 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v1, "longLongValue"));

  return v2;
}

- (uint64_t)ic_setStorefront:()ICAccountAdditions
{
  return [a1 setAccountProperty:a3 forKey:@"storefrontID"];
}

- (uint64_t)ic_setLastName:()ICAccountAdditions
{
  return [a1 setAccountProperty:a3 forKey:@"lastName"];
}

- (uint64_t)ic_setFirstName:()ICAccountAdditions
{
  return [a1 setAccountProperty:a3 forKey:@"firstName"];
}

- (uint64_t)ic_setAltDSID:()ICAccountAdditions
{
  return [a1 setAccountProperty:a3 forKey:@"altDSID"];
}

- (uint64_t)ic_setDSID:()ICAccountAdditions
{
  return [a1 setAccountProperty:a3 forKey:@"dsid"];
}

@end