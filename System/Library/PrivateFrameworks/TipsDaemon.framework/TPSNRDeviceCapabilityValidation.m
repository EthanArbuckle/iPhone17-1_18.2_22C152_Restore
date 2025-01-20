@interface TPSNRDeviceCapabilityValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSNRDeviceCapabilityValidation

- (void)validateWithCompletion:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [MEMORY[0x1E4F79EF0] sharedInstance];
  uint64_t v6 = [v5 getActivePairedDevice];

  v34 = (void *)v6;
  if (v6)
  {
    v7 = [(TPSDeviceCapabilityValidation *)self queries];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      v32 = v4;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v9 = [(TPSDeviceCapabilityValidation *)self queries];
      v10 = [v9 allKeys];

      id obj = v10;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v47 count:16];
      if (v11)
      {
        uint64_t v13 = v11;
        uint64_t v14 = *(void *)v36;
        LOBYTE(v15) = 1;
        *(void *)&long long v12 = 138412546;
        long long v31 = v12;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * v16);
            v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
            if (v18)
            {
              v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v34, "supportsCapability:", v18));
              v20 = [(TPSDeviceCapabilityValidation *)self queries];
              v21 = [v20 objectForKeyedSubscript:v17];

              v22 = [MEMORY[0x1E4FAF480] targeting];
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                v25 = objc_opt_class();
                *(_DWORD *)buf = 138413058;
                v40 = v25;
                __int16 v41 = 2112;
                uint64_t v42 = v17;
                __int16 v43 = 2112;
                v44 = v19;
                __int16 v45 = 2112;
                v46 = v21;
                id v26 = v25;
                _os_log_debug_impl(&dword_1E4492000, v22, OS_LOG_TYPE_DEBUG, "%@ - checking \"%@\"...Answer: %@. Expected: %@", buf, 0x2Au);
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass() & 1) != 0 && ([v19 isEqual:v21])
              {
                if (v15)
                {
                  uint64_t v23 = 1;
                  uint64_t v15 = 1;
                  if ([(TPSTargetingValidation *)self joinType] == 1) {
                    goto LABEL_31;
                  }
                }
                else
                {
                  uint64_t v15 = 0;
                }
              }
              else
              {
                uint64_t v23 = 0;
                uint64_t v15 = 0;
                if (![(TPSTargetingValidation *)self joinType])
                {
LABEL_31:

LABEL_32:
                  uint64_t v15 = v23;
                  goto LABEL_33;
                }
              }
            }
            else
            {
              v24 = [MEMORY[0x1E4FAF480] targeting];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                v27 = objc_opt_class();
                *(_DWORD *)buf = v31;
                v40 = v27;
                __int16 v41 = 2112;
                uint64_t v42 = v17;
                id v28 = v27;
                _os_log_error_impl(&dword_1E4492000, v24, OS_LOG_TYPE_ERROR, "%@ - Invalid Key: %@", buf, 0x16u);
              }
              uint64_t v23 = 0;
              uint64_t v15 = 0;
              if (![(TPSTargetingValidation *)self joinType]) {
                goto LABEL_32;
              }
            }

            ++v16;
          }
          while (v13 != v16);
          uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
          uint64_t v13 = v29;
        }
        while (v29);
      }
      else
      {
        uint64_t v15 = 1;
      }
LABEL_33:

      v4 = v32;
      v32[2](v32, v15, 0);
    }
    else
    {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    v30 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[TPSNRDeviceCapabilityValidation validateWithCompletion:]((uint64_t)self, v30);
    }

    v4[2](v4, 0, 0);
  }
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "%@ - No active paired device", (uint8_t *)&v4, 0xCu);
}

@end