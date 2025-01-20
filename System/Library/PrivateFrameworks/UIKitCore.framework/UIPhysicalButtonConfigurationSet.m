@interface UIPhysicalButtonConfigurationSet
@end

@implementation UIPhysicalButtonConfigurationSet

void __71___UIPhysicalButtonConfigurationSet__initWithConfigurationsDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v10 = [v4 objectForKey:v5];

  v6 = v10;
  if (v10)
  {
    v7 = *(void **)(*(void *)(a1 + 40) + 8);
    v8 = (void *)[v10 copy];
    v9 = [NSNumber numberWithUnsignedInteger:a2];
    [v7 setObject:v8 forKey:v9];

    v6 = v10;
  }
}

void __71___UIPhysicalButtonConfigurationSet__enumerateConfigurationsWithBlock___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  v5 = *(void **)(a1[4] + 8);
  v6 = [NSNumber numberWithUnsignedInteger:a2];
  id v8 = [v5 objectForKey:v6];

  v7 = v8;
  if (v8)
  {
    (*(void (**)(void))(a1[5] + 16))();
    v7 = v8;
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      *a3 = 1;
    }
  }
}

uint64_t __147___UIPhysicalButtonConfigurationSet__validateRequirementsForCandidateButton_andConfiguration_allowingNilRequiredConfiguration_withOutErrorMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v7), "unsignedIntegerValue", (void)v15);
        if (v8 != *(void *)(a1 + 56))
        {
          uint64_t v9 = [*(id *)(a1 + 32) _configurationForButton:v8];
          if (v9)
          {
            uint64_t v10 = *(void *)(a1 + 40);
            if (v10 != v9
              && (!v10
               || *(void *)(v9 + 24) != *(void *)(v10 + 24)
               || *(unsigned __int8 *)(v9 + 8) != *(unsigned __int8 *)(v10 + 8)))
            {
LABEL_18:
              uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
              v13 = *(void **)(v12 + 40);
              *(void *)(v12 + 40) = v9;

              uint64_t v11 = 1;
              goto LABEL_19;
            }
          }
          else if (!*(unsigned char *)(a1 + 64))
          {
            goto LABEL_18;
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_19:

  return v11;
}

void __56___UIPhysicalButtonConfigurationSet_initWithBSXPCCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) <= 4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) decodeObjectOfClass:*(void *)(a1 + 48) forKey:off_1E5311180[a2 - 1]];
    if (v5)
    {
      id v11 = v5;
      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v6)
      {
        uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      uint64_t v10 = [NSNumber numberWithUnsignedInteger:a2];
      [v6 setObject:v11 forKey:v10];

      uint64_t v5 = v11;
    }
  }
}

uint64_t __58___UIPhysicalButtonConfigurationSet_encodeWithBSXPCCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _button];
  if ((unint64_t)(result - 1) <= 4)
  {
    uint64_t v5 = off_1E5311180[result - 1];
    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 encodeObject:a2 forKey:v5];
  }
  return result;
}

uint64_t __57___UIPhysicalButtonConfigurationSet__nsSetRepresentation__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __63___UIPhysicalButtonConfigurationSet__configurationPassingTest___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) withName:@"pauseButtonRequirementValidation" ifEqualTo:1];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v7[3] = &unk_1E52D9F98;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  [v3 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];
}

void __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v2[3] = &unk_1E53110C0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _enumerateConfigurationsWithBlock:v2];
}

void __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  _NSStringFromUIPhysicalButton([a2 _button]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (id)[v3 appendObject:a2 withName:v5];
}

uint64_t __53___UIPhysicalButtonConfigurationSet_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _button];
  if ((unint64_t)(result - 1) <= 4)
  {
    id v5 = off_1E5311180[result - 1];
    int8x16_t v6 = *(void **)(a1 + 32);
    return [v6 encodeObject:a2 forKey:v5];
  }
  return result;
}

void __51___UIPhysicalButtonConfigurationSet_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) <= 4)
  {
    id v5 = [*(id *)(a1 + 32) decodeObjectOfClass:*(void *)(a1 + 48) forKey:off_1E5311180[a2 - 1]];
    if (v5)
    {
      id v11 = v5;
      int8x16_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v6)
      {
        uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        int8x16_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      uint64_t v10 = [NSNumber numberWithUnsignedInteger:a2];
      [v6 setObject:v11 forKey:v10];

      id v5 = v11;
    }
  }
}

uint64_t __61___UIPhysicalButtonConfigurationSet_encodeWithXPCDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _button];
  if ((unint64_t)(result - 1) <= 4)
  {
    [(__CFString *)off_1E5311180[result - 1] UTF8String];
    return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  return result;
}

void __59___UIPhysicalButtonConfigurationSet_initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) <= 4)
  {
    [(__CFString *)off_1E5311180[a2 - 1] UTF8String];
    id v5 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
    if (v5)
    {
      id v11 = v5;
      int8x16_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v6)
      {
        uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        int8x16_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      uint64_t v10 = [NSNumber numberWithUnsignedInteger:a2];
      [v6 setObject:v11 forKey:v10];

      id v5 = v11;
    }
  }
}

@end