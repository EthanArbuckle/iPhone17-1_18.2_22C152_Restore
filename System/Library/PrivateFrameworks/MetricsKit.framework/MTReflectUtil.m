@interface MTReflectUtil
+ (BOOL)objectAsBool:(id)a3;
+ (id)mergeAndCleanDictionaries:(id)a3;
+ (id)objectAsArray:(id)a3;
+ (id)objectAsDictionary:(id)a3;
+ (id)objectAsString:(id)a3;
+ (id)removeNullValuesFromDictionary:(id)a3;
@end

@implementation MTReflectUtil

uint64_t __48__MTReflectUtil_removeNullValuesFromDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (void *)MEMORY[0x263EFF9D0];
  id v4 = a3;
  v5 = [v3 null];
  int v6 = [v4 isEqual:v5];

  return v6 ^ 1u;
}

+ (id)mergeAndCleanDictionaries:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = +[MTReflectUtil removeNullValuesFromDictionary:](MTReflectUtil, "removeNullValuesFromDictionary:", v10, (void)v13);
          [v4 addEntriesFromDictionary:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)removeNullValuesFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 keysOfEntriesPassingTest:&__block_literal_global_1];
  id v5 = [v4 allObjects];
  uint64_t v6 = [v3 dictionaryWithValuesForKeys:v5];

  return v6;
}

+ (BOOL)objectAsBool:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = v3 != 0;
  }

  return v4;
}

+ (id)objectAsString:(id)a3
{
  id v3 = (__CFString *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = &stru_26C95D008;
  }
  id v5 = v4;

  return v5;
}

+ (id)objectAsArray:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v4;

  return v5;
}

+ (id)objectAsDictionary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = (void *)MEMORY[0x263EFFA78];
  }
  id v5 = v4;

  return v5;
}

@end