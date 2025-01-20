@interface UIKBRTFingerDetection
@end

@implementation UIKBRTFingerDetection

void __54___UIKBRTFingerDetection_touchIdentifiersForFingerId___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  if ([a3 identity] == *(void *)(a1 + 40))
  {
    uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

void __54___UIKBRTFingerDetection_touchIdentifiersForFingerId___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 identity] == *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __51___UIKBRTFingerDetection_touchLocationForFingerId___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([v7 identity] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

BOOL __93___UIKBRTFingerDetection_fingerIdsRelatedToTouchWithIdentifier_sinceTimestamp_includeThumbs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 identity] == *(void *)(a1 + 40))
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "identity"));
    if ([v5 containsObject:v6])
    {
      [v3 lastSeenTimestamp];
      BOOL v4 = v7 > *(double *)(a1 + 48);
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

uint64_t __102___UIKBRTFingerDetection__linkTouchesInArray_withIndexes_opposingHandIndexes_unassignedIndexes_thumb___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 location];
  if (a3) {
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = vabdd_f64(v6, *(double *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24))+ *(double *)(*(void *)(*(void *)(a1 + 32) + 8)+ 24);
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  return result;
}

void __99___UIKBRTFingerDetection__updateTouchInfoFromOutsideInWithArray_indexes_newIdentityDict_fakeIndex___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) indexOfObject:v13];
    uint64_t v8 = *(void **)(a1 + 48);
    v9 = NSNumber;
    id v10 = [*(id *)(a1 + 32) objectAtIndex:a3];
    v11 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "intValue"));
    v12 = [v8 objectForKey:v11];
    [v12 addIndex:v7];

    [*(id *)(a1 + 56) removeIndex:v7];
  }
}

uint64_t __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 location];
  double v7 = v6;
  [v5 location];
  double v9 = v7 - v8;
  if (v9 < 0.0)
  {
LABEL_5:
    uint64_t v10 = -1;
    goto LABEL_6;
  }
  if (v9 <= 0.0)
  {
    [v5 location];
    double v12 = v11;
    [v4 location];
    if (v12 - v13 >= 0.0)
    {
      uint64_t v10 = v12 - v13 > 0.0;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v10 = 1;
LABEL_6:

  return v10;
}

double __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 location];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

double __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 location];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = (v3 - *(double *)(a1 + 40)) * (v3 - *(double *)(a1 + 40)) + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

BOOL __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_4(uint64_t a1, void *a2)
{
  [a2 location];
  return v3 >= *(double *)(a1 + 32);
}

BOOL __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_5(uint64_t a1, void *a2)
{
  [a2 location];
  double v4 = v3 - *(double *)(a1 + 32);
  return v4 > 0.0 && v4 * v4 > *(double *)(a1 + 40) * 3.0;
}

void __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_6(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 < a2 + a3)
  {
    uint64_t v17 = v6;
    uint64_t v18 = v5;
    uint64_t v19 = v4;
    uint64_t v20 = v3;
    uint64_t v21 = v7;
    uint64_t v22 = v8;
    uint64_t v9 = a3;
    uint64_t v10 = a2;
    do
    {
      double v12 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v10, v17, v18, v19, v20, v21, v22);
      [v12 location];
      double v14 = vabdd_f64(v13, *(double *)(a1 + 72));
      double v15 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      if (v14 >= v15)
      {
        if (v14 < *(double *)(v16 + 24))
        {
          *(double *)(v16 + 24) = v14;
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
        }
      }
      else
      {
        *(double *)(v16 + 24) = v15;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24);
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10;
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v14;
      }

      ++v10;
      --v9;
    }
    while (v9);
  }
}

BOOL __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == a2
      || *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == a2;
}

void __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  objc_msgSend(v5, "setIdentity:", (int)objc_msgSend(v6, "intValue"));
}

void *__54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 location];
  double v6 = v5;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7 && ([v7 location], v6 < v8))
  {
    uint64_t v9 = (void **)(a1 + 40);
  }
  else
  {
    double result = *(void **)(a1 + 48);
    if (!result) {
      return result;
    }
    double result = (void *)[result location];
    if (v6 <= v11) {
      return result;
    }
    uint64_t v9 = (void **)(a1 + 56);
  }
  double v12 = *v9;
  return (void *)[v12 addIndex:a3];
}

uint64_t __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 location];
  if (v6 >= *(double *)(a1 + 48))
  {
    if (v6 <= *(double *)(a1 + 56)) {
      return result;
    }
    uint64_t v7 = (void **)(a1 + 40);
  }
  else
  {
    uint64_t v7 = (void **)(a1 + 32);
  }
  double v8 = *v7;
  return [v8 addIndex:a3];
}

void __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = (int)[v5 intValue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_12;
    v8[3] = &unk_1E52FE520;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = v7;
    [v6 enumerateRangesUsingBlock:v8];
  }
}

void __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_12(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 < a2 + a3)
  {
    uint64_t v16 = v8;
    uint64_t v17 = v7;
    uint64_t v18 = v6;
    uint64_t v19 = v5;
    uint64_t v20 = v4;
    uint64_t v21 = v3;
    uint64_t v22 = v9;
    uint64_t v23 = v10;
    uint64_t v11 = a3;
    uint64_t v12 = a2;
    do
    {
      uint64_t v14 = *(void *)(a1 + 40);
      double v15 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v12, v16, v17, v18, v19, v20, v21, v22, v23);
      [v15 setIdentity:v14];

      ++v12;
      --v11;
    }
    while (v11);
  }
}

BOOL __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_13(uint64_t a1, void *a2)
{
  [a2 location];
  double v4 = v3;
  [*(id *)(a1 + 32) location];
  return v4 > v5;
}

BOOL __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_14(uint64_t a1, void *a2)
{
  [a2 location];
  double v4 = v3;
  [*(id *)(a1 + 32) location];
  return v4 < v5;
}

@end