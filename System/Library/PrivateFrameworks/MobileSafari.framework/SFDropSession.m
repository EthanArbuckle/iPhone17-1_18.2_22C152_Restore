@interface SFDropSession
@end

@implementation SFDropSession

BOOL __90___SFDropSession_dropSession_containsItemsMatching_allowedTypeIdentifiers_allowedClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (*(void (**)(uint64_t))(a1 + 32))(a2);
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __90___SFDropSession_dropSession_containsItemsMatching_allowedTypeIdentifiers_allowedClasses___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(a1 + 40), "canLoadObjectsOfClass:", *(void *)(*((void *)&v9 + 1) + 8 * v6), (void)v9))
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

@end