@interface TIKeyboardCandidate(UIKitSupplementalItemExtras)
- (BOOL)ui_hasSupplementalItems;
- (id)ui_supplementalItems;
@end

@implementation TIKeyboardCandidate(UIKitSupplementalItemExtras)

- (BOOL)ui_hasSupplementalItems
{
  v1 = [a1 supplementalItemIdentifiers];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (id)ui_supplementalItems
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "ui_hasSupplementalItems"))
  {
    BOOL v2 = [a1 supplementalItemIdentifiers];
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = supplementalItem(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "unsignedLongLongValue", (void)v11));
          if (v9) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

@end