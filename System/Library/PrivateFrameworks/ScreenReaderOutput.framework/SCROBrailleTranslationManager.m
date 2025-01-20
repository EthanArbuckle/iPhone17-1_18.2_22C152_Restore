@interface SCROBrailleTranslationManager
+ (SCROBrailleTranslationManager)sharedManager;
+ (id)inputManager;
- (BOOL)alwaysUsesNemethCodeForTechnicalText;
- (BOOL)primaryTableSupportsContractedBraille;
- (BOOL)primaryTableSupportsEightDotBraille;
- (BOOL)primaryTableSupportsRoundTripping;
- (BRLTTranslationService)translationService;
- (NSString)defaultLanguage;
- (OS_dispatch_queue)queue;
- (SCROBrailleTranslationManager)init;
- (id)printBrailleForText:(id)a3 language:(id)a4 mode:(unint64_t)a5 textPositionsRange:(_NSRange)a6 locations:(id *)a7 textFormattingRanges:(id)a8;
- (id)serviceIdentifier;
- (id)textForPrintBraille:(id)a3 language:(id)a4 mode:(unint64_t)a5 locations:(id *)a6;
- (void)loadTranslatorWithServiceIdentifier:(id)a3;
- (void)loadTranslatorWithServiceIdentifier:(id)a3 forUnitTesting:(BOOL)a4;
- (void)loadTranslatorWithServiceIdentifier:(id)a3 forUnitTesting:(BOOL)a4 input:(BOOL)a5;
- (void)loadTranslatorWithServiceIdentifier:(id)a3 input:(BOOL)a4;
- (void)setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3;
- (void)setDefaultLanguage:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTranslationService:(id)a3;
@end

@implementation SCROBrailleTranslationManager

+ (SCROBrailleTranslationManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_sharedManager;

  return (SCROBrailleTranslationManager *)v2;
}

uint64_t __46__SCROBrailleTranslationManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(SCROBrailleTranslationManager);
  _sharedManager = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0);
}

+ (id)inputManager
{
  if (inputManager_onceToken != -1) {
    dispatch_once(&inputManager_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)inputManager__inputManager;

  return v2;
}

uint64_t __45__SCROBrailleTranslationManager_inputManager__block_invoke()
{
  v0 = objc_alloc_init(SCROBrailleTranslationManager);
  inputManager__inputManager = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0);
}

- (SCROBrailleTranslationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCROBrailleTranslationManager;
  v2 = [(SCROBrailleTranslationManager *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ScreenReaderOutput.brailleTranslationService.clientQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    translationService = v2->_translationService;
    v2->_translationService = 0;
  }
  return v2;
}

- (void)loadTranslatorWithServiceIdentifier:(id)a3
{
}

- (void)loadTranslatorWithServiceIdentifier:(id)a3 input:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = loadTranslatorWithServiceIdentifier_input__onceToken;
  id v7 = a3;
  id v9 = v7;
  if (v6 == -1)
  {
    id v8 = v7;
  }
  else
  {
    dispatch_once(&loadTranslatorWithServiceIdentifier_input__onceToken, &__block_literal_global_23);
    id v8 = v9;
  }
  [(SCROBrailleTranslationManager *)self loadTranslatorWithServiceIdentifier:v8 forUnitTesting:loadTranslatorWithServiceIdentifier_input__isXcTest input:v4];
}

void __75__SCROBrailleTranslationManager_loadTranslatorWithServiceIdentifier_input___block_invoke()
{
  id v1 = [MEMORY[0x263F08AB0] processInfo];
  v0 = [v1 processName];
  loadTranslatorWithServiceIdentifier_input__isXcTest = [v0 isEqualToString:@"xctest"];
}

- (void)loadTranslatorWithServiceIdentifier:(id)a3 forUnitTesting:(BOOL)a4
{
}

- (void)loadTranslatorWithServiceIdentifier:(id)a3 forUnitTesting:(BOOL)a4 input:(BOOL)a5
{
  id v8 = a3;
  id v9 = [(SCROBrailleTranslationManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__SCROBrailleTranslationManager_loadTranslatorWithServiceIdentifier_forUnitTesting_input___block_invoke;
  block[3] = &unk_264414D48;
  block[4] = self;
  id v12 = v8;
  BOOL v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(v9, block);
}

void __90__SCROBrailleTranslationManager_loadTranslatorWithServiceIdentifier_forUnitTesting_input___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) translationService];
  v3 = [v2 serviceIdentifier];
  char v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

  if ((v4 & 1) == 0)
  {
    v5 = _SCROD_BRAILLE_LOG();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = "(UNIT TESTING)";
      if (!*(unsigned char *)(a1 + 48)) {
        id v7 = "";
      }
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      id v12 = v7;
      _os_log_impl(&dword_21C66E000, v5, OS_LOG_TYPE_DEFAULT, "Loading service with identifier: %@ %s", (uint8_t *)&v9, 0x16u);
    }

    id v8 = [MEMORY[0x263F2BAD8] serviceForIdentifier:*(void *)(a1 + 40) input:*(unsigned __int8 *)(a1 + 49) loopback:*(unsigned __int8 *)(a1 + 48)];
    [*(id *)(a1 + 32) setTranslationService:v8];
  }
}

- (NSString)defaultLanguage
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  __int16 v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v3 = [(SCROBrailleTranslationManager *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SCROBrailleTranslationManager_defaultLanguage__block_invoke;
  v6[3] = &unk_264414790;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __48__SCROBrailleTranslationManager_defaultLanguage__block_invoke(uint64_t a1)
{
}

- (void)setDefaultLanguage:(id)a3
{
  id v4 = a3;
  v5 = [(SCROBrailleTranslationManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SCROBrailleTranslationManager_setDefaultLanguage___block_invoke;
  v7[3] = &unk_264414808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__SCROBrailleTranslationManager_setDefaultLanguage___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v2 = objc_alloc(MEMORY[0x263F2BAA8]);
    v3 = [*(id *)(a1 + 32) translationService];
    id v4 = [v3 serviceIdentifier];
    v5 = (void *)[v2 initWithServiceIdentifier:v4 tableIdentifier:*(void *)(a1 + 40)];

    *(unsigned char *)(*(void *)(a1 + 32) + 9) = [v5 supportsTranslationMode8Dot];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = [v5 supportsTranslationModeContracted];
    id v6 = _SCROD_BRAILLE_LOG();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __52__SCROBrailleTranslationManager_setDefaultLanguage___block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
  uint64_t v7 = [*(id *)(a1 + 40) copy];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v7;
}

- (id)serviceIdentifier
{
  id v2 = [(SCROBrailleTranslationManager *)self translationService];
  v3 = [v2 serviceIdentifier];

  return v3;
}

- (id)printBrailleForText:(id)a3 language:(id)a4 mode:(unint64_t)a5 textPositionsRange:(_NSRange)a6 locations:(id *)a7 textFormattingRanges:(id)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v12 = a3;
  id v13 = a4;
  id v14 = a8;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__1;
  v50 = __Block_byref_object_dispose__1;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__1;
  v44 = __Block_byref_object_dispose__1;
  id v45 = 0;
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v16 = [(SCROBrailleTranslationManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke;
  block[3] = &unk_264414D98;
  id v17 = v13;
  id v30 = v17;
  v31 = self;
  id v18 = v14;
  id v32 = v18;
  unint64_t v37 = a5;
  NSUInteger v38 = location;
  NSUInteger v39 = length;
  id v19 = v12;
  id v33 = v19;
  v35 = &v46;
  v36 = &v40;
  v20 = v15;
  v34 = v20;
  dispatch_async(v16, block);

  dispatch_time_t v21 = dispatch_time(0, 5000000000);
  intptr_t v22 = dispatch_group_wait(v20, v21);
  if (v22)
  {
    uint64_t v23 = v22;
    v24 = _SCROD_BRAILLE_LOG();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SCROBrailleTranslationManager printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:](v23, v24);
    }
  }
  if (a7) {
    *a7 = (id) v41[5];
  }
  id v25 = (id)v47[5];

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v25;
}

void __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke(uint64_t a1)
{
  v3 = (uint64_t *)(a1 + 32);
  id v2 = *(void **)(a1 + 32);
  if (!v2) {
    id v2 = *(void **)(*(void *)(a1 + 40) + 16);
  }
  id v4 = v2;
  v5 = _SCROD_BRAILLE_LOG();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_3(a1, v3, v5);
  }

  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263F2BAD0]), "initWithLanguage:mode:partial:useTechnicalTable:textPositionsRange:textFormattingRanges:", v4, *(void *)(a1 + 88), 0, objc_msgSend(*(id *)(a1 + 40), "alwaysUsesNemethCodeForTechnicalText"), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 48));
  uint64_t v7 = [*(id *)(a1 + 40) translationService];

  uint64_t v8 = _SCROD_BRAILLE_LOG();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_2();
    }

    uint64_t v10 = [*(id *)(a1 + 40) translationService];
    __int16 v11 = *(void **)(a1 + 56);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_33;
    v16[3] = &unk_264414D70;
    id v12 = v11;
    uint64_t v13 = *(void *)(a1 + 80);
    id v17 = v12;
    uint64_t v19 = v13;
    long long v15 = *(_OWORD *)(a1 + 64);
    id v14 = (id)v15;
    long long v18 = v15;
    [v10 brailleForText:v12 parameters:v6 withReply:v16];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_1(v9);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  }
}

void __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _SCROD_BRAILLE_LOG();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = 138740483;
    uint64_t v16 = v14;
    __int16 v17 = 2117;
    id v18 = v5;
    __int16 v19 = 2117;
    id v20 = v6;
    _os_log_debug_impl(&dword_21C66E000, v7, OS_LOG_TYPE_DEBUG, "Translated text:'%{sensitive}@' -> braille:'%{sensitive}@' locations:%{sensitive}@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)textForPrintBraille:(id)a3 language:(id)a4 mode:(unint64_t)a5 locations:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v38 = 0;
  NSUInteger v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__1;
  uint64_t v42 = __Block_byref_object_dispose__1;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  id v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  id v13 = [(SCROBrailleTranslationManager *)self queue];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke;
  v23[3] = &unk_264414DC0;
  id v14 = v11;
  id v24 = v14;
  id v25 = self;
  id v30 = a6;
  id v15 = v10;
  id v26 = v15;
  v28 = &v38;
  v29 = &v32;
  unint64_t v31 = a5;
  uint64_t v16 = v12;
  v27 = v16;
  dispatch_async(v13, v23);

  dispatch_time_t v17 = dispatch_time(0, 5000000000);
  intptr_t v18 = dispatch_group_wait(v16, v17);
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = _SCROD_BRAILLE_LOG();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SCROBrailleTranslationManager textForPrintBraille:language:mode:locations:](v19, v20);
    }
  }
  if (a6) {
    *a6 = (id) v33[5];
  }
  id v21 = (id)v39[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v21;
}

void __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2) {
    id v2 = *(void **)(*(void *)(a1 + 40) + 16);
  }
  id v3 = v2;
  if (*(void *)(a1 + 80))
  {
    uint64_t v4 = [*(id *)(a1 + 48) length];
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263F2BAD0]), "initWithLanguage:mode:partial:useTechnicalTable:textPositionsRange:textFormattingRanges:", v3, *(void *)(a1 + 88), 0, objc_msgSend(*(id *)(a1 + 40), "alwaysUsesNemethCodeForTechnicalText"), v5, v4, 0);
  uint64_t v7 = [*(id *)(a1 + 40) translationService];

  uint64_t v8 = _SCROD_BRAILLE_LOG();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_cold_2();
    }

    id v10 = [*(id *)(a1 + 40) translationService];
    id v11 = *(void **)(a1 + 48);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_35;
    v16[3] = &unk_264414D70;
    id v12 = v11;
    uint64_t v13 = *(void *)(a1 + 72);
    id v17 = v12;
    uint64_t v19 = v13;
    long long v15 = *(_OWORD *)(a1 + 56);
    id v14 = (id)v15;
    long long v18 = v15;
    [v10 textForBraille:v12 parameters:v6 withReply:v16];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_cold_1(v9);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

void __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _SCROD_BRAILLE_LOG();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = 138412802;
    uint64_t v16 = v14;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_21C66E000, v7, OS_LOG_TYPE_DEBUG, "Translated braille:'%@' -> text:'%@' locations:%@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (BOOL)primaryTableSupportsRoundTripping
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__SCROBrailleTranslationManager_primaryTableSupportsRoundTripping__block_invoke;
  v5[3] = &unk_264414DE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __66__SCROBrailleTranslationManager_primaryTableSupportsRoundTripping__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = [&unk_26CCF1880 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v7;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(&unk_26CCF1880);
        }
        uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) isEqualToString:*(void *)(*((void *)&v6 + 1) + 8 * v5)];
        if (result)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          return result;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t result = [&unk_26CCF1880 countByEnumeratingWithState:&v6 objects:v10 count:16];
      uint64_t v3 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (BOOL)primaryTableSupportsContractedBraille
{
  return self->_tableSupportsContractedBraille;
}

- (BOOL)primaryTableSupportsEightDotBraille
{
  return self->_tableSupportsEightDotBraille;
}

- (BOOL)alwaysUsesNemethCodeForTechnicalText
{
  return self->_alwaysUsesNemethCodeForTechnicalText;
}

- (void)setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3
{
  self->_alwaysUsesNemethCodeForTechnicalText = a3;
}

- (BRLTTranslationService)translationService
{
  return self->_translationService;
}

- (void)setTranslationService:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_translationService, 0);

  objc_storeStrong((id *)&self->_queue_defaultLanguage, 0);
}

void __52__SCROBrailleTranslationManager_setDefaultLanguage___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C66E000, a2, OS_LOG_TYPE_DEBUG, "Set new default language table: %@", (uint8_t *)&v2, 0xCu);
}

- (void)printBrailleForText:(uint64_t)a1 language:(NSObject *)a2 mode:textPositionsRange:locations:textFormattingRanges:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C66E000, a2, OS_LOG_TYPE_ERROR, "Timed out translating text to braille - %ld", (uint8_t *)&v2, 0xCu);
}

void __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_21C66E000, log, OS_LOG_TYPE_ERROR, "Requested braille->text translation when no translator is loaded.", v1, 2u);
}

void __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C66E000, v0, v1, "Requesting text->braille translation. text:'%{sensitive}@' parameters:%@");
}

void __117__SCROBrailleTranslationManager_printBrailleForText_language_mode_textPositionsRange_locations_textFormattingRanges___block_invoke_cold_3(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 16);
  uint64_t v5 = *a2;
  int v6 = 138412802;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_debug_impl(&dword_21C66E000, log, OS_LOG_TYPE_DEBUG, "Queue language: %@ , lang: %@ %@", (uint8_t *)&v6, 0x20u);
}

- (void)textForPrintBraille:(uint64_t)a1 language:(NSObject *)a2 mode:locations:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C66E000, a2, OS_LOG_TYPE_ERROR, "Timed out translating braille to text- %ld", (uint8_t *)&v2, 0xCu);
}

void __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21C66E000, log, OS_LOG_TYPE_ERROR, "Requested text->braille translation when no translator is loaded.", v1, 2u);
}

void __77__SCROBrailleTranslationManager_textForPrintBraille_language_mode_locations___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C66E000, v0, v1, "Requesting braille->text translation. braille:'%@' parameters:%@");
}

@end