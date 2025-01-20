@interface CRFormFieldTextOverlapCleanupStep
+ (CGRect)_clipRectangle:(CGRect)a3 intersectionRectangle:(CGRect)a4 type:(unint64_t)a5;
+ (id)cleanupTextOverlapForFields:(id)a3 document:(id)a4 underlinedFieldsOnly:(BOOL)a5;
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
@end

@implementation CRFormFieldTextOverlapCleanupStep

+ (CGRect)_clipRectangle:(CGRect)a3 intersectionRectangle:(CGRect)a4 type:(unint64_t)a5
{
  CGFloat x = a4.origin.x;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  CGFloat MinX = CGRectGetMinX(a3);
  v39.origin.CGFloat x = v11;
  v39.origin.CGFloat y = v10;
  v39.size.CGFloat width = v9;
  v39.size.CGFloat height = v8;
  CGFloat MaxX = CGRectGetMaxX(v39);
  v40.origin.CGFloat x = v11;
  v40.origin.CGFloat y = v10;
  v40.size.CGFloat width = v9;
  v40.size.CGFloat height = v8;
  double MinY = CGRectGetMinY(v40);
  v41.origin.CGFloat x = v11;
  v41.origin.CGFloat y = v10;
  v41.size.CGFloat width = v9;
  v41.size.CGFloat height = v8;
  CGFloat v35 = MinX;
  CGFloat MaxY = CGRectGetMaxY(v41);
  if (a5)
  {
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    double v14 = CGRectGetMinY(v42);
    v43.origin.CGFloat x = v11;
    v43.origin.CGFloat y = v10;
    v43.size.CGFloat width = v9;
    v43.size.CGFloat height = v8;
    double v15 = v14 - CGRectGetMinY(v43);
    v44.origin.CGFloat x = v11;
    v44.origin.CGFloat y = v10;
    v44.size.CGFloat width = v9;
    v44.size.CGFloat height = v8;
    double v16 = CGRectGetMaxY(v44);
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    BOOL v17 = v16 - CGRectGetMaxY(v45) < v15;
    CGFloat v18 = y;
    CGFloat v19 = x;
    if (v17)
    {
      double v27 = MaxX;
      double v26 = v35;
      if (a5 == 1)
      {
        CGFloat v20 = width;
        CGFloat v21 = height;
        double v22 = CGRectGetMinY(*(CGRect *)&v19);
        goto LABEL_9;
      }
    }
    else
    {
      CGFloat v24 = width;
      CGFloat v25 = height;
      double MinY = CGRectGetMaxY(*(CGRect *)&v19);
      double v27 = MaxX;
      double v26 = v35;
    }
    double v22 = MaxY;
LABEL_9:
    if (v22 > MinY + 4.0)
    {
      double v22 = v22 + -2.0;
      double MinY = MinY + 2.0;
    }
    goto LABEL_15;
  }
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double v32 = CGRectGetMinX(v46);
  v47.origin.CGFloat x = v11;
  v47.origin.CGFloat y = v10;
  v47.size.CGFloat width = v9;
  v47.size.CGFloat height = v8;
  double v33 = v32 - CGRectGetMinX(v47);
  v48.origin.CGFloat x = v11;
  v48.origin.CGFloat y = v10;
  v48.size.CGFloat width = v9;
  v48.size.CGFloat height = v8;
  double v23 = CGRectGetMaxX(v48);
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  if (v23 - CGRectGetMaxX(v49) >= v33)
  {
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    double v26 = CGRectGetMaxX(v51);
    double v27 = MaxX;
  }
  else
  {
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    double v27 = CGRectGetMinX(v50);
    double v26 = MinX;
  }
  double v22 = MaxY;
  if (v27 > v26 + 4.0)
  {
    double v27 = v27 + -2.0;
    double v26 = v26 + 2.0;
  }
LABEL_15:
  double v28 = v27 - v26;
  double v29 = v22 - MinY;
  double v30 = v26;
  double v31 = MinY;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

+ (id)cleanupTextOverlapForFields:(id)a3 document:(id)a4 underlinedFieldsOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v28 = a4;
  if (+[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]::onceToken != -1) {
    dispatch_once(&+[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]::onceToken, &__block_literal_global_63);
  }
  double v27 = [v28 contentsWithTypes:8];
  double v26 = objc_opt_new();
  CGFloat v25 = objc_opt_new();
  CGFloat v9 = objc_opt_new();
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __95__CRFormFieldTextOverlapCleanupStep_cleanupTextOverlapForFields_document_underlinedFieldsOnly___block_invoke_2;
  v32[3] = &unk_1E6CDAC48;
  id v10 = v9;
  id v33 = v10;
  BOOL v38 = v5;
  id v11 = v27;
  id v34 = v11;
  id v12 = v26;
  id v35 = v12;
  id v37 = a1;
  id v13 = v25;
  id v36 = v13;
  double v14 = (void *)MEMORY[0x1E01BFAC0](v32);
  if (v5)
  {
    +[CRFormPostProcessingManager enumerateAllFieldsInFields:block:](CRFormPostProcessingManager, "enumerateAllFieldsInFields:block:", v8, v14, v25, v26, v27);
    double v15 = CROSLogForCategory(6);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = [v8 count];
      uint64_t v17 = [v10 count];
      *(_DWORD *)buf = 136315650;
      CGRect v40 = "+[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]";
      __int16 v41 = 2048;
      uint64_t v42 = v16;
      __int16 v43 = 2048;
      uint64_t v44 = v17;
      _os_log_impl(&dword_1DD733000, v15, OS_LOG_TYPE_DEBUG, "%s: Processed %lu fields; Returning %lu fields.",
        buf,
        0x20u);
    }

    id v18 = v10;
  }
  else
  {
    +[CRFormPostProcessingManager enumerateContourBasedDetectedFields:block:](CRFormPostProcessingManager, "enumerateContourBasedDetectedFields:block:", v8, v14, v25, v26, v27);
    +[CRFormPostProcessingManager enumerateTextBasedDetectedFields:v8 block:v14];
    uint64_t v19 = [v13 count];
    uint64_t v20 = [v12 count];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __95__CRFormFieldTextOverlapCleanupStep_cleanupTextOverlapForFields_document_underlinedFieldsOnly___block_invoke_73;
    v29[3] = &unk_1E6CDAC70;
    id v30 = v12;
    id v21 = v13;
    id v31 = v21;
    +[CRFormPostProcessingManager enumerateAllFieldsInFields:v8 block:v29];
    double v22 = CROSLogForCategory(6);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = [v21 count];
      *(_DWORD *)buf = 136315906;
      CGRect v40 = "+[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]";
      __int16 v41 = 2048;
      uint64_t v42 = v20 - v19;
      __int16 v43 = 2048;
      uint64_t v44 = v19;
      __int16 v45 = 2048;
      uint64_t v46 = v23;
      _os_log_impl(&dword_1DD733000, v22, OS_LOG_TYPE_DEBUG, "%s: Fields removed %lu, Updated: %lu, Total number of fields preserved: %lu.", buf, 0x2Au);
    }

    id v18 = [v21 array];
  }
  return v18;
}

void __95__CRFormFieldTextOverlapCleanupStep_cleanupTextOverlapForFields_document_underlinedFieldsOnly___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ー一－-_.…,"];
  v1 = (void *)+[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]::_trimmableCharSet;
  +[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]::_trimmableCharSet = v0;
}

void __95__CRFormFieldTextOverlapCleanupStep_cleanupTextOverlapForFields_document_underlinedFieldsOnly___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 boundingQuad];
  [v4 boundingBox];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v121.origin.CGFloat x = v6;
  v121.origin.CGFloat y = v8;
  v121.size.CGFloat width = v10;
  v121.size.CGFloat height = v12;
  if (CGRectGetWidth(v121) < 0.1)
  {
    v122.origin.CGFloat x = v6;
    v122.origin.CGFloat y = v8;
    v122.size.CGFloat width = v10;
    v122.size.CGFloat height = v12;
    if (CGRectGetHeight(v122) < 0.1)
    {
      v123.origin.CGFloat x = v6;
      v123.origin.CGFloat y = v8;
      v123.size.CGFloat width = v10;
      v123.size.CGFloat height = v12;
      double Height = CGRectGetHeight(v123);
      v124.origin.CGFloat x = v6;
      v124.origin.CGFloat y = v8;
      v124.size.CGFloat width = v10;
      v124.size.CGFloat height = v12;
      if (Height > CGRectGetWidth(v124) * 0.5 && [v3 fieldSource] != 3)
      {
        [*(id *)(a1 + 32) addObject:v3];
        goto LABEL_92;
      }
    }
  }
  if (*(unsigned char *)(a1 + 72))
  {
    double v14 = CRCastAsClass<CRFormTextFieldOutputRegion>(v3);
    double v15 = v14;
    if (!v14
      || ![v14 hasBoundedWidth]
      || [v15 hasBoundedHeight])
    {
      [*(id *)(a1 + 32) addObject:v3];

      goto LABEL_92;
    }
  }
  uint64_t v16 = [v3 boundingQuad];
  uint64_t v17 = [v16 denormalizedQuad];

  v88 = v17;
  [v17 boundingBox];
  CGFloat v104 = v19;
  CGFloat v106 = v18;
  CGFloat v100 = v21;
  CGFloat v102 = v20;
  __p = 0;
  v113 = 0;
  v114 = 0;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v22 = *(id *)(a1 + 40);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v108 objects:v119 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v109;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v109 != v24) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v108 + 1) + 8 * i) boundingBoxEstimateAfterTrimmingCharacters:+[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:]::_trimmableCharSet];
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        v149.size.CGFloat height = v32;
        v125.origin.CGFloat y = v104;
        v125.origin.CGFloat x = v106;
        v125.size.CGFloat height = v100;
        v125.size.CGFloat width = v102;
        v149.origin.CGFloat x = v27;
        v149.origin.CGFloat y = v29;
        v149.size.CGFloat width = v31;
        CGFloat rect = v149.size.height;
        CGRect v126 = CGRectIntersection(v125, v149);
        CGFloat x = v126.origin.x;
        CGFloat y = v126.origin.y;
        CGFloat width = v126.size.width;
        CGFloat v36 = v126.size.height;
        if (CGRectIsEmpty(v126))
        {
          id v37 = v113;
        }
        else
        {
          v127.origin.CGFloat x = x;
          v127.origin.CGFloat y = y;
          v127.size.CGFloat width = width;
          v127.size.CGFloat height = v36;
          double v38 = CGRectGetWidth(v127);
          v128.origin.CGFloat y = v104;
          v128.origin.CGFloat x = v106;
          v128.size.CGFloat height = v100;
          v128.size.CGFloat width = v102;
          if (v38 > CGRectGetWidth(v128) * 0.5)
          {
            v129.origin.CGFloat x = x;
            v129.origin.CGFloat y = y;
            v129.size.CGFloat width = width;
            v129.size.CGFloat height = v36;
            double v39 = CGRectGetHeight(v129);
            v130.origin.CGFloat y = v104;
            v130.origin.CGFloat x = v106;
            v130.size.CGFloat height = v100;
            v130.size.CGFloat width = v102;
            if (v39 > CGRectGetHeight(v130) * 0.5)
            {
LABEL_74:
              [*(id *)(a1 + 48) addObject:v3];
              [*(id *)(a1 + 32) addObject:v3];
              goto LABEL_88;
            }
          }
          CGRect v40 = v113;
          if (v113 >= (void *)v114)
          {
            __int16 v41 = __p;
            uint64_t v42 = ((char *)v113 - (unsigned char *)__p) >> 5;
            unint64_t v43 = v42 + 1;
            if ((unint64_t)(v42 + 1) >> 59) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v44 = v114 - (unsigned char *)__p;
            if ((v114 - (unsigned char *)__p) >> 4 > v43) {
              unint64_t v43 = v44 >> 4;
            }
            if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v45 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v45 = v43;
            }
            if (v45)
            {
              uint64_t v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v114, v45);
              __int16 v41 = __p;
              CGRect v40 = v113;
            }
            else
            {
              uint64_t v46 = 0;
            }
            uint64_t v47 = &v46[32 * v42];
            *(CGFloat *)uint64_t v47 = v27;
            *((CGFloat *)v47 + 1) = v29;
            *((CGFloat *)v47 + 2) = v31;
            *((CGFloat *)v47 + 3) = rect;
            if (v40 == v41)
            {
              CGRect v50 = &v46[32 * v42];
            }
            else
            {
              CGRect v48 = &v46[32 * v42];
              do
              {
                long long v49 = *((_OWORD *)v40 - 1);
                CGRect v50 = v48 - 32;
                *((_OWORD *)v48 - 2) = *((_OWORD *)v40 - 2);
                *((_OWORD *)v48 - 1) = v49;
                v40 -= 4;
                v48 -= 32;
              }
              while (v40 != v41);
            }
            id v37 = v47 + 32;
            __p = v50;
            v113 = v47 + 32;
            v114 = &v46[32 * v45];
            if (v41) {
              operator delete(v41);
            }
          }
          else
          {
            *(CGFloat *)v113 = v27;
            *((CGFloat *)v40 + 1) = v29;
            id v37 = v40 + 4;
            *((CGFloat *)v40 + 2) = v31;
            *((CGFloat *)v40 + 3) = rect;
          }
          v113 = v37;
        }
        if ((unint64_t)((char *)v37 - (unsigned char *)__p) > 0x40) {
          goto LABEL_74;
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v108 objects:v119 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  CGRect v51 = (char *)__p;
  if (v113 != __p)
  {
    uint64_t v52 = 0;
    unint64_t v53 = 0;
    v54 = (CGFloat *)MEMORY[0x1E4F1DB20];
    CGFloat v56 = v104;
    CGFloat v55 = v106;
    CGFloat v58 = v100;
    CGFloat v57 = v102;
    while (1)
    {
      v59 = (CGFloat *)&v51[v52];
      CGFloat v60 = *v59;
      CGFloat v61 = v59[1];
      CGFloat v62 = v59[2];
      v150.size.CGFloat height = v59[3];
      double v105 = v56;
      double v107 = v55;
      double v101 = v58;
      double v103 = v57;
      v150.origin.CGFloat x = *v59;
      v150.origin.CGFloat y = v61;
      v150.size.CGFloat width = v62;
      double rect2 = v150.size.height;
      CGRect v131 = CGRectIntersection(*(CGRect *)&v55, v150);
      double v63 = v131.origin.x;
      double v64 = v131.origin.y;
      double v65 = v131.size.width;
      double v66 = v131.size.height;
      if ([v3 fieldSource] == 3) {
        double v67 = 0.8;
      }
      else {
        double v67 = 1.0;
      }
      v132.origin.CGFloat x = v63;
      v132.origin.CGFloat y = v64;
      v132.size.CGFloat width = v65;
      v132.size.CGFloat height = v66;
      if (CGRectIsEmpty(v132))
      {
        double v69 = v101;
        double v68 = v103;
        double v71 = v105;
        double v70 = v107;
      }
      else
      {
        double v97 = fmax(rect2 * v67, 8.0);
        CGFloat v90 = v61;
        CGFloat v91 = v60;
        CGFloat v89 = v62;
        if (*(unsigned char *)(a1 + 72)) {
          goto LABEL_52;
        }
        objc_msgSend((id)objc_opt_class(), "_clipRectangle:intersectionRectangle:type:", 0, v107, v105, v103, v101, v63, v64, v65, v66);
        CGFloat v94 = v133.origin.y;
        CGFloat v95 = v133.origin.x;
        CGFloat v92 = v133.size.height;
        CGFloat v93 = v133.size.width;
        if (CGRectGetHeight(v133) <= v97
          || (v134.origin.CGFloat y = v94,
              v134.origin.CGFloat x = v95,
              v134.size.CGFloat height = v92,
              v134.size.CGFloat width = v93,
              CGRectGetWidth(v134) <= v97))
        {
LABEL_52:
          CGFloat v94 = v54[1];
          CGFloat v95 = *v54;
          CGFloat v92 = v54[3];
          CGFloat v93 = v54[2];
        }
        int v72 = *(unsigned __int8 *)(a1 + 72);
        v73 = objc_opt_class();
        if (v72) {
          uint64_t v74 = 2;
        }
        else {
          uint64_t v74 = 1;
        }
        objc_msgSend(v73, "_clipRectangle:intersectionRectangle:type:", v74, v107, v105, v103, v101, v63, v64, v65, v66);
        CGFloat recta = v135.origin.y;
        double v70 = v135.origin.x;
        double v68 = v135.size.width;
        double v69 = v135.size.height;
        if (CGRectGetHeight(v135) <= v97
          || (v136.origin.CGFloat x = v70,
              v136.origin.CGFloat y = recta,
              v136.size.CGFloat width = v68,
              v136.size.CGFloat height = v69,
              CGRectGetWidth(v136) <= v97))
        {
          double v70 = *v54;
          CGFloat recta = v54[1];
          double v68 = v54[2];
          double v69 = v54[3];
        }
        if (*(unsigned char *)(a1 + 72)) {
          goto LABEL_62;
        }
        v137.origin.CGFloat x = v63;
        v137.origin.CGFloat y = v64;
        v137.size.CGFloat width = v65;
        v137.size.CGFloat height = v66;
        double v75 = CGRectGetHeight(v137);
        v138.origin.CGFloat y = v105;
        v138.origin.CGFloat x = v107;
        v138.size.CGFloat height = v101;
        v138.size.CGFloat width = v103;
        if (v75 <= CGRectGetHeight(v138) * 0.5
          || (v139.origin.CGFloat y = v94, v139.origin.x = v95,
                                   v139.size.CGFloat height = v92,
                                   v139.size.CGFloat width = v93,
                                   CGRectIsNull(v139)))
        {
LABEL_62:
          v140.origin.CGFloat x = v63;
          v140.origin.CGFloat y = v64;
          v140.size.CGFloat width = v65;
          v140.size.CGFloat height = v66;
          double v76 = CGRectGetWidth(v140);
          v141.origin.CGFloat y = v105;
          v141.origin.CGFloat x = v107;
          v141.size.CGFloat height = v101;
          v141.size.CGFloat width = v103;
          if (v76 <= CGRectGetWidth(v141) * 0.5)
          {
            v142.origin.CGFloat y = v105;
            v142.origin.CGFloat x = v107;
            v142.size.CGFloat height = v101;
            v142.size.CGFloat width = v103;
            v151.origin.CGFloat y = v90;
            v151.origin.CGFloat x = v91;
            v151.size.CGFloat width = v89;
            v151.size.CGFloat height = rect2;
            if (!CGRectContainsRect(v142, v151)) {
              goto LABEL_65;
            }
          }
          v143.origin.CGFloat x = v70;
          v143.origin.CGFloat y = recta;
          v143.size.CGFloat width = v68;
          v143.size.CGFloat height = v69;
          if (!CGRectIsNull(v143))
          {
            double v71 = recta;
          }
          else
          {
LABEL_65:
            v144.size.CGFloat height = v69;
            v144.size.CGFloat width = v68;
            v144.origin.CGFloat y = recta;
            v144.origin.CGFloat x = v70;
            double v71 = recta;
            if (CGRectGetHeight(v144) <= v97
              || (v145.size.CGFloat height = v69,
                  v145.size.CGFloat width = v68,
                  v145.origin.CGFloat y = recta,
                  v145.origin.CGFloat x = v70,
                  CGRectIsNull(v145)))
            {
              v146.origin.CGFloat y = v94;
              v146.origin.CGFloat x = v95;
              v146.size.CGFloat height = v92;
              v146.size.CGFloat width = v93;
              if (CGRectGetHeight(v146) <= v97) {
                goto LABEL_85;
              }
              v147.origin.CGFloat y = v94;
              v147.origin.CGFloat x = v95;
              v147.size.CGFloat height = v92;
              v147.size.CGFloat width = v93;
              double v69 = v92;
              double v68 = v93;
              double v71 = v94;
              double v70 = v95;
              if (CGRectIsNull(v147))
              {
LABEL_85:
                [*(id *)(a1 + 48) addObject:v3];
                [*(id *)(a1 + 32) addObject:v3];
                goto LABEL_89;
              }
            }
          }
        }
        else
        {
          double v69 = v92;
          double v68 = v93;
          double v71 = v94;
          double v70 = v95;
        }
      }
      ++v53;
      CGRect v51 = (char *)__p;
      v52 += 32;
      CGFloat v55 = v70;
      CGFloat v56 = v71;
      CGFloat v57 = v68;
      CGFloat v58 = v69;
      if (v53 >= ((char *)v113 - (unsigned char *)__p) >> 5) {
        goto LABEL_76;
      }
    }
  }
  double v69 = v100;
  double v68 = v102;
  double v71 = v104;
  double v70 = v106;
LABEL_76:
  id v77 = v3;
  [v88 boundingBox];
  v152.origin.CGFloat x = v70;
  v152.origin.CGFloat y = v71;
  v152.size.CGFloat width = v68;
  v152.size.CGFloat height = v69;
  if (CGRectEqualToRect(v148, v152))
  {
    [*(id *)(a1 + 32) addObject:v77];
    id v22 = v77;
  }
  else
  {
    v78 = -[CRImageSpaceQuad initWithBoundingBox:]([CRImageSpaceQuad alloc], "initWithBoundingBox:", v70, v71, v68, v69);
    v79 = [CRNormalizedQuad alloc];
    v80 = [v77 boundingQuad];
    [v80 normalizationSize];
    v81 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](v79, "initWithDenormalizedQuad:size:", v78);

    v82 = CROSLogForCategory(6);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
    {
      id v83 = [v88 description];
      uint64_t v84 = [v83 UTF8String];
      id v85 = [(CRImageSpaceQuad *)v78 description];
      uint64_t v86 = [v85 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v116 = v84;
      __int16 v117 = 2080;
      uint64_t v118 = v86;
      _os_log_impl(&dword_1DD733000, v82, OS_LOG_TYPE_DEBUG, "CRFormFieldTextOverlapCleanupStep: updating rectangle from %s to %s", buf, 0x16u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v87 = v77;
      id v22 = (id)[v87 copy];

      [v22 setBoundingQuad:v81];
      [*(id *)(a1 + 56) addObject:v22];
      [*(id *)(a1 + 48) addObject:v77];
      [*(id *)(a1 + 32) addObject:v22];
    }
    else
    {
      id v22 = v77;
      [*(id *)(a1 + 32) addObject:v77];
    }
  }
LABEL_88:

LABEL_89:
  if (__p)
  {
    v113 = __p;
    operator delete(__p);
  }

LABEL_92:
}

void __95__CRFormFieldTextOverlapCleanupStep_cleanupTextOverlapForFields_document_underlinedFieldsOnly___block_invoke_73(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  double v9 = CROSLogForCategory(6);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    CGFloat v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    int v14 = 136315138;
    uint64_t v15 = [v11 UTF8String];
    _os_log_impl(&dword_1DD733000, v9, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: %s is running.", (uint8_t *)&v14, 0xCu);
  }
  CGFloat v12 = [(id)objc_opt_class() cleanupTextOverlapForFields:v7 document:v8 underlinedFieldsOnly:0];

  return v12;
}

@end