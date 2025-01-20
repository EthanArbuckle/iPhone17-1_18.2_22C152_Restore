@interface CRFormUnderlinedFieldTextOverlapCleanupStep
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
@end

@implementation CRFormUnderlinedFieldTextOverlapCleanupStep

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = CROSLogForCategory(6);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    int v14 = 136315138;
    uint64_t v15 = [v11 UTF8String];
    _os_log_impl(&dword_1DD733000, v9, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: %s is running.", (uint8_t *)&v14, 0xCu);
  }
  v12 = +[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:v7 document:v8 underlinedFieldsOnly:1];

  return v12;
}

@end