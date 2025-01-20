@interface TTSVBSiriTTSTrainerSession
- (OS_dispatch_queue)calloutQueue;
- (OS_dispatch_queue)siriTrainingQueue;
- (SiriTTSTrainerSession)session;
- (TTSVBSiriTTSTrainerSession)init;
- (id)_replyQueue:(id)a3;
- (id)getAllAvailableLocales;
- (id)installableTrainingAssetsForLocaleID:(id)a3;
- (id)installedTrainingAssetsForLocaleID:(id)a3;
- (void)cancelTask:(id)a3 replyOnQueue:(id)a4 completionHandler:(id)a5;
- (void)cancelTaskWithID:(id)a3 replyOnQueue:(id)a4 completionHandler:(id)a5;
- (void)discardTrainingTasksReplyOnQueue:(id)a3 completionHandler:(id)a4;
- (void)fetchTrainingScriptsWithLocaleID:(id)a3 scriptType:(id)a4 replyOnQueue:(id)a5 completion:(id)a6;
- (void)getAllTasksReplyOnQueue:(id)a3 statusHandler:(id)a4;
- (void)getTaskByID:(id)a3 replyOnQueue:(id)a4 statusHandler:(id)a5;
- (void)getTasksByIDs:(id)a3 replyOnQueue:(id)a4 statusHandler:(id)a5;
- (void)installAsset:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)setCalloutQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setSiriTrainingQueue:(id)a3;
- (void)startTraining:(id)a3 replyOnQueue:(id)a4 trainingStartedHandler:(id)a5;
- (void)uninstallAsset:(id)a3;
@end

@implementation TTSVBSiriTTSTrainerSession

- (TTSVBSiriTTSTrainerSession)init
{
  v11.receiver = self;
  v11.super_class = (Class)TTSVBSiriTTSTrainerSession;
  v2 = [(TTSVBSiriTTSTrainerSession *)&v11 init];
  if (v2)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v3 = (void *)getSiriTTSTrainerSessionClass_softClass;
    uint64_t v16 = getSiriTTSTrainerSessionClass_softClass;
    if (!getSiriTTSTrainerSessionClass_softClass)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __getSiriTTSTrainerSessionClass_block_invoke;
      v12[3] = &unk_265539178;
      v12[4] = &v13;
      __getSiriTTSTrainerSessionClass_block_invoke((uint64_t)v12);
      v3 = (void *)v14[3];
    }
    v4 = v3;
    _Block_object_dispose(&v13, 8);
    id v5 = objc_alloc_init(v4);
    [(TTSVBSiriTTSTrainerSession *)v2 setSession:v5];

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.voicebanking.SiriTraining", v7);
    [(TTSVBSiriTTSTrainerSession *)v2 setSiriTrainingQueue:v8];

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.voicebanking.trainersession.callout", v7);
    [(TTSVBSiriTTSTrainerSession *)v2 setCalloutQueue:v9];
  }
  return v2;
}

- (id)installableTrainingAssetsForLocaleID:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogTTSVBSiri();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v4;
    _os_log_impl(&dword_25F2F5000, v5, OS_LOG_TYPE_DEFAULT, "Will query SiriTTSTraining for installable assets language=%@ name=default", buf, 0xCu);
  }

  v6 = [(TTSVBSiriTTSTrainerSession *)self session];
  v7 = [v6 installableTrainingAssetsForLanguage:v4 name:@"default" type:1];

  dispatch_queue_t v8 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [TTSVBSiriTTSTrainingAsset alloc];
        uint64_t v16 = -[TTSVBSiriTTSTrainingAsset initWithSiriTTSTrainingAsset:](v15, "initWithSiriTTSTrainingAsset:", v14, (void)v20);
        [v8 addObject:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  v17 = LogTTSVBSiri();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    *(_DWORD *)buf = 138412290;
    id v26 = v18;
    _os_log_impl(&dword_25F2F5000, v17, OS_LOG_TYPE_DEFAULT, "Did query SiriTTSTraining for installable assets. Got %@ results", buf, 0xCu);
  }

  return v8;
}

- (id)getAllAvailableLocales
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = LogTTSVBSiri();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_25F2F5000, v3, OS_LOG_TYPE_DEFAULT, "Will query SiriTTSTraining for available locales", (uint8_t *)&v8, 2u);
  }

  id v4 = [(TTSVBSiriTTSTrainerSession *)self session];
  id v5 = [v4 getAllAvailableLocales];

  v6 = LogTTSVBSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_25F2F5000, v6, OS_LOG_TYPE_DEFAULT, "Did query SiriTTSTraining for available locales %@", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

- (id)installedTrainingAssetsForLocaleID:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogTTSVBSiri();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v4;
    _os_log_impl(&dword_25F2F5000, v5, OS_LOG_TYPE_DEFAULT, "Will query SiriTTSTraining for installed assets language=%@ name=default", buf, 0xCu);
  }

  v6 = [(TTSVBSiriTTSTrainerSession *)self session];
  long long v23 = v4;
  v7 = [v6 installedTrainingAssetsForLanguage:v4 name:@"default" type:1];

  int v8 = LogTTSVBSiri();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    *(_DWORD *)buf = 138412290;
    id v30 = v9;
    _os_log_impl(&dword_25F2F5000, v8, OS_LOG_TYPE_DEFAULT, "Did query SiriTTSTraining for installed assets. Got %@ results", buf, 0xCu);
  }
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    id v24 = v11;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
        v17 = [[TTSVBSiriTTSTrainingAsset alloc] initWithSiriTTSTrainingAsset:v16];
        [v10 addObject:v17];
        v18 = LogTTSVBSiri();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = [v16 name];
          long long v20 = [v16 factor];
          long long v21 = [v16 path];
          *(_DWORD *)buf = 138412802;
          id v30 = v19;
          __int16 v31 = 2112;
          v32 = v20;
          __int16 v33 = 2112;
          v34 = v21;
          _os_log_debug_impl(&dword_25F2F5000, v18, OS_LOG_TYPE_DEBUG, "Installed training asset: %@ - %@ - %@", buf, 0x20u);

          id v11 = v24;
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v13);
  }

  return v10;
}

- (void)installAsset:(id)a3 progress:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a3 asset];
  id v11 = LogTTSVBSiri();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 name];
    *(_DWORD *)buf = 138412290;
    long long v21 = v12;
    _os_log_impl(&dword_25F2F5000, v11, OS_LOG_TYPE_DEFAULT, "About to request install of siri training asset=%@", buf, 0xCu);
  }
  uint64_t v13 = [(TTSVBSiriTTSTrainerSession *)self session];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke;
  v18[3] = &unk_2655392A8;
  id v19 = v8;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_9;
  v16[3] = &unk_2655392D0;
  id v17 = v9;
  id v14 = v9;
  id v15 = v8;
  [v13 installTrainingAsset:v10 progress:v18 completion:v16];
}

uint64_t __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke(uint64_t a1, float a2)
{
  id v4 = LogTTSVBSiri();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_cold_1(v4, a2);
  }

  return (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16))(a2);
}

void __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogTTSVBSiri();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_9_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)uninstallAsset:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogTTSVBSiri();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 name];
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_25F2F5000, v5, OS_LOG_TYPE_DEFAULT, "About to request uninstall of siri training asset=%@", (uint8_t *)&v9, 0xCu);
  }
  v7 = [(TTSVBSiriTTSTrainerSession *)self session];
  id v8 = [v4 asset];
  [v7 uninstallTrainingAsset:v8];
}

- (void)fetchTrainingScriptsWithLocaleID:(id)a3 scriptType:(id)a4 replyOnQueue:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = LogTTSVBSiri();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_25F2F5000, v14, OS_LOG_TYPE_DEFAULT, "About to fetch training script data with locale: '%@' and script type: '%@'", buf, 0x16u);
  }

  id v15 = [(TTSVBSiriTTSTrainerSession *)self session];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __98__TTSVBSiriTTSTrainerSession_fetchTrainingScriptsWithLocaleID_scriptType_replyOnQueue_completion___block_invoke;
  v19[3] = &unk_265539320;
  id v20 = v10;
  long long v21 = self;
  id v22 = v12;
  id v23 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  [v15 getRecordingMetadata:v18 name:v11 reply:v19];
}

void __98__TTSVBSiriTTSTrainerSession_fetchTrainingScriptsWithLocaleID_scriptType_replyOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = LogTTSVBSiri();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_25F2F5000, v7, OS_LOG_TYPE_DEFAULT, "Did fetch training script data with locale: %@. Path=%@ Error=%@", buf, 0x20u);
  }

  int v9 = [*(id *)(a1 + 40) _replyQueue:*(void *)(a1 + 48)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__TTSVBSiriTTSTrainerSession_fetchTrainingScriptsWithLocaleID_scriptType_replyOnQueue_completion___block_invoke_11;
  block[3] = &unk_2655392F8;
  id v10 = *(id *)(a1 + 56);
  id v15 = v5;
  id v16 = v10;
  id v14 = v6;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(v9, block);
}

uint64_t __98__TTSVBSiriTTSTrainerSession_fetchTrainingScriptsWithLocaleID_scriptType_replyOnQueue_completion___block_invoke_11(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)startTraining:(id)a3 replyOnQueue:(id)a4 trainingStartedHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TTSVBSiriTTSTrainerSession *)self siriTrainingQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke;
  v15[3] = &unk_265539398;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke(id *a1)
{
  v2 = [a1[4] session];
  id v3 = [a1[5] task];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke_2;
  v4[3] = &unk_265539370;
  v4[4] = a1[4];
  id v5 = a1[6];
  id v6 = a1[7];
  [v2 startRequest:v3 completion:v4];
}

void __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) _replyQueue:*(void *)(a1 + 40)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke_3;
  block[3] = &unk_265539348;
  id v12 = v6;
  id v8 = *(id *)(a1 + 48);
  id v13 = v5;
  id v14 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke_3(uint64_t a1)
{
  v2 = [[TTSVBSiriTTSTrainerTask alloc] initWithSiriTTSTrainerTask:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getTaskByID:(id)a3 replyOnQueue:(id)a4 statusHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TTSVBSiriTTSTrainerSession *)self siriTrainingQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke;
  v15[3] = &unk_265539398;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = LogTTSVBSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_25F2F5000, v2, OS_LOG_TYPE_INFO, "About to call getTaskById task=%@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) session];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke_16;
  v7[3] = &unk_265539370;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v6;
  id v9 = *(id *)(a1 + 56);
  [v4 getTaskById:v5 completion:v7];
}

void __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) _replyQueue:*(void *)(a1 + 40)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke_2;
  block[3] = &unk_265539348;
  id v12 = v6;
  id v8 = *(id *)(a1 + 48);
  id v13 = v5;
  id v14 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = [[TTSVBSiriTTSTrainerTask alloc] initWithSiriTTSTrainerTask:*(void *)(a1 + 32)];
  uint64_t v3 = LogTTSVBSiri();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_25F2F5000, v3, OS_LOG_TYPE_INFO, "getTaskById did finish. calling completion handler. task=%@", (uint8_t *)&v4, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getTasksByIDs:(id)a3 replyOnQueue:(id)a4 statusHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v24 = a4;
  id v23 = a5;
  id v9 = [MEMORY[0x263EFF980] array];
  id v10 = [MEMORY[0x263EFF980] array];
  uint64_t v11 = LogTTSVBSiri();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v8 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412290;
    v40 = v12;
    _os_log_impl(&dword_25F2F5000, v11, OS_LOG_TYPE_INFO, "Will request tasks for IDs %@", buf, 0xCu);
  }
  id v13 = dispatch_group_create();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * v17);
        dispatch_group_enter(v13);
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __71__TTSVBSiriTTSTrainerSession_getTasksByIDs_replyOnQueue_statusHandler___block_invoke;
        v30[3] = &unk_2655393C0;
        id v31 = v9;
        id v32 = v10;
        __int16 v33 = v13;
        [(TTSVBSiriTTSTrainerSession *)self getTaskByID:v18 replyOnQueue:0 statusHandler:v30];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v15);
  }

  id v19 = [(TTSVBSiriTTSTrainerSession *)self _replyQueue:v24];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__TTSVBSiriTTSTrainerSession_getTasksByIDs_replyOnQueue_statusHandler___block_invoke_2;
  block[3] = &unk_2655393E8;
  id v27 = v9;
  id v28 = v10;
  id v29 = v23;
  id v20 = v23;
  id v21 = v10;
  id v22 = v9;
  dispatch_group_notify(v13, v19, block);
}

void __71__TTSVBSiriTTSTrainerSession_getTasksByIDs_replyOnQueue_statusHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) addObject:a2];
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __71__TTSVBSiriTTSTrainerSession_getTasksByIDs_replyOnQueue_statusHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = LogTTSVBSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    int v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
    int v6 = 138412546;
    v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_25F2F5000, v2, OS_LOG_TYPE_INFO, "Finished requesting getTasksByIDs. Calling completion handler. tasks=%@ errors=%@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getAllTasksReplyOnQueue:(id)a3 statusHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(TTSVBSiriTTSTrainerSession *)self siriTrainingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke;
  block[3] = &unk_2655393E8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke(uint64_t a1)
{
  v2 = LogTTSVBSiri();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25F2F5000, v2, OS_LOG_TYPE_INFO, "About to call getAllTasks", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) session];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke_21;
  v5[3] = &unk_265539438;
  int v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 getAllTasks:v5];
}

void __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _replyQueue:*(void *)(a1 + 40)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke_2;
  v6[3] = &unk_265539410;
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        id v9 = [TTSVBSiriTTSTrainerTask alloc];
        id v10 = -[TTSVBSiriTTSTrainerTask initWithSiriTTSTrainerTask:](v9, "initWithSiriTTSTrainerTask:", v8, (void)v13);
        [v2 addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }

  uint64_t v11 = LogTTSVBSiri();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v12;
    _os_log_impl(&dword_25F2F5000, v11, OS_LOG_TYPE_INFO, "getAllTasks did finish. calling completion handler. tasks=%@", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)discardTrainingTasksReplyOnQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LogTTSVBSiri();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25F2F5000, v8, OS_LOG_TYPE_INFO, "About to call cleanUpTaskQueue", buf, 2u);
  }

  id v9 = [(TTSVBSiriTTSTrainerSession *)self session];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__TTSVBSiriTTSTrainerSession_discardTrainingTasksReplyOnQueue_completionHandler___block_invoke;
  v12[3] = &unk_265539488;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 cleanUpTaskQueue:v12];
}

void __81__TTSVBSiriTTSTrainerSession_discardTrainingTasksReplyOnQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogTTSVBSiri();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25F2F5000, v4, OS_LOG_TYPE_INFO, "cleanUpTaskQueue finished. calling completion handler", buf, 2u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) _replyQueue:*(void *)(a1 + 40)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__TTSVBSiriTTSTrainerSession_discardTrainingTasksReplyOnQueue_completionHandler___block_invoke_23;
  v8[3] = &unk_265539460;
  id v6 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __81__TTSVBSiriTTSTrainerSession_discardTrainingTasksReplyOnQueue_completionHandler___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)cancelTask:(id)a3 replyOnQueue:(id)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = LogTTSVBSiri();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v8 taskID];
    *(_DWORD *)buf = 138412290;
    id v24 = v12;
    _os_log_impl(&dword_25F2F5000, v11, OS_LOG_TYPE_INFO, "Will request cancel of training task: %@", buf, 0xCu);
  }
  id v13 = [(TTSVBSiriTTSTrainerSession *)self session];
  id v14 = [v8 task];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __72__TTSVBSiriTTSTrainerSession_cancelTask_replyOnQueue_completionHandler___block_invoke;
  v18[3] = &unk_2655394B0;
  id v19 = v8;
  uint64_t v20 = self;
  id v21 = v9;
  id v22 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v13 cancelTask:v14 reply:v18];
}

void __72__TTSVBSiriTTSTrainerSession_cancelTask_replyOnQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = LogTTSVBSiri();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [*(id *)(a1 + 32) taskID];
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_25F2F5000, v4, OS_LOG_TYPE_INFO, "cancelTask finished id=%@. calling completion handler", buf, 0xCu);
  }
  id v6 = [*(id *)(a1 + 40) _replyQueue:*(void *)(a1 + 48)];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__TTSVBSiriTTSTrainerSession_cancelTask_replyOnQueue_completionHandler___block_invoke_24;
  v9[3] = &unk_265539460;
  id v7 = *(id *)(a1 + 56);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

uint64_t __72__TTSVBSiriTTSTrainerSession_cancelTask_replyOnQueue_completionHandler___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)cancelTaskWithID:(id)a3 replyOnQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__TTSVBSiriTTSTrainerSession_cancelTaskWithID_replyOnQueue_completionHandler___block_invoke;
  v12[3] = &unk_2655394D8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(TTSVBSiriTTSTrainerSession *)self getTaskByID:a3 replyOnQueue:0 statusHandler:v12];
}

void __78__TTSVBSiriTTSTrainerSession_cancelTaskWithID_replyOnQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 _replyQueue:*(void *)(a1 + 40)];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __78__TTSVBSiriTTSTrainerSession_cancelTaskWithID_replyOnQueue_completionHandler___block_invoke_2;
    v8[3] = &unk_265539460;
    id v10 = *(id *)(a1 + 48);
    id v9 = v5;
    dispatch_async(v7, v8);
  }
  else
  {
    [v6 cancelTask:a2 replyOnQueue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

uint64_t __78__TTSVBSiriTTSTrainerSession_cancelTaskWithID_replyOnQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_replyQueue:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(TTSVBSiriTTSTrainerSession *)self calloutQueue];
  }
  id v7 = v6;

  return v7;
}

- (SiriTTSTrainerSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (OS_dispatch_queue)siriTrainingQueue
{
  return self->_siriTrainingQueue;
}

- (void)setSiriTrainingQueue:(id)a3
{
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setCalloutQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_siriTrainingQueue, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

void __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_cold_1(os_log_t log, float a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_25F2F5000, log, OS_LOG_TYPE_DEBUG, "Siri training asset install progress=%.2f", (uint8_t *)&v2, 0xCu);
}

void __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_9_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_25F2F5000, a2, OS_LOG_TYPE_DEBUG, "Siri training asset install finished. ErrorOrNil=%@", (uint8_t *)&v2, 0xCu);
}

@end