@interface PK
@end

@implementation PK

void __33__PK_ipp_attribute_t_loggingDict__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_msgSend(v5, "loggingValue:", objc_msgSend(*(id *)(a1 + 32), "value_tag"));
  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = @"<nil for value tag>";
  }
  [*(id *)(a1 + 40) addObject:v4];
}

uint64_t __38__PK_ipp_attribute_t_enumerateValues___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __33__PK_ipp_t_userCodableDictionary__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 loggingDict];
  objc_msgSend(v2, "addObject:");
}

uint64_t __32__PK_ipp_t_enumerateAttributes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__PK_ipp_t_replaceOrAddAttribute_withAttribute_settingGroup___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __39__PK_ipp_t__addRange_name_lower_upper___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__PK_ipp_t__addRange_name_lower_upper___block_invoke_2;
  v3[3] = &__block_descriptor_40_e24_v16__0__PK_ipp_value_t_8l;
  v3[4] = *(void *)(a1 + 32);
  return [a2 withNewEmptyValue:v3];
}

uint64_t __39__PK_ipp_t__addRange_name_lower_upper___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  return [a2 setRange:&v3];
}

void __35__PK_ipp_t__addRanges_name_values___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__PK_ipp_t__addRanges_name_values___block_invoke_2;
  v6[3] = &unk_2649EC0C0;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __35__PK_ipp_t__addRanges_name_values___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 rangeValue];
  int v5 = v4 + 1;
  int v7 = v4 + v6;
  v8 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3321888768;
  v9[2] = __35__PK_ipp_t__addRanges_name_values___block_invoke_3;
  v9[3] = &__block_descriptor_40_ea8_32c23_ZTS17ipp_value_range_t_e24_v16__0__PK_ipp_value_t_8l;
  int v10 = v5;
  int v11 = v7;
  [v8 withNewEmptyValue:v9];
}

uint64_t __35__PK_ipp_t__addRanges_name_values___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  return [a2 setRange:&v3];
}

uint64_t __35__PK_ipp_t__addBoolean_name_value___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__PK_ipp_t__addBoolean_name_value___block_invoke_2;
  v3[3] = &__block_descriptor_33_e24_v16__0__PK_ipp_value_t_8l;
  char v4 = *(unsigned char *)(a1 + 32);
  return [a2 withNewEmptyValue:v3];
}

uint64_t __35__PK_ipp_t__addBoolean_name_value___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setBoolean:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __44__PK_ipp_t__addInteger_valueTag_name_value___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__PK_ipp_t__addInteger_valueTag_name_value___block_invoke_2;
  v3[3] = &__block_descriptor_36_e24_v16__0__PK_ipp_value_t_8l;
  int v4 = *(_DWORD *)(a1 + 32);
  return [a2 withNewEmptyValue:v3];
}

uint64_t __44__PK_ipp_t__addInteger_valueTag_name_value___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setInteger:*(unsigned int *)(a1 + 32)];
}

void __50__PK_ipp_t__addStrings_valueTag_name_lang_values___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(NSString **)(*((void *)&v19 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        if (v8) {
          id v9 = v8;
        }
        int v10 = *(_DWORD *)(a1 + 48);
        if (v10 == 72)
        {
          ipp_lang_code(v7);
          int v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else if (v10 == 71)
        {
          int v11 = [(NSString *)v7 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
        }
        else
        {
          int v11 = v7;
        }
        v12 = v11;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3321888768;
        v16[2] = __50__PK_ipp_t__addStrings_valueTag_name_lang_values___block_invoke_2;
        v16[3] = &__block_descriptor_48_ea8_32c24_ZTS18ipp_value_string_t_e24_v16__0__PK_ipp_value_t_8l;
        id v13 = v8;
        id v17 = v13;
        v14 = v12;
        v18 = v14;
        [v3 withNewEmptyValue:v16];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }
}

void __50__PK_ipp_t__addStrings_valueTag_name_lang_values___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "setString:", v3, v4);
  }
  else
  {
  }
}

void __38__PK_ipp_t__addCollection_name_value___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__PK_ipp_t__addCollection_name_value___block_invoke_2;
  v3[3] = &unk_2649EC1B8;
  id v4 = *(id *)(a1 + 32);
  [a2 withNewEmptyValue:v3];
}

uint64_t __38__PK_ipp_t__addCollection_name_value___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setCollection:*(void *)(a1 + 32)];
}

uint64_t __47__PK_ipp_t__addResolution_name_unit_xres_yres___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__PK_ipp_t__addResolution_name_unit_xres_yres___block_invoke_2;
  v3[3] = &__block_descriptor_44_e24_v16__0__PK_ipp_value_t_8l;
  void v3[4] = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 40);
  return [a2 withNewEmptyValue:v3];
}

uint64_t __47__PK_ipp_t__addResolution_name_unit_xres_yres___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setResolution:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t __45__PK_ipp_t__addOctetString_name_data_length___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__PK_ipp_t__addOctetString_name_data_length___block_invoke_2;
  v3[3] = &__block_descriptor_44_e24_v16__0__PK_ipp_value_t_8l;
  void v3[4] = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 40);
  return [a2 withNewEmptyValue:v3];
}

void __45__PK_ipp_t__addOctetString_name_data_length___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a1 + 32) length:*(int *)(a1 + 40)];
  [v4 setUnknown:v3];
}

void __51__PK_ipp_t__addIntegers_valueTag_name_count_adder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    unint64_t v4 = 0;
    uint64_t v5 = MEMORY[0x263EF8330];
    do
    {
      v6[0] = v5;
      v6[1] = 3221225472;
      v6[2] = __51__PK_ipp_t__addIntegers_valueTag_name_count_adder___block_invoke_2;
      v6[3] = &unk_2649EC220;
      id v7 = *(id *)(a1 + 32);
      int v8 = v4;
      [v3 withNewEmptyValue:v6];

      ++v4;
    }
    while (*(void *)(a1 + 40) > v4);
  }
}

void __51__PK_ipp_t__addIntegers_valueTag_name_count_adder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setInteger:(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))()];
}

void __37__PK_ipp_t__findAttribute0_valueTag___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v11 = a2;
  int v6 = [v11 name];
  *a3 = [v6 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;

  if (*a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    if (*(_DWORD *)(a1 + 48))
    {
      int v7 = objc_msgSend(v11, "value_tag");
      int v8 = *(_DWORD *)(a1 + 48);
      if (v7 != v8 && (v7 != 53 || v8 != 65) && (v7 != 65 || v8 != 53))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        int v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = 0;
      }
    }
  }
}

void __39__PK_ipp_collection_t_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    unint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 loggingDict];
    [v4 addObject:v5];
  }
  else
  {
    uint64_t v6 = [v3 name];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

@end