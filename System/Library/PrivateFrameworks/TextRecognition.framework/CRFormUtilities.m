@interface CRFormUtilities
+ (BOOL)isRegion:(id)a3 verticallyAlignedWithRegionBelow:(id)a4 maxRelativeDistance:(double)a5;
+ (BOOL)stringEndsWithColon:(id)a3;
+ (id)_filterFieldsToNotSurface:(id)a3;
+ (id)debugDescriptionForField:(id)a3;
+ (id)detectedFieldRegionsInDocument:(id)a3 excludingFields:(id)a4 updateExcludedFields:(BOOL)a5;
+ (id)proposedFieldForPoint:(CGPoint)a3 inDocument:(id)a4 existingFields:(id)a5;
@end

@implementation CRFormUtilities

+ (id)_filterFieldsToNotSurface:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__CRFormUtilities__filterFieldsToNotSurface___block_invoke;
  v7[3] = &unk_1E6CDABD0;
  id v5 = v4;
  id v8 = v5;
  +[CRFormPostProcessingManager enumerateDetectedFields:v3 block:v7];

  return v5;
}

void __45__CRFormUtilities__filterFieldsToNotSurface___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CRCastAsClass<CRFormFieldOutputRegion>(v3);
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    id v5 = CROSLogForCategory(6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [v3 description];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1DD733000, v5, OS_LOG_TYPE_ERROR, "Unexpected type for CRFormFieldProviding item, expected CRFormFieldOutputRegion, got %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (id)detectedFieldRegionsInDocument:(id)a3 excludingFields:(id)a4 updateExcludedFields:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (qword_1EB58CE98 != -1) {
    dispatch_once(&qword_1EB58CE98, &__block_literal_global_39);
  }
  v10 = CROSLogForCategory(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = [v8 formFieldRegions];
    *(_DWORD *)buf = 136315906;
    v26 = "+[CRFormUtilities detectedFieldRegionsInDocument:excludingFields:updateExcludedFields:]";
    __int16 v27 = 2048;
    uint64_t v28 = [v11 count];
    __int16 v29 = 2048;
    uint64_t v30 = [v9 count];
    __int16 v31 = 1024;
    BOOL v32 = v5;
    _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_DEBUG, "%s: #internalFields:%lu #externalFields:%lu updateExcludedFields:%d", buf, 0x26u);
  }
  if (_MergedGlobals_37
    || v9 && [v9 count]
    || ([v8 formFieldRegions],
        v20 = objc_claimAutoreleasedReturnValue(),
        BOOL v21 = [v20 count] == 0,
        v20,
        v21))
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", v5, @"ShouldUpdateExternalFieldsOption");
    v24 = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];

    v14 = [MEMORY[0x1E4F1CA48] arrayWithArray:v9];
    v15 = [v8 formFieldRegions];
    [v14 addObjectsFromArray:v15];

    v16 = +[CRFormPostProcessingManager postProcessingManagerWithDefaultSequence];
    v17 = [v16 process:v14 externalFields:v9 document:v8 options:v13];
    v18 = [a1 _filterFieldsToNotSurface:v17];
  }
  else
  {
    v22 = CROSLogForCategory(6);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "+[CRFormUtilities detectedFieldRegionsInDocument:excludingFields:updateExcludedFields:]";
      _os_log_impl(&dword_1DD733000, v22, OS_LOG_TYPE_DEFAULT, "%s: Returning cached results as no external field is given.", buf, 0xCu);
    }

    v13 = [v8 formFieldRegions];
    v18 = [a1 _filterFieldsToNotSurface:v13];
  }

  return v18;
}

void __87__CRFormUtilities_detectedFieldRegionsInDocument_excludingFields_updateExcludedFields___block_invoke()
{
  id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v0 = [v1 objectForKey:@"com.apple.CoreRecognition.disable_form_cache"];
  _MergedGlobals_37 = [v0 BOOLValue];
}

+ (id)proposedFieldForPoint:(CGPoint)a3 inDocument:(id)a4 existingFields:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = CROSLogForCategory(6);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "+[CRFormUtilities proposedFieldForPoint:inDocument:existingFields:]";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = x;
    *(_WORD *)&buf[22] = 2048;
    v55 = *(uint64_t (**)(uint64_t, uint64_t))&y;
    LOWORD(v56) = 2048;
    *(void *)((char *)&v56 + 2) = [v9 count];
    _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_DEBUG, "%s: x:%lf y:%lf #existingFields:%lu", buf, 0x2Au);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v55 = __Block_byref_object_copy__22;
  *(void *)&long long v56 = __Block_byref_object_dispose__22;
  *((void *)&v56 + 1) = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__22;
  v46 = __Block_byref_object_dispose__22;
  id v47 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0x7FEFFFFFFFFFFFFFLL;
  v11 = [v8 formFieldRegions];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __67__CRFormUtilities_proposedFieldForPoint_inDocument_existingFields___block_invoke_2;
  v40[3] = &unk_1E6CDC6C8;
  *(double *)&v40[8] = x;
  *(double *)&v40[9] = y;
  v40[4] = v48;
  v40[5] = buf;
  v40[6] = v41;
  v40[7] = &v42;
  +[CRFormPostProcessingManager enumerateFieldsInFields:v11 filter:&__block_literal_global_18_0 block:v40];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v12 = CROSLogForCategory(6);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [*(id *)(*(void *)&buf[8] + 40) description];
      v14 = +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", [*(id *)(*(void *)&buf[8] + 40) textContentType]);
      *(_DWORD *)v50 = 138412546;
      id v51 = v13;
      __int16 v52 = 2112;
      v53 = v14;
      _os_log_impl(&dword_1DD733000, v12, OS_LOG_TYPE_DEBUG, "Smart field proposal from a contour or text based detection: %@, content type: %@", v50, 0x16u);
    }
  }
  else
  {
    v15 = (void *)v43[5];
    if (v15)
    {
      v16 = [v15 boundingQuad];
      v17 = [v16 denormalizedQuad];
      [v17 size];
      double v19 = v18;
    }
    else
    {
      double v19 = 30.0;
    }
    [v8 rectifiedSize];
    double v22 = normalizedSizeForSize(150.0, v19, v20, v21);
    double v24 = v23;
    v25 = [CRNormalizedQuad alloc];
    [v8 rectifiedSize];
    v12 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:](v25, "initWithNormalizedBoundingBox:size:", x, y - v24, v22, v24, v26, v27);
    uint64_t v28 = [[CRFormTextFieldOutputRegion alloc] initWithQuad:v12 labelRegion:0 subFields:0 contentType:0 source:1];
    __int16 v29 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v28;

    uint64_t v30 = +[CRFormPostProcessingManager postProcessingManagerWithDefaultSequence];
    uint64_t v49 = *(void *)(*(void *)&buf[8] + 40);
    __int16 v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    BOOL v32 = [v30 process:v31 externalFields:MEMORY[0x1E4F1CBF0] document:v8 options:0];

    uint64_t v33 = [v32 objectAtIndexedSubscript:0];
    v34 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v33;

    v35 = CROSLogForCategory(6);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      id v36 = [*(id *)(*(void *)&buf[8] + 40) description];
      v37 = +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", [*(id *)(*(void *)&buf[8] + 40) textContentType]);
      *(_DWORD *)v50 = 138412547;
      id v51 = v36;
      __int16 v52 = 2113;
      v53 = v37;
      _os_log_impl(&dword_1DD733000, v35, OS_LOG_TYPE_DEBUG, "Smart field proposal from a back off field at tap location: %@, content type: %{private}@", v50, 0x16u);
    }
  }

  id v38 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(buf, 8);

  return v38;
}

BOOL __67__CRFormUtilities_proposedFieldForPoint_inDocument_existingFields___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 fieldSource] == 1
    || [v2 fieldSource] == 2
    || [v2 fieldSource] == 3;

  return v3;
}

void __67__CRFormUtilities_proposedFieldForPoint_inDocument_existingFields___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v21 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = [v21 fieldSource] == 2 || objc_msgSend(v21, "fieldSource") == 3;
    uint64_t v7 = [v21 fieldSource];
    if (v6)
    {
      id v8 = [v21 boundingQuad];
      objc_msgSend(v8, "shortestDistanceFromNormalizedPoint:", *(double *)(a1 + 64), *(double *)(a1 + 72));
      double v10 = v9;

      v11 = [v21 boundingQuad];
      [v11 normalizationSize];
      double v13 = v12;
      v14 = [v21 boundingQuad];
      [v14 normalizationSize];
      double v16 = v10 / fmin(v13, v15);

      if (v16 <= fmin(*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 0.01))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v16;
        if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0.0) {
          *a3 = 1;
        }
      }
    }
    else if (v7 == 1 && [v21 fieldType] == 1)
    {
      v17 = [v21 boundingQuad];
      objc_msgSend(v17, "shortestDistanceFromNormalizedPoint:", *(double *)(a1 + 64), *(double *)(a1 + 72));
      double v19 = v18;

      uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
      if (v19 < *(double *)(v20 + 24))
      {
        *(double *)(v20 + 24) = v19;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
      }
    }
  }
}

+ (BOOL)stringEndsWithColon:(id)a3
{
  id v3 = a3;
  if (qword_1EB58CEA8 != -1) {
    dispatch_once(&qword_1EB58CEA8, &__block_literal_global_25_0);
  }
  v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  BOOL v5 = [v3 stringByTrimmingCharactersInSet:v4];
  BOOL v6 = [v5 stringByFoldingWithOptions:256 locale:0];
  char v7 = [v6 hasSuffix:qword_1EB58CEA0];

  return v7;
}

void __39__CRFormUtilities_stringEndsWithColon___block_invoke()
{
  uint64_t v0 = [@":" stringByFoldingWithOptions:256 locale:0];
  id v1 = (void *)qword_1EB58CEA0;
  qword_1EB58CEA0 = v0;
}

+ (BOOL)isRegion:(id)a3 verticallyAlignedWithRegionBelow:(id)a4 maxRelativeDistance:(double)a5
{
  id v7 = a4;
  id v8 = [a3 boundingQuad];
  double v9 = [v7 boundingQuad];
  [v8 topRight];
  double v11 = v10;
  [v9 topRight];
  double v13 = v12;
  [v8 topLeft];
  double v15 = v14;
  [v9 topLeft];
  double v17 = v16;
  [v9 size];
  if (fmax(fmin(v11, v13) - fmax(v15, v17), 0.0) / v18 > 0.5
    && ([v9 topLeft], double v20 = v19, objc_msgSend(v8, "bottomLeft"), v20 >= v21 + -2.22044605e-16))
  {
    [v9 topLeft];
    double v24 = v23;
    [v8 bottomLeft];
    double v26 = v25;
    [v8 size];
    double v28 = v27;
    [v9 size];
    BOOL v22 = v24 - v26 <= (v28 + v29) * 0.5 * a5;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

+ (id)debugDescriptionForField:(id)a3
{
  id v3 = a3;
  if ([v3 fieldType] == 1)
  {
    +[CRFormContentTypeUtilities shortStringFromContentType:](CRFormContentTypeUtilities, "shortStringFromContentType:", [v3 textContentType]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v3 suggestedLineHeight];
    uint64_t v6 = v5;
    uint64_t v7 = [v3 maxCharacterCount];
  }
  else
  {
    uint64_t v7 = 0;
    v4 = &stru_1F38EED68;
    uint64_t v6 = 0;
  }
  uint64_t v30 = v4;
  id v8 = CRCastAsClass<CRFormFieldOutputRegion>(v3);
  double v29 = v8;
  if (v8)
  {
    double v9 = v8;
    uint64_t v10 = [v8 indexInGlobalOrder];
    double v11 = [v9 labelRegion];
    double v12 = [v11 text];
    uint64_t v13 = [v12 length];
    uint64_t v14 = v7;
  }
  else
  {
    uint64_t v14 = v7;
    uint64_t v13 = 0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  double v15 = NSString;
  double v16 = [v3 boundingQuad];
  [v16 topLeft];
  uint64_t v18 = v17;
  double v19 = [v3 boundingQuad];
  [v19 topLeft];
  uint64_t v21 = v20;
  BOOL v22 = [v3 boundingQuad];
  [v22 size];
  uint64_t v24 = v23;
  double v25 = [v3 boundingQuad];
  [v25 size];
  double v27 = [v15 stringWithFormat:@"x:%5.3f y:%5.3f w:%5.3f h:%5.3f type:%lu source:%lu contentType:%@ labelLength:%lu globalOrder:%ld lineHeight:%5.3f charCount:%lu.", v18, v21, v24, v26, objc_msgSend(v3, "fieldType"), objc_msgSend(v3, "fieldSource"), v30, v13, v10, v6, v14];

  return v27;
}

@end