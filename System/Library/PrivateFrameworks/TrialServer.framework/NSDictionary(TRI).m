@interface NSDictionary(TRI)
+ (void)triKeys:()TRI values:fromDictionary:;
- (id)triObjectForExpectedKey:()TRI;
- (uint64_t)triKeys:()TRI values:;
@end

@implementation NSDictionary(TRI)

- (id)triObjectForExpectedKey:()TRI
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 objectForKeyedSubscript:v4];
  if (!v5)
  {
    v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Value missing for key %@", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

+ (void)triKeys:()TRI values:fromDictionary:
{
  id v7 = a5;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  id v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__NSDictionary_TRI__triKeys_values_fromDictionary___block_invoke;
  v8[3] = &unk_1E6BB8B30;
  v8[4] = &v15;
  v8[5] = &v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];
  if (a3) {
    *a3 = (id) v16[5];
  }
  if (a4) {
    *a4 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (uint64_t)triKeys:()TRI values:
{
  return [MEMORY[0x1E4F1C9E8] triKeys:a3 values:a4 fromDictionary:a1];
}

@end