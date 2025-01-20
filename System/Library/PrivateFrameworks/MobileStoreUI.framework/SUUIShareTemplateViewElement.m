@interface SUUIShareTemplateViewElement
- (NSArray)activities;
- (id)activityForShareSheetActivityType:(id)a3;
- (id)activityForUIActivityType:(id)a3;
@end

@implementation SUUIShareTemplateViewElement

- (NSArray)activities
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SUUIShareTemplateViewElement_activities__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __42__SUUIShareTemplateViewElement_activities__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 116) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)activityForShareSheetActivityType:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SUUIShareTemplateViewElement *)self activities];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "activityType", (void)v12);
        if ([v10 isEqualToString:v4])
        {
          id v6 = v9;

          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)activityForUIActivityType:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = SUUIShareSheetActivityTypeForUIActivityType(a3);
  [(SUUIShareTemplateViewElement *)self activities];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "activityType", (void)v18);
        if ([v12 isEqualToString:@"*"])
        {
          id v13 = v11;

          v8 = v13;
        }
        if ([v12 isEqualToString:v4])
        {
          id v14 = v11;

          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    v8 = 0;
  }
  id v14 = 0;
LABEL_15:

  if (v14) {
    long long v15 = v14;
  }
  else {
    long long v15 = v8;
  }
  id v16 = v15;

  return v16;
}

@end