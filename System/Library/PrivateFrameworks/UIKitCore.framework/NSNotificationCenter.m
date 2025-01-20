@interface NSNotificationCenter
+ (id)uikitInternalCenter;
- (void)_uiRemoveObserver:(void *)a3 names:;
@end

@implementation NSNotificationCenter

+ (id)uikitInternalCenter
{
  self;
  if (qword_1EB262420 != -1) {
    dispatch_once(&qword_1EB262420, &__block_literal_global_452);
  }
  v0 = (void *)_MergedGlobals_1195;
  return v0;
}

- (void)_uiRemoveObserver:(void *)a3 names:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [a1 removeObserver:v5 name:*(void *)(*((void *)&v12 + 1) + 8 * v11++) object:0];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

void __59__NSNotificationCenter_UIKitAdditions__uikitInternalCenter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EB8]);
  v1 = (void *)_MergedGlobals_1195;
  _MergedGlobals_1195 = (uint64_t)v0;
}

void __51__NSNotificationCenter_UIKitAdditions__uikitCenter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EB8]);
  v1 = (void *)qword_1EB262428;
  qword_1EB262428 = (uint64_t)v0;
}

@end