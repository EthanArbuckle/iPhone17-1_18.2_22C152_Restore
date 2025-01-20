@interface CRE5MLExecutionContext
- (BOOL)predictFromPreboundInputsWithError:(id *)a3;
- (CRE5MLExecutionContext)initWithFunction:(id)a3;
- (VisionCoreE5RTInferenceFunctionDescriptor)functionDescriptor;
- (VisionCoreNamedObjects)preboundOutputObjects;
- (id)newE5RTExecutionContextForFunctionDescriptor:(id)a3 error:(id *)a4;
- (id)newE5RTExecutionContextForFunctionDescriptor:(id)a3 preboundInputs:(id)a4 preboundOutputs:(id)a5 error:(id *)a6;
- (id)predictionFromInputObjects:(id)a3 error:(id *)a4;
- (id)sharedExecutionContextWithError:(id *)a3;
- (void)prebindInputs:(id)a3;
- (void)predictFromPreboundInputsAsync:(id)a3;
- (void)unbindInputs;
@end

@implementation CRE5MLExecutionContext

- (CRE5MLExecutionContext)initWithFunction:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRE5MLExecutionContext;
  v6 = [(CRE5MLExecutionContext *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_functionDescriptor, a3);
    v7->_executionLock._os_unfair_lock_opaque = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    prewarmSemaphore = v7->_prewarmSemaphore;
    v7->_prewarmSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    qos_class_t v11 = qos_class_self();
    v12 = dispatch_queue_attr_make_with_qos_class(v10, v11, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.CoreRecognition.E5MLExecutionContextQueue", v12);
    contextQueue = v7->_contextQueue;
    v7->_contextQueue = (OS_dispatch_queue *)v13;

    v15 = v7;
  }

  return v7;
}

- (id)newE5RTExecutionContextForFunctionDescriptor:(id)a3 error:(id *)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FB3E70];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  dispatch_semaphore_t v8 = [v6 function];

  v9 = (void *)[v8 newExecutionContextWithConfiguration:v7 error:a4];
  return v9;
}

- (id)newE5RTExecutionContextForFunctionDescriptor:(id)a3 preboundInputs:(id)a4 preboundOutputs:(id)a5 error:(id *)a6
{
  v9 = (objc_class *)MEMORY[0x1E4FB3E70];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v9);
  [v13 setBoundInputObjects:v11];

  [v13 setBoundOutputObjects:v10];
  [v13 setPrewireInUseAllocations:1];
  v14 = [v12 function];

  v15 = (void *)[v14 newExecutionContextWithConfiguration:v13 error:a6];
  return v15;
}

- (id)sharedExecutionContextWithError:(id *)a3
{
  executionContext = self->_executionContext;
  if (!executionContext)
  {
    id v5 = [(CRE5MLExecutionContext *)self newE5RTExecutionContextForFunctionDescriptor:self->_functionDescriptor error:a3];
    id v6 = self->_executionContext;
    self->_executionContext = v5;

    executionContext = self->_executionContext;
  }
  return executionContext;
}

- (id)predictionFromInputObjects:(id)a3 error:(id *)a4
{
  id v6 = a3;
  p_executionLock = &self->_executionLock;
  os_unfair_lock_lock(&self->_executionLock);
  if (v6)
  {
    dispatch_semaphore_t v8 = [(CRE5MLExecutionContext *)self sharedExecutionContextWithError:a4];
    if (v8)
    {
      if (CRSignpostLog_onceToken != -1) {
        dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
      }
      v9 = (id)CRSignpostLog_signPostOSLog;
      os_signpost_id_t v10 = os_signpost_id_generate(v9);

      if (CRSignpostLog_onceToken != -1) {
        dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
      }
      id v11 = (id)CRSignpostLog_signPostOSLog;
      id v12 = v11;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DD733000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "OCRE5ContextExecutionTime", "", buf, 2u);
      }

      id v13 = [v8 executeWithInputObjects:v6 error:a4];
      if (CRSignpostLog_onceToken != -1) {
        dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
      }
      v14 = (id)CRSignpostLog_signPostOSLog;
      v15 = v14;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)v18 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DD733000, v15, OS_SIGNPOST_INTERVAL_END, v10, "OCRE5ContextExecutionTime", "", v18, 2u);
      }

      os_unfair_lock_unlock(p_executionLock);
      if (v13) {
        id v16 = v13;
      }
    }
    else
    {
      os_unfair_lock_unlock(p_executionLock);
      id v13 = 0;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_executionLock);
    id v13 = 0;
  }

  return v13;
}

- (void)prebindInputs:(id)a3
{
  objc_storeStrong((id *)&self->_preboundInputObjects, a3);
  id v6 = a3;
  preboundExecutionContext = self->_preboundExecutionContext;
  self->_preboundExecutionContext = 0;
}

- (void)unbindInputs
{
  preboundInputObjects = self->_preboundInputObjects;
  self->_preboundInputObjects = 0;

  preboundExecutionContext = self->_preboundExecutionContext;
  self->_preboundExecutionContext = 0;
}

- (BOOL)predictFromPreboundInputsWithError:(id *)a3
{
  p_executionLock = &self->_executionLock;
  os_unfair_lock_lock(&self->_executionLock);
  if (!self->_preboundOutputObjects)
  {
    id v6 = +[CRE5MLUtilities newE5RTExecutionOutputsForFunctionDescriptor:self->_functionDescriptor error:a3];
    preboundOutputObjects = self->_preboundOutputObjects;
    self->_preboundOutputObjects = v6;
  }
  if (!self->_preboundExecutionContext)
  {
    dispatch_semaphore_t v8 = [(CRE5MLExecutionContext *)self newE5RTExecutionContextForFunctionDescriptor:self->_functionDescriptor preboundInputs:self->_preboundInputObjects preboundOutputs:self->_preboundOutputObjects error:a3];
    preboundExecutionContext = self->_preboundExecutionContext;
    self->_preboundExecutionContext = v8;

    if (!self->_preboundExecutionContext) {
      goto LABEL_19;
    }
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  os_signpost_id_t v10 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v12 = (id)CRSignpostLog_signPostOSLog;
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "OCRE5ContextExecutionTime", "", buf, 2u);
  }

  [(VisionCoreE5RTExecutionContext *)self->_preboundExecutionContext executeAndReturnError:a3];
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v14 = (id)CRSignpostLog_signPostOSLog;
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)objc_super v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v15, OS_SIGNPOST_INTERVAL_END, v11, "OCRE5ContextExecutionTime", "", v17, 2u);
  }

  if (!a3 || !*a3)
  {
    os_unfair_lock_unlock(p_executionLock);
    return 1;
  }
  else
  {
LABEL_19:
    os_unfair_lock_unlock(p_executionLock);
    return 0;
  }
}

- (void)predictFromPreboundInputsAsync:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  os_unfair_lock_lock(&self->_executionLock);
  if (self->_preboundOutputObjects)
  {
    id v5 = 0;
  }
  else
  {
    functionDescriptor = self->_functionDescriptor;
    id v26 = 0;
    id v7 = +[CRE5MLUtilities newE5RTExecutionOutputsForFunctionDescriptor:functionDescriptor error:&v26];
    id v5 = v26;
    preboundOutputObjects = self->_preboundOutputObjects;
    self->_preboundOutputObjects = v7;
  }
  if (self->_preboundExecutionContext)
  {
    id v9 = v5;
  }
  else
  {
    os_signpost_id_t v10 = objc_opt_class();
    os_signpost_id_t v11 = self->_functionDescriptor;
    preboundInputObjects = self->_preboundInputObjects;
    id v13 = self->_preboundOutputObjects;
    id v25 = v5;
    v14 = (VisionCoreE5RTExecutionContext *)[v10 newE5RTExecutionContextForFunctionDescriptor:v11 preboundInputs:preboundInputObjects preboundOutputs:v13 error:&v25];
    id v9 = v25;

    preboundExecutionContext = self->_preboundExecutionContext;
    self->_preboundExecutionContext = v14;

    if (!self->_preboundExecutionContext)
    {
      os_unfair_lock_unlock(&self->_executionLock);
      v4[2](v4, 0, v9);
      goto LABEL_15;
    }
  }
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v16 = (id)CRSignpostLog_signPostOSLog;
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  v18 = (id)CRSignpostLog_signPostOSLog;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "OCRE5ContextExecutionTime", "", buf, 2u);
  }

  v20 = self->_preboundExecutionContext;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__CRE5MLExecutionContext_predictFromPreboundInputsAsync___block_invoke;
  v21[3] = &unk_1E6CDBAA8;
  os_signpost_id_t v23 = v17;
  v21[4] = self;
  v22 = v4;
  [(VisionCoreE5RTExecutionContext *)v20 executeWithCompletionHandler:v21];

LABEL_15:
}

void __57__CRE5MLExecutionContext_predictFromPreboundInputsAsync___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  if (CRSignpostLog_onceToken != -1) {
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_13);
  }
  id v7 = (id)CRSignpostLog_signPostOSLog;
  dispatch_semaphore_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)os_signpost_id_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD733000, v8, OS_SIGNPOST_INTERVAL_END, v9, "OCRE5ContextExecutionTime", "", v10, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
}

- (VisionCoreE5RTInferenceFunctionDescriptor)functionDescriptor
{
  return self->_functionDescriptor;
}

- (VisionCoreNamedObjects)preboundOutputObjects
{
  return self->_preboundOutputObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preboundExecutionContext, 0);
  objc_storeStrong((id *)&self->_preboundOutputObjects, 0);
  objc_storeStrong((id *)&self->_preboundInputObjects, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_contextQueue, 0);
  objc_storeStrong((id *)&self->_prewarmSemaphore, 0);
  objc_storeStrong((id *)&self->_prewarmedState, 0);
  objc_storeStrong((id *)&self->_functionDescriptor, 0);
}

@end