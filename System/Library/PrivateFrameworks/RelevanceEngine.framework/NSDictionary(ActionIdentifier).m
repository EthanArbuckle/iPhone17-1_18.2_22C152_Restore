@interface NSDictionary(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation NSDictionary(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v1);
        }
        v7 = objc_msgSend(v1, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
        if (objc_opt_respondsToSelector()) {
          v4 ^= objc_msgSend(v7, "re_actionIdentifierHashValue");
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end