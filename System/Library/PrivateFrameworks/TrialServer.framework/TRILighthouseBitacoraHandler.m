@interface TRILighthouseBitacoraHandler
+ (BOOL)donateTrialIdentifiers:(id)a3 eventType:(unsigned __int8)a4 succeeded:(BOOL)a5 error:(id *)a6;
+ (BOOL)emitBMLTEventWithBMLTId:(id)a3 deploymentId:(int)a4 eventType:(unsigned __int8)a5 succeeded:(BOOL)a6;
+ (BOOL)emitShadowEvaluationEventWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5 eventType:(unsigned __int8)a6 succeeded:(BOOL)a7;
@end

@implementation TRILighthouseBitacoraHandler

+ (BOOL)donateTrialIdentifiers:(id)a3 eventType:(unsigned __int8)a4 succeeded:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  int v8 = a4;
  id v11 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v12 = (void *)_MergedGlobals_33;
  uint64_t v32 = _MergedGlobals_33;
  if (!_MergedGlobals_33)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getLBFTrialEventClass_block_invoke;
    v27 = &unk_1E6BB8968;
    v28 = &v29;
    __getLBFTrialEventClass_block_invoke((uint64_t)&v24);
    v12 = (void *)v30[3];
  }
  v13 = v12;
  _Block_object_dispose(&v29, 8);
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:a1 file:@"TRILighthouseBitacoraHandler.m" lineNumber:32 description:@"Unable to load soft-linked LBFTrialEvent class"];
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v14 = (void *)qword_1EA8D7FC0;
  uint64_t v32 = qword_1EA8D7FC0;
  if (!qword_1EA8D7FC0)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getLBFEventManagerClass_block_invoke;
    v27 = &unk_1E6BB8968;
    v28 = &v29;
    __getLBFEventManagerClass_block_invoke((uint64_t)&v24);
    v14 = (void *)v30[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v29, 8);
  if (!v15)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:a1 file:@"TRILighthouseBitacoraHandler.m" lineNumber:34 description:@"Unable to load soft-linked LBFEventManager class"];
  }
  switch(v8)
  {
    case 2:
      uint64_t v16 = [[v13 alloc] initWithDeactivation:v7];
      goto LABEL_15;
    case 1:
      uint64_t v16 = [[v13 alloc] initWithActivation:v7];
      goto LABEL_15;
    case 0:
      uint64_t v16 = [[v13 alloc] initWithAllocation:v7];
LABEL_15:
      v17 = (void *)v16;
      goto LABEL_19;
  }
  v18 = TRILogCategory_Server();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v24) = 0;
    _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Received unknown event in bitacora handler.", (uint8_t *)&v24, 2u);
  }

  v17 = 0;
LABEL_19:
  v19 = [v15 sharedInstance];
  char v20 = [v19 addTrialdEvent:v17 identifiers:v11 error:a6];

  return v20;
}

+ (BOOL)emitBMLTEventWithBMLTId:(id)a3 deploymentId:(int)a4 eventType:(unsigned __int8)a5 succeeded:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  char v12 = 0;
  if (v11 && v8)
  {
    LBFTrialIdentifiersClass = (objc_class *)getLBFTrialIdentifiersClass();
    if (!LBFTrialIdentifiersClass)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:a1 file:@"TRILighthouseBitacoraHandler.m" lineNumber:65 description:@"Unable to load soft-linked LBFTrialIdentifiers class"];
    }
    v14 = (void *)[[LBFTrialIdentifiersClass alloc] initWithBMLTTaskID:v11 deploymentID:v8];
    id v19 = 0;
    char v12 = [a1 donateTrialIdentifiers:v14 eventType:v7 succeeded:v6 error:&v19];
    id v15 = v19;
    if (v15)
    {
      uint64_t v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478339;
        id v21 = v15;
        __int16 v22 = 2114;
        id v23 = v11;
        __int16 v24 = 1024;
        int v25 = v8;
        _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Bitacora error :%{private}@ for BMLT id: %{public}@ deployment:%d", buf, 0x1Cu);
      }
    }
  }

  return v12;
}

+ (BOOL)emitShadowEvaluationEventWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5 eventType:(unsigned __int8)a6 succeeded:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a6;
  uint64_t v10 = *(void *)&a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  v14 = (__CFString *)a5;
  char v15 = 0;
  if (v13 && v10)
  {
    LBFTrialIdentifiersClass = (objc_class *)getLBFTrialIdentifiersClass();
    if (!LBFTrialIdentifiersClass)
    {
      id v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:a1 file:@"TRILighthouseBitacoraHandler.m" lineNumber:91 description:@"Unable to load soft-linked LBFTrialIdentifiers class"];
    }
    id v17 = [LBFTrialIdentifiersClass alloc];
    if (v14) {
      v18 = v14;
    }
    else {
      v18 = &stru_1F3455898;
    }
    id v19 = (void *)[v17 initWithExperimentID:v13 deploymentID:v10 treatmentID:v18];
    id v24 = 0;
    char v15 = [a1 donateTrialIdentifiers:v19 eventType:v8 succeeded:v7 error:&v24];
    id v20 = v24;
    if (v20)
    {
      id v21 = TRILogCategory_Server();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478595;
        id v26 = v20;
        __int16 v27 = 2114;
        id v28 = v13;
        __int16 v29 = 1024;
        int v30 = v10;
        __int16 v31 = 2114;
        uint64_t v32 = v14;
        _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Bitacora error :%{private}@ for shadow evaluation with experimentId: %{public}@ deployment:%d treatment:%{public}@", buf, 0x26u);
      }
    }
  }

  return v15;
}

@end