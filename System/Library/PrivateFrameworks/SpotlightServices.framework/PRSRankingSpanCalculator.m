@interface PRSRankingSpanCalculator
+ (BOOL)doesOrderedSpanExistWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 orderedSpan:(int64_t *)a6 firstTermPosition:(unint64_t *)a7 queryTermCount:(unint64_t)a8;
+ (BOOL)doesOrderedSpanExistWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 queryTermCount:(unint64_t)a6 kTermCount:(unint64_t)a7;
+ (int64_t)minimumAnyOrderSpanWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 queryTermCount:(unint64_t)a6;
+ (int64_t)minimumPairDistanceWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 queryTermCount:(unint64_t)a6 tokenCount:(unint64_t)a7;
- (BOOL)n2Exists;
- (BOOL)n3Exists;
- (BOOL)pathExists;
- (float)firstTermPosition;
- (float)normCount;
- (float)ordered;
- (float)pairDist;
- (float)unordered;
- (id)description;
- (void)reset;
- (void)resetSpans;
- (void)setFirstTermPosition:(float)a3;
- (void)setN2Exists:(BOOL)a3;
- (void)setN3Exists:(BOOL)a3;
- (void)setNormCount:(float)a3;
- (void)setOrdered:(float)a3;
- (void)setPairDist:(float)a3;
- (void)setPathExists:(BOOL)a3;
- (void)setUnordered:(float)a3;
- (void)updateWithTermPositions:(id)a3 queryTermCount:(unint64_t)a4 tokenCount:(unint64_t)a5;
@end

@implementation PRSRankingSpanCalculator

+ (BOOL)doesOrderedSpanExistWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 queryTermCount:(unint64_t)a6 kTermCount:(unint64_t)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a6 < a7) {
    return 0;
  }
  unint64_t v10 = a6 + 1 - a7;
  if (a6 + 1 == a7) {
    return 0;
  }
  v11 = a4;
  v12 = a3;
  uint64_t v13 = 0;
  unint64_t v14 = 8 * a6;
  if (v10 <= 1) {
    unint64_t v10 = 1;
  }
  unint64_t v36 = a7 - 1;
  unint64_t v37 = v10;
  while (1)
  {
    if (v12[v13])
    {
      MEMORY[0x1F4188790](a1, a2, a3, a4, a5, a6, a7, v7);
      v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v15, 8 * a6);
      MEMORY[0x1F4188790](v16, v17, v18, v19, v20, v21, v22, v23);
      bzero(v15, 8 * a6);
      bzero(v15, 8 * a6);
      bzero(v15, 8 * a6);
      unint64_t v24 = v11[v13];
      if (v24) {
        break;
      }
    }
LABEL_35:
    if (++v13 == v37) {
      return 0;
    }
  }
  uint64_t v25 = 0;
  v26 = v12[v13];
  BOOL v28 = v13 + 1 < a6 && a7 > 1;
LABEL_14:
  *(void *)&v15[8 * v13] = v25;
  unint64_t v29 = v26[v25];
  *(void *)&v15[8 * v13] = v29;
  if (!v28) {
    goto LABEL_34;
  }
  unint64_t v30 = v13 + 1;
  do
  {
    v31 = v12[v30];
    if (!v31 || (v32 = *(const char **)&v15[8 * v30], a1 = (id)(v11[v30] - 1), v32 > a1))
    {
LABEL_32:
      if (++v25 == v24) {
        goto LABEL_35;
      }
      goto LABEL_14;
    }
    a3 = *(unint64_t ***)&v15[8 * v30];
    while (1)
    {
      a4 = (unint64_t *)((char *)a1 + (void)a3);
      a2 = (SEL)(((unint64_t)a1 + (unint64_t)a3) >> 1);
      unint64_t v33 = v31[(void)a2];
      if (v33 >= v29) {
        break;
      }
      a3 = (unint64_t **)(a2 + 1);
LABEL_23:
      if (a3 > a1) {
        goto LABEL_32;
      }
    }
    if ((unint64_t)a4 >= 2)
    {
      a1 = (id)(a2 - 1);
      a4 = (unint64_t *)v31[(void)(a2 - 1)];
      if ((unint64_t)a4 >= v29) {
        goto LABEL_23;
      }
    }
    if (a2 == (SEL)0x7FFFFFFF || v33 > v29 + 1) {
      goto LABEL_32;
    }
    if (v25 && a2 == v32) {
      break;
    }
    *(void *)&v15[8 * v30] = v33;
    *(void *)&v15[8 * v30++] = a2;
    if (v30 >= a6) {
      break;
    }
    unint64_t v29 = v33;
  }
  while (v30 - v13 < a7);
LABEL_34:
  if (*(void *)&v15[8 * v36 + 8 * v13] - *(void *)&v15[8 * v13] == 0x7FFFFFFFLL) {
    goto LABEL_35;
  }
  return 1;
}

+ (BOOL)doesOrderedSpanExistWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 orderedSpan:(int64_t *)a6 firstTermPosition:(unint64_t *)a7 queryTermCount:(unint64_t)a8
{
  v40[1] = *MEMORY[0x1E4F143B8];
  size_t v14 = 8 * a8;
  MEMORY[0x1F4188790](a1, a2, a3, a4, a5, a6, a7, a8);
  v15 = (void *)((char *)v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v15, v14);
  MEMORY[0x1F4188790](v16, v17, v18, v19, v20, v21, v22, v23);
  bzero(v15, v14);
  bzero(v15, v14);
  bzero(v15, v14);
  unint64_t v24 = *a4;
  if (!*a4)
  {
    uint64_t v27 = 0x7FFFFFFFLL;
    return v27 != 0x7FFFFFFF;
  }
  unint64_t v25 = 0;
  v26 = *a3;
  uint64_t v27 = 0x7FFFFFFFLL;
  do
  {
    unint64_t v28 = v25;
    unint64_t v29 = v26[v25];
    unint64_t *v15 = v29;
    if (a5 >= 2)
    {
      unint64_t v30 = v29;
      uint64_t v31 = 1;
      while (1)
      {
        unint64_t v32 = v15[v31];
        unint64_t v33 = a4[v31] - 1;
        if (v32 > v33) {
          goto LABEL_21;
        }
        v34 = a3[v31];
        unint64_t v35 = v15[v31];
        while (1)
        {
          unint64_t v36 = (v35 + v33) >> 1;
          unint64_t v37 = v34[v36];
          if (v37 >= v30) {
            break;
          }
          unint64_t v35 = v36 + 1;
LABEL_11:
          if (v35 > v33) {
            goto LABEL_21;
          }
        }
        if (v35 + v33 >= 2)
        {
          unint64_t v33 = v36 - 1;
          if (v34[v36 - 1] >= v30) {
            goto LABEL_11;
          }
        }
        if (v36 == 0x7FFFFFFF) {
          goto LABEL_21;
        }
        if (!v28 || v36 != v32)
        {
          v15[v31] = v37;
          v15[v31++] = v36;
          unint64_t v30 = v37;
          if (v31 != a5) {
            continue;
          }
        }
        break;
      }
    }
    int64_t v38 = v15[a8 - 1] - v29;
    if (v27 == 0x7FFFFFFF || v38 < v27)
    {
      *a6 = v38;
      *a7 = v29;
      uint64_t v27 = v38;
    }
    unint64_t v25 = v28 + 1;
  }
  while (v28 + 1 != v24);
LABEL_21:
  unint64_t *v15 = v28;
  return v27 != 0x7FFFFFFF;
}

+ (int64_t)minimumAnyOrderSpanWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 queryTermCount:(unint64_t)a6
{
  v41[1] = *MEMORY[0x1E4F143B8];
  if (a6 - 1 >= a5) {
    return 0x7FFFFFFFLL;
  }
  size_t v10 = 8 * a6;
  ((void (*)(id, SEL, unint64_t **, unint64_t *, unint64_t, unint64_t))MEMORY[0x1F4188790])(a1, a2, a3, a4, a5, a6);
  v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v11, v10);
  MEMORY[0x1F4188790](v12, v13, v14, v15, v16, v17, v18, v19);
  bzero(v11, v10);
  bzero(v11, v10);
  bzero(v11, v10);
  uint64_t v20 = 0;
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  int64_t result = 0x7FFFFFFFLL;
  while (a4[v20])
  {
    unint64_t v24 = *a3[v20];
    *(void *)&v11[8 * v20] = v24;
    unint64_t v25 = v24;
    if (!v20 || (v24 >= v22 ? (v25 = v22) : (v25 = v24), unint64_t v22 = v25, v24 > v21))
    {
      unint64_t v22 = v25;
      unint64_t v21 = v24;
    }
    if (a5 == ++v20)
    {
      int64_t result = 0x7FFFFFFFLL;
      while (1)
      {
        uint64_t v26 = 0;
        unint64_t v27 = 0;
        int64_t v28 = v21 - v22;
        BOOL v29 = result == 0x7FFFFFFF || v28 < result;
        BOOL v30 = v29;
        uint64_t v31 = 0x7FFFFFFFLL;
        do
        {
          if (v26) {
            BOOL v32 = *(void *)&v11[8 * v26] >= v27;
          }
          else {
            BOOL v32 = 0;
          }
          if (!v32)
          {
            unint64_t v27 = *(void *)&v11[8 * v26];
            uint64_t v31 = v26;
          }
          ++v26;
        }
        while (a6 != v26);
        if (v30) {
          int64_t result = v28;
        }
        if (v31 == 0x7FFFFFFF) {
          +[PRSRankingSpanCalculator minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:]();
        }
        uint64_t v34 = *(void *)&v11[8 * v31];
        if (v34 == a4[v31] - 1) {
          break;
        }
        uint64_t v35 = 0;
        unint64_t v22 = 0;
        uint64_t v36 = v34 + 1;
        *(void *)&v11[8 * v31] = v36;
        unint64_t v37 = a3[v31][v36];
        *(void *)&v11[8 * v31] = v37;
        uint64_t v38 = 0x7FFFFFFFLL;
        do
        {
          if (v35) {
            BOOL v39 = *(void *)&v11[8 * v35] >= v22;
          }
          else {
            BOOL v39 = 0;
          }
          if (!v39)
          {
            unint64_t v22 = *(void *)&v11[8 * v35];
            uint64_t v38 = v35;
          }
          ++v35;
        }
        while (a6 != v35);
        if (v38 == 0x7FFFFFFF) {
          +[PRSRankingSpanCalculator minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:]();
        }
        if (v37 > v21) {
          unint64_t v21 = v37;
        }
      }
      return result;
    }
  }
  return result;
}

+ (int64_t)minimumPairDistanceWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 queryTermCount:(unint64_t)a6 tokenCount:(unint64_t)a7
{
  if (!a6) {
    return 0x7FFFFFFFLL;
  }
  if (a6 == 1)
  {
    if (a4 && *a4) {
      return 0;
    }
    return 0x7FFFFFFFLL;
  }
  int64_t v9 = 0x7FFFFFFFLL;
  if (a5 >= a6 && a5)
  {
    int v11 = 0;
    uint64_t v12 = a4;
    do
    {
      if (*v12++) {
        ++v11;
      }
      --a5;
    }
    while (a5);
    if (!v11) {
      return 0x7FFFFFFFLL;
    }
    int64_t v9 = a7;
    if (v11 != 1)
    {
      uint64_t v14 = 0;
      int64_t v9 = -1;
      do
      {
        uint64_t v15 = a4[v14];
        if (v15)
        {
          uint64_t v16 = 0;
          do
          {
            if (v14 != v16)
            {
              uint64_t v17 = a4[v16];
              if (v17)
              {
                uint64_t v18 = minSpanLenContainingPair((uint64_t)a3[v14], v15, a3[v16], v17);
                if (v18 < v9 || v9 == -1) {
                  int64_t v9 = v18;
                }
              }
            }
            ++v16;
          }
          while (a6 != v16);
        }
        ++v14;
      }
      while (v14 != a6);
    }
  }
  return v9;
}

- (void)reset
{
  *(void *)&self->_unordered = 0x4F0000004F000000;
  self->_pairDist = 2147500000.0;
  self->_firstTermPosition = 2147500000.0;
  *(_WORD *)&self->_pathExists = 0;
  self->_n3Exists = 0;
}

- (void)resetSpans
{
  *(void *)&self->_unordered = 0x4F0000004F000000;
}

- (void)updateWithTermPositions:(id)a3 queryTermCount:(unint64_t)a4 tokenCount:(unint64_t)a5
{
  v51[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(PRSRankingSpanCalculator *)self reset];
  id v46 = v8;
  int64_t v9 = (void *)[v8 mutableCopy];
  v45 = (void *)*MEMORY[0x1E4F1D260];
  objc_msgSend(v9, "removeObject:");
  uint64_t v10 = [v9 count];
  if (v10)
  {
    unint64_t v11 = v10;
    unint64_t v40 = a5;
    unint64_t v44 = a4;
    v41 = v38;
    v42 = self;
    size_t v12 = 8 * v10;
    uint64_t v13 = (void **)((char *)v38 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v13, 8 * v10);
    bzero(v13, v12);
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F1CAA0];
      uint64_t v16 = [v9 objectAtIndexedSubscript:i];
      uint64_t v17 = [v15 orderedSetWithArray:v16];

      uint64_t v18 = [v17 count];
      v13[i] = (void *)v18;
      if (v18)
      {
        uint64_t v19 = malloc_type_malloc(8 * v18, 0x100004000313F17uLL);
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __78__PRSRankingSpanCalculator_updateWithTermPositions_queryTermCount_tokenCount___block_invoke;
        v51[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
        v51[4] = v19;
        [v17 enumerateObjectsUsingBlock:v51];
      }
      else
      {
        uint64_t v19 = 0;
      }
      v13[i] = v19;
    }
    unint64_t v49 = 0x7FFFFFFFLL;
    uint64_t v50 = 0x7FFFFFFFLL;
    if (v11 <= 1)
    {
      unint64_t v20 = v44;
      if (v44)
      {
        int64_t v28 = v42;
        if (v44 == 1)
        {
          v42->_pathExists = 1;
          uint64_t v50 = 0;
          uint64_t v32 = 0;
          uint64_t v33 = 0;
          if (*v13) {
            unint64_t v49 = **v13;
          }
        }
        else
        {
          uint64_t v32 = 0x7FFFFFFFLL;
          uint64_t v33 = v40;
        }
      }
      else
      {
        uint64_t v32 = 0x7FFFFFFFLL;
        uint64_t v33 = 0x7FFFFFFFLL;
        int64_t v28 = v42;
      }
    }
    else
    {
      BOOL v39 = v9;
      v38[1] = v38;
      unint64_t v20 = v44;
      unint64_t v21 = (void **)((char *)v38 - ((8 * v44 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v21, 8 * v44);
      bzero(v21, 8 * v20);
      if (v20)
      {
        uint64_t v22 = 0;
        v43 = v48;
        do
        {
          uint64_t v23 = [v46 objectAtIndexedSubscript:v22];
          if (v23 == v45)
          {
            v21[v22] = 0;
            v21[v22] = 0;
          }
          else
          {
            unint64_t v24 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v23];
            uint64_t v25 = [v24 count];
            v21[v22] = (void *)v25;
            if (v25)
            {
              uint64_t v26 = malloc_type_malloc(8 * v25, 0x100004000313F17uLL);
              v47[0] = MEMORY[0x1E4F143A8];
              v47[1] = 3221225472;
              v48[0] = __78__PRSRankingSpanCalculator_updateWithTermPositions_queryTermCount_tokenCount___block_invoke_2;
              v48[1] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
              v48[2] = v26;
              [v24 enumerateObjectsUsingBlock:v47];
            }
            else
            {
              uint64_t v26 = 0;
            }
            v21[v22] = v26;

            unint64_t v20 = v44;
          }

          ++v22;
        }
        while (v20 != v22);
      }
      BOOL v27 = +[PRSRankingSpanCalculator doesOrderedSpanExistWithArrayOfIndexArrays:v21 arrayOfIndexArraysCounts:v21 arrayOfIndexArraysCount:v11 queryTermCount:v20 kTermCount:2];
      int64_t v28 = v42;
      v42->_n2Exists = v27;
      if (v11 > 2) {
        v28->_n3Exists = +[PRSRankingSpanCalculator doesOrderedSpanExistWithArrayOfIndexArrays:v21 arrayOfIndexArraysCounts:v21 arrayOfIndexArraysCount:v11 queryTermCount:v20 kTermCount:3];
      }
      unint64_t v29 = v40;
      if (v20)
      {
        unint64_t v30 = v20;
        do
        {
          uint64_t v31 = *v21++;
          free(v31);
          --v30;
        }
        while (v30);
      }
      if (v11 == v20) {
        v28->_pathExists = +[PRSRankingSpanCalculator doesOrderedSpanExistWithArrayOfIndexArrays:v13 arrayOfIndexArraysCounts:v13 arrayOfIndexArraysCount:v20 orderedSpan:&v50 firstTermPosition:&v49 queryTermCount:v20];
      }
      uint64_t v32 = +[PRSRankingSpanCalculator minimumAnyOrderSpanWithArrayOfIndexArrays:v13 arrayOfIndexArraysCounts:v13 arrayOfIndexArraysCount:v11 queryTermCount:v20];
      uint64_t v33 = +[PRSRankingSpanCalculator minimumPairDistanceWithArrayOfIndexArrays:v13 arrayOfIndexArraysCounts:v13 arrayOfIndexArraysCount:v11 queryTermCount:v20 tokenCount:v29];
      int64_t v9 = v39;
    }
    if (v11 <= 1) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = v11;
    }
    do
    {
      uint64_t v35 = *v13++;
      free(v35);
      --v34;
    }
    while (v34);
    if (v50 != 0x7FFFFFFF)
    {
      float v36 = (double)v50 + 2.0;
      v28->_ordered = v36 / (float)v20;
    }
    if (v49 != 0x7FFFFFFF) {
      v28->_firstTermPosition = (float)v49;
    }
    if (v32 != 0x7FFFFFFF)
    {
      float v37 = (double)v32 + 2.0;
      v28->_unordered = v37 / (float)v20;
    }
    if (v33 != 0x7FFFFFFF) {
      v28->_pairDist = (float)v33;
    }
    if (v11 != v20) {
      [(PRSRankingSpanCalculator *)v28 resetSpans];
    }
  }
}

uint64_t __78__PRSRankingSpanCalculator_updateWithTermPositions_queryTermCount_tokenCount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 unsignedIntegerValue];
  *(void *)(*(void *)(a1 + 32) + 8 * a3) = result;
  return result;
}

uint64_t __78__PRSRankingSpanCalculator_updateWithTermPositions_queryTermCount_tokenCount___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 unsignedIntegerValue];
  *(void *)(*(void *)(a1 + 32) + 8 * a3) = result;
  return result;
}

- (id)description
{
  v20[5] = *MEMORY[0x1E4F143B8];
  v19[0] = @"unordered";
  *(float *)&double v2 = self->_unordered;
  v4 = [MEMORY[0x1E4F28ED0] numberWithFloat:v2];
  v20[0] = v4;
  v19[1] = @"ordered";
  *(float *)&double v5 = self->_ordered;
  v6 = [MEMORY[0x1E4F28ED0] numberWithFloat:v5];
  v20[1] = v6;
  v19[2] = @"firstTermPosition";
  *(float *)&double v7 = self->_firstTermPosition;
  id v8 = [MEMORY[0x1E4F28ED0] numberWithFloat:v7];
  v20[2] = v8;
  v19[3] = @"normCount";
  *(float *)&double v9 = self->_normCount;
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithFloat:v9];
  v20[3] = v10;
  v19[4] = @"pairDist";
  *(float *)&double v11 = self->_pairDist;
  size_t v12 = [MEMORY[0x1E4F28ED0] numberWithFloat:v11];
  v20[4] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];

  uint64_t v14 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)PRSRankingSpanCalculator;
  uint64_t v15 = [(PRSRankingSpanCalculator *)&v18 description];
  uint64_t v16 = [v14 stringWithFormat:@"%@ %@", v15, v13];

  return v16;
}

- (float)unordered
{
  return self->_unordered;
}

- (void)setUnordered:(float)a3
{
  self->_unordered = a3;
}

- (float)ordered
{
  return self->_ordered;
}

- (void)setOrdered:(float)a3
{
  self->_ordered = a3;
}

- (float)firstTermPosition
{
  return self->_firstTermPosition;
}

- (void)setFirstTermPosition:(float)a3
{
  self->_firstTermPosition = a3;
}

- (float)normCount
{
  return self->_normCount;
}

- (void)setNormCount:(float)a3
{
  self->_normCount = a3;
}

- (float)pairDist
{
  return self->_pairDist;
}

- (void)setPairDist:(float)a3
{
  self->_pairDist = a3;
}

- (BOOL)pathExists
{
  return self->_pathExists;
}

- (void)setPathExists:(BOOL)a3
{
  self->_pathExists = a3;
}

- (BOOL)n2Exists
{
  return self->_n2Exists;
}

- (void)setN2Exists:(BOOL)a3
{
  self->_n2Exists = a3;
}

- (BOOL)n3Exists
{
  return self->_n3Exists;
}

- (void)setN3Exists:(BOOL)a3
{
  self->_n3Exists = a3;
}

+ (void)minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:.cold.1()
{
  __assert_rtn("+[PRSRankingSpanCalculator minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:]", "PRSRankingSpanCalculator.m", 263, "j != PRS_RANKING_SCORE_NO_MATCH");
}

+ (void)minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:.cold.2()
{
  __assert_rtn("+[PRSRankingSpanCalculator minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:]", "PRSRankingSpanCalculator.m", 277, "unused != PRS_RANKING_SCORE_NO_MATCH");
}

@end