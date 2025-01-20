@interface SFSharablePassword
+ (BOOL)safariCredentialURLHasPasskey:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_decryptedDataForEncryptedData:(id)a3 encryptionKeyReference:(id)a4;
+ (id)sharablePasswordFromData:(id)a3;
+ (id)sharablePasswordFromEncryptedData:(id)a3 encryptionKeyReference:(id)a4;
+ (id)sharablePasswordFromURL:(id)a3;
- (BOOL)_hasPasskeyData;
- (BOOL)_hasPasswordData;
- (BOOL)hasAnyCredentialData;
- (BOOL)hasPasswordWithConflicts;
- (BOOL)isEqual:(id)a3;
- (NSArray)additionalSites;
- (NSArray)protectionSpaces;
- (NSData)passkeyCredential;
- (NSData)passkeyCredentialID;
- (NSString)customTitle;
- (NSString)displayName;
- (NSString)highLevelDomain;
- (NSString)notesEntry;
- (NSString)passkeyRelyingPartyID;
- (NSString)password;
- (NSString)username;
- (NSURL)otpAuthURL;
- (NSURL)passwordManagerURL;
- (SFSharablePassword)initWithCoder:(id)a3;
- (SFSharablePassword)initWithSavedPassword:(id)a3;
- (SFSharablePassword)initWithUsername:(id)a3 password:(id)a4 displayName:(id)a5 highLevelDomain:(id)a6 passkeyRelyingPartyID:(id)a7 protectionSpaces:(id)a8;
- (id)_encryptionInformationWithNewKey;
- (id)_queryItemsForAirDropRepresentationWithEncryptionInformation:(id)a3;
- (id)_savePasskeyAccount;
- (id)_savePasswordAccount;
- (id)_usernameOrEmptyString;
- (id)saveToKeychain;
- (id)urlRepresentationForAirDrop;
- (unint64_t)hash;
- (void)_encryptionInformationWithNewKey;
- (void)_saveAdditionalSitesForSavedAccount:(id)a3;
- (void)_saveCustomTitleForSavedAccount:(id)a3;
- (void)_saveNotesEntryForSavedAccount:(id)a3;
- (void)_saveOneTimeCodeForSavedAccount:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)savePasskeyAccountAndMergeIntoSavedPasswordAccountIfNeeded:(id)a3;
@end

@implementation SFSharablePassword

- (SFSharablePassword)initWithUsername:(id)a3 password:(id)a4 displayName:(id)a5 highLevelDomain:(id)a6 passkeyRelyingPartyID:(id)a7 protectionSpaces:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)SFSharablePassword;
  v20 = [(SFSharablePassword *)&v35 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    username = v20->_username;
    v20->_username = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    password = v20->_password;
    v20->_password = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    displayName = v20->_displayName;
    v20->_displayName = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    highLevelDomain = v20->_highLevelDomain;
    v20->_highLevelDomain = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    passkeyRelyingPartyID = v20->_passkeyRelyingPartyID;
    v20->_passkeyRelyingPartyID = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    protectionSpaces = v20->_protectionSpaces;
    v20->_protectionSpaces = (NSArray *)v31;

    v33 = v20;
  }

  return v20;
}

- (SFSharablePassword)initWithSavedPassword:(id)a3
{
  id v4 = a3;
  v5 = [v4 effectiveTitle];
  v6 = [v4 user];
  v7 = [v4 password];
  v8 = [v4 highLevelDomain];
  v9 = [v4 passkeyRelyingPartyID];
  v10 = [v4 protectionSpaces];
  v11 = [(SFSharablePassword *)self initWithUsername:v6 password:v7 displayName:v5 highLevelDomain:v8 passkeyRelyingPartyID:v9 protectionSpaces:v10];

  if (v11)
  {
    uint64_t v12 = [v4 additionalSites];
    additionalSites = v11->_additionalSites;
    v11->_additionalSites = (NSArray *)v12;

    id v14 = [v4 totpGenerators];
    id v15 = [v14 firstObject];
    uint64_t v16 = [v15 exportableURL];
    otpAuthURL = v11->_otpAuthURL;
    v11->_otpAuthURL = (NSURL *)v16;

    uint64_t v18 = [v4 notesEntry];
    notesEntry = v11->_notesEntry;
    v11->_notesEntry = (NSString *)v18;

    uint64_t v20 = [v4 customTitle];
    customTitle = v11->_customTitle;
    v11->_customTitle = (NSString *)v20;

    v22 = [v4 _exportPasskeyCredential];
    uint64_t v23 = [v22 first];
    passkeyCredentialID = v11->_passkeyCredentialID;
    v11->_passkeyCredentialID = (NSData *)v23;

    uint64_t v25 = [v22 second];
    passkeyCredential = v11->_passkeyCredential;
    v11->_passkeyCredential = (NSData *)v25;

    uint64_t v27 = v11;
  }

  return v11;
}

+ (id)sharablePasswordFromEncryptedData:(id)a3 encryptionKeyReference:(id)a4
{
  id v4 = [a1 _decryptedDataForEncryptedData:a3 encryptionKeyReference:a4];
  v5 = +[SFSharablePassword sharablePasswordFromData:v4];

  return v5;
}

+ (id)sharablePasswordFromData:(id)a3
{
  v3 = (void *)MEMORY[0x263F08928];
  id v4 = a3;
  id v11 = 0;
  v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];

  id v6 = v11;
  v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[SFSharablePassword sharablePasswordFromData:](v9);
    }
  }

  return v5;
}

+ (id)sharablePasswordFromURL:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 scheme];
  char v6 = [v5 isEqualToString:@"safaricredential"];

  if ((v6 & 1) == 0)
  {
    uint64_t v25 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[SFSharablePassword sharablePasswordFromURL:](v25);
    }
    v24 = 0;
    goto LABEL_26;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v7 = [MEMORY[0x263F08BA0] componentsWithURL:v4 resolvingAgainstBaseURL:0];
  BOOL v8 = [v7 queryItems];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v9)
  {

    uint64_t v12 = 0;
    id v11 = 0;
    goto LABEL_22;
  }
  uint64_t v10 = v9;
  id v28 = a1;
  id v29 = v4;
  id v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v8);
      }
      id v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      uint64_t v16 = objc_msgSend(v15, "name", v28);
      if ([v16 isEqualToString:@"data"])
      {
        id v17 = objc_alloc(MEMORY[0x263EFF8F8]);
        uint64_t v18 = [v15 value];
        uint64_t v19 = [v17 initWithBase64EncodedString:v18 options:0];
        uint64_t v20 = v12;
        uint64_t v12 = (void *)v19;
      }
      else
      {
        if (![v16 isEqualToString:@"key"]) {
          goto LABEL_12;
        }
        id v21 = objc_alloc(MEMORY[0x263EFF8F8]);
        uint64_t v18 = [v15 value];
        uint64_t v22 = [v21 initWithBase64EncodedString:v18 options:0];
        uint64_t v20 = v11;
        id v11 = (void *)v22;
      }

LABEL_12:
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v10);

  if (v12)
  {
    id v4 = v29;
    if (v11)
    {
      uint64_t v23 = [v28 _decryptedDataForEncryptedData:v12 encryptionKeyReference:v11];
      v24 = +[SFSharablePassword sharablePasswordFromData:v23];

      goto LABEL_25;
    }
  }
  else
  {
    id v4 = v29;
  }
LABEL_22:
  v26 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    +[SFSharablePassword sharablePasswordFromURL:](v26);
  }
  v24 = 0;
LABEL_25:

LABEL_26:
  return v24;
}

- (NSURL)passwordManagerURL
{
  v12[3] = *MEMORY[0x263EF8340];
  v2 = [(SFSharablePassword *)self _encryptionInformationWithNewKey];
  v11[0] = *MEMORY[0x263F66480];
  v3 = [v2 encryptedPasswordData];
  id v4 = [v3 base64EncodedStringWithOptions:0];
  v12[0] = v4;
  v11[1] = *MEMORY[0x263F66488];
  v5 = [v2 encryptionKeyReference];
  char v6 = [v5 base64EncodedStringWithOptions:0];
  v11[2] = *MEMORY[0x263F66468];
  uint64_t v7 = *MEMORY[0x263F66460];
  v12[1] = v6;
  v12[2] = v7;
  BOOL v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  uint64_t v9 = [MEMORY[0x263F662F8] passwordManagerURLWithDictionary:v8];

  return (NSURL *)v9;
}

- (id)urlRepresentationForAirDrop
{
  v3 = [(SFSharablePassword *)self _encryptionInformationWithNewKey];
  id v4 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v4 setScheme:@"safaricredential"];
  v5 = [(SFSharablePassword *)self _queryItemsForAirDropRepresentationWithEncryptionInformation:v3];
  [v4 setQueryItems:v5];

  char v6 = [v4 URL];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFSharablePassword *)a3;
  if (self == v4)
  {
    char v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      username = self->_username;
      uint64_t v7 = [(SFSharablePassword *)v5 username];
      if ([(NSString *)username isEqualToString:v7])
      {
        password = self->_password;
        uint64_t v9 = [(SFSharablePassword *)v5 password];
        if ([(NSString *)password isEqualToString:v9])
        {
          displayName = self->_displayName;
          id v11 = [(SFSharablePassword *)v5 displayName];
          if ([(NSString *)displayName isEqualToString:v11])
          {
            highLevelDomain = self->_highLevelDomain;
            uint64_t v13 = [(SFSharablePassword *)v5 highLevelDomain];
            if ([(NSString *)highLevelDomain isEqualToString:v13])
            {
              id v14 = [(SFSharablePassword *)v5 additionalSites];
              if (WBSIsEqual())
              {
                id v15 = [(SFSharablePassword *)v5 otpAuthURL];
                if (WBSIsEqual())
                {
                  uint64_t v16 = [(SFSharablePassword *)v5 notesEntry];
                  if (WBSIsEqual())
                  {
                    v24 = v16;
                    uint64_t v25 = [(SFSharablePassword *)v5 customTitle];
                    if (WBSIsEqual())
                    {
                      uint64_t v23 = [(SFSharablePassword *)v5 passkeyCredentialID];
                      if (WBSIsEqual())
                      {
                        uint64_t v22 = [(SFSharablePassword *)v5 passkeyCredential];
                        if (WBSIsEqual())
                        {
                          id v21 = [(SFSharablePassword *)v5 passkeyRelyingPartyID];
                          if (WBSIsEqual())
                          {
                            protectionSpaces = self->_protectionSpaces;
                            uint64_t v18 = [(SFSharablePassword *)v5 protectionSpaces];
                            char v19 = [(NSArray *)protectionSpaces isEqual:v18];
                          }
                          else
                          {
                            char v19 = 0;
                          }
                          uint64_t v16 = v24;
                        }
                        else
                        {
                          char v19 = 0;
                        }
                      }
                      else
                      {
                        char v19 = 0;
                      }
                    }
                    else
                    {
                      char v19 = 0;
                    }
                  }
                  else
                  {
                    char v19 = 0;
                  }
                }
                else
                {
                  char v19 = 0;
                }
              }
              else
              {
                char v19 = 0;
              }
            }
            else
            {
              char v19 = 0;
            }
          }
          else
          {
            char v19 = 0;
          }
        }
        else
        {
          char v19 = 0;
        }
      }
      else
      {
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_username hash];
  NSUInteger v4 = [(NSString *)self->_password hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_displayName hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_highLevelDomain hash];
  uint64_t v7 = [(NSArray *)self->_protectionSpaces hash];
  uint64_t v8 = v7 ^ [(NSURL *)self->_otpAuthURL hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_notesEntry hash];
  NSUInteger v10 = [(NSString *)self->_customTitle hash];
  uint64_t v11 = v10 ^ [(NSArray *)self->_additionalSites hash];
  uint64_t v12 = v11 ^ [(NSData *)self->_passkeyCredentialID hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSData *)self->_passkeyCredential hash];
  return v13 ^ [(NSString *)self->_passkeyRelyingPartyID hash];
}

+ (BOOL)safariCredentialURLHasPasskey:(id)a3
{
  NSUInteger v3 = [MEMORY[0x263F08BA0] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  NSUInteger v4 = [v3 queryItems];
  char v5 = objc_msgSend(v4, "safari_containsObjectPassingTest:", &__block_literal_global_9);

  return v5;
}

uint64_t __52__SFSharablePassword_safariCredentialURLHasPasskey___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:@"hasPasskey"];

  return v3;
}

- (id)_queryItemsForAirDropRepresentationWithEncryptionInformation:(id)a3
{
  id v4 = a3;
  char v5 = [v4 encryptedPasswordData];
  NSUInteger v6 = [v5 base64EncodedStringWithOptions:0];

  uint64_t v7 = [v4 encryptionKeyReference];

  uint64_t v8 = [v7 base64EncodedStringWithOptions:0];

  NSUInteger v9 = (void *)MEMORY[0x263EFF980];
  NSUInteger v10 = [MEMORY[0x263F08BD0] queryItemWithName:@"data" value:v6];
  uint64_t v11 = [MEMORY[0x263F08BD0] queryItemWithName:@"key" value:v8];
  uint64_t v12 = objc_msgSend(v9, "arrayWithObjects:", v10, v11, 0);

  uint64_t v13 = [(SFSharablePassword *)self passkeyCredential];

  if (v13)
  {
    id v14 = [MEMORY[0x263F08BD0] queryItemWithName:@"hasPasskey" value:0];
    [v12 addObject:v14];
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSharablePassword)initWithCoder:(id)a3
{
  v37[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
  NSUInteger v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"password"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"highLevelDomain"];
  NSUInteger v9 = (void *)MEMORY[0x263EFFA08];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  NSUInteger v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
  uint64_t v11 = [v9 setWithArray:v10];
  uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"protectionSpaces"];

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passkeyCredentialRelyingPartyID"];
  id v14 = [(SFSharablePassword *)self initWithUsername:v5 password:v6 displayName:v7 highLevelDomain:v8 passkeyRelyingPartyID:v13 protectionSpaces:v12];
  if (v14)
  {
    id v15 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"additionalSites"];
    additionalSites = v14->_additionalSites;
    v14->_additionalSites = v15;
    v36 = v15;

    id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otp"];
    otpAuthURL = v14->_otpAuthURL;
    v14->_otpAuthURL = v17;
    uint64_t v35 = v17;

    char v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notes"];
    uint64_t v20 = v12;
    id v21 = v8;
    uint64_t v22 = v7;
    uint64_t v23 = v6;
    v24 = v5;
    notesEntry = v14->_notesEntry;
    v14->_notesEntry = v19;
    v34 = v19;

    char v5 = v24;
    NSUInteger v6 = v23;
    uint64_t v7 = v22;
    uint64_t v8 = v21;
    uint64_t v12 = v20;
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    customTitle = v14->_customTitle;
    v14->_customTitle = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passkeyCredentialID"];
    passkeyCredentialID = v14->_passkeyCredentialID;
    v14->_passkeyCredentialID = (NSData *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passkeyCredential"];
    passkeyCredential = v14->_passkeyCredential;
    v14->_passkeyCredential = (NSData *)v30;

    long long v32 = v14;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  username = self->_username;
  id v5 = a3;
  [v5 encodeObject:username forKey:@"username"];
  [v5 encodeObject:self->_password forKey:@"password"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_highLevelDomain forKey:@"highLevelDomain"];
  [v5 encodeObject:self->_additionalSites forKey:@"additionalSites"];
  [v5 encodeObject:self->_otpAuthURL forKey:@"otp"];
  [v5 encodeObject:self->_notesEntry forKey:@"notes"];
  [v5 encodeObject:self->_customTitle forKey:@"title"];
  [v5 encodeObject:self->_protectionSpaces forKey:@"protectionSpaces"];
  [v5 encodeObject:self->_passkeyCredentialID forKey:@"passkeyCredentialID"];
  [v5 encodeObject:self->_passkeyCredential forKey:@"passkeyCredential"];
  [v5 encodeObject:self->_passkeyRelyingPartyID forKey:@"passkeyCredentialRelyingPartyID"];
}

- (id)_encryptionInformationWithNewKey
{
  v41[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = NSString;
  id v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSinceReferenceDate];
  NSUInteger v6 = objc_msgSend(v3, "stringWithFormat:", @"com.apple.passwordsharing.%f", v5);

  uint64_t v7 = [v6 dataUsingEncoding:4];
  uint64_t v8 = *MEMORY[0x263F16FE0];
  uint64_t v9 = *MEMORY[0x263F16F98];
  v40[0] = *MEMORY[0x263F16FA8];
  v40[1] = v9;
  v41[0] = v8;
  v41[1] = &unk_26CA7EE08;
  uint64_t v10 = MEMORY[0x263EFFA88];
  uint64_t v11 = *MEMORY[0x263F17580];
  v41[2] = MEMORY[0x263EFFA88];
  uint64_t v12 = *MEMORY[0x263F174B8];
  v40[2] = v11;
  v40[3] = v12;
  uint64_t v13 = *MEMORY[0x263F16EE8];
  v38[0] = *MEMORY[0x263F16F50];
  v38[1] = v13;
  v39[0] = MEMORY[0x263EFFA88];
  v39[1] = v7;
  uint64_t v14 = *MEMORY[0x263F16E80];
  v38[2] = *MEMORY[0x263F170B0];
  v38[3] = v14;
  v39[2] = MEMORY[0x263EFFA80];
  v39[3] = @"com.apple.sharing.safaripasswordsharing";
  v38[4] = *MEMORY[0x263F16F28];
  id v15 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:86400.0];
  v39[4] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];
  v41[3] = v16;
  CFDictionaryRef v17 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:4];

  CFErrorRef error = 0;
  uint64_t v18 = SecKeyCreateRandomKey(v17, &error);
  if (v18)
  {
    char v19 = v18;
    uint64_t v20 = SecKeyCopyPublicKey(v18);
    CFDataRef v21 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    CFDataRef v22 = SecKeyCreateEncryptedData(v20, (SecKeyAlgorithm)*MEMORY[0x263F17348], v21, &error);
    CFRelease(v19);
    CFRelease(v20);
    if (v22)
    {
      CFTypeRef result = 0;
      uint64_t v23 = *MEMORY[0x263F171B8];
      v36[0] = *MEMORY[0x263F17528];
      v36[1] = v23;
      uint64_t v24 = *MEMORY[0x263F171E0];
      v37[0] = v10;
      v37[1] = v24;
      v36[2] = v13;
      v37[2] = v7;
      OSStatus v25 = SecItemCopyMatching((CFDictionaryRef)[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3], &result);
      if (!v25)
      {
        long long v32 = (void *)result;
        id v29 = [[_SFSharablePasswordEncryptionInformation alloc] initWithEncryptedPasswordData:v22 encryptionKeyReference:result];

        goto LABEL_14;
      }
      int v26 = v25;
      uint64_t v27 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        [(SFSharablePassword *)v26 _encryptionInformationWithNewKey];
      }
    }
    else
    {
      CFErrorRef v30 = error;
      long long v31 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[SFSharablePassword _encryptionInformationWithNewKey](v31);
      }
    }
    id v29 = 0;
LABEL_14:

    goto LABEL_15;
  }
  CFDataRef v21 = error;
  uint64_t v28 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[SFSharablePassword _encryptionInformationWithNewKey](v28);
  }
  id v29 = 0;
LABEL_15:

  return v29;
}

+ (id)_decryptedDataForEncryptedData:(id)a3 encryptionKeyReference:(id)a4
{
  v20[3] = *MEMORY[0x263EF8340];
  CFDataRef v5 = (const __CFData *)a3;
  id v6 = a4;
  CFTypeRef result = 0;
  uint64_t v7 = *MEMORY[0x263F171B8];
  v19[0] = *MEMORY[0x263F175B0];
  v19[1] = v7;
  uint64_t v8 = *MEMORY[0x263F171E0];
  v20[0] = v6;
  v20[1] = v8;
  v19[2] = *MEMORY[0x263F17530];
  v20[2] = MEMORY[0x263EFFA88];
  OSStatus v9 = SecItemCopyMatching((CFDictionaryRef)[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3], &result);
  if (v9)
  {
    int v10 = v9;
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[SFSharablePassword _decryptedDataForEncryptedData:encryptionKeyReference:](v10, v11);
    }
    CFDataRef v12 = 0;
  }
  else
  {
    CFErrorRef error = 0;
    CFDataRef v12 = SecKeyCreateDecryptedData((SecKeyRef)result, (SecKeyAlgorithm)*MEMORY[0x263F17348], v5, &error);
    CFRelease(result);
    if (v12)
    {
      CFDataRef v13 = v12;
    }
    else
    {
      CFErrorRef v14 = error;
      id v15 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[SFSharablePassword _decryptedDataForEncryptedData:encryptionKeyReference:](v15);
      }
    }
  }

  return v12;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)highLevelDomain
{
  return self->_highLevelDomain;
}

- (NSArray)additionalSites
{
  return self->_additionalSites;
}

- (NSURL)otpAuthURL
{
  return self->_otpAuthURL;
}

- (NSString)notesEntry
{
  return self->_notesEntry;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSArray)protectionSpaces
{
  return self->_protectionSpaces;
}

- (NSData)passkeyCredentialID
{
  return self->_passkeyCredentialID;
}

- (NSData)passkeyCredential
{
  return self->_passkeyCredential;
}

- (NSString)passkeyRelyingPartyID
{
  return self->_passkeyRelyingPartyID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkeyRelyingPartyID, 0);
  objc_storeStrong((id *)&self->_passkeyCredential, 0);
  objc_storeStrong((id *)&self->_passkeyCredentialID, 0);
  objc_storeStrong((id *)&self->_protectionSpaces, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_notesEntry, 0);
  objc_storeStrong((id *)&self->_otpAuthURL, 0);
  objc_storeStrong((id *)&self->_additionalSites, 0);
  objc_storeStrong((id *)&self->_highLevelDomain, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (BOOL)hasAnyCredentialData
{
  if ([(SFSharablePassword *)self _hasPasskeyData]) {
    return 1;
  }
  return [(SFSharablePassword *)self _hasPasswordData];
}

- (BOOL)hasPasswordWithConflicts
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(SFSharablePassword *)self _hasPasswordData])
  {
    uint64_t v3 = [MEMORY[0x263F663B0] sharedStore];
    id v4 = [(SFSharablePassword *)self _usernameOrEmptyString];
    CFDataRef v5 = [(SFSharablePassword *)self password];
    id v6 = [(SFSharablePassword *)self highLevelDomain];
    uint64_t v7 = [(SFSharablePassword *)self notesEntry];
    uint64_t v8 = [(SFSharablePassword *)self customTitle];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    OSStatus v9 = [(SFSharablePassword *)self protectionSpaces];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          if (![v3 canSaveUser:v4 password:v5 forProtectionSpace:*(void *)(*((void *)&v14 + 1) + 8 * i) highLevelDomain:v6 notes:v7 customTitle:v8 groupID:0 error:0])
          {
            LOBYTE(v10) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (id)saveToKeychain
{
  uint64_t v3 = [(SFSharablePassword *)self _savePasswordAccount];
  uint64_t v4 = [(SFSharablePassword *)self _savePasskeyAccount];
  CFDataRef v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = [MEMORY[0x263F663B0] sharedStore];
    [v6 _mergeSavedAccountWithPasskey:v5 toSavedAccountWithPassword:v3];
  }
  if (v3) {
    uint64_t v7 = v3;
  }
  else {
    uint64_t v7 = v5;
  }
  id v8 = v7;
  if (v8)
  {
    [(SFSharablePassword *)self _saveAdditionalSitesForSavedAccount:v8];
    [(SFSharablePassword *)self _saveNotesEntryForSavedAccount:v8];
    [(SFSharablePassword *)self _saveCustomTitleForSavedAccount:v8];
    [(SFSharablePassword *)self _saveOneTimeCodeForSavedAccount:v8];
    id v9 = v8;
  }

  return v8;
}

- (void)savePasskeyAccountAndMergeIntoSavedPasswordAccountIfNeeded:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SFSharablePassword *)self _savePasskeyAccount];
  if (v4)
  {
    CFDataRef v5 = [MEMORY[0x263F663B0] sharedStore];
    [v5 _mergeSavedAccountWithPasskey:v4 toSavedAccountWithPassword:v6];
  }
}

- (id)_usernameOrEmptyString
{
  v2 = [(SFSharablePassword *)self username];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = &stru_26CA7A2D0;
  }
  uint64_t v4 = v2;

  return v4;
}

- (BOOL)_hasPasswordData
{
  uint64_t v3 = [(SFSharablePassword *)self password];
  if ([v3 length])
  {
    uint64_t v4 = [(SFSharablePassword *)self highLevelDomain];
    if ([v4 length])
    {
      CFDataRef v5 = [(SFSharablePassword *)self protectionSpaces];
      BOOL v6 = [v5 count] != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_hasPasskeyData
{
  uint64_t v3 = [(SFSharablePassword *)self passkeyCredential];
  if ([v3 length])
  {
    uint64_t v4 = [(SFSharablePassword *)self passkeyCredentialID];
    if ([v4 length])
    {
      CFDataRef v5 = [(SFSharablePassword *)self highLevelDomain];
      BOOL v6 = [v5 length] != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_savePasswordAccount
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(SFSharablePassword *)self _hasPasswordData])
  {
    uint64_t v3 = [MEMORY[0x263F663B0] sharedStore];
    uint64_t v4 = [(SFSharablePassword *)self _usernameOrEmptyString];
    CFDataRef v5 = [(SFSharablePassword *)self password];
    BOOL v6 = [(SFSharablePassword *)self highLevelDomain];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = [(SFSharablePassword *)self protectionSpaces];
    uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        CFDataRef v12 = v9;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(obj);
          }
          id v9 = [v3 saveUser:v4 password:v5 forProtectionSpace:*(void *)(*((void *)&v15 + 1) + 8 * v11) highLevelDomain:v6 groupID:&stru_26CA7A2D0];

          ++v11;
          CFDataRef v12 = v9;
        }
        while (v8 != v11);
        uint64_t v8 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)_savePasskeyAccount
{
  if ([(SFSharablePassword *)self _hasPasskeyData])
  {
    id v3 = objc_alloc(MEMORY[0x263F662E0]);
    uint64_t v4 = [(SFSharablePassword *)self passkeyCredentialID];
    CFDataRef v5 = [(SFSharablePassword *)self passkeyCredential];
    BOOL v6 = (void *)[v3 initWithFirst:v4 second:v5];

    uint64_t v7 = [MEMORY[0x263F663B0] sharedStore];
    uint64_t v8 = [(SFSharablePassword *)self _usernameOrEmptyString];
    id v9 = [(SFSharablePassword *)self passkeyRelyingPartyID];
    uint64_t v10 = [v7 _saveUser:v8 passkeyCredential:v6 passkeyRelyingPartyID:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (void)_saveAdditionalSitesForSavedAccount:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SFSharablePassword *)self additionalSites];
  if ([v4 count])
  {
    CFDataRef v5 = [MEMORY[0x263F663B0] sharedStore];
    [v5 saveAdditionalSites:v4 forSavedAccount:v6];
  }
}

- (void)_saveNotesEntryForSavedAccount:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SFSharablePassword *)self notesEntry];
  if ([v4 length])
  {
    CFDataRef v5 = [MEMORY[0x263F663B0] sharedStore];
    [v5 saveNotesEntry:v4 forSavedAccount:v6];
  }
}

- (void)_saveCustomTitleForSavedAccount:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SFSharablePassword *)self customTitle];
  if ([v4 length])
  {
    CFDataRef v5 = [MEMORY[0x263F663B0] sharedStore];
    [v5 saveCustomTitle:v4 forSavedAccount:v6];
  }
}

- (void)_saveOneTimeCodeForSavedAccount:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(SFSharablePassword *)self otpAuthURL];
  if (v4)
  {
    CFDataRef v5 = (void *)[objc_alloc(MEMORY[0x263F663C8]) initWithOTPAuthURL:v4];
    if (v5)
    {
      id v6 = [MEMORY[0x263F663B0] sharedStore];
      [v6 saveTOTPGenerator:v5 forSavedAccount:v7];
    }
  }
}

+ (void)sharablePasswordFromData:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218FBF000, v4, v5, "Failed to unarchive sharable password with error %{public}@", v6, v7, v8, v9, v10);
}

+ (void)sharablePasswordFromURL:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218FBF000, log, OS_LOG_TYPE_ERROR, "Failed to create sharable password from URL because it's missing data or key reference", v1, 2u);
}

+ (void)sharablePasswordFromURL:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218FBF000, log, OS_LOG_TYPE_ERROR, "Failed to create sharable password from URL because it has incorrect scheme", v1, 2u);
}

- (void)_encryptionInformationWithNewKey
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_218FBF000, a2, OS_LOG_TYPE_ERROR, "Failed to get persistent reference to private key with status: %d", (uint8_t *)v2, 8u);
}

+ (void)_decryptedDataForEncryptedData:(void *)a1 encryptionKeyReference:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218FBF000, v4, v5, "Failed to decrypt password data with error %{public}@", v6, v7, v8, v9, v10);
}

+ (void)_decryptedDataForEncryptedData:(int)a1 encryptionKeyReference:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_218FBF000, a2, OS_LOG_TYPE_ERROR, "Failed to get private key with status %d", (uint8_t *)v2, 8u);
}

@end