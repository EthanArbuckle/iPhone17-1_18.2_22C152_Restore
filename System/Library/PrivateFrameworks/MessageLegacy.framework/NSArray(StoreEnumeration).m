@interface NSArray(StoreEnumeration)
- (uint64_t)mf_enumerateByStoreUsingBlock:()StoreEnumeration;
@end

@implementation NSArray(StoreEnumeration)

- (uint64_t)mf_enumerateByStoreUsingBlock:()StoreEnumeration
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"MailMessageStore.m", 64, @"Invalid parameter not satisfying: %@", @"block");
  }
  v5 = objc_msgSend(a1, "mf_dictionaryWithMessagesSortedByStore");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = (void *)[v5 allKeys];
  uint64_t result = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(uint64_t, void, uint64_t))(a3 + 16))(a3, *(void *)(*((void *)&v11 + 1) + 8 * v10), [v5 objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v10)]);
        ++v10;
      }
      while (v8 != v10);
      uint64_t result = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v8 = result;
    }
    while (result);
  }
  return result;
}

@end