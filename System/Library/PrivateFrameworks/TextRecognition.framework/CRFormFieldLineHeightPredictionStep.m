@interface CRFormFieldLineHeightPredictionStep
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
@end

@implementation CRFormFieldLineHeightPredictionStep

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  v11 = CROSLogForCategory(6);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134217984;
    uint64_t v19 = [v8 count];
    _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldLineHeightPredictionStep is running (#input:%lu).", (uint8_t *)&v18, 0xCu);
  }

  v12 = [v10 objectForKeyedSubscript:@"ShouldUpdateExternalFieldsOption"];
  uint64_t v13 = [v12 BOOLValue];

  v14 = +[CRFormParser predictLineHeightForFields:v8 inDocument:v9 shouldUpdateExternalFields:v13];
  v15 = CROSLogForCategory(6);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [v14 count];
    int v18 = 134217984;
    uint64_t v19 = v16;
    _os_log_impl(&dword_1DD733000, v15, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldLineHeightPredictionStep is completed (#output:%lu).", (uint8_t *)&v18, 0xCu);
  }

  return v14;
}

@end