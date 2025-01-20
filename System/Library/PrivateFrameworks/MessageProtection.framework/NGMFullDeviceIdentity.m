@interface NGMFullDeviceIdentity
+ (id)identityWithAccess:(id)a3 error:(id *)a4;
+ (id)identityWithAccess:(id)a3 usageIdentifier:(id)a4 error:(id *)a5;
+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4;
- (BOOL)deleteKeyWithTag:(id)a3;
- (BOOL)eraseFromKeyChain:(id *)a3;
- (BOOL)requiresMigration;
- (BOOL)shouldRollEncryptionIdentity;
- (BOOL)testing_duplicatePrekeyRegistration;
- (BOOL)updateWithRegisteredTicket:(id)a3 error:(id *)a4;
- (NGMFullDeviceIdentity)initWithSigningKey:(id)a3 devicePrekeys:(id)a4;
- (NSMutableArray)devicePrekeys;
- (SigningKey)deviceSigningKey;
- (id)batchSign:(id)a3 forType:(int64_t)a4 error:(id *)a5;
- (id)dataRepresentationWithError:(id *)a3;
- (id)description;
- (id)keyRollingTicketWithError:(id *)a3;
- (id)publicDeviceIdentityWithError:(id *)a3;
- (id)sign:(id)a3 forType:(int64_t)a4 error:(id *)a5;
- (id)signDataWithFormatter:(id)a3 error:(id *)a4;
- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5;
- (void)postMigrationKeychainCleanup;
- (void)setDevicePrekeys:(id)a3;
- (void)setDeviceSigningKey:(id)a3;
- (void)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5;
- (void)unsealMessageAndAttributes:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11 decryptionBlock:(id)a12;
- (void)unsealMessageAndAttributes:(id)a3 guid:(id)a4 sendingURI:(id)a5 sendingPushToken:(id)a6 receivingURI:(id)a7 receivingPushToken:(id)a8 signedByPublicIdentity:(id)a9 decryptionBlock:(id)a10;
- (void)unsealMessageAndAttributes:(id)a3 guid:(id)a4 signedByPublicIdentity:(id)a5 decryptionBlock:(id)a6;
- (void)unsealMessageAndAttributes:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5;
@end

@implementation NGMFullDeviceIdentity

- (BOOL)requiresMigration
{
  v3 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
  int v4 = [v3 keyStore];

  if (v4 == 3) {
    return 1;
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__NGMFullDeviceIdentity_MigrationToModernizedKeyStorage__requiresMigration__block_invoke;
  v8[3] = &unk_26427F3F0;
  v8[4] = &v9;
  [v6 enumerateObjectsUsingBlock:v8];

  BOOL v5 = *((unsigned char *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __75__NGMFullDeviceIdentity_MigrationToModernizedKeyStorage__requiresMigration__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = [a2 dhKey];
  int v7 = [v6 keyStore];

  if (v7 == 3)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (BOOL)deleteKeyWithTag:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F171C8];
  uint64_t v4 = *MEMORY[0x263F17090];
  v14[0] = *MEMORY[0x263F171B8];
  v14[1] = v4;
  v15[0] = v3;
  v15[1] = @"com.apple.messageprotection";
  v14[2] = *MEMORY[0x263F16ED8];
  v15[2] = a3;
  BOOL v5 = NSDictionary;
  id v6 = a3;
  CFDictionaryRef v7 = (const __CFDictionary *)[v5 dictionaryWithObjects:v15 forKeys:v14 count:3];

  OSStatus v8 = SecItemDelete(v7);
  int v9 = v8;
  if (v8 != -25300 && v8 != 0)
  {
    uint64_t v11 = MessageProtectionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[NGMFullDeviceIdentity(MigrationToModernizedKeyStorage) deleteKeyWithTag:](v9, v11);
    }
  }
  return !v9 || v9 == -25300;
}

- (void)postMigrationKeychainCleanup
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  uint64_t v3 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
  int v4 = [v3 keyStore];

  if (v4 == 3)
  {
    BOOL v5 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
    id v6 = [v5 keyIdentifier];
    BOOL v7 = [(NGMFullDeviceIdentity *)self deleteKeyWithTag:v6];
    if (*((unsigned char *)v14 + 24)) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
    *((unsigned char *)v14 + 24) = v8;
  }
  int v9 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__NGMFullDeviceIdentity_MigrationToModernizedKeyStorage__postMigrationKeychainCleanup__block_invoke;
  v12[3] = &unk_26427F418;
  v12[4] = self;
  v12[5] = &v13;
  [v9 enumerateObjectsUsingBlock:v12];

  if (*((unsigned char *)v14 + 24))
  {
    v10 = MessageProtectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_2163F2000, v10, OS_LOG_TYPE_INFO, "Migration to CTKOID key storage done.", v11, 2u);
    }
  }
  else
  {
    v10 = MessageProtectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NGMFullDeviceIdentity(MigrationToModernizedKeyStorage) postMigrationKeychainCleanup](v10);
    }
  }

  _Block_object_dispose(&v13, 8);
}

void __86__NGMFullDeviceIdentity_MigrationToModernizedKeyStorage__postMigrationKeychainCleanup__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 dhKey];
  int v4 = [v3 keyStore];

  if (v4 == 3)
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v6 = [v11 dhKey];
    BOOL v7 = [v6 keyIdentifier];
    char v8 = [v5 deleteKeyWithTag:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v9 + 24)) {
      char v10 = v8;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)(v9 + 24) = v10;
  }
}

- (id)sign:(id)a3 forType:(int64_t)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = MessageProtectionLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v17 = a4;
    _os_log_impl(&dword_2163F2000, v9, OS_LOG_TYPE_INFO, "Signing with Identity Key for message type: %li", buf, 0xCu);
  }

  if ((unint64_t)a4 >= 3)
  {
    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Request to sign with unknown signature type: %li", a4);
    uint64_t v14 = 4001;
  }
  else
  {
    uint64_t v10 = [objc_alloc(*off_26427F438[a4]) initWithApplicationData:v8];
    if (v10)
    {
      id v11 = (void *)v10;
      char v12 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
      uint64_t v13 = [v12 signDataWithFormatter:v11 error:a5];

      goto LABEL_9;
    }
    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Request to sign but no signature formatter for type: %li", a4);
    uint64_t v14 = 4002;
  }
  MPLogAndAssignError(v14, a5, v11);
  uint64_t v13 = 0;
LABEL_9:

  return v13;
}

- (id)batchSign:(id)a3 forType:(int64_t)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = -[NGMFullDeviceIdentity sign:forType:error:](self, "sign:forType:error:", *(void *)(*((void *)&v19 + 1) + 8 * i), a4, a5, (void)v19);
        char v16 = v15;
        if (!v15 || *a5)
        {

          id v17 = 0;
          goto LABEL_12;
        }
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v17 = v9;
LABEL_12:

  return v17;
}

- (NGMFullDeviceIdentity)initWithSigningKey:(id)a3 devicePrekeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NGMFullDeviceIdentity;
  id v8 = [(NGMFullDeviceIdentity *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(NGMFullDeviceIdentity *)v8 setDeviceSigningKey:v6];
    [(NGMFullDeviceIdentity *)v9 setDevicePrekeys:v7];
  }

  return v9;
}

+ (id)identityWithAccess:(id)a3 usageIdentifier:(id)a4 error:(id *)a5
{
  return (id)[a1 identityWithAccess:a3 error:a5];
}

+ (id)identityWithAccess:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (([v6 isEqualToString:*MEMORY[0x263F16ED0]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x263F16EA0]] & 1) != 0)
  {
    id v7 = +[FullKey generateNewKeyWithAccess:v6 error:a4];
    if (v7)
    {
      id v8 = objc_alloc((Class)a1);
      uint64_t v9 = [MEMORY[0x263EFF980] array];
      id v10 = (void *)[v8 initWithSigningKey:v7 devicePrekeys:v9];

      objc_super v11 = [NGMFullPrekey alloc];
      uint64_t v12 = [v10 deviceSigningKey];
      uint64_t v13 = [(NGMFullPrekey *)v11 initWithPrekeySignedBy:v12 error:a4];

      if (v13)
      {
        uint64_t v14 = [v10 devicePrekeys];
        [v14 addObject:v13];

        id v15 = v10;
      }
      else
      {
        id v15 = 0;
      }
    }
    else
    {
      char v16 = MessageProtectionLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[NGMFullDeviceIdentity identityWithAccess:error:](a4, v16);
      }

      id v15 = 0;
    }
  }
  else
  {
    id v17 = [NSString stringWithFormat:@"A NGMFullDeviceIdentity Key generation was requested, but failed because it was requested with access: %@", v6];
    MPLogAndAssignError(501, a4, v17);

    id v15 = 0;
  }

  return v15;
}

+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [[NGMPBFullDeviceIdentity alloc] initWithData:v6];
  if (v7)
  {
    v28 = (objc_class *)a1;
    id v30 = v6;
    id v8 = [SigningKey alloc];
    uint64_t v9 = [(NGMPBFullDeviceIdentity *)v7 signingKey];
    v27 = a4;
    id v10 = [(FullKey *)v8 initWithProtobufferData:v9 error:a4];

    objc_super v11 = (void *)MEMORY[0x263EFF980];
    uint64_t v12 = [(NGMPBFullDeviceIdentity *)v7 prekeys];
    v31 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v29 = v7;
    uint64_t v13 = [(NGMPBFullDeviceIdentity *)v7 prekeys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * v17);
          long long v19 = [NGMFullPrekey alloc];
          long long v20 = [(SigningKey *)v10 publicKey];
          id v32 = 0;
          long long v21 = [(NGMFullPrekey *)v19 initWithPBPrekey:v18 verifySignedBy:v20 error:&v32];
          id v22 = v32;

          if (v21)
          {
            [v31 addObject:v21];
          }
          else
          {
            v23 = MessageProtectionLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              +[NGMFullDeviceIdentity identityWithDataRepresentation:&v38 error:v23];
            }
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v15);
    }

    if (v10)
    {
      uint64_t v24 = v31;
      v25 = (void *)[[v28 alloc] initWithSigningKey:v10 devicePrekeys:v31];
      id v6 = v30;
    }
    else
    {
      MPLogAndAssignError(200, v27, @"Failed to initialize signing keys from NGMFullDeviceIdentity data.");
      v25 = 0;
      id v6 = v30;
      uint64_t v24 = v31;
    }

    id v7 = v29;
  }
  else
  {
    MPLogAndAssignError(303, a4, @"The deserialization of the NGMFullDeviceIdentity failed.");
    v25 = 0;
  }

  return v25;
}

- (id)dataRepresentationWithError:(id *)a3
{
  BOOL v4 = [(NGMFullDeviceIdentity *)self requiresMigration];
  if (v4)
  {
    BOOL v5 = MessageProtectionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2163F2000, v5, OS_LOG_TYPE_INFO, "Starting key migration to CTKOID.", buf, 2u);
    }
  }
  id v6 = objc_alloc_init(NGMPBFullDeviceIdentity);
  id v7 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
  id v8 = [v7 protobuffer];
  [(NGMPBFullDeviceIdentity *)v6 setSigningKey:v8];

  uint64_t v9 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__NGMFullDeviceIdentity_dataRepresentationWithError___block_invoke;
  v13[3] = &unk_26427F478;
  id v10 = v6;
  uint64_t v14 = v10;
  [v9 enumerateObjectsUsingBlock:v13];

  objc_super v11 = [(NGMPBFullDeviceIdentity *)v10 data];
  if (v4) {
    [(NGMFullDeviceIdentity *)self postMigrationKeychainCleanup];
  }

  return v11;
}

void __53__NGMFullDeviceIdentity_dataRepresentationWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 pbDevicePrekey];
  [v2 addPrekeys:v3];
}

- (id)publicDeviceIdentityWithError:(id *)a3
{
  BOOL v4 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  BOOL v5 = [v4 lastObject];
  id v6 = [v5 publicPrekey];

  id v7 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  id v8 = [v7 lastObject];
  uint64_t v9 = [v8 tetraPrivateKey];

  if (v9)
  {
    id v10 = [(NGMFullDeviceIdentity *)self devicePrekeys];
    objc_super v11 = [v10 lastObject];
    uint64_t v12 = [v11 tetraRegistration];
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [NGMPublicDeviceIdentity alloc];
  uint64_t v14 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
  uint64_t v15 = [v14 publicKey];
  uint64_t v16 = [(NGMPublicDeviceIdentity *)v13 initWithEchnidaRegistration:v6 tetraRegistration:v12 signingKey:v15];

  return v16;
}

- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__NGMFullDeviceIdentity_unsealMessage_signedByPublicIdentity_error___block_invoke;
  v13[3] = &unk_26427F4A0;
  void v13[4] = &v20;
  v13[5] = &v14;
  [(NGMFullDeviceIdentity *)self unsealMessage:v8 signedByPublicIdentity:v9 decryptionBlock:v13];
  id v10 = (void *)v21[5];
  if (v10)
  {
    id v11 = 0;
    if (a5) {
      *a5 = v10;
    }
  }
  else
  {
    id v11 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __68__NGMFullDeviceIdentity_unsealMessage_signedByPublicIdentity_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v14 = *(void **)(v11 + 40);
    ((void (**)(id, void **))v10)[2](v10, &v14);
    uint64_t v12 = v14;
    uint64_t v13 = (id *)(v11 + 40);
  }
  else
  {
    uint64_t v13 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v12 = a3;
  }
  objc_storeStrong(v13, v12);
}

- (void)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__NGMFullDeviceIdentity_unsealMessage_signedByPublicIdentity_decryptionBlock___block_invoke;
  v10[3] = &unk_26427F4C8;
  id v11 = v8;
  id v9 = v8;
  [(NGMFullDeviceIdentity *)self unsealMessageAndAttributes:a3 signedByPublicIdentity:a4 decryptionBlock:v10];
}

uint64_t __78__NGMFullDeviceIdentity_unsealMessage_signedByPublicIdentity_decryptionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unsealMessageAndAttributes:(id)a3 guid:(id)a4 signedByPublicIdentity:(id)a5 decryptionBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [@"noPushToken" dataUsingEncoding:4];
  uint64_t v14 = [@"noPushToken" dataUsingEncoding:4];
  [(NGMFullDeviceIdentity *)self unsealMessageAndAttributes:v13 guid:v12 sendingURI:@"noURI" sendingPushToken:v15 receivingURI:@"noURI" receivingPushToken:v14 signedByPublicIdentity:v11 decryptionBlock:v10];
}

- (void)unsealMessageAndAttributes:(id)a3 guid:(id)a4 sendingURI:(id)a5 sendingPushToken:(id)a6 receivingURI:(id)a7 receivingPushToken:(id)a8 signedByPublicIdentity:(id)a9 decryptionBlock:(id)a10
{
  uint64_t v17 = (void *)MEMORY[0x263EFF8F8];
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = [v17 data];
  [(NGMFullDeviceIdentity *)self unsealMessageAndAttributes:v25 authenticatedData:v26 messageType:0 guid:v24 sendingURI:v23 sendingPushToken:v22 receivingURI:v21 receivingPushToken:v20 signedByPublicIdentity:v19 decryptionBlock:v18];
}

- (void)unsealMessageAndAttributes:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11 decryptionBlock:(id)a12
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v68 = a3;
  id v60 = a4;
  id v67 = a6;
  id v61 = a7;
  id v62 = a8;
  id v63 = a9;
  id v64 = a10;
  id v66 = a11;
  v65 = (void (**)(id, uint64_t, void, void *, uint64_t))a12;
  uint64_t v17 = MessageProtectionLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v67;
    _os_log_impl(&dword_2163F2000, v17, OS_LOG_TYPE_INFO, "Unsealing message with GUID: %@", buf, 0xCu);
  }

  id v18 = [MEMORY[0x263EFF9A0] dictionary];
  id v19 = [[NGMPBOuterMessage alloc] initWithData:v68];
  id v20 = [(NGMPBOuterMessage *)v19 ephemeralPubKey];
  if (v20)
  {
    id v21 = [(NGMPBOuterMessage *)v19 encryptedPayload];
    BOOL v22 = v21 != 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  BOOL v23 = [(NGMPBOuterMessage *)v19 hasTetraMessage];
  id v24 = MessageProtectionLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v67;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v22;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v23;
    _os_log_impl(&dword_2163F2000, v24, OS_LOG_TYPE_INFO, "Message with GUID: %@ hasEchnidaPayload=%d hasSecondaryPayload=%d", buf, 0x18u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v123 = __Block_byref_object_copy_;
  v124 = __Block_byref_object_dispose_;
  id v125 = 0;
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x3032000000;
  v117 = __Block_byref_object_copy_;
  v118 = __Block_byref_object_dispose_;
  id v119 = 0;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__25;
  v112 = __Block_byref_object_dispose__26;
  id v113 = 0;
  v106[0] = 0;
  v106[1] = v106;
  v106[2] = 0x3032000000;
  v106[3] = __Block_byref_object_copy_;
  v106[4] = __Block_byref_object_dispose_;
  id v107 = 0;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x3032000000;
  v103 = __Block_byref_object_copy_;
  v104 = __Block_byref_object_dispose_;
  id v105 = 0;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x3032000000;
  v97 = __Block_byref_object_copy_;
  v98 = __Block_byref_object_dispose_;
  id v99 = 0;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__25;
  v92 = __Block_byref_object_dispose__26;
  id v93 = 0;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy_;
  v86[4] = __Block_byref_object_dispose_;
  id v87 = 0;
  if (v22)
  {
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke;
    v80[3] = &unk_26427F4F0;
    v82 = v106;
    id v81 = v18;
    v83 = buf;
    v84 = &v114;
    v85 = &v108;
    [(NGMFullDeviceIdentity *)self unsealMessageAndAttributes:v68 signedByPublicIdentity:v66 decryptionBlock:v80];

    if (!v23)
    {
      uint64_t v25 = *(void *)(*(void *)&buf[8] + 40);
LABEL_31:
      v51 = v115 + 5;
      v52 = v109;
      goto LABEL_32;
    }
  }
  else if (!v23)
  {
    long long v36 = v101;
    goto LABEL_21;
  }
  id v26 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
  v27 = [v26 publicKey];
  v28 = [v27 dataRepresentation];

  if ([v66 isTetraCompatibleWithFullKey:self])
  {
    if (v28)
    {
      v29 = MessageProtectionLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v120 = 138412290;
        id v121 = v67;
        _os_log_impl(&dword_2163F2000, v29, OS_LOG_TYPE_INFO, "Starting Tetra decryption of GUID: %@", v120, 0xCu);
      }

      id v30 = [(NGMPBOuterMessage *)v19 tetraMessage];
      v31 = [v66 signingKey];
      id v32 = [v31 tetraWrapped];
      long long v33 = [v66 tetraRegistration];
      int v57 = [v33 tetraVersion];
      long long v34 = [(NGMFullDeviceIdentity *)self devicePrekeys];
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke_37;
      v71[3] = &unk_26427F518;
      id v72 = v67;
      v74 = v86;
      id v73 = v18;
      v75 = &v100;
      v76 = &v94;
      v77 = &v88;
      LODWORD(v53) = v57;
      +[TetraAPI openWithMessage:v30 authenticatedData:v60 guid:v72 sendingURI:v61 sendingPushToken:v62 receivingURI:v63 receivingPushToken:v64 signedBy:v32 tetraVersion:v53 ourPrekeys:v34 ourSigningPublicKeyCompactRepresentation:v28 decryptionBlock:v71];

      id v35 = v72;
    }
    else
    {
      id v78 = 0;
      uint64_t v38 = NSString;
      v59 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
      v55 = [v59 description];
      v58 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
      v56 = [v58 publicKey];
      v54 = [v56 description];
      v39 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
      uint64_t v40 = [v39 publicKey];
      v41 = [v40 dataRepresentation];
      v42 = [v41 description];
      v43 = [v38 stringWithFormat:@"Unable to serialize the device public signing key (%@ %@ %@).", v55, v54, v42];
      MPLogAndAssignError(3, &v78, v43);
      id v35 = v78;

      [v18 setObject:v35 forKey:&unk_26C70CD88];
    }
  }
  else
  {
    id v79 = 0;
    v37 = [NSString stringWithFormat:@"Received a Tetra message (%@), but the sender identity version is not compatible with ours.", v67];
    MPLogAndAssignError(3001, &v79, v37);
    id v35 = v79;

    [v18 setObject:v35 forKey:&unk_26C70CD88];
  }

  long long v36 = v101;
  if (!v22)
  {
    uint64_t v25 = v101[5];
    v51 = v95 + 5;
    v52 = v89;
LABEL_32:
    v65[2](v65, v25, *v51, v18, v52[5]);
    goto LABEL_33;
  }
LABEL_21:
  uint64_t v25 = *(void *)(*(void *)&buf[8] + 40);
  v44 = (void *)v36[5];
  if (v25)
  {
    if (!v44) {
      goto LABEL_31;
    }
    if (([v44 isEqualToData:*(void *)(*(void *)&buf[8] + 40)] & 1) == 0)
    {
      v45 = NSString;
      uint64_t v46 = [*(id *)(*(void *)&buf[8] + 40) length];
      v47 = [v45 stringWithFormat:@"Non-matching double-encryption payloads (Echnida: %lu, Tetra: %lu)", v46, objc_msgSend((id)v101[5], "length")];
      id v70 = 0;
      MPLogAndAssignError(3002, &v70, v47);
      id v48 = v70;
      [v18 setObject:v48 forKey:&unk_26C70CD88];
      v49 = MessageProtectionLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
        -[NGMFullDeviceIdentity unsealMessageAndAttributes:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedByPublicIdentity:decryptionBlock:]((uint64_t)v47, v49);
      }
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke_41;
    aBlock[3] = &unk_26427F540;
    aBlock[4] = &v108;
    aBlock[5] = &v88;
    v50 = _Block_copy(aBlock);
    v65[2](v65, *(void *)(*(void *)&buf[8] + 40), v115[5], v18, (uint64_t)v50);
  }
  else
  {
    if (!v44) {
      goto LABEL_31;
    }
    v65[2](v65, (uint64_t)v44, v95[5], v18, v89[5]);
  }
LABEL_33:
  _Block_object_dispose(v86, 8);

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v94, 8);

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(v106, 8);

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v114, 8);

  _Block_object_dispose(buf, 8);
}

void __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v18 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  id v13 = *(void **)(a1 + 32);
  if (v11)
  {
    [*(id *)(a1 + 32) setObject:v11 forKey:&unk_26C70CD70];
  }
  else
  {
    uint64_t v14 = NoError();
    [v13 setObject:v14 forKey:&unk_26C70CD70];

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    id v15 = _Block_copy(v12);
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
}

void __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke_37(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = MessageProtectionLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v21 = 138412290;
    uint64_t v22 = v15;
    _os_log_impl(&dword_2163F2000, v14, OS_LOG_TYPE_INFO, "Finished Tetra decryption of GUID: %@", (uint8_t *)&v21, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  uint64_t v16 = *(void **)(a1 + 40);
  if (v12)
  {
    [*(id *)(a1 + 40) setObject:v12 forKey:&unk_26C70CD88];
  }
  else
  {
    uint64_t v17 = NoError();
    [v16 setObject:v17 forKey:&unk_26C70CD88];

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
    id v18 = _Block_copy(v13);
    uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

uint64_t __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke_41(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
  return v2 & (*(unsigned int (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
}

- (void)unsealMessageAndAttributes:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v78 = v8;
  id v10 = a5;
  id v11 = [[NGMPBOuterMessage alloc] initWithData:v7];
  id v12 = v11;
  if (!v11)
  {
    id v103 = 0;
    MPLogAndAssignError(301, &v103, @"The outer structure of the message is malformed.");
    id v17 = v103;
LABEL_20:
    (*((void (**)(id, void, void, id, void))v10 + 2))(v10, 0, 0, v17, 0);
    goto LABEL_56;
  }
  id v69 = v10;
  id v13 = [(NGMPBOuterMessage *)v11 ephemeralPubKey];

  if (!v13)
  {
    id v102 = 0;
    MPLogAndAssignError(304, &v102, @"The outer structure of the message is missing the ephemeral DH key.");
    id v17 = v102;
    id v10 = v69;
    goto LABEL_20;
  }
  id v68 = v7;
  uint64_t v14 = [DHPublicKey alloc];
  uint64_t v15 = [(NGMPBOuterMessage *)v12 ephemeralPubKey];
  id v101 = 0;
  uint64_t v16 = [(PublicKey *)v14 initWithData:v15 error:&v101];
  id v17 = v101;

  id v79 = (void *)v16;
  if (!v16)
  {
LABEL_36:
    id v10 = v69;
    (*((void (**)(id, void, void, id, void))v69 + 2))(v69, 0, 0, v17, 0);
    goto LABEL_37;
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v18 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  uint64_t v19 = [v18 reverseObjectEnumerator];

  id obj = v19;
  uint64_t v76 = [v19 countByEnumeratingWithState:&v97 objects:v104 count:16];
  if (!v76) {
    goto LABEL_16;
  }
  uint64_t v74 = *(void *)v98;
  while (2)
  {
    for (uint64_t i = 0; i != v76; ++i)
    {
      if (*(void *)v98 != v74) {
        objc_enumerationMutation(obj);
      }
      int v21 = *(void **)(*((void *)&v97 + 1) + 8 * i);
      uint64_t v22 = [v21 dhKey];
      id v96 = v17;
      uint64_t v23 = [v22 keyAgreementWithPublicKey:v79 error:&v96];
      id v24 = v96;

      if (v23)
      {
        v84 = [NGMMessageSignatureFormatter alloc];
        id v70 = v21;
        v82 = [v21 publicPrekey];
        v80 = [v82 dhKey];
        uint64_t v25 = [v80 dataRepresentation];
        id v26 = [(NGMPBOuterMessage *)v12 ephemeralPubKey];
        v27 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
        [v27 publicKey];
        v29 = v28 = v12;
        [v29 dataRepresentation];
        v31 = id v30 = v24;
        id v32 = [(NGMPBOuterMessage *)v28 encryptedPayload];
        long long v33 = v84;
        v85 = (void *)v23;
        uint64_t v34 = [(NGMMessageSignatureFormatter *)v33 initWithDHOutput:v23 prekeyPub:v25 ephemeralPub:v26 recipientPub:v31 ciphertext:v32];

        id v35 = v30;
        id v12 = v28;
        long long v36 = (void *)v34;

        v37 = [(NGMPBOuterMessage *)v12 signature];
        int v38 = [v78 verifySignature:v37 formatter:v36];

        if (v35)
        {
          id v10 = v69;
          (*((void (**)(id, void, void, id, void))v69 + 2))(v69, 0, 0, v35, 0);
          id v9 = v68;
          v42 = v85;
LABEL_54:

          id v17 = v35;
          goto LABEL_55;
        }
        if (!v38)
        {

          id v17 = 0;
          continue;
        }
        v43 = [@"LastPawn-MessageKeys" dataUsingEncoding:4];
        v42 = v85;
        v44 = +[HKDF deriveKeyWith:v85 salt:v43 outputSize:48];

        if (!v44)
        {
          id v10 = v69;
          (*((void (**)(id, void, void, void, void))v69 + 2))(v69, 0, 0, 0, 0);
          id v35 = 0;
          id v9 = v68;
LABEL_53:

          goto LABEL_54;
        }
        v45 = objc_msgSend(v44, "subdataWithRange:", 0, 32);
        uint64_t v46 = objc_msgSend(v44, "subdataWithRange:", 32, 16);
        v47 = [(NGMPBOuterMessage *)v12 encryptedPayload];
        id v48 = +[MP_AES_CTR decrypt:v47 key:v45 IV:v46];

        id v10 = v69;
        if (v48)
        {
          id v94 = 0;
          v49 = +[NGMPadding unpadMessage:v48 error:&v94];
          id v50 = v94;

          if (v49)
          {
            id v81 = v45;
            v51 = v50;
            v52 = [[NGMPBInnerMessage alloc] initWithData:v49];
            id v9 = v68;
            v83 = v52;
            if (v52)
            {
              uint64_t v53 = v52;
              if ([(NGMPBInnerMessage *)v52 hasCounter])
              {
                v77 = v49;
                v54 = +[NGMReplayManager sharedManager];
                v75 = v54;
                if (v54)
                {
                  id v90 = v51;
                  v55 = objc_msgSend(v54, "validateIncomingCounter:prekey:publicIdentity:error:", -[NGMPBInnerMessage counter](v53, "counter"), v70, v78, &v90);
                  id v56 = v90;

                  if (!v55)
                  {
                    v45 = v81;
                    if (v56)
                    {
                      id v89 = v56;
                      id v63 = NSString;
                      id v64 = [v56 description];
                      v65 = [v63 stringWithFormat:@"An error occured while validating the counter: %@", v64];
                      MPLogAndAssignError(6, &v89, v65);
                      id v73 = v46;
                      id v66 = v89;

                      (*((void (**)(id, void, void, id, void))v69 + 2))(v69, 0, 0, v66, 0);
                      id v56 = v66;
                      uint64_t v46 = v73;
                    }
                    else
                    {
                      id v88 = 0;
                      id v67 = [NSString stringWithFormat:@"The message was rejected because of a detected replay."];
                      MPLogAndAssignError(5, &v88, v67);
                      id v56 = v88;

                      (*((void (**)(id, void, void, id, void))v69 + 2))(v69, 0, 0, v56, 0);
                    }
                    id v9 = v68;
                    goto LABEL_50;
                  }
                  int v57 = [(NGMPBInnerMessage *)v53 message];
                  v58 = [(NGMPBInnerMessage *)v53 attributes];
                  (*((void (**)(id, void *, void *, void, NSObject *))v69 + 2))(v69, v57, v58, 0, v55);

                  id v9 = v68;
                }
                else
                {
                  id v91 = v51;
                  MPLogAndAssignError(604, &v91, @"Failed to initialize replay counter database.");
                  id v56 = v91;

                  (*((void (**)(id, void, void, id, void))v69 + 2))(v69, 0, 0, v56, 0);
                  v55 = MessageProtectionLog();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
                    -[NGMFullDeviceIdentity unsealMessageAndAttributes:signedByPublicIdentity:decryptionBlock:](v55);
                  }
                }
                v45 = v81;
LABEL_50:

                v49 = v77;
                goto LABEL_51;
              }
              v92 = v51;
              MPLogAndAssignError(602, &v92, @"No Replay Counter Found.");
              id v62 = v92;
            }
            else
            {
              id v93 = v50;
              MPLogAndAssignError(300, &v93, @"Inside of the incoming payload could not be parsed.");
              id v62 = v93;
            }
            id v56 = v62;

            (*((void (**)(id, void, void, id, void))v69 + 2))(v69, 0, 0, v56, 0);
            v45 = v81;
LABEL_51:

            id v35 = v56;
            id v10 = v69;
            goto LABEL_52;
          }
          (*((void (**)(id, void, void, id, void))v69 + 2))(v69, 0, 0, v50, 0);
          id v9 = v68;
          id v35 = v50;
        }
        else
        {
          id v95 = 0;
          MPLogAndAssignError(400, &v95, @"An error occured while decrypting the message, after a valid signature check.");
          id v35 = v95;
          (*((void (**)(id, void, void, id, void))v69 + 2))(v69, 0, 0, v35, 0);
          id v9 = v68;
        }
LABEL_52:

        goto LABEL_53;
      }
      id v17 = v24;
    }
    uint64_t v76 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
    if (v76) {
      continue;
    }
    break;
  }
LABEL_16:

  v39 = [(NGMPBOuterMessage *)v12 keyValidator];
  id v87 = v17;
  BOOL v40 = +[NGMKeyValidator isValidKeyValidator:v39 receiversIdentity:self sendersIdentity:v78 error:&v87];
  id v41 = v87;

  if (!v40)
  {
    id v86 = v41;
    v59 = NSString;
    if (v41)
    {
      id v60 = [v41 description];
    }
    else
    {
      id v60 = @"None";
    }
    id v61 = [v59 stringWithFormat:@"No key could be found to validate the signature, with optional failure: %@.", v60];
    MPLogAndAssignError(404, &v86, v61);
    id v17 = v86;

    if (v41) {
    goto LABEL_36;
    }
  }
  (*((void (**)(id, void, void, id, void))v69 + 2))(v69, 0, 0, v41, 0);
  id v17 = v41;
  id v10 = v69;
LABEL_37:
  id v9 = v68;
LABEL_55:

LABEL_56:
}

- (id)signDataWithFormatter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
  id v8 = [v7 signDataWithFormatter:v6 error:a4];

  return v8;
}

- (BOOL)shouldRollEncryptionIdentity
{
  if (![(NGMFullDeviceIdentity *)self requiresMigration])
  {
    BOOL v4 = [(NGMFullDeviceIdentity *)self devicePrekeys];
    BOOL v5 = [v4 lastObject];

    if (v5)
    {
      if (MPSecondaryRegistrationDisabled()
        && ([v5 tetraRegistration], id v6 = objc_claimAutoreleasedReturnValue(),
                                                   v6,
                                                   v6))
      {
        id v7 = MessageProtectionLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          __int16 v16 = 0;
          id v8 = "Re-registering with a fresh prekey because Tetra was disabled and we still have a prekey with secondary registration.";
          id v9 = (uint8_t *)&v16;
LABEL_17:
          _os_log_impl(&dword_2163F2000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
        }
      }
      else
      {
        id v10 = [v5 tetraRegistration];

        if (v10)
        {
          id v11 = [v5 tetraRegistration];
          int v12 = [v11 tetraVersion];
          BOOL v13 = v12 == +[TetraVersions currentTetraVersion];
        }
        else
        {
          BOOL v13 = 0;
        }
        if ((MPSecondaryRegistrationDisabled() & 1) != 0 || v13)
        {
          BOOL v3 = +[NGMTimeBasedEvaluations prekeyShouldBeRolled:v5];
          goto LABEL_20;
        }
        id v7 = MessageProtectionLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          __int16 v15 = 0;
          id v8 = "Re-registering because of Tetra update or an enablement.";
          id v9 = (uint8_t *)&v15;
          goto LABEL_17;
        }
      }
    }
    else
    {
      id v7 = MessageProtectionLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = 0;
        id v8 = "No device prekey is available, rolling should occur.";
        id v9 = (uint8_t *)&v17;
        goto LABEL_17;
      }
    }

    BOOL v3 = 1;
LABEL_20:

    return v3;
  }
  return 1;
}

- (BOOL)eraseFromKeyChain:(id *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    int v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 &= [*(id *)(*((void *)&v10 + 1) + 8 * i) delete];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (id)keyRollingTicketWithError:(id *)a3
{
  uint64_t v5 = [NGMKeyRollingTicket alloc];
  uint64_t v6 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
  id v7 = [(NGMKeyRollingTicket *)v5 initTicketWithSigningKey:v6 error:a3];

  return v7;
}

- (BOOL)updateWithRegisteredTicket:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (+[NGMTimeBasedEvaluations prekeyCanBeDeleted:v12])
        {
          [v12 delete];
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  long long v13 = +[NGMReplayManager sharedManager];
  [v13 deleteExpiredSendingDestinations];

  uint64_t v14 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  [v14 removeObjectsInArray:v6];

  uint64_t v15 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  __int16 v16 = [v5 prekey];
  [v15 addObject:v16];

  return 1;
}

- (id)description
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = [MEMORY[0x263F089D8] string];
  BOOL v3 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__NGMFullDeviceIdentity_description__block_invoke;
  v9[3] = &unk_26427F3F0;
  v9[4] = &v10;
  [v3 enumerateObjectsUsingBlock:v9];

  uint64_t v4 = NSString;
  id v5 = [(NGMFullDeviceIdentity *)self deviceSigningKey];
  uint64_t v6 = [v5 description];
  id v7 = [v4 stringWithFormat:@"NGMFullDeviceIdentity with device signing key: %@ \n Prekeys: %@", v6, v11[5]];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __36__NGMFullDeviceIdentity_description__block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 description];
  [v2 appendString:v3];
}

- (BOOL)testing_duplicatePrekeyRegistration
{
  id v3 = +[NGMReplayManager sharedManager];
  uint64_t v4 = [(NGMFullDeviceIdentity *)self devicePrekeys];
  id v5 = [v4 firstObject];
  char v6 = [v3 duplicateTagForPrekey:v5];

  return v6;
}

- (SigningKey)deviceSigningKey
{
  return self->_deviceSigningKey;
}

- (void)setDeviceSigningKey:(id)a3
{
}

- (NSMutableArray)devicePrekeys
{
  return self->_devicePrekeys;
}

- (void)setDevicePrekeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePrekeys, 0);
  objc_storeStrong((id *)&self->_deviceSigningKey, 0);
}

+ (void)identityWithAccess:(id *)a1 error:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [*a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_2163F2000, a2, OS_LOG_TYPE_ERROR, "Signing key generation failed: %@", (uint8_t *)&v4, 0xCu);
}

+ (void)identityWithDataRepresentation:(void *)a3 error:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 description];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_2163F2000, a4, OS_LOG_TYPE_ERROR, "Failed to deserialize prekey in NGMFullDeviceIdentity initialization: %@.", a1, 0xCu);
}

- (void)unsealMessageAndAttributes:(uint64_t)a1 authenticatedData:(NSObject *)a2 messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedByPublicIdentity:decryptionBlock:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_2163F2000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)unsealMessageAndAttributes:(os_log_t)log signedByPublicIdentity:decryptionBlock:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2163F2000, log, OS_LOG_TYPE_FAULT, "Failed to initialize replay counter database.", v1, 2u);
}

@end