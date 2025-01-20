@interface PHAsset(PXLayoutItemInputAdoption)
- (__n128)transform;
- (double)positionOffset;
- (double)size;
- (float)px_playbackScore;
- (long)weightUsingCriterion:()PXLayoutItemInputAdoption;
- (uint64_t)weight;
- (uint64_t)weightUsingWeightingScheme:()PXLayoutItemInputAdoption;
@end

@implementation PHAsset(PXLayoutItemInputAdoption)

- (double)positionOffset
{
  return *MEMORY[0x1E4F1DAD8];
}

- (__n128)transform
{
  v1 = (__n128 *)MEMORY[0x1E4F1DAB8];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = v1[2];
  *(__n128 *)(a1 + 32) = result;
  return result;
}

- (float)px_playbackScore
{
  v1 = [a1 mediaAnalysisProperties];
  [v1 autoplaySuggestionScore];
  float v3 = v2;

  return v3;
}

- (uint64_t)weightUsingWeightingScheme:()PXLayoutItemInputAdoption
{
  float v3 = (void *)result;
  if (a3)
  {
    switch(a3)
    {
      case 1:
        __n128 result = objc_msgSend((id)result, "curationScore", 1.0);
        break;
      case 2:
        objc_msgSend((id)result, "curationScore", 1.0);
        float v6 = v5;
        __n128 result = objc_msgSend(v3, "px_playbackScore");
        if (v6 < 0.5 || v7 <= 0.5)
        {
          if (v6 >= 0.5) {
            PXFloatApproximatelyEqualToFloat();
          }
        }
        else
        {
          __n128 result = [v3 playbackStyle];
        }
        break;
      case 5:
        __n128 result = objc_msgSend((id)result, "isFavorite", 1.0);
        break;
      case 6:
        v9 = objc_msgSend((id)result, "creationDate", 1.0);
        [v9 timeIntervalSinceReferenceDate];
        srand(v10);

        __n128 result = rand();
        break;
      case 7:
        v11 = objc_msgSend((id)result, "creationDate", 1.0);
        [v11 timeIntervalSinceReferenceDate];
        srand(v12);

        __n128 result = rand();
        break;
      default:
        return result;
    }
  }
  else
  {
    __n128 result = [(id)result highlightVisibilityScore];
    if (fabs(v4) < 2.22044605e-16) {
      return [v3 overallAestheticScore];
    }
  }
  return result;
}

- (long)weightUsingCriterion:()PXLayoutItemInputAdoption
{
  if (a3 >= 2)
  {
    long double result = 0.0;
    if (a3 == 2)
    {
      objc_msgSend(a1, "highlightVisibilityScore", 0.0, v3, v4);
      long double v7 = fmod(v6 * 131.0, 100.0);
      return fmod(v7, 20.0) / 10.0;
    }
  }
  else
  {
    [a1 weight];
  }
  return result;
}

- (uint64_t)weight
{
  float v2 = +[PXGridSettings sharedInstance];
  uint64_t v3 = [v2 weightingScheme];

  return [a1 weightUsingWeightingScheme:v3];
}

- (double)size
{
  double v2 = (double)(unint64_t)[a1 pixelWidth];
  [a1 pixelHeight];
  return v2;
}

@end