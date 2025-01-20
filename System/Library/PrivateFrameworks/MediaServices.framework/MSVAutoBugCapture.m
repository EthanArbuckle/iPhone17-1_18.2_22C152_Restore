@interface MSVAutoBugCapture
+ (BOOL)_isReporterEnabled;
+ (void)snapshotWithDomain:(id)a3 type:(id)a4 subType:(id)a5 context:(id)a6 triggerThresholdValues:(id)a7 events:(id)a8 completion:(id)a9;
@end

@implementation MSVAutoBugCapture

+ (BOOL)_isReporterEnabled
{
  return os_variant_has_internal_content();
}

+ (void)snapshotWithDomain:(id)a3 type:(id)a4 subType:(id)a5 context:(id)a6 triggerThresholdValues:(id)a7 events:(id)a8 completion:(id)a9
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v29 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = (void (**)(void))a9;
  if ([a1 _isReporterEnabled])
  {
    v20 = os_log_create("com.apple.amp.MediaServices", "Analytics");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v37 = v16;
      LOWORD(v38[0]) = 2112;
      *(void *)((char *)v38 + 2) = v17;
      _os_log_impl(&dword_1A30CD000, v20, OS_LOG_TYPE_DEFAULT, "SymptomDiagnosticReporter starting to report a snapshot with type:%@ subType:%@ context:%@ thresholdValues:%@", buf, 0x2Au);
    }

    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    v21 = (void *)getSDRDiagnosticReporterClass_softClass;
    uint64_t v35 = getSDRDiagnosticReporterClass_softClass;
    if (!getSDRDiagnosticReporterClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSDRDiagnosticReporterClass_block_invoke;
      v37 = &unk_1E5ADA318;
      v38[0] = &v32;
      __getSDRDiagnosticReporterClass_block_invoke((uint64_t)buf);
      v21 = (void *)v33[3];
    }
    v22 = v21;
    _Block_object_dispose(&v32, 8);
    id v23 = objc_alloc_init(v22);
    v24 = [MEMORY[0x1E4F28F80] processInfo];
    v25 = [v24 processName];

    v26 = [v23 signatureWithDomain:v28 type:v29 subType:v15 subtypeContext:v16 detectedProcess:v25 triggerThresholdValues:v17];
    v27 = _MSVTransformStateValue(v18);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __102__MSVAutoBugCapture_snapshotWithDomain_type_subType_context_triggerThresholdValues_events_completion___block_invoke;
    v30[3] = &unk_1E5AD9FC0;
    v31 = v19;
    [v23 snapshotWithSignature:v26 delay:v27 events:0 payload:MEMORY[0x1E4F1CC08] actions:v30 reply:0.0];
  }
  else if (v19)
  {
    v19[2](v19);
  }
}

void __102__MSVAutoBugCapture_snapshotWithDomain_type_subType_context_triggerThresholdValues_events_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  v4 = (void *)getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  uint64_t v60 = getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplySuccessSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkSymptomDiagnosticReplySuccessSymbolLoc_block_invoke;
    v62 = &unk_1E5ADA318;
    v63 = &v57;
    v5 = SymptomDiagnosticReporterLibrary();
    v6 = dlsym(v5, "kSymptomDiagnosticReplySuccess");
    *(void *)(v63[1] + 24) = v6;
    getkSymptomDiagnosticReplySuccessSymbolLoc_ptr = *(void *)(v63[1] + 24);
    v4 = (void *)v58[3];
  }
  _Block_object_dispose(&v57, 8);
  if (!v4)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    v42 = [NSString stringWithUTF8String:"NSString *getkSymptomDiagnosticReplySuccess(void)"];
    objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, @"MSVAutoBugCapture.m", 33, @"%s", dlerror());

    goto LABEL_49;
  }
  v7 = [v3 objectForKeyedSubscript:*v4];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    v9 = (id *)getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr;
    uint64_t v60 = getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr;
    if (!getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getkSymptomDiagnosticReplySessionIDSymbolLoc_block_invoke;
      v62 = &unk_1E5ADA318;
      v63 = &v57;
      v10 = SymptomDiagnosticReporterLibrary();
      v11 = dlsym(v10, "kSymptomDiagnosticReplySessionID");
      *(void *)(v63[1] + 24) = v11;
      getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr = *(void *)(v63[1] + 24);
      v9 = (id *)v58[3];
    }
    _Block_object_dispose(&v57, 8);
    if (v9)
    {
      id v12 = *v9;
      v13 = [v3 objectForKeyedSubscript:v12];

      v14 = os_log_create("com.apple.amp.MediaServices", "Analytics");
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      id v15 = "SymptomDiagnosticReporter snapshot accepted with sessionID %@";
      id v16 = v14;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      uint32_t v18 = 12;
      goto LABEL_35;
    }
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    v44 = [NSString stringWithUTF8String:"NSString *getkSymptomDiagnosticReplySessionID(void)"];
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, @"MSVAutoBugCapture.m", 34, @"%s", dlerror());

LABEL_49:
    __break(1u);
  }
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  v19 = (void *)getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  uint64_t v60 = getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplyReasonSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkSymptomDiagnosticReplyReasonSymbolLoc_block_invoke;
    v62 = &unk_1E5ADA318;
    v63 = &v57;
    v20 = SymptomDiagnosticReporterLibrary();
    v21 = dlsym(v20, "kSymptomDiagnosticReplyReason");
    *(void *)(v63[1] + 24) = v21;
    getkSymptomDiagnosticReplyReasonSymbolLoc_ptr = *(void *)(v63[1] + 24);
    v19 = (void *)v58[3];
  }
  _Block_object_dispose(&v57, 8);
  if (!v19)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    v46 = [NSString stringWithUTF8String:"NSString *getkSymptomDiagnosticReplyReason(void)"];
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, @"MSVAutoBugCapture.m", 35, @"%s", dlerror());

    goto LABEL_49;
  }
  v22 = [v3 objectForKeyedSubscript:*v19];
  int v23 = [v22 intValue];

  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  v24 = (id *)getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr;
  uint64_t v60 = getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkSymptomDiagnosticReplyReasonStringSymbolLoc_block_invoke;
    v62 = &unk_1E5ADA318;
    v63 = &v57;
    v25 = SymptomDiagnosticReporterLibrary();
    v26 = dlsym(v25, "kSymptomDiagnosticReplyReasonString");
    *(void *)(v63[1] + 24) = v26;
    getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr = *(void *)(v63[1] + 24);
    v24 = (id *)v58[3];
  }
  _Block_object_dispose(&v57, 8);
  if (!v24)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    v48 = [NSString stringWithUTF8String:"NSString *getkSymptomDiagnosticReplyReasonString(void)"];
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, @"MSVAutoBugCapture.m", 36, @"%s", dlerror());

    goto LABEL_49;
  }
  id v27 = *v24;
  v13 = [v3 objectForKeyedSubscript:v27];

  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  id v28 = (_DWORD *)getkSymptomDiagnosticErrorDisabledSymbolLoc_ptr;
  uint64_t v60 = getkSymptomDiagnosticErrorDisabledSymbolLoc_ptr;
  if (!getkSymptomDiagnosticErrorDisabledSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkSymptomDiagnosticErrorDisabledSymbolLoc_block_invoke;
    v62 = &unk_1E5ADA318;
    v63 = &v57;
    id v29 = SymptomDiagnosticReporterLibrary();
    v30 = dlsym(v29, "kSymptomDiagnosticErrorDisabled");
    *(void *)(v63[1] + 24) = v30;
    getkSymptomDiagnosticErrorDisabledSymbolLoc_ptr = *(void *)(v63[1] + 24);
    id v28 = (_DWORD *)v58[3];
  }
  _Block_object_dispose(&v57, 8);
  if (!v28)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    v50 = [NSString stringWithUTF8String:"int getkSymptomDiagnosticErrorDisabled(void)"];
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, @"MSVAutoBugCapture.m", 38, @"%s", dlerror());

    goto LABEL_49;
  }
  if (*v28 == v23) {
    goto LABEL_32;
  }
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  v31 = (_DWORD *)getkSymptomDiagnosticErrorHourlyLimitExceededSymbolLoc_ptr;
  uint64_t v60 = getkSymptomDiagnosticErrorHourlyLimitExceededSymbolLoc_ptr;
  if (!getkSymptomDiagnosticErrorHourlyLimitExceededSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkSymptomDiagnosticErrorHourlyLimitExceededSymbolLoc_block_invoke;
    v62 = &unk_1E5ADA318;
    v63 = &v57;
    uint64_t v32 = SymptomDiagnosticReporterLibrary();
    v33 = dlsym(v32, "kSymptomDiagnosticErrorHourlyLimitExceeded");
    *(void *)(v63[1] + 24) = v33;
    getkSymptomDiagnosticErrorHourlyLimitExceededSymbolLoc_ptr = *(void *)(v63[1] + 24);
    v31 = (_DWORD *)v58[3];
  }
  _Block_object_dispose(&v57, 8);
  if (!v31)
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    v52 = [NSString stringWithUTF8String:"int getkSymptomDiagnosticErrorHourlyLimitExceeded(void)"];
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, @"MSVAutoBugCapture.m", 39, @"%s", dlerror());

    goto LABEL_49;
  }
  if (*v31 == v23) {
    goto LABEL_32;
  }
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v34 = (_DWORD *)getkSymptomDiagnosticErrorDailyLimitExceededSymbolLoc_ptr;
  uint64_t v60 = getkSymptomDiagnosticErrorDailyLimitExceededSymbolLoc_ptr;
  if (!getkSymptomDiagnosticErrorDailyLimitExceededSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkSymptomDiagnosticErrorDailyLimitExceededSymbolLoc_block_invoke;
    v62 = &unk_1E5ADA318;
    v63 = &v57;
    uint64_t v35 = SymptomDiagnosticReporterLibrary();
    v36 = dlsym(v35, "kSymptomDiagnosticErrorDailyLimitExceeded");
    *(void *)(v63[1] + 24) = v36;
    getkSymptomDiagnosticErrorDailyLimitExceededSymbolLoc_ptr = *(void *)(v63[1] + 24);
    uint64_t v34 = (_DWORD *)v58[3];
  }
  _Block_object_dispose(&v57, 8);
  if (!v34)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    v54 = [NSString stringWithUTF8String:"int getkSymptomDiagnosticErrorDailyLimitExceeded(void)"];
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, @"MSVAutoBugCapture.m", 40, @"%s", dlerror());

    goto LABEL_49;
  }
  if (*v34 == v23) {
    goto LABEL_32;
  }
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  v37 = (_DWORD *)getkSymptomDiagnosticErrorRandomizedSuppressionSymbolLoc_ptr;
  uint64_t v60 = getkSymptomDiagnosticErrorRandomizedSuppressionSymbolLoc_ptr;
  if (!getkSymptomDiagnosticErrorRandomizedSuppressionSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkSymptomDiagnosticErrorRandomizedSuppressionSymbolLoc_block_invoke;
    v62 = &unk_1E5ADA318;
    v63 = &v57;
    v38 = SymptomDiagnosticReporterLibrary();
    v39 = dlsym(v38, "kSymptomDiagnosticErrorRandomizedSuppression");
    *(void *)(v63[1] + 24) = v39;
    getkSymptomDiagnosticErrorRandomizedSuppressionSymbolLoc_ptr = *(void *)(v63[1] + 24);
    v37 = (_DWORD *)v58[3];
  }
  _Block_object_dispose(&v57, 8);
  if (!v37)
  {
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    v56 = [NSString stringWithUTF8String:"int getkSymptomDiagnosticErrorRandomizedSuppression(void)"];
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, @"MSVAutoBugCapture.m", 41, @"%s", dlerror());

    goto LABEL_49;
  }
  if (*v37 == v23)
  {
LABEL_32:
    v14 = os_log_create("com.apple.amp.MediaServices", "Analytics");
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v23;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v13;
    id v15 = "SymptomDiagnosticReporter snapshot rejected with expected reason %d (%@)";
    id v16 = v14;
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_34;
  }
  v14 = os_log_create("com.apple.amp.MediaServices", "Analytics");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v23;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v13;
    id v15 = "SymptomDiagnosticReporter snapshot rejected with unexpected reason %d (%@)";
    id v16 = v14;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
LABEL_34:
    uint32_t v18 = 18;
LABEL_35:
    _os_log_impl(&dword_1A30CD000, v16, v17, v15, buf, v18);
  }
LABEL_36:

  uint64_t v40 = *(void *)(a1 + 32);
  if (v40) {
    (*(void (**)(void))(v40 + 16))();
  }
}

@end