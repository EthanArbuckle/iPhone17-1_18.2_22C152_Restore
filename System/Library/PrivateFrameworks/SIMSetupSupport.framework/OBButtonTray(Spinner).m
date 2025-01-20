@interface OBButtonTray(Spinner)
- (id)_hide;
- (uint64_t)_containsButton:()Spinner;
- (uint64_t)_containsSSOBBoldTrayButton;
- (void)_show:()Spinner;
@end

@implementation OBButtonTray(Spinner)

- (id)_hide
{
  v2 = [a1 buttons];
  v3 = (void *)[v2 copy];

  [a1 removeAllButtons];
  return v3;
}

- (void)_show:()Spinner
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [a1 addButton:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (uint64_t)_containsSSOBBoldTrayButton
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "buttons", 0, 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)_containsButton:()Spinner
{
  id v4 = a3;
  uint64_t v5 = [a1 buttons];
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

@end