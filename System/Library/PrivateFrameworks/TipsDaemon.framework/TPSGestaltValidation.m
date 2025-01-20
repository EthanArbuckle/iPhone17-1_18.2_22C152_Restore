@interface TPSGestaltValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSGestaltValidation

- (void)validateWithCompletion:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TPSDeviceCapabilityValidation *)self queries];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [(TPSDeviceCapabilityValidation *)self queries];
    v8 = [v7 allKeys];
    v9 = (void *)MGCopyMultipleAnswers();

    if (v9)
    {
      id v28 = v4;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v10 = [(TPSDeviceCapabilityValidation *)self queries];
      v11 = [v10 allKeys];

      id obj = v11;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v12)
      {
        uint64_t v14 = v12;
        uint64_t v15 = *(void *)v31;
        LOBYTE(v16) = 1;
        *(void *)&long long v13 = 138413058;
        long long v27 = v13;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * v17);
            v19 = objc_msgSend(v9, "objectForKeyedSubscript:", v18, v27);
            v20 = [(TPSDeviceCapabilityValidation *)self queries];
            v21 = [v20 objectForKeyedSubscript:v18];

            v22 = [MEMORY[0x1E4FAF480] targeting];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v24 = objc_opt_class();
              *(_DWORD *)buf = v27;
              v35 = v24;
              __int16 v36 = 2112;
              uint64_t v37 = v18;
              __int16 v38 = 2112;
              v39 = v19;
              __int16 v40 = 2112;
              v41 = v21;
              id v25 = v24;
              _os_log_debug_impl(&dword_1E4492000, v22, OS_LOG_TYPE_DEBUG, "%@ - checking \"%@\"...Answer: %@. Expected: %@", buf, 0x2Au);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 && ([v19 isEqual:v21])
            {
              if (v16)
              {
                uint64_t v23 = 1;
                uint64_t v16 = 1;
                if ([(TPSTargetingValidation *)self joinType] == 1) {
                  goto LABEL_22;
                }
              }
              else
              {
                uint64_t v16 = 0;
              }
            }
            else
            {
              uint64_t v23 = 0;
              uint64_t v16 = 0;
              if (![(TPSTargetingValidation *)self joinType])
              {
LABEL_22:

                uint64_t v16 = v23;
                goto LABEL_25;
              }
            }

            ++v17;
          }
          while (v14 != v17);
          uint64_t v26 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
          uint64_t v14 = v26;
        }
        while (v26);
      }
      else
      {
        uint64_t v16 = 1;
      }
LABEL_25:

      id v4 = v28;
      (*((void (**)(id, uint64_t, void))v28 + 2))(v28, v16, 0);
    }
    else
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

@end