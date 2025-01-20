@interface TIZhuyinPunctuationManager
+ (id)shareZhuyinPunctuationManager;
- (NSDictionary)punctuationMap;
- (id)candidatesFor:(id)a3;
@end

@implementation TIZhuyinPunctuationManager

+ (id)shareZhuyinPunctuationManager
{
  if (shareZhuyinPunctuationManager___onceToken != -1) {
    dispatch_once(&shareZhuyinPunctuationManager___onceToken, &__block_literal_global);
  }
  v2 = (void *)shareZhuyinPunctuationManager___sharedInstance;
  return v2;
}

uint64_t __59__TIZhuyinPunctuationManager_shareZhuyinPunctuationManager__block_invoke()
{
  shareZhuyinPunctuationManager___sharedInstance = objc_alloc_init(TIZhuyinPunctuationManager);
  return MEMORY[0x270F9A758]();
}

- (id)candidatesFor:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(TIZhuyinPunctuationManager *)self punctuationMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v14 = [MEMORY[0x263F7E640] candidateWithCandidate:v13 forInput:0];
        v15 = [v7 localizedStringForKey:v13 value:&stru_26F5E6580 table:@"CIMPunctuationDescription_zh_Hant"];
        [v14 setAlternativeText:v15];
        [v8 addObject:v14];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v8;
}

- (NSDictionary)punctuationMap
{
  if (punctuationMap___onceToken != -1) {
    dispatch_once(&punctuationMap___onceToken, &__block_literal_global_9);
  }
  v2 = (void *)punctuationMap___punctuationMap;
  return (NSDictionary *)v2;
}

void __44__TIZhuyinPunctuationManager_punctuationMap__block_invoke()
{
  v0 = (void *)punctuationMap___punctuationMap;
  punctuationMap___punctuationMap = (uint64_t)&unk_26F5E8F60;
}

@end