@interface CRFormFieldDedupingStep
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
@end

@implementation CRFormFieldDedupingStep

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = CROSLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldDedupingStep is running.", buf, 2u);
  }

  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke_2;
  v34[3] = &unk_1E6CDABD0;
  id v9 = v24;
  id v35 = v9;
  +[CRFormPostProcessingManager enumerateFieldsInFields:v6 filter:&__block_literal_global_184 block:v34];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke_4;
  v29[3] = &unk_1E6CDACB8;
  id v10 = v9;
  id v30 = v10;
  id v11 = v8;
  id v31 = v11;
  char v33 = 1;
  id v12 = v6;
  id v32 = v12;
  +[CRFormPostProcessingManager enumerateFieldsInFields:v12 filter:&__block_literal_global_186 block:v29];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if (([v11 containsObject:v18] & 1) == 0) {
          [v13 addObject:v18];
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v42 count:16];
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
    uint64_t v37 = v20;
    __int16 v38 = 2048;
    uint64_t v39 = v21;
    __int16 v40 = 2048;
    uint64_t v41 = v22;
    _os_log_impl(&dword_1DD733000, v19, OS_LOG_TYPE_DEBUG, "CRFormFieldDedupingStep removed %ld contour fields from %ld fields, preserving %ld fields.", buf, 0x20u);
  }

  return v13;
}

BOOL __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fieldSource] == 2;
}

uint64_t __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

BOOL __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 fieldSource] == 1;
}

void __67__CRFormFieldDedupingStep_process_externalFields_document_options___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v73 = a2;
  v3 = [v73 boundingQuad];
  [v3 boundingBox];
  CGFloat v76 = v5;
  CGFloat v77 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v10 = *(id *)(a1 + 32);
  BOOL v11 = 0;
  id v12 = 0;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v82 objects:v95 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v83;
    double v74 = 0.0;
    double v75 = 0.0;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v83 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v82 + 1) + 8 * v15);
        if (([*(id *)(a1 + 40) containsObject:v16] & 1) == 0)
        {
          v17 = [v16 boundingQuad];
          [v17 boundingBox];
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          CGFloat v25 = v24;

          v97.origin.x = v19;
          v97.origin.y = v21;
          v97.size.double width = v23;
          v97.size.double height = v25;
          v103.origin.y = v76;
          v103.origin.x = v77;
          v103.size.double width = v7;
          v103.size.double height = v9;
          if (CGRectContainsRect(v97, v103))
          {
            BOOL v26 = 1;
          }
          else
          {
            v98.origin.y = v76;
            v98.origin.x = v77;
            v98.size.double width = v7;
            v98.size.double height = v9;
            v104.origin.x = v19;
            v104.origin.y = v21;
            v104.size.double width = v23;
            v104.size.double height = v25;
            BOOL v26 = CGRectContainsRect(v98, v104);
          }
          v99.origin.y = v76;
          v99.origin.x = v77;
          v99.size.double width = v7;
          v99.size.double height = v9;
          v105.origin.x = v19;
          v105.origin.y = v21;
          v105.size.double width = v23;
          v105.size.double height = v25;
          CGRect v100 = CGRectIntersection(v99, v105);
          double width = v100.size.width;
          double height = v100.size.height;
          if (!CGRectIsNull(v100))
          {
            v101.origin.y = v76;
            v101.origin.x = v77;
            v101.size.double width = v7;
            v101.size.double height = v9;
            v106.origin.x = v19;
            v106.origin.y = v21;
            v106.size.double width = v23;
            v106.size.double height = v25;
            CGRect v102 = CGRectUnion(v101, v106);
            double v29 = v102.size.width;
            if (v102.size.width != 0.0 && v102.size.height != 0.0)
            {
              double v30 = width * height / (v102.size.width * v102.size.height);
              if (v30 > v75)
              {
                id v31 = v16;

                BOOL v11 = v26;
                id v12 = v31;
                double v74 = width / v29;
                double v75 = v30;
              }
            }
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v32 = [v10 countByEnumeratingWithState:&v82 objects:v95 count:16];
      uint64_t v13 = v32;
    }
    while (v32);
  }
  else
  {
    double v74 = 0.0;
    double v75 = 0.0;
  }

  if (![v12 hasBoundedWidth] || (objc_msgSend(v12, "hasBoundedHeight") & 1) != 0)
  {
    if ([v12 hasBoundedWidth])
    {
      int v33 = [v12 hasBoundedHeight];
      int v34 = v75 > 0.6 ? v33 : 0;
      if (v34 == 1 && *(unsigned char *)(a1 + 56))
      {
        id v35 = CROSLogForCategory(6);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v36 = [v12 boundingQuad];
          uint64_t v37 = [v73 boundingQuad];
          *(_DWORD *)buf = 138412802;
          v88 = v36;
          __int16 v89 = 2112;
          v90 = v37;
          __int16 v91 = 2048;
          double v92 = v75 * 100.0;
          _os_log_impl(&dword_1DD733000, v35, OS_LOG_TYPE_DEBUG, "CRFormFieldDedupingStep copying quad geometry from boxed contour based field (quad %@) to detected field (quad %@) - iou = %.2f%%", buf, 0x20u);
        }
        __int16 v38 = [v12 boundingQuad];
        goto LABEL_36;
      }
    }
LABEL_51:
    __int16 v38 = 0;
    goto LABEL_52;
  }
  if (v74 <= 0.8 || !*(unsigned char *)(a1 + 56)) {
    goto LABEL_51;
  }
  uint64_t v39 = CROSLogForCategory(6);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    __int16 v40 = [v12 boundingQuad];
    uint64_t v41 = [v73 boundingQuad];
    *(_DWORD *)buf = 138413058;
    v88 = v40;
    __int16 v89 = 2112;
    v90 = v41;
    __int16 v91 = 2048;
    double v92 = v75 * 100.0;
    __int16 v93 = 2048;
    double v94 = v74 * 100.0;
    _os_log_impl(&dword_1DD733000, v39, OS_LOG_TYPE_DEBUG, "CRFormFieldDedupingStep copying quad geometry from underlined contour based field (quad %@) to detected field (quad %@) - iou = %.2f%%, horizontal iou = %.2f%%", buf, 0x2Au);
  }
  v42 = [v73 boundingQuad];
  uint64_t v43 = [v42 denormalizedQuad];

  v44 = [v12 boundingQuad];
  v45 = [v44 denormalizedQuad];
  [v45 bottomLeft];
  double v47 = v46;
  double v49 = v48;

  v50 = [v12 boundingQuad];
  v51 = [v50 denormalizedQuad];
  [v51 bottomRight];
  double v53 = v52;
  double v55 = v54;

  [v43 bottomLeft];
  double v57 = v56;
  [v43 topLeft];
  v59 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v47, v49 + 2.0 - (v57 - v58), v53, v55 + 2.0 - (v57 - v58), v53, v55 + 2.0, v47);
  v60 = [CRNormalizedQuad alloc];
  v61 = [v73 boundingQuad];
  [v61 normalizationSize];
  __int16 v38 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](v60, "initWithDenormalizedQuad:size:", v59);

LABEL_36:
  if (v38)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v62 = *(id *)(a1 + 48);
    uint64_t v63 = [v62 countByEnumeratingWithState:&v78 objects:v86 count:16];
    if (v63)
    {
      uint64_t v64 = *(void *)v79;
      while (2)
      {
        for (uint64_t i = 0; i != v63; ++i)
        {
          if (*(void *)v79 != v64) {
            objc_enumerationMutation(v62);
          }
          id v66 = *(id *)(*((void *)&v78 + 1) + 8 * i);
          if ([v66 fieldSource] != 2)
          {
            uint64_t v67 = [v66 fieldSource];
            if (v66 != v73 && v67 != 3)
            {
              v69 = [v66 boundingQuad];
              [v69 boundingBoxIOUWithQuad:v38];
              BOOL v71 = v70 <= 0.05;

              if (!v71)
              {

                v72 = CROSLogForCategory(6);
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1DD733000, v72, OS_LOG_TYPE_DEBUG, "CRFormFieldDedupingStep reverting contour based geometry update to a field because of overlap with another detected field.", buf, 2u);
                }

                goto LABEL_52;
              }
            }
          }
        }
        uint64_t v63 = [v62 countByEnumeratingWithState:&v78 objects:v86 count:16];
        if (v63) {
          continue;
        }
        break;
      }
    }

    [v73 setBoundingQuad:v38];
    [*(id *)(a1 + 40) addObject:v12];
  }
LABEL_52:
  if (v11) {
    [*(id *)(a1 + 40) addObject:v12];
  }
}

@end