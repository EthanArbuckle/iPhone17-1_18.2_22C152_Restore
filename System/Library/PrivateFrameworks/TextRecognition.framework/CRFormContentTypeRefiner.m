@interface CRFormContentTypeRefiner
+ (BOOL)_isRegion:(id)a3 onLeftOfRegion:(id)a4 withTolerance:(double)a5;
+ (id)_findSubTextFieldsInFields:(const void *)a3 maxLength:(unint64_t)a4 minAspectRatio:(double)a5 contentTypes:(const void *)a6 includeNone:(BOOL)a7;
+ (id)groupAndAssignStructuralContentTypesForFields:(id)a3 locale:(id)a4 updateExternalFields:(BOOL)a5;
+ (void)_groupCreditCardNumberWithContext:(ContentTypeRefinementContext *)a3 shouldGroup:(BOOL)a4;
+ (void)_groupOrRefinePhoneNumberWithContext:(ContentTypeRefinementContext *)a3 shouldGroup:(BOOL)a4;
+ (void)_refineAddressTypesWithContext:(ContentTypeRefinementContext *)a3;
+ (void)_refineCreditCardExpirationTypesWithContext:(ContentTypeRefinementContext *)a3;
+ (void)_refineDateAndBirthdayTypesWithContext:(ContentTypeRefinementContext *)a3 locale:(id)a4;
@end

@implementation CRFormContentTypeRefiner

+ (BOOL)_isRegion:(id)a3 onLeftOfRegion:(id)a4 withTolerance:(double)a5
{
  id v7 = a4;
  v8 = [a3 boundingQuad];
  v9 = [v7 boundingQuad];
  [v8 size];
  double v11 = v10;
  [v9 size];
  double v13 = v12;
  [v9 topLeft];
  double v15 = v14;
  [v8 topRight];
  double v17 = v16;
  [v8 midPoint];
  double v19 = v18;
  [v9 midPoint];
  if (v19 >= v20
    || (double v21 = (v11 + v13) * 0.5, v15 - v17 >= v21 * a5 * 1.5)
    || v15 - v17 <= -(a5 * v21)
    || ([v8 size], double v23 = v22, objc_msgSend(v9, "size"), vabdd_f64(v23, v24) >= v21 * 0.3))
  {
    BOOL v28 = 0;
  }
  else
  {
    [v8 midPoint];
    double v26 = v25;
    [v9 midPoint];
    BOOL v28 = vabdd_f64(v26, v27) < v21 * 0.5;
  }

  return v28;
}

+ (void)_groupOrRefinePhoneNumberWithContext:(ContentTypeRefinementContext *)a3 shouldGroup:(BOOL)a4
{
  BOOL v5 = a4;
  var1 = a3->var1;
  v9 = operator new(0x28uLL);
  double v23 = v9 + 5;
  double v24 = (char *)(v9 + 5);
  v9[4] = 48;
  *(_OWORD *)v9 = _ZGRZ77__CRFormContentTypeRefiner__groupOrRefinePhoneNumberWithContext_shouldGroup__E15kTelephoneTypes_;
  *((_OWORD *)v9 + 1) = unk_1DD8CE798;
  __p = v9;
  double v10 = [a1 _findSubTextFieldsInFields:var1 maxLength:3 minAspectRatio:&__p contentTypes:1 includeNone:0.1];
  if (__p)
  {
    double v23 = __p;
    operator delete(__p);
  }
  if ([v10 count] != 2 && objc_msgSend(v10, "count") != 3) {
    goto LABEL_31;
  }
  if ([v10 count] != 2) {
    goto LABEL_19;
  }
  uint64_t v11 = [v10 count];
  if (v11 == 2)
  {
    var1 = [v10 objectAtIndexedSubscript:0];
    if ([var1 textContentType] != 45)
    {
LABEL_30:

      goto LABEL_31;
    }
    v4 = [v10 objectAtIndexedSubscript:1];
    if ([v4 textContentType] != 46)
    {
LABEL_29:

      goto LABEL_30;
    }
  }
  if ([v10 count] != 3)
  {
    if (v11 == 2)
    {
    }
    goto LABEL_19;
  }
  double v12 = [v10 objectAtIndexedSubscript:0];
  if ([v12 textContentType] != 45)
  {
LABEL_28:

    if (v11 != 2)
    {
LABEL_31:
      goto LABEL_32;
    }
    goto LABEL_29;
  }
  double v13 = [v10 objectAtIndexedSubscript:1];
  if ([v13 textContentType] != 47)
  {

    goto LABEL_28;
  }
  double v14 = [v10 objectAtIndexedSubscript:2];
  uint64_t v15 = [v14 textContentType];

  if (v11 == 2)
  {
  }
  if (v15 != 48) {
    goto LABEL_31;
  }
LABEL_19:
  if (v5)
  {
    double v16 = [v10 objectAtIndexedSubscript:0];
    [v16 setTextContentType:45];

    double v17 = [v10 objectAtIndexedSubscript:1];
    [v17 setTextContentType:46];

    if ([v10 count] == 3)
    {
      double v18 = [v10 objectAtIndexedSubscript:2];
      [v18 setTextContentType:46];
    }
  }
  else
  {
    double v19 = [v10 objectAtIndexedSubscript:0];
    [v19 setTextContentType:45];

    if ([v10 count] == 2)
    {
      double v20 = [v10 objectAtIndexedSubscript:1];
      [v20 setTextContentType:46];
    }
    else
    {
      double v21 = [v10 objectAtIndexedSubscript:1];
      [v21 setTextContentType:47];

      double v20 = [v10 objectAtIndexedSubscript:2];
      [v20 setTextContentType:48];
    }
  }
LABEL_32:
}

+ (id)_findSubTextFieldsInFields:(const void *)a3 maxLength:(unint64_t)a4 minAspectRatio:(double)a5 contentTypes:(const void *)a6 includeNone:(BOOL)a7
{
  double v10 = objc_opt_new();
  unint64_t v35 = a4;
  uint64_t v11 = *((void *)a3 + 1);
  if (3 * a4 >= *((void *)a3 + 2)) {
    unint64_t v12 = *((void *)a3 + 2);
  }
  else {
    unint64_t v12 = 3 * a4;
  }
  if ((const void *)v11 == a3 || v12 == 0)
  {

    goto LABEL_40;
  }
  id v39 = 0;
  unint64_t v14 = 0;
  while (1)
  {
    id v15 = *(id *)(v11 + 16);
    if ([v15 fieldType] == 1)
    {
      uint64_t v16 = [v15 fieldSource];
      if (v16 == [*(id *)(*((void *)a3 + 1) + 16) fieldSource]) {
        break;
      }
    }
LABEL_34:

    ++v14;
    uint64_t v11 = *(void *)(v11 + 8);
    if ((const void *)v11 == a3 || v14 >= v12) {
      goto LABEL_39;
    }
  }
  double v17 = CRCastAsClass<CRFormTextFieldOutputRegion>(v15);
  double v18 = v17;
  if (v17)
  {
    id v19 = [v17 labelRegion];
    double v20 = v19;
    if (v39 || !v19)
    {
      if (v39 && v19 && v19 != v39)
      {

LABEL_33:
        goto LABEL_34;
      }
    }
    else
    {
      id v39 = v19;
    }
  }
  if ([v15 textContentType] && (objc_msgSend(v15, "textContentType") != 1 || !a7))
  {
    double v21 = *(void **)a6;
    double v22 = (void *)*((void *)a6 + 1);
    uint64_t v23 = [v15 textContentType];
    if (v21 != v22)
    {
      while (*v21 != v23)
      {
        if (++v21 == v22)
        {
          double v21 = v22;
          break;
        }
      }
    }
    if (v21 == *((void **)a6 + 1)) {
      goto LABEL_33;
    }
  }
  double v24 = [v10 lastObject];
  if (v24)
  {
    double v25 = [v10 lastObject];
    char v26 = [a1 _isRegion:v25 onLeftOfRegion:v15 withTolerance:2.0];

    if ((v26 & 1) == 0) {
      goto LABEL_33;
    }
  }
  double v27 = [v15 boundingQuad];
  [v27 size];
  double v29 = v28;
  v30 = [v15 boundingQuad];
  [v30 size];
  double v32 = v31 * a5;

  if (v29 < v32) {
    goto LABEL_33;
  }
  [v10 addObject:v15];
  if ([v10 count] != v35) {
    goto LABEL_33;
  }

LABEL_39:
LABEL_40:
  return v10;
}

+ (void)_refineDateAndBirthdayTypesWithContext:(ContentTypeRefinementContext *)a3 locale:(id)a4
{
  id v6 = a4;
  BOOL v7 = +[CRFormContentTypeUtilities contentTypeIsBirthdayComponent:](CRFormContentTypeUtilities, "contentTypeIsBirthdayComponent:", [*(id *)(*((void *)a3->var1 + 1) + 16) textContentType]);
  var1 = a3->var1;
  if (v7) {
    v9 = &_ZGRZ74__CRFormContentTypeRefiner__refineDateAndBirthdayTypesWithContext_locale__E14kBirthdayTypes_;
  }
  else {
    v9 = &_ZGRZ74__CRFormContentTypeRefiner__refineDateAndBirthdayTypesWithContext_locale__E10kDateTypes_;
  }
  double v10 = (char *)operator new(0x20uLL);
  uint64_t v11 = v10 + 32;
  __p = v10;
  v57 = v10 + 32;
  memmove(v10, v9, 0x20uLL);
  v56 = v11;
  unint64_t v12 = [a1 _findSubTextFieldsInFields:var1 maxLength:3 minAspectRatio:&__p contentTypes:0 includeNone:0.1];
  if (__p)
  {
    v56 = __p;
    operator delete(__p);
  }
  [v12 count];
  if ([v12 count] == 3)
  {
    double v13 = a3->var1;
    unint64_t v14 = (char *)operator new(0x20uLL);
    __p = v14;
    v56 = v14;
    v57 = v14 + 32;
    memmove(v14, v9, 0x20uLL);
    v56 = v14 + 32;
    id v15 = [a1 _findSubTextFieldsInFields:v13 maxLength:3 minAspectRatio:&__p contentTypes:0 includeNone:0.2];
    if (__p)
    {
      v56 = __p;
      operator delete(__p);
    }
    unint64_t v16 = [v15 count];
    if (v16 < [v12 count])
    {
      double v17 = [v12 objectAtIndexedSubscript:0];
      double v18 = [v17 boundingQuad];
      [v18 size];
      double v20 = v19;
      double v21 = [v12 objectAtIndexedSubscript:0];
      double v22 = [v21 boundingQuad];
      [v22 size];
      double v24 = v23;

      if (v20 * 0.2 > v24)
      {
        double v25 = [v12 objectAtIndexedSubscript:0];
        char v26 = v25;
        if (v7) {
          uint64_t v27 = 37;
        }
        else {
          uint64_t v27 = 52;
        }
        [v25 setTextContentType:v27];

        for (unint64_t i = 1; i < [v12 count]; ++i)
        {
          double v29 = [v12 objectAtIndexedSubscript:i];
          [v29 setTextContentType:1];
        }
        double v31 = objc_msgSend(v12, "subarrayWithRange:", 0, 1);
        goto LABEL_54;
      }
    }
  }
  id v15 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v6];
  v30 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"yMMMMd" options:1 locale:v15];
  double v31 = [v30 stringByReplacingOccurrencesOfString:@"'ngày' " withString:&stru_1F38EED68];

  if (v15)
  {
    int v32 = [v31 hasPrefix:@"d"];
    int v33 = [v31 hasPrefix:@"y"];
  }
  else
  {
    int v32 = 0;
    int v33 = 0;
  }
  [v12 count];
  if ([v12 count] == 3)
  {
    if (v33)
    {
      v34 = [v12 objectAtIndexedSubscript:0];
      unint64_t v35 = v34;
      if (v7) {
        uint64_t v36 = 40;
      }
      else {
        uint64_t v36 = 55;
      }
      [v34 setTextContentType:v36];

      v37 = [v12 objectAtIndexedSubscript:1];
      v38 = v37;
      if (v7) {
        uint64_t v39 = 39;
      }
      else {
        uint64_t v39 = 54;
      }
      [v37 setTextContentType:v39];

      v40 = [v12 objectAtIndexedSubscript:2];
      v41 = v40;
      if (v7) {
        uint64_t v42 = 38;
      }
      else {
        uint64_t v42 = 53;
      }
    }
    else if (v32)
    {
      v43 = [v12 objectAtIndexedSubscript:0];
      v44 = v43;
      if (v7) {
        uint64_t v45 = 38;
      }
      else {
        uint64_t v45 = 53;
      }
      [v43 setTextContentType:v45];

      v46 = [v12 objectAtIndexedSubscript:1];
      v47 = v46;
      if (v7) {
        uint64_t v48 = 39;
      }
      else {
        uint64_t v48 = 54;
      }
      [v46 setTextContentType:v48];

      v40 = [v12 objectAtIndexedSubscript:2];
      v41 = v40;
      if (v7) {
        uint64_t v42 = 40;
      }
      else {
        uint64_t v42 = 55;
      }
    }
    else
    {
      v49 = [v12 objectAtIndexedSubscript:0];
      v50 = v49;
      if (v7) {
        uint64_t v51 = 39;
      }
      else {
        uint64_t v51 = 54;
      }
      [v49 setTextContentType:v51];

      v52 = [v12 objectAtIndexedSubscript:1];
      v53 = v52;
      if (v7) {
        uint64_t v54 = 38;
      }
      else {
        uint64_t v54 = 53;
      }
      [v52 setTextContentType:v54];

      v40 = [v12 objectAtIndexedSubscript:2];
      v41 = v40;
      if (v7) {
        uint64_t v42 = 40;
      }
      else {
        uint64_t v42 = 55;
      }
    }
    [v40 setTextContentType:v42];
  }
  else
  {
  }
LABEL_54:
}

+ (void)_groupCreditCardNumberWithContext:(ContentTypeRefinementContext *)a3 shouldGroup:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [*(id *)(*((void *)a3->var1 + 1) + 16) textContentType];
  var1 = a3->var1;
  v9 = operator new(8uLL);
  __p = v9;
  void *v9 = v7;
  double v20 = v9 + 1;
  double v21 = v9 + 1;
  double v10 = [a1 _findSubTextFieldsInFields:var1 maxLength:4 minAspectRatio:&__p contentTypes:1 includeNone:0.2];
  if (__p)
  {
    double v20 = __p;
    operator delete(__p);
  }
  if ([v10 count] == 4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "setTextContentType:", v7, (void)v15);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }
      while (v12);
    }

    if (v4) {
    else
    }
  }
  else
  {
  }
}

+ (void)_refineCreditCardExpirationTypesWithContext:(ContentTypeRefinementContext *)a3
{
  [*(id *)(*((void *)a3->var1 + 1) + 16) textContentType];
  var1 = a3->var1;
  id v6 = operator new(0x18uLL);
  id v11 = v6 + 3;
  uint64_t v12 = (char *)(v6 + 3);
  v6[2] = 31;
  *(_OWORD *)id v6 = _ZGRZ72__CRFormContentTypeRefiner__refineCreditCardExpirationTypesWithContext__E11kCCExpTypes_;
  __p = v6;
  uint64_t v7 = [a1 _findSubTextFieldsInFields:var1 maxLength:2 minAspectRatio:&__p contentTypes:1 includeNone:0.25];
  if (__p)
  {
    id v11 = __p;
    operator delete(__p);
  }
  if ([v7 count] == 2)
  {
    v8 = [v7 objectAtIndexedSubscript:0];
    [v8 setTextContentType:30];

    v9 = [v7 objectAtIndexedSubscript:1];
    [v9 setTextContentType:31];
  }
  else
  {
  }
}

+ (void)_refineAddressTypesWithContext:(ContentTypeRefinementContext *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  var1 = a3->var1;
  [*(id *)(var1[1] + 16) textContentType];
  id v39 = *(id *)(var1[1] + 16);
  uint64_t v4 = var1[2];
  uint64_t v5 = 5;
  if (v4 < 5) {
    uint64_t v5 = var1[2];
  }
  if (v5 >= 2)
  {
    uint64_t v6 = var1[1];
    uint64_t v7 = 1;
    while (1)
    {
      uint64_t v6 = *(void *)(v6 + 8);
      id v8 = *(id *)(v6 + 16);
      if ([v8 fieldSource] != 2
        && [v8 fieldSource] != 3
        && [v8 fieldType] == 1
        && +[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:v8 updateExternalFields:1 allowOverride:1 allowAllDetectionSources:0])
      {
        v9 = [v39 boundingQuad];
        [v9 size];
        double v11 = v10;
        uint64_t v12 = [v8 boundingQuad];
        [v12 size];
        double v14 = v13 >= v11 ? v11 : v13;

        long long v15 = [v8 boundingQuad];
        [v15 topLeft];
        double v17 = v16;
        long long v18 = [v39 boundingQuad];
        [v18 bottomLeft];
        double v20 = v17 - v19;

        if (v20 <= v14 * 2.5)
        {
          unint64_t v21 = [v8 textContentType];
          if (v21 <= 0x14 && ((1 << v21) & 0x138000) != 0) {
            break;
          }
        }
      }

      ++v7;
      uint64_t v4 = var1[2];
      if (v4 >= 5) {
        uint64_t v22 = 5;
      }
      else {
        uint64_t v22 = var1[2];
      }
      if (v7 >= v22) {
        goto LABEL_19;
      }
    }
    unint64_t v35 = CROSLogForCategory(6);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", [v39 textContentType]);
      v37 = +[CRFormContentTypeUtilities stringFromContentType:13];
      *(_DWORD *)buf = 136315650;
      v41 = "+[CRFormContentTypeRefiner _refineAddressTypesWithContext:]";
      __int16 v42 = 2112;
      id v43 = v36;
      __int16 v44 = 2112;
      uint64_t v45 = v37;
      _os_log_impl(&dword_1DD733000, v35, OS_LOG_TYPE_DEBUG, "%s: Rewriting content types: %@ => %@", buf, 0x20u);
    }
    [v39 setTextContentType:13];

    uint64_t v4 = var1[2];
  }
LABEL_19:
  if (v4 >= 4) {
    uint64_t v4 = 4;
  }
  if (v4 < 2) {
    goto LABEL_41;
  }
  uint64_t v23 = var1[1];
  uint64_t v24 = 1;
  while (1)
  {
    uint64_t v23 = *(void *)(v23 + 8);
    id v25 = *(id *)(v23 + 16);
    if ([v25 fieldSource] == 1) {
      break;
    }
LABEL_35:

    ++v24;
    uint64_t v34 = var1[2];
    if (v34 >= 4) {
      uint64_t v34 = 4;
    }
    if (v24 >= v34) {
      goto LABEL_41;
    }
  }
  if ([v25 fieldType] != 1
    || !+[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:](CRFormContentTypeUtilities, "shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:", v25, 1, 1, 0)|| [v25 textContentType] != 12&& objc_msgSend(v25, "textContentType") != 13&& objc_msgSend(v25, "textContentType") != 14)
  {
    goto LABEL_40;
  }
  id v26 = v25;
  uint64_t v27 = [v26 labelRegion];
  BOOL v28 = v27 == 0;

  if (v28)
  {
    if (+[CRFormUtilities isRegion:v39 verticallyAlignedWithRegionBelow:v26 maxRelativeDistance:(double)v24 * 3.0])
    {
      [v39 setTextContentType:13];
      [v26 setTextContentType:14];
      double v29 = CROSLogForCategory(6);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", [v39 textContentType]);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        double v31 = [v26 textContentTypeString];
        id v32 = +[CRFormContentTypeUtilities stringFromContentType:13];
        int v33 = +[CRFormContentTypeUtilities stringFromContentType:14];
        *(_DWORD *)buf = 136316162;
        v41 = "+[CRFormContentTypeRefiner _refineAddressTypesWithContext:]";
        __int16 v42 = 2112;
        id v43 = v30;
        __int16 v44 = 2112;
        uint64_t v45 = v31;
        __int16 v46 = 2112;
        id v47 = v32;
        __int16 v48 = 2112;
        v49 = v33;
        _os_log_impl(&dword_1DD733000, v29, OS_LOG_TYPE_DEBUG, "%s: Rewriting content types: %@ %@ => %@ %@", buf, 0x34u);
      }
    }

    goto LABEL_35;
  }

LABEL_40:
LABEL_41:
}

+ (id)groupAndAssignStructuralContentTypesForFields:(id)a3 locale:(id)a4 updateExternalFields:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (qword_1EB58CC48 != -1) {
    dispatch_once(&qword_1EB58CC48, &__block_literal_global_25);
  }
  uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count", v8));
  double v29 = &v29;
  id v30 = (uint64_t *)&v29;
  uint64_t v31 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        double v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v15 = operator new(0x18uLL);
        id v16 = v14;
        v15[1] = &v29;
        v15[2] = v16;
        uint64_t v17 = (uint64_t)v29;
        *long long v15 = v29;
        *(void *)(v17 + 8) = v15;
        double v29 = v15;
        ++v31;
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v11);
  }

  id v18 = v23;
  v24[0] = v18;
  v24[1] = &v29;
  double v19 = v18;
  if (v31)
  {
    do
    {
      id v20 = (id)v30[2];
      if (+[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:v20 updateExternalFields:v5 allowOverride:1 allowAllDetectionSources:0])
      {
        uint64_t v21 = [v20 textContentType];
        switch(v21)
        {
          case 28:
            if ([v20 fieldSource] != 1) {
              goto LABEL_14;
            }
            [a1 _groupCreditCardNumberWithContext:v24 shouldGroup:_MergedGlobals_25];
            break;
          case 29:
          case 30:
          case 31:
            [a1 _refineCreditCardExpirationTypesWithContext:v24];
            break;
          case 32:
          case 33:
          case 34:
          case 35:
          case 36:
          case 41:
          case 43:
          case 44:
          case 46:
          case 47:
          case 48:
          case 49:
          case 50:
          case 51:
            goto LABEL_14;
          case 37:
          case 38:
          case 39:
          case 40:
          case 52:
          case 53:
          case 54:
          case 55:
            [a1 _refineDateAndBirthdayTypesWithContext:v24 locale:v9];
            break;
          case 42:
          case 45:
            [a1 _groupOrRefinePhoneNumberWithContext:v24 shouldGroup:_MergedGlobals_25];
            break;
          default:
            if (v21 != 12) {
              goto LABEL_14;
            }
            [a1 _refineAddressTypesWithContext:v24];
            break;
        }
      }
      else
      {
LABEL_14:
      }
    }
    while (v31);
    double v19 = (void *)v24[0];
  }

  std::__list_imp<objc_object  {objcproto20CRFormFieldProviding}* {__strong}>::clear((uint64_t *)&v29);
  return v18;
}

void __102__CRFormContentTypeRefiner_groupAndAssignStructuralContentTypesForFields_locale_updateExternalFields___block_invoke()
{
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  v0 = [v2 environment];
  v1 = [v0 objectForKey:@"CR_FORM_DISABLE_FIELD_GROUPS"];
  _MergedGlobals_25 = [v1 BOOLValue] ^ 1;
}

@end