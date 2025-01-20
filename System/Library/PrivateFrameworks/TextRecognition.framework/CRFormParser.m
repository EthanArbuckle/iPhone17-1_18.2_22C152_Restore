@interface CRFormParser
+ (BOOL)_isRegion:(id)a3 segmentedBoxLeftOfRegion:(id)a4 withTolerance:(double)a5 modalWidth:(double)a6 modelGap:(double)a7;
+ (_NSRange)_rangeOfFirstSegmentedFieldGroupInFields:(id)a3 startIndex:(int64_t)a4 modalWidth:(double)a5 modelGap:(double)a6;
+ (double)globalLineHeightInDocument:(id)a3;
+ (id)_dominantLocaleInRegions:(id)a3;
+ (id)_groupSegmentedFieldsInAlignedFields:(id)a3;
+ (id)_groupSegmentedFieldsInFields:(id)a3;
+ (id)_mergedFieldsWithUnifiedQuadsFromFields:(id)a3 needsFieldReplacement:(BOOL *)a4 originalField:(id)a5 replacementField:(id)a6;
+ (id)_orderedGroupsWithFields:(id)a3 lines:(id)a4;
+ (id)_restoredFieldsWithFields:(id)a3 originalField:(id)a4 replacementField:(id)a5;
+ (id)_textFieldsAndRegionsFrom:(id)a3;
+ (id)convertDetectedFields:(id)a3;
+ (id)horizontalClustersFromFields:(id)a3;
+ (id)predictLineHeightForFields:(id)a3 inDocument:(id)a4 shouldUpdateExternalFields:(BOOL)a5;
+ (uint64_t)horizontalClustersFromFields:(uint64_t)a1;
+ (void)_setPrecedingExternalFieldsForFields:(id)a3;
+ (void)horizontalClustersFromFields:(void *)a1;
- (BOOL)_localeIsEnabled:(id)a3;
- (CRFormParser)init;
- (id)_orderAndGroupLinesInDocument:(id)a3 allFields:(id)a4 regions:(id)a5;
- (id)parseFieldsInDocument:(id)a3 allFields:(id)a4 shouldUpdateExternalFields:(BOOL)a5;
- (void)_parseFieldsWithLabelFinderAndKeywords:(id)a3 fieldsAndRegions:(id)a4 updateExternal:(BOOL)a5 locale:(id)a6;
- (void)_parseFieldsWithTransformer:(id)a3 fieldsAndRegions:(id)a4 updateExternal:(BOOL)a5 locale:(id)a6;
@end

@implementation CRFormParser

- (CRFormParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRFormParser;
  v2 = [(CRFormParser *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CRFormContentTypePredictor);
    predictor = v2->_predictor;
    v2->_predictor = v3;
  }
  return v2;
}

+ (id)_orderedGroupsWithFields:(id)a3 lines:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count") + objc_msgSend(v6, "count"));
  [v7 addObjectsFromArray:v6];
  [v7 addObjectsFromArray:v5];
  if (_MergedGlobals_8 != -1) {
    dispatch_once(&_MergedGlobals_8, &__block_literal_global);
  }
  v8 = [(id)qword_1EB58C8D8 orderAndGroupRegions:v7];

  return v8;
}

void __47__CRFormParser__orderedGroupsWithFields_lines___block_invoke()
{
  uint64_t v0 = +[CRTextFeatureOrderingUtilities textFeatureOrderWithRevision:3 angleThresholdForRotatedCrops:1 optimizeGroupsForStability:0.0];
  v1 = (void *)qword_1EB58C8D8;
  qword_1EB58C8D8 = v0;
}

+ (id)convertDetectedFields:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = v19;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v8 = [v7 fieldType];
        if (v8 == 1)
        {
          v12 = [CRFormTextFieldOutputRegion alloc];
          v10 = [v7 boundingQuad];
          uint64_t v13 = [v7 textContentType];
          uint64_t v14 = [v7 fieldSource];
          uint64_t v15 = [v7 hasBoundedWidth];
          LOBYTE(v18) = [v7 hasBoundedHeight];
          uint64_t v11 = [(CRFormTextFieldOutputRegion *)v12 initWithQuad:v10 labelRegion:0 subFields:0 contentType:v13 source:v14 hasBoundedWidth:v15 hasBoundedHeight:v18];
        }
        else
        {
          if (v8 != 2)
          {
            v16 = 0;
            goto LABEL_13;
          }
          v9 = [CRFormSelectableFieldOutputRegion alloc];
          v10 = [v7 boundingQuad];
          uint64_t v11 = -[CRFormSelectableFieldOutputRegion initWithQuad:type:labelRegion:source:](v9, "initWithQuad:type:labelRegion:source:", v10, 0, 0, [v7 fieldSource]);
        }
        v16 = (void *)v11;

        if (v16) {
          [v20 addObject:v16];
        }
LABEL_13:
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }

  return v20;
}

+ (BOOL)_isRegion:(id)a3 segmentedBoxLeftOfRegion:(id)a4 withTolerance:(double)a5 modalWidth:(double)a6 modelGap:(double)a7
{
  id v8 = a4;
  v9 = [a3 boundingQuad];
  v10 = [v8 boundingQuad];
  [v9 size];
  double v47 = v11;
  [v10 size];
  double v46 = v12;
  [v9 size];
  double v45 = v13;
  [v10 size];
  double v44 = v14;
  [v10 topLeft];
  double v43 = v15;
  [v9 topRight];
  double v17 = v16;
  [v9 size];
  double v19 = v18;
  [v10 size];
  double v21 = v20;
  [v9 size];
  double v23 = v22;
  [v10 size];
  double v25 = v24;
  [v9 midPoint];
  double v27 = v26;
  [v10 midPoint];
  double v29 = v28;
  [v9 midPoint];
  double v31 = v30;
  [v10 midPoint];
  double v33 = (v45 + v44) * 0.5;
  double v34 = fabs(-(a6 - v33 * 100.0));
  BOOL v35 = v27 < v29;
  if (fabs(-(a7 - vabdd_f64(v43, v17) * 100.0)) >= 1.0) {
    BOOL v35 = 0;
  }
  BOOL v36 = v34 < 2.0;
  double v37 = vabdd_f64(v23, v25) / v33;
  double v38 = (v47 + v46) * 0.5;
  double v39 = vabdd_f64(v19, v21) / v38;
  double v40 = vabdd_f64(v31, v32);
  if (!v36) {
    BOOL v35 = 0;
  }
  if (v40 >= v38 * 0.5) {
    BOOL v35 = 0;
  }
  if (v39 >= 0.4) {
    BOOL v35 = 0;
  }
  BOOL v41 = v37 < 0.2 && v35;

  return v41;
}

+ (double)globalLineHeightInDocument:(id)a3
{
  id v3 = a3;
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x4812000000;
  double v25 = __Block_byref_object_copy_;
  double v26 = __Block_byref_object_dispose_;
  double v27 = &unk_1DD8FDA7A;
  double v29 = 0;
  uint64_t v30 = 0;
  __p = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __43__CRFormParser_globalLineHeightInDocument___block_invoke;
  v21[3] = &unk_1E6CDA908;
  v21[4] = &v22;
  [v3 enumerateContentsWithTypes:8 usingBlock:v21];
  uint64_t v4 = v23;
  id v6 = (double *)v23[6];
  uint64_t v5 = (double *)v23[7];
  if (v6 == v5)
  {
    double v10 = 0.0;
  }
  else
  {
    double v7 = *(double *)((char *)v6 + ((((char *)v5 - (char *)v6) >> 1) & 0xFFFFFFFFFFFFFFF8));
    double v8 = v7 * 3.0;
    while (v8 >= *v6 && *v6 * 3.0 >= v7)
    {
      if (++v6 == v5) {
        goto LABEL_26;
      }
    }
    if (v6 == v5 || (double v11 = v6 + 1, v6 + 1 == v5))
    {
      double v14 = (double *)v23[7];
      double v13 = v23;
    }
    else
    {
      do
      {
        if (v8 >= *v11 && *v11 * 3.0 >= v7) {
          *v6++ = *v11;
        }
        ++v11;
      }
      while (v11 != v5);
      double v13 = v23;
      double v14 = (double *)v23[7];
    }
    if (v6 == v14)
    {
      uint64_t v5 = v14;
    }
    else
    {
      int64_t v15 = (char *)v5 - (char *)v14;
      if (v5 != v14)
      {
        memmove(v6, v14, (char *)v5 - (char *)v14);
        double v13 = v23;
      }
      v4[7] = (uint64_t)v6 + v15;
      uint64_t v5 = (double *)v13[7];
    }
    uint64_t v4 = v13;
LABEL_26:
    double v16 = (double *)v4[6];
    double v17 = 0.0;
    if (v16 != v5)
    {
      double v18 = (double *)v4[6];
      do
      {
        double v19 = *v18++;
        double v17 = v17 + v19;
      }
      while (v18 != v5);
    }
    double v10 = v17 / (double)(unint64_t)(v5 - v16);
  }
  _Block_object_dispose(&v22, 8);
  if (__p)
  {
    double v29 = __p;
    operator delete(__p);
  }

  return v10;
}

void __43__CRFormParser_globalLineHeightInDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v20 = v3;
  uint64_t v5 = [v3 boundingQuad];
  [v5 size];
  uint64_t v7 = v6;
  unint64_t v8 = v4[8];
  v9 = (char *)v4[7];
  if ((unint64_t)v9 >= v8)
  {
    double v11 = (char *)v4[6];
    uint64_t v12 = (v9 - v11) >> 3;
    if ((unint64_t)(v12 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v13 = v8 - (void)v11;
    unint64_t v14 = (uint64_t)(v8 - (void)v11) >> 2;
    if (v14 <= v12 + 1) {
      unint64_t v14 = v12 + 1;
    }
    if (v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    if (v15)
    {
      double v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v4 + 8), v15);
      double v11 = (char *)v4[6];
      v9 = (char *)v4[7];
    }
    else
    {
      double v16 = 0;
    }
    double v17 = &v16[8 * v12];
    double v18 = &v16[8 * v15];
    *(void *)double v17 = v7;
    double v10 = v17 + 8;
    while (v9 != v11)
    {
      uint64_t v19 = *((void *)v9 - 1);
      v9 -= 8;
      *((void *)v17 - 1) = v19;
      v17 -= 8;
    }
    v4[6] = v17;
    v4[7] = v10;
    v4[8] = v18;
    if (v11) {
      operator delete(v11);
    }
  }
  else
  {
    *(void *)v9 = v6;
    double v10 = v9 + 8;
  }
  v4[7] = v10;
}

+ (id)predictLineHeightForFields:(id)a3 inDocument:(id)a4 shouldUpdateExternalFields:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v25 = v8;
  double v26 = [v8 _flattenedFields];
  double v10 = CROSLogForCategory(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    double v33 = "+[CRFormParser predictLineHeightForFields:inDocument:shouldUpdateExternalFields:]";
    __int16 v34 = 2048;
    uint64_t v35 = [v26 count];
    __int16 v36 = 1024;
    BOOL v37 = v5;
    _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_DEBUG, "%s: Parsing %lu form fields (updateExcludedFields: %d)", buf, 0x1Cu);
  }

  [a1 globalLineHeightInDocument:v9];
  double v12 = v11;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v26;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    if (v12 <= 0.025) {
      double v16 = v12;
    }
    else {
      double v16 = 0.025;
    }
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v18 fieldType] == 1)
        {
          if ([v18 fieldSource] == 1
            || [v18 fieldSource] == 2
            || ([v18 fieldSource] != 3 ? (BOOL v19 = !v5) : (BOOL v19 = 0), !v19))
          {
            if (objc_opt_respondsToSelector())
            {
              id v20 = [v18 boundingQuad];
              [v20 size];
              double v22 = v21;

              double v23 = v22 * 0.95;
              if (v22 * 0.95 >= v16) {
                double v23 = v16;
              }
              [v18 setSuggestedLineHeight:v23];
            }
          }
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  return v25;
}

+ (_NSRange)_rangeOfFirstSegmentedFieldGroupInFields:(id)a3 startIndex:(int64_t)a4 modalWidth:(double)a5 modelGap:(double)a6
{
  id v9 = a3;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  while (a4 + 1 < (unint64_t)[v9 count])
  {
    double v11 = [v9 objectAtIndexedSubscript:a4];
    double v12 = [v9 objectAtIndexedSubscript:a4 + 1];
    int v13 = [(id)objc_opt_class() _isRegion:v11 segmentedBoxLeftOfRegion:v12 withTolerance:0.2 modalWidth:a5 modelGap:a6];
    if ([v11 fieldSource] == 1 && objc_msgSend(v11, "fieldType") == 1)
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        int v14 = 1;
      }
      else {
        int v14 = v13;
      }
      if (v14 != 1)
      {
        ++a4;
        goto LABEL_19;
      }
      if (v10 != 0x7FFFFFFFFFFFFFFFLL && ((v13 ^ 1) & 1) == 0 && a4 == [v9 count] - 2)
      {
        a4 += 2;
LABEL_19:
        NSUInteger v16 = a4 - v10;

        if (v16) {
          goto LABEL_21;
        }
        break;
      }
      if ((v13 & (v10 == 0x7FFFFFFFFFFFFFFFLL)) != 0) {
        int64_t v15 = a4;
      }
      else {
        int64_t v15 = v10;
      }
    }
    else
    {
      int64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_19;
      }
    }

    ++a4;
    uint64_t v10 = v15;
  }
  NSUInteger v16 = 0;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:

  NSUInteger v17 = v10;
  NSUInteger v18 = v16;
  result.length = v18;
  result.location = v17;
  return result;
}

+ (id)horizontalClustersFromFields:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  NSUInteger v18 = &v17;
  uint64_t v19 = 0x4812000000;
  id v20 = __Block_byref_object_copy__15;
  double v21 = __Block_byref_object_dispose__16;
  double v22 = &unk_1DD8FDA7A;
  memset(v23, 0, 24);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__CRFormParser_horizontalClustersFromFields___block_invoke;
  v16[3] = &unk_1E6CDA930;
  v16[4] = &v17;
  [v3 enumerateObjectsUsingBlock:v16];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0x6DB6DB6DB6DB6DB7 * ((v18[7] - v18[6]) >> 3)];
  uint64_t v5 = v18[6];
  for (uint64_t i = v18[7]; v5 != i; v5 += 56)
  {
    int v14 = 0;
    uint64_t v15 = 0;
    int v13 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v13, *(const void **)(v5 + 32), *(void *)(v5 + 40), (uint64_t)(*(void *)(v5 + 40) - *(void *)(v5 + 32)) >> 3);
    uint64_t v7 = [MEMORY[0x1E4F28E60] indexSet];
    [v4 addObject:v7];

    id v9 = v13;
    id v8 = v14;
    if (v13 != v14)
    {
      do
      {
        uint64_t v10 = *v9;
        double v11 = [v4 lastObject];
        [v11 addIndex:v10];

        ++v9;
      }
      while (v9 != v8);
      id v9 = v13;
    }
    if (v9)
    {
      int v14 = v9;
      operator delete(v9);
    }
  }
  _Block_object_dispose(&v17, 8);
  std::vector<+[CRFormParser horizontalClustersFromFields:]::ClusteredLine>::~vector[abi:ne180100](v23);

  return v4;
}

+ (void)horizontalClustersFromFields:(void *)a1
{
  v2 = (char *)*a1;
  if (*a1)
  {
    id v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = (void *)*((void *)v3 - 3);
        if (v5)
        {
          *((void *)v3 - 2) = v5;
          operator delete(v5);
        }
        v3 -= 56;
      }
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void __45__CRFormParser_horizontalClustersFromFields___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 boundingQuad];
  [v6 boundingBox];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  if ([v5 fieldSource] == 1
    && (v62.origin.x = v8, v62.origin.y = v10, v62.size.width = v12, v62.size.height = v14, CGRectGetWidth(v62) < 0.2))
  {
    v63.origin.x = v8;
    v63.origin.y = v10;
    v63.size.width = v12;
    v63.size.height = v14;
    BOOL v15 = CGRectGetHeight(v63) < 0.2;
  }
  else
  {
    BOOL v15 = 0;
  }
  v64.origin.x = v8;
  v64.origin.y = v10;
  v64.size.width = v12;
  v64.size.height = v14;
  double Width = CGRectGetWidth(v64);
  v65.origin.x = v8;
  v65.origin.y = v10;
  v65.size.width = v12;
  v65.size.height = v14;
  double v17 = Width / CGRectGetHeight(v65);
  BOOL v18 = v17 > 0.5 && v15;
  if (v18 && v17 < 2.5)
  {
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v21 = *(void *)(v20 + 48);
    uint64_t v22 = *(void *)(v20 + 56);
    while (v21 != v22)
    {
      v66.origin.x = v8;
      v66.origin.y = v10;
      v66.size.width = v12;
      v66.size.height = v14;
      double MidY = CGRectGetMidY(v66);
      if (MidY >= CGRectGetMinY(*(CGRect *)v21))
      {
        v67.origin.x = v8;
        v67.origin.y = v10;
        v67.size.width = v12;
        v67.size.height = v14;
        double v24 = CGRectGetMidY(v67);
        if (v24 <= CGRectGetMaxY(*(CGRect *)v21)) {
          goto LABEL_31;
        }
      }
      double v25 = CGRectGetMidY(*(CGRect *)v21);
      v68.origin.x = v8;
      v68.origin.y = v10;
      v68.size.width = v12;
      v68.size.height = v14;
      if (v25 >= CGRectGetMinY(v68))
      {
        double v26 = CGRectGetMidY(*(CGRect *)v21);
        v69.origin.x = v8;
        v69.origin.y = v10;
        v69.size.width = v12;
        v69.size.height = v14;
        if (v26 <= CGRectGetMaxY(v69))
        {
LABEL_31:
          v70.origin.x = v8;
          v70.origin.y = v10;
          v70.size.width = v12;
          v70.size.height = v14;
          *(CGRect *)uint64_t v21 = CGRectUnion(*(CGRect *)v21, v70);
          double v39 = *(char **)(v21 + 40);
          unint64_t v40 = *(void *)(v21 + 48);
          if ((unint64_t)v39 >= v40)
          {
            BOOL v41 = *(char **)(v21 + 32);
            uint64_t v42 = (v39 - v41) >> 3;
            if ((unint64_t)(v42 + 1) >> 61) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v43 = v40 - (void)v41;
            unint64_t v44 = (uint64_t)(v40 - (void)v41) >> 2;
            if (v44 <= v42 + 1) {
              unint64_t v44 = v42 + 1;
            }
            if (v43 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v45 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v45 = v44;
            }
            if (v45)
            {
              double v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v21 + 48, v45);
              BOOL v41 = *(char **)(v21 + 32);
              double v39 = *(char **)(v21 + 40);
            }
            else
            {
              double v46 = 0;
            }
            v54 = &v46[8 * v42];
            v55 = &v46[8 * v45];
            *(void *)v54 = a3;
            v56 = v54 + 8;
            while (v39 != v41)
            {
              uint64_t v57 = *((void *)v39 - 1);
              v39 -= 8;
              *((void *)v54 - 1) = v57;
              v54 -= 8;
            }
            *(void *)(v21 + 32) = v54;
            *(void *)(v21 + 40) = v56;
            *(void *)(v21 + 48) = v55;
            if (v41) {
              operator delete(v41);
            }
            *(void *)(v21 + 40) = v56;
          }
          else
          {
            *(void *)double v39 = a3;
            *(void *)(v21 + 40) = v39 + 8;
          }
          goto LABEL_48;
        }
      }
      v21 += 56;
    }
    long long v27 = operator new(8uLL);
    *long long v27 = a3;
    uint64_t v28 = (uint64_t)(v27 + 1);
    long long v29 = *(int64x2_t **)(*(void *)(a1 + 32) + 8);
    long long v30 = (CGFloat *)v29[3].i64[1];
    unint64_t v31 = v29[4].u64[0];
    if ((unint64_t)v30 >= v31)
    {
      uint64_t v33 = v29[3].i64[0];
      uint64_t v34 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v30 - v33) >> 3);
      if ((unint64_t)(v34 + 1) > 0x492492492492492) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v35 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v31 - v33) >> 3);
      uint64_t v36 = 2 * v35;
      if (2 * v35 <= v34 + 1) {
        uint64_t v36 = v34 + 1;
      }
      if (v35 >= 0x249249249249249) {
        unint64_t v37 = 0x492492492492492;
      }
      else {
        unint64_t v37 = v36;
      }
      v61 = v29 + 4;
      if (v37)
      {
        if (v37 > 0x492492492492492) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v38 = (char *)operator new(56 * v37);
      }
      else
      {
        uint64_t v38 = 0;
      }
      double v47 = (CGFloat *)&v38[56 * v34];
      v58 = v38;
      v59.i64[0] = (uint64_t)v47;
      v59.i64[1] = (uint64_t)v47;
      v60 = &v38[56 * v37];
      *double v47 = v8;
      v47[1] = v10;
      v47[2] = v12;
      v47[3] = v14;
      v47[5] = 0.0;
      v47[6] = 0.0;
      v47[4] = 0.0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>((void *)v47 + 4, v27, v28, 1uLL);
      uint64_t v48 = v59.i64[0];
      uint64_t v32 = v59.i64[1] + 56;
      v59.i64[1] += 56;
      uint64_t v50 = v29[3].i64[0];
      unint64_t v49 = v29[3].u64[1];
      if (v49 == v50)
      {
        int64x2_t v52 = vdupq_n_s64(v49);
      }
      else
      {
        do
        {
          long long v51 = *(_OWORD *)(v49 - 56);
          *(_OWORD *)(v48 - 40) = *(_OWORD *)(v49 - 40);
          *(_OWORD *)(v48 - 56) = v51;
          *(void *)(v48 - 16) = 0;
          *(void *)(v48 - 8) = 0;
          *(void *)(v48 - 24) = 0;
          *(_OWORD *)(v48 - 24) = *(_OWORD *)(v49 - 24);
          *(void *)(v48 - 8) = *(void *)(v49 - 8);
          v48 -= 56;
          *(void *)(v49 - 24) = 0;
          *(void *)(v49 - 16) = 0;
          *(void *)(v49 - 8) = 0;
          v49 -= 56;
        }
        while (v49 != v50);
        int64x2_t v52 = v29[3];
        uint64_t v32 = v59.i64[1];
      }
      v29[3].i64[0] = v48;
      v29[3].i64[1] = v32;
      int64x2_t v59 = v52;
      v53 = (char *)v29[4].i64[0];
      v29[4].i64[0] = (uint64_t)v60;
      v60 = v53;
      v58 = (char *)v52.i64[0];
      std::__split_buffer<+[CRFormParser horizontalClustersFromFields:]::ClusteredLine>::~__split_buffer((uint64_t)&v58);
    }
    else
    {
      *long long v30 = v8;
      v30[1] = v10;
      v30[2] = v12;
      v30[3] = v14;
      v30[5] = 0.0;
      v30[6] = 0.0;
      v30[4] = 0.0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>((void *)v30 + 4, v27, v28, 1uLL);
      uint64_t v32 = (uint64_t)(v30 + 7);
      v29[3].i64[1] = v32;
    }
    v29[3].i64[1] = v32;
    operator delete(v27);
  }
LABEL_48:
}

+ (id)_groupSegmentedFieldsInFields:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CRFormParser horizontalClustersFromFields:v3];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  CGFloat v12 = __46__CRFormParser__groupSegmentedFieldsInFields___block_invoke;
  double v13 = &unk_1E6CDA978;
  id v6 = v3;
  id v14 = v6;
  id v7 = v5;
  id v15 = v7;
  [v4 enumerateObjectsUsingBlock:&v10];
  CGFloat v8 = objc_msgSend(v6, "mutableCopy", v10, v11, v12, v13);
  [v8 removeObjectsInArray:v7];

  return v8;
}

void __46__CRFormParser__groupSegmentedFieldsInFields___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  if ((unint64_t)[v20 count] >= 4)
  {
    id v3 = [*(id *)(a1 + 32) objectsAtIndexes:v20];
    double v23 = [v3 sortedArrayUsingComparator:&__block_literal_global_23];

    uint64_t v4 = CROSLogForCategory(6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v23 count];
      _os_log_impl(&dword_1DD733000, v4, OS_LOG_TYPE_DEBUG, "Force-grouping %ld fields from a line", (uint8_t *)&buf, 0xCu);
    }

    +[CRFormParser _groupSegmentedFieldsInAlignedFields:v23];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v5)
    {
      uint64_t v22 = *(void *)v27;
      *(void *)&long long v6 = 134218240;
      long long v19 = v6;
      do
      {
        uint64_t v24 = v5;
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(obj);
          }
          CGFloat v8 = objc_msgSend(v23, "objectsAtIndexes:", *(void *)(*((void *)&v26 + 1) + 8 * i), v19);
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v35 = 0x2020000000;
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __46__CRFormParser__groupSegmentedFieldsInFields___block_invoke_24;
          v25[3] = &unk_1E6CDA930;
          v25[4] = &buf;
          [v8 enumerateObjectsUsingBlock:v25];
          if (*(void *)(*((void *)&buf + 1) + 24) == 0x7FFFFFFFFFFFFFFFLL)
          {
            double v9 = 0;
          }
          else
          {
            double v9 = objc_msgSend(v8, "objectAtIndexedSubscript:");
            uint64_t v10 = [v9 boundingQuad];
            for (unint64_t j = *(void *)(*((void *)&buf + 1) + 24) + 1; j < [v8 count]; ++j)
            {
              CGFloat v12 = [v8 objectAtIndexedSubscript:j];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                double v13 = [v12 boundingQuad];
                uint64_t v14 = [v10 unionWithNormalizedQuad:v13 baselineAngle:0.0];

                uint64_t v10 = (void *)v14;
                [*(id *)(a1 + 40) addObject:v12];
              }
            }
            [v9 setBoundingQuad:v10];
            objc_msgSend(v9, "setMaxCharacterCount:", objc_msgSend(v8, "count"));
          }
          id v15 = CROSLogForCategory(6);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v16 = [v20 count];
            uint64_t v17 = [*(id *)(a1 + 32) count];
            uint64_t v18 = [*(id *)(a1 + 40) count];
            *(_DWORD *)long long v30 = v19;
            uint64_t v31 = v16;
            __int16 v32 = 2048;
            uint64_t v33 = v17 - v18;
            _os_log_impl(&dword_1DD733000, v15, OS_LOG_TYPE_DEBUG, "Removing %ld fields from global list, remaining field count = %ld", v30, 0x16u);
          }

          _Block_object_dispose(&buf, 8);
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v37 count:16];
      }
      while (v5);
    }
  }
}

uint64_t __46__CRFormParser__groupSegmentedFieldsInFields___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 boundingQuad];
  [v5 boundingBox];
  double MidX = CGRectGetMidX(v11);
  id v7 = [v4 boundingQuad];
  [v7 boundingBox];
  double v8 = CGRectGetMidX(v12);

  if (MidX >= v8) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }

  return v9;
}

void __46__CRFormParser__groupSegmentedFieldsInFields___block_invoke_24(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

+ (id)_groupSegmentedFieldsInAlignedFields:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = 0;
  uint64_t v5 = 0;
  v66[0] = 0;
  v66[1] = 0;
  v64[1] = 0;
  CGRect v65 = (uint64_t *)v66;
  CGRect v63 = (uint64_t *)v64;
  v64[0] = 0;
  while (v4 < [v3 count] - 1)
  {
    long long v6 = [v3 objectAtIndexedSubscript:v4];
    id v7 = [v6 boundingQuad];
    [v7 size];
    double v9 = v8;

    unint64_t v10 = v4 + 1;
    CGRect v11 = [v3 objectAtIndexedSubscript:v4 + 1];
    CGRect v12 = [v11 boundingQuad];
    [v12 boundingBox];
    double MinX = CGRectGetMinX(v75);
    uint64_t v14 = [v3 objectAtIndexedSubscript:v4];
    id v15 = [v14 boundingQuad];
    [v15 boundingBox];
    double MaxX = CGRectGetMaxX(v76);

    int v17 = (int)(v9 * 100.0);
    *(_DWORD *)long long buf = v17;
    int v18 = (int)((MinX - MaxX) * 100.0);
    int v62 = v18;
    if (v17 <= 9 && MinX - MaxX >= 0.0 && v18 <= 5)
    {
      long long v19 = v64[0];
      if (!v64[0]) {
        goto LABEL_15;
      }
      id v20 = v64;
      do
      {
        uint64_t v21 = v19;
        uint64_t v22 = v20;
        int v23 = *((_DWORD *)v19 + 8);
        uint64_t v24 = v19 + 1;
        if (v23 >= v17)
        {
          uint64_t v24 = v21;
          id v20 = (void **)v21;
        }
        long long v19 = (void *)*v24;
      }
      while (v19);
      if (v20 == v64) {
        goto LABEL_15;
      }
      if (v23 < v17) {
        uint64_t v21 = v22;
      }
      if (*((_DWORD *)v21 + 8) > v17) {
LABEL_15:
      }
        std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v63, (int)(v9 * 100.0), buf)[5] = 0;
      double v25 = std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v63, (int)(v9 * 100.0), buf);
      void v25[5] = (uint64_t *)((char *)v25[5] + 1);
      long long v26 = v66[0];
      if (!v66[0]) {
        goto LABEL_25;
      }
      long long v27 = v66;
      do
      {
        long long v28 = v26;
        long long v29 = v27;
        int v30 = *((_DWORD *)v26 + 8);
        uint64_t v31 = v26 + 1;
        if (v30 >= v18)
        {
          uint64_t v31 = v28;
          long long v27 = (void **)v28;
        }
        long long v26 = (void *)*v31;
      }
      while (v26);
      if (v27 == v66) {
        goto LABEL_25;
      }
      if (v30 < v18) {
        long long v28 = v29;
      }
      if (*((_DWORD *)v28 + 8) > v18) {
LABEL_25:
      }
        std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v65, v18, &v62)[5] = 0;
      __int16 v32 = std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v65, v18, &v62);
      ++v5;
      v32[5] = (uint64_t *)((char *)v32[5] + 1);
    }
    unint64_t v4 = v10;
  }
  uint64_t v33 = v65;
  if (v65 == (uint64_t *)v66)
  {
    int v35 = -1;
    unint64_t v34 = -1;
  }
  else
  {
    unint64_t v34 = -1;
    int v35 = -1;
    do
    {
      if (v35 == -1 || v33[5] > v34)
      {
        unint64_t v34 = v33[5];
        int v35 = *((_DWORD *)v33 + 8);
      }
      uint64_t v38 = (uint64_t *)v33[1];
      if (v38)
      {
        do
        {
          double v39 = v38;
          uint64_t v38 = (uint64_t *)*v38;
        }
        while (v38);
      }
      else
      {
        do
        {
          double v39 = (uint64_t *)v33[2];
          BOOL v40 = *v39 == (void)v33;
          uint64_t v33 = v39;
        }
        while (!v40);
      }
      uint64_t v33 = v39;
    }
    while (v39 != (uint64_t *)v66);
  }
  BOOL v41 = v63;
  if (v63 == (uint64_t *)v64)
  {
    int v43 = -1;
    uint64_t v42 = -1;
  }
  else
  {
    uint64_t v42 = -1;
    int v43 = -1;
    do
    {
      if (v43 == -1 || v41[5] > v34)
      {
        uint64_t v42 = v41[5];
        int v43 = *((_DWORD *)v41 + 8);
      }
      double v46 = (uint64_t *)v41[1];
      if (v46)
      {
        do
        {
          double v47 = v46;
          double v46 = (uint64_t *)*v46;
        }
        while (v46);
      }
      else
      {
        do
        {
          double v47 = (uint64_t *)v41[2];
          BOOL v40 = *v47 == (void)v41;
          BOOL v41 = v47;
        }
        while (!v40);
      }
      BOOL v41 = v47;
    }
    while (v47 != (uint64_t *)v64);
  }
  uint64_t v48 = CROSLogForCategory(6);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134219008;
    CGRect v68 = v5;
    __int16 v69 = 1024;
    *(_DWORD *)CGRect v70 = v43;
    *(_WORD *)&v70[4] = 2048;
    *(void *)&v70[6] = v42;
    *(_WORD *)&v70[14] = 1024;
    *(_DWORD *)&v70[16] = v35;
    __int16 v71 = 2048;
    unint64_t v72 = v34;
    _os_log_impl(&dword_1DD733000, v48, OS_LOG_TYPE_DEBUG, "Line analysis with %ld fields: modal width = %d (%ld fields) gap width = %d (%ld fields)", buf, 0x2Cu);
  }

  double v49 = (double)v35;
  uint64_t v50 = [a1 _rangeOfFirstSegmentedFieldGroupInFields:v3 startIndex:0 modalWidth:(double)v43 modelGap:(double)v35];
  unint64_t v52 = v51;
  v53 = [MEMORY[0x1E4F1CA48] array];
  *(void *)&long long v54 = 136315650;
  long long v60 = v54;
  while (v50 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v55 = CROSLogForCategory(6);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = v60;
      CGRect v68 = "+[CRFormParser _groupSegmentedFieldsInAlignedFields:]";
      __int16 v69 = 2048;
      *(void *)CGRect v70 = v50;
      *(_WORD *)&v70[8] = 2048;
      *(void *)&v70[10] = v52;
      _os_log_impl(&dword_1DD733000, v55, OS_LOG_TYPE_DEBUG, "%s: Found a range of small fields to be merged together (%ld, %ld)", buf, 0x20u);
    }

    if (v52 >= 2)
    {
      v56 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v50, v52);
      [v53 addObject:v56];
    }
    uint64_t v50 = objc_msgSend(a1, "_rangeOfFirstSegmentedFieldGroupInFields:startIndex:modalWidth:modelGap:", v3, v50 + v52, (double)v43, v49, v60);
    unint64_t v52 = v57;
  }
  if (v52 >= 2)
  {
    v58 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0x7FFFFFFFFFFFFFFFLL, v52);
    [v53 addObject:v58];
  }
  std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::destroy(v64[0]);
  std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::destroy(v66[0]);

  return v53;
}

+ (id)_textFieldsAndRegionsFrom:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_30];
  uint64_t v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

BOOL __42__CRFormParser__textFieldsAndRegionsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CRCastAsClass<CROutputRegion>(v2);
  unint64_t v4 = v3;
  if (v3 && [v3 type] != 0x2000)
  {
    BOOL v7 = 1;
    goto LABEL_10;
  }
  id v5 = v2;
  if (([v5 conformsToProtocol:&unk_1F3946040] & 1) == 0)
  {

    id v6 = 0;
    goto LABEL_7;
  }
  id v6 = v5;

  if (!v6)
  {
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  BOOL v7 = [v6 fieldType] == 1;
LABEL_8:

LABEL_10:
  return v7;
}

- (void)_parseFieldsWithLabelFinderAndKeywords:(id)a3 fieldsAndRegions:(id)a4 updateExternal:(BOOL)a5 locale:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  long long v26 = [a4 _nonFieldRegions];
  BOOL v7 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obunint64_t j = v24;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        CGRect v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        memset(v27, 0, sizeof(v27));
        CGRect v12 = +[CRFormLabelFinder parseAndAssignLabelForField:v11 regions:v26 associatedLabels:v7 labelRegions:v27];
        if ([v11 fieldType] == 1
          && [v11 fieldSource] == 1
          && [v11 textContentType])
        {
          [v11 setTextContentType:0];
        }
        if ([v11 fieldType] == 1 && objc_msgSend(v11, "fieldSource") == 7)
        {
          double v13 = [v11 fieldValue];
          BOOL v14 = [v13 length] == 0;

          if (!v14) {
            [v11 setTextContentType:50];
          }
        }
        else
        {
          id v15 = [v12 text];
          BOOL v16 = v15 == 0;

          if (!v16)
          {
            int v17 = [v12 text];
            unint64_t v18 = +[CRFormContentTypeKeywordBasedPredictor predictContentTypeWithKeywordMatching:v17 locale:0 keyword:0 withPriorityKeywords:1];

            if (v18) {
              goto LABEL_20;
            }
            long long v19 = [v12 text];
            unint64_t v18 = +[CRFormContentTypeKeywordBasedPredictor predictContentTypeWithKeywordMatching:v19 locale:0 keyword:0 withPriorityKeywords:0];

            id v20 = +[CRFormContentTypeKeywordBasedPredictor useKeywordTypes];
            uint64_t v21 = [NSNumber numberWithUnsignedInteger:v18];
            char v22 = [v20 containsObject:v21];

            char v23 = v18 ? v22 : 0;
            if (v23)
            {
LABEL_20:
              if ([v11 fieldType] == 1) {
                [v11 setTextContentType:v18];
              }
            }
          }
        }

        __int16 v32 = (void **)v27;
        std::vector<std::tuple<double,CRFormFieldLabelPosition,CROutputRegion * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v32);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }
}

- (void)_parseFieldsWithTransformer:(id)a3 fieldsAndRegions:(id)a4 updateExternal:(BOOL)a5 locale:(id)a6
{
  BOOL v7 = a5;
  id v15 = a3;
  id v10 = a4;
  id v11 = a6;
  [(CRFormParser *)self _parseFieldsWithLabelFinderAndKeywords:v15 fieldsAndRegions:v10 updateExternal:v7 locale:v11];
  predictor = self->_predictor;
  double v13 = [v15 _fieldsOfType:1];
  BOOL v14 = [(id)objc_opt_class() _textFieldsAndRegionsFrom:v10];
  [(CRFormContentTypePredictor *)predictor predictAndAssignContentTypesForFields:v13 fieldsAndRegions:v14 locale:v11 updateExternal:v7];
}

+ (id)_mergedFieldsWithUnifiedQuadsFromFields:(id)a3 needsFieldReplacement:(BOOL *)a4 originalField:(id)a5 replacementField:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v9 indexOfObjectPassingTest:&__block_literal_global_116];
  uint64_t v13 = [v9 indexOfObjectPassingTest:&__block_literal_global_118];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v24 = v9;
  }
  else
  {
    BOOL v14 = (void *)[v9 mutableCopy];
    id v15 = [v9 objectAtIndexedSubscript:v13];
    BOOL v16 = [v15 boundingQuad];
    [v16 normalizationSize];
    uint64_t v18 = v17;
    uint64_t v20 = v19;

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke_3;
    v34[3] = &__block_descriptor_48_e39_B32__0___CRFormFieldProviding__8Q16_B24l;
    v34[4] = v18;
    v34[5] = v20;
    uint64_t v21 = [v9 indexesOfObjectsPassingTest:v34];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke_4;
    v26[3] = &unk_1E6CDAA00;
    id v27 = v9;
    uint64_t v31 = v18;
    uint64_t v32 = v20;
    id v28 = v10;
    id v29 = v11;
    id v22 = v14;
    id v30 = v22;
    uint64_t v33 = a4;
    [v21 enumerateIndexesUsingBlock:v26];
    char v23 = v30;
    id v24 = v22;
  }
  return v24;
}

BOOL __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 fieldSource] == 4
    || [v2 fieldSource] == 5
    || [v2 fieldSource] == 6;

  return v3;
}

BOOL __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 fieldSource] == 1
    || [v2 fieldSource] == 2
    || [v2 fieldSource] == 3;

  return v3;
}

BOOL __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 boundingQuad];
  [v3 normalizationSize];
  BOOL v6 = v5 != *(double *)(a1 + 40) || v4 != *(double *)(a1 + 32);

  return v6;
}

void __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  double v4 = [CRNormalizedQuad alloc];
  double v5 = [v8 boundingQuad];
  [v5 boundingBox];
  BOOL v6 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:](v4, "initWithNormalizedBoundingBox:size:");

  BOOL v7 = -[CRFormField initWithQuad:type:source:value:contentType:maxCharacterCount:]([CRFormField alloc], "initWithQuad:type:source:value:contentType:maxCharacterCount:", v6, [v8 fieldType], objc_msgSend(v8, "fieldSource"), 0, objc_msgSend(v8, "textContentType"), objc_msgSend(v8, "maxCharacterCount"));
  [(CRFormField *)v7 setOriginalField:v8];
  [*(id *)(a1 + 40) addObject:v8];
  [*(id *)(a1 + 48) addObject:v7];
  [*(id *)(a1 + 56) setObject:v7 atIndexedSubscript:a2];
  **(unsigned char **)(a1 + 80) = 1;
}

+ (id)_restoredFieldsWithFields:(id)a3 originalField:(id)a4 replacementField:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obunint64_t j = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        BOOL v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
        if ([v14 fieldSource] == 4
          || [v14 fieldSource] == 5
          || [v14 fieldSource] == 6)
        {
          id v15 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "indexOfObject:", v14));
          [v10 addObject:v15];
        }
        else
        {
          BOOL v16 = CRCastAsClass<CRFormFieldOutputRegion>(v14);
          id v15 = v16;
          if (v16)
          {
            uint64_t v17 = [v16 precedingExternalField];
            BOOL v18 = v17 == 0;

            if (!v18)
            {
              uint64_t v19 = [v15 precedingExternalField];
              uint64_t v20 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "indexOfObject:", v19));
              [v15 setPrecedingExternalField:v20];
            }
          }
          [v10 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v21 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v11 = v21;
    }
    while (v21);
  }

  return v10;
}

- (id)_orderAndGroupLinesInDocument:(id)a3 allFields:(id)a4 regions:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v36 = a5;
  id v28 = v7;
  uint64_t v29 = v8;
  uint64_t v31 = [v7 contentsWithTypes:8];
  [(id)objc_opt_class() _groupSegmentedFieldsInFields:v8];
  uint64_t v32 = v45 = 0;
  uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v32, "count"));
  uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v32, "count"));
  id v30 = [(id)objc_opt_class() _mergedFieldsWithUnifiedQuadsFromFields:v32 needsFieldReplacement:&v45 originalField:v33 replacementField:v34];
  +[CRFormParser _orderedGroupsWithFields:v30 lines:v31];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v13 = CROSLogForCategory(6);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          BOOL v14 = [v12 boundingQuad];
          id v15 = [v14 description];
          *(_DWORD *)long long buf = 136315394;
          uint64_t v48 = "-[CRFormParser _orderAndGroupLinesInDocument:allFields:regions:]";
          __int16 v49 = 2112;
          uint64_t v50 = (uint64_t)v15;
          _os_log_impl(&dword_1DD733000, v13, OS_LOG_TYPE_DEBUG, "%s: Sorting groups: %@", buf, 0x16u);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
    }
    while (v9);
  }

  BOOL v16 = CROSLogForCategory(6);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = [v32 count];
    uint64_t v18 = [v31 count];
    uint64_t v19 = [obj count];
    *(_DWORD *)long long buf = 136315906;
    uint64_t v48 = "-[CRFormParser _orderAndGroupLinesInDocument:allFields:regions:]";
    __int16 v49 = 2048;
    uint64_t v50 = v17;
    __int16 v51 = 2048;
    uint64_t v52 = v18;
    __int16 v53 = 2048;
    uint64_t v54 = v19;
    _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_DEBUG, "%s: Parsing %lu form fields with %lu text lines (%lu groups)", buf, 0x2Au);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = obj;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = [*(id *)(*((void *)&v37 + 1) + 8 * j) subregions];
        [v36 addObjectsFromArray:v24];
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v21);
  }

  long long v25 = [v36 _flattenedFields];
  if (v45)
  {
    uint64_t v26 = [(id)objc_opt_class() _restoredFieldsWithFields:v25 originalField:v33 replacementField:v34];

    long long v25 = (void *)v26;
  }

  return v25;
}

+ (id)_dominantLocaleInRegions:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  BOOL v3 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = v24;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = CRCastAsClass<CROutputRegion>(*(void **)(*((void *)&v33 + 1) + 8 * i));
        uint64_t v9 = v8;
        if (v8)
        {
          if ([v8 type] != 0x2000
            || ([v9 labelRegion],
                uint64_t v10 = objc_claimAutoreleasedReturnValue(),
                v9,
                (uint64_t v9 = (void *)v10) != 0))
          {
            uint64_t v11 = [v9 text];
            BOOL v12 = [v11 length] == 0;

            if (!v12)
            {
              uint64_t v13 = [v9 text];
              if ([v13 length] == 1)
              {
                BOOL v14 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
                id v15 = [v9 text];
                char v16 = objc_msgSend(v14, "characterIsMember:", objc_msgSend(v15, "characterAtIndex:", 0));

                if (v16) {
                  goto LABEL_19;
                }
              }
              else
              {
              }
              uint64_t v17 = [v9 recognizedLocale];
              if (v17)
              {
                uint64_t v18 = NSNumber;
                uint64_t v19 = [v3 objectForKeyedSubscript:v17];
                id v20 = v19;
                if (!v19) {
                  uint64_t v19 = &unk_1F3932BF0;
                }
                uint64_t v21 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "integerValue") + 1);
                [v3 setObject:v21 forKeyedSubscript:v17];
              }
            }
          }
        }
LABEL_19:
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v5);
  }

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__125;
  id v30 = __Block_byref_object_dispose__126;
  id v31 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __41__CRFormParser__dominantLocaleInRegions___block_invoke;
  v25[3] = &unk_1E6CDAA28;
  v25[4] = v32;
  void v25[5] = &v26;
  [v3 enumerateKeysAndObjectsUsingBlock:v25];
  id v22 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(v32, 8);
  return v22;
}

void __41__CRFormParser__dominantLocaleInRegions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if ([v6 integerValue] > *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 integerValue];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

+ (void)_setPrecedingExternalFieldsForFields:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  id v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "fieldSource", (void)v12) != 4 || objc_msgSend(v8, "fieldType") == -1)
        {
          uint64_t v11 = CRCastAsClass<CRFormFieldOutputRegion>(v8);
          uint64_t v10 = v11;
          if (v11) {
            [v11 setPrecedingExternalField:v4];
          }
        }
        else
        {
          id v9 = v8;
          uint64_t v10 = v4;
          id v4 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (BOOL)_localeIsEnabled:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length]) {
    BOOL v5 = +[CRImageReader languageIsLatin:v4]
  }
      || +[CRImageReader languageIsJapanese:v4]
      || +[CRImageReader languageIsKorean:v4]
      || +[CRImageReader languageIsChinese:v4]
      || +[CRImageReader languageIsVietnamese:v4]
      || +[CRImageReader languageIsThai:v4]
      || +[CRImageReader languageIsCyrillic:v4];
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)parseFieldsInDocument:(id)a3 allFields:(id)a4 shouldUpdateExternalFields:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = [(CRFormParser *)self _orderAndGroupLinesInDocument:v8 allFields:v9 regions:v10];
  [(id)objc_opt_class() _setPrecedingExternalFieldsForFields:v11];
  long long v12 = [(id)objc_opt_class() _dominantLocaleInRegions:v10];
  BOOL v13 = [(CRFormParser *)self _localeIsEnabled:v12];
  long long v14 = CROSLogForCategory(6);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      int v19 = 136315394;
      id v20 = "-[CRFormParser parseFieldsInDocument:allFields:shouldUpdateExternalFields:]";
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl(&dword_1DD733000, v14, OS_LOG_TYPE_DEFAULT, "%s: Content type prediction for locale %@ is enabled.", (uint8_t *)&v19, 0x16u);
    }

    [(CRFormParser *)self _parseFieldsWithTransformer:v11 fieldsAndRegions:v10 updateExternal:v5 locale:v12];
    long long v14 = +[CRFormContentTypeRefiner groupAndAssignStructuralContentTypesForFields:v11 locale:v12 updateExternalFields:v5];
    uint64_t v16 = [v14 mutableCopy];

    uint64_t v11 = (void *)v16;
  }
  else if (v15)
  {
    int v19 = 136315394;
    id v20 = "-[CRFormParser parseFieldsInDocument:allFields:shouldUpdateExternalFields:]";
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl(&dword_1DD733000, v14, OS_LOG_TYPE_DEFAULT, "%s: Content type prediction for locale %@ is disabled.", (uint8_t *)&v19, 0x16u);
  }

  id v17 = v11;
  return v17;
}

- (void).cxx_destruct
{
}

+ (uint64_t)horizontalClustersFromFields:(uint64_t)a1
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    *(void *)(a1 + 16) = v2 - 56;
    id v4 = *(void **)(v2 - 24);
    if (v4)
    {
      *(void *)(v2 - 16) = v4;
      operator delete(v4);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 56;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

@end