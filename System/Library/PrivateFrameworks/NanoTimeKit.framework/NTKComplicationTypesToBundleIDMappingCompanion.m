@interface NTKComplicationTypesToBundleIDMappingCompanion
@end

@implementation NTKComplicationTypesToBundleIDMappingCompanion

void ___NTKComplicationTypesToBundleIDMappingCompanion_block_invoke()
{
  v0 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:59];
  v1 = _NTKBundleIDToComplicationTypesMappingCompanion();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___NTKComplicationTypesToBundleIDMappingCompanion_block_invoke_2;
  v5[3] = &unk_1E62C3F50;
  id v6 = v0;
  id v2 = v0;
  [v1 enumerateKeysAndObjectsUsingBlock:v5];

  uint64_t v3 = [v2 copy];
  v4 = (void *)_NTKComplicationTypesToBundleIDMappingCompanion_complicationTypesTobundleIDMapping;
  _NTKComplicationTypesToBundleIDMappingCompanion_complicationTypesTobundleIDMapping = v3;
}

void ___NTKComplicationTypesToBundleIDMappingCompanion_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

@end