@interface STGenericIntentHelper
+ (id)sharedHelper;
- (BOOL)_invokeHandlerForIntent:(id)a3;
- (NSMutableDictionary)handlers;
- (OS_dispatch_queue)siriResponseQueue;
- (OS_dispatch_semaphore)waitForIntentCompleteSemaphore;
- (STGenericIntentHelper)init;
- (void)_handleIntent:(id)a3 withTask:(id)a4 andApplication:(id)a5;
- (void)finishedLaunching:(BOOL)a3;
- (void)forIntent:(id)a3 registerHandler:(id)a4;
- (void)forIntentParam:(id)a3 predict:(id)a4;
- (void)handleSiriTask:(id)a3 withApplication:(id)a4;
- (void)setHandlers:(id)a3;
- (void)setSiriResponseQueue:(id)a3;
- (void)setWaitForIntentCompleteSemaphore:(id)a3;
@end

@implementation STGenericIntentHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForIntentCompleteSemaphore, 0);
  objc_storeStrong((id *)&self->_siriResponseQueue, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setWaitForIntentCompleteSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)waitForIntentCompleteSemaphore
{
  return self->_waitForIntentCompleteSemaphore;
}

- (void)setSiriResponseQueue:(id)a3
{
}

- (OS_dispatch_queue)siriResponseQueue
{
  return self->_siriResponseQueue;
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (BOOL)_invokeHandlerForIntent:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  handlers = self->_handlers;
  v6 = [v4 name];
  v7 = [(NSMutableDictionary *)handlers objectForKey:v6];

  if (v7)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__STGenericIntentHelper__invokeHandlerForIntent___block_invoke;
    v11[3] = &unk_2647624C8;
    id v13 = v7;
    id v12 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
  else
  {
    v8 = *MEMORY[0x263F283A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F283A8], OS_LOG_TYPE_ERROR))
    {
      v10 = self->_handlers;
      *(_DWORD *)buf = 136315650;
      v15 = "-[STGenericIntentHelper _invokeHandlerForIntent:]";
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_error_impl(&dword_225AB6000, v8, OS_LOG_TYPE_ERROR, "%s No handler registered for intent %@, registered handlers: %@", buf, 0x20u);
    }
  }

  return 0;
}

void __49__STGenericIntentHelper__invokeHandlerForIntent___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_time_t v2 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__STGenericIntentHelper__invokeHandlerForIntent___block_invoke_2;
  block[3] = &unk_264762450;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
}

uint64_t __49__STGenericIntentHelper__invokeHandlerForIntent___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) finishedState];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 finished];
  }
  return result;
}

- (void)forIntent:(id)a3 registerHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__STGenericIntentHelper_forIntent_registerHandler___block_invoke;
  block[3] = &unk_2647624A0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __51__STGenericIntentHelper_forIntent_registerHandler___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = (id)[*(id *)(a1 + 48) copy];
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

- (void)forIntentParam:(id)a3 predict:(id)a4
{
  v5 = [MEMORY[0x263EFF9B0] orderedSetWithArray:a4];
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__STGenericIntentHelper_forIntentParam_predict___block_invoke;
  block[3] = &unk_264762450;
  id v10 = v5;
  id v8 = v5;
  dispatch_after(v6, queue, block);
}

void __48__STGenericIntentHelper_forIntentParam_predict___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)getINVocabularyUpdaterClass());
  [v2 setCustomPhotoAlbumNames:*(void *)(a1 + 32)];
}

- (void)_handleIntent:(id)a3 withTask:(id)a4 andApplication:(id)a5
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = *MEMORY[0x263F283A8];
  BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x263F283A8], OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    v85 = self;
    id v87 = v9;
    v88 = v10;
    if (v12)
    {
      *(_DWORD *)buf = 136315394;
      v92 = "-[STGenericIntentHelper _handleIntent:withTask:andApplication:]";
      __int16 v93 = 2112;
      id v94 = v8;
      _os_log_debug_impl(&dword_225AB6000, v11, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }
    id v13 = [v8 info];
    v14 = [v13 objectForKeyedSubscript:@"address"];
    v15 = [v14 objectForKeyedSubscript:@"value"];

    __int16 v16 = [v8 info];
    id v17 = [v16 objectForKeyedSubscript:@"photoTopic"];
    __int16 v18 = [v17 objectForKeyedSubscript:@"value"];

    v19 = [v8 info];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"photoAlbumName"];
    v21 = [v20 objectForKeyedSubscript:@"value"];

    v22 = [v8 info];
    v23 = [v22 objectForKeyedSubscript:@"photoContact"];
    v24 = [v23 objectForKeyedSubscript:@"value"];

    v25 = [v8 info];
    v26 = [v25 objectForKeyedSubscript:@"photoAttributes"];
    v27 = [v26 objectForKeyedSubscript:@"value"];
    v86 = [v27 objectForKeyedSubscript:@"semanticValue"];

    v28 = [v8 info];
    v29 = [v28 objectForKeyedSubscript:@"photoNoun"];
    v30 = [v29 objectForKeyedSubscript:@"value"];
    v89 = [v30 objectForKeyedSubscript:@"semanticValue"];

    if (v21)
    {
      v31 = objc_alloc_init(STGenericIntentGroup);
      v32 = [v21 objectForKeyedSubscript:@"inputValue"];
      v90 = v31;
      [(STGenericIntentGroup *)v31 setName:v32];
    }
    else
    {
      v90 = 0;
    }
    v81 = v24;
    if (!v24) {
      goto LABEL_11;
    }
    v33 = v24;
    v24 = objc_alloc_init(STGenericIntentPerson);
    v34 = [(STGenericIntentPerson *)v33 objectForKeyedSubscript:@"fullName"];
    [(STGenericIntentPerson *)v24 setName:v34];

    v35 = [(STGenericIntentPerson *)v24 name];
    uint64_t v36 = [v35 length];

    if (!v36)
    {
      id v39 = objc_alloc_init(MEMORY[0x263F08A68]);
      v40 = [(STGenericIntentPerson *)v33 objectForKeyedSubscript:@"firstName"];
      [v39 setGivenName:v40];

      v41 = [(STGenericIntentPerson *)v33 objectForKeyedSubscript:@"lastName"];
      [v39 setFamilyName:v41];

      v42 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v39 style:2 options:0];
      [(STGenericIntentPerson *)v24 setName:v42];

      if (v18) {
        goto LABEL_12;
      }
    }
    else
    {
LABEL_11:
      if (v18)
      {
LABEL_12:
        v37 = objc_alloc_init(STGenericIntentTopic);
        v38 = [v18 objectForKeyedSubscript:@"inputValue"];
        [(STGenericIntentTopic *)v37 setName:v38];

        goto LABEL_15;
      }
    }
    v37 = 0;
LABEL_15:
    v83 = v18;
    v84 = v15;
    if (!v15)
    {
      uint64_t v44 = 0;
      goto LABEL_30;
    }
    v43 = [(STGenericIntentLocation *)v15 objectForKeyedSubscript:@"regionType"];
    if ([v43 containsString:@"Address"])
    {
    }
    else
    {
      v45 = [(STGenericIntentLocation *)v15 objectForKeyedSubscript:@"regionType"];
      int v46 = [v45 containsString:@"Street"];

      if (!v46)
      {
        v54 = [(STGenericIntentLocation *)v15 objectForKeyedSubscript:@"regionType"];
        int v55 = [v54 containsString:@"State"];

        if (v55)
        {
          v56 = @"stateCode";
        }
        else
        {
          v57 = [(STGenericIntentLocation *)v15 objectForKeyedSubscript:@"regionType"];
          int v58 = [v57 containsString:@"City"];

          if (v58)
          {
            v56 = @"city";
          }
          else
          {
            v59 = [(STGenericIntentLocation *)v15 objectForKeyedSubscript:@"regionType"];
            int v60 = [v59 containsString:@"Country"];

            if (!v60)
            {
              uint64_t v53 = 0;
              uint64_t v44 = 0;
              double v50 = 0.0;
              double v52 = 0.0;
              goto LABEL_29;
            }
            v56 = @"countryCode";
          }
        }
        v47 = [(STGenericIntentLocation *)v15 objectForKeyedSubscript:v56];
        uint64_t v44 = [v47 lowercaseString];
        uint64_t v53 = 0;
        double v50 = 0.0;
        double v52 = 0.0;
LABEL_28:

LABEL_29:
        v15 = [[STGenericIntentLocation alloc] initWithName:v44 latitude:v50 longitude:v52];
        [(STGenericIntentLocation *)v15 setIsLatLong:v53];
LABEL_30:
        v80 = (void *)v44;
        v82 = v21;
        v61 = [v8 info];
        v62 = [v61 objectForKeyedSubscript:@"photoDate"];
        v63 = [v62 objectForKeyedSubscript:@"value"];

        if (v63)
        {
          v64 = [v63 objectForKeyedSubscript:@"start"];
          v65 = [v63 objectForKeyedSubscript:@"end"];
          v66 = [v64 objectForKeyedSubscript:@"date"];
          v67 = [v65 objectForKeyedSubscript:@"date"];
          v68 = [[STGenericIntentDateRange alloc] initWithStartDate:v66 endDate:v67];
        }
        else
        {
          v68 = 0;
        }
        v69 = [[STGenericIntent alloc] initWithName:@"photosSearch"];
        v70 = [v8 utterance];
        [(STGenericIntent *)v69 setUtterance:v70];

        id v9 = v87;
        [(STGenericIntent *)v69 setSiriTask:v87];
        [(STGenericIntent *)v69 setIntentRequest:v8];
        id v10 = v88;
        -[STGenericIntent setAppInForeground:](v69, "setAppInForeground:", [v88 applicationState] == 0);
        -[STGenericIntent setIsLaunch:](v69, "setIsLaunch:", [v8 isForegroundLaunch]);
        [(STGenericIntent *)v69 setAttributes:&stru_26D929228];
        if ([v89 containsString:@"videos"])
        {
          v71 = NSString;
          v72 = [(STGenericIntent *)v69 attributes];
          v73 = [v71 stringWithFormat:@" %@ video", v72];
          [(STGenericIntent *)v69 setAttributes:v73];

          id v10 = v88;
        }
        v74 = v86;
        if (![v86 length]) {
          goto LABEL_41;
        }
        if ([v86 containsString:@"from_front_facing_camera"])
        {
          v75 = NSString;
          v76 = [(STGenericIntent *)v69 attributes];
          [v75 stringWithFormat:@" %@ selfies", v76, v79];
        }
        else
        {
          if ([v86 isEqualToString:@"taken"])
          {
LABEL_41:
            if (v24) {
              [(STGenericIntent *)v69 addParam:@"byPeopleInPhoto" withValue:v24];
            }
            if (v15) {
              [(STGenericIntent *)v69 addParam:@"byPhotoLocation" withValue:v15];
            }
            if (v68) {
              [(STGenericIntent *)v69 addParam:@"byPhotoDateCreated" withValue:v68];
            }
            if (v90) {
              [(STGenericIntent *)v69 addParam:@"byPhotoAlbum" withValue:v90];
            }
            if (v37) {
              [(STGenericIntent *)v69 addParam:@"byPhotoTopic" withValue:v37];
            }
            [(STGenericIntentHelper *)v85 _invokeHandlerForIntent:v69];

            goto LABEL_52;
          }
          v77 = NSString;
          v76 = [(STGenericIntent *)v69 attributes];
          [v77 stringWithFormat:@" %@ %@", v76, v86];
        v78 = };
        [(STGenericIntent *)v69 setAttributes:v78];

        id v9 = v87;
        id v10 = v88;
        v74 = v86;
        goto LABEL_41;
      }
    }
    v47 = [(STGenericIntentLocation *)v15 objectForKeyedSubscript:@"latitude"];
    v48 = [(STGenericIntentLocation *)v15 objectForKeyedSubscript:@"longitude"];
    [v47 doubleValue];
    double v50 = v49;
    [v48 doubleValue];
    double v52 = v51;

    uint64_t v44 = 0;
    uint64_t v53 = 1;
    goto LABEL_28;
  }
  if (v12)
  {
    *(_DWORD *)buf = 136315138;
    v92 = "-[STGenericIntentHelper _handleIntent:withTask:andApplication:]";
    _os_log_debug_impl(&dword_225AB6000, v11, OS_LOG_TYPE_DEBUG, "%s nil intent, check to make sure you are linked against SiriTask", buf, 0xCu);
  }
LABEL_52:
}

- (void)handleSiriTask:(id)a3 withApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [v8 request];
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__STGenericIntentHelper_handleSiriTask_withApplication___block_invoke;
  v14[3] = &unk_264762478;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v7;
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v14);
}

uint64_t __56__STGenericIntentHelper_handleSiriTask_withApplication___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F283A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F283A8], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[STGenericIntentHelper handleSiriTask:withApplication:]_block_invoke";
    _os_log_debug_impl(&dword_225AB6000, v2, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v3 = [*(id *)(a1 + 32) waitForIntentCompleteSemaphore];
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v3, v4);

  return [*(id *)(a1 + 32) _handleIntent:*(void *)(a1 + 40) withTask:*(void *)(a1 + 48) andApplication:*(void *)(a1 + 56)];
}

- (void)finishedLaunching:(BOOL)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__STGenericIntentHelper_finishedLaunching___block_invoke;
  block[3] = &unk_264762450;
  void block[4] = self;
  if (finishedLaunching__onceToken != -1) {
    dispatch_once(&finishedLaunching__onceToken, block);
  }
}

void __43__STGenericIntentHelper_finishedLaunching___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__STGenericIntentHelper_finishedLaunching___block_invoke_2;
  block[3] = &unk_264762450;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __43__STGenericIntentHelper_finishedLaunching___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) waitForIntentCompleteSemaphore];
  dispatch_semaphore_signal(v1);
}

- (STGenericIntentHelper)init
{
  v14.receiver = self;
  v14.super_class = (Class)STGenericIntentHelper;
  id v2 = [(STGenericIntentHelper *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.siri.GenericIntentHelper", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.siri.GenericIntentResponse", v6);
    siriResponseQueue = v2->_siriResponseQueue;
    v2->_siriResponseQueue = (OS_dispatch_queue *)v9;

    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    waitForIntentCompleteSemaphore = v2->_waitForIntentCompleteSemaphore;
    v2->_waitForIntentCompleteSemaphore = (OS_dispatch_semaphore *)v11;

    AFLogInitIfNeeded();
  }
  return v2;
}

+ (id)sharedHelper
{
  if (sharedHelper_onceToken != -1) {
    dispatch_once(&sharedHelper_onceToken, &__block_literal_global_184);
  }
  id v2 = (void *)sharedHelper_sHelper;
  return v2;
}

uint64_t __37__STGenericIntentHelper_sharedHelper__block_invoke()
{
  sharedHelper_sHelper = objc_alloc_init(STGenericIntentHelper);
  return MEMORY[0x270F9A758]();
}

@end