@interface NSError
@end

@implementation NSError

uint64_t __56__NSError_WelcomeKit__wl_encodableErrorSupportedClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  wl_encodableErrorSupportedClasses_supportedClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

void __61__NSError_WelcomeKit___wl_encodableDictionaryFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "_wl_encodableObjectFromObject:", v5);
    if (v6) {
      [*(id *)(a1 + 32) setObject:v6 forKey:v7];
    }
  }
}

void __65__NSError_WelcomeKit___wl_objectIsKindOfNonCollectionPlistClass___block_invoke()
{
  v2[5] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  uint64_t v1 = (void *)_wl_objectIsKindOfNonCollectionPlistClass__nonCollectionPlistClasses;
  _wl_objectIsKindOfNonCollectionPlistClass__nonCollectionPlistClasses = v0;
}

@end