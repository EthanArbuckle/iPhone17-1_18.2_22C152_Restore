@interface TIFilterParameterLoader
- (OS_dispatch_queue)loadQueue;
- (TIFilterParameterLoader)init;
- (id)loadCandidateFilterSpecificationForLanguageIdentifier:(id)a3;
- (id)loadContentsForPlistWithLanguage:(id)a3;
- (id)parameterOverridesFolderURL;
- (id)parameterPlistForLanguage:(id)a3;
- (id)universalParameterPlist;
- (void)loadCandidateFilterSpecificationForLanguageIdentifier:(id)a3 targetQueue:(id)a4 completion:(id)a5;
@end

@implementation TIFilterParameterLoader

- (void).cxx_destruct
{
}

- (OS_dispatch_queue)loadQueue
{
  return self->_loadQueue;
}

- (id)parameterOverridesFolderURL
{
  v2 = TI_KB_USER_DIRECTORY();
  v3 = [v2 stringByAppendingPathComponent:@"Filters"];
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];

  return v4;
}

- (id)universalParameterPlist
{
  return @"candidate-filter-specification.plist";
}

- (id)parameterPlistForLanguage:(id)a3
{
  return (id)[NSString stringWithFormat:@"candidate-filter-specification.%@.plist", a3];
}

- (id)loadContentsForPlistWithLanguage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  if (!TI_IS_INTERNAL_INSTALL::is_internal_install) {
    goto LABEL_7;
  }
  v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = [(TIFilterParameterLoader *)self universalParameterPlist];
  v6 = [(TIFilterParameterLoader *)self parameterOverridesFolderURL];
  v7 = [v4 fileURLWithPath:v5 relativeToURL:v6];

  v8 = (void *)MEMORY[0x1E4F1C9E8];
  v9 = [v7 path];
  v10 = [v8 dictionaryWithContentsOfFile:v9];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v7 path];
    int v19 = 136315394;
    v20 = "-[TIFilterParameterLoader loadContentsForPlistWithLanguage:]";
    __int16 v21 = 2080;
    uint64_t v22 = [v17 UTF8String];
    _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Looking for candidate filter plist file under: %s", (uint8_t *)&v19, 0x16u);
  }
  if (!v10)
  {
LABEL_7:
    v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v12 = [(TIFilterParameterLoader *)self universalParameterPlist];
    v13 = [v11 pathForResource:v12 ofType:&stru_1F3F7A998];

    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v13];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = [v13 UTF8String];
      int v19 = 136315394;
      v20 = "-[TIFilterParameterLoader loadContentsForPlistWithLanguage:]";
      __int16 v21 = 2080;
      uint64_t v22 = v18;
      _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Looking for candidate filter plist file under: %s", (uint8_t *)&v19, 0x16u);
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    if (v10) {
      v14 = @"True";
    }
    else {
      v14 = @"False";
    }
    uint64_t v15 = [(__CFString *)v14 UTF8String];
    int v19 = 136315394;
    v20 = "-[TIFilterParameterLoader loadContentsForPlistWithLanguage:]";
    __int16 v21 = 2080;
    uint64_t v22 = v15;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s  A valid candidate filter plist was found: %s", (uint8_t *)&v19, 0x16u);
  }

  return v10;
}

- (id)loadCandidateFilterSpecificationForLanguageIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__10563;
  v14 = __Block_byref_object_dispose__10564;
  id v15 = 0;
  v5 = [(TIFilterParameterLoader *)self loadQueue];
  v9 = v4;
  id v6 = v4;
  TIDispatchSync();

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __81__TIFilterParameterLoader_loadCandidateFilterSpecificationForLanguageIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) loadContentsForPlistWithLanguage:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)loadCandidateFilterSpecificationForLanguageIdentifier:(id)a3 targetQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(TIFilterParameterLoader *)self loadQueue];
  id v15 = v9;
  v16 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  TIDispatchAsync();
}

void __104__TIFilterParameterLoader_loadCandidateFilterSpecificationForLanguageIdentifier_targetQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) loadContentsForPlistWithLanguage:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 56);
  if (v3)
  {
    id v5 = v3;
    id v4 = v2;
    TIDispatchAsync();
  }
}

uint64_t __104__TIFilterParameterLoader_loadCandidateFilterSpecificationForLanguageIdentifier_targetQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (TIFilterParameterLoader)init
{
  v8.receiver = self;
  v8.super_class = (Class)TIFilterParameterLoader;
  uint64_t v2 = [(TIFilterParameterLoader *)&v8 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.TextInput.TICandidateQualityParameterLoader", v4);
    loadQueue = v2->_loadQueue;
    v2->_loadQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end