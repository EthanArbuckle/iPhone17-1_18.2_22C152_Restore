@interface VTEventTrackerManager
- (VTEventTrackerManager)init;
- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 includingPropertiesForKeys:(id)a5 error:(id *)a6;
- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 sortedByDateWithResourceKey:(id)a5 error:(id *)a6;
- (id)_dictionaryToJson:(id)a3;
- (id)_sortedURLsInDirectory:(id)a3 matchingPattern:(id)a4;
- (void)voiceTriggerEvent:(id)a3;
@end

@implementation VTEventTrackerManager

- (void).cxx_destruct
{
}

- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 sortedByDateWithResourceKey:(id)a5 error:(id *)a6
{
  v26[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__190;
  v24 = __Block_byref_object_dispose__191;
  id v25 = 0;
  v26[0] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  v14 = [(VTEventTrackerManager *)self _contentsOfDirectoryAtURL:v10 matchingPattern:v11 includingPropertiesForKeys:v13 error:a6];

  if (v14)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __101__VTEventTrackerManager__contentsOfDirectoryAtURL_matchingPattern_sortedByDateWithResourceKey_error___block_invoke;
    v17[3] = &unk_2643252E8;
    id v18 = v12;
    v19 = &v20;
    v15 = [v14 sortedArrayUsingComparator:v17];
  }
  else
  {
    v15 = 0;
  }
  if (v21[5])
  {

    v15 = 0;
    if (a6) {
      *a6 = (id) v21[5];
    }
  }

  _Block_object_dispose(&v20, 8);

  return v15;
}

uint64_t __101__VTEventTrackerManager__contentsOfDirectoryAtURL_matchingPattern_sortedByDateWithResourceKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id obj = 0;
  id v20 = 0;
  v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  char v8 = [v5 getResourceValue:&v20 forKey:*(void *)(a1 + 32) error:&obj];
  id v9 = v20;
  objc_storeStrong(v7, obj);
  if ((v8 & 1) == 0) {
    NSLog(&cfstr_UnableToGetFor.isa, *(void *)(a1 + 32), v5, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  id v17 = 0;
  id v18 = 0;
  id v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  char v11 = [v6 getResourceValue:&v18 forKey:*(void *)(a1 + 32) error:&v17];
  id v12 = v18;
  objc_storeStrong(v10, v17);
  if ((v11 & 1) == 0) {
    NSLog(&cfstr_UnableToGetFor.isa, *(void *)(a1 + 32), v6, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  uint64_t v13 = [v12 compare:v9];
  if (!v13)
  {
    v14 = [v6 path];
    int v15 = [v14 containsString:@"-prepare"];

    if (v15) {
      uint64_t v13 = -1;
    }
    else {
      uint64_t v13 = 1;
    }
  }

  return v13;
}

- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 includingPropertiesForKeys:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  char v11 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:a4 options:17 error:a6];
  if (v11)
  {
    id v12 = objc_opt_new();
    uint64_t v13 = [v12 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:v10 options:0 error:a6];
    if (v13)
    {
      v14 = (void *)MEMORY[0x263F08A98];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __100__VTEventTrackerManager__contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke;
      v18[3] = &unk_2643252C0;
      id v19 = v11;
      int v15 = [v14 predicateWithBlock:v18];
      v16 = [v13 filteredArrayUsingPredicate:v15];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

BOOL __100__VTEventTrackerManager__contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 lastPathComponent];
  BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

- (id)_sortedURLsInDirectory:(id)a3 matchingPattern:(id)a4
{
  uint64_t v4 = *MEMORY[0x263EFF610];
  uint64_t v7 = 0;
  id v5 = [(VTEventTrackerManager *)self _contentsOfDirectoryAtURL:a3 matchingPattern:a4 sortedByDateWithResourceKey:v4 error:&v7];

  return v5;
}

- (id)_dictionaryToJson:(id)a3
{
  v3 = [MEMORY[0x263F08900] dataWithJSONObject:a3 options:1 error:0];
  if (v3) {
    uint64_t v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)voiceTriggerEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__VTEventTrackerManager_voiceTriggerEvent___block_invoke;
    v7[3] = &unk_264325C08;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __43__VTEventTrackerManager_voiceTriggerEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = NSURL;
  if (VTAudioLogDirectory_onceToken != -1) {
    dispatch_once(&VTAudioLogDirectory_onceToken, &__block_literal_global_6700);
  }
  id v4 = (id)VTAudioLogDirectory_logPath;
  id v5 = [v3 URLWithString:v4];
  id v6 = [v2 _sortedURLsInDirectory:v5 matchingPattern:@".*.json"];

  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = +[VTEvent eventFromURL:](VTEvent, "eventFromURL:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        v14 = [v13 eventTrackerDictionary];
        if (v14) {
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (VTEventTrackerManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VTEventTrackerManager;
  v2 = [(VTEventTrackerManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.voicetrigger.eventtracker", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end