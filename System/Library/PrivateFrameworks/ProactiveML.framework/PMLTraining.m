@interface PMLTraining
+ (id)sharedSingletonWithDirectory:(id)a3;
- (BOOL)isMultiLabelModel:(id)a3;
- (PMLTraining)initWithStore:(id)a3 fidesStore:(id)a4 availableSessionsTracker:(id)a5;
- (PMLTrainingStore)store;
- (id)_trainWithRecipe:(id)a3 chunkData:(id)a4 args:(id)a5 error:(id *)a6;
- (id)lastTrainingFeaturizationForModelName:(id)a3 andLocale:(id)a4;
- (id)planReceivedWithPayload:(id)a3 error:(id *)a4;
- (id)planReceivedWithRecipe:(id)a3 attachments:(id)a4 error:(id *)a5;
- (void)_deleteAllSavedRecordsFromFidesStoreSync;
- (void)_sendStatsToFidesForModel:(id)a3 sessionCount:(unint64_t)a4 positivesCount:(unint64_t)a5 negativesCount:(unint64_t)a6 support:(float)a7;
- (void)_sendStatsToFidesForMultiLabelModel:(id)a3 sessionCount:(unint64_t)a4 labeledStats:(id)a5;
- (void)addSessionWithCovariates:(id)a3 label:(int64_t)a4 sessionDescriptor:(id)a5 spotlightReference:(id)a6 isInternal:(BOOL)a7;
- (void)deleteSessionsWithBundleID:(id)a3;
- (void)deleteSessionsWithDomainIdentifiers:(id)a3 bundleID:(id)a4;
- (void)deleteSessionsWithIdentifiers:(id)a3 bundleID:(id)a4;
- (void)sendSessionStatsToFides;
- (void)trimDbWithDeferralBlock:(id)a3;
- (void)updateLastTrainingFeaturizationForModel:(id)a3 andData:(id)a4;
@end

@implementation PMLTraining

+ (id)sharedSingletonWithDirectory:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = (__CFString *)a3;
  uint64_t v4 = pthread_mutex_lock(&sharedSingletonWithDirectory__sharedInstanceInitLock);
  if (sharedSingletonWithDirectory__sharedInstance) {
    goto LABEL_6;
  }
  v5 = (void *)MEMORY[0x223C7E5C0](v4);
  v6 = PML_LogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_2212A0000, v6, OS_LOG_TYPE_INFO, "Instantiating PMLTraining singleton.", (uint8_t *)&v21, 2u);
  }

  v7 = [PMLTrainingStore alloc];
  v8 = [(__CFString *)v3 stringByAppendingPathComponent:@"training.db"];
  v9 = [(PMLTrainingStore *)v7 initWithPath:v8];

  uint64_t v10 = [objc_alloc(MEMORY[0x263F3A470]) initWithBundleIdentifier:@"com.apple.proactive.PMLDESPlugin"];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = objc_opt_new();
    v13 = [[PMLTraining alloc] initWithStore:v9 fidesStore:v11 availableSessionsTracker:v12];
    v14 = (void *)sharedSingletonWithDirectory__sharedInstance;
    sharedSingletonWithDirectory__sharedInstance = (uint64_t)v13;

    uint64_t v15 = [(__CFString *)v3 copy];
    v16 = (void *)sharedSingletonWithDirectory__sharedInstanceDirectory;
    sharedSingletonWithDirectory__sharedInstanceDirectory = v15;

LABEL_6:
    if (sharedSingletonWithDirectory__sharedInstanceDirectory
      && (-[__CFString isEqualToString:](v3, "isEqualToString:") & 1) == 0)
    {
      v17 = PML_LogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412546;
        v22 = v3;
        __int16 v23 = 2112;
        uint64_t v24 = sharedSingletonWithDirectory__sharedInstanceDirectory;
        _os_log_impl(&dword_2212A0000, v17, OS_LOG_TYPE_DEFAULT, "Can't instantiate PMLTraining in %@, becacuse there is already an instance in %@.", (uint8_t *)&v21, 0x16u);
      }
    }
    pthread_mutex_unlock(&sharedSingletonWithDirectory__sharedInstanceInitLock);
    id v18 = (id)sharedSingletonWithDirectory__sharedInstance;
    goto LABEL_12;
  }
  v20 = PML_LogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    int v21 = 138412290;
    v22 = @"com.apple.proactive.PMLDESPlugin";
    _os_log_fault_impl(&dword_2212A0000, v20, OS_LOG_TYPE_FAULT, "PMLTraining failed to get a DESRecordStore for %@", (uint8_t *)&v21, 0xCu);
  }

  pthread_mutex_unlock(&sharedSingletonWithDirectory__sharedInstanceInitLock);
  id v18 = 0;
LABEL_12:

  return v18;
}

- (void)deleteSessionsWithIdentifiers:(id)a3 bundleID:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [(PMLTrainingStore *)self->_store deleteSessionsWithBundleId:v7 itemId:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)deleteSessionsWithBundleID:(id)a3
{
}

- (void)deleteSessionsWithDomainIdentifiers:(id)a3 bundleID:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [(PMLTrainingStore *)self->_store deleteSessionsWithBundleId:v7 domainId:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_isMultiLabel, 0);
  objc_storeStrong((id *)&self->_availableSessionsTracker, 0);
  objc_storeStrong((id *)&self->_fidesStore, 0);
}

- (PMLTrainingStore)store
{
  return self->_store;
}

- (id)planReceivedWithRecipe:(id)a3 attachments:(id)a4 error:(id *)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"isEspressoTraining"];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ([v10 BOOLValue] & 1) == 0)
  {
    v27 = PML_LogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_2212A0000, v27, OS_LOG_TYPE_FAULT, "Unable to train with Espresso because recipe flag IS_ESPRESSO_TRAINING is not set", buf, 2u);
    }

    if (a5)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"ProactiveMLErrorDomain" code:4 userInfo:0];
      v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    goto LABEL_36;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v11 = v9;
  long long v12 = (void *)[v11 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (!v12)
  {

    long long v14 = 0;
    goto LABEL_28;
  }
  v35 = self;
  v36 = a5;
  v37 = v10;
  id v38 = v9;
  id v39 = v8;
  long long v13 = 0;
  long long v14 = 0;
  uint64_t v15 = *(void *)v41;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v41 != v15) {
        objc_enumerationMutation(v11);
      }
      uint64_t v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      id v18 = [v17 pathExtension];
      if ([v18 isEqualToString:@"chunk"])
      {
        v19 = v13;
        long long v13 = v17;
        v20 = v14;
      }
      else if ([v18 isEqualToString:@"bin"])
      {
        v19 = v14;
        v20 = v17;
      }
      else
      {
        v19 = v14;
        v20 = v17;
        if (![v18 isEqualToString:@"net"]) {
          goto LABEL_15;
        }
      }
      id v21 = v17;

      long long v14 = v20;
LABEL_15:
    }
    long long v12 = (void *)[v11 countByEnumeratingWithState:&v40 objects:v54 count:16];
  }
  while (v12);

  long long v12 = v13;
  if (v13)
  {
    id v9 = v38;
    id v8 = v39;
    a5 = v36;
    uint64_t v10 = v37;
    if (v14)
    {
      v22 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v12];
      if ([v22 length])
      {
        __int16 v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F3A458], "pluginShouldAddNoiseAndEncryptResult:", v39));
        store = v35->_store;
        v44[0] = @"TRAINING_STORE";
        v44[1] = @"PML_ESPRESSO_TRAINING_NETWORK_PATH";
        v45[0] = store;
        v45[1] = v14;
        v44[2] = @"PLUGIN_SHOULD_ADD_NOISE_AND_ENCRYPT_RESULT";
        v45[2] = v23;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
        v26 = [(PMLTraining *)v35 _trainWithRecipe:v39 chunkData:v22 args:v25 error:v36];

        goto LABEL_33;
      }
      v33 = PML_LogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_2212A0000, v33, OS_LOG_TYPE_FAULT, "Unable to train because chunk file contents were empty", buf, 2u);
      }

      if (v36)
      {
        v30 = (void *)MEMORY[0x263F087E8];
        v31 = 0;
LABEL_32:
        [v30 errorWithDomain:@"ProactiveMLErrorDomain" code:4 userInfo:v31];
        v26 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
LABEL_33:

      goto LABEL_35;
    }
  }
  else
  {
    id v9 = v38;
    id v8 = v39;
    a5 = v36;
    uint64_t v10 = v37;
  }
LABEL_28:
  v28 = PML_LogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    uint64_t v34 = [v11 count];
    *(_DWORD *)buf = 138412802;
    v49 = v12;
    __int16 v50 = 2112;
    v51 = v14;
    __int16 v52 = 2048;
    uint64_t v53 = v34;
    _os_log_fault_impl(&dword_2212A0000, v28, OS_LOG_TYPE_FAULT, "Unable to train because chunk path %@ or training network path %@ not found in %lu attachments", buf, 0x20u);
  }

  if (a5)
  {
    v29 = (void *)MEMORY[0x263F087E8];
    v46 = @"attachments";
    id v47 = v11;
    v22 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v30 = v29;
    v31 = v22;
    goto LABEL_32;
  }
  v26 = 0;
LABEL_35:

LABEL_36:
  return v26;
}

- (id)planReceivedWithPayload:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  store = self->_store;
  long long v12 = @"TRAINING_STORE";
  v13[0] = store;
  id v7 = NSDictionary;
  id v8 = a3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v10 = [(PMLTraining *)self _trainWithRecipe:MEMORY[0x263EFFA78] chunkData:v8 args:v9 error:a4];

  return v10;
}

- (id)_trainWithRecipe:(id)a3 chunkData:(id)a4 args:(id)a5 error:(id *)a6
{
  v37[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = +[PMLPlanSerialization planFromData:v11 withArgs:v12];
  if (v13)
  {
    if ([(PMLTrainingStore *)self->_store isDbOpen])
    {
      long long v14 = PML_LogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138412290;
        v31 = v13;
        _os_log_impl(&dword_2212A0000, v14, OS_LOG_TYPE_DEFAULT, "Running %@ synchronously", (uint8_t *)&v30, 0xCu);
      }

      a6 = [v13 runWithError:a6];
      uint64_t v15 = PML_LogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v13 planId];
        int v30 = 138412546;
        v31 = v16;
        __int16 v32 = 1024;
        BOOL v33 = a6 != 0;
        _os_log_impl(&dword_2212A0000, v15, OS_LOG_TYPE_DEFAULT, "Plan %@ completed run. Result present? %d.", (uint8_t *)&v30, 0x12u);
      }
    }
    else
    {
      [(PMLTrainingStore *)self->_store logDbNotOpenEvent];
      __int16 v23 = PML_LogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138412290;
        v31 = v13;
        _os_log_impl(&dword_2212A0000, v23, OS_LOG_TYPE_DEFAULT, "Ignoring synchronous plan %@ because the db is not open.", (uint8_t *)&v30, 0xCu);
      }

      if (a6)
      {
        uint64_t v24 = (void *)MEMORY[0x263F087E8];
        uint64_t v34 = @"isEspressoTraining";
        uint64_t v25 = objc_msgSend(v10, "objectForKeyedSubscript:");
        v26 = (void *)v25;
        uint64_t v27 = MEMORY[0x263EFFA80];
        if (v25) {
          uint64_t v27 = v25;
        }
        uint64_t v35 = v27;
        v28 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        *a6 = [v24 errorWithDomain:@"ProactiveMLErrorDomain" code:5 userInfo:v28];

        a6 = 0;
      }
    }
  }
  else
  {
    uint64_t v17 = PML_LogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v30) = 0;
      _os_log_fault_impl(&dword_2212A0000, v17, OS_LOG_TYPE_FAULT, "Training plan deserialized without exception but is nil", (uint8_t *)&v30, 2u);
    }

    if (a6)
    {
      id v18 = (void *)MEMORY[0x263F087E8];
      v36 = @"isEspressoTraining";
      uint64_t v19 = objc_msgSend(v10, "objectForKeyedSubscript:");
      v20 = (void *)v19;
      uint64_t v21 = MEMORY[0x263EFFA80];
      if (v19) {
        uint64_t v21 = v19;
      }
      v37[0] = v21;
      v22 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
      *a6 = [v18 errorWithDomain:@"ProactiveMLErrorDomain" code:4 userInfo:v22];

      a6 = 0;
    }
    long long v13 = 0;
  }

  return a6;
}

- (void)trimDbWithDeferralBlock:(id)a3
{
  uint64_t v4 = (uint64_t (**)(void))a3;
  BOOL v5 = [(PMLTrainingStore *)self->_store isDbOpen];
  id v6 = PML_LogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      long long v13 = "Won't trim training db because the db is not open.";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2212A0000, v6, OS_LOG_TYPE_DEFAULT, "Trimming training db.", buf, 2u);
  }

  [(PMLTrainingStore *)self->_store limitSessionsByLastUsedTTL:15552000.0];
  id v8 = PML_LogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2212A0000, v8, OS_LOG_TYPE_DEFAULT, "DONE limitSessionsByLastUsedTTL", buf, 2u);
  }

  if (v4[2](v4)) {
    goto LABEL_14;
  }
  [(PMLTrainingStore *)self->_store limitSessionsByMaxTimesAccessed];
  id v9 = PML_LogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2212A0000, v9, OS_LOG_TYPE_DEFAULT, "DONE limitSessionsByMaxTimesAccessed", buf, 2u);
  }

  if (v4[2](v4)) {
    goto LABEL_14;
  }
  *(void *)buf = 0;
  id v18 = buf;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  store = self->_store;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__PMLTraining_trimDbWithDeferralBlock___block_invoke;
  v14[3] = &unk_26459F5B0;
  v14[4] = self;
  id v11 = v4;
  id v15 = v11;
  v16 = buf;
  [(PMLTrainingStore *)store enumerateSessionDescriptorsUsingBlock:v14];
  LODWORD(store) = v18[24];

  _Block_object_dispose(buf, 8);
  if (store) {
    goto LABEL_14;
  }
  id v12 = PML_LogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2212A0000, v12, OS_LOG_TYPE_DEFAULT, "Vacuuming training db.", buf, 2u);
  }

  [(PMLTrainingStore *)self->_store vacuumDbWithDeferralBlock:v11];
  if (v4[2](v11))
  {
LABEL_14:
    id v6 = PML_LogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v13 = "We've been asked to defer. Skipping remaining work.";
LABEL_18:
      _os_log_impl(&dword_2212A0000, v6, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
LABEL_20:
}

void __39__PMLTraining_trimDbWithDeferralBlock___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = PML_LogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_debug_impl(&dword_2212A0000, v6, OS_LOG_TYPE_DEBUG, "Removing training samples for %@", (uint8_t *)&v12, 0xCu);
  }

  BOOL v7 = [v5 name];
  int v8 = [v7 isEqualToString:@"QuickResponsesClassification"];

  id v9 = *(void **)(a1[4] + 32);
  if (v8)
  {
    [v9 limitSessionsWithSessionDescriptor:v5 withLabel:0 limit:1000];
    id v10 = PML_LogHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v12 = 138412290;
    id v13 = v5;
    id v11 = "DONE limitSessionsWithSessionDescriptor:(%@) withLabel:nil";
  }
  else
  {
    [v9 limitSessionsForEachLabelWithSessionDescriptor:v5 totalSessionLimit:1000];
    id v10 = PML_LogHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v12 = 138412290;
    id v13 = v5;
    id v11 = "DONE limitSessionsForEachLabelWithSessionDescriptor:(%@)";
  }
  _os_log_impl(&dword_2212A0000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0xCu);
LABEL_9:

  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)updateLastTrainingFeaturizationForModel:(id)a3 andData:(id)a4
{
}

- (id)lastTrainingFeaturizationForModelName:(id)a3 andLocale:(id)a4
{
  return [(PMLTrainingStore *)self->_store lastTrainingFeaturizationForModelName:a3 andLocale:a4];
}

- (void)_deleteAllSavedRecordsFromFidesStoreSync
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  fidesStore = self->_fidesStore;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__PMLTraining__deleteAllSavedRecordsFromFidesStoreSync__block_invoke;
  v6[3] = &unk_26459F588;
  dispatch_semaphore_t v7 = v3;
  id v5 = v3;
  [(DESRecordStore *)fidesStore deleteAllSavedRecordsWithCompletion:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __55__PMLTraining__deleteAllSavedRecordsFromFidesStoreSync__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PML_LogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_error_impl(&dword_2212A0000, v4, OS_LOG_TYPE_ERROR, "Failed to delete existing records in DESRecordStore. Error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_sendStatsToFidesForMultiLabelModel:(id)a3 sessionCount:(unint64_t)a4 labeledStats:(id)a5
{
  v21[5] = *MEMORY[0x263EF8340];
  v20[0] = @"modelName";
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 name];
  v21[0] = v10;
  v20[1] = @"modelVersion";
  id v11 = [v9 version];
  v21[1] = v11;
  v20[2] = @"modelLocale";
  int v12 = [v9 locale];

  v21[2] = v12;
  v20[3] = @"sessionsCount";
  id v13 = [NSNumber numberWithUnsignedInteger:a4];
  v20[4] = @"labeledStats";
  v21[3] = v13;
  v21[4] = v8;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];

  fidesStore = self->_fidesStore;
  v16 = objc_opt_new();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__PMLTraining__sendStatsToFidesForMultiLabelModel_sessionCount_labeledStats___block_invoke;
  v18[3] = &unk_26459F560;
  id v19 = v14;
  id v17 = v14;
  [(DESRecordStore *)fidesStore saveRecordWithData:v16 recordInfo:v17 completion:v18];
}

void __77__PMLTraining__sendStatsToFidesForMultiLabelModel_sessionCount_labeledStats___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = PML_LogHandle();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl(&dword_2212A0000, v6, OS_LOG_TYPE_ERROR, "Failed to send session stats %@ to Fides. Error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_debug_impl(&dword_2212A0000, v6, OS_LOG_TYPE_DEBUG, "Successfully sent stats %@ to Fides.", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_sendStatsToFidesForModel:(id)a3 sessionCount:(unint64_t)a4 positivesCount:(unint64_t)a5 negativesCount:(unint64_t)a6 support:(float)a7
{
  v28[7] = *MEMORY[0x263EF8340];
  v27[0] = @"modelName";
  id v12 = a3;
  uint64_t v13 = [v12 name];
  v28[0] = v13;
  v27[1] = @"modelVersion";
  uint64_t v14 = [v12 version];
  v28[1] = v14;
  v27[2] = @"modelLocale";
  id v15 = [v12 locale];

  v28[2] = v15;
  v27[3] = @"sessionsCount";
  v16 = [NSNumber numberWithUnsignedInteger:a4];
  v28[3] = v16;
  v27[4] = @"positivesCount";
  id v17 = [NSNumber numberWithUnsignedInteger:a5];
  v28[4] = v17;
  v27[5] = @"negativesCount";
  id v18 = [NSNumber numberWithUnsignedInteger:a6];
  v28[5] = v18;
  v27[6] = @"support";
  *(float *)&double v19 = a7;
  char v20 = [NSNumber numberWithFloat:v19];
  v28[6] = v20;
  uint64_t v21 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:7];

  fidesStore = self->_fidesStore;
  __int16 v23 = objc_opt_new();
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __92__PMLTraining__sendStatsToFidesForModel_sessionCount_positivesCount_negativesCount_support___block_invoke;
  v25[3] = &unk_26459F560;
  id v26 = v21;
  id v24 = v21;
  [(DESRecordStore *)fidesStore saveRecordWithData:v23 recordInfo:v24 completion:v25];
}

void __92__PMLTraining__sendStatsToFidesForModel_sessionCount_positivesCount_negativesCount_support___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = PML_LogHandle();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl(&dword_2212A0000, v6, OS_LOG_TYPE_ERROR, "Failed to send session stats %@ to Fides. Error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_debug_impl(&dword_2212A0000, v6, OS_LOG_TYPE_DEBUG, "Successfully sent stats %@ to Fides.", (uint8_t *)&v9, 0xCu);
  }
}

- (void)sendSessionStatsToFides
{
  if ([(PMLTrainingStore *)self->_store isDbOpen])
  {
    [(PMLTraining *)self _deleteAllSavedRecordsFromFidesStoreSync];
    id v3 = [(PMLTrainingStore *)self->_store sessionStats];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __38__PMLTraining_sendSessionStatsToFides__block_invoke;
    v4[3] = &unk_26459F538;
    v4[4] = self;
    [v3 enumerateKeysAndObjectsUsingBlock:v4];
  }
}

void __38__PMLTraining_sendSessionStatsToFides__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = [*(id *)(*((void *)&v52 + 1) + 8 * i) second];
        v9 += [v12 unsignedIntegerValue];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }
  uint64_t v44 = a1;
  v45 = v6;
  if ([*(id *)(a1 + 32) isMultiLabelModel:v5])
  {
    id v43 = v5;
    id v47 = objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obuint64_t j = v6;
    uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          id v18 = [v17 first];
          uint64_t v19 = [v18 unsignedIntegerValue];

          if (v19)
          {
            char v20 = [v17 second];
            [v20 floatValue];
            float v22 = v21 / (float)v9;

            __int16 v23 = [v17 second];
            uint64_t v24 = [v23 unsignedIntegerValue];

            v56[0] = @"positivesCount";
            uint64_t v25 = [NSNumber numberWithUnsignedInteger:v24];
            v56[1] = @"support";
            v57[0] = v25;
            *(float *)&double v26 = v22;
            uint64_t v27 = [NSNumber numberWithFloat:v26];
            v57[1] = v27;
            v28 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
            id v29 = [NSString alloc];
            int v30 = [v17 first];
            v31 = objc_msgSend(v29, "initWithFormat:", @"label%tu", objc_msgSend(v30, "unsignedLongValue"));
            [v47 setObject:v28 forKey:v31];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v14);
    }

    id v5 = v43;
    [*(id *)(v44 + 32) _sendStatsToFidesForMultiLabelModel:v43 sessionCount:v9 labeledStats:v47];
  }
  else
  {
    id v32 = v6;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      unint64_t v35 = 0;
      uint64_t v36 = *(void *)v53;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v53 != v36) {
            objc_enumerationMutation(v32);
          }
          id v38 = *(void **)(*((void *)&v52 + 1) + 8 * k);
          id v39 = [v38 first];
          uint64_t v40 = [v39 integerValue];

          if (v40 >= 1)
          {
            long long v41 = [v38 second];
            v35 += [v41 unsignedIntegerValue];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v52 objects:v59 count:16];
      }
      while (v34);
    }
    else
    {
      unint64_t v35 = 0;
    }

    *(float *)&double v42 = (float)v35 / (float)v9;
    [*(id *)(v44 + 32) _sendStatsToFidesForModel:v5 sessionCount:v9 positivesCount:v35 negativesCount:v9 - v35 support:v42];
  }
}

- (BOOL)isMultiLabelModel:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  isMultiLabel = self->_isMultiLabel;
  id v6 = [v4 name];
  uint64_t v7 = [(NSDictionary *)isMultiLabel objectForKeyedSubscript:v6];

  if (v7)
  {
    char v8 = [v7 BOOLValue];
  }
  else
  {
    unint64_t v9 = PML_LogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      __int16 v11 = [v4 name];
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_fault_impl(&dword_2212A0000, v9, OS_LOG_TYPE_FAULT, "No isMultiLabel information for %@", (uint8_t *)&v12, 0xCu);
    }
    char v8 = 0;
  }

  return v8;
}

- (void)addSessionWithCovariates:(id)a3 label:(int64_t)a4 sessionDescriptor:(id)a5 spotlightReference:(id)a6 isInternal:(BOOL)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = PML_LogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v13;
    __int16 v23 = 2048;
    int64_t v24 = a4;
    __int16 v25 = 2048;
    uint64_t v26 = [v12 length];
    _os_log_debug_impl(&dword_2212A0000, v15, OS_LOG_TYPE_DEBUG, "Adding session for %@ (label: %tu, length: %tu)", buf, 0x20u);
  }

  store = self->_store;
  id v17 = [v14 bundleIdentifier];
  id v18 = [v14 domainIdentifier];
  uint64_t v19 = [v14 itemIdentifiers];

  LOBYTE(v20) = a7;
  [(PMLTrainingStore *)store storeSession:v12 label:a4 model:v13 bundleId:v17 domainId:v18 itemIds:v19 isAppleInternal:v20];
}

- (PMLTraining)initWithStore:(id)a3 fidesStore:(id)a4 availableSessionsTracker:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PMLTraining;
  id v12 = [(PMLTraining *)&v16 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_fidesStore, a4);
    objc_storeStrong((id *)&v13->_availableSessionsTracker, a5);
    [(PMLAWDAvailableSessionsTracker *)v13->_availableSessionsTracker setAWDMetricQueryDelegate:v13];
    isMultiLabel = v13->_isMultiLabel;
    v13->_isMultiLabel = (NSDictionary *)&unk_26D336890;
  }
  return v13;
}

@end