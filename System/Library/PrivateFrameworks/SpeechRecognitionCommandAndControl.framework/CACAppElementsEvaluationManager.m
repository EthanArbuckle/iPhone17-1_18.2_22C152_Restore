@interface CACAppElementsEvaluationManager
+ (id)sharedManager;
- (BOOL)isRecognitionString:(id)a3 supportedForElement:(id)a4;
- (CACAppElementsEvaluationManager)init;
- (Class)evaluatorClassForAppIdentifier:(id)a3;
- (id)_trimmedArrayOfActionableAXElements:(id)a3;
- (id)actionableAXElementsFromAXElements:(id)a3 forAppIdentifier:(id)a4;
@end

@implementation CACAppElementsEvaluationManager

+ (id)sharedManager
{
  if (sharedManager_singletonInit_0 != -1) {
    dispatch_once(&sharedManager_singletonInit_0, &__block_literal_global_36);
  }
  v2 = (void *)sCACAppElementsEvaluationManager;
  return v2;
}

uint64_t __48__CACAppElementsEvaluationManager_sharedManager__block_invoke()
{
  sCACAppElementsEvaluationManager = objc_alloc_init(CACAppElementsEvaluationManager);
  return MEMORY[0x270F9A758]();
}

- (CACAppElementsEvaluationManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)CACAppElementsEvaluationManager;
  v2 = [(CACAppElementsEvaluationManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFFA08] set];
    appIdentifersForStandardFilter = v2->_appIdentifersForStandardFilter;
    v2->_appIdentifersForStandardFilter = (NSSet *)v3;

    uint64_t v5 = CFPreferencesCopyAppValue(@"AppElementEvaluatorOverrideClassName", @"com.apple.speech.SpeechRecognitionCommandAndControl");
    evaluatorOverrideClassName = v2->_evaluatorOverrideClassName;
    v2->_evaluatorOverrideClassName = (NSString *)v5;

    if (![(NSString *)v2->_evaluatorOverrideClassName length]
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v7 = v2->_evaluatorOverrideClassName;
      v2->_evaluatorOverrideClassName = 0;
    }
  }
  return v2;
}

- (Class)evaluatorClassForAppIdentifier:(id)a3
{
  id v4 = a3;
  evaluatorOverrideClassName = self->_evaluatorOverrideClassName;
  if (!evaluatorOverrideClassName || (Class v6 = NSClassFromString(evaluatorOverrideClassName)) == 0)
  {
    v7 = NSString;
    v8 = [v4 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
    objc_super v9 = [v7 stringWithFormat:@"CACAppElementsEvaluator_%@", v8];
    Class v6 = NSClassFromString(v9);

    if (!v6)
    {
      if ([(NSSet *)self->_appIdentifersForStandardFilter containsObject:v4]) {
        v10 = @"CACAppElementsEvaluatorStandardFilter";
      }
      else {
        v10 = @"CACAppElementsEvaluatorNoFilter";
      }
      Class v6 = NSClassFromString(&v10->isa);
    }
  }
  v11 = v6;

  return v11;
}

- (id)actionableAXElementsFromAXElements:(id)a3 forAppIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(CACAppElementsEvaluationManager *)self evaluatorClassForAppIdentifier:a4];
  v7 = objc_opt_new();
  v8 = [v7 actionableAXElementsFromAXElements:v6];
  objc_super v9 = [(CACAppElementsEvaluationManager *)self _trimmedArrayOfActionableAXElements:v8];

  v10 = CACLogElementEvaluation();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138478339;
    id v13 = v6;
    __int16 v14 = 2112;
    v15 = v7;
    __int16 v16 = 2113;
    v17 = v9;
    _os_log_debug_impl(&dword_238377000, v10, OS_LOG_TYPE_DEBUG, "Actionable elements from %{private}@ using evaluator %@ were %{private}@", (uint8_t *)&v12, 0x20u);
  }

  return v9;
}

- (id)_trimmedArrayOfActionableAXElements:(id)a3
{
  v23[3] = *MEMORY[0x263EF8340];
  id v17 = a3;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v17];
  uint64_t v4 = 0;
  uint64_t v5 = *MEMORY[0x263F21A48];
  v23[0] = *MEMORY[0x263F21A38];
  v23[1] = v5;
  v23[2] = *MEMORY[0x263F21B30];
  do
  {
    if ((unint64_t)[v3 count] < 0x97) {
      break;
    }
    id v6 = objc_opt_new();
    uint64_t v7 = [v3 count];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = v7 - 150;
      uint64_t v12 = *(void *)v19;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        __int16 v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        if ([v14 hasAnyTraits:v23[v4]])
        {
          [v6 addObject:v14];
          if (!--v11) {
            break;
          }
        }
        if (v10 == ++v13)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v10) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    if ([v6 count]) {
      [v8 removeObjectsInArray:v6];
    }
    unint64_t v15 = [v8 count];

    if (v15 < 0x97) {
      break;
    }
    ++v4;
  }
  while (v4 != 3);

  return v3;
}

- (BOOL)isRecognitionString:(id)a3 supportedForElement:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 length]) {
    goto LABEL_10;
  }
  if ([v6 hasAnyTraits:*MEMORY[0x263F21A38]])
  {
    uint64_t v7 = +[CACPreferences sharedPreferences];
    char v8 = [v7 allowLetterKeysAsTapCommands];

    if ((v8 & 1) == 0)
    {
      CFAttributedStringRef v9 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5];
      CTLineRef v10 = CTLineCreateWithAttributedString(v9);

      if (v10)
      {
        if (CTLineGetGlyphCount(v10) == 1)
        {
          uint64_t v11 = [v5 integerValue];
          CFRelease(v10);
          if (!v11) {
            goto LABEL_10;
          }
        }
        else
        {
          CFRelease(v10);
        }
      }
    }
  }
  uint64_t v12 = *MEMORY[0x263F219A8];
  if (([v6 hasAnyTraits:*MEMORY[0x263F219A8]] & 1) == 0)
  {
    int v13 = [v6 hasAnyTraits:v12] ^ 1;
    goto LABEL_12;
  }
LABEL_10:
  LOBYTE(v13) = 0;
LABEL_12:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluatorOverrideClassName, 0);
  objc_storeStrong((id *)&self->_appIdentifersForStandardFilter, 0);
}

@end