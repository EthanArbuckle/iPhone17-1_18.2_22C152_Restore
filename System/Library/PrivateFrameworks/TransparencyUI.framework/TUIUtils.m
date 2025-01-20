@interface TUIUtils
+ (BOOL)_checkMismatchedAccountError:(id)a3;
+ (BOOL)_checkNetworkError:(id)a3;
+ (BOOL)isAuthError:(id)a3;
+ (BOOL)isDateExpired:(id)a3;
+ (BOOL)isHSA2;
+ (BOOL)isMismatchedAccountError:(id)a3;
+ (BOOL)isNetworkError:(id)a3;
+ (BOOL)isTransparencyFeatureEnabled:(const char *)a3;
+ (void)isHSA2;
@end

@implementation TUIUtils

+ (BOOL)isTransparencyFeatureEnabled:(const char *)a3
{
  if (!a3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  int v4 = _os_feature_enabled_impl();
  if (!strcmp(a3, ffKTReportToApple))
  {
    if (!v4) {
      goto LABEL_15;
    }
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11, &__block_literal_global_11);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_ERROR)) {
      +[TUIUtils isTransparencyFeatureEnabled:]();
    }
    goto LABEL_14;
  }
  if (v4)
  {
LABEL_14:
    LOBYTE(v5) = 1;
    return v5;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11, &__block_literal_global_42);
  }
  BOOL v5 = os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    +[TUIUtils isTransparencyFeatureEnabled:]();
LABEL_15:
    LOBYTE(v5) = 0;
  }
  return v5;
}

uint64_t __41__TUIUtils_isTransparencyFeatureEnabled___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __41__TUIUtils_isTransparencyFeatureEnabled___block_invoke_40()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isNetworkError:(id)a3
{
  id v4 = a3;
  int v5 = [a1 _checkNetworkError:v4];
  if (v5)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11, &__block_literal_global_44);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_DEBUG)) {
      +[TUIUtils isNetworkError:]();
    }
  }

  return v5;
}

uint64_t __27__TUIUtils_isNetworkError___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isMismatchedAccountError:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  int v5 = [v4 domain];
  if (![v5 isEqual:*MEMORY[0x263F80D98]])
  {

LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = [v4 code];

  if (v6 != -290 || ![a1 _checkMismatchedAccountError:v4]) {
    goto LABEL_11;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11, &__block_literal_global_46_0);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_DEBUG)) {
    +[TUIUtils isMismatchedAccountError:]();
  }
  BOOL v7 = 1;
LABEL_12:

  return v7;
}

uint64_t __37__TUIUtils_isMismatchedAccountError___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isDateExpired:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  int v5 = [v3 now];
  id v6 = [v4 earlierDate:v5];

  return v6 == v4;
}

+ (BOOL)isAuthError:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  id v6 = [v5 domain];
  char v7 = [v6 isEqualToString:*MEMORY[0x263F63820]];
  if ((v7 & 1) == 0)
  {
    v3 = [v5 domain];
    if (([v3 isEqualToString:*MEMORY[0x263F63830]] & 1) == 0)
    {

LABEL_13:
      BOOL v12 = 0;
      goto LABEL_14;
    }
  }
  v8 = [v5 userInfo];
  v9 = [v8 objectForKeyedSubscript:@"statusCode"];
  uint64_t v10 = [v9 integerValue];

  if ((v7 & 1) == 0) {
  if (v10 != 401)
  }
    goto LABEL_13;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11, &__block_literal_global_52_0);
  }
  v11 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_DEBUG)) {
    +[TUIUtils isAuthError:(uint64_t)a1];
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

uint64_t __24__TUIUtils_isAuthError___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)_checkNetworkError:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = 0;
    goto LABEL_18;
  }
  id v5 = [v4 domain];
  if ([v5 isEqual:*MEMORY[0x263F80DC0]]) {
    goto LABEL_15;
  }
  id v6 = [v4 domain];
  if ([v6 isEqual:*MEMORY[0x263F08570]])
  {
LABEL_14:

LABEL_15:
LABEL_16:
    BOOL v11 = 1;
    goto LABEL_18;
  }
  char v7 = [v4 domain];
  if ([v7 isEqual:*MEMORY[0x263EFC6F0]])
  {
LABEL_13:

    goto LABEL_14;
  }
  v8 = [v4 domain];
  if ([v8 isEqual:*MEMORY[0x263F80DB8]] && objc_msgSend(v4, "code") == -343)
  {
LABEL_12:

    goto LABEL_13;
  }
  v9 = [v4 domain];
  if ([v9 isEqual:*MEMORY[0x263F80DB0]] && objc_msgSend(v4, "code") == -41)
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v10 = [v4 domain];
  if ([v10 isEqual:*MEMORY[0x263F80DA8]])
  {

    goto LABEL_11;
  }
  v13 = [v4 domain];
  char v34 = [v13 isEqualToString:*MEMORY[0x263F63820]];
  if ((v34 & 1) == 0)
  {
    v14 = [v4 domain];
    if (![v14 isEqualToString:*MEMORY[0x263F63830]])
    {
      BOOL v33 = 0;
      goto LABEL_29;
    }
    v31 = v14;
  }
  v32 = [v4 userInfo];
  v15 = [v32 objectForKeyedSubscript:@"statusCode"];
  if ([v15 integerValue] < 500)
  {

    if (v34)
    {

      goto LABEL_31;
    }
    BOOL v33 = 0;
    v14 = v31;
    goto LABEL_29;
  }
  v29 = [v4 userInfo];
  [v29 objectForKeyedSubscript:@"statusCode"];
  v16 = v30 = v13;
  BOOL v33 = [v16 integerValue] < 600;

  v13 = v30;
  v14 = v31;
  if ((v34 & 1) == 0) {
LABEL_29:
  }

  if (v33) {
    goto LABEL_16;
  }
LABEL_31:
  v17 = [v4 domain];
  char v18 = [v17 isEqual:*MEMORY[0x263F80DA0]];

  if (v18) {
    goto LABEL_16;
  }
  v19 = [v4 userInfo];
  id v20 = [v19 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if ([a1 _checkNetworkError:v20])
  {
    BOOL v11 = 1;
  }
  else
  {
    v21 = [v4 userInfo];
    v22 = [v21 objectForKeyedSubscript:*MEMORY[0x263F083F0]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v36;
        while (2)
        {
          uint64_t v27 = 0;
          v28 = v20;
          do
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v23);
            }
            id v20 = *(id *)(*((void *)&v35 + 1) + 8 * v27);

            if ([a1 _checkNetworkError:v20])
            {
              BOOL v11 = 1;
              goto LABEL_46;
            }
            ++v27;
            v28 = v20;
          }
          while (v25 != v27);
          uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      BOOL v11 = 0;
      id v20 = 0;
LABEL_46:
    }
    else
    {
      BOOL v11 = 0;
    }
  }
LABEL_18:

  return v11;
}

+ (BOOL)_checkMismatchedAccountError:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v7 = 0;
    goto LABEL_24;
  }
  id v5 = [v4 domain];
  if ([v5 isEqual:@"IDSKeyTransparencyVerifierErrorDomain"])
  {
    uint64_t v6 = [v4 code];

    if (v6 == -8003)
    {
      BOOL v7 = 1;
      goto LABEL_24;
    }
  }
  else
  {
  }
  v8 = [v4 userInfo];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if ([a1 _checkMismatchedAccountError:v9])
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v10 = [v4 userInfo];
    BOOL v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F083F0]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        while (2)
        {
          uint64_t v16 = 0;
          v17 = v9;
          do
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            id v9 = *(id *)(*((void *)&v19 + 1) + 8 * v16);

            if (objc_msgSend(a1, "_checkMismatchedAccountError:", v9, (void)v19))
            {
              BOOL v7 = 1;
              goto LABEL_21;
            }
            ++v16;
            v17 = v9;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      BOOL v7 = 0;
      id v9 = 0;
LABEL_21:
    }
    else
    {
      BOOL v7 = 0;
    }
  }
LABEL_24:

  return v7;
}

+ (BOOL)isHSA2
{
  v2 = [MEMORY[0x263F290F0] sharedInstance];
  v3 = [MEMORY[0x263F34328] sharedInstance];
  id v4 = [v3 primaryAccountAltDSID];
  id v10 = 0;
  id v5 = [v2 authKitAccountWithAltDSID:v4 error:&v10];
  id v6 = v10;

  if (v5)
  {
    BOOL v7 = [MEMORY[0x263F290F0] sharedInstance];
    BOOL v8 = [v7 securityLevelForAccount:v5] == 4;
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_11, &__block_literal_global_57_1);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_ERROR)) {
      +[TUIUtils isHSA2]();
    }
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __18__TUIUtils_isHSA2__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_11 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

+ (void)isTransparencyFeatureEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_260338000, v0, v1, "%{public}@ *** %s enabled");
}

+ (void)isTransparencyFeatureEnabled:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_260338000, v0, v1, "%{public}@ *** %s not enabled");
}

+ (void)isNetworkError:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s YES: error = %{public}@ on %{public}@", v2);
}

+ (void)isMismatchedAccountError:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s YES: error = %{public}@ on %{public}@", v2);
}

+ (void)isAuthError:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = [a2 domain];
  uint64_t v7 = [a2 code];
  BOOL v8 = [a2 localizedDescription];
  int v9 = 136316162;
  id v10 = "+[TUIUtils isAuthError:]";
  __int16 v11 = 2114;
  id v12 = v6;
  __int16 v13 = 2048;
  uint64_t v14 = v7;
  __int16 v15 = 2114;
  uint64_t v16 = v8;
  __int16 v17 = 2114;
  uint64_t v18 = a3;
  _os_log_debug_impl(&dword_260338000, v5, OS_LOG_TYPE_DEBUG, "%s YES: domain = %{public}@, code = %ld, description = %{public}@ on %{public}@", (uint8_t *)&v9, 0x34u);
}

+ (void)isHSA2
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_260338000, v0, OS_LOG_TYPE_ERROR, "%s authKitAccountWithAltDSID failed: %{public}@ on %{public}@", (uint8_t *)v1, 0x20u);
}

@end