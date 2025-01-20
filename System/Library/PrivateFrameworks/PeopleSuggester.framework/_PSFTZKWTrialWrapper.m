@interface _PSFTZKWTrialWrapper
+ (id)sharedInstance;
+ (void)runIfUpdated:(id)a3;
+ (void)runWithData:(id)a3;
- (BOOL)loadLevelAsBooleanFromFactor:(id)a3 withDefault:(BOOL)a4;
- (TRIClient)triClient;
- (_PSFTZKWTrialWrapper)init;
- (int64_t)loadLevelAsConfidenceCategoryFromFactor:(id)a3 withDefault:(int64_t)a4;
- (int64_t)loadLevelAsInteractionModelTypeFromFactor:(id)a3 withDefault:(int64_t)a4;
- (void)flagAsSame;
- (void)flagAsUpdated;
- (void)loadFactors;
- (void)refresh;
- (void)runIfUpdated:(id)a3;
- (void)runWithData:(id)a3;
@end

@implementation _PSFTZKWTrialWrapper

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___PSFTZKWTrialWrapper_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_0;

  return v2;
}

+ (void)runWithData:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedInstance];
  [v5 runWithData:v4];
}

+ (void)runIfUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedInstance];
  [v5 runIfUpdated:v4];
}

- (_PSFTZKWTrialWrapper)init
{
  v20.receiver = self;
  v20.super_class = (Class)_PSFTZKWTrialWrapper;
  v2 = [(_PSFTZKWTrialWrapper *)&v20 init];
  if (v2)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v3 = (void *)getTRIClientClass_softClass_1;
    uint64_t v25 = getTRIClientClass_softClass_1;
    if (!getTRIClientClass_softClass_1)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getTRIClientClass_block_invoke_1;
      location[3] = &unk_1E5ADE858;
      location[4] = &v22;
      __getTRIClientClass_block_invoke_1((uint64_t)location);
      v3 = (void *)v23[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v22, 8);
    uint64_t v5 = [v4 clientWithIdentifier:210];
    triClient = v2->_triClient;
    v2->_triClient = (TRIClient *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F93B70]);
    v8 = objc_opt_new();
    uint64_t v9 = [v7 initWithGuardedData:v8];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F93B70]);
    v12 = objc_opt_new();
    uint64_t v13 = [v11 initWithGuardedData:v12];
    updateLock = v2->_updateLock;
    v2->_updateLock = (_PASLock *)v13;

    [(_PSFTZKWTrialWrapper *)v2 loadFactors];
    [(_PSFTZKWTrialWrapper *)v2 flagAsSame];
    objc_initWeak(location, v2);
    v15 = v2->_triClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __28___PSFTZKWTrialWrapper_init__block_invoke;
    v18[3] = &unk_1E5ADED80;
    objc_copyWeak(&v19, location);
    id v16 = (id)[(TRIClient *)v15 addUpdateHandlerForNamespaceName:@"COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION" usingBlock:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  return v2;
}

- (void)refresh
{
  [(TRIClient *)self->_triClient refresh];

  [(_PSFTZKWTrialWrapper *)self loadFactors];
}

- (void)flagAsUpdated
{
}

- (void)flagAsSame
{
}

- (BOOL)loadLevelAsBooleanFromFactor:(id)a3 withDefault:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(TRIClient *)self->_triClient levelForFactor:v6 withNamespaceName:@"COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION"];
  v8 = v7;
  if (v7)
  {
    LOBYTE(v4) = [v7 BOOLeanValue];
  }
  else
  {
    uint64_t v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSFTZKWTrialWrapper loadLevelAsBooleanFromFactor:withDefault:]((uint64_t)v6, v4, v9);
    }
  }
  return v4;
}

- (int64_t)loadLevelAsConfidenceCategoryFromFactor:(id)a3 withDefault:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TRIClient *)self->_triClient levelForFactor:v6 withNamespaceName:@"COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION"];
  v8 = v7;
  if (v7)
  {
    if (([v7 longValue] & 0x8000000000000000) == 0 && objc_msgSend(v8, "longValue") < 5)
    {
      a4 = [v8 longValue];
      goto LABEL_9;
    }
    uint64_t v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSFTZKWTrialWrapper loadLevelAsConfidenceCategoryFromFactor:withDefault:]();
    }
  }
  else
  {
    uint64_t v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSFTZKWTrialWrapper loadLevelAsConfidenceCategoryFromFactor:withDefault:]();
    }
  }

LABEL_9:
  return a4;
}

- (int64_t)loadLevelAsInteractionModelTypeFromFactor:(id)a3 withDefault:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TRIClient *)self->_triClient levelForFactor:v6 withNamespaceName:@"COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION"];
  v8 = v7;
  if (v7)
  {
    if (([v7 longValue] & 0x8000000000000000) == 0 && objc_msgSend(v8, "longValue") < 3)
    {
      a4 = [v8 longValue];
      goto LABEL_9;
    }
    uint64_t v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSFTZKWTrialWrapper loadLevelAsInteractionModelTypeFromFactor:withDefault:]();
    }
  }
  else
  {
    uint64_t v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSFTZKWTrialWrapper loadLevelAsConfidenceCategoryFromFactor:withDefault:]();
    }
  }

LABEL_9:
  return a4;
}

- (void)loadFactors
{
  v3 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: (Re)-Loading Trial factors.", buf, 2u);
  }

  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35___PSFTZKWTrialWrapper_loadFactors__block_invoke;
  v6[3] = &unk_1E5ADEDD0;
  v6[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v6];
  uint64_t v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Finished (re)-loading Trial factors.", buf, 2u);
  }
}

- (void)runWithData:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36___PSFTZKWTrialWrapper_runWithData___block_invoke;
  v7[3] = &unk_1E5AE13C0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

- (void)runIfUpdated:(id)a3
{
  id v4 = a3;
  updateLock = self->_updateLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37___PSFTZKWTrialWrapper_runIfUpdated___block_invoke;
  v7[3] = &unk_1E5AE13E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)updateLock runWithLockAcquired:v7];
}

- (TRIClient)triClient
{
  return self->_triClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triClient, 0);
  objc_storeStrong((id *)&self->_updateLock, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)loadLevelAsBooleanFromFactor:(NSObject *)a3 withDefault:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  v3 = @"YES";
  if ((a2 & 1) == 0) {
    v3 = @"NO";
  }
  *(_DWORD *)id v4 = 138412546;
  *(void *)&v4[4] = a1;
  *(_WORD *)&v4[12] = 2112;
  *(void *)&v4[14] = v3;
  OUTLINED_FUNCTION_7(&dword_1A314B000, a2, a3, "_PSFTZKWTrialWrapper: TRILevel is nil for %@. Using default of %@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], *MEMORY[0x1E4F143B8]);
}

- (void)loadLevelAsConfidenceCategoryFromFactor:withDefault:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "_PSFTZKWTrialWrapper: TRILevel is nil for %@. Using default of %ld");
}

- (void)loadLevelAsConfidenceCategoryFromFactor:withDefault:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "_PSFTZKWTrialWrapper: TRILevel is out-of-range for ATXProactiveSuggestionConfidenceCategory: %@. Using default of %ld");
}

- (void)loadLevelAsInteractionModelTypeFromFactor:withDefault:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "_PSFTZKWTrialWrapper: TRILevel is out-of-range for _PSInteractionModelType: %@. Using default of %ld");
}

@end