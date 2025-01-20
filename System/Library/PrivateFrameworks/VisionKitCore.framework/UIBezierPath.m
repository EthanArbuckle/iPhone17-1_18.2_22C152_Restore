@interface UIBezierPath
@end

@implementation UIBezierPath

__n128 __50__UIBezierPath_Utilities__vk_lengthIgnoringCurves__block_invoke(void *a1, int *a2)
{
  int v3 = *a2;
  *(_OWORD *)(*(void *)(a1[4] + 8) + 48) = VKMPointInfinity;
  if ((v3 - 2) >= 2)
  {
    if (v3 != 1)
    {
      if (v3) {
        goto LABEL_7;
      }
      *(_OWORD *)(*(void *)(a1[5] + 8) + 48) = VKMPointInfinity;
    }
    *(_OWORD *)(*(void *)(a1[4] + 8) + 48) = *(_OWORD *)*((void *)a2 + 1);
  }
  *(_OWORD *)(*(void *)(a1[4] + 8) + 48) = *(_OWORD *)*((void *)a2 + 1);
LABEL_7:
  uint64_t v4 = *(void *)(a1[5] + 8);
  double v5 = *(double *)(v4 + 48);
  double v6 = *(double *)(v4 + 56);
  uint64_t v7 = *(void *)(a1[4] + 8);
  double v8 = *(double *)(v7 + 48);
  double v9 = *(double *)(v7 + 56);
  BOOL v10 = v9 == INFINITY && v8 == INFINITY;
  BOOL v11 = v6 == INFINITY && v5 == INFINITY;
  if (!v11 && !v10) {
    *(double *)(*(void *)(a1[6] + 8) + 24) = VKMDistance(v5, v6, v8, v9)
  }
                                                 + *(double *)(*(void *)(a1[6] + 8) + 24);
  if (v10) {
    v12 = (__n128 *)&VKMPointInfinity;
  }
  else {
    v12 = (__n128 *)(*(void *)(a1[4] + 8) + 48);
  }
  __n128 result = *v12;
  *(__n128 *)(*(void *)(a1[5] + 8) + 48) = *v12;
  return result;
}

void __50__UIBezierPath_Utilities__vk_allPointsFromCGPath___block_invoke(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0:
    case 1:
      int v3 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E4F29238], "vk_valueWithPoint:", **(double **)(a2 + 8), *(double *)(*(void *)(a2 + 8) + 8));
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:");
      goto LABEL_4;
    case 2:
    case 3:
      v2 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E4F29238], "vk_valueWithPoint:", *(double *)(*(void *)(a2 + 8) + 32), *(double *)(*(void *)(a2 + 8) + 40));
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:");
LABEL_4:

      break;
    default:
      return;
  }
}

uint64_t __53__UIBezierPath_Utilities__vk_pathFromFlippingInRect___block_invoke(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = result;
  switch(*a2)
  {
    case 0:
      int v3 = *(void **)(result + 32);
      VKMFlipPoint();
      __n128 result = objc_msgSend(v3, "moveToPoint:");
      break;
    case 1:
      goto LABEL_6;
    case 2:
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[UIBezierPath(Utilities) vk_pathFromFlippingInRect:]_block_invoke", 0, 0, @"kCGPathElementAddQuadCurveToPoint not supported.");
LABEL_6:
      id v4 = *(void **)(v2 + 32);
      VKMFlipPoint();
      __n128 result = objc_msgSend(v4, "vk_addLineToPoint:");
      break;
    case 3:
      double v5 = *(void **)(result + 32);
      VKMFlipPoint();
      double v7 = v6;
      double v9 = v8;
      VKMFlipPoint();
      __n128 result = objc_msgSend(v5, "vk_addCurveToPoint:controlPoint1:controlPoint2:", v7, v9);
      break;
    case 4:
      BOOL v10 = *(void **)(result + 32);
      __n128 result = [v10 closePath];
      break;
    default:
      return result;
  }
  return result;
}

void __53__UIBezierPath_Utilities__vk_subpathArrayFromCGPath___block_invoke(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0:
      id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      double v5 = *(double **)(a2 + 8);
      double v6 = *v5;
      double v7 = v5[1];
      objc_msgSend(v4, "moveToPoint:", v6, v7);
      break;
    case 1:
      goto LABEL_6;
    case 2:
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[UIBezierPath(Utilities) vk_subpathArrayFromCGPath:]_block_invoke", 0, 0, @"kCGPathElementAddQuadCurveToPoint not supported.");
LABEL_6:
      double v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      double v9 = *(double **)(a2 + 8);
      double v10 = *v9;
      double v11 = v9[1];
      objc_msgSend(v8, "vk_addLineToPoint:", v10, v11);
      break;
    case 3:
      v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      v13 = *(double **)(a2 + 8);
      double v14 = v13[4];
      double v15 = v13[5];
      double v16 = *v13;
      double v17 = v13[1];
      double v18 = v13[2];
      double v19 = v13[3];
      objc_msgSend(v12, "vk_addCurveToPoint:controlPoint1:controlPoint2:", v14, v15, v16, v17, v18, v19);
      break;
    case 4:
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) closePath];
      [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      id v20 = objc_alloc_init(MEMORY[0x1E4F427D0]);
      uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      break;
    default:
      return;
  }
}

uint64_t __63__UIBezierPath_Utilities__vk_groupAndRoundPaths_radius_offset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "vk_cgPathcontainsAnyCurveToPoints:", objc_msgSend(v3, "vk_CGPath"));

  return v4;
}

void __63__UIBezierPath_Utilities__vk_groupAndRoundPaths_radius_offset___block_invoke_19(uint64_t a1, void *a2)
{
}

void __63__UIBezierPath_Utilities__vk_groupAndRoundPaths_radius_offset___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 40), "vk_allPointsFromCGPath:", objc_msgSend(v10, "vk_CGPath"));
  uint64_t v4 = [v3 lastObject];
  double v5 = [v3 firstObject];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    [v3 removeLastObject];
  }
  double v7 = (const CGPath *)objc_msgSend(*(id *)(a1 + 40), "vk_newRoundedPathWithRadius:points:", v3, *(double *)(a1 + 48));
  double v8 = *(void **)(a1 + 32);
  double v9 = objc_msgSend(MEMORY[0x1E4F427D0], "vk_pathFromCGPath:", v7);
  objc_msgSend(v8, "vk_appendBezierPath:", v9);

  CGPathRelease(v7);
}

uint64_t __61__UIBezierPath_Utilities__vk_cgPathcontainsAnyCurveToPoints___block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 & 0xFFFFFFFE) == 2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void __64__UIBezierPath_Utilities___processPointsForRounding_withRadius___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v18 = v6;
  if (!a3)
  {
    uint64_t v11 = a1 + 32;
    goto LABEL_7;
  }
  objc_msgSend(v6, "vk_pointValue");
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = a1 + 32;
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "vk_pointValue");
  if (!VKMNearlyEqualPointsWithThreshold(v8, v10, v12, v13, *(double *)(a1 + 48)))
  {
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)v11 + 8) + 40), a2);
    goto LABEL_8;
  }
  double v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    double v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    double v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  [v14 addIndex:a3];
LABEL_8:
}

void __121__UIBezierPath_Utilities__vk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "quadMultipliedBySize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");
}

void __121__UIBezierPath_Utilities__vk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 sideLength];
  id v3 = [v2 path];
  VKMClipperPathsFromCGPath(v3, 1.0);
}

void __121__UIBezierPath_Utilities__vk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 48), "vk_allPointsFromCGPath:", objc_msgSend(v11, "vk_CGPath"));
  uint64_t v4 = [v3 lastObject];
  double v5 = [v3 firstObject];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    [v3 removeLastObject];
  }
  double v7 = [*(id *)(a1 + 32) objectForKey:v11];
  [*(id *)(a1 + 48) radiusForQuads:v7 radiusRatio:*(double *)(a1 + 56)];
  double v8 = (const CGPath *)objc_msgSend(*(id *)(a1 + 48), "vk_newRoundedPathWithRadius:points:", v3);
  double v9 = *(void **)(a1 + 40);
  double v10 = objc_msgSend(MEMORY[0x1E4F427D0], "vk_pathFromCGPath:", v8);
  objc_msgSend(v9, "vk_appendBezierPath:", v10);

  CGPathRelease(v8);
}

void __44__UIBezierPath_Utilities__mapPaths_toQuads___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "copy", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v8 vertexCentroid];
        if (objc_msgSend(v3, "containsPoint:"))
        {
          id v9 = [*(id *)(a1 + 40) objectForKey:v3];
          if (!v9)
          {
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:");
          }
          [v9 addObject:v8];
          [*(id *)(a1 + 32) removeObject:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

@end