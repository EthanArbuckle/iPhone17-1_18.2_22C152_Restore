@interface SHSheetImageIdentificationUtilities
+ (BOOL)isImageAnalysisFeatureEnabled;
+ (id)personIdResultsFromImage:(id)a3;
@end

@implementation SHSheetImageIdentificationUtilities

+ (BOOL)isImageAnalysisFeatureEnabled
{
  if _os_feature_enabled_impl() && (_ShareSheetImageAnalysisAllowed()) {
    return 1;
  }
  v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Feature: PeopleIntelligence is unsupported. No Identification will be performed ", v4, 2u);
  }

  return 0;
}

+ (id)personIdResultsFromImage:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init((Class)getMADPersonIdentificationRequestClass());
  [v5 setMaximumFaceCount:4];
  id v33 = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E4F28DC0];
    getMADPersonIdentificationRequestClass();
    v8 = [v7 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
    if (v8 || ![a1 isImageAnalysisFeatureEnabled])
    {
      v19 = v4;
    }
    else
    {
      v9 = share_sheet_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A0AD8000, v9, OS_LOG_TYPE_DEFAULT, "Unable to unarchive MADRequest object. Using on-demand MAD SPI", (uint8_t *)&buf, 2u);
      }

      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2050000000;
      v10 = (void *)getMADServiceClass_softClass;
      uint64_t v32 = getMADServiceClass_softClass;
      if (!getMADServiceClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v35 = __getMADServiceClass_block_invoke;
        v36 = &unk_1E5A216E8;
        v37 = &v29;
        __getMADServiceClass_block_invoke((uint64_t)&buf);
        v10 = (void *)v30[3];
      }
      id v11 = v10;
      _Block_object_dispose(&v29, 8);
      if (v11)
      {
        v12 = [v11 service];
        uint64_t v13 = *MEMORY[0x1E4F44378];
        id v28 = 0;
        [v12 performRequests:v6 onImageData:v4 withUniformTypeIdentifier:v13 andIdentifier:@"UIActivityViewControllerSharingMediaServiceAnalysis" error:&v28];
        id v14 = v28;
        if (v14)
        {
          v15 = v14;
          v16 = share_sheet_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = [v15 localizedDescription];
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v17;
            _os_log_impl(&dword_1A0AD8000, v16, OS_LOG_TYPE_DEFAULT, "While processing suggestedImageData, encountered Error: %@", (uint8_t *)&buf, 0xCu);
          }
          v18 = 0;
        }
        else
        {
          v22 = [v6 firstObject];
          v23 = [v22 results];

          if ([v23 count])
          {
            v24 = (void *)MEMORY[0x1E4F28DB0];
            v25 = [v6 firstObject];
            v18 = [v24 archivedDataWithRootObject:v25 requiringSecureCoding:1 error:0];

            v26 = share_sheet_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v27 = [v23 count];
              LODWORD(buf) = 134217984;
              *(void *)((char *)&buf + 4) = v27;
              _os_log_impl(&dword_1A0AD8000, v26, OS_LOG_TYPE_DEFAULT, "Screenshot service: Image data processed, Result count: %ld", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            v18 = 0;
          }

          v15 = 0;
        }
        v21 = v18;

        v19 = v21;
      }
      else
      {
        v21 = share_sheet_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[SHSheetImageIdentificationUtilities personIdResultsFromImage:](v21);
        }
        v19 = 0;
      }
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (void)personIdResultsFromImage:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "Error: Encountered nil, while linking to MADServiceClass", v1, 2u);
}

+ (void)personIdResultsFromImage:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Encountered exception while trying to perform Media analysis of suggested Image Data : %@", (uint8_t *)&v2, 0xCu);
}

@end