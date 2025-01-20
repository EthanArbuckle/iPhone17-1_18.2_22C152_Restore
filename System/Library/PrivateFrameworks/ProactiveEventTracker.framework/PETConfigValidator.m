@interface PETConfigValidator
+ (BOOL)_groupConfigIsValid:(id)a3;
+ (BOOL)_messageConfigIsValid:(id)a3;
+ (BOOL)configIsValid:(id)a3;
@end

@implementation PETConfigValidator

+ (BOOL)_messageConfigIsValid:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"device_sampling"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of device sampling!", buf, 2u);
    }
    BOOL v28 = 0;
  }
  else
  {
    v5 = [v3 objectForKeyedSubscript:@"device_sampling_seed"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of seed device sampling!", buf, 2u);
      }
      BOOL v28 = 0;
    }
    else
    {
      v6 = [v3 objectForKeyedSubscript:@"message_sampling"];
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of message sampling!", buf, 2u);
        }
        BOOL v28 = 0;
      }
      else
      {
        v7 = [v3 objectForKeyedSubscript:@"sig_figs"];
        if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of sig figs!", buf, 2u);
          }
          BOOL v28 = 0;
        }
        else
        {
          v8 = [v3 objectForKeyedSubscript:@"aggregated"];
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of aggregated!", buf, 2u);
            }
            BOOL v28 = 0;
          }
          else
          {
            v9 = [v3 objectForKeyedSubscript:@"field_whitelist"];
            if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of field whitelist!", buf, 2u);
              }
              BOOL v28 = 0;
            }
            else
            {
              v34 = v8;
              v35 = v7;
              v36 = v9;
              long long v45 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              id v10 = v9;
              uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v52 count:16];
              if (v11)
              {
                uint64_t v12 = v11;
                uint64_t v13 = *(void *)v46;
                while (2)
                {
                  for (uint64_t i = 0; i != v12; ++i)
                  {
                    if (*(void *)v46 != v13) {
                      objc_enumerationMutation(v10);
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of field in field whitelist!", buf, 2u);
                      }
                      BOOL v28 = 0;
                      id v15 = v10;
                      goto LABEL_62;
                    }
                  }
                  uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v52 count:16];
                  if (v12) {
                    continue;
                  }
                  break;
                }
              }

              id v15 = [v3 objectForKeyedSubscript:@"hist_buckets"];
              if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of histogram buckets!", buf, 2u);
                }
                BOOL v28 = 0;
LABEL_62:
                v8 = v34;
                v7 = v35;
              }
              else
              {
                v32 = v6;
                long long v41 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                long long v44 = 0u;
                id v15 = v15;
                uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v51 count:16];
                if (v16)
                {
                  uint64_t v17 = v16;
                  uint64_t v18 = *(void *)v42;
                  while (2)
                  {
                    v19 = v15;
                    for (uint64_t j = 0; j != v17; ++j)
                    {
                      if (*(void *)v42 != v18) {
                        objc_enumerationMutation(v19);
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of bucket in histogram buckets!", buf, 2u);
                        }
                        BOOL v28 = 0;
                        id v15 = v19;
                        v29 = v19;
                        v8 = v34;
                        v7 = v35;
                        v6 = v32;
                        goto LABEL_83;
                      }
                    }
                    id v15 = v19;
                    uint64_t v17 = [v19 countByEnumeratingWithState:&v41 objects:v51 count:16];
                    if (v17) {
                      continue;
                    }
                    break;
                  }
                }

                v21 = [v3 objectForKeyedSubscript:@"nested_fields"];
                if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  v30 = v21;
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of nested fields!", buf, 2u);
                  }
                  BOOL v28 = 0;
                  v8 = v34;
                  v7 = v35;
                  v6 = v32;
                  v29 = v30;
                }
                else
                {
                  long long v37 = 0u;
                  long long v38 = 0u;
                  long long v39 = 0u;
                  long long v40 = 0u;
                  id v22 = v21;
                  uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v50 count:16];
                  if (v23)
                  {
                    uint64_t v24 = v23;
                    uint64_t v33 = *(void *)v38;
                    v6 = v32;
                    while (2)
                    {
                      for (uint64_t k = 0; k != v24; ++k)
                      {
                        if (*(void *)v38 != v33) {
                          objc_enumerationMutation(v22);
                        }
                        v26 = *(void **)(*((void *)&v37 + 1) + 8 * k);
                        if (![v26 integerValue])
                        {
                          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected value of field string in nested fields!", buf, 2u);
                          }
                          goto LABEL_81;
                        }
                        v27 = [v22 objectForKeyedSubscript:v26];
                        if (v27)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected value of message name in nested fields!", buf, 2u);
                            }

LABEL_81:
                            BOOL v28 = 0;
                            goto LABEL_82;
                          }
                        }
                      }
                      uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v50 count:16];
                      BOOL v28 = 1;
                      if (v24) {
                        continue;
                      }
                      break;
                    }
                  }
                  else
                  {
                    BOOL v28 = 1;
                    v6 = v32;
                  }
LABEL_82:

                  v29 = v22;
                  v8 = v34;
                  v7 = v35;
                }
LABEL_83:
              }
              v9 = v36;
            }
          }
        }
      }
    }
  }
  return v28;
}

+ (BOOL)_groupConfigIsValid:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"device_sampling"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of group device sampling!", buf, 2u);
    }
    BOOL v17 = 0;
  }
  else
  {
    v5 = [v3 objectForKeyedSubscript:@"device_sampling_seed"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of group seed device sampling!", buf, 2u);
      }
      BOOL v17 = 0;
    }
    else
    {
      v6 = [v3 objectForKeyedSubscript:@"message_sampling"];
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of group message sampling!", buf, 2u);
        }
        BOOL v17 = 0;
      }
      else
      {
        v7 = [v3 objectForKeyedSubscript:@"sampling_limit"];
        if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of sampling limit!", buf, 2u);
          }
          BOOL v17 = 0;
        }
        else
        {
          v8 = [v3 objectForKeyedSubscript:@"sig_figs"];
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of sig_figs!", buf, 2u);
            }
            BOOL v17 = 0;
          }
          else
          {
            v9 = [v3 objectForKeyedSubscript:@"aggregated"];
            if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of aggregated!", buf, 2u);
              }
              BOOL v17 = 0;
            }
            else
            {
              id v10 = [v3 objectForKeyedSubscript:@"message_whitelist"];
              if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of message whitelist!", buf, 2u);
                }
                BOOL v17 = 0;
              }
              else
              {
                v21 = v9;
                id v22 = v8;
                long long v25 = 0u;
                long long v26 = 0u;
                long long v23 = 0u;
                long long v24 = 0u;
                v20 = v10;
                uint64_t v11 = [v10 allValues];
                uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
                if (v12)
                {
                  uint64_t v13 = v12;
                  uint64_t v14 = *(void *)v24;
                  v19 = v7;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v13; ++i)
                    {
                      if (*(void *)v24 != v14) {
                        objc_enumerationMutation(v11);
                      }
                      uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v7 = v19;
                        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of message config!", buf, 2u);
                        }
                        BOOL v17 = 0;
                        goto LABEL_51;
                      }
                      if (![(id)objc_opt_class() _messageConfigIsValid:v16])
                      {
                        BOOL v17 = 0;
                        v7 = v19;
                        goto LABEL_51;
                      }
                    }
                    uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
                    BOOL v17 = 1;
                    v7 = v19;
                    if (v13) {
                      continue;
                    }
                    break;
                  }
                }
                else
                {
                  BOOL v17 = 1;
                }
LABEL_51:

                v9 = v21;
                v8 = v22;
                id v10 = v20;
              }
            }
          }
        }
      }
    }
  }

  return v17;
}

+ (BOOL)configIsValid:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      BOOL v15 = 0;
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = MEMORY[0x1E4F14500];
    BOOL v17 = "unexpected type of config version!";
LABEL_24:
    _os_log_error_impl(&dword_190C01000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_16;
  }
  v6 = [v3 objectForKeyedSubscript:@"message_groups"];
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = MEMORY[0x1E4F14500];
    BOOL v17 = "unexpected type of message groups configuration!";
    goto LABEL_24;
  }
  v8 = [v3 objectForKeyedSubscript:@"message_groups"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v9 = objc_msgSend(v8, "allValues", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unexpected type of message group configuration!", buf, 2u);
          }
LABEL_20:
          BOOL v15 = 0;
          goto LABEL_21;
        }
        if (![(id)objc_opt_class() _groupConfigIsValid:v14]) {
          goto LABEL_20;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      BOOL v15 = 1;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 1;
  }
LABEL_21:

LABEL_22:
  return v15;
}

@end