@interface NSArray(FormField)
- (id)_fieldsOfSource:()FormField;
- (id)_fieldsOfType:()FormField;
- (id)_flattenedFields;
- (id)_nonFieldRegions;
@end

@implementation NSArray(FormField)

- (id)_flattenedFields
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v8 = &unk_1F3946040;
        id v9 = v7;
        if (objc_msgSend(v9, "conformsToProtocol:", v8, (void)v15)) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }

        if (v10)
        {
          v11 = CRCastAsClass<CROutputRegion>(v10);
          if (v11 && ![v10 fieldType])
          {
            v12 = [v11 formFieldRegions];
            v13 = [v12 _flattenedFields];
            [v2 addObjectsFromArray:v13];
          }
          else
          {
            [v2 addObject:v10];
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)_fieldsOfSource:()FormField
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__NSArray_FormField___fieldsOfSource___block_invoke;
  v7[3] = &__block_descriptor_40_e49_B24__0___CRFormFieldProviding__8__NSDictionary_16l;
  v7[4] = a3;
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:v7];
  uint64_t v5 = [a1 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)_fieldsOfType:()FormField
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__NSArray_FormField___fieldsOfType___block_invoke;
  v7[3] = &__block_descriptor_40_e49_B24__0___CRFormFieldProviding__8__NSDictionary_16l;
  v7[4] = a3;
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:v7];
  uint64_t v5 = [a1 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)_nonFieldRegions
{
  v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_132];
  id v3 = [a1 filteredArrayUsingPredicate:v2];

  return v3;
}

@end