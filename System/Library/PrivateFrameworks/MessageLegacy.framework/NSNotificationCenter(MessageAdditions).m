@interface NSNotificationCenter(MessageAdditions)
- (uint64_t)mf_addImmediateObserver:()MessageAdditions selector:name:object:;
- (uint64_t)mf_removeObservers:()MessageAdditions;
@end

@implementation NSNotificationCenter(MessageAdditions)

- (uint64_t)mf_addImmediateObserver:()MessageAdditions selector:name:object:
{
  objc_initWeak(&location, val);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__NSNotificationCenter_MessageAdditions__mf_addImmediateObserver_selector_name_object___block_invoke;
  v12[3] = &unk_1E6867B20;
  objc_copyWeak(v13, &location);
  v13[1] = a4;
  uint64_t v10 = [a1 addObserverForName:a5 object:a6 queue:0 usingBlock:v12];
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v10;
}

- (uint64_t)mf_removeObservers:()MessageAdditions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        [a1 removeObserver:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t result = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

@end