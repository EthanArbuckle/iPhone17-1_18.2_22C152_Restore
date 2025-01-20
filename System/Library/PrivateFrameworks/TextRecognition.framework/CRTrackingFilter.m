@interface CRTrackingFilter
+ (BOOL)shouldEdgeIntersectionFilterQuad:(id)a3 originalQuad:(id)a4 imageSize:(CGSize)a5;
+ (BOOL)shouldFilterHomographyWithResultQuad:(id)a3 originalQuad:(id)a4 imageSize:(CGSize)a5;
+ (BOOL)shouldStartTrackingGroup:(id)a3;
+ (BOOL)shouldStartTrackingRegion:(id)a3;
+ (void)filterLowQualityTranscriptRegions:(id)a3;
@end

@implementation CRTrackingFilter

+ (BOOL)shouldStartTrackingRegion:(id)a3
{
  [a3 activationProbability];
  return v3 >= 0.300000012;
}

+ (BOOL)shouldStartTrackingGroup:(id)a3
{
  id v3 = a3;
  v4 = [v3 averageLineHeight];
  if (v4)
  {
    v5 = [v3 averageLineHeight];
    [v5 doubleValue];
    BOOL v7 = v6 >= 5.0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

+ (void)filterLowQualityTranscriptRegions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (qword_1EB58CBF8 != -1) {
    dispatch_once(&qword_1EB58CBF8, &__block_literal_global_20);
  }
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "text", (void)v15);
        uint64_t v12 = [v11 length];

        if (v12 != 1)
        {
          v13 = [v10 text];
          uint64_t v14 = [v13 rangeOfCharacterFromSet:_MergedGlobals_21 options:2];

          if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
            continue;
          }
        }
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v5 removeObjectsInArray:v4];
}

void __54__CRTrackingFilter_filterLowQualityTranscriptRegions___block_invoke()
{
  id v5 = [MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@"º"];
  v0 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v5 formUnionWithCharacterSet:v0];

  v1 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  [v5 formUnionWithCharacterSet:v1];

  v2 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  [v5 formUnionWithCharacterSet:v2];

  uint64_t v3 = [v5 invertedSet];
  v4 = (void *)_MergedGlobals_21;
  _MergedGlobals_21 = v3;
}

+ (BOOL)shouldFilterHomographyWithResultQuad:(id)a3 originalQuad:(id)a4 imageSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a3;
  [v8 squaredDistanceFromCorrespondingCornersOfQuad:a4];
  if (v9 > 40000.0
    || ([v8 hasIntersectingEdges] & 1) != 0
    || ([v8 boundingBox], v10 > width * 1.20000005)
    || ([v8 boundingBox], v11 > height * 1.20000005))
  {
    BOOL v12 = 1;
  }
  else
  {
    uint64_t v14 = [v8 cornerAngles];
    long long v15 = [v14 sortedArrayUsingSelector:sel_compare_];
    long long v16 = [v15 objectAtIndexedSubscript:0];
    [v16 doubleValue];
    double v18 = v17;
    v19 = [v15 objectAtIndexedSubscript:1];
    [v19 doubleValue];
    double v21 = v18 / v20;

    BOOL v12 = v21 < 0.600000024;
  }

  return v12;
}

+ (BOOL)shouldEdgeIntersectionFilterQuad:(id)a3 originalQuad:(id)a4 imageSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a3;
  double v9 = fmin(width, height);
  BOOL v10 = objc_msgSend(a4, "intersectsImageMargin:imageSize:", v9 * 0.0399999991, width, height)
     && !objc_msgSend(v8, "intersectsImageMargin:imageSize:", v9 * 0.119999997, width, height);

  return v10;
}

@end