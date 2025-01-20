@interface TSDMatchingAlgorithm
+ (id)bestMatchesFromArray:(id)a3;
- (BOOL)p_step4FindAZeroAndReturnRow:(int *)a3 column:(int *)a4;
- (id)p_bestMatchesFromArray:(id)a3;
- (int)p_doStep1;
- (int)p_doStep2;
- (int)p_doStep3;
- (int)p_doStep4;
- (int)p_doStep5;
- (int)p_doStep6;
- (int)p_step4IndexOfStarredZeroInRow:(int)a3;
- (void)p_allocateMatrices;
- (void)p_deallocateMatrices;
@end

@implementation TSDMatchingAlgorithm

- (void)p_allocateMatrices
{
  int64_t mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension <= 0)
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDMatchingAlgorithm p_allocateMatrices]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m"), 51, @"matrix dimension is 0!");
    int64_t mMatrixDimension = self->mMatrixDimension;
  }
  self->mCostMatrix = (int64_t *)malloc_type_calloc(8uLL, mMatrixDimension * mMatrixDimension, 0x93C77A53uLL);
  self->mMaskMatrix = (char *)malloc_type_calloc(1uLL, self->mMatrixDimension * self->mMatrixDimension, 0x8817C830uLL);
  self->mObjectMapping = (id *)malloc_type_calloc(8uLL, self->mMatrixDimension * self->mMatrixDimension, 0xF290735FuLL);
  int64_t v6 = self->mMatrixDimension;
  if (v6 >= 1)
  {
    for (int64_t i = 0; i < v6; ++i)
    {
      if (v6 >= 1)
      {
        int64_t v8 = 0;
        mCostMatrix = self->mCostMatrix;
        do
        {
          mCostMatrix[v8 + i * v6] = 0x3FFFFFFFFFFFFFFFLL;
          ++v8;
          int64_t v6 = self->mMatrixDimension;
        }
        while (v6 > v8);
      }
    }
  }
  self->mIsStarInColumn = (BOOL *)malloc_type_calloc(1uLL, v6, 0x8422D288uLL);
  self->mIsStarInRow = (BOOL *)malloc_type_calloc(1uLL, self->mMatrixDimension, 0xA48DAD1CuLL);
  self->mIsColCovered = (BOOL *)malloc_type_calloc(1uLL, self->mMatrixDimension, 0x5C07D3B4uLL);
  self->mIsRowCovered = (BOOL *)malloc_type_calloc(1uLL, self->mMatrixDimension, 0xD02211F3uLL);
}

- (void)p_deallocateMatrices
{
  free(self->mCostMatrix);
  free(self->mMaskMatrix);
  free(self->mObjectMapping);
  free(self->mIsStarInColumn);
  free(self->mIsStarInRow);
  free(self->mIsColCovered);
  mIsRowCovered = self->mIsRowCovered;

  free(mIsRowCovered);
}

- (int)p_doStep1
{
  int64_t mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension >= 1)
  {
    uint64_t v3 = 0;
    for (int64_t i = 0; i < mMatrixDimension; ++i)
    {
      if (mMatrixDimension >= 1)
      {
        uint64_t v5 = 0;
        uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          int64_t v6 = (char *)self->mCostMatrix + mMatrixDimension * v3;
          if (v7 >= *(void *)&v6[8 * v5]) {
            uint64_t v7 = *(void *)&v6[8 * v5];
          }
          ++v5;
        }
        while (mMatrixDimension != v5);
        if (v7 >= 1)
        {
          int64_t v8 = 0;
          mCostMatrix = self->mCostMatrix;
          do
          {
            mCostMatrix[v8 + i * mMatrixDimension] -= v7;
            ++v8;
            int64_t mMatrixDimension = self->mMatrixDimension;
          }
          while (mMatrixDimension > v8);
        }
      }
      v3 += 8;
    }
  }
  return 2;
}

- (int)p_doStep2
{
  int64_t mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension >= 1)
  {
    uint64_t v3 = 0;
    int64_t v4 = 0;
    mIsStarInRow = self->mIsStarInRow;
    do
    {
      if (!mIsStarInRow[v4] && mMatrixDimension >= 1)
      {
        uint64_t v7 = 0;
        while (self->mIsStarInColumn[v7] || *(int64_t *)((char *)&self->mCostMatrix[v7] + mMatrixDimension * v3))
        {
          if (mMatrixDimension == ++v7) {
            goto LABEL_13;
          }
        }
        self->mMaskMatrix[mMatrixDimension * v4 + v7] = 1;
        mIsStarInColumn = self->mIsStarInColumn;
        mIsStarInRow = self->mIsStarInRow;
        mIsStarInRow[v4] = 1;
        mIsStarInColumn[v7] = 1;
        int64_t mMatrixDimension = self->mMatrixDimension;
      }
LABEL_13:
      ++v4;
      v3 += 8;
    }
    while (mMatrixDimension > v4);
  }
  return 3;
}

- (int)p_doStep3
{
  int64_t mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension < 1)
  {
    int v4 = 0;
  }
  else
  {
    uint64_t v3 = 0;
    int v4 = 0;
    mIsStarInColumn = self->mIsStarInColumn;
    do
    {
      if (mIsStarInColumn[v3])
      {
        self->mIsColCovered[v3] = 1;
        ++v4;
      }
      ++v3;
    }
    while (mMatrixDimension != v3);
  }
  if (mMatrixDimension == v4) {
    return 7;
  }
  else {
    return 4;
  }
}

- (BOOL)p_step4FindAZeroAndReturnRow:(int *)a3 column:(int *)a4
{
  int64_t mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension < 1)
  {
    return 0;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    BOOL v7 = 1;
    while (self->mIsRowCovered[v6])
    {
LABEL_8:
      BOOL v7 = mMatrixDimension > ++v6;
      v5 += mMatrixDimension;
      if (v6 == mMatrixDimension) {
        return v7;
      }
    }
    uint64_t v8 = 0;
    while (self->mIsColCovered[v8] || self->mCostMatrix[v5 + v8])
    {
      if (mMatrixDimension == ++v8) {
        goto LABEL_8;
      }
    }
    *a3 = v6;
    *a4 = v8;
  }
  return v7;
}

- (int)p_step4IndexOfStarredZeroInRow:(int)a3
{
  int64_t mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension < 1)
  {
LABEL_5:
    LODWORD(v5) = -1;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = &self->mMaskMatrix[mMatrixDimension * a3];
    while (v6[v5] != 1)
    {
      if (mMatrixDimension == ++v5) {
        goto LABEL_5;
      }
    }
  }
  return v5;
}

- (int)p_doStep4
{
  uint64_t v7 = 0;
  if (![(TSDMatchingAlgorithm *)self p_step4FindAZeroAndReturnRow:(char *)&v7 + 4 column:&v7])return 6; {
  while (1)
  }
  {
    self->mMaskMatrix[(int)v7 + self->mMatrixDimension * SHIDWORD(v7)] = 2;
    int v3 = [(TSDMatchingAlgorithm *)self p_step4IndexOfStarredZeroInRow:HIDWORD(v7)];
    if (v3 == -1) {
      break;
    }
    mIsColCovered = self->mIsColCovered;
    self->mIsRowCovered[SHIDWORD(v7)] = 1;
    mIsColCovered[v3] = 0;
    if (![(TSDMatchingAlgorithm *)self p_step4FindAZeroAndReturnRow:(char *)&v7 + 4 column:&v7])return 6; {
  }
    }
  int64_t v6 = (int)v7;
  self->mZ0Row = SHIDWORD(v7);
  self->mZ0Col = v6;
  return 5;
}

- (int)p_doStep5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v4 = (void *)MEMORY[0x263F7C898];
  uint64_t v5 = [NSNumber numberWithInteger:self->mZ0Row];
  objc_msgSend(v3, "addObject:", objc_msgSend(v4, "pairWithFirst:second:", v5, objc_msgSend(NSNumber, "numberWithInteger:", self->mZ0Col)));
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "lastObject"), "second"), "intValue");
  if (self->mIsStarInColumn[(int)v6])
  {
    uint64_t v7 = (int)v6;
    uint64_t v8 = v6;
    do
    {
      int64_t mMatrixDimension = self->mMatrixDimension;
      if (mMatrixDimension < 1)
      {
LABEL_7:
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v10 = 0;
        v11 = &self->mMaskMatrix[v7];
        while (*v11 != 1)
        {
          v11 += mMatrixDimension;
          if (mMatrixDimension == ++v10) {
            goto LABEL_7;
          }
        }
      }
      v12 = (void *)MEMORY[0x263F7C898];
      uint64_t v13 = [NSNumber numberWithInt:v10];
      objc_msgSend(v3, "addObject:", objc_msgSend(v12, "pairWithFirst:second:", v13, objc_msgSend(NSNumber, "numberWithInt:", v8)));
      uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "lastObject"), "first"), "intValue");
      uint64_t v15 = v14;
      int64_t v16 = self->mMatrixDimension;
      if (v16 < 1)
      {
LABEL_12:
        v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v19 = [NSString stringWithUTF8String:"-[TSDMatchingAlgorithm p_doStep5]"];
        objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m"), 271, @"did not find prime in row!");
        uint64_t v17 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v17 = 0;
        while (self->mMaskMatrix[v16 * (int)v14 + v17] != 2)
        {
          if (v16 == ++v17) {
            goto LABEL_12;
          }
        }
      }
      v20 = (void *)MEMORY[0x263F7C898];
      uint64_t v21 = [NSNumber numberWithInt:v15];
      objc_msgSend(v3, "addObject:", objc_msgSend(v20, "pairWithFirst:second:", v21, objc_msgSend(NSNumber, "numberWithInt:", v17)));
      uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "lastObject"), "second"), "intValue");
      uint64_t v7 = (int)v8;
    }
    while (self->mIsStarInColumn[(int)v8]);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v22 = [v3 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(v3);
        }
        v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        int v27 = objc_msgSend((id)objc_msgSend(v26, "first"), "intValue");
        int v28 = objc_msgSend((id)objc_msgSend(v26, "second"), "intValue");
        mMaskMatrix = self->mMaskMatrix;
        int64_t v30 = self->mMatrixDimension * v27 + v28;
        BOOL v31 = mMaskMatrix[v30] != 1;
        mMaskMatrix[v30] = v31;
        mIsStarInColumn = self->mIsStarInColumn;
        self->mIsStarInRow[v27] = v31;
        mIsStarInColumn[v28] = v31;
      }
      uint64_t v23 = [v3 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v23);
  }
  int64_t v33 = self->mMatrixDimension;
  if (v33 >= 1)
  {
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    mIsStarInRow = self->mIsStarInRow;
    do
    {
      if (!mIsStarInRow[v35])
      {
        uint64_t v37 = 0;
        while (self->mMaskMatrix[v34 + v37] != 1)
        {
          if (v33 == ++v37) {
            goto LABEL_29;
          }
        }
        mIsStarInRow[v35] = 1;
        self->mIsStarInColumn[v37] = 1;
      }
LABEL_29:
      ++v35;
      v34 += v33;
    }
    while (v35 != v33);
    uint64_t v38 = 0;
    v39 = self->mIsStarInColumn;
    do
    {
      if (!v39[v38])
      {
        uint64_t v40 = 0;
        v41 = self->mMaskMatrix;
        while (v41[v38] != 1)
        {
          v41 += v33;
          if (v33 == ++v40) {
            goto LABEL_37;
          }
        }
        self->mIsStarInRow[v40] = 1;
        v39[v38] = 1;
      }
LABEL_37:
      ++v38;
    }
    while (v38 != v33);
    bzero(self->mIsRowCovered, v33);
    bzero(self->mIsColCovered, v33);
    for (int64_t j = 0; j < v33; ++j)
    {
      if (v33 >= 1)
      {
        for (int64_t k = 0; k < v33; ++k)
        {
          v44 = &self->mMaskMatrix[j * v33];
          if (v44[k] == 2)
          {
            v44[k] = 0;
            int64_t v33 = self->mMatrixDimension;
          }
        }
      }
    }
  }

  return 3;
}

- (int)p_doStep6
{
  int64_t mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (!self->mIsRowCovered[v4])
      {
        mIsColCovered = self->mIsColCovered;
        int64_t v7 = self->mMatrixDimension;
        uint64_t v8 = v3;
        do
        {
          BOOL v9 = *mIsColCovered++;
          if (!v9 && v5 >= *(int64_t *)((char *)self->mCostMatrix + v8)) {
            int64_t v5 = *(int64_t *)((char *)self->mCostMatrix + v8);
          }
          v8 += 8;
          --v7;
        }
        while (v7);
      }
      ++v4;
      v3 += 8 * mMatrixDimension;
    }
    while (v4 != mMatrixDimension);
    uint64_t v10 = 0;
    while (mMatrixDimension < 1)
    {
LABEL_20:
      if (mMatrixDimension <= ++v10) {
        return 4;
      }
    }
    int64_t v11 = 0;
    v12 = self->mIsColCovered;
    BOOL v13 = self->mIsRowCovered[v10];
    while (1)
    {
      if (v13)
      {
        if (v12[v11])
        {
          mCostMatrix = self->mCostMatrix;
          int64_t v15 = v11 + v10 * mMatrixDimension;
          int64_t v16 = mCostMatrix[v15] + v5;
LABEL_18:
          mCostMatrix[v15] = v16;
        }
      }
      else if (!v12[v11])
      {
        mCostMatrix = self->mCostMatrix;
        int64_t v15 = v11 + v10 * mMatrixDimension;
        int64_t v16 = mCostMatrix[v15] - v5;
        goto LABEL_18;
      }
      ++v11;
      int64_t mMatrixDimension = self->mMatrixDimension;
      if (mMatrixDimension <= v11) {
        goto LABEL_20;
      }
    }
  }
  return 4;
}

- (id)p_bestMatchesFromArray:(id)a3
{
  id v3 = a3;
  uint64_t v81 = *MEMORY[0x263EF8340];
  if ((unint64_t)[a3 count] >= 2)
  {
    int64_t v5 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    v59 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v73 objects:v80 count:16];
    v58 = v5;
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v56 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v74 != v56) {
            objc_enumerationMutation(v3);
          }
          int64_t v11 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          if (![v11 outgoingMatchObject] || !objc_msgSend(v11, "incomingMatchObject"))
          {
            v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v13 = [NSString stringWithUTF8String:"-[TSDMatchingAlgorithm p_bestMatchesFromArray:]"];
            uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m"];
            uint64_t v15 = v13;
            int64_t v5 = v58;
            [v12 handleFailureInFunction:v15 file:v14 lineNumber:440 description:@"Match does not have both incoming and outgoing objects!"];
          }
          if (!objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(v11, "outgoingMatchObject"))) {
            objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v9++), objc_msgSend(v11, "outgoingMatchObject"));
          }
          if (!objc_msgSend(v59, "objectForKeyedSubscript:", objc_msgSend(v11, "incomingMatchObject"))) {
            objc_msgSend(v59, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v8++), objc_msgSend(v11, "incomingMatchObject"));
          }
        }
        uint64_t v7 = [v3 countByEnumeratingWithState:&v73 objects:v80 count:16];
      }
      while (v7);
    }
    uint64_t v16 = [v5 count];
    if (v16 < 0)
    {
      v50 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v51 = [NSString stringWithUTF8String:"-[TSDMatchingAlgorithm p_bestMatchesFromArray:]"];
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m"), 453, @"Out-of-bounds type assignment was clamped to max");
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v17 = v59;
    uint64_t v18 = [v59 count];
    if (v18 < 0)
    {
      v52 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v53 = [NSString stringWithUTF8String:"-[TSDMatchingAlgorithm p_bestMatchesFromArray:]"];
      uint64_t v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m"];
      uint64_t v55 = v53;
      uint64_t v17 = v59;
      [v52 handleFailureInFunction:v55 file:v54 lineNumber:454 description:@"Out-of-bounds type assignment was clamped to max"];
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __47__TSDMatchingAlgorithm_p_bestMatchesFromArray___block_invoke;
    v72[3] = &unk_2646B2128;
    v72[4] = v3;
    if (v16 == 1 || v18 == 1)
    {
      return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", objc_msgSend((id)objc_msgSend(v3, "sortedArrayUsingComparator:", v72), "firstObject"));
    }
    else
    {
      if (v16 <= v18) {
        int64_t v19 = v18;
      }
      else {
        int64_t v19 = v16;
      }
      self->int64_t mMatrixDimension = v19;
      [(TSDMatchingAlgorithm *)self p_allocateMatrices];
      int64_t mMatrixDimension = self->mMatrixDimension;
      if (mMatrixDimension >= 1)
      {
        for (uint64_t j = 0; j < mMatrixDimension; ++j)
        {
          if (mMatrixDimension >= 1)
          {
            for (uint64_t k = 0; k < mMatrixDimension; ++k)
            {
              if (j >= v16 || k >= v18)
              {
                self->mCostMatrix[k + j * mMatrixDimension] = 0;
                int64_t mMatrixDimension = self->mMatrixDimension;
              }
            }
          }
        }
      }
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v23 = [v3 countByEnumeratingWithState:&v68 objects:v79 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v57 = *(void *)v69;
        do
        {
          for (uint64_t m = 0; m != v24; ++m)
          {
            if (*(void *)v69 != v57) {
              objc_enumerationMutation(v3);
            }
            v26 = *(void **)(*((void *)&v68 + 1) + 8 * m);
            uint64_t v27 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(v26, "outgoingMatchObject")), "integerValue");
            uint64_t v28 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", objc_msgSend(v26, "incomingMatchObject")), "integerValue");
            if (*((void *)&self->mObjectMapping[v28] + self->mMatrixDimension * v27))
            {
              uint64_t v29 = [MEMORY[0x263F7C7F0] currentHandler];
              uint64_t v30 = [NSString stringWithUTF8String:"-[TSDMatchingAlgorithm p_bestMatchesFromArray:]"];
              uint64_t v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m"];
              v32 = (void *)v29;
              uint64_t v17 = v59;
              [v32 handleFailureInFunction:v30, v31, 502, @"Duplicate match between objects! (%@ is a duplicate of %@)", v26, *((void *)&self->mObjectMapping[v28] + self->mMatrixDimension * v27) file lineNumber description];
            }
            uint64_t v33 = [v26 matchCost];
            mObjectMapping = self->mObjectMapping;
            self->mCostMatrix[v28 + self->mMatrixDimension * v27] = v33;
            *(&mObjectMapping[v28] + self->mMatrixDimension * v27) = v26;
            int64_t v5 = v58;
          }
          uint64_t v24 = [v3 countByEnumeratingWithState:&v68 objects:v79 count:16];
        }
        while (v24);
      }
      int v35 = 1;
      while (2)
      {
        switch(v35)
        {
          case 1:
            int v35 = [(TSDMatchingAlgorithm *)self p_doStep1];
            goto LABEL_51;
          case 2:
            int v35 = [(TSDMatchingAlgorithm *)self p_doStep2];
            goto LABEL_51;
          case 3:
            int v35 = [(TSDMatchingAlgorithm *)self p_doStep3];
            goto LABEL_51;
          case 4:
            int v35 = [(TSDMatchingAlgorithm *)self p_doStep4];
            goto LABEL_51;
          case 5:
            int v35 = [(TSDMatchingAlgorithm *)self p_doStep5];
            goto LABEL_51;
          case 6:
            int v35 = [(TSDMatchingAlgorithm *)self p_doStep6];
LABEL_51:
            if (v35 <= 0) {
              goto LABEL_52;
            }
            continue;
          default:
LABEL_52:
            id v3 = (id)[MEMORY[0x263EFF980] array];
            int64_t v36 = self->mMatrixDimension;
            if (v36 >= 1)
            {
              for (int64_t n = 0; n < v36; ++n)
              {
                if (v36 >= 1)
                {
                  for (iuint64_t i = 0; ii < v36; ++ii)
                  {
                    if (self->mMaskMatrix[n * v36 + ii] == 1 && *((void *)&self->mObjectMapping[ii] + n * v36))
                    {
                      objc_msgSend(v3, "addObject:");
                      int64_t v36 = self->mMatrixDimension;
                    }
                  }
                }
              }
            }
            [(TSDMatchingAlgorithm *)self p_deallocateMatrices];
            v39 = (void *)[v3 sortedArrayUsingComparator:v72];
            [v3 removeAllObjects];
            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            uint64_t v40 = [v39 countByEnumeratingWithState:&v64 objects:v78 count:16];
            if (!v40) {
              return v3;
            }
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v65;
            break;
        }
        break;
      }
      do
      {
        for (juint64_t j = 0; jj != v41; ++jj)
        {
          if (*(void *)v65 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v64 + 1) + 8 * jj);
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          uint64_t v45 = [v3 countByEnumeratingWithState:&v60 objects:v77 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v61;
LABEL_68:
            uint64_t v48 = 0;
            while (1)
            {
              if (*(void *)v61 != v47) {
                objc_enumerationMutation(v3);
              }
              if ([*(id *)(*((void *)&v60 + 1) + 8 * v48) conflictsWithMatch:v44]) {
                break;
              }
              if (v46 == ++v48)
              {
                uint64_t v46 = [v3 countByEnumeratingWithState:&v60 objects:v77 count:16];
                if (v46) {
                  goto LABEL_68;
                }
                goto LABEL_74;
              }
            }
          }
          else
          {
LABEL_74:
            [v3 addObject:v44];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v64 objects:v78 count:16];
      }
      while (v41);
    }
  }
  return v3;
}

uint64_t __47__TSDMatchingAlgorithm_p_bestMatchesFromArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = [a2 matchCost];
  if (v6 < [a3 matchCost]) {
    return -1;
  }
  uint64_t v8 = [a2 matchCost];
  if (v8 > [a3 matchCost]) {
    return 1;
  }
  unint64_t v9 = [*(id *)(a1 + 32) indexOfObject:a2];
  unint64_t v10 = [*(id *)(a1 + 32) indexOfObject:a3];
  uint64_t v11 = -1;
  if (v9 >= v10) {
    uint64_t v11 = 1;
  }
  if (v9 == v10) {
    return 0;
  }
  else {
    return v11;
  }
}

+ (id)bestMatchesFromArray:(id)a3
{
  uint64_t v4 = objc_alloc_init(TSDMatchingAlgorithm);
  id v5 = [(TSDMatchingAlgorithm *)v4 p_bestMatchesFromArray:a3];

  return v5;
}

@end