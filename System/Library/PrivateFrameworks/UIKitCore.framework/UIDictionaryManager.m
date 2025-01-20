@interface UIDictionaryManager
@end

@implementation UIDictionaryManager

uint64_t __56___UIDictionaryManager__downloadDictionaryAssetCatalog___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_Uidictionaryma.isa, a2);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __59___UIDictionaryManager__allAvailableDefinitionDictionaries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 definitionLanguage];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  v9 = [v6 definitionLanguage];
  int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

  if (!v8 || v10)
  {
    if ((v8 | v10 ^ 1) == 1)
    {
      uint64_t v12 = [v6 localizedLanguageName];
      if (v12) {
        v13 = (__CFString *)v12;
      }
      else {
        v13 = &stru_1ED0E84C0;
      }
      v14 = [v5 localizedLanguageName];
      uint64_t v11 = [v14 localizedStandardCompare:v13];
    }
    else
    {
      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v11 = -1;
  }

  return v11;
}

uint64_t __59___UIDictionaryManager__allAvailableDefinitionDictionaries__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 assetIsLocal];
}

@end