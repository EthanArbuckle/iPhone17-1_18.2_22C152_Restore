@interface UISupplementalLexicon
@end

@implementation UISupplementalLexicon

void __80___UISupplementalLexicon_initWithItems_searchPrefixes_andTISupplementalLexicon___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
        v7 = supplementalItemMap();
        v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "_identifier", (void)v9));
        [v7 setObject:v6 forKey:v8];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

void __57___UISupplementalLexicon_initWithRTISupplementalLexicon___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  v6 = [v5 data];

  if (v6)
  {
    v7 = [v5 dataType];
    int v8 = [v7 isEqualToString:@"CodedUIImage"];

    if (v8)
    {
      long long v9 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v10 = objc_opt_class();
      long long v11 = [v5 data];
      v6 = [v9 unarchivedObjectOfClass:v10 fromData:v11 error:0];
    }
    else
    {
      v6 = 0;
    }
  }
  long long v12 = +[_UISupplementalItem _uiSupplementalItemWithTISupplementalItem:v13 icon:v6];
  if (v12) {
    [*(id *)(a1 + 32) addObject:v12];
  }
}

void __33___UISupplementalLexicon_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v12 + 1) + 8 * v5);
        v7 = supplementalItemMap();
        int v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "_identifier", (void)v12));
        long long v9 = [v7 objectForKey:v8];

        if (v9 == v6)
        {
          uint64_t v10 = supplementalItemMap();
          long long v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "_identifier"));
          [v10 removeObjectForKey:v11];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

@end