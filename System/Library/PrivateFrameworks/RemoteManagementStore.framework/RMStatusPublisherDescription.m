@interface RMStatusPublisherDescription
+ (id)descriptionWithEventsDictionary:(id)a3;
+ (id)descriptionWithServiceDictionary:(id)a3;
- (BOOL)_validateStatusEvents:(id)a3;
- (BOOL)_validateStatusKeysByNotification:(id)a3;
- (BOOL)_validateStatusKeysWithoutNotification:(id)a3;
- (NSDictionary)statusKeysByXPCEvent;
- (NSSet)statusKeys;
- (RMStatusPublisherDescription)initWithDictionary:(id)a3;
- (void)_loadDescription:(id)a3;
- (void)_loadDescriptionFromStatusEvents:(id)a3 statusKeysByNotification:(id)a4 statusKeysWithoutNotification:(id)a5;
@end

@implementation RMStatusPublisherDescription

+ (id)descriptionWithEventsDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"StatusPublisher"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = [RMStatusPublisherDescription alloc];
  if (isKindOfClass) {
    v6 = v3;
  }
  else {
    v6 = (void *)MEMORY[0x263EFFA78];
  }
  v7 = [(RMStatusPublisherDescription *)v5 initWithDictionary:v6];

  return v7;
}

+ (id)descriptionWithServiceDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"StatusPublisher"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = [RMStatusPublisherDescription alloc];
  if (isKindOfClass) {
    v6 = v3;
  }
  else {
    v6 = (void *)MEMORY[0x263EFFA78];
  }
  v7 = [(RMStatusPublisherDescription *)v5 initWithDictionary:v6];

  return v7;
}

- (RMStatusPublisherDescription)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RMStatusPublisherDescription;
  v5 = [(RMStatusPublisherDescription *)&v10 init];
  v6 = v5;
  if (v5)
  {
    statusKeysByXPCEvent = v5->_statusKeysByXPCEvent;
    v5->_statusKeysByXPCEvent = 0;

    statusKeys = v6->_statusKeys;
    v6->_statusKeys = 0;

    [(RMStatusPublisherDescription *)v6 _loadDescription:v4];
  }

  return v6;
}

- (void)_loadDescription:(id)a3
{
  id v4 = a3;
  id v7 = [v4 objectForKeyedSubscript:@"StatusEvents"];
  v5 = [v4 objectForKeyedSubscript:@"StatusKeysByNotification"];
  v6 = [v4 objectForKeyedSubscript:@"StatusKeysWithoutNotification"];

  if ([(RMStatusPublisherDescription *)self _validateStatusEvents:v7]
    && [(RMStatusPublisherDescription *)self _validateStatusKeysByNotification:v5]&& [(RMStatusPublisherDescription *)self _validateStatusKeysWithoutNotification:v6])
  {
    [(RMStatusPublisherDescription *)self _loadDescriptionFromStatusEvents:v7 statusKeysByNotification:v5 statusKeysWithoutNotification:v6];
  }
}

- (void)_loadDescriptionFromStatusEvents:(id)a3 statusKeysByNotification:(id)a4 statusKeysWithoutNotification:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  v12 = objc_opt_new();
  if (v8)
  {
    id v27 = v10;
    v28 = self;
    id v29 = v9;
    id v30 = v8;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v8;
    uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v18 = [v17 objectForKeyedSubscript:@"XPCEvents"];
          v19 = (void *)MEMORY[0x263EFFA08];
          v20 = [v17 objectForKeyedSubscript:@"StatusItems"];
          v21 = [v19 setWithArray:v20];

          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke;
          v35[3] = &unk_26548FBC8;
          id v36 = v11;
          id v37 = v21;
          id v22 = v21;
          [v18 enumerateKeysAndObjectsUsingBlock:v35];
          [v12 unionSet:v22];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v14);
    }

    id v9 = v29;
    id v8 = v30;
    id v10 = v27;
    self = v28;
  }
  if (v9)
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke_3;
    v32[3] = &unk_26548F7A8;
    id v33 = v11;
    id v34 = v12;
    [v9 enumerateKeysAndObjectsUsingBlock:v32];
  }
  if (v10) {
    [v12 addObjectsFromArray:v10];
  }
  if ([v11 count])
  {
    v23 = (NSDictionary *)[v11 copy];
    statusKeysByXPCEvent = self->_statusKeysByXPCEvent;
    self->_statusKeysByXPCEvent = v23;
  }
  if ([v12 count])
  {
    v25 = (NSSet *)[v12 copy];
    statusKeys = self->_statusKeys;
    self->_statusKeys = v25;
  }
}

void __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke_2;
  v7[3] = &unk_26548FBA0;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (id)[MEMORY[0x263F635E0] newXPCEventForStream:*(void *)(a1 + 32) notificationName:a2 descriptor:a3];
  [*(id *)(a1 + 40) setObject:*(void *)(a1 + 48) forKeyedSubscript:v4];
}

void __120__RMStatusPublisherDescription__loadDescriptionFromStatusEvents_statusKeysByNotification_statusKeysWithoutNotification___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F635E0];
  id v6 = a3;
  id v8 = (id)[v5 newXPCEventForDarwinNotification:a2];
  id v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];

  [*(id *)(a1 + 40) addObjectsFromArray:v6];
}

- (BOOL)_validateStatusEvents:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v52 objects:v59 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v53;
        long long v39 = v4;
        uint64_t v34 = *(void *)v53;
        while (2)
        {
          uint64_t v7 = 0;
          uint64_t v35 = v5;
          do
          {
            if (*(void *)v53 != v6) {
              objc_enumerationMutation(v4);
            }
            id v8 = *(void **)(*((void *)&v52 + 1) + 8 * v7);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v9 = [MEMORY[0x263F635B0] statusPublisherDescription];
              if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
                -[RMStatusPublisherDescription _validateStatusEvents:]();
              }
              goto LABEL_50;
            }
            id v9 = [v8 objectForKeyedSubscript:@"XPCEvents"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v10 = [MEMORY[0x263F635B0] statusPublisherDescription];
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
                -[RMStatusPublisherDescription _validateStatusEvents:].cold.5();
              }
LABEL_45:

              goto LABEL_50;
            }
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v10 = [v9 allValues];
            uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v58 count:16];
            uint64_t v36 = v7;
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v49;
              id v37 = v9;
              long long v38 = v10;
              uint64_t v33 = *(void *)v49;
              while (2)
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v49 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v16 = [MEMORY[0x263F635B0] statusPublisherDescription];
                    id v4 = v39;
                    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                      -[RMStatusPublisherDescription _validateStatusEvents:].cold.4();
                    }
                    id v9 = v37;
LABEL_44:

                    goto LABEL_45;
                  }
                  long long v46 = 0u;
                  long long v47 = 0u;
                  long long v44 = 0u;
                  long long v45 = 0u;
                  v16 = [v15 allValues];
                  uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v57 count:16];
                  if (v17)
                  {
                    uint64_t v18 = v17;
                    uint64_t v19 = *(void *)v45;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v18; ++j)
                      {
                        if (*(void *)v45 != v19) {
                          objc_enumerationMutation(v16);
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          id v29 = [MEMORY[0x263F635B0] statusPublisherDescription];
                          id v4 = v39;
                          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                            -[RMStatusPublisherDescription _validateStatusEvents:]();
                          }

                          id v9 = v37;
                          id v10 = v38;
                          goto LABEL_44;
                        }
                      }
                      uint64_t v18 = [v16 countByEnumeratingWithState:&v44 objects:v57 count:16];
                      if (v18) {
                        continue;
                      }
                      break;
                    }
                  }

                  id v10 = v38;
                  uint64_t v13 = v33;
                }
                uint64_t v12 = [v38 countByEnumeratingWithState:&v48 objects:v58 count:16];
                id v9 = v37;
                if (v12) {
                  continue;
                }
                break;
              }
            }

            v21 = [v8 objectForKeyedSubscript:@"StatusItems"];
            objc_opt_class();
            id v4 = v39;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v32 = [MEMORY[0x263F635B0] statusPublisherDescription];
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                -[RMStatusPublisherDescription _validateStatusEvents:]();
              }

LABEL_50:
              goto LABEL_51;
            }
            id v22 = v9;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            id v23 = v21;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v56 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v41;
              while (2)
              {
                for (uint64_t k = 0; k != v25; ++k)
                {
                  if (*(void *)v41 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    id v30 = [MEMORY[0x263F635B0] statusPublisherDescription];
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                      -[RMStatusPublisherDescription _validateStatusEvents:]();
                    }

                    id v9 = v22;
                    goto LABEL_50;
                  }
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v56 count:16];
                if (v25) {
                  continue;
                }
                break;
              }
            }

            uint64_t v7 = v36 + 1;
            uint64_t v6 = v34;
          }
          while (v36 + 1 != v35);
          uint64_t v5 = [v39 countByEnumeratingWithState:&v52 objects:v59 count:16];
          BOOL v28 = 1;
          if (v5) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v28 = 1;
      }
    }
    else
    {
      id v4 = [MEMORY[0x263F635B0] statusPublisherDescription];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[RMStatusPublisherDescription _validateStatusEvents:]();
      }
LABEL_51:
      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 1;
  }

  return v28;
}

- (BOOL)_validateStatusKeysByNotification:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v4 = [v3 allValues];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v24;
        uint64_t v18 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v24 != v7) {
              objc_enumerationMutation(v4);
            }
            id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v10 = [MEMORY[0x263F635B0] statusPublisherDescription];
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
                -[RMStatusPublisherDescription _validateStatusEvents:]();
              }
LABEL_26:

              goto LABEL_27;
            }
            long long v21 = 0u;
            long long v22 = 0u;
            long long v19 = 0u;
            long long v20 = 0u;
            id v10 = v9;
            uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v20;
              while (2)
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v20 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v16 = [MEMORY[0x263F635B0] statusPublisherDescription];
                    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                      -[RMStatusPublisherDescription _validateStatusEvents:]();
                    }

                    goto LABEL_26;
                  }
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }

            uint64_t v7 = v18;
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
          BOOL v15 = 1;
          if (v6) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v15 = 1;
      }
    }
    else
    {
      id v4 = [MEMORY[0x263F635B0] statusPublisherDescription];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[RMStatusPublisherDescription _validateStatusEvents:]();
      }
LABEL_27:
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)_validateStatusKeysWithoutNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v10 = objc_msgSend(MEMORY[0x263F635B0], "statusPublisherDescription", v12);
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
                -[RMStatusPublisherDescription _validateStatusEvents:]();
              }

              goto LABEL_18;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          BOOL v9 = 1;
          if (v6) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v9 = 1;
      }
    }
    else
    {
      id v4 = [MEMORY[0x263F635B0] statusPublisherDescription];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[RMStatusPublisherDescription _validateStatusEvents:]();
      }
LABEL_18:
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (NSDictionary)statusKeysByXPCEvent
{
  return self->_statusKeysByXPCEvent;
}

- (NSSet)statusKeys
{
  return self->_statusKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusKeys, 0);
  objc_storeStrong((id *)&self->_statusKeysByXPCEvent, 0);
}

- (void)_validateStatusEvents:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Invalid status publisher description: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_validateStatusEvents:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Invalid status publisher Items description: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_validateStatusEvents:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Invalid status publisher XPCEvent notification description: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_validateStatusEvents:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Invalid status publisher XPCEvent item description: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_validateStatusEvents:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Invalid status publisher XPCEvents description: %{public}@", v2, v3, v4, v5, v6);
}

@end