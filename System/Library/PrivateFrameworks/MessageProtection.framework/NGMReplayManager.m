@interface NGMReplayManager
+ (id)sharedManager;
- (BOOL)deleteExpiredSendingDestinations;
- (BOOL)deleteReceivingCountersForKey:(id)a3;
- (BOOL)duplicateTagForPrekey:(id)a3;
- (BOOL)isBATS;
- (BOOL)isRunningTests;
- (BOOL)isXCTest;
- (BOOL)processFetchRequestAndValidate:(id)a3 counter:(unsigned int)a4 commit:(BOOL)a5 theirIdentity:(id)a6 prekey:(id)a7 error:(id *)a8;
- (id)computeDestinationHashForIncomingMessageFrom:(id)a3 toLocalKey:(id)a4;
- (id)computeDestinationHashForOutgoingMessageTo:(id)a3 withLocalKey:(id)a4;
- (id)dbNameFromProcess;
- (id)objectContextWithError:(id *)a3;
- (id)persistentContainerWithError:(id *)a3;
- (id)persistentStoreDescription;
- (id)pruneDuplicates:(id)a3 tag:(id)a4 moc:(id)a5;
- (id)registeredPrekeyForNGMPrekey:(id)a3 objectContext:(id)a4;
- (id)validateIncomingCounter:(unsigned int)a3 prekey:(id)a4 publicIdentity:(id)a5 error:(id *)a6;
- (unsigned)counterForDestinationWithIdentityKey:(id)a3 sendingIdentity:(id)a4 error:(id *)a5 success:(BOOL *)a6;
- (void)deleteExpiredSendingDestinations;
- (void)logDatabaseCreationDate:(id)a3;
- (void)persistentStoreDescription;
@end

@implementation NGMReplayManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__NGMReplayManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

void __33__NGMReplayManager_sharedManager__block_invoke(uint64_t a1)
{
  v2 = MessageProtectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2163F2000, v2, OS_LOG_TYPE_INFO, "Setting shared instance of the NGMReplayManager.", v5, 2u);
  }

  id v3 = objc_alloc_init(*(Class *)(a1 + 32));
  v4 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v3;
}

- (id)dbNameFromProcess
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  id v3 = [v2 processName];

  v4 = [NSString stringWithFormat:@"/NGMTrustStore-%@.db", v3];

  return v4;
}

- (BOOL)isBATS
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  id v3 = [v2 environment];

  v4 = [v3 objectForKeyedSubscript:@"BATS"];
  if (v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"PWD"];
    char v6 = [v5 isEqualToString:@"/AppleInternal/XCTests/com.apple.messageprotection"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isXCTest
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  id v3 = [v2 environment];

  v4 = [v3 objectForKeyedSubscript:@"XCTestBundlePath"];
  v5 = [v4 pathExtension];
  char v6 = [v5 isEqualToString:@"xctest"];

  return v6;
}

- (BOOL)isRunningTests
{
  if ([(NGMReplayManager *)self isBATS]) {
    return 1;
  }
  return [(NGMReplayManager *)self isXCTest];
}

- (id)persistentStoreDescription
{
  id v3 = [(NGMReplayManager *)self dbNameFromProcess];
  if ([(NGMReplayManager *)self isRunningTests])
  {
    v4 = NSTemporaryDirectory();
LABEL_5:
    v9 = [v4 stringByAppendingString:v3];

    v10 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v9];
    v11 = (void *)[objc_alloc(MEMORY[0x263EFF328]) initWithURL:v10];
    [v11 setOption:*MEMORY[0x263F08098] forKey:*MEMORY[0x263EFF0E0]];
    [v11 setShouldAddStoreAsynchronously:0];

    goto LABEL_6;
  }
  uint64_t v5 = NSHomeDirectory();
  if (v5)
  {
    char v6 = (void *)v5;
    v7 = NSString;
    v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v5, @"/Library/IdentityServices", 0);
    v4 = [v7 pathWithComponents:v8];

    goto LABEL_5;
  }
  v9 = MessageProtectionLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    -[NGMReplayManager persistentStoreDescription](v9);
  }
  v11 = 0;
LABEL_6:

  return v11;
}

- (id)objectContextWithError:(id *)a3
{
  v4 = -[NGMReplayManager persistentContainerWithError:](self, "persistentContainerWithError:");
  if (v4)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
    char v6 = [v4 persistentStoreCoordinator];
    [v5 setPersistentStoreCoordinator:v6];
  }
  else
  {
    v7 = MessageProtectionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NGMReplayManager objectContextWithError:](a3);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)persistentContainerWithError:(id *)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  v4 = self;
  objc_sync_enter(v4);
  persistentContainer = v4->_persistentContainer;
  if (persistentContainer) {
    goto LABEL_2;
  }
  v7 = MessageProtectionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2163F2000, v7, OS_LOG_TYPE_INFO, "Performing initial load of the replay database.", buf, 2u);
  }

  v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MessageProtection"];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 URLForResource:@"NGMTrustStore" withExtension:@"momd"];
    if (v10)
    {
      v11 = (void *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v10];
      if (v11)
      {
        v12 = [objc_alloc(MEMORY[0x263EFF2E8]) initWithName:@"NGMTrustStore" managedObjectModel:v11];
        uint64_t v13 = [(NGMReplayManager *)v4 persistentStoreDescription];
        v14 = (void *)v13;
        if (v13)
        {
          v31[0] = v13;
          v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
          [v12 setPersistentStoreDescriptions:v15];

          *(void *)buf = 0;
          v26 = buf;
          uint64_t v27 = 0x3032000000;
          v28 = __Block_byref_object_copy__0;
          v29 = __Block_byref_object_dispose__0;
          id v30 = 0;
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __49__NGMReplayManager_persistentContainerWithError___block_invoke;
          v24[3] = &unk_26427F5B8;
          v24[4] = v4;
          v24[5] = buf;
          [v12 loadPersistentStoresWithCompletionHandler:v24];
          if (*((void *)v26 + 5))
          {
            v16 = MessageProtectionLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[NGMReplayManager persistentContainerWithError:].cold.4(v16);
            }

            if (a3) {
              *a3 = *((id *)v26 + 5);
            }
            int v17 = 1;
          }
          else
          {
            v21 = MessageProtectionLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v23[0] = 0;
              _os_log_impl(&dword_2163F2000, v21, OS_LOG_TYPE_INFO, "Loading the persistent container worked, setting it to shared instance", (uint8_t *)v23, 2u);
            }

            objc_storeStrong((id *)&v4->_persistentContainer, v12);
            int v17 = 0;
          }
          _Block_object_dispose(buf, 8);
        }
        else
        {
          MPLogAndAssignError(6, a3, @"Failed to get the persistentStoreDescription.");
          int v17 = 1;
        }
      }
      else
      {
        v12 = MessageProtectionLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          v20 = [v10 description];
          [(NGMReplayManager *)v20 persistentContainerWithError:v12];
        }
        int v17 = 1;
      }

      if (!v17)
      {
        persistentContainer = v4->_persistentContainer;
LABEL_2:
        char v6 = persistentContainer;
        goto LABEL_32;
      }
    }
    else
    {
      v19 = MessageProtectionLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[NGMReplayManager persistentContainerWithError:](v19);
      }

      MPLogAndAssignError(9, a3, @"Failed to lookup replay database model in bundle.");
    }
  }
  else
  {
    v18 = MessageProtectionLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[NGMReplayManager persistentContainerWithError:](v18);
    }

    MPLogAndAssignError(8, a3, @"Failed to lookup MessageProtection bundle.");
  }
  char v6 = 0;
LABEL_32:
  objc_sync_exit(v4);

  return v6;
}

void __49__NGMReplayManager_persistentContainerWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = MessageProtectionLog();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __49__NGMReplayManager_persistentContainerWithError___block_invoke_cold_1(v6);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = v6;
    v11 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = [v5 description];
      int v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_2163F2000, v8, OS_LOG_TYPE_INFO, "Loaded container with description: %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v13 = *(void **)(a1 + 32);
    v11 = [v5 URL];
    [v13 logDatabaseCreationDate:v11];
  }
}

- (void)logDatabaseCreationDate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  id v6 = [v4 absoluteString];

  v7 = [v5 attributesOfItemAtPath:v6 error:0];

  if (v7)
  {
    v8 = [v7 objectForKey:*MEMORY[0x263F08008]];
    uint64_t v9 = MessageProtectionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v8 description];
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_2163F2000, v9, OS_LOG_TYPE_INFO, "Loaded replay database was created at: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)computeDestinationHashForOutgoingMessageTo:(id)a3 withLocalKey:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFF990];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 data];
  uint64_t v9 = [v7 signingKey];
  id v10 = [v9 dataRepresentation];
  [v8 appendData:v10];

  int v11 = [v7 echnidaRegistration];

  v12 = [v11 dhKey];
  uint64_t v13 = [v12 dataRepresentation];
  [v8 appendData:v13];

  int v14 = [v6 dataUsingEncoding:4];

  [v8 appendData:v14];
  v15 = [@"Outgoing" dataUsingEncoding:4];
  [v8 appendData:v15];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:32];
  id v17 = v8;
  v18 = (const void *)[v17 bytes];
  LODWORD(v12) = [v17 length];
  id v19 = v16;
  CC_SHA256(v18, (CC_LONG)v12, (unsigned __int8 *)[v19 bytes]);
  v20 = [v19 base64EncodedStringWithOptions:0];

  return v20;
}

- (id)computeDestinationHashForIncomingMessageFrom:(id)a3 toLocalKey:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFF990];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 data];
  uint64_t v9 = [v7 signingKey];
  id v10 = [v9 dataRepresentation];
  [v8 appendData:v10];

  int v11 = [v7 echnidaRegistration];

  v12 = [v11 dhKey];
  uint64_t v13 = [v12 dataRepresentation];
  [v8 appendData:v13];

  int v14 = [v6 dataUsingEncoding:4];

  [v8 appendData:v14];
  v15 = [@"Incoming" dataUsingEncoding:4];
  [v8 appendData:v15];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:32];
  id v17 = v8;
  v18 = (const void *)[v17 bytes];
  LODWORD(v12) = [v17 length];
  id v19 = v16;
  CC_SHA256(v18, (CC_LONG)v12, (unsigned __int8 *)[v19 bytes]);
  v20 = [v19 base64EncodedStringWithOptions:0];

  return v20;
}

- (unsigned)counterForDestinationWithIdentityKey:(id)a3 sendingIdentity:(id)a4 error:(id *)a5 success:(BOOL *)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  *a6 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  int v40 = -1;
  v12 = [(NGMReplayManager *)self objectContextWithError:a5];
  if (v12)
  {
    uint64_t v13 = +[SendingDestination fetchRequest];
    *(void *)buf = 0;
    v42 = buf;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__0;
    v45 = __Block_byref_object_dispose__0;
    int v14 = [v11 deviceSigningKey];
    v15 = [v14 keyIdentifier];
    id v46 = [(NGMReplayManager *)self computeDestinationHashForOutgoingMessageTo:v10 withLocalKey:v15];

    uint64_t v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"destinationHash == %@", *((void *)v42 + 5)];
    [v13 setPredicate:v16];

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    id v36 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke;
    v23[3] = &unk_26427F5E0;
    id v24 = v12;
    id v17 = v13;
    id v25 = v17;
    uint64_t v27 = &v31;
    v28 = &v37;
    v29 = buf;
    id v30 = a6;
    id v26 = v10;
    [v24 performBlockAndWait:v23];
    if (a5)
    {
      v18 = (void *)v32[5];
      if (v18) {
        *a5 = v18;
      }
    }
    unsigned int v19 = *((_DWORD *)v38 + 6);

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v20 = MessageProtectionLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = [*a5 description];
      -[NGMReplayManager counterForDestinationWithIdentityKey:sendingIdentity:error:success:](v21, buf, v20);
    }

    unsigned int v19 = *((_DWORD *)v38 + 6);
  }

  _Block_object_dispose(&v37, 8);
  return v19;
}

void __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 56;
  uint64_t v2 = *(void *)(a1 + 56);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v3 - 16);
  uint64_t v6 = *(void *)(v2 + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [v4 executeFetchRequest:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)(*(void *)v3 + 8) + 40))
  {
    MessageProtectionLog();
    v8 = (SendingDestination *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR)) {
      __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke_cold_2(v3);
    }
    goto LABEL_15;
  }
  if ([v7 count] == 1)
  {
    v8 = [v7 objectAtIndexedSubscript:0];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [(SendingDestination *)v8 validOutgoingCounter];
    int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v9 == -1)
    {
      uint64_t v17 = *(void *)(*(void *)v3 + 8);
      id v27 = *(id *)(v17 + 40);
      MPLogAndAssignError(603, &v27, @"Replay Protection Error: Ran out of counters");
      objc_storeStrong((id *)(v17 + 40), v27);
LABEL_15:

      goto LABEL_16;
    }
    [(SendingDestination *)v8 setValidOutgoingCounter:(v9 + 1)];
    **(unsigned char **)(a1 + 80) = 1;
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void **)(v11 + 40);
    v12 = (id *)(v11 + 40);
    id v26 = v13;
    [v10 save:&v26];
    id v14 = v26;
  }
  else
  {
    if ([v7 count])
    {
      uint64_t v15 = *(void *)(*(void *)v3 + 8);
      id v24 = *(id *)(v15 + 40);
      MPLogAndAssignError(600, &v24, @"It appears we have a collision in the hashes.");
      id v16 = v24;
      v8 = *(SendingDestination **)(v15 + 40);
      *(void *)(v15 + 40) = v16;
      goto LABEL_12;
    }
    v8 = [[SendingDestination alloc] initWithContext:*(void *)(a1 + 32)];
    [(SendingDestination *)v8 setDestinationHash:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    v18 = (void *)MEMORY[0x263EFF910];
    unsigned int v19 = [*(id *)(a1 + 48) echnidaRegistration];
    [v19 timestamp];
    v20 = objc_msgSend(v18, "dateWithTimeIntervalSince1970:");
    [(SendingDestination *)v8 setRegistrationDate:v20];

    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    [(SendingDestination *)v8 setValidOutgoingCounter:1];
    **(unsigned char **)(a1 + 80) = 1;
    v21 = *(void **)(a1 + 32);
    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
    v23 = *(void **)(v22 + 40);
    v12 = (id *)(v22 + 40);
    id v25 = v23;
    [v21 save:&v25];
    id v14 = v25;
  }
  objc_storeStrong(v12, v14);
  +[FilesystemUtils syncIfNeededOnPlatform];
LABEL_12:

  if (*(void *)(*(void *)(*(void *)v3 + 8) + 40))
  {
    **(unsigned char **)(a1 + 80) = 0;
    MessageProtectionLog();
    v8 = (SendingDestination *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR)) {
      __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke_cold_1(v3);
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (id)validateIncomingCounter:(unsigned int)a3 prekey:(id)a4 publicIdentity:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 dhKey];
  uint64_t v13 = [v12 keyIdentifier];
  id v14 = [(NGMReplayManager *)self computeDestinationHashForIncomingMessageFrom:v11 toLocalKey:v13];

  uint64_t v15 = MessageProtectionLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v31 = v8;
    __int16 v32 = 2112;
    uint64_t v33 = v14;
    _os_log_impl(&dword_2163F2000, v15, OS_LOG_TYPE_INFO, "Validating counter (%i) for destination hash: %@", buf, 0x12u);
  }

  BOOL v16 = [(NGMReplayManager *)self processFetchRequestAndValidate:v14 counter:v8 commit:0 theirIdentity:v11 prekey:v10 error:a6];
  if (a6 && *a6)
  {
    uint64_t v17 = NSString;
    v18 = [*a6 description];
    unsigned int v19 = [v17 stringWithFormat:@"An issue occured while validating the counter: %@", v18];
    MPLogAndAssignError(6, a6, v19);

LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  v20 = MessageProtectionLog();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (!v16)
  {
    if (v21)
    {
      *(_DWORD *)buf = 67109120;
      int v31 = v8;
      _os_log_impl(&dword_2163F2000, v20, OS_LOG_TYPE_INFO, "Counter (%i) is considered invalid.", buf, 8u);
    }

    goto LABEL_13;
  }
  if (v21)
  {
    *(_DWORD *)buf = 67109120;
    int v31 = v8;
    _os_log_impl(&dword_2163F2000, v20, OS_LOG_TYPE_INFO, "Counter (%i) is considered valid.", buf, 8u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__NGMReplayManager_validateIncomingCounter_prekey_publicIdentity_error___block_invoke;
  aBlock[3] = &unk_26427F608;
  aBlock[4] = self;
  id v26 = v14;
  int v29 = v8;
  id v27 = v11;
  id v28 = v10;
  uint64_t v22 = _Block_copy(aBlock);
  v23 = _Block_copy(v22);

LABEL_14:
  return v23;
}

uint64_t __72__NGMReplayManager_validateIncomingCounter_prekey_publicIdentity_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processFetchRequestAndValidate:*(void *)(a1 + 40) counter:*(unsigned int *)(a1 + 64) commit:1 theirIdentity:*(void *)(a1 + 48) prekey:*(void *)(a1 + 56) error:a2];
}

- (BOOL)processFetchRequestAndValidate:(id)a3 counter:(unsigned int)a4 commit:(BOOL)a5 theirIdentity:(id)a6 prekey:(id)a7 error:(id *)a8
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  BOOL v16 = [(NGMReplayManager *)self objectContextWithError:a8];
  if (v16)
  {
    uint64_t v17 = +[SenderPublicIdentity fetchRequest];
    v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"destinationHash == %@", v13];
    [v17 setPredicate:v18];

    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    uint64_t v43 = __Block_byref_object_copy__0;
    v44 = __Block_byref_object_dispose__0;
    id v45 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke;
    v25[3] = &unk_26427F630;
    id v26 = v16;
    unsigned int v19 = v17;
    id v27 = v19;
    __int16 v32 = &v40;
    id v28 = v14;
    id v29 = v13;
    id v30 = self;
    id v31 = v15;
    uint64_t v33 = &v36;
    unsigned int v34 = a4;
    BOOL v35 = a5;
    [v26 performBlockAndWait:v25];
    if (v41[5])
    {
      v20 = MessageProtectionLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        BOOL v21 = [(id)v41[5] description];
        -[NGMReplayManager processFetchRequestAndValidate:counter:commit:theirIdentity:prekey:error:](a5, v21, buf, v20);
      }

      BOOL v22 = 0;
      if (a8) {
        *a8 = (id) v41[5];
      }
    }
    else
    {
      BOOL v22 = *((unsigned char *)v37 + 24) != 0;
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    unsigned int v19 = MessageProtectionLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NGMReplayManager processFetchRequestAndValidate:counter:commit:theirIdentity:prekey:error:](a8);
    }
    BOOL v22 = 0;
  }

  return v22;
}

void __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1 + 80;
  uint64_t v2 = *(void *)(a1 + 80);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v3 - 40);
  uint64_t v6 = *(void *)(v2 + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [v4 executeFetchRequest:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)(*(void *)v3 + 8) + 40))
  {
    uint64_t v8 = MessageProtectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke_cold_2(v3);
    }
    goto LABEL_4;
  }
  if ([v7 count] == 1)
  {
    id v10 = [v7 objectAtIndexedSubscript:0];
    id v11 = [NGMRollingBitmaskBuffer alloc];
    v12 = [(SenderPublicIdentity *)v10 skippedCounters];
    id v13 = [(NGMRollingBitmaskBuffer *)v11 initWithData:v12 upperBufferIndex:[(SenderPublicIdentity *)v10 upperBufferIndex]];
  }
  else
  {
    if ([v7 count])
    {
      BOOL v21 = *(void **)(a1 + 72);
      uint64_t v22 = *(void *)(*(void *)(a1 + 80) + 8);
      id v31 = *(id *)(v22 + 40);
      v23 = NSString;
      uint64_t v8 = [v21 dhKey];
      id v24 = [v8 description];
      id v25 = [v23 stringWithFormat:@"We have duplicate entries on the incoming validation counter for key: %@ \n, destinationHash: %@.", v24, *(void *)(a1 + 56)];
      MPLogAndAssignError(600, &v31, v25);
      objc_storeStrong((id *)(v22 + 40), v31);

LABEL_4:
      int v9 = 0;
      id v10 = 0;
LABEL_5:

      goto LABEL_6;
    }
    id v10 = [[SenderPublicIdentity alloc] initWithContext:*(void *)(a1 + 32)];
    id v26 = (void *)MEMORY[0x263EFF910];
    id v27 = [*(id *)(a1 + 48) echnidaRegistration];
    [v27 timestamp];
    id v28 = objc_msgSend(v26, "dateWithTimeIntervalSince1970:");
    [(SenderPublicIdentity *)v10 setDate:v28];

    [(SenderPublicIdentity *)v10 setDestinationHash:*(void *)(a1 + 56)];
    uint64_t v29 = [*(id *)(a1 + 64) registeredPrekeyForNGMPrekey:*(void *)(a1 + 72) objectContext:*(void *)(a1 + 32)];
    if (!v29)
    {
      uint64_t v8 = MessageProtectionLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke_cold_1((id *)(a1 + 72));
      }
      int v9 = 0;
      goto LABEL_5;
    }
    v12 = (void *)v29;
    [(SenderPublicIdentity *)v10 setMessagedKey:v29];
    id v13 = objc_alloc_init(NGMRollingBitmaskBuffer);
  }
  int v9 = v13;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [(NGMRollingBitmaskBuffer *)v9 processIncomingCounter:*(unsigned int *)(a1 + 96)];
  id v14 = [(NGMRollingBitmaskBuffer *)v9 bufferData];
  [(SenderPublicIdentity *)v10 setSkippedCounters:v14];

  [(SenderPublicIdentity *)v10 setUpperBufferIndex:[(NGMRollingBitmaskBuffer *)v9 upper_buffer_index]];
  id v15 = MessageProtectionLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = *(void *)(a1 + 56);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
      uint64_t v17 = "";
    }
    else {
      uint64_t v17 = "not";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v16;
    __int16 v35 = 2080;
    uint64_t v36 = v17;
    _os_log_impl(&dword_2163F2000, v15, OS_LOG_TYPE_INFO, "Successfully fetched counters for destination (%@) and counter is %s valid.", buf, 0x16u);
  }

  if (*(unsigned char *)(a1 + 100))
  {
    v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
    id v30 = *(id *)(v19 + 40);
    [v18 save:&v30];
    id v20 = v30;
    uint64_t v8 = *(NSObject **)(v19 + 40);
    *(void *)(v19 + 40) = v20;
    goto LABEL_5;
  }
LABEL_6:
}

- (id)pruneDuplicates:(id)a3 tag:(id)a4 moc:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v7);
        }
        [v9 deleteObject:*(void *)(*((void *)&v16 + 1) + 8 * i)];
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
  id v14 = [[RegisteredPreKey alloc] initWithContext:v9];
  [(RegisteredPreKey *)v14 setTag:v8];

  return v14;
}

- (id)registeredPrekeyForNGMPrekey:(id)a3 objectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[RegisteredPreKey fetchRequest];
  id v9 = [v6 dhKey];
  uint64_t v10 = [v9 keyIdentifier];

  uint64_t v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"tag = %@", v10];
  [v8 setPredicate:v11];

  id v23 = 0;
  uint64_t v12 = [v7 executeFetchRequest:v8 error:&v23];
  id v13 = v23;
  if (!v13)
  {
    if ([v12 count] == 1)
    {
      uint64_t v17 = [v12 objectAtIndexedSubscript:0];
    }
    else
    {
      if (![v12 count])
      {
        long long v16 = [[RegisteredPreKey alloc] initWithContext:v7];
        id v20 = [v6 dhKey];
        uint64_t v21 = [v20 keyIdentifier];
        [(RegisteredPreKey *)v16 setTag:v21];

        id v22 = 0;
        [v7 save:&v22];
        id v14 = v22;
        goto LABEL_12;
      }
      long long v18 = MessageProtectionLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[NGMReplayManager registeredPrekeyForNGMPrekey:objectContext:]();
      }

      uint64_t v17 = [(NGMReplayManager *)self pruneDuplicates:v12 tag:v10 moc:v7];
    }
    long long v16 = (RegisteredPreKey *)v17;
    id v14 = 0;
    goto LABEL_12;
  }
  id v14 = v13;
  id v15 = MessageProtectionLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[NGMReplayManager registeredPrekeyForNGMPrekey:objectContext:](v14);
  }

  long long v16 = 0;
LABEL_12:

  return v16;
}

- (BOOL)deleteReceivingCountersForKey:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v22 = 0;
  uint64_t v5 = [(NGMReplayManager *)self objectContextWithError:&v22];
  id v6 = v22;
  if (v5)
  {
    id v7 = +[RegisteredPreKey fetchRequest];
    id v8 = (void *)MEMORY[0x263F08A98];
    id v9 = [v4 dhKey];
    uint64_t v10 = [v9 keyIdentifier];
    uint64_t v11 = [v8 predicateWithFormat:@"tag = %@", v10];
    [v7 setPredicate:v11];

    id v21 = v6;
    uint64_t v12 = [v5 executeFetchRequest:v7 error:&v21];
    id v13 = v21;

    if (v13)
    {
      id v14 = MessageProtectionLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[NGMReplayManager deleteReceivingCountersForKey:](v13);
      }
    }
    else
    {
      if ([v12 count] != 1)
      {
        if ([v12 count])
        {
          id v13 = 0;
          BOOL v15 = 0;
          goto LABEL_7;
        }
        id v14 = MessageProtectionLog();
        BOOL v15 = 1;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          long long v18 = [v4 dhKey];
          long long v19 = [v18 description];
          *(_DWORD *)buf = 138412290;
          id v24 = v19;
          _os_log_impl(&dword_2163F2000, v14, OS_LOG_TYPE_INFO, "No counters to delete for %@, probably never received any messages to that prekey.", buf, 0xCu);
        }
        id v13 = 0;
LABEL_6:

LABEL_7:
        id v6 = v13;
        goto LABEL_11;
      }
      uint64_t v17 = [v12 objectAtIndexedSubscript:0];
      [v5 deleteObject:v17];

      id v20 = 0;
      [v5 save:&v20];
      id v13 = v20;
      if (!v13)
      {
        BOOL v15 = 1;
        goto LABEL_7;
      }
      id v14 = MessageProtectionLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[NGMReplayManager deleteReceivingCountersForKey:](v4, v13);
      }
    }
    BOOL v15 = 0;
    goto LABEL_6;
  }
  id v7 = MessageProtectionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[NGMReplayManager deleteReceivingCountersForKey:](v6);
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)deleteExpiredSendingDestinations
{
  id v19 = 0;
  uint64_t v2 = [(NGMReplayManager *)self objectContextWithError:&v19];
  id v3 = v19;
  if (v2)
  {
    id v4 = +[SendingDestination fetchRequest];
    uint64_t v5 = (void *)MEMORY[0x263F08A98];
    id v6 = +[NGMTimeBasedEvaluations oldestDateAllowedToSendTo];
    id v7 = [v5 predicateWithFormat:@"registrationDate < %@", v6];
    [v4 setPredicate:v7];

    id v18 = v3;
    id v8 = [v2 executeFetchRequest:v4 error:&v18];
    id v9 = v18;

    if (v9)
    {
      uint64_t v10 = MessageProtectionLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[NGMReplayManager deleteExpiredSendingDestinations](v9);
      }
      BOOL v11 = 0;
    }
    else
    {
      if (![v8 count])
      {
        id v9 = 0;
        BOOL v11 = 1;
LABEL_18:

        id v3 = v9;
        goto LABEL_19;
      }
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __52__NGMReplayManager_deleteExpiredSendingDestinations__block_invoke;
      v16[3] = &unk_26427F658;
      uint64_t v12 = v2;
      uint64_t v17 = v12;
      [v8 enumerateObjectsUsingBlock:v16];
      id v15 = 0;
      [v12 save:&v15];
      id v9 = v15;
      if (v9)
      {
        id v13 = MessageProtectionLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[NGMReplayManager deleteExpiredSendingDestinations](v9);
        }

        BOOL v11 = 0;
      }
      else
      {
        BOOL v11 = 1;
      }
      uint64_t v10 = v17;
    }

    goto LABEL_18;
  }
  id v4 = MessageProtectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[NGMReplayManager deleteExpiredSendingDestinations](v3);
  }
  BOOL v11 = 0;
LABEL_19:

  return v11;
}

uint64_t __52__NGMReplayManager_deleteExpiredSendingDestinations__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

- (BOOL)duplicateTagForPrekey:(id)a3
{
  id v14 = 0;
  id v4 = a3;
  uint64_t v5 = [(NGMReplayManager *)self objectContextWithError:&v14];
  id v6 = v14;
  id v7 = [[RegisteredPreKey alloc] initWithContext:v5];
  id v8 = [v4 dhKey];

  id v9 = [v8 keyIdentifier];
  [(RegisteredPreKey *)v7 setTag:v9];

  id v13 = v6;
  [v5 save:&v13];
  id v10 = v13;

  if (v10)
  {
    BOOL v11 = MessageProtectionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[NGMReplayManager duplicateTagForPrekey:](v10);
    }
  }
  return v10 == 0;
}

- (void).cxx_destruct
{
}

- (void)persistentStoreDescription
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2163F2000, log, OS_LOG_TYPE_FAULT, "Failed to get the reference to the Home Directory.", v1, 2u);
}

- (void)objectContextWithError:(id *)a1 .cold.1(id *a1)
{
  v1 = [*a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Failing to initialize a Managed Object Context for NGMTrustStore queries: %@.", v4, v5, v6, v7, v8);
}

- (void)persistentContainerWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = @"Failed to lookup MessageProtection bundle.";
  _os_log_fault_impl(&dword_2163F2000, log, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v1, 0xCu);
}

- (void)persistentContainerWithError:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = @"Failed to lookup replay database model in bundle.";
  _os_log_fault_impl(&dword_2163F2000, log, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v1, 0xCu);
}

- (void)persistentContainerWithError:(os_log_t)log .cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_2163F2000, log, OS_LOG_TYPE_FAULT, "Failed to initialize NSManagedObjectModel with URL: %@", buf, 0xCu);
}

- (void)persistentContainerWithError:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_2163F2000, log, OS_LOG_TYPE_ERROR, "The loading of the persistent contained failed, returning nil.", v1, 2u);
}

void __49__NGMReplayManager_persistentContainerWithError___block_invoke_cold_1(void *a1)
{
  int v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2163F2000, v2, v3, "Failed to load persistent store: %@", v4, v5, v6, v7, v8);
}

- (void)counterForDestinationWithIdentityKey:(os_log_t)log sendingIdentity:error:success:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2163F2000, log, OS_LOG_TYPE_ERROR, "Failed to obtain the managed object context required to do the outgoing replay counter query: %@.", buf, 0xCu);
}

void __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke_cold_1(uint64_t a1)
{
  int v1 = [(id)OUTLINED_FUNCTION_3(a1) description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "An issue occured persisting the managed object context: %@", v4, v5, v6, v7, v8);
}

void __87__NGMReplayManager_counterForDestinationWithIdentityKey_sendingIdentity_error_success___block_invoke_cold_2(uint64_t a1)
{
  int v1 = [(id)OUTLINED_FUNCTION_3(a1) description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Database query failed while obtaining sending counter: %@", v4, v5, v6, v7, v8);
}

- (void)processFetchRequestAndValidate:(id *)a1 counter:commit:theirIdentity:prekey:error:.cold.1(id *a1)
{
  int v1 = [*a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Failed to obtain the managed object context required to validate the incoming replay counter query: %@.", v4, v5, v6, v7, v8);
}

- (void)processFetchRequestAndValidate:(uint8_t *)buf counter:(os_log_t)log commit:theirIdentity:prekey:error:.cold.2(char a1, void *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = @"validating";
  if (a1) {
    uint64_t v5 = @"committing";
  }
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_2163F2000, log, OS_LOG_TYPE_FAULT, "An error happened while %@ the counter: %@", buf, 0x16u);
}

void __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke_cold_1(id *a1)
{
  int v1 = [*a1 dhKey];
  uint64_t v2 = [v1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163F2000, v3, v4, "There was an issue obtaining the registered prekey: %@", v5, v6, v7, v8, v9);
}

void __93__NGMReplayManager_processFetchRequestAndValidate_counter_commit_theirIdentity_prekey_error___block_invoke_cold_2(uint64_t a1)
{
  int v1 = [(id)OUTLINED_FUNCTION_3(a1) description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2163F2000, v2, v3, "Database Query Failure while obtaining incoming counter: %@", v4, v5, v6, v7, v8);
}

- (void)registeredPrekeyForNGMPrekey:objectContext:.cold.1()
{
  uint64_t v6 = [0 description];
  OUTLINED_FUNCTION_4(&dword_2163F2000, v0, v1, "We have duplicate entries on registered prekey. {tag = %@, error = %@}", v2, v3, v4, v5, 2u);
}

- (void)registeredPrekeyForNGMPrekey:(void *)a1 objectContext:.cold.2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Database query failed while obtaining sending counter: %@", v4, v5, v6, v7, v8);
}

- (void)deleteReceivingCountersForKey:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Failed to obtain the managed object context required to validate delete the receiving counters: %@.", v4, v5, v6, v7, v8);
}

- (void)deleteReceivingCountersForKey:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v3 = [a1 dhKey];
  uint64_t v4 = [v3 description];
  BOOL v11 = [a2 description];
  OUTLINED_FUNCTION_4(&dword_2163F2000, v5, v6, "Failed to delete the counters associated with %@: %@", v7, v8, v9, v10, 2u);
}

- (void)deleteReceivingCountersForKey:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2163F2000, v2, v3, "Database query failed while cleaning up old counters: %@", v4, v5, v6, v7, v8);
}

- (void)deleteExpiredSendingDestinations
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2163F2000, v2, v3, "Database query failure while deleting old keys: %@", v4, v5, v6, v7, v8);
}

- (void)duplicateTagForPrekey:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2163F2000, v2, v3, "Failed to create a duplicate for the prekey. {error = %@}", v4, v5, v6, v7, v8);
}

@end