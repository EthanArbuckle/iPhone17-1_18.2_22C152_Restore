@interface _PSCNAutocompleteFeedbackProcessingTask
+ (id)bookmarkFileNameForImplicit:(BOOL)a3;
+ (id)bundleIDsToProcess;
+ (id)loadBookmarkTimeOverImplicit:(BOOL)a3 from:(id)a4;
+ (id)sourceBundleIDsToIgnore;
+ (void)persistBookmarkTime:(id)a3 overImplicit:(BOOL)a4 to:(id)a5;
+ (void)runOverExplicit;
+ (void)runOverImplicit;
+ (void)runWithInferredEnterAndExit:(BOOL)a3 overImplicit:(BOOL)a4 eventFilter:(id)a5;
- (void)execute;
@end

@implementation _PSCNAutocompleteFeedbackProcessingTask

+ (id)bundleIDsToProcess
{
  v2 = (void *)MEMORY[0x1A6243860](a1, a2);
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4 = +[_PSConstants mobileFacetimeBundleId];
  v5 = +[_PSConstants macFacetimeBundleId];
  v6 = objc_msgSend(v3, "initWithObjects:", v4, v5, 0);

  return v6;
}

+ (id)sourceBundleIDsToIgnore
{
  v2 = (void *)MEMORY[0x1A6243860](a1, a2);
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"pstool", 0);

  return v3;
}

+ (id)bookmarkFileNameForImplicit:(BOOL)a3
{
  if (a3) {
    id v3 = @".metadata.archive";
  }
  else {
    id v3 = @"-explicit.metadata.archive";
  }
  v4 = [@"CNA" stringByAppendingString:v3];

  return v4;
}

+ (void)persistBookmarkTime:(id)a3 overImplicit:(BOOL)a4 to:(id)a5
{
  BOOL v5 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v17 = 0;
  v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v17];
  id v10 = v17;
  if (v10)
  {
    id v11 = v10;
    v12 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: Could not archive bookmark time. %@", buf, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  v13 = (void *)MEMORY[0x1E4F1CB10];
  v14 = [a1 bookmarkFileNameForImplicit:v5];
  v15 = [v13 URLWithString:v14 relativeToURL:v8];
  id v16 = 0;
  [v9 writeToURL:v15 options:0 error:&v16];
  id v11 = v16;

  if (v11)
  {
    v12 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[_PSCNAutocompleteFeedbackProcessingTask persistBookmarkTime:overImplicit:to:]();
    }
    goto LABEL_7;
  }
LABEL_8:
}

+ (id)loadBookmarkTimeOverImplicit:(BOOL)a3 from:(id)a4
{
  BOOL v4 = a3;
  v6 = (void *)MEMORY[0x1E4F1C9B8];
  v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = a4;
  v9 = [a1 bookmarkFileNameForImplicit:v4];
  id v10 = [v7 URLWithString:v9 relativeToURL:v8];

  id v11 = [v6 dataWithContentsOfURL:v10 options:0 error:0];

  if (v11)
  {
    id v17 = 0;
    v12 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClass:fromData:error:", objc_msgSend(MEMORY[0x1E4F1C9C8], "classForKeyedUnarchiver"), v11, &v17);
    v13 = v17;
    if (v13)
    {
      v14 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[_PSCNAutocompleteFeedbackProcessingTask loadBookmarkTimeOverImplicit:from:]();
      }

      id v15 = 0;
    }
    else
    {
      id v15 = v12;
    }
  }
  else
  {
    v13 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v13, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: Could not read archive containing bookmark time (may not exist).", buf, 2u);
    }
    id v15 = 0;
  }

  return v15;
}

+ (void)runWithInferredEnterAndExit:(BOOL)a3 overImplicit:(BOOL)a4 eventFilter:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v49 = a5;
  v7 = +[_PSLogging feedbackChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (v5) {
      id v8 = @"YES";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: starting over implicit == %@.", (uint8_t *)&buf, 0xCu);
  }

  v51 = objc_opt_new();
  [v51 setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
  v9 = (void *)MEMORY[0x1E4F1CB10];
  id v10 = [MEMORY[0x1E4F5B420] peopleDirectory];
  id v11 = [v9 fileURLWithPath:v10 isDirectory:1];
  v12 = [v9 fileURLWithPath:@"Feedback" isDirectory:1 relativeToURL:v11];

  if (v12)
  {
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    v13 = (void *)getBMStoreConfigClass_softClass_0;
    uint64_t v62 = getBMStoreConfigClass_softClass_0;
    if (!getBMStoreConfigClass_softClass_0)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v64 = __getBMStoreConfigClass_block_invoke_0;
      v65 = &unk_1E5ADE858;
      v66 = &v59;
      __getBMStoreConfigClass_block_invoke_0((uint64_t)&buf);
      v13 = (void *)v60[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v59, 8);
    id v15 = [v12 path];
    uint64_t v48 = [v14 newPrivateStreamDefaultConfigurationWithStoreBasePath:v15];

    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    id v16 = (void *)getBMStoreStreamClass_softClass_0;
    uint64_t v62 = getBMStoreStreamClass_softClass_0;
    if (!getBMStoreStreamClass_softClass_0)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v64 = __getBMStoreStreamClass_block_invoke_0;
      v65 = &unk_1E5ADE858;
      v66 = &v59;
      __getBMStoreStreamClass_block_invoke_0((uint64_t)&buf);
      id v16 = (void *)v60[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v59, 8);
    v46 = (void *)[[v17 alloc] initWithPrivateStreamIdentifier:@"CNA" storeConfig:v48];
    v18 = [(id)objc_opt_class() loadBookmarkTimeOverImplicit:v5 from:v12];
    v47 = v18;
    if (v18)
    {
      id v50 = v18;
      id v19 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [v51 stringFromDate:v50];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: Found bookmark from last time feedback was processed. Starting from %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      id v50 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2592000.0];
      id v19 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v51 stringFromDate:v50];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v23;
        _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: No bookmark found from last time feedback processed. Starting from 30 days ago: %@", (uint8_t *)&buf, 0xCu);
      }
    }

    [v50 timeIntervalSinceReferenceDate];
    v45 = [v46 publisherFromStartTime:v24 + 1.0];
    v25 = (void *)MEMORY[0x1E4F5B400];
    v26 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
    v27 = [v25 storeWithDirectory:v26 readOnly:1];

    v28 = [_PSCNAutocompleteFeedbackInteractionIterator alloc];
    v29 = [(id)objc_opt_class() bundleIDsToProcess];
    v30 = [(_PSCNAutocompleteFeedbackInteractionIterator *)v28 initWithInteractionStore:v27 bundleIds:v29 startDate:v50 batchSize:100];

    LOBYTE(v44) = v5;
    v31 = [[_PSCNAutocompleteFeedbackTracker alloc] initWithInteractionIterator:v30 maxSecondsBetweenImpressionAndAction:60 shouldInferEnterAndExit:v6 impressionLogger:&__block_literal_global_38 submodelImpressionLogger:&__block_literal_global_168 actionLogger:&__block_literal_global_171 defaultForIsImplicit:v44];
    v32 = [(id)objc_opt_class() sourceBundleIDsToIgnore];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __96___PSCNAutocompleteFeedbackProcessingTask_runWithInferredEnterAndExit_overImplicit_eventFilter___block_invoke_173;
    v54[3] = &unk_1E5AE1448;
    BOOL v58 = v5;
    id v57 = v49;
    id v33 = v32;
    id v55 = v33;
    v34 = v31;
    v56 = v34;
    v35 = (void *)MEMORY[0x1A6243AD0](v54);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __96___PSCNAutocompleteFeedbackProcessingTask_runWithInferredEnterAndExit_overImplicit_eventFilter___block_invoke_185;
    v52[3] = &unk_1E5AE1470;
    v36 = v34;
    v53 = v36;
    v37 = (void *)MEMORY[0x1A6243AD0](v52);
    id v38 = (id)[v45 sinkWithCompletion:v37 receiveInput:v35];
    v39 = [(_PSCNAutocompleteFeedbackTracker *)v36 stopTime];

    if (v39)
    {
      v40 = objc_opt_class();
      v41 = [(_PSCNAutocompleteFeedbackTracker *)v36 stopTime];
      [v40 persistBookmarkTime:v41 overImplicit:v5 to:v12];
    }
    [v27 closeStorage];
    v42 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = @"NO";
      if (v5) {
        v43 = @"YES";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v43;
      _os_log_impl(&dword_1A314B000, v42, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: finished over implicit == %@.", (uint8_t *)&buf, 0xCu);
    }

    v22 = (void *)v48;
  }
  else
  {
    v21 = +[_PSLogging feedbackChannel];
    v22 = v21;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      +[_PSCNAutocompleteFeedbackProcessingTask runWithInferredEnterAndExit:overImplicit:eventFilter:](v21);
      v22 = v21;
    }
  }
}

+ (void)runOverExplicit
{
}

+ (void)runOverImplicit
{
}

- (void)execute
{
  [(id)objc_opt_class() runOverExplicit];
  v2 = objc_opt_class();

  [v2 runOverImplicit];
}

+ (void)persistBookmarkTime:overImplicit:to:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A314B000, v0, OS_LOG_TYPE_ERROR, "_PSCNAutocompleteFeedbackProcessingTask: Could not write archive containing bookmark time. %@", v1, 0xCu);
}

+ (void)loadBookmarkTimeOverImplicit:from:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A314B000, v0, OS_LOG_TYPE_ERROR, "_PSCNAutocompleteFeedbackProcessingTask: Could not unarchive bookmark time. %@", v1, 0xCu);
}

+ (void)runWithInferredEnterAndExit:(os_log_t)log overImplicit:eventFilter:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "_PSCNAutocompleteFeedbackProcessingTask: Error retrieving directory for Biome stream data", v1, 2u);
}

@end