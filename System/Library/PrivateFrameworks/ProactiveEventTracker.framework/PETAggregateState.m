@interface PETAggregateState
+ (unsigned)hashForString:(id)a3;
- (BOOL)checkIntegrity;
- (PETAggregateState)initWithPath:(id)a3;
- (PETAggregateState)initWithStorage:(id)a3;
- (id)description;
- (id)initInMemory;
- (void)enumerateAndResetCounters:(id)a3 distributions:(id)a4;
- (void)enumerateCounters:(id)a3 distributions:(id)a4;
- (void)incrementCounterBy:(double)a3 forKey:(const void *)a4 keyLength:(unsigned __int16)a5;
- (void)incrementCounterBy:(double)a3 forKey:(id)a4;
- (void)reset;
- (void)updateCounterTo:(double)a3 forKey:(const void *)a4 keyLength:(unsigned __int16)a5;
- (void)updateCounterTo:(double)a3 forKey:(id)a4;
- (void)updateDistributionWithValue:(double)a3 forKey:(const void *)a4 keyLength:(unsigned __int16)a5 maxSampleSize:(unsigned __int16)a6;
- (void)updateDistributionWithValue:(double)a3 forKey:(id)a4 maxSampleSize:(unsigned __int16)a5;
@end

@implementation PETAggregateState

- (void)incrementCounterBy:(double)a3 forKey:(const void *)a4 keyLength:(unsigned __int16)a5
{
  storage = self->_storage;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PETAggregateState_incrementCounterBy_forKey_keyLength___block_invoke;
  v6[3] = &__block_descriptor_40_e23_B44__0B8_v12_v20_v28Q36l;
  *(double *)&v6[4] = a3;
  lookupBlockCreatingIfNotExists(storage, (uint64_t)a4, a5, 1, 8u, v6);
}

uint64_t __57__PETAggregateState_incrementCounterBy_forKey_keyLength___block_invoke(uint64_t a1, char a2, double *a3)
{
  double v3 = 0.0;
  if ((a2 & 1) == 0) {
    double v3 = *a3;
  }
  *a3 = *(double *)(a1 + 32) + v3;
  return 0;
}

uint64_t __80__PETAggregateState_updateDistributionWithValue_forKey_keyLength_maxSampleSize___block_invoke(uint64_t a1, char a2, unsigned __int16 *a3, void *a4, uint64_t a5, unint64_t a6)
{
  unsigned int v7 = *(unsigned __int16 *)(a1 + 48);
  if (*(_WORD *)(a1 + 48))
  {
    if (v7 >= 0xFB) {
      LOWORD(v7) = 255 * ((16843010 * (unint64_t)((unsigned __int16)(v7 - 250) + 254)) >> 32) + 250;
    }
    else {
      LOWORD(v7) = 250;
    }
  }
  if (a2)
  {
    unsigned __int16 v8 = 0;
    uint64_t v9 = 0x4597AFFEFFFFFFFFLL;
    unsigned int v10 = 1;
    double v11 = 0.0;
    double v12 = NAN;
    double v13 = NAN;
    double v14 = 0.0;
  }
  else
  {
    if (*a3 != (unsigned __int16)v7) {
      goto LABEL_36;
    }
    uint64_t v9 = *((void *)a3 + 5);
    if (HIDWORD(v9) != 1167568894) {
      goto LABEL_36;
    }
    unsigned __int16 v8 = a3[1];
    double v14 = *((double *)a3 + 1);
    double v11 = *((double *)a3 + 2);
    double v13 = *((double *)a3 + 3);
    double v12 = *((double *)a3 + 4);
    unsigned int v10 = *((_DWORD *)a3 + 1) + 1;
  }
  double v15 = *(double *)(a1 + 40);
  double v16 = v14 + (v15 - v14) / (double)v10;
  double v17 = v11 + (v15 - v14) * (v15 - v16);
  if (v13 <= v15) {
    double v18 = v13;
  }
  else {
    double v18 = *(double *)(a1 + 40);
  }
  if (v12 < v15) {
    double v12 = *(double *)(a1 + 40);
  }
  if (!(_WORD)v7)
  {
    uint64_t result = 0;
    *a3 = 0;
LABEL_35:
    a3[1] = v8;
    *((_DWORD *)a3 + 1) = v10;
    *((double *)a3 + 1) = v16;
    *((double *)a3 + 2) = v17;
    *((double *)a3 + 3) = v18;
    *((double *)a3 + 4) = v12;
    *((void *)a3 + 5) = v9;
    return result;
  }
  if (v10 <= (unsigned __int16)v7)
  {
    LOWORD(v24) = v10 - 1;
    ++v8;
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(v19 + 16);
    uint64_t v21 = *(void *)(v19 + 24);
    unint64_t v22 = v21 + v20;
    uint64_t v23 = v21 ^ v20;
    *(void *)(v19 + 16) = __ROR8__(v20, 9) ^ (v23 << 14) ^ v23;
    *(void *)(v19 + 24) = __ROR8__(v23, 28);
    unint64_t v24 = v22 % v10;
    if (v24 >= (unsigned __int16)v7)
    {
      uint64_t result = 0;
LABEL_34:
      *a3 = v7;
      goto LABEL_35;
    }
  }
  if ((unsigned __int16)v24 <= 0xF9u)
  {
    uint64_t result = 0;
    *(double *)&a3[4 * (unsigned __int16)v24 + 24] = v15;
    goto LABEL_34;
  }
  unsigned int v26 = (unsigned __int16)v24 - 250;
  unsigned int v27 = v9;
  if (v9 == -1)
  {
    LODWORD(v29) = a3 + 40;
LABEL_31:
    if (v26 < 0xFF)
    {
      *a4 = 0xE47F4EAAFFFFFFFFLL;
      a4[(unsigned __int16)v26 + 1] = *(void *)(a1 + 40);
      *a3 = v7;
      a3[1] = v8;
      *((_DWORD *)a3 + 1) = v10;
      *((double *)a3 + 1) = v16;
      *((double *)a3 + 2) = v17;
      *((double *)a3 + 3) = v18;
      *((double *)a3 + 4) = v12;
      *((void *)a3 + 5) = v9;
      setBucketPtr(a5, a6, v29 - a5, a4 - a5, *(void **)(*(void *)(a1 + 32) + 8));
      return 1;
    }
  }
  else
  {
    while (1)
    {
      unsigned int v28 = v27;
      if ((unint64_t)v27 + 2048 > a6) {
        break;
      }
      v29 = (unsigned int *)(a5 + v27);
      if (v29[1] != -461418838) {
        break;
      }
      if (v26 <= 0xFE)
      {
        uint64_t result = 0;
        *(double *)&v29[2 * (unsigned __int16)v26 + 2] = v15;
        goto LABEL_34;
      }
      unsigned int v27 = *v29;
      if (v28 >= *v29) {
        break;
      }
      v26 -= 255;
      if (v27 == -1) {
        goto LABEL_31;
      }
    }
  }
LABEL_36:
  [*(id *)(*(void *)(a1 + 32) + 8) saveCorruptState];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) resetLocked];
  __break(1u);
  return result;
}

- (void)updateDistributionWithValue:(double)a3 forKey:(const void *)a4 keyLength:(unsigned __int16)a5 maxSampleSize:(unsigned __int16)a6
{
  storage = self->_storage;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PETAggregateState_updateDistributionWithValue_forKey_keyLength_maxSampleSize___block_invoke;
  v8[3] = &unk_1E56C3FE8;
  unsigned __int16 v9 = a6;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  if (a5) {
    unsigned int v7 = 2048;
  }
  else {
    unsigned int v7 = 48;
  }
  lookupBlockCreatingIfNotExists(storage, (uint64_t)a4, a5, 2, v7, v8);
}

- (void).cxx_destruct
{
}

- (BOOL)checkIntegrity
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  storage = self->_storage;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PETAggregateState_checkIntegrity__block_invoke;
  v5[3] = &unk_1E56C4128;
  v5[4] = self;
  v5[5] = &v6;
  [(PETAggregateStateStorage *)storage runWithLock:v5];
  BOOL v3 = *((unsigned char *)v7 + 24) == 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__PETAggregateState_checkIntegrity__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v6 = 0;
  while (2)
  {
    uint64_t result = getBucketPtr(a2, a3, 4 * v6, *(void **)(*(void *)(a1 + 32) + 8));
    while (result != -1)
    {
      unint64_t v8 = result + 10;
      if (v8 <= a3)
      {
        char v9 = (unsigned __int8 *)(a2 + result);
        if (*v9 == 228)
        {
          BOOL v10 = v8 + *((unsigned __int16 *)v9 + 2) + *((unsigned __int16 *)v9 + 1) > a3
             || result >= *(_DWORD *)(v9 + 6);
          uint64_t result = *(unsigned int *)(v9 + 6);
          if (!v10) {
            continue;
          }
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      return result;
    }
    if (++v6 != 256) {
      continue;
    }
    break;
  }
  return result;
}

- (id)description
{
  BOOL v3 = objc_opt_new();
  [v3 appendString:@"Stat aggregation store\n======================\n"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__PETAggregateState_description__block_invoke;
  v10[3] = &unk_1E56C40D8;
  id v11 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__PETAggregateState_description__block_invoke_2;
  v8[3] = &unk_1E56C4100;
  id v4 = v11;
  id v9 = v4;
  [(PETAggregateState *)self enumerateCounters:v10 distributions:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

void __32__PETAggregateState_description__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, double a4)
{
  v5 = *(void **)(a1 + 32);
  displayStringForKey(a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 appendFormat:@"\nCOUNTER '%@': %g\n", v6, *(void *)&a4];
}

uint64_t __32__PETAggregateState_description__block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5, int a6, uint64_t a7, unsigned __int16 *a8, double a9, double a10, double a11, double a12)
{
  uint64_t v22 = a6;
  if (a6 < 1)
  {
    uint64_t v23 = 0;
  }
  else
  {
    LODWORD(v23) = 0;
    unint64_t v24 = a8;
    uint64_t v25 = a6;
    do
    {
      int v26 = *v24++;
      uint64_t v23 = (v23 + v26);
      --v25;
    }
    while (v25);
  }
  unsigned int v27 = *(void **)(a1 + 32);
  unsigned int v28 = displayStringForKey(a2, a3);
  [v27 appendFormat:@"\nDISTRIBUTION '%@' (sampled %i of %u from %u observations)\n", v28, v23, a4, a5];

  [*(id *)(a1 + 32) appendFormat:@"    mean: %g\n    std. dev: %g\n    range: [%g, %g]\n    samples: [", *(void *)&a9, sqrt(a10), *(void *)&a11, *(void *)&a12];
  if (a6 >= 1)
  {
    uint64_t v29 = 0;
    do
    {
      if (a8[v29])
      {
        unint64_t v30 = 0;
        do
          [*(id *)(a1 + 32) appendFormat:@"%g, ", *(void *)(*(void *)(a7 + 8 * v29) + 8 * v30++)];
        while (v30 < a8[v29]);
      }
      ++v29;
    }
    while (v29 != v22);
  }
  if (v23) {
    objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", objc_msgSend(*(id *)(a1 + 32), "length") - 2, 2);
  }
  v31 = *(void **)(a1 + 32);

  return [v31 appendString:@"]\n"];
}

- (void)enumerateAndResetCounters:(id)a3 distributions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  storage = self->_storage;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PETAggregateState_enumerateAndResetCounters_distributions___block_invoke;
  v11[3] = &unk_1E56C40B0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PETAggregateStateStorage *)storage expand:0 andRunWithLock:v11];
}

uint64_t __61__PETAggregateState_enumerateAndResetCounters_distributions___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned char *a5)
{
  for (unsigned int i = 0; i != 1024; i += 4)
  {
    unsigned int BucketPtr = getBucketPtr(a2, a3, i, *(void **)(*(void *)(a1 + 32) + 8));
    enumerateChain(a2, a3, BucketPtr, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(*(void *)(a1 + 32) + 8));
  }
  *a5 = 1;
  return 0;
}

- (void)reset
{
  self->_rng = ($FEF0A0984D2795EAE1E2AD40E2F6E7E6)xmmword_190C2D900;
}

- (void)enumerateCounters:(id)a3 distributions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  storage = self->_storage;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PETAggregateState_enumerateCounters_distributions___block_invoke;
  v11[3] = &unk_1E56C4088;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PETAggregateStateStorage *)storage runWithLock:v11];
}

void __53__PETAggregateState_enumerateCounters_distributions___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  for (unsigned int i = 0; i != 1024; i += 4)
  {
    unsigned int BucketPtr = getBucketPtr(a2, a3, i, *(void **)(*(void *)(a1 + 32) + 8));
    enumerateChain(a2, a3, BucketPtr, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(*(void *)(a1 + 32) + 8));
  }
}

- (void)updateDistributionWithValue:(double)a3 forKey:(id)a4 maxSampleSize:(unsigned __int16)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__PETAggregateState_updateDistributionWithValue_forKey_maxSampleSize___block_invoke;
  v5[3] = &unk_1E56C4060;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  unsigned __int16 v6 = a5;
  callWithHashableBytesOfString(a4, v5);
}

uint64_t __70__PETAggregateState_updateDistributionWithValue_forKey_maxSampleSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) updateDistributionWithValue:a2 forKey:a3 keyLength:*(unsigned __int16 *)(a1 + 48) maxSampleSize:*(double *)(a1 + 40)];
}

- (void)updateCounterTo:(double)a3 forKey:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__PETAggregateState_updateCounterTo_forKey___block_invoke;
  v4[3] = &unk_1E56C4038;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  callWithHashableBytesOfString(a4, v4);
}

uint64_t __44__PETAggregateState_updateCounterTo_forKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) updateCounterTo:a2 forKey:a3 keyLength:*(double *)(a1 + 40)];
}

- (void)incrementCounterBy:(double)a3 forKey:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PETAggregateState_incrementCounterBy_forKey___block_invoke;
  v4[3] = &unk_1E56C4038;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  callWithHashableBytesOfString(a4, v4);
}

uint64_t __47__PETAggregateState_incrementCounterBy_forKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) incrementCounterBy:a2 forKey:a3 keyLength:*(double *)(a1 + 40)];
}

- (void)updateCounterTo:(double)a3 forKey:(const void *)a4 keyLength:(unsigned __int16)a5
{
  storage = self->_storage;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PETAggregateState_updateCounterTo_forKey_keyLength___block_invoke;
  v6[3] = &__block_descriptor_40_e23_B44__0B8_v12_v20_v28Q36l;
  *(double *)&v6[4] = a3;
  lookupBlockCreatingIfNotExists(storage, (uint64_t)a4, a5, 1, 8u, v6);
}

uint64_t __54__PETAggregateState_updateCounterTo_forKey_keyLength___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = *(void *)(a1 + 32);
  return 0;
}

- (PETAggregateState)initWithPath:(id)a3
{
  id v4 = +[PETAggregateStateStorage storageOnDisk:a3];
  if (v4)
  {
    self = [(PETAggregateState *)self initWithStorage:v4];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }
  unsigned __int16 v6 = v5;

  return v6;
}

- (id)initInMemory
{
  BOOL v3 = +[PETAggregateStateStorage storageInMemory];
  if (v3)
  {
    self = [(PETAggregateState *)self initWithStorage:v3];
    id v4 = self;
  }
  else
  {
    id v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (PETAggregateState)initWithStorage:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PETAggregateState.m", 257, @"Invalid parameter not satisfying: %@", @"storage" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PETAggregateState;
  id v7 = [(PETAggregateState *)&v11 init];
  unint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_storage, a3);
    v8->_rng = ($FEF0A0984D2795EAE1E2AD40E2F6E7E6)xmmword_190C2D900;
  }

  return v8;
}

+ (unsigned)hashForString:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__PETAggregateState_hashForString___block_invoke;
  v6[3] = &unk_1E56C4010;
  v6[4] = &v7;
  callWithHashableBytesOfString(v3, v6);
  unsigned __int8 v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __35__PETAggregateState_hashForString___block_invoke(uint64_t result, unsigned __int8 *a2, unsigned int a3)
{
  __int16 v3 = 8997;
  if (a3)
  {
    uint64_t v4 = a3;
    do
    {
      __int16 v5 = *a2++;
      __int16 v3 = 435 * (v3 ^ v5);
      --v4;
    }
    while (v4);
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3 ^ HIBYTE(v3);
  return result;
}

@end