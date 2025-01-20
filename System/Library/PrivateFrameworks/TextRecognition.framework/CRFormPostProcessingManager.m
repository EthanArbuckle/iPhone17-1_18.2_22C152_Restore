@interface CRFormPostProcessingManager
+ (id)postProcessingManagerWithDefaultSequence;
+ (void)enumerateAllFieldsInFields:(id)a3 block:(id)a4;
+ (void)enumerateContourBasedDetectedFields:(id)a3 block:(id)a4;
+ (void)enumerateDetectedFields:(id)a3 block:(id)a4;
+ (void)enumerateExternalFields:(id)a3 block:(id)a4;
+ (void)enumerateFieldsInFields:(id)a3 filter:(id)a4 block:(id)a5;
+ (void)enumerateTextBasedDetectedFields:(id)a3 block:(id)a4;
+ (void)logFieldStatistics:(id)a3;
- (CRFormPostProcessingManager)initWithSequence:(id)a3;
- (CRFormPostProcessingManager)initWithStep:(id)a3;
- (NSArray)sequence;
- (id)process:(id)a3 document:(id)a4 options:(id)a5;
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
- (void)setSequence:(id)a3;
@end

@implementation CRFormPostProcessingManager

+ (id)postProcessingManagerWithDefaultSequence
{
  v18[12] = *MEMORY[0x1E4F143B8];
  v2 = [CRFormPostProcessingManager alloc];
  v16 = objc_opt_new();
  v18[0] = v16;
  v15 = objc_opt_new();
  v18[1] = v15;
  v14 = objc_opt_new();
  v18[2] = v14;
  v17 = objc_opt_new();
  v18[3] = v17;
  v3 = objc_opt_new();
  v18[4] = v3;
  v4 = objc_opt_new();
  v18[5] = v4;
  v5 = objc_opt_new();
  v18[6] = v5;
  v6 = [[CRFormFilterSurfacedFieldsStep alloc] initWithAssignGlobalOrder:0];
  v18[7] = v6;
  v7 = objc_opt_new();
  v18[8] = v7;
  v8 = objc_opt_new();
  v18[9] = v8;
  v9 = [[CRFormFilterSurfacedFieldsStep alloc] initWithAssignGlobalOrder:1];
  v18[10] = v9;
  v10 = objc_opt_new();
  v18[11] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:12];
  v12 = [(CRFormPostProcessingManager *)v2 initWithSequence:v11];

  return v12;
}

- (CRFormPostProcessingManager)initWithStep:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = [(CRFormPostProcessingManager *)self initWithSequence:v5];

  return v6;
}

- (CRFormPostProcessingManager)initWithSequence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRFormPostProcessingManager;
  v6 = [(CRFormPostProcessingManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sequence, a3);
  }

  return v7;
}

+ (void)logFieldStatistics:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__CRFormPostProcessingManager_logFieldStatistics___block_invoke_2;
  v9[3] = &unk_1E6CDABD0;
  id v6 = v4;
  id v10 = v6;
  [v5 enumerateFieldsInFields:v3 filter:&__block_literal_global_3 block:v9];
  v7 = CROSLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = [v6 description];
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_DEBUG, "CRFormPostProcessorStep running with fields per source = %@", buf, 0xCu);
  }
}

uint64_t __50__CRFormPostProcessingManager_logFieldStatistics___block_invoke()
{
  return 1;
}

void __50__CRFormPostProcessingManager_logFieldStatistics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[CRFormUtilities debugDescriptionForField:v3];
  id v5 = CROSLogForCategory(6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138477827;
    v11 = v4;
    _os_log_impl(&dword_1DD733000, v5, OS_LOG_TYPE_DEBUG, "%{private}@", (uint8_t *)&v10, 0xCu);
  }

  while (1)
  {
    unint64_t v6 = [*(id *)(a1 + 32) count];
    if (v6 >= [v3 fieldSource] + 1) {
      break;
    }
    [*(id *)(a1 + 32) addObject:&unk_1F3932C08];
  }
  v7 = NSNumber;
  v8 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "fieldSource"));
  objc_super v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "intValue") + 1);
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v9, objc_msgSend(v3, "fieldSource"));
}

- (id)process:(id)a3 document:(id)a4 options:(id)a5
{
  id v5 = [(CRFormPostProcessingManager *)self process:a3 externalFields:MEMORY[0x1E4F1CBF0] document:a4 options:a5];
  return v5;
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = CROSLogForCategory(6);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = [v10 count];
    _os_log_impl(&dword_1DD733000, v14, OS_LOG_TYPE_DEBUG, "CRFormPostProcessorStep running with %ld fields.", buf, 0xCu);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v15 = self->_sequence;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      v19 = v10;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v18), "process:externalFields:document:options:", v19, v11, v12, v13, (void)v23);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        ++v18;
        v19 = v10;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  v20 = CROSLogForCategory(6);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = [v10 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = v21;
    _os_log_impl(&dword_1DD733000, v20, OS_LOG_TYPE_DEBUG, "CRFormPostProcessorStep completed with %ld fields.", buf, 0xCu);
  }

  return v10;
}

+ (void)enumerateAllFieldsInFields:(id)a3 block:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CRFormPostProcessingManager_enumerateAllFieldsInFields_block___block_invoke;
  v7[3] = &unk_1E6CDABF8;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

uint64_t __64__CRFormPostProcessingManager_enumerateAllFieldsInFields_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)enumerateFieldsInFields:(id)a3 filter:(id)a4 block:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CRFormPostProcessingManager_enumerateFieldsInFields_filter_block___block_invoke;
  v11[3] = &unk_1E6CDAC20;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [a3 enumerateObjectsUsingBlock:v11];
}

void __68__CRFormPostProcessingManager_enumerateFieldsInFields_filter_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)enumerateDetectedFields:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [(id)objc_opt_class() enumerateFieldsInFields:v6 filter:&__block_literal_global_27 block:v5];
}

BOOL __61__CRFormPostProcessingManager_enumerateDetectedFields_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fieldSource] == 1;
}

+ (void)enumerateContourBasedDetectedFields:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [(id)objc_opt_class() enumerateFieldsInFields:v6 filter:&__block_literal_global_29 block:v5];
}

BOOL __73__CRFormPostProcessingManager_enumerateContourBasedDetectedFields_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fieldSource] == 2;
}

+ (void)enumerateTextBasedDetectedFields:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [(id)objc_opt_class() enumerateFieldsInFields:v6 filter:&__block_literal_global_31 block:v5];
}

BOOL __70__CRFormPostProcessingManager_enumerateTextBasedDetectedFields_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fieldSource] == 3;
}

+ (void)enumerateExternalFields:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [(id)objc_opt_class() enumerateFieldsInFields:v6 filter:&__block_literal_global_33 block:v5];
}

BOOL __61__CRFormPostProcessingManager_enumerateExternalFields_block___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 fieldSource] == 4 || objc_msgSend(v2, "fieldSource") == 5;

  return v3;
}

- (NSArray)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
}

- (void).cxx_destruct
{
}

@end