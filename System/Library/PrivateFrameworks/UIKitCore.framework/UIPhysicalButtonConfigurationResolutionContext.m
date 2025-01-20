@interface UIPhysicalButtonConfigurationResolutionContext
@end

@implementation UIPhysicalButtonConfigurationResolutionContext

void __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(*(void **)(*(void *)(a1 + 40) + 8));
  id v4 = (id)[v2 appendObject:v3 withName:@"configurations"];

  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 16) count];
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) activeMultilinePrefix];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v11[3] = &unk_1E52D9F98;
    int8x16_t v10 = *(int8x16_t *)(a1 + 32);
    id v8 = (id)v10.i64[0];
    int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
    [v6 appendBodySectionWithName:@"configurationToInteractionMap" multilinePrefix:v7 block:v11];
  }
  else
  {
    id v9 = (id)[*(id *)(a1 + 32) appendObject:0 withName:@"configurationToInteractionMap"];
  }
}

void __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v18 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v3];
        uint64_t v5 = *(void **)(a1 + 40);
        if (v4)
        {
          v6 = NSString;
          id v7 = (objc_class *)objc_opt_class();
          id v8 = NSStringFromClass(v7);
          id v9 = [v6 stringWithFormat:@"<%@: %p>", v8, v4];

          if (v3) {
            goto LABEL_8;
          }
        }
        else
        {
          id v9 = @"(nil)";
          if (v3)
          {
LABEL_8:
            int8x16_t v10 = NSString;
            id v11 = v3;
            int8x16_t v12 = (objc_class *)objc_opt_class();
            v13 = NSStringFromClass(v12);
            v14 = [v10 stringWithFormat:@"<%@: %p>", v13, v11];

            goto LABEL_11;
          }
        }
        v14 = @"(nil)";
LABEL_11:
        id v15 = (id)[v5 appendObject:v9 withName:v14];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v18);
  }
}

@end