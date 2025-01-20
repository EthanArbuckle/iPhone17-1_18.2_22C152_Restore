@interface CRFormTextBasedFieldDedupingStep
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
@end

@implementation CRFormTextBasedFieldDedupingStep

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = CROSLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormTextBasedFieldDedupingStep is running.", buf, 2u);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke;
  v31[3] = &unk_1E6CDAC70;
  id v9 = v6;
  id v32 = v9;
  id v10 = v8;
  id v33 = v10;
  +[CRFormPostProcessingManager enumerateTextBasedDetectedFields:v9 block:v31];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_4;
  v28[3] = &unk_1E6CDAC70;
  id v11 = v10;
  id v29 = v11;
  id v12 = v9;
  id v30 = v12;
  +[CRFormPostProcessingManager enumerateTextBasedDetectedFields:v12 block:v28];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v11, "containsObject:", v18, (void)v24) & 1) == 0) {
          [v13 addObject:v18];
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v40 count:16];
    }
    while (v15);
  }

  v19 = CROSLogForCategory(6);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = [v11 count];
    uint64_t v21 = [v14 count];
    uint64_t v22 = [v13 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v35 = v20;
    __int16 v36 = 2048;
    uint64_t v37 = v21;
    __int16 v38 = 2048;
    uint64_t v39 = v22;
    _os_log_impl(&dword_1DD733000, v19, OS_LOG_TYPE_DEBUG, "CRFormTextBasedFieldDedupingStep removed %ld text fields from %ld fields, preserving %ld fields.", buf, 0x20u);
  }

  return v13;
}

void __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 boundingQuad];
  [v4 boundingBox];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;

  id v13 = [v3 boundingQuad];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  id v14 = objc_opt_class();
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_3;
  uint64_t v20 = &unk_1E6CDACE0;
  uint64_t v23 = v6;
  uint64_t v24 = v8;
  uint64_t v25 = v10;
  uint64_t v26 = v12;
  uint64_t v22 = &v27;
  id v16 = v13;
  id v21 = v16;
  [v14 enumerateFieldsInFields:v15 filter:&__block_literal_global_192 block:&v17];
  if (*((unsigned char *)v28 + 24)) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3, v17, v18, v19, v20);
  }

  _Block_object_dispose(&v27, 8);
}

BOOL __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 fieldSource] != 3;
}

void __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v26 = a2;
  uint64_t v5 = [v26 boundingQuad];
  [v5 boundingBox];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v32.origin.CGFloat x = v7;
  v32.origin.CGFloat y = v9;
  v32.size.CGFloat width = v11;
  v32.size.CGFloat height = v13;
  if (CGRectContainsRect(*(CGRect *)(a1 + 48), v32)
    || (v28.origin.CGFloat x = v7,
        v28.origin.CGFloat y = v9,
        v28.size.CGFloat width = v11,
        v28.size.CGFloat height = v13,
        CGRectContainsRect(v28, *(CGRect *)(a1 + 48))))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    id v14 = [v26 boundingQuad];
    [v14 boundingBoxIOUWithQuad:*(void *)(a1 + 32)];
    if (v15 > 0.05) {
      goto LABEL_9;
    }
    v33.origin.CGFloat x = v7;
    v33.origin.CGFloat y = v9;
    v33.size.CGFloat width = v11;
    v33.size.CGFloat height = v13;
    CGRect v29 = CGRectIntersection(*(CGRect *)(a1 + 48), v33);
    CGFloat x = v29.origin.x;
    CGFloat y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
    double v20 = CGRectGetWidth(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double v21 = CGRectGetHeight(v30);
    double v22 = CGRectGetWidth(*(CGRect *)(a1 + 48));
    double v23 = CGRectGetHeight(*(CGRect *)(a1 + 48));
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    BOOL IsNull = CGRectIsNull(v31);
    char v25 = v20 * v21 / (v22 * v23) <= 0.5 || IsNull;
    if ((v25 & 1) == 0)
    {
LABEL_9:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

void __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    v4 = [v3 boundingQuad];
    [v4 boundingBox];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;

    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    CGFloat v13 = objc_opt_class();
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_5;
    v19 = &unk_1E6CDACE0;
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(id *)(a1 + 32);
    uint64_t v22 = v6;
    uint64_t v23 = v8;
    uint64_t v24 = v10;
    uint64_t v25 = v12;
    id v20 = v15;
    double v21 = &v26;
    [v13 enumerateTextBasedDetectedFields:v14 block:&v16];
    if (*((unsigned char *)v27 + 24)) {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3, v16, v17, v18, v19);
    }

    _Block_object_dispose(&v26, 8);
  }
}

void __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_5(uint64_t a1, void *a2, unsigned char *a3)
{
  id v25 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    uint64_t v5 = [v25 boundingQuad];
    [v5 boundingBox];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v32.origin.CGFloat x = v7;
    v32.origin.CGFloat y = v9;
    v32.size.CGFloat width = v11;
    v32.size.CGFloat height = v13;
    CGRect v27 = CGRectIntersection(*(CGRect *)(a1 + 48), v32);
    CGFloat x = v27.origin.x;
    CGFloat y = v27.origin.y;
    CGFloat width = v27.size.width;
    CGFloat height = v27.size.height;
    double v24 = CGRectGetWidth(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double v23 = CGRectGetHeight(v28);
    v29.origin.CGFloat x = v7;
    v29.origin.CGFloat y = v9;
    v29.size.CGFloat width = v11;
    v29.size.CGFloat height = v13;
    double v22 = CGRectGetWidth(v29);
    v30.origin.CGFloat x = v7;
    v30.origin.CGFloat y = v9;
    v30.size.CGFloat width = v11;
    v30.size.CGFloat height = v13;
    double v18 = CGRectGetHeight(v30);
    double v19 = CGRectGetWidth(*(CGRect *)(a1 + 48));
    double v20 = CGRectGetHeight(*(CGRect *)(a1 + 48));
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    if (!CGRectIsNull(v31) && v24 * v23 / (v19 * v20) > 0.3 && v19 * v20 < v22 * v18)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

@end