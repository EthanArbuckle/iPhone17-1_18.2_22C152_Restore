@interface PRUISPosterConfigurationUtilities
+ (id)titleStyleAttributesForConfiguration:(id)a3 error:(id *)a4;
@end

@implementation PRUISPosterConfigurationUtilities

+ (id)titleStyleAttributesForConfiguration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v38 = 0;
  v6 = objc_msgSend(v5, "pr_loadTitleStyleConfigurationWithError:", &v38);
  id v7 = v38;
  if (v6)
  {
    v8 = objc_msgSend(v5, "pr_posterProvider");
    if (!v8)
    {
      v9 = PRUISLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[PRUISPosterConfigurationUtilities titleStyleAttributesForConfiguration:error:]((uint64_t)v5, v9, v23, v24, v25, v26, v27, v28);
      }
      v15 = 0;
      goto LABEL_19;
    }
    id v37 = v7;
    v9 = [objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v8 error:&v37];
    id v10 = v37;

    uint64_t v11 = [v9 URL];
    if (v11)
    {
      v12 = v11;

      v13 = [PRUISPosterTitleStyleAttributes alloc];
      v14 = [v5 role];
      v15 = [(PRUISPosterTitleStyleAttributes *)v13 initWithPRPosterTitleStyleConfiguration:v6 extensionBundleURL:v12 role:v14];

      v9 = v12;
    }
    else
    {
      v29 = PRUISLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        +[PRUISPosterConfigurationUtilities titleStyleAttributesForConfiguration:error:]((uint64_t)v10, v29, v30, v31, v32, v33, v34, v35);
      }

      v15 = 0;
      if (a4 && v10)
      {
        id v7 = v10;
        v15 = 0;
        *a4 = v7;
        goto LABEL_19;
      }
    }
    id v7 = v10;
LABEL_19:

    goto LABEL_20;
  }
  v16 = PRUISLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    +[PRUISPosterConfigurationUtilities titleStyleAttributesForConfiguration:error:]((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);
  }

  v15 = 0;
  if (a4 && v7)
  {
    id v7 = v7;
    v15 = 0;
    *a4 = v7;
  }
LABEL_20:

  return v15;
}

+ (void)titleStyleAttributesForConfiguration:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)titleStyleAttributesForConfiguration:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)titleStyleAttributesForConfiguration:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end