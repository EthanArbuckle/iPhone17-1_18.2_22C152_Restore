@interface NTKComplicationBundleHelper
+ (id)_complicationFamilyToTemplateFileNameMapping:(id)a3;
+ (id)_templateForFamily:(int64_t)a3 bundle:(id)a4;
+ (id)localizedComplicationDescriptionForFamily:(int64_t)a3 bundle:(id)a4 localization:(id)a5;
+ (id)localizedComplicationTemplateForFamily:(int64_t)a3 bundle:(id)a4 localization:(id)a5;
+ (id)localizedComplicationTemplateForTemplate:(id)a3 bundle:(id)a4 localization:(id)a5;
+ (id)supportedComplicationFamiliesForBundle:(id)a3;
@end

@implementation NTKComplicationBundleHelper

+ (id)supportedComplicationFamiliesForBundle:(id)a3
{
  id v4 = a3;
  v5 = [a1 _complicationFamilyToTemplateFileNameMapping:v4];
  v6 = [v4 bundlePath];

  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__NTKComplicationBundleHelper_supportedComplicationFamiliesForBundle___block_invoke;
  v15[3] = &unk_1E62C3118;
  id v16 = v6;
  id v17 = v7;
  id v9 = v8;
  id v18 = v9;
  id v10 = v7;
  id v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];
  v12 = v18;
  id v13 = v9;

  return v13;
}

void __70__NTKComplicationBundleHelper_supportedComplicationFamiliesForBundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v6];
  if ([*(id *)(a1 + 40) fileExistsAtPath:v7])
  {
    v8 = *(void **)(a1 + 48);
    id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "integerValue"));
    [v8 addObject:v9];
  }
  else
  {
    id v10 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __70__NTKComplicationBundleHelper_supportedComplicationFamiliesForBundle___block_invoke_cold_1();
    }
  }
}

+ (id)localizedComplicationTemplateForFamily:(int64_t)a3 bundle:(id)a4 localization:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _templateForFamily:a3 bundle:v9];
  id v11 = [a1 localizedComplicationTemplateForTemplate:v10 bundle:v9 localization:v8];

  return v11;
}

+ (id)localizedComplicationDescriptionForFamily:(int64_t)a3 bundle:(id)a4 localization:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 bundlePath];
  id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v11 = [v9 stringByAppendingPathComponent:*MEMORY[0x1E4F19630]];
  v12 = (void *)[v10 initWithContentsOfFile:v11 options:1 error:0];

  if (v12)
  {
    id v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v12 options:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
      v15 = [v13 objectForKeyedSubscript:v14];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = [MEMORY[0x1E4F19AC0] providerWithJSONObjectRepresentation:v15];
        id v17 = [v16 localizedTextProviderWithBundle:v7 forLocalization:v8];

LABEL_14:
        goto LABEL_15;
      }
      id v18 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[NTKComplicationBundleHelper localizedComplicationDescriptionForFamily:bundle:localization:](a3, v18);
      }
    }
    else
    {
      v15 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[NTKComplicationBundleHelper localizedComplicationDescriptionForFamily:bundle:localization:]();
      }
    }
    id v17 = 0;
    goto LABEL_14;
  }
  id v13 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    +[NTKComplicationBundleHelper localizedComplicationDescriptionForFamily:bundle:localization:]();
  }
  id v17 = 0;
LABEL_15:

  return v17;
}

+ (id)localizedComplicationTemplateForTemplate:(id)a3 bundle:(id)a4 localization:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__NTKComplicationBundleHelper_localizedComplicationTemplateForTemplate_bundle_localization___block_invoke;
  v16[3] = &unk_1E62C3140;
  id v10 = v7;
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 enumerateTextProviderKeysWithBlock:v16];
  id v13 = v19;
  id v14 = v10;

  return v14;
}

void __92__NTKComplicationBundleHelper_localizedComplicationTemplateForTemplate_bundle_localization___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 valueForKey:v4];
  id v5 = [v6 localizedTextProviderWithBundle:*(void *)(a1 + 40) forLocalization:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setValue:v5 forKey:v4];
}

+ (id)_templateForFamily:(int64_t)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = [v6 bundlePath];
  id v8 = [a1 _complicationFamilyToTemplateFileNameMapping:v6];
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    id v12 = [v7 stringByAppendingPathComponent:v10];
    id v13 = [v11 initWithContentsOfFile:v12 options:1 error:0];

    if (v13)
    {
      id v14 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v13 options:0 error:0];
      v15 = [MEMORY[0x1E4F196D8] complicationTemplateWithJSONObjectRepresentation:v14 bundle:v6 purpose:0];

      goto LABEL_10;
    }
    id v16 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[NTKComplicationBundleHelper _templateForFamily:bundle:]();
    }
  }
  else
  {
    id v13 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[NTKComplicationBundleHelper _templateForFamily:bundle:](a3, (uint64_t)v6, v13);
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

+ (id)_complicationFamilyToTemplateFileNameMapping:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundlePath];
  id v5 = [v4 stringByAppendingPathComponent:*MEMORY[0x1E4F19638]];
  if (v5)
  {
    id v6 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:1 error:0];
    if (!v6)
    {
      id v7 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[NTKComplicationBundleHelper localizedComplicationDescriptionForFamily:bundle:localization:]();
      }
      id v9 = 0;
      goto LABEL_19;
    }
    id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19640]];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v8;
        id v9 = v8;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      id v10 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[NTKComplicationBundleHelper _complicationFamilyToTemplateFileNameMapping:]();
      }
    }
    else
    {
      id v8 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[NTKComplicationBundleHelper localizedComplicationDescriptionForFamily:bundle:localization:]();
      }
    }
    id v9 = 0;
    goto LABEL_18;
  }
  id v6 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[NTKComplicationBundleHelper _complicationFamilyToTemplateFileNameMapping:]();
  }
  id v9 = 0;
LABEL_20:

  return v9;
}

void __70__NTKComplicationBundleHelper_supportedComplicationFamiliesForBundle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Error: Complication Descriptor %@ for family %@ specified in manifiest cannot be found, family will be omitted");
}

+ (void)localizedComplicationDescriptionForFamily:bundle:localization:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Error: unable to retreive contents of file %@", v2, v3, v4, v5, v6);
}

+ (void)localizedComplicationDescriptionForFamily:(uint64_t)a1 bundle:(NSObject *)a2 localization:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a1);
  *(_DWORD *)buf = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Error: descriptions: value for '%@' is not a dictionary", buf, 0xCu);
}

+ (void)localizedComplicationDescriptionForFamily:bundle:localization:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Error: contents of file (%@) is not a dictionary", v2, v3, v4, v5, v6);
}

+ (void)_templateForFamily:(NSObject *)a3 bundle:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CLKStringForComplicationFamily();
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "Error: unable to create a filename for family (%@) in bundle %@ when looking up complication template", (uint8_t *)&v6, 0x16u);
}

+ (void)_templateForFamily:bundle:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Error: unable to retrieve template specified in manifest %@", v2, v3, v4, v5, v6);
}

+ (void)_complicationFamilyToTemplateFileNameMapping:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Error: unable to build path to complication template file (%@) with bundle (%@)");
}

+ (void)_complicationFamilyToTemplateFileNameMapping:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Error: complication manifest: value for '%@' is not a dictionary", v2, v3, v4, v5, v6);
}

@end