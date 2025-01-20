@interface TIResponseKitTrainerImpl
+ (id)sharedTrainer;
- (BOOL)moveLanguageModelBundlesFromTemporaryDirectory:(id)a3 toDestination:(id)a4 error:(id *)a5;
- (id)_init;
- (void)performTrainingForClient:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation TIResponseKitTrainerImpl

- (void)performTrainingForClient:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  TIDispatchAsync();
}

void __75__TIResponseKitTrainerImpl_performTrainingForClient_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = NSString;
  v3 = NSTemporaryDirectory();
  v4 = [v2 stringWithFormat:@"%@/%d", v3, arc4random()];

  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/ResponseKit"];
  uint64_t v32 = 0;
  v33 = (id *)&v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2680;
  v36 = __Block_byref_object_dispose__2681;
  id v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = v33;
  id obj = v33[5];
  char v9 = [v7 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&obj];
  objc_storeStrong(v8 + 5, obj);

  char v29 = v9;
  if (*((unsigned char *)v27 + 24))
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __75__TIResponseKitTrainerImpl_performTrainingForClient_withCompletionHandler___block_invoke_45;
    v21 = &unk_1E6E2E2A8;
    id v22 = *(id *)(a1 + 32);
    id v23 = v5;
    v24 = v30;
    TIDispatchSync();
    v10 = +[TILanguageModelOfflineLearningAgent sharedLearningAgent];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__TIResponseKitTrainerImpl_performTrainingForClient_withCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E6E2A000;
    v15 = v30;
    v16 = &v26;
    v11[4] = *(void *)(a1 + 40);
    id v12 = v23;
    id v13 = v6;
    v17 = &v32;
    id v14 = *(id *)(a1 + 48);
    [v10 performTaskInBackground:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);
}

void __75__TIResponseKitTrainerImpl_performTrainingForClient_withCompletionHandler___block_invoke_45(void *a1)
{
  v4 = [[TILanguageModelOfflineLearningStrategyResponseKit alloc] initWithClientIdentifier:a1[4] andDirectory:a1[5]];
  v2 = +[TILanguageModelOfflineLearningAgent sharedLearningAgent];
  [v2 performLearningIfNecessaryWithStrategy:v4 lastAdaptationTime:0.0];

  v3 = [(TILanguageModelOfflineLearningStrategyResponseKit *)v4 learningTask];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 isCancelled];
}

uint64_t __75__TIResponseKitTrainerImpl_performTrainingForClient_withCompletionHandler___block_invoke_2(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
  {
    v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v5 = *(void *)(a1[10] + 8);
    id obj = *(id *)(v5 + 40);
    char v6 = [v2 moveLanguageModelBundlesFromTemporaryDirectory:v3 toDestination:v4 error:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = v6;
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (BOOL)moveLanguageModelBundlesFromTemporaryDirectory:(id)a3 toDestination:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v38 = v7;
  char v9 = [v7 path];
  char v10 = [v8 fileExistsAtPath:v9];

  if ((v10 & 1) != 0
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:a5],
        v11,
        v12))
  {
    id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v14 = [v39 path];
    v15 = [v13 contentsOfDirectoryAtPath:v14 error:a5];

    if (v15)
    {
      v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"pathExtension='lm'"];
      v36 = v15;
      v17 = [v15 filteredArrayUsingPredicate:v16];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v41;
        id obj = v18;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v41 != v21) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            v24 = [v39 URLByAppendingPathComponent:v23];
            v25 = [v38 URLByAppendingPathComponent:v23];
            uint64_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
            v27 = [v25 path];
            int v28 = [v26 fileExistsAtPath:v27];

            if (v28)
            {
              char v29 = [MEMORY[0x1E4F28CB8] defaultManager];
              int v30 = [v29 removeItemAtURL:v25 error:a5];

              if (!v30)
              {

LABEL_18:
                char v34 = 0;
                id v18 = obj;
                v33 = obj;
                goto LABEL_19;
              }
            }
            char v31 = [MEMORY[0x1E4F28CB8] defaultManager];
            int v32 = [v31 moveItemAtURL:v24 toURL:v25 error:a5];

            if (!v32) {
              goto LABEL_18;
            }
          }
          id v18 = obj;
          uint64_t v20 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      v33 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v34 = [v33 removeItemAtURL:v39 error:a5];
LABEL_19:

      v15 = v36;
    }
    else
    {
      char v34 = 0;
    }
  }
  else
  {
    char v34 = 0;
  }

  return v34;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)TIResponseKitTrainerImpl;
  v2 = [(TIResponseKitTrainerImpl *)&v7 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.companionmessagesd.ResponseKitTrainer", v3);
    uint64_t v5 = (void *)_dispatchQueue;
    _dispatchQueue = (uint64_t)v4;
  }
  return v2;
}

+ (id)sharedTrainer
{
  if (sharedTrainer_onceToken != -1) {
    dispatch_once(&sharedTrainer_onceToken, &__block_literal_global_2726);
  }
  v2 = (void *)sharedTrainer_instance;

  return v2;
}

uint64_t __41__TIResponseKitTrainerImpl_sharedTrainer__block_invoke()
{
  sharedTrainer_instance = [[TIResponseKitTrainerImpl alloc] _init];

  return MEMORY[0x1F41817F8]();
}

@end