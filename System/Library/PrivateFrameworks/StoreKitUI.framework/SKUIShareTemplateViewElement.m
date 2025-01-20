@interface SKUIShareTemplateViewElement
- (NSArray)activities;
- (id)activityForShareSheetActivityType:(id)a3;
- (id)activityForUIActivityType:(id)a3;
- (void)activities;
@end

@implementation SKUIShareTemplateViewElement

- (NSArray)activities
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIShareTemplateViewElement *)v3 activities];
      }
    }
  }
  v11 = [MEMORY[0x1E4F1CA48] array];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__SKUIShareTemplateViewElement_activities__block_invoke;
  v14[3] = &unk_1E6423570;
  id v12 = v11;
  id v15 = v12;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v14];

  return (NSArray *)v12;
}

void __42__SKUIShareTemplateViewElement_activities__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 116) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)activityForShareSheetActivityType:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIShareTemplateViewElement activityForShareSheetActivityType:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUIShareTemplateViewElement *)self activities];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = (id)[v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "activityType", (void)v20);
        if ([v18 isEqualToString:v4])
        {
          id v14 = v17;

          goto LABEL_15;
        }
      }
      id v14 = (id)[v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v14;
}

- (id)activityForUIActivityType:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIShareTemplateViewElement activityForUIActivityType:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = SKUIShareSheetActivityTypeForUIActivityType(v4);

  [(SKUIShareTemplateViewElement *)self activities];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    v17 = 0;
    uint64_t v18 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v14);
        }
        long long v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v21 = objc_msgSend(v20, "activityType", (void)v27);
        if ([v21 isEqualToString:@"*"])
        {
          id v22 = v20;

          v17 = v22;
        }
        if ([v21 isEqualToString:v13])
        {
          id v23 = v20;

          goto LABEL_19;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  else
  {
    v17 = 0;
  }
  id v23 = 0;
LABEL_19:

  if (v23) {
    v24 = v23;
  }
  else {
    v24 = v17;
  }
  id v25 = v24;

  return v25;
}

- (void)activities
{
}

- (void)activityForShareSheetActivityType:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)activityForUIActivityType:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end