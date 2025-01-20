@interface EDFormula
+ (id)formula;
- (BOOL)addArrayWithCol:(int)a3 andRow:(int)a4;
- (BOOL)addInfixOperator:(int)a3 atIndex:(unsigned int)a4 factor:(double)a5;
- (BOOL)addToken:(int)a3 extendedDataLength:(unsigned int)a4 extendedDataCount:(unsigned int)a5;
- (BOOL)convertLastRefsToArea;
- (BOOL)convertToIntersect:(unsigned int)a3;
- (BOOL)convertToList:(unsigned int)a3;
- (BOOL)convertToList:(unsigned int)a3 withFinalParen:(BOOL)a4;
- (BOOL)convertTokensToSharedAtRow:(unsigned int)a3 column:(unsigned int)a4;
- (BOOL)copyTokenAtIndex:(unsigned int)a3 fromFormula:(id)a4;
- (BOOL)copyTokenFromXlPtg:(XlPtg *)a3;
- (BOOL)fixTableOfConstantsRefs;
- (BOOL)insertExternalName:(unint64_t)a3 withLink:(unint64_t)a4 atIndex:(unsigned int)a5;
- (BOOL)insertName:(unint64_t)a3 atIndex:(unsigned int)a4;
- (BOOL)isBaseFormula;
- (BOOL)isCleaned;
- (BOOL)isCleanedWithEvaluationStack;
- (BOOL)isContainsRelativeReferences;
- (BOOL)isSharedFormula;
- (BOOL)isSupportedFormula;
- (BOOL)removeTokenAtIndex:(unsigned int)a3;
- (BOOL)replaceTokenAtIndex:(unsigned int)a3 withFormula:(id)a4;
- (BOOL)replaceTokenAtIndex:(unsigned int)a3 withFormula:(id)a4 formulaTokenIndex:(unsigned int)a5;
- (BOOL)setupTokensWithTokensCount:(unsigned int)a3 tokensWithDataCount:(unsigned int)a4 extendedDataLength:(unsigned int)a5 extendedDataCount:(unsigned int)a6;
- (BOOL)shrinkSpanningRefAtArgIndex:(unsigned int)a3;
- (BOOL)uppercaseArgAtIndex:(unsigned int)a3;
- (BOOL)wrapArgumentsWithOperator:(int)a3 argumentCount:(unsigned int)a4 atIndex:(unsigned int)a5;
- (EDFormula)init;
- (EDFormula)initWithFormula:(id)a3;
- (EDToken)tokenAtIndex:(unsigned int)a3;
- (NSString)description;
- (char)addToken:(int)a3 extendedDataLength:(unsigned int)a4;
- (char)extendedDataForTokenAtIndex:(unsigned int)a3 extendedDataIndex:(unsigned int)a4 length:(unsigned int *)a5;
- (char)lastExtendedDataForTokenAtIndex:(unsigned int)a3 length:(unsigned int *)a4;
- (char)setExtendedDataAtIndex:(unsigned int)a3 extendedDataIndex:(unsigned int)a4 length:(unsigned int)a5;
- (char)setExtendedDataForLastTokenAtIndex:(unsigned int)a3 length:(unsigned int)a4;
- (id)lastTokenRefOrArea3dLinkRefIsValid:(BOOL *)a3 withEDLinks:(id)a4;
- (id)originalFormulaString;
- (id)saveArgs:(unsigned int)a3 andDelete:(BOOL)a4;
- (id)warning;
- (id)warningParameter;
- (int)tokenTypeAtIndex:(unsigned int)a3;
- (int)warningType;
- (unsigned)countExtendedDataForTokenAtIndex:(unsigned int)a3;
- (unsigned)firstTokenIndexForArgAtIndex:(unsigned int)a3;
- (unsigned)tokenCount;
- (void)archiveByAppendingToMutableData:(__CFData *)a3;
- (void)dealloc;
- (void)populateXlPtg:(XlPtg *)a3 index:(unsigned int)a4;
- (void)removeAllTokens;
- (void)replaceTokenTypeAtIndex:(unsigned int)a3 withType:(int)a4;
- (void)setCleaned:(BOOL)a3;
- (void)setOriginalFormulaString:(id)a3;
- (void)setWarning:(int)a3;
- (void)setWarningParameter:(id)a3;
- (void)setupExtendedDataForTokenAtIndex:(unsigned int)a3 extendedDataLength:(unsigned int)a4 extendedDataCount:(unsigned int)a5;
- (void)unarchiveFromData:(__CFData *)a3 offset:(unint64_t *)a4;
- (void)updateCleanedWithEvaluationStack:(BOOL)a3;
- (void)updateContainsRelativeReferences:(BOOL)a3;
- (void)xlPtgs;
@end

@implementation EDFormula

+ (id)formula
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (EDFormula)init
{
  v5.receiver = self;
  v5.super_class = (Class)EDFormula;
  id v2 = [(EDFormula *)&v5 init];
  v3 = v2;
  if (v2) {
    [(EDFormula *)v2 setupTokensWithTokensCount:0 tokensWithDataCount:0 extendedDataLength:0 extendedDataCount:0];
  }
  return v3;
}

- (BOOL)setupTokensWithTokensCount:(unsigned int)a3 tokensWithDataCount:(unsigned int)a4 extendedDataLength:(unsigned int)a5 extendedDataCount:(unsigned int)a6
{
  mPackedData = self->mPackedData;
  Mutable = (unsigned __int16 *)mPackedData;
  if (!mPackedData)
  {
    Mutable = (unsigned __int16 *)CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    self->mPackedData = (__CFData *)Mutable;
  }
  unsigned int v13 = 6 * a3;
  unsigned int v14 = v13 + 4 * a4 + 2 * a6 + a5 + 20;
  if (mPackedData)
  {
    if (!Mutable) {
      return (char)Mutable;
    }
    Mutable = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)Mutable);
    if (!Mutable) {
      return (char)Mutable;
    }
    unsigned int v15 = *Mutable + Mutable[2] + *(_DWORD *)(Mutable + 5) + 20;
    BOOL v16 = v14 >= v15;
    unsigned int v17 = v14 - v15;
    if (v16) {
      unsigned int v14 = v17;
    }
    else {
      unsigned int v14 = 0;
    }
    Mutable = (unsigned __int16 *)self->mPackedData;
  }
  CFDataIncreaseLength((CFMutableDataRef)Mutable, v14);
  Mutable = (unsigned __int16 *)self->mPackedData;
  if (Mutable)
  {
    Mutable = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)Mutable);
    if (Mutable)
    {
      if (!mPackedData)
      {
        unsigned __int16 *Mutable = 0;
        *((unsigned char *)Mutable + 2) = 0;
        Mutable[2] = 0;
      }
      *(_DWORD *)(Mutable + 7) = v13;
      *(_DWORD *)(Mutable + 5) = v13;
      *(_DWORD *)(Mutable + 3) = 0;
      *((unsigned char *)Mutable + 18) &= 0xF8u;
      LOBYTE(Mutable) = 1;
    }
  }
  return (char)Mutable;
}

- (BOOL)copyTokenFromXlPtg:(XlPtg *)a3
{
  if (a3)
  {
    uint64_t NumberOfExtendedDataEntries = XlPtg::getNumberOfExtendedDataEntries(a3);
    LODWORD(mPackedData) = [(EDFormula *)self addToken:a3->var1 extendedDataLength:XlPtg::getTotalSizeOfExtendedData(a3) extendedDataCount:NumberOfExtendedDataEntries];
    if (mPackedData)
    {
      mPackedData = (char *)self->mPackedData;
      if (mPackedData)
      {
        mPackedData = (char *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
        if (mPackedData)
        {
          if (NumberOfExtendedDataEntries)
          {
            uint64_t v7 = 0;
            uint64_t v8 = (*(_DWORD *)(mPackedData + 6) - 1);
            do
            {
              LODWORD(__n) = 0;
              ExtendedData = XlPtg::getExtendedData(a3, v7, (unsigned int *)&__n);
              if (ExtendedData)
              {
                v10 = ExtendedData;
                v11 = [(EDFormula *)self setExtendedDataAtIndex:v8 extendedDataIndex:v7 length:__n];
                if (v11) {
                  memcpy(v11, v10, __n);
                }
              }
              uint64_t v7 = (v7 + 1);
            }
            while (NumberOfExtendedDataEntries != v7);
          }
          LOBYTE(mPackedData) = 1;
        }
      }
    }
  }
  else
  {
    LOBYTE(mPackedData) = 1;
  }
  return (char)mPackedData;
}

- (BOOL)addToken:(int)a3 extendedDataLength:(unsigned int)a4 extendedDataCount:(unsigned int)a5
{
  mPackedData = (unsigned __int16 *)self->mPackedData;
  if (mPackedData)
  {
    __int16 v9 = a3;
    mPackedData = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
    {
      v10 = mPackedData;
      unsigned int v11 = 2 * a5 + 4;
      if (!a5) {
        unsigned int v11 = 0;
      }
      unsigned int v12 = v11 + a4;
      uint64_t v13 = *mPackedData;
      uint64_t v14 = mPackedData[2];
      unsigned int v15 = (char *)mPackedData + v13 + v14;
      uint64_t v16 = (v13 + v14 + 20);
      unint64_t v17 = &v15[6 * *(unsigned int *)(mPackedData + 3)] - ((char *)mPackedData + v16) + 26;
      unint64_t v18 = *(unsigned int *)(mPackedData + 7);
      if (v17 <= v18) {
        CFIndex v19 = v12;
      }
      else {
        CFIndex v19 = v12 + 6;
      }
      unsigned int v20 = v16 + *(_DWORD *)(mPackedData + 5) + v19;
      if (v20 <= CFDataGetLength(self->mPackedData)
        || (CFDataIncreaseLength(self->mPackedData, v19),
            mPackedData = (unsigned __int16 *)CFDataGetMutableBytePtr(self->mPackedData),
            (v10 = mPackedData) != 0))
      {
        if (v17 > v18)
        {
          int v21 = *v10 + v10[2] + 20;
          memmove((char *)v10 + (v21 + *(_DWORD *)(v10 + 7)) + 6, (char *)v10 + (v21 + *(_DWORD *)(v10 + 7)), (*(_DWORD *)(v10 + 5) - *(_DWORD *)(v10 + 7)));
          *(int32x2_t *)(v10 + 5) = vadd_s32(*(int32x2_t *)(v10 + 5), (int32x2_t)0x600000006);
        }
        int v22 = *(_DWORD *)(v10 + 3);
        *(_DWORD *)(v10 + 3) = v22 + 1;
        unint64_t v23 = (unint64_t)&v10[3 * v22] + *v10 + (unint64_t)v10[2];
        *(_WORD *)(v23 + 20) = v9;
        *(_DWORD *)(v23 + 22) = -1;
        if (a5) {
          -[EDFormula setupExtendedDataForTokenAtIndex:extendedDataLength:extendedDataCount:](self, "setupExtendedDataForTokenAtIndex:extendedDataLength:extendedDataCount:");
        }
        LOBYTE(mPackedData) = 1;
      }
    }
  }
  return (char)mPackedData;
}

- (void)setupExtendedDataForTokenAtIndex:(unsigned int)a3 extendedDataLength:(unsigned int)a4 extendedDataCount:(unsigned int)a5
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
    {
      unsigned int v11 = MutableBytePtr;
      unsigned int v12 = *(unsigned __int16 *)MutableBytePtr
          + *((unsigned __int16 *)MutableBytePtr + 2)
          + *(_DWORD *)(MutableBytePtr + 10)
          + 20;
      if (v12 + a4 + 2 * a5 + 4 > CFDataGetLength(self->mPackedData))
      {
        CFDataIncreaseLength(self->mPackedData, a4 + 2 * a5 + 4);
        unsigned int v11 = CFDataGetMutableBytePtr(self->mPackedData);
      }
      uint64_t v13 = &v11[v12];
      *(_WORD *)uint64_t v13 = a4;
      *((_WORD *)v13 + 1) = a5;
      *(_DWORD *)&v11[6 * a3 + 22 + *(unsigned __int16 *)v11 + (unint64_t)*((unsigned __int16 *)v11 + 2)] = v12 - (*(unsigned __int16 *)v11 + *((unsigned __int16 *)v11 + 2) + *(_DWORD *)(v11 + 14)) - 20;
      *(_DWORD *)(v11 + 10) += a4 + 2 * a5 + 4;
      if (a5)
      {
        unsigned int v14 = 0;
        unsigned int v15 = v13 + 6;
        do
        {
          *(v15 - 1) = 0;
          v15 += v14++ < a5 - 1;
        }
        while (a5 != v14);
      }
    }
  }
}

- (char)setExtendedDataAtIndex:(unsigned int)a3 extendedDataIndex:(unsigned int)a4 length:(unsigned int)a5
{
  uint64_t v7 = *(void *)&a3;
  result = -[EDFormula tokenAtIndex:](self, "tokenAtIndex:");
  if (result)
  {
    v10 = result;
    if (*(_DWORD *)(result + 2) == -1) {
      return 0;
    }
    result = (char *)self->mPackedData;
    if (!result) {
      return result;
    }
    result = (char *)CFDataGetMutableBytePtr((CFMutableDataRef)result);
    if (!result) {
      return result;
    }
    uint64_t v11 = *(unsigned int *)(result + 14);
    uint64_t v12 = *(unsigned int *)(v10 + 2);
    uint64_t v13 = &result[v11 + *(unsigned __int16 *)result + *((unsigned __int16 *)result + 2) + v12];
    if (*((unsigned __int16 *)v13 + 11) <= a4) {
      return 0;
    }
    unsigned int v14 = (unsigned __int16 *)(v13 + 20);
    unsigned int v15 = v13 + 26;
    int v16 = 0;
    if (a4)
    {
      unint64_t v17 = v14 + 2;
      unsigned int v18 = a4;
      do
      {
        uint64_t v19 = *v17;
        v16 += v19;
        unint64_t v17 = (_WORD *)((char *)v15 + v19);
        unsigned int v15 = v17 + 1;
        --v18;
      }
      while (v18);
    }
    *(v15 - 1) = a5;
    unsigned int v20 = v16 + a5;
    uint64_t v21 = *v14;
    if (v20 > v21)
    {
      uint64_t v22 = v11
          + v12
          + *(unsigned __int16 *)result
          + *((unsigned __int16 *)result + 2)
          + 24;
      size_t v23 = v21 + 2 * v14[1];
      -[EDFormula setupExtendedDataForTokenAtIndex:extendedDataLength:extendedDataCount:](self, "setupExtendedDataForTokenAtIndex:extendedDataLength:extendedDataCount:", v7);
      MutableBytePtr = CFDataGetMutableBytePtr(self->mPackedData);
      unint64_t v25 = (unint64_t)&MutableBytePtr[*(unsigned __int16 *)MutableBytePtr
                                            + 20
                                            + (unint64_t)*((unsigned __int16 *)MutableBytePtr + 2)];
      unsigned int v14 = (unsigned __int16 *)(v25
                               + *(unsigned int *)(MutableBytePtr + 14)
                               + *(unsigned int *)(v25 + 6 * v7 + 2));
      v26 = v14 + 2;
      memcpy(v14 + 2, &MutableBytePtr[v22], v23);
      unsigned int v15 = v14 + 3;
      if (a4)
      {
        unsigned int v27 = a4;
        do
        {
          v26 = (_WORD *)((char *)v15 + *v26);
          unsigned int v15 = v26 + 1;
          --v27;
        }
        while (v27);
      }
    }
    unsigned int v28 = a4 + 1;
    if (a4 + 1 < v14[1])
    {
      v29 = v15;
      do
      {
        v30 = (_WORD *)((char *)v29 + (unsigned __int16)*(v29 - 1));
        _WORD *v30 = 0;
        v29 = v30 + 1;
        ++v28;
      }
      while (v28 < v14[1]);
    }
    bzero(v15, a5);
    if (a5) {
      return (char *)v15;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (EDToken)tokenAtIndex:(unsigned int)a3
{
  result = (EDToken *)self->mPackedData;
  if (result)
  {
    result = (EDToken *)CFDataGetMutableBytePtr((CFMutableDataRef)result);
    if (result)
    {
      if (*(unsigned int *)((char *)&result->var1 + 2) <= a3) {
        return 0;
      }
      else {
        return (EDToken *)((char *)result + 6 * a3 + result->var0 + (unint64_t)LOWORD(result->var1) + 20);
      }
    }
  }
  return result;
}

- (unsigned)tokenCount
{
  mPackedData = (char *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (char *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData) {
      LODWORD(mPackedData) = *(_DWORD *)(mPackedData + 6);
    }
  }
  return mPackedData;
}

- (int)tokenTypeAtIndex:(unsigned int)a3
{
  v3 = [(EDFormula *)self tokenAtIndex:*(void *)&a3];
  if (v3) {
    LODWORD(v3) = v3->var0;
  }
  return (int)v3;
}

- (char)lastExtendedDataForTokenAtIndex:(unsigned int)a3 length:(unsigned int *)a4
{
  *a4 = 0;
  result = [(EDFormula *)self tokenAtIndex:*(void *)&a3];
  if (result)
  {
    uint64_t v7 = result;
    if (*(_DWORD *)(result + 2) == -1) {
      return 0;
    }
    result = (char *)self->mPackedData;
    if (result)
    {
      result = (char *)CFDataGetMutableBytePtr((CFMutableDataRef)result);
      if (result)
      {
        uint64_t v8 = &result[*(unsigned int *)(result + 14)
                   + *(unsigned __int16 *)result
                   + (unint64_t)*((unsigned __int16 *)result + 2)
                   + *(unsigned int *)(v7 + 2)];
        int v9 = *((unsigned __int16 *)v8 + 11);
        if (*((_WORD *)v8 + 11))
        {
          v10 = v8 + 20;
          uint64_t v11 = *((unsigned __int16 *)v8 + 12);
          result = v10 + 6;
          while (--v9)
          {
            uint64_t v12 = &result[v11];
            unsigned int v13 = *(unsigned __int16 *)v12;
            result = v12 + 2;
            uint64_t v11 = v13;
          }
          *a4 = v11;
          return result;
        }
        return 0;
      }
    }
  }
  return result;
}

- (void)updateContainsRelativeReferences:(BOOL)a3
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    BOOL v4 = a3;
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
    {
      UInt8 v6 = MutableBytePtr[18];
      if (v4 | ((v6 & 2) >> 1)) {
        char v7 = 2;
      }
      else {
        char v7 = 0;
      }
      MutableBytePtr[18] = v7 | v6 & 0xFD;
    }
  }
}

- (void)setCleaned:(BOOL)a3
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr) {
      MutableBytePtr[18] = MutableBytePtr[18] & 0xFE | a3;
    }
  }
}

- (id)warning
{
  if ([(EDFormula *)self warningType]) {
    id v2 = (id)kWarningMessageUnsupportedFormulas;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (int)warningType
{
  mPackedData = (unsigned __int8 *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData) {
      LODWORD(mPackedData) = mPackedData[2];
    }
  }
  return (int)mPackedData;
}

- (BOOL)isContainsRelativeReferences
{
  mPackedData = (unsigned __int8 *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData) {
      LODWORD(mPackedData) = (mPackedData[18] >> 1) & 1;
    }
  }
  return (char)mPackedData;
}

- (EDFormula)initWithFormula:(id)a3
{
  BOOL v4 = (CFDataRef *)a3;
  v7.receiver = self;
  v7.super_class = (Class)EDFormula;
  objc_super v5 = [(EDFormula *)&v7 init];
  if (v5) {
    v5->mPackedData = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v4[1]);
  }

  return v5;
}

- (void)dealloc
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    CFRelease(mPackedData);
    self->mPackedData = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)EDFormula;
  [(EDFormula *)&v4 dealloc];
}

- (BOOL)isSupportedFormula
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (__CFData *)CFDataGetMutableBytePtr(mPackedData);
    if (mPackedData) {
      LOBYTE(mPackedData) = *((unsigned char *)mPackedData + 2) == 0;
    }
  }
  return (char)mPackedData;
}

- (BOOL)isCleaned
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (__CFData *)CFDataGetMutableBytePtr(mPackedData);
    if (mPackedData) {
      LOBYTE(mPackedData) = *((unsigned char *)mPackedData + 18) & 1;
    }
  }
  return (char)mPackedData;
}

- (void)setWarning:(int)a3
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    UInt8 v4 = a3;
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr) {
      MutableBytePtr[2] = v4;
    }
  }
}

- (void)removeAllTokens
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
    {
      *(void *)(MutableBytePtr + 6) = 0;
      *(_DWORD *)(MutableBytePtr + 14) = 0;
      MutableBytePtr[18] &= 0xF8u;
    }
  }
}

- (BOOL)replaceTokenAtIndex:(unsigned int)a3 withFormula:(id)a4 formulaTokenIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  uint64_t v8 = (CFMutableDataRef *)a4;
  mPackedData = self->mPackedData;
  if (mPackedData
    && (MutableBytePtr = CFDataGetMutableBytePtr(mPackedData)) != 0
    && (uint64_t v11 = CFDataGetMutableBytePtr(v8[1])) != 0)
  {
    unint64_t v12 = (unint64_t)&v11[*(unsigned __int16 *)v11 + 20 + (unint64_t)*((unsigned __int16 *)v11 + 2)];
    uint64_t v13 = *(unsigned int *)(v12 + 6 * v5 + 2);
    if (v13 == -1)
    {
      unsigned int v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }
    else
    {
      unsigned int v14 = (unsigned __int16 *)(v12 + *(unsigned int *)(v11 + 14) + v13);
      uint64_t v15 = v14[1];
      uint64_t v16 = *v14;
    }
    uint64_t v18 = *(unsigned __int16 *)MutableBytePtr;
    uint64_t v19 = *((unsigned __int16 *)MutableBytePtr + 2);
    __int16 v20 = [(CFMutableDataRef *)v8 tokenTypeAtIndex:v5];
    uint64_t v21 = (uint64_t)&MutableBytePtr[6 * v6 + v18 + v19];
    *(_WORD *)(v21 + 20) = v20;
    *(_DWORD *)(v21 + 22) = -1;
    [(EDFormula *)self setupExtendedDataForTokenAtIndex:v6 extendedDataLength:v16 extendedDataCount:v15];
    if (v15)
    {
      uint64_t v22 = 0;
      do
      {
        size_t v23 = v14[2];
        if (v22)
        {
          int v24 = v22;
          unint64_t v25 = (char *)(v14 + 3);
          do
          {
            v26 = &v25[v23];
            unsigned int v27 = *(unsigned __int16 *)v26;
            unint64_t v25 = v26 + 2;
            size_t v23 = v27;
            --v24;
          }
          while (v24);
          if (v23)
          {
LABEL_16:
            unsigned int v28 = [(EDFormula *)self setExtendedDataAtIndex:v6 extendedDataIndex:v22 length:v23];
            if (v28) {
              memcpy(v28, v25, v23);
            }
          }
        }
        else
        {
          unint64_t v25 = (char *)(v14 + 3);
          if (v14[2]) {
            goto LABEL_16;
          }
        }
        uint64_t v22 = (v22 + 1);
      }
      while (v22 != v15);
    }
    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)isCleanedWithEvaluationStack
{
  mPackedData = (unsigned __int8 *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData) {
      LODWORD(mPackedData) = (mPackedData[18] >> 2) & 1;
    }
  }
  return (char)mPackedData;
}

- (void)updateCleanedWithEvaluationStack:(BOOL)a3
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    BOOL v4 = a3;
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
    {
      UInt8 v6 = MutableBytePtr[18];
      if (v4 | ((v6 & 4) >> 2)) {
        char v7 = 4;
      }
      else {
        char v7 = 0;
      }
      MutableBytePtr[18] = v7 | v6 & 0xFB;
    }
  }
}

- (char)addToken:(int)a3 extendedDataLength:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (![(EDFormula *)self addToken:*(void *)&a3 extendedDataLength:*(void *)&a4 extendedDataCount:a4 != 0])return 0; {
  mPackedData = self->mPackedData;
  }
  if (!mPackedData) {
    return 0;
  }
  MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
  if (!MutableBytePtr) {
    return 0;
  }
  uint64_t v8 = (*(_DWORD *)(MutableBytePtr + 6) - 1);
  return [(EDFormula *)self setExtendedDataAtIndex:v8 extendedDataIndex:0 length:v4];
}

- (BOOL)copyTokenAtIndex:(unsigned int)a3 fromFormula:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  UInt8 v6 = (__CFData **)a4;
  char v7 = v6;
  if (v6)
  {
    uint64_t v8 = v6[1];
    if (v8)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(v8);
      if (MutableBytePtr)
      {
        unint64_t v10 = (unint64_t)&MutableBytePtr[*(unsigned __int16 *)MutableBytePtr
                                              + 20
                                              + (unint64_t)*((unsigned __int16 *)MutableBytePtr + 2)];
        uint64_t v11 = *(unsigned int *)(v10 + 6 * v4 + 2);
        if (v11 == -1)
        {
          unint64_t v12 = 0;
          uint64_t v13 = 0;
          uint64_t v14 = 0;
        }
        else
        {
          unint64_t v12 = (unsigned __int16 *)(v10 + *(unsigned int *)(MutableBytePtr + 14) + v11);
          uint64_t v13 = v12[1];
          uint64_t v14 = *v12;
        }
        if (!-[EDFormula addToken:extendedDataLength:extendedDataCount:](self, "addToken:extendedDataLength:extendedDataCount:", [v7 tokenTypeAtIndex:v4], v14, v13)|| (mPackedData = self->mPackedData) == 0|| (uint64_t v16 = CFDataGetMutableBytePtr(mPackedData)) == 0)
        {
          BOOL v25 = 0;
          goto LABEL_24;
        }
        if (v13)
        {
          uint64_t v17 = 0;
          uint64_t v18 = (*(_DWORD *)(v16 + 6) - 1);
          while (1)
          {
            size_t v19 = v12[2];
            if (v17)
            {
              int v20 = v17;
              uint64_t v21 = (char *)(v12 + 3);
              do
              {
                uint64_t v22 = &v21[v19];
                unsigned int v23 = *(unsigned __int16 *)v22;
                uint64_t v21 = v22 + 2;
                size_t v19 = v23;
                --v20;
              }
              while (v20);
              if (v19)
              {
LABEL_18:
                int v24 = [(EDFormula *)self setExtendedDataAtIndex:v18 extendedDataIndex:v17 length:v19];
                if (v24) {
                  memcpy(v24, v21, v19);
                }
              }
            }
            else
            {
              uint64_t v21 = (char *)(v12 + 3);
              if (v12[2]) {
                goto LABEL_18;
              }
            }
            uint64_t v17 = (v17 + 1);
            BOOL v25 = 1;
            if (v17 == v13) {
              goto LABEL_24;
            }
          }
        }
      }
    }
  }
  BOOL v25 = 1;
LABEL_24:

  return v25;
}

- (void)setOriginalFormulaString:(id)a3
{
  id v4 = a3;
  if (!((unint64_t)[v4 length] >> 16))
  {
    mPackedData = self->mPackedData;
    if (mPackedData)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
      if (MutableBytePtr)
      {
        int v7 = *(unsigned __int16 *)MutableBytePtr;
        __int16 v9 = 0;
        +[ECPackedDataUtils writeString:toPackedData:packedDataSize:atIndex:withPreviousLength:outLength:](ECPackedDataUtils, "writeString:toPackedData:packedDataSize:atIndex:withPreviousLength:outLength:", v4, self->mPackedData, v7 + *((unsigned __int16 *)MutableBytePtr + 2) + *(_DWORD *)(MutableBytePtr + 10) + 20, 20);
        uint64_t v8 = CFDataGetMutableBytePtr(self->mPackedData);
        *(_WORD *)uint64_t v8 = v9;
      }
    }
  }
}

- (id)originalFormulaString
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (__CFData *)CFDataGetMutableBytePtr(mPackedData);
    if (mPackedData)
    {
      mPackedData = +[ECPackedDataUtils readStringFromData:mPackedData atOffset:20 withLength:*(unsigned __int16 *)mPackedData];
    }
  }
  return mPackedData;
}

- (void)setWarningParameter:(id)a3
{
  id v4 = a3;
  if (!((unint64_t)[v4 length] >> 16))
  {
    mPackedData = self->mPackedData;
    if (mPackedData)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
      if (MutableBytePtr)
      {
        int v7 = *((unsigned __int16 *)MutableBytePtr + 2);
        int v8 = *(unsigned __int16 *)MutableBytePtr + 20;
        __int16 v10 = 0;
        +[ECPackedDataUtils writeString:toPackedData:packedDataSize:atIndex:withPreviousLength:outLength:](ECPackedDataUtils, "writeString:toPackedData:packedDataSize:atIndex:withPreviousLength:outLength:", v4, self->mPackedData, (v8 + v7 + *(_DWORD *)(MutableBytePtr + 10)));
        __int16 v9 = CFDataGetMutableBytePtr(self->mPackedData);
        *((_WORD *)v9 + 2) = v10;
      }
    }
  }
}

- (BOOL)removeTokenAtIndex:(unsigned int)a3
{
  mPackedData = (unsigned __int16 *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
    {
      uint64_t v5 = mPackedData;
      unsigned int v6 = *(_DWORD *)(mPackedData + 3);
      if (v6 <= a3)
      {
        LOBYTE(mPackedData) = 0;
      }
      else
      {
        unint64_t v7 = (unint64_t)mPackedData + *mPackedData + (unint64_t)mPackedData[2] + 20;
        unint64_t v8 = v7 + 6 * a3;
        uint64_t v9 = *(unsigned int *)(v8 + 2);
        if (v9 == -1) {
          __int16 v10 = 0;
        }
        else {
          __int16 v10 = (unsigned __int16 *)(v7 + *(unsigned int *)(v5 + 7) + v9);
        }
        int v11 = v6 - 1;
        if (v11 != a3)
        {
          memmove((void *)v8, (const void *)(v8 + 6), 6 * (v11 - a3));
          int v11 = *(_DWORD *)(v5 + 3) - 1;
        }
        *(_DWORD *)(v5 + 3) = v11;
        if (v10)
        {
          uint64_t v12 = *v10 + 2 * v10[1] + 4;
          int v13 = *(_DWORD *)(v5 + 5);
          if ((char *)v5 + *v5 + v5[2] + v13 + 20 == (char *)v10 + v12) {
            *(_DWORD *)(v5 + 5) = v13 - v12;
          }
        }
        LOBYTE(mPackedData) = 1;
      }
    }
  }
  return (char)mPackedData;
}

- (BOOL)addArrayWithCol:(int)a3 andRow:(int)a4
{
  [(EDFormula *)self addToken:96 extendedDataLength:8 extendedDataCount:(a3 + 1 + (a3 + 1) * a4 + 2)];
  unint64_t v7 = [(EDFormula *)self setExtendedDataForLastTokenAtIndex:0 length:4];
  unint64_t v8 = [(EDFormula *)self setExtendedDataForLastTokenAtIndex:1 length:4];
  if (a3 <= 255) {
    int v9 = a3;
  }
  else {
    int v9 = 0;
  }
  *(_DWORD *)unint64_t v7 = v9;
  *(_DWORD *)unint64_t v8 = a4;
  return 1;
}

- (char)setExtendedDataForLastTokenAtIndex:(unsigned int)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = [(EDFormula *)self tokenCount] - 1;
  return [(EDFormula *)self setExtendedDataAtIndex:v7 extendedDataIndex:v5 length:v4];
}

- (char)extendedDataForTokenAtIndex:(unsigned int)a3 extendedDataIndex:(unsigned int)a4 length:(unsigned int *)a5
{
  *a5 = 0;
  result = [(EDFormula *)self tokenAtIndex:*(void *)&a3];
  if (result)
  {
    int v9 = result;
    if (*(_DWORD *)(result + 2) == -1) {
      return 0;
    }
    result = (char *)self->mPackedData;
    if (result)
    {
      result = (char *)CFDataGetMutableBytePtr((CFMutableDataRef)result);
      if (result)
      {
        __int16 v10 = &result[*(unsigned int *)(result + 14)
                    + *(unsigned __int16 *)result
                    + (unint64_t)*((unsigned __int16 *)result + 2)
                    + *(unsigned int *)(v9 + 2)];
        if (*((_WORD *)v10 + 11)) {
          BOOL v11 = *((unsigned __int16 *)v10 + 11) > a4;
        }
        else {
          BOOL v11 = 0;
        }
        if (!v11) {
          return 0;
        }
        uint64_t v12 = v10 + 20;
        uint64_t v13 = *((unsigned __int16 *)v10 + 12);
        for (result = v12 + 6; a4; --a4)
        {
          uint64_t v14 = &result[v13];
          unsigned int v15 = *(unsigned __int16 *)v14;
          result = v14 + 2;
          uint64_t v13 = v15;
        }
        *a5 = v13;
      }
    }
  }
  return result;
}

- (void)replaceTokenTypeAtIndex:(unsigned int)a3 withType:(int)a4
{
  unsigned __int16 v4 = a4;
  uint64_t v5 = [(EDFormula *)self tokenAtIndex:*(void *)&a3];
  if (v5) {
    v5->var0 = v4;
  }
}

- (unsigned)countExtendedDataForTokenAtIndex:(unsigned int)a3
{
  mPackedData = [(EDFormula *)self tokenAtIndex:*(void *)&a3];
  if (mPackedData)
  {
    uint64_t v5 = mPackedData;
    if (*(_DWORD *)(&mPackedData->var0 + 1) == -1)
    {
      LODWORD(mPackedData) = 0;
    }
    else
    {
      mPackedData = (EDToken *)self->mPackedData;
      if (mPackedData)
      {
        mPackedData = (EDToken *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
        if (mPackedData) {
          LODWORD(mPackedData) = *(unsigned __int16 *)((char *)&mPackedData[2].var1
        }
                                                     + *(unsigned int *)((char *)&mPackedData[1].var1 + 2)
                                                     + mPackedData->var0
                                                     + (unint64_t)LOWORD(mPackedData->var1)
                                                     + *(unsigned int *)(&v5->var0 + 1)
                                                     + 2);
      }
    }
  }
  return mPackedData;
}

- (BOOL)replaceTokenAtIndex:(unsigned int)a3 withFormula:(id)a4
{
  id v6 = a4;
  if ([(EDFormula *)self tokenCount] <= a3
    || ([(EDFormula *)self warning], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    BOOL v8 = 0;
  }
  else
  {
    __int16 v10 = objc_alloc_init(EDFormula);
    if (!v10) {
      goto LABEL_24;
    }
    if (a3)
    {
      BOOL v11 = 0;
      uint64_t v12 = 0;
      do
      {
        if (![(EDFormula *)v10 copyTokenAtIndex:v12 fromFormula:self]) {
          break;
        }
        uint64_t v12 = (v12 + 1);
        BOOL v11 = v12 >= a3;
      }
      while (a3 != v12);
    }
    else
    {
      BOOL v11 = 1;
    }
    uint64_t v13 = 0;
    while ((v11 & (v13 < [v6 tokenCount])) != 0)
    {
      BOOL v14 = [(EDFormula *)v10 copyTokenAtIndex:v13 fromFormula:v6];
      uint64_t v13 = (v13 + 1);
      if (!v14)
      {
        BOOL v11 = 0;
        break;
      }
    }
    uint64_t v15 = a3 + 1;
    while ((v11 & (v15 < [(EDFormula *)self tokenCount])) != 0)
    {
      BOOL v16 = [(EDFormula *)v10 copyTokenAtIndex:v15 fromFormula:self];
      uint64_t v15 = (v15 + 1);
      if (!v16) {
        goto LABEL_24;
      }
    }
    if (v11)
    {
      mPackedData = self->mPackedData;
      if (mPackedData) {
        CFRelease(mPackedData);
      }
      MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v10->mPackedData);
      self->mPackedData = MutableCopy;
      BOOL v8 = MutableCopy != 0;
    }
    else
    {
LABEL_24:
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (void)populateXlPtg:(XlPtg *)a3 index:(unsigned int)a4
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    uint64_t v6 = *(void *)&a4;
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (a3)
    {
      int v9 = MutableBytePtr;
      if (MutableBytePtr)
      {
        XlPtg::XlPtg(a3);
        __int16 v10 = [(EDFormula *)self tokenAtIndex:v6];
        if (v10)
        {
          a3->var1 = v10->var0;
          uint64_t v11 = *(unsigned int *)(&v10->var0 + 1);
          if (v11 != -1)
          {
            uint64_t v12 = &v9[*(unsigned int *)(v9 + 14)
                    + *(unsigned __int16 *)v9
                    + (unint64_t)*((unsigned __int16 *)v9 + 2)
                    + v11];
            int v14 = *((unsigned __int16 *)v12 + 10);
            uint64_t v13 = (char *)(v12 + 20);
            if (v14)
            {
              unsigned __int16 v15 = *((_WORD *)v13 + 1);
              if (v15)
              {
                XlPtg::setExtendedData(a3, v13 + 4, v15);
              }
            }
          }
        }
      }
    }
  }
}

- (void)xlPtgs
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
    {
      if (*(_DWORD *)(MutableBytePtr + 6)) {
        operator new();
      }
    }
  }
  return 0;
}

- (BOOL)convertTokensToSharedAtRow:(unsigned int)a3 column:(unsigned int)a4
{
  mPackedData = (unsigned __int16 *)self->mPackedData;
  if (mPackedData)
  {
    char v5 = a4;
    __int16 v6 = a3;
    mPackedData = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
    {
      uint64_t v7 = mPackedData;
      uint64_t v8 = *(unsigned int *)(mPackedData + 3);
      if (!v8)
      {
        LOBYTE(mPackedData) = 0;
        return (char)mPackedData;
      }
      uint64_t v9 = 0;
      uint64_t v10 = 6 * v8;
      while (1)
      {
        uint64_t v11 = (char *)v7 + *v7 + (unint64_t)v7[2];
        uint64_t v12 = &v11[v9];
        uint64_t v13 = *(unsigned int *)&v11[v9 + 22];
        if (v13 == -1) {
          goto LABEL_19;
        }
        int v14 = &v11[*(unsigned int *)(v7 + 7) + 20 + v13];
        if (!*(_WORD *)v14 || !*((_WORD *)v14 + 1)) {
          goto LABEL_19;
        }
        unsigned __int16 v15 = v14 + 6;
        unsigned int v16 = *((unsigned __int16 *)v12 + 10);
        if (v16 <= 0x44) {
          break;
        }
        switch(v16)
        {
          case 'e':
            goto LABEL_16;
          case 'd':
            goto LABEL_17;
          case 'E':
            goto LABEL_16;
        }
LABEL_19:
        v9 += 6;
        if (v10 == v9)
        {
          LOBYTE(mPackedData) = 1;
          return (char)mPackedData;
        }
      }
      if (v16 == 36)
      {
LABEL_17:
        uint64_t v17 = 8;
      }
      else if (v16 == 37)
      {
LABEL_16:
        adjustRowAndColumn(v15, (unsigned __int16 *)v14 + 5, v6, v5);
        unsigned __int16 v15 = v14 + 8;
        uint64_t v17 = 12;
      }
      else
      {
        uint64_t v17 = 8;
        if (v16 != 68) {
          goto LABEL_19;
        }
      }
      adjustRowAndColumn(v15, (unsigned __int16 *)&v14[v17], v6, v5);
      *((_WORD *)v12 + 10) = v16 + 8;
      goto LABEL_19;
    }
  }
  return (char)mPackedData;
}

- (id)warningParameter
{
  mPackedData = (unsigned __int16 *)self->mPackedData;
  if (mPackedData)
  {
    mPackedData = (unsigned __int16 *)CFDataGetMutableBytePtr((CFMutableDataRef)mPackedData);
    if (mPackedData)
    {
      mPackedData = +[ECPackedDataUtils readStringFromData:mPackedData atOffset:*mPackedData + 20 withLength:mPackedData[2]];
    }
  }
  return mPackedData;
}

- (BOOL)isSharedFormula
{
  return 0;
}

- (BOOL)isBaseFormula
{
  return 0;
}

- (unsigned)firstTokenIndexForArgAtIndex:(unsigned int)a3
{
  id v3 = +[EDTokenTree buildSubtree:*(void *)&a3 formula:self];
  if (v3)
  {
    while (1)
    {
      unsigned __int16 v4 = [v3 firstChild];

      if (!v4) {
        break;
      }
      id v5 = v4;

      id v3 = v5;
    }
  }
  unsigned int v6 = [v3 tokenIndex];

  return v6;
}

- (id)saveArgs:(unsigned int)a3 andDelete:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    uint64_t v7 = +[EDFormula formula];
    unsigned int v8 = [(EDFormula *)self tokenCount];
    LODWORD(v9) = v8;
    if (v8)
    {
      int v10 = 0;
      unsigned int v11 = v8 - 1;
      int v12 = v8 - 1;
      while (1)
      {
        uint64_t v13 = [(EDFormula *)self firstTokenIndexForArgAtIndex:v12 - (v10 != 0)];
        int v12 = v13;
        if (!v13) {
          break;
        }
        if (a3 == ++v10)
        {
          if (v13 > v11) {
            goto LABEL_9;
          }
          break;
        }
      }
      uint64_t v14 = v13;
      do
      {
        [v7 copyTokenAtIndex:v14 fromFormula:self];
        uint64_t v14 = (v14 + 1);
      }
      while (v9 != v14);
LABEL_9:
      if (v4 && (int)v11 >= v12)
      {
        do
        {
          uint64_t v9 = (v9 - 1);
          [(EDFormula *)self removeTokenAtIndex:v9];
        }
        while ((int)v9 > v12);
      }
      id v15 = v7;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }
  return v15;
}

- (BOOL)insertExternalName:(unint64_t)a3 withLink:(unint64_t)a4 atIndex:(unsigned int)a5
{
  __int16 v5 = a4;
  __int16 v6 = a3;
  if (a5)
  {
    unsigned int v8 = [(EDFormula *)self saveArgs:*(void *)&a5 andDelete:1];
  }
  else
  {
    unsigned int v8 = 0;
  }
  uint64_t v9 = [(EDFormula *)self addToken:57 extendedDataLength:6];
  int v10 = v9;
  if (v9)
  {
    *(_WORD *)uint64_t v9 = v5;
    *((_WORD *)v9 + 1) = v6;
    *((_WORD *)v9 + 2) = 0;
    if (v8)
    {
      int v11 = [v8 tokenCount];
      if (v11)
      {
        uint64_t v12 = 0;
        do
        {
          [(EDFormula *)self copyTokenAtIndex:v12 fromFormula:v8];
          uint64_t v12 = (v12 + 1);
        }
        while (v11 != v12);
      }
    }
  }

  return v10 != 0;
}

- (BOOL)convertToList:(unsigned int)a3
{
  return [(EDFormula *)self convertToList:*(void *)&a3 withFinalParen:1];
}

- (BOOL)convertToList:(unsigned int)a3 withFinalParen:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 > 2)
  {
    unsigned int v8 = [(EDFormula *)self tokenCount];
    if (v8 >= a3)
    {
      unsigned int v10 = v8;
      v41 = 0;
      int v11 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)&v41, 1uLL);
      uint64_t v12 = v10 - 1;
      *(_DWORD *)int v11 = v12;
      __p = v11;
      v41 = &v11[4 * v13];
      v40 = v11 + 4;
      while (1)
      {
        unsigned int v14 = [(EDFormula *)self firstTokenIndexForArgAtIndex:v12];
        id v15 = v40;
        if (!v14) {
          break;
        }
        uint64_t v12 = v14 - 1;
        if (v40 >= v41)
        {
          uint64_t v17 = __p;
          uint64_t v18 = (v40 - __p) >> 2;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62) {
            std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v20 = v41 - __p;
          if ((v41 - __p) >> 1 > v19) {
            unint64_t v19 = v20 >> 1;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v19;
          }
          if (v21)
          {
            uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)&v41, v21);
            uint64_t v17 = __p;
            id v15 = v40;
          }
          else
          {
            uint64_t v22 = 0;
          }
          unsigned int v23 = &v22[4 * v18];
          *(_DWORD *)unsigned int v23 = v12;
          unsigned int v16 = v23 + 4;
          while (v15 != v17)
          {
            int v24 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v23 - 1) = v24;
            v23 -= 4;
          }
          __p = v23;
          v41 = &v22[4 * v21];
          if (v17) {
            operator delete(v17);
          }
        }
        else
        {
          *(_DWORD *)v40 = v12;
          unsigned int v16 = v40 + 4;
        }
        v40 = v16;
        BOOL v25 = __p;
        unint64_t v26 = (v16 - __p) >> 2;
        if (v26 >= a3) {
          goto LABEL_32;
        }
      }
      BOOL v25 = __p;
      unint64_t v26 = (v40 - __p) >> 2;
LABEL_32:
      if (v26 == a3)
      {
        unsigned int v27 = +[EDFormula formula];
        unsigned int v28 = v40;
        if (v40 == __p)
        {
          uint64_t v34 = 0;
        }
        else
        {
          int v29 = 0;
          uint64_t v30 = 0;
          int v31 = 0;
          do
          {
            unsigned int v33 = *((_DWORD *)v28 - 1);
            v28 -= 4;
            uint64_t v32 = v33;
            uint64_t v34 = v33;
            if (v29)
            {
              for (unsigned int i = v31 + 1; i < v32; unsigned int i = v36)
              {
                unsigned int v36 = i + 1;
                objc_msgSend(v27, "copyTokenAtIndex:fromFormula:");
              }
              uint64_t v34 = v30;
            }
            [v27 copyTokenAtIndex:v32 fromFormula:self];
            if (++v29 >= 2) {
              [v27 addToken:16 extendedDataLength:0];
            }
            uint64_t v30 = v34;
            int v31 = v32;
          }
          while (v28 != __p);
        }
        if (v34 < v10)
        {
          do
          {
            [(EDFormula *)self removeTokenAtIndex:v34];
            --v10;
          }
          while (v34 != v10);
        }
        int v37 = [v27 tokenCount];
        if (v37)
        {
          uint64_t v38 = 0;
          do
          {
            [(EDFormula *)self copyTokenAtIndex:v38 fromFormula:v27];
            uint64_t v38 = (v38 + 1);
          }
          while (v37 != v38);
        }
        if (v4) {
          char v9 = addOperator(self, 21);
        }
        else {
          char v9 = 1;
        }

        BOOL v25 = __p;
        if (!__p) {
          return v9;
        }
      }
      else
      {
        char v9 = 0;
        if (!v25) {
          return v9;
        }
      }
      operator delete(v25);
      return v9;
    }
    return 0;
  }
  if (a3 == 2) {
    addOperator(self, 16);
  }
  if (!v4) {
    return 1;
  }
  return addOperator(self, 21);
}

- (BOOL)convertLastRefsToArea
{
  unsigned int v3 = [(EDFormula *)self tokenCount];
  int v4 = [(EDFormula *)self tokenTypeAtIndex:v3 - 2];
  uint64_t v5 = v3 - 1;
  int v6 = [(EDFormula *)self tokenTypeAtIndex:v5];
  BOOL v7 = v3 >= 2;
  uint64_t v8 = v3 - 2;
  if (v7 && (v6 == 90 || v6 == 68) && (v4 == 68 || v4 == 90))
  {
    int v15 = 0;
    char v9 = [(EDFormula *)self extendedDataForTokenAtIndex:v8 extendedDataIndex:0 length:&v15];
    unsigned int v10 = [(EDFormula *)self extendedDataForTokenAtIndex:v5 extendedDataIndex:0 length:&v15];
    if (v4 == 90)
    {
      int v11 = refTypeOf(90);
      BOOL v12 = addArea3DOperandFromRef3DExtendedData(self, v11, (unsigned __int16 *)v9, (unsigned __int16 *)v10);
    }
    else
    {
      BOOL v12 = addAreaOperandFromRefExtendedData(self, (unsigned __int16 *)v9, (unsigned __int16 *)v10);
    }
    BOOL v13 = v12;
    [(EDFormula *)self removeTokenAtIndex:v5];
    [(EDFormula *)self removeTokenAtIndex:v8];
  }
  else
  {
    [(EDFormula *)self setWarning:6];
    return 0;
  }
  return v13;
}

- (id)lastTokenRefOrArea3dLinkRefIsValid:(BOOL *)a3 withEDLinks:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(EDFormula *)self tokenCount];
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v8 = v7 - 1;
  int v9 = [(EDFormula *)self tokenTypeAtIndex:v8];
  unsigned int v10 = 0;
  char v11 = v9 - 22;
  if ((v9 - 22) <= 0x2F)
  {
    if (((1 << v11) & 0xC0000000C001) != 0)
    {
LABEL_10:
      if (!a3) {
        goto LABEL_13;
      }
      BOOL v14 = v10 != 0;
      goto LABEL_12;
    }
    if (((1 << v11) & 0x3000000000) != 0)
    {
LABEL_7:
      int v16 = 0;
      BOOL v13 = [(EDFormula *)self extendedDataForTokenAtIndex:v8 extendedDataIndex:0 length:&v16];
      if (v13)
      {
        unsigned int v10 = [v6 referenceAtIndex:*(unsigned __int16 *)v13];
        goto LABEL_10;
      }
LABEL_9:
      unsigned int v10 = 0;
      goto LABEL_10;
    }
  }
  char v12 = v9 - 90;
  if ((v9 - 90) <= 0x21)
  {
    if (((1 << v12) & 0x300000003) != 0) {
      goto LABEL_7;
    }
    if (((1 << v12) & 0xC00) != 0) {
      goto LABEL_10;
    }
  }
  unsigned int v10 = 0;
  if (a3)
  {
    BOOL v14 = 0;
LABEL_12:
    *a3 = v14;
  }
LABEL_13:

  return v10;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDFormula;
  id v2 = [(EDFormula *)&v4 description];
  return (NSString *)v2;
}

- (BOOL)convertToIntersect:(unsigned int)a3
{
  return 0;
}

- (BOOL)shrinkSpanningRefAtArgIndex:(unsigned int)a3
{
  return 0;
}

- (BOOL)addInfixOperator:(int)a3 atIndex:(unsigned int)a4 factor:(double)a5
{
  return 0;
}

- (BOOL)wrapArgumentsWithOperator:(int)a3 argumentCount:(unsigned int)a4 atIndex:(unsigned int)a5
{
  return 0;
}

- (BOOL)fixTableOfConstantsRefs
{
  return 0;
}

- (BOOL)uppercaseArgAtIndex:(unsigned int)a3
{
  return 0;
}

- (BOOL)insertName:(unint64_t)a3 atIndex:(unsigned int)a4
{
  return 0;
}

- (void)unarchiveFromData:(__CFData *)a3 offset:(unint64_t *)a4
{
  if (a3)
  {
    BytePtr = CFDataGetBytePtr(a3);
    if (BytePtr)
    {
      unsigned int v7 = BytePtr;
      CFDataSetLength(self->mPackedData, 0);
      uint64_t v8 = &v7[*a4];
      CFIndex v9 = *(unsigned __int16 *)v8 + *((unsigned __int16 *)v8 + 2) + *(_DWORD *)(v8 + 10) + 20;
      CFDataAppendBytes(self->mPackedData, v8, v9);
      *a4 += v9;
    }
  }
}

- (void)archiveByAppendingToMutableData:(__CFData *)a3
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    if (MutableBytePtr)
    {
      CFIndex v6 = *(unsigned __int16 *)MutableBytePtr
         + *((unsigned __int16 *)MutableBytePtr + 2)
         + *(_DWORD *)(MutableBytePtr + 10)
         + 20;
      CFDataAppendBytes(a3, MutableBytePtr, v6);
    }
  }
}

@end