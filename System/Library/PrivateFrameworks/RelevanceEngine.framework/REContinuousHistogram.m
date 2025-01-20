@interface REContinuousHistogram
@end

@implementation REContinuousHistogram

void __39___REContinuousHistogram_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(*(void *)(a1 + 32) + 24);
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [v4 setObject:v6 forKey:v5];
}

void __30___REContinuousHistogram_mean__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  if (REFeatureValueTypeForTaggedPointer((unint64_t)a2) == 1)
  {
    uint64_t v7 = REIntegerValueForTaggedPointer((unint64_t)a2);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    double v9 = *(double *)(v8 + 24) + (double)(v7 * a3);
  }
  else
  {
    double v10 = REDoubleValueForTaggedPointer(a2, v6);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    double v9 = *(double *)(v8 + 24) + v10 * (double)a3;
  }
  *(double *)(v8 + 24) = v9;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a3;
}

double __43___REContinuousHistogram_standardDeviation__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  if (REFeatureValueTypeForTaggedPointer((unint64_t)a2) == 1) {
    double v7 = (double)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)a2);
  }
  else {
    double v7 = REDoubleValueForTaggedPointer(a2, v6);
  }
  float v8 = v7 - *(double *)(a1 + 48);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v9 + 24) + (float)((float)(v8 * v8) * (float)a3);
  *(double *)(v9 + 24) = result;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a3;
  return result;
}

uint64_t __64___REContinuousHistogram_countOfValuesBetweenMinValue_maxValue___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  return result;
}

void __73___REContinuousHistogram__enumerateValuesBetweenMinValue_maxValue_block___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:a2];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73___REContinuousHistogram__enumerateValuesBetweenMinValue_maxValue_block___block_invoke_2;
  v5[3] = &unk_2644BD7C8;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v6 = v3;
  id v7 = *(id *)(a1 + 40);
  id v4 = v3;
  [v4 enumerateFeatureValuesUsingBlock:v5];
}

uint64_t __73___REContinuousHistogram__enumerateValuesBetweenMinValue_maxValue_block___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = RECompareFeatureValues(*(void *)(a1 + 48), a2);
  if (result != 1)
  {
    uint64_t result = RECompareFeatureValues((unint64_t)a2, *(void **)(a1 + 56));
    if (result != 1)
    {
      [*(id *)(a1 + 32) countForFeatureValue:a2];
      id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
      return v5();
    }
  }
  return result;
}

void __52___REContinuousHistogram_enumerateValuesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52___REContinuousHistogram_enumerateValuesUsingBlock___block_invoke_2;
  v8[3] = &unk_2644BD818;
  id v9 = v6;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = a4;
  id v7 = v6;
  [v7 enumerateFeatureValuesUsingBlock:v8];
}

uint64_t __52___REContinuousHistogram_enumerateValuesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) countForFeatureValue:a2];
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*a3) {
    **(unsigned char **)(a1 + 48) = 1;
  }
  return result;
}

@end