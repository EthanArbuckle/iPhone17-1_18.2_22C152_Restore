@interface SSRRPISampler
+ (id)sharedInstance;
+ (void)deleteAllRPISampledData;
- (SSRRPISampler)init;
- (void)_handleVoiceProfileRPICleanupEvent;
- (void)getAudioIdWithRequestId:(id)a3 languageCode:(id)a4 date:(id)a5 completion:(id)a6;
- (void)getEnrollmentSelectionStatusWithLocale:(id)a3 completion:(id)a4;
- (void)markFinishStatusForAllWithCompletion:(id)a3;
- (void)removeAllSamplingMetaDataWithCompletion:(id)a3;
- (void)removeMappingOnAndBefore:(id)a3 completion:(id)a4;
- (void)removeMappingWithLocale:(id)a3 date:(id)a4 completion:(id)a5;
- (void)removeRequestIdToAudioIdMappingWithCompletion:(id)a3;
- (void)updateStatus:(id)a3 languageCode:(id)a4 completion:(id)a5;
- (void)writeIntoMappingWithRequestId:(id)a3 audioId:(id)a4 date:(id)a5 locale:(id)a6 completion:(id)a7;
@end

@implementation SSRRPISampler

- (void).cxx_destruct
{
}

- (void)_handleVoiceProfileRPICleanupEvent
{
}

void __51__SSRRPISampler__handleVoiceProfileRPICleanupEvent__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SSRRPISampler _handleVoiceProfileRPICleanupEvent]_block_invoke";
    _os_log_impl(&dword_21C8A5000, v0, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v1, 0xCu);
  }
}

- (void)removeMappingOnAndBefore:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__SSRRPISampler_removeMappingOnAndBefore_completion___block_invoke;
  v11[3] = &unk_26442A298;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

uint64_t __53__SSRRPISampler_removeMappingOnAndBefore_completion___block_invoke(uint64_t a1)
{
  return +[SSRRequestIdToAudioIdMappingHelper removeMappingOnAndBefore:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)markFinishStatusForAllWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SSRRPISampler_markFinishStatusForAllWithCompletion___block_invoke;
  block[3] = &unk_264428FC0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __54__SSRRPISampler_markFinishStatusForAllWithCompletion___block_invoke(uint64_t a1)
{
  return +[SSREnrollmentSamplingMetaDataHelper markFinishStatusForAllWithCompletion:*(void *)(a1 + 32)];
}

- (void)removeAllSamplingMetaDataWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SSRRPISampler_removeAllSamplingMetaDataWithCompletion___block_invoke;
  block[3] = &unk_264428FC0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __57__SSRRPISampler_removeAllSamplingMetaDataWithCompletion___block_invoke(uint64_t a1)
{
  +[SSREnrollmentSamplingMetaDataHelper removeAllSamplingMetaData];
  +[SSRRPISampler deleteAllRPISampledData];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeRequestIdToAudioIdMappingWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SSRRPISampler_removeRequestIdToAudioIdMappingWithCompletion___block_invoke;
  block[3] = &unk_264428FC0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __63__SSRRPISampler_removeRequestIdToAudioIdMappingWithCompletion___block_invoke(uint64_t a1)
{
  +[SSRRequestIdToAudioIdMappingHelper removeMapping];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeMappingWithLocale:(id)a3 date:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SSRRPISampler_removeMappingWithLocale_date_completion___block_invoke;
  block[3] = &unk_26442A188;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, block);
}

uint64_t __57__SSRRPISampler_removeMappingWithLocale_date_completion___block_invoke(void *a1)
{
  return +[SSRRequestIdToAudioIdMappingHelper removeMappingWithLocale:a1[4] date:a1[5] completion:a1[6]];
}

- (void)writeIntoMappingWithRequestId:(id)a3 audioId:(id)a4 date:(id)a5 locale:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__SSRRPISampler_writeIntoMappingWithRequestId_audioId_date_locale_completion___block_invoke;
  block[3] = &unk_26442A3B8;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(queue, block);
}

uint64_t __78__SSRRPISampler_writeIntoMappingWithRequestId_audioId_date_locale_completion___block_invoke(void *a1)
{
  return +[SSRRequestIdToAudioIdMappingHelper writeIntoMappingWithRequestId:a1[4] audioId:a1[5] date:a1[6] locale:a1[7] completion:a1[8]];
}

- (void)getAudioIdWithRequestId:(id)a3 languageCode:(id)a4 date:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__SSRRPISampler_getAudioIdWithRequestId_languageCode_date_completion___block_invoke;
  v19[3] = &unk_26442A488;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, v19);
}

void __70__SSRRPISampler_getAudioIdWithRequestId_languageCode_date_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = 0;
  v5 = +[SSRRequestIdToAudioIdMappingHelper getAudioIdWithRequestId:v2 languageCode:v3 date:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = a1[7];
  if (v7) {
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v6, v5);
  }
}

- (void)updateStatus:(id)a3 languageCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SSRRPISampler_updateStatus_languageCode_completion___block_invoke;
  block[3] = &unk_26442A188;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, block);
}

uint64_t __54__SSRRPISampler_updateStatus_languageCode_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) unsignedIntegerValue];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return +[SSREnrollmentSamplingMetaDataHelper updateSelectionStatus:v2 languageCode:v3 completion:v4];
}

- (void)getEnrollmentSelectionStatusWithLocale:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__SSRRPISampler_getEnrollmentSelectionStatusWithLocale_completion___block_invoke;
  v11[3] = &unk_26442A298;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

void __67__SSRRPISampler_getEnrollmentSelectionStatusWithLocale_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v7 = 0;
  unint64_t v3 = +[SSREnrollmentSamplingMetaDataHelper getEnrollmentSelectionStatusWithLocale:v2 error:&v7];
  id v4 = v7;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = [NSNumber numberWithUnsignedInteger:v3];
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v4, v6);
  }
}

- (SSRRPISampler)init
{
  v7.receiver = self;
  v7.super_class = (Class)SSRRPISampler;
  uint64_t v2 = [(SSRRPISampler *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("ssr.rpi.sampling Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263F087C8] defaultCenter];
    [v5 addObserver:v2 selector:sel__handleVoiceProfileRPICleanupEvent name:@"com.apple.voiceprofile.rpicleanup" object:0];
  }
  return v2;
}

+ (void)deleteAllRPISampledData
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = "+[SSRRPISampler deleteAllRPISampledData]";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  uint64_t v3 = 0;
  +[SSRRPISampledAudioUploader removeAllAudioDataWithError:&v3];
  +[SSRRequestIdToAudioIdMappingHelper removeMapping];
  +[SSRRequestIdToAudioIdMappingHelper purgeAllEntriesInSpkeakerIdBiome];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __31__SSRRPISampler_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(SSRRPISampler);

  return MEMORY[0x270F9A758]();
}

@end