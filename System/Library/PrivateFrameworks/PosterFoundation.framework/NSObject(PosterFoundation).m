@interface NSObject(PosterFoundation)
+ (id)pf_secureDecodedFromData:()PosterFoundation classReplacementMap:;
+ (id)pf_secureDecodedFromData:()PosterFoundation ofClasses:classReplacementMap:;
@end

@implementation NSObject(PosterFoundation)

+ (id)pf_secureDecodedFromData:()PosterFoundation classReplacementMap:
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    id v12 = 0;
    goto LABEL_21;
  }
  id v9 = v7;
  id v10 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v10 length];
    id v12 = 0;
    if (!a1 || !v11) {
      goto LABEL_20;
    }
    v13 = (void *)MEMORY[0x25A2F4780]();
    id v19 = 0;
    v14 = objc_msgSend(MEMORY[0x263F08928], "pf_unarchivedObjectOfClass:fromData:classReplacementMap:error:", a1, v10, v9, &v19);
    id v15 = v19;
    if (v15)
    {
      v16 = PFLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[NSObject(PosterFoundation) pf_secureDecodedFromData:classReplacementMap:](a1);
      }
    }
    if (v14)
    {
      if (objc_opt_isKindOfClass())
      {
        id v12 = v14;
LABEL_19:

        goto LABEL_20;
      }
      if (!v15)
      {
        v17 = PFLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[NSObject(PosterFoundation) pf_secureDecodedFromData:classReplacementMap:](a1);
        }
      }
    }
    id v12 = 0;
    goto LABEL_19;
  }
  id v12 = 0;
LABEL_20:

LABEL_21:
  return v12;
}

+ (id)pf_secureDecodedFromData:()PosterFoundation ofClasses:classReplacementMap:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v31 = a1;
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    id v24 = 0;
    goto LABEL_32;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithObjects:&v31 count:1];
  uint64_t v11 = v10;
  if (v8) {
    [v10 unionSet:v8];
  }
  id v12 = v11;
  id v13 = v9;
  id v14 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 length] && objc_msgSend(v12, "count"))
  {
    id v15 = (void *)MEMORY[0x25A2F4780]();
    id v36 = 0;
    v16 = objc_msgSend(MEMORY[0x263F08928], "pf_unarchivedObjectOfClasses:fromData:classReplacementMap:error:", v12, v14, v13, &v36);
    id v30 = v36;
    if (v30)
    {
      v17 = PFLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[NSObject(PosterFoundation) pf_secureDecodedFromData:ofClasses:classReplacementMap:]((uint64_t)v30, v17);
      }
    }
    if (v16)
    {
      v28 = v15;
      id v29 = v13;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v18 = v12;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v33;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            if (objc_opt_isKindOfClass())
            {

              id v23 = v16;
              goto LABEL_36;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      if (v30)
      {
        id v23 = 0;
LABEL_36:
        id v15 = v28;
        id v13 = v29;
        goto LABEL_41;
      }
      v27 = PFLogCommon();
      id v15 = v28;
      id v13 = v29;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        +[NSObject(PosterFoundation) pf_secureDecodedFromData:ofClasses:classReplacementMap:]();
      }
    }
    id v23 = 0;
LABEL_41:

    goto LABEL_23;
  }
  id v23 = 0;
LABEL_23:

  if (objc_opt_isKindOfClass())
  {
    id v24 = v23;
  }
  else
  {
    if (v23)
    {
      v25 = PFLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[NSObject(PosterFoundation) pf_secureDecodedFromData:ofClasses:classReplacementMap:](&v31, (uint64_t)v23, v25);
      }
    }
    id v24 = 0;
  }

LABEL_32:
  return v24;
}

+ (void)pf_secureDecodedFromData:()PosterFoundation classReplacementMap:.cold.1(objc_class *a1)
{
  v1 = NSStringFromClass(a1);
  v2 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_1(&dword_25A085000, v3, v4, "Error during decoding of data to type=%{public}@: decoded %{public}@ instead but unarchiver didn't filter it", v5, v6, v7, v8, 2u);
}

+ (void)pf_secureDecodedFromData:()PosterFoundation classReplacementMap:.cold.2(objc_class *a1)
{
  v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_25A085000, v2, v3, "Error during decoding of data to type=%{public}@: %{public}@", v4, v5, v6, v7, v8);
}

+ (void)pf_secureDecodedFromData:()PosterFoundation ofClasses:classReplacementMap:.cold.1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  int v6 = 136315650;
  uint64_t v7 = "+[NSObject(PosterFoundation) pf_secureDecodedFromData:ofClasses:classReplacementMap:]";
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  id v11 = (id)objc_opt_class();
  id v5 = v11;
  _os_log_error_impl(&dword_25A085000, a3, OS_LOG_TYPE_ERROR, "%s decoded an unexpected type : expected=%{public}@ decoded=%{public}@", (uint8_t *)&v6, 0x20u);
}

+ (void)pf_secureDecodedFromData:()PosterFoundation ofClasses:classReplacementMap:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1(&dword_25A085000, v1, v2, "Error during decoding of data to types=%{public}@: decoded %{public}@ instead but unarchiver didn't filter it", v3, v4, v5, v6, 2u);
}

+ (void)pf_secureDecodedFromData:()PosterFoundation ofClasses:classReplacementMap:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A085000, a2, OS_LOG_TYPE_ERROR, "Error during decoding of data: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end