@interface CRFormFieldAutoFillGuardingStep
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
@end

@implementation CRFormFieldAutoFillGuardingStep

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = CROSLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v6 count];
    _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldAutoFillGuardingStep is running (#input:%lu).", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 1;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 1;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  id v28 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__CRFormFieldAutoFillGuardingStep_process_externalFields_document_options___block_invoke;
  v11[3] = &unk_1E6CDADC0;
  v11[4] = &v12;
  v11[5] = &buf;
  v11[6] = &v16;
  v11[7] = &v20;
  +[CRFormPostProcessingManager enumerateDetectedFields:v6 block:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13[3] = 1;
    BOOL v8 = +[CRFormContentTypeUtilities contentTypeIsStartOfAutofillContext:v17[3] previousType:v21[3] nextType:1];
    [*(id *)(*((void *)&buf + 1) + 40) setAutofillNewContextStart:v8];
  }
  id v9 = v6;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v9;
}

void __75__CRFormFieldAutoFillGuardingStep_process_externalFields_document_options___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 fieldType] == 1) {
    uint64_t v4 = [v3 textContentType];
  }
  else {
    uint64_t v4 = 1;
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = v4;
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "setAutofillNewContextStart:", +[CRFormContentTypeUtilities contentTypeIsStartOfAutofillContext:previousType:nextType:](CRFormContentTypeUtilities, "contentTypeIsStartOfAutofillContext:previousType:nextType:", *(void *)(*(void *)(a1[6] + 8) + 24), *(void *)(*(void *)(a1[7] + 8) + 24), *(void *)(*(void *)(a1[4] + 8) + 24)));
    }
  }
  *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(*(void *)(a1[6] + 8) + 24);
  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(*(void *)(a1[4] + 8) + 24);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

@end