@interface CRFormAddTextBasedDetectionFieldsStep
- (id)findMatchesForPattern:(id)a3 fields:(id)a4 lines:(id)a5;
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
- (id)rectangleEstimatesForPatternFields:(id)a3 matching:(id)a4 recognizedTextLines:(id)a5;
- (void)resolveAssignmentForPatternFields:(id)a3 matching:(id)a4 estimates:(id)a5 recognizedTextLines:(id)a6 detectedFields:(id)a7 outNewFields:(id *)a8 outFieldsToDelete:(id *)a9 normalizationSize:(CGSize)a10;
@end

@implementation CRFormAddTextBasedDetectionFieldsStep

- (id)findMatchesForPattern:(id)a3 fields:(id)a4 lines:(id)a5
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v7 = a4;
  id v29 = a5;
  id v27 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v8 = 0;
  unint64_t v28 = [v7 count];
  int64_t v9 = v28 >> 1;
  while (v8 < [v29 count])
  {
    v10 = [v29 objectAtIndexedSubscript:v8];
    if (v28 >= 2)
    {
      uint64_t v12 = 0;
      int64_t v11 = 0;
      do
      {
        v13 = [v10 children];
        BOOL v14 = v11 + v12 < (unint64_t)[v13 count];

        if (!v14) {
          break;
        }
        v15 = [v10 children];
        v16 = [v15 objectAtIndexedSubscript:v11 + v12];

        v17 = [v16 text];
        v18 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v19 = [v17 stringByTrimmingCharactersInSet:v18];

        v20 = [v7 objectAtIndexedSubscript:(2 * v11) | 1];
        int v21 = [v19 isEqualToString:v20];
        if (v21) {
          ++v11;
        }
        else {
          int64_t v11 = 0;
        }

        v12 += v21 ^ 1u;
      }
      while (v11 < v9);
    }
    else
    {
      int64_t v11 = 0;
      uint64_t v12 = 0;
    }
    if (v11 == v9)
    {
      v22 = [NSNumber numberWithInteger:v8];
      v30[0] = v22;
      v23 = [NSNumber numberWithInteger:v12];
      v30[1] = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
      [v27 addObject:v24];
    }
    ++v8;
  }

  return v27;
}

- (id)rectangleEstimatesForPatternFields:(id)a3 matching:(id)a4 recognizedTextLines:(id)a5
{
  id v7 = a3;
  id v103 = a4;
  id v106 = a5;
  v107 = v7;
  v104 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v8 = [v7 count];
  int64_t v9 = [v103 objectAtIndexedSubscript:0];
  uint64_t v105 = [v9 integerValue];

  v10 = [v103 objectAtIndexedSubscript:1];
  uint64_t v11 = [v10 integerValue];

  unint64_t v97 = v8;
  uint64_t v102 = v8 >> 1;
  if (v8 >= 2)
  {
    v15 = 0;
    uint64_t v12 = 0;
    uint64_t v16 = 0;
    if (v8 >> 1 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v8 >> 1;
    }
    double v14 = 0.0;
    uint64_t v18 = 1;
    do
    {
      v19 = objc_msgSend(v106, "objectAtIndexedSubscript:", v105, v97);
      v20 = [v19 children];
      int v21 = [v20 objectAtIndexedSubscript:v11 + v16];
      v13 = [v21 boundingQuad];

      [v13 size];
      double v23 = v22;
      if (v16)
      {
        v24 = [v107 objectAtIndexedSubscript:v18 - 1];
        int v25 = [v24 intValue];

        id v26 = [v107 objectAtIndexedSubscript:v18];
        v12 += v25 + [v26 length];
      }
      double v14 = v14 + v23;
      ++v16;
      v18 += 2;
      v15 = v13;
    }
    while (v17 != v16);
  }
  else
  {
    uint64_t v12 = 0;
    v13 = 0;
    double v14 = 0.0;
  }
  id v27 = objc_msgSend(v106, "objectAtIndexedSubscript:", v105, v97);
  unint64_t v28 = [v27 boundingQuad];
  [v28 normalizationSize];
  double v30 = v29;
  double v32 = v31;

  v101 = [v106 objectAtIndexedSubscript:v105];
  [v101 children];
  v100 = unint64_t v99 = v11 + v102;
  v33 = [v100 objectAtIndexedSubscript:v11 + v102 - 1];
  v34 = [v33 boundingQuad];
  [v34 boundingBox];
  double MaxX = CGRectGetMaxX(v116);
  v36 = [v106 objectAtIndexedSubscript:v105];
  v37 = [v36 children];
  v38 = [v37 objectAtIndexedSubscript:v11];
  v39 = [v38 boundingQuad];
  [v39 boundingBox];
  double v40 = v14 / (double)v102;
  double v41 = MaxX - CGRectGetMinX(v117);

  double v42 = v40 * v32 / v30 * 0.75;
  if (v41 < v42 * (double)v12)
  {
    id v43 = (id)MEMORY[0x1E4F1CBF0];
    v44 = v104;
    goto LABEL_35;
  }
  if (v11 < 1)
  {
    double v49 = 0.0;
  }
  else
  {
    v45 = [v106 objectAtIndexedSubscript:v105];
    v46 = [v45 children];
    v47 = [v46 objectAtIndexedSubscript:v11 - 1];
    v48 = [v47 boundingQuad];
    [v48 boundingBox];
    double v49 = CGRectGetMaxX(v118);
  }
  if (v98 >= 2)
  {
    uint64_t v50 = 0;
    if ((unint64_t)v102 <= 1) {
      uint64_t v51 = 1;
    }
    else {
      uint64_t v51 = v102;
    }
    v52 = (_OWORD *)MEMORY[0x1E4F1DB28];
    v53 = v13;
    do
    {
      v54 = [v106 objectAtIndexedSubscript:v105];
      v55 = [v54 children];
      v56 = [v55 objectAtIndexedSubscript:v11];
      v13 = [v56 boundingQuad];

      v57 = [v107 objectAtIndexedSubscript:v50];
      LODWORD(v55) = [v57 intValue];

      if ((int)v55 < 1)
      {
        long long v64 = v52[1];
        v112[0] = *v52;
        v112[1] = v64;
        v63 = [MEMORY[0x1E4F29238] valueWithBytes:v112 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        [v104 addObject:v63];
      }
      else
      {
        v58 = [v107 objectAtIndexedSubscript:v50];
        int v59 = [v58 intValue];

        [v13 topLeft];
        double v60 = v42 * (double)v59;
        if (v61 - v60 >= v49)
        {
          [v13 topLeft];
          double v66 = v65;
          [v13 topLeft];
          CGFloat v68 = v67;
          CGFloat v69 = v66 - v60;
          *(CGFloat *)v114 = v69;
          *(double *)&v114[1] = v67;
          *(double *)&v114[2] = v42 * (double)v59;
          *(double *)&v114[3] = v40;
          v70 = [MEMORY[0x1E4F29238] valueWithBytes:v114 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          [v104 addObject:v70];

          v119.origin.x = v69;
          v119.origin.y = v68;
          v119.size.width = v42 * (double)v59;
          v119.size.height = v40;
          double v49 = CGRectGetMaxX(v119);
          goto LABEL_26;
        }
        long long v62 = v52[1];
        v113[0] = *v52;
        v113[1] = v62;
        v63 = [MEMORY[0x1E4F29238] valueWithBytes:v113 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        [v104 addObject:v63];
      }

LABEL_26:
      v71 = (void *)MEMORY[0x1E4F29238];
      [v13 boundingBox];
      v111[0] = v72;
      v111[1] = v73;
      v111[2] = v74;
      v111[3] = v75;
      v76 = [v71 valueWithBytes:v111 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      [v104 addObject:v76];

      v50 += 2;
      ++v11;
      v53 = v13;
      --v51;
    }
    while (v51);
  }
  v77 = [v106 objectAtIndexedSubscript:v105];
  v78 = [v77 children];
  unint64_t v79 = [v78 count];

  double MinX = 1.0;
  if (v99 < v79)
  {
    v81 = [v106 objectAtIndexedSubscript:v105];
    v82 = [v81 children];
    v83 = [v82 objectAtIndexedSubscript:v99];
    v84 = [v83 boundingQuad];
    [v84 boundingBox];
    double MinX = CGRectGetMinX(v120);
  }
  v85 = [v107 lastObject];
  int v86 = [v85 intValue];

  if (v86 < 1)
  {
    long long v92 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    v108[0] = *MEMORY[0x1E4F1DB28];
    v108[1] = v92;
    v91 = [MEMORY[0x1E4F29238] valueWithBytes:v108 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [v104 addObject:v91];
  }
  else
  {
    v87 = [v107 lastObject];
    int v88 = [v87 intValue];

    [v13 topRight];
    if (v42 * (double)v88 + v89 <= MinX)
    {
      [v13 topRight];
      uint64_t v94 = v93;
      [v13 topRight];
      v110[0] = v94;
      v110[1] = v95;
      *(double *)&v110[2] = v42 * (double)v88;
      *(double *)&v110[3] = v40;
      v91 = [MEMORY[0x1E4F29238] valueWithBytes:v110 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      [v104 addObject:v91];
    }
    else
    {
      long long v90 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      v109[0] = *MEMORY[0x1E4F1DB28];
      v109[1] = v90;
      v91 = [MEMORY[0x1E4F29238] valueWithBytes:v109 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      [v104 addObject:v91];
    }
  }

  v44 = v104;
  id v43 = v104;
LABEL_35:

  return v43;
}

- (void)resolveAssignmentForPatternFields:(id)a3 matching:(id)a4 estimates:(id)a5 recognizedTextLines:(id)a6 detectedFields:(id)a7 outNewFields:(id *)a8 outFieldsToDelete:(id *)a9 normalizationSize:(CGSize)a10
{
  double height = a10.height;
  double width = a10.width;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v50 = a7;
  v48 = v16;
  unint64_t v20 = [v16 count];
  id v21 = v17;
  double v22 = [v17 objectAtIndexedSubscript:0];
  uint64_t v23 = [v22 integerValue];
  unint64_t v24 = v20 >> 1;

  uint64_t v25 = 0;
  do
  {
    id v26 = [v18 objectAtIndexedSubscript:2 * v25];
    [v26 rectValue];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;

    v52.origin.x = v28;
    v52.origin.y = v30;
    v52.size.double width = v32;
    v52.size.double height = v34;
    v35 = v21;
    if (!CGRectIsEmpty(v52))
    {
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __178__CRFormAddTextBasedDetectionFieldsStep_resolveAssignmentForPatternFields_matching_estimates_recognizedTextLines_detectedFields_outNewFields_outFieldsToDelete_normalizationSize___block_invoke;
      v51[3] = &__block_descriptor_72_e39_B32__0___CRFormFieldProviding__8Q16_B24l;
      *(double *)&v51[4] = v28;
      *(double *)&v51[5] = v30;
      *(double *)&v51[6] = v32;
      *(double *)&v51[7] = v34;
      v51[8] = a9;
      if ([v50 indexOfObjectPassingTest:v51] == 0x7FFFFFFFFFFFFFFFLL)
      {
        for (unint64_t i = 0; i < [v19 count]; ++i)
        {
          if (v23 != i)
          {
            v37 = [v19 objectAtIndexedSubscript:i];
            v38 = [v37 boundingQuad];
            [v38 boundingBox];
            v54.origin.x = v39;
            v54.origin.y = v40;
            v54.size.double width = v41;
            v54.size.double height = v42;
            v53.origin.x = v28;
            v53.origin.y = v30;
            v53.size.double width = v32;
            v53.size.double height = v34;
            BOOL v43 = CGRectIntersectsRect(v53, v54);

            if (v43) {
              goto LABEL_10;
            }
          }
        }
        v44 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:]([CRNormalizedQuad alloc], "initWithNormalizedBoundingBox:size:", v28, v30, v32, v34, width, height);
        LOBYTE(v47) = 0;
        v45 = [[CRFormTextFieldOutputRegion alloc] initWithQuad:v44 labelRegion:0 subFields:0 contentType:0 source:1 hasBoundedWidth:0 hasBoundedHeight:v47];
        [*a8 addObject:v45];
      }
    }
LABEL_10:
    BOOL v46 = v25++ == v24;
    id v21 = v35;
  }
  while (!v46);
}

uint64_t __178__CRFormAddTextBasedDetectionFieldsStep_resolveAssignmentForPatternFields_matching_estimates_recognizedTextLines_detectedFields_outNewFields_outFieldsToDelete_normalizationSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 boundingQuad];
  [v4 boundingBox];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v17.origin.x = v6;
  v17.origin.y = v8;
  v17.size.double width = v10;
  v17.size.double height = v12;
  CGRect v16 = CGRectIntersection(*(CGRect *)(a1 + 32), v17);
  BOOL IsEmpty = CGRectIsEmpty(v16);
  if ([v3 fieldSource] == 1) {
    uint64_t v14 = ([**(id **)(a1 + 64) containsObject:v3] | IsEmpty) ^ 1;
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v32 = a4;
  id v36 = a5;
  id v33 = a6;
  CGFloat v10 = CROSLogForCategory(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    double v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = [v12 UTF8String];
    _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: %s is running.", buf, 0xCu);
  }
  v13 = [v36 contentsWithTypes:8];
  *(void *)buf = [MEMORY[0x1E4F1CA48] array];
  id v37 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = [v36 text];
  v15 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  CGRect v16 = [v14 componentsSeparatedByCharactersInSet:v15];
  double v34 = [v16 componentsJoinedByString:&stru_1F38EED68];

  for (unint64_t i = 0; ; unint64_t i = v19 + 1)
  {
    id v18 = [&unk_1F3935D70 allKeys];
    unint64_t v19 = i;
    BOOL v20 = i < [v18 count];

    if (!v20) {
      break;
    }
    id v21 = [&unk_1F3935D70 allKeys];
    double v22 = [v21 objectAtIndexedSubscript:v19];

    uint64_t v23 = [&unk_1F3935D70 objectForKeyedSubscript:v22];
    if ([v34 containsString:v22])
    {
      unint64_t v24 = [(CRFormAddTextBasedDetectionFieldsStep *)self findMatchesForPattern:v22 fields:v23 lines:v13];
      for (unint64_t j = 0; j < [v24 count]; ++j)
      {
        id v26 = [v24 objectAtIndexedSubscript:j];
        double v27 = [(CRFormAddTextBasedDetectionFieldsStep *)self rectangleEstimatesForPatternFields:v23 matching:v26 recognizedTextLines:v13];

        if ([v27 count])
        {
          double v28 = [v24 objectAtIndexedSubscript:j];
          double v29 = [v36 boundingQuad];
          [v29 normalizationSize];
          -[CRFormAddTextBasedDetectionFieldsStep resolveAssignmentForPatternFields:matching:estimates:recognizedTextLines:detectedFields:outNewFields:outFieldsToDelete:normalizationSize:](self, "resolveAssignmentForPatternFields:matching:estimates:recognizedTextLines:detectedFields:outNewFields:outFieldsToDelete:normalizationSize:", v23, v28, v27, v13, v35, &v37, buf);
        }
      }
    }
  }
  if ([*(id *)buf count] || objc_msgSend(v37, "count"))
  {
    double v30 = (void *)[v35 mutableCopy];
    [v30 removeObjectsInArray:*(void *)buf];
    [v30 addObjectsFromArray:v37];
  }
  else
  {
    double v30 = v35;
  }

  return v30;
}

@end