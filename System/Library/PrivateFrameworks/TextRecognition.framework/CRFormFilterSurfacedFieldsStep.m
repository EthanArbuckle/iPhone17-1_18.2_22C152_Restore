@interface CRFormFilterSurfacedFieldsStep
- (BOOL)assignGlobalOrder;
- (CRFormFilterSurfacedFieldsStep)initWithAssignGlobalOrder:(BOOL)a3;
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
- (void)_setGlobalIndexesForFields:(id)a3 externalFields:(id)a4;
@end

@implementation CRFormFilterSurfacedFieldsStep

- (CRFormFilterSurfacedFieldsStep)initWithAssignGlobalOrder:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRFormFilterSurfacedFieldsStep;
  result = [(CRFormFilterSurfacedFieldsStep *)&v5 init];
  if (result) {
    result->_assignGlobalOrder = a3;
  }
  return result;
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v29 = a4;
  id v10 = a6;
  v11 = CROSLogForCategory(6);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = [v9 count];
    _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFilterSurfacedFieldsStep is running (#input:%lu).", buf, 0xCu);
  }

  v12 = [v9 _fieldsOfSource:4];
  v28 = [v9 _fieldsOfSource:6];
  v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_201];
  v14 = [v9 filteredArrayUsingPredicate:v13];

  v15 = objc_msgSend(v10, "objectForKeyedSubscript:", @"ShouldSurfaceContourBasedFormFieldsOption", v12);
  LOBYTE(v13) = [v15 BOOLValue];

  v16 = [v10 objectForKeyedSubscript:@"ShouldSurfaceTextBasedFormFieldsOption"];
  char v17 = [v16 BOOLValue];

  BOOL v18 = [(CRFormFilterSurfacedFieldsStep *)self assignGlobalOrder];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_2;
  v32[3] = &unk_1E6CDAD78;
  char v36 = (char)v13;
  char v37 = v17;
  id v20 = v28;
  id v33 = v20;
  id v21 = v12;
  id v34 = v21;
  BOOL v38 = v18;
  id v22 = v14;
  id v35 = v22;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_6;
  v30[3] = &unk_1E6CDABD0;
  id v23 = v19;
  id v31 = v23;
  +[CRFormPostProcessingManager enumerateFieldsInFields:v9 filter:v32 block:v30];
  v24 = [v23 sortedArrayUsingComparator:&__block_literal_global_206];
  if ([(CRFormFilterSurfacedFieldsStep *)self assignGlobalOrder]) {
    [(CRFormFilterSurfacedFieldsStep *)self _setGlobalIndexesForFields:v24 externalFields:v29];
  }
  v25 = CROSLogForCategory(6);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = [v24 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = v26;
    _os_log_impl(&dword_1DD733000, v25, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFilterSurfacedFieldsStep is completed (#output:%lu).", buf, 0xCu);
  }

  return v24;
}

BOOL __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0
    && [v2 hasMoved]
    && [v2 fieldSource] != 6;

  return v3;
}

BOOL __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 fieldSource];
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v5 = [v3 fieldSource] == 2;
  }
  else {
    BOOL v5 = 0;
  }
  int v6 = *(unsigned __int8 *)(a1 + 57);
  if (*(unsigned char *)(a1 + 57)) {
    int v6 = [v3 fieldSource] == 3;
  }
  char v7 = v4 == 1 || v5;
  if ((v7 & 1) != 0 || v6)
  {
    id v9 = *(void **)(a1 + 32);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_3;
    v25[3] = &unk_1E6CDAD28;
    id v10 = v3;
    id v26 = v10;
    uint64_t v11 = [v9 indexOfObjectPassingTest:v25];
    v12 = *(void **)(a1 + 40);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_4;
    v22[3] = &unk_1E6CDAD50;
    id v13 = v10;
    id v23 = v13;
    char v24 = *(unsigned char *)(a1 + 58);
    uint64_t v14 = [v12 indexOfObjectPassingTest:v22];
    v15 = *(void **)(a1 + 48);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_5;
    v20[3] = &unk_1E6CDAD28;
    id v21 = v13;
    uint64_t v16 = [v15 indexOfObjectPassingTest:v20];
    BOOL v8 = v11 == 0x7FFFFFFFFFFFFFFFLL && v14 == 0x7FFFFFFFFFFFFFFFLL && v16 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

BOOL __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 originalQuad];
  uint64_t v4 = [*(id *)(a1 + 32) boundingQuad];
  [v3 boundingBoxIOUWithQuad:v4];
  BOOL v6 = v5 > 0.9;

  return v6;
}

uint64_t __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 boundingQuad];
  [v4 boundingBox];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  id v13 = [*(id *)(a1 + 32) boundingQuad];
  [v13 boundingBox];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v74.origin.CGFloat x = v6;
  v74.origin.CGFloat y = v8;
  v74.size.CGFloat width = v10;
  v74.size.CGFloat height = v12;
  CGFloat v67 = v17;
  CGFloat v68 = v15;
  v97.origin.CGFloat x = v15;
  v97.origin.CGFloat y = v17;
  CGFloat rect = v21;
  CGFloat v66 = v19;
  v97.size.CGFloat width = v19;
  v97.size.CGFloat height = v21;
  CGRect v75 = CGRectIntersection(v74, v97);
  CGFloat y = v75.origin.y;
  CGFloat x = v75.origin.x;
  CGFloat v22 = v10;
  CGFloat width = v75.size.width;
  CGFloat height = v75.size.height;
  v75.origin.CGFloat x = v6;
  v75.origin.CGFloat y = v8;
  v75.size.CGFloat width = v10;
  v75.size.CGFloat height = v12;
  double v69 = CGRectGetWidth(v75);
  CGFloat v25 = v6;
  v76.origin.CGFloat x = v6;
  v76.origin.CGFloat y = v8;
  v76.size.CGFloat width = v22;
  v76.size.CGFloat height = v12;
  double v26 = CGRectGetHeight(v76);
  CGFloat v72 = v25;
  CGFloat v73 = v8;
  v77.origin.CGFloat x = v25;
  v77.origin.CGFloat y = v8;
  CGFloat v27 = v22;
  v77.size.CGFloat width = v22;
  v77.size.CGFloat height = v12;
  double v28 = CGRectGetWidth(v77);
  double v29 = v12;
  v78.origin.CGFloat x = v72;
  v78.origin.CGFloat y = v73;
  v78.size.CGFloat width = v27;
  v78.size.CGFloat height = v12;
  double v30 = CGRectGetHeight(v78);
  v79.origin.CGFloat y = y;
  v79.origin.CGFloat x = x;
  v79.size.CGFloat width = width;
  v79.size.CGFloat height = height;
  if (CGRectIsEmpty(v79) || (double v31 = v69 * v26, v31 <= 0.0) || (v32 = v28 * v30, v32 <= 0.0))
  {
    CGFloat v36 = v29;
    char v37 = CRCastAsClass<CRFormFieldOutputRegion>(*(void **)(a1 + 32));
    BOOL v38 = v37;
    CGFloat v39 = v72;
    if (!v37
      || (CGFloat v40 = v27, [v37 fieldType] != 1)
      || !*(unsigned char *)(a1 + 40)
      || [*(id *)(a1 + 32) textContentType] == 50)
    {
LABEL_11:
      uint64_t v35 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v82.origin.CGFloat x = v72;
    v82.origin.CGFloat y = v73;
    v82.size.CGFloat width = v27;
    v82.size.CGFloat height = v36;
    double MinY = CGRectGetMinY(v82);
    v83.origin.CGFloat x = v15;
    v83.size.CGFloat width = v66;
    v83.origin.CGFloat y = v67;
    v83.size.CGFloat height = rect;
    if (MinY >= CGRectGetMaxY(v83))
    {
      BOOL v44 = 0;
    }
    else
    {
      v84.origin.CGFloat x = v72;
      v84.origin.CGFloat y = v73;
      v84.size.CGFloat width = v40;
      v84.size.CGFloat height = v36;
      double MaxY = CGRectGetMaxY(v84);
      v85.origin.CGFloat x = v15;
      v85.size.CGFloat width = v66;
      v85.origin.CGFloat y = v67;
      v85.size.CGFloat height = rect;
      BOOL v44 = MaxY > CGRectGetMinY(v85);
    }
    v86.origin.CGFloat y = v73;
    v86.origin.CGFloat x = v72;
    v86.size.CGFloat width = v40;
    v86.size.CGFloat height = v36;
    double MinX = CGRectGetMinX(v86);
    v87.origin.CGFloat x = v15;
    v87.size.CGFloat width = v66;
    v87.origin.CGFloat y = v67;
    v87.size.CGFloat height = rect;
    if (MinX >= CGRectGetMaxX(v87)) {
      goto LABEL_21;
    }
    v88.origin.CGFloat x = v72;
    v88.origin.CGFloat y = v73;
    v88.size.CGFloat width = v40;
    v88.size.CGFloat height = v36;
    double MaxX = CGRectGetMaxX(v88);
    v89.origin.CGFloat x = v15;
    v89.size.CGFloat width = v66;
    v89.origin.CGFloat y = v67;
    v89.size.CGFloat height = rect;
    if (MaxX <= CGRectGetMinX(v89))
    {
LABEL_21:
      v90.origin.CGFloat x = v72;
      v90.origin.CGFloat y = v73;
      v90.size.CGFloat width = v40;
      v90.size.CGFloat height = v36;
      double v48 = CGRectGetMinX(v90);
      v91.origin.CGFloat x = v68;
      v91.size.CGFloat width = v66;
      v91.origin.CGFloat y = v67;
      v91.size.CGFloat height = rect;
      double v49 = CGRectGetMinX(v91);
      v92.origin.CGFloat x = v72;
      v92.origin.CGFloat y = v73;
      v92.size.CGFloat width = v40;
      v92.size.CGFloat height = v36;
      double v50 = CGRectGetMaxX(v92);
      v93.origin.CGFloat x = v68;
      v93.size.CGFloat width = v66;
      v93.origin.CGFloat y = v67;
      v93.size.CGFloat height = rect;
      double v51 = CGRectGetMaxX(v93);
      v52 = [v3 boundingQuad];
      [v52 normalizationSize];
      double v54 = v53;

      if (v44)
      {
        if ((fmax(v48, v49) - fmin(v50, v51)) * v54 < 6.0)
        {
          uint64_t v35 = 1;
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      LODWORD(v35) = 0;
      CGFloat v39 = v72;
      CGFloat v47 = v73;
    }
    else
    {
      uint64_t v35 = 1;
      CGFloat v47 = v73;
      if (v44) {
        goto LABEL_12;
      }
    }
    CGFloat v55 = v39;
    CGFloat v56 = v40;
    CGFloat v57 = v36;
    double v58 = CGRectGetMinY(*(CGRect *)(&v47 - 1));
    v94.origin.CGFloat x = v68;
    v94.size.CGFloat width = v66;
    v94.origin.CGFloat y = v67;
    v94.size.CGFloat height = rect;
    double v59 = CGRectGetMinY(v94);
    v95.origin.CGFloat x = v72;
    v95.origin.CGFloat y = v73;
    v95.size.CGFloat width = v40;
    v95.size.CGFloat height = v36;
    double v60 = CGRectGetMaxY(v95);
    v96.origin.CGFloat x = v68;
    v96.size.CGFloat width = v66;
    v96.origin.CGFloat y = v67;
    v96.size.CGFloat height = rect;
    double v61 = CGRectGetMaxY(v96);
    v62 = [v3 boundingQuad];
    [v62 normalizationSize];
    double v64 = (fmax(v58, v59) - fmin(v60, v61)) * v63;

    if (v64 < 6.0) {
      uint64_t v35 = v35;
    }
    else {
      uint64_t v35 = 0;
    }
    goto LABEL_12;
  }
  v80.origin.CGFloat x = x;
  v80.origin.CGFloat y = y;
  v80.size.CGFloat width = width;
  v80.size.CGFloat height = height;
  double v33 = CGRectGetWidth(v80);
  v81.origin.CGFloat x = x;
  v81.origin.CGFloat y = y;
  v81.size.CGFloat width = width;
  v81.size.CGFloat height = height;
  double v34 = v33 * CGRectGetHeight(v81);
  uint64_t v35 = v34 > v32 * 0.02 || v34 > v31 * 0.02;
LABEL_13:

  return v35;
}

BOOL __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 originalQuad];
  uint64_t v4 = [*(id *)(a1 + 32) boundingQuad];
  [v3 boundingBoxIOUWithQuad:v4];
  BOOL v6 = v5 > 0.9;

  return v6;
}

uint64_t __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __74__CRFormFilterSurfacedFieldsStep_process_externalFields_document_options___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 fieldSource];
  if (v6 > [v5 fieldSource]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = -1;
  }

  return v7;
}

- (void)_setGlobalIndexesForFields:(id)a3 externalFields:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = CRCastAsClass<CRFormFieldOutputRegion>(*(void **)(*((void *)&v19 + 1) + 8 * v12));
        double v14 = v13;
        if (v13)
        {
          CGFloat v15 = objc_msgSend(v13, "precedingExternalField", (void)v19);
          if (v15)
          {
            if (v6) {
              unint64_t v16 = [v6 indexOfObject:v15];
            }
            else {
              unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v16 <= v11) {
              unint64_t v17 = v11;
            }
            else {
              unint64_t v17 = v16;
            }
            unint64_t v18 = v17 - v11;
            if (v11 == 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v18 = v16 + 1;
              unint64_t v11 = v16;
            }
            else
            {
              unint64_t v11 = v17;
            }
            v9 += v18;
          }
          [v14 setIndexInGlobalOrder:v9];

          ++v9;
        }

        ++v12;
      }
      while (v8 != v12);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (BOOL)assignGlobalOrder
{
  return self->_assignGlobalOrder;
}

@end