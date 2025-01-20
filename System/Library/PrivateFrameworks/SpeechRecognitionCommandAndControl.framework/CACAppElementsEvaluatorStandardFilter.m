@interface CACAppElementsEvaluatorStandardFilter
- (id)actionableAXElementsFromAXElements:(id)a3;
@end

@implementation CACAppElementsEvaluatorStandardFilter

- (id)actionableAXElementsFromAXElements:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = *MEMORY[0x263F21A48] | *MEMORY[0x263F219B8] | *MEMORY[0x263F21B68] | *MEMORY[0x263F21A40] | *MEMORY[0x263F219F8] | *MEMORY[0x263F21C30] | *MEMORY[0x263F21A38];
    *(void *)&long long v7 = 138478083;
    long long v16 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasAnyTraits:", v10, v16, (void)v17))
        {
          [v4 addObject:v12];
        }
        else
        {
          v13 = CACLogElementEvaluation();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            [v12 traits];
            uint64_t v14 = _AXTraitsAsString();
            *(_DWORD *)buf = v16;
            v22 = v12;
            __int16 v23 = 2112;
            uint64_t v24 = v14;
            _os_log_debug_impl(&dword_238377000, v13, OS_LOG_TYPE_DEBUG, "Filtering %{private}@ with traits %@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v8);
  }

  return v4;
}

@end