@interface CRLineWrappingContext
+ (BOOL)_usesWordTokensForLocale:(uint64_t)a1;
- (BOOL)active;
- (BOOL)classifierShouldCorrectOverwrappingWithEvaluation:(int64_t)a3 correctionMode:(int64_t)a4;
- (BOOL)classifierShouldInsertLineBreakForEvaluationResult:(id)a3 threshold:(float)a4;
- (BOOL)isClassifierAvailable;
- (BOOL)isRTL;
- (BOOL)isValidWordString:(id)a3;
- (BOOL)shouldAllowWhitespaceDelimiterForString:(id)a3;
- (BOOL)shouldConsiderLetterCase;
- (BOOL)usesWordTokens;
- (CRLineWrappable)lastFeature;
- (CRLineWrappingContext)initWithLocale:(id)a3;
- (NSArray)contextResults;
- (NSString)locale;
- (NSString)text;
- (double)averageLineHeight;
- (double)averageVerticalSpacing;
- (double)charLMScoreByAddingString:(id)a3 eosScore:(double *)a4;
- (double)wordLMScoreByAddingToken:(unsigned int)a3;
- (double)wordLMScoreByAddingTokens:(const void *)a3;
- (id).cxx_construct;
- (unint64_t)lineCount;
- (vector<unsigned)tokenizeStringIntoWords:(CRLineWrappingContext *)self;
- (void)addResult:(id)a3 mergeOversegmentation:(BOOL)a4;
- (void)contextByAddingNewTokens:(void *)a3;
- (void)dealloc;
- (void)resetContext;
- (void)startWithResult:(id)a3 contextSize:(int64_t)a4;
@end

@implementation CRLineWrappingContext

- (CRLineWrappingContext)initWithLocale:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLineWrappingContext;
  v6 = [(CRLineWrappingContext *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    uint64_t v8 = +[CRLanguageResourcesManager lineWrappingManager];
    lrManager = v7->_lrManager;
    v7->_lrManager = (CRLanguageResourcesManager *)v8;

    [(CRLanguageResourcesManager *)v7->_lrManager addSubscriber:v7 forLocale:v5];
    v7->_active = 0;
    if (+[CRLineWrappingClassifier localeIsSupported:v5])
    {
      v10 = [[CRLineWrappingClassifier alloc] initWithLocale:v5];
      classifier = v7->_classifier;
      v7->_classifier = v10;
    }
  }

  return v7;
}

- (NSArray)contextResults
{
  if (self) {
    self = (CRLineWrappingContext *)objc_getProperty(self, a2, 64, 1);
  }
  v2 = (void *)[(CRLineWrappingContext *)self copy];
  return (NSArray *)v2;
}

- (void)startWithResult:(id)a3 contextSize:(int64_t)a4
{
  id v6 = a3;
  if ([(CRLineWrappingContext *)self active])
  {
    v7 = CROSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_FAULT, "Unexpectedly starting an active context", buf, 2u);
    }
  }
  if (self) {
    self->_active = 1;
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v6, 0);
  if (self) {
    objc_setProperty_atomic(self, v8, v9, 64);
  }

  v10 = [v6 paragraphText];
  v12 = v10;
  if (self)
  {
    objc_setProperty_atomic(self, v11, v10, 40);

    self->_contextSize = a4;
  }
  else
  {
  }
  if (+[CRLineWrappingContext _usesWordTokensForLocale:]((uint64_t)CRLineWrappingContext, self->_locale))
  {
    objc_super v13 = [v6 paragraphText];
    [(CRLineWrappingContext *)self tokenizeStringIntoWords:v13];

    [(CRLineWrappingContext *)(uint64_t *)&v16 contextByAddingNewTokens:buf];
    begin = self->_contextTokens.__begin_;
    if (begin)
    {
      self->_contextTokens.__end_ = begin;
      operator delete(begin);
      self->_contextTokens.__begin_ = 0;
      self->_contextTokens.__end_ = 0;
      self->_contextTokens.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&self->_contextTokens.__begin_ = v16;
    self->_contextTokens.__end_cap_.__value_ = v17;
    if (*(void *)buf)
    {
      v19 = *(void **)buf;
      operator delete(*(void **)buf);
    }
  }
  self->_lineCount = 1;
  [v6 featureInTestSize];
  self->_lineHeightSum = v15;
}

+ (BOOL)_usesWordTokensForLocale:(uint64_t)a1
{
  id v2 = a2;
  self;
  BOOL v3 = +[CRImageReader languageIsLatin:v2]
    || +[CRImageReader languageIsCyrillic:v2];

  return v3;
}

- (void)contextByAddingNewTokens:(void *)a3
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    unint64_t v6 = a2[10];
    v7 = (char *)a3[1];
    unint64_t v8 = (uint64_t)&v7[-*a3] >> 2;
    if ((uint64_t)(v6 - v8) < 1)
    {
      uint64_t v13 = 0;
      uint64_t v15 = 0;
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v9 = a2[2];
      uint64_t v10 = v9 - a2[1];
      if (v10)
      {
        unint64_t v11 = v10 >> 2;
        unint64_t v12 = v11 >= v6 - v8 ? v6 - v8 : v11;
        uint64_t v13 = 4 * v12;
        uint64_t v43 = 0;
        __dst = 0;
        uint64_t v45 = 0;
        if (4 * v12)
        {
          std::vector<unsigned int>::__vallocate[abi:ne180100](&v43, v13 >> 2);
          v14 = __dst;
          if (v12) {
            memmove(__dst, (const void *)(v9 - 4 * v12), 4 * v12);
          }
          uint64_t v13 = (uint64_t)v14 + 4 * (v13 >> 2);
          unint64_t v6 = a2[10];
          v7 = (char *)a3[1];
          uint64_t v15 = v45;
          uint64_t v10 = v43;
          unint64_t v8 = (uint64_t)&v7[-*a3] >> 2;
        }
        else
        {
          uint64_t v10 = 0;
          uint64_t v15 = 0;
        }
        *a1 = v10;
        a1[1] = v13;
        a1[2] = v15;
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v15 = 0;
      }
    }
    if (v8 < v6) {
      unint64_t v6 = v8;
    }
    if ((uint64_t)(4 * v6) >= 1)
    {
      long long v16 = &v7[-4 * v6];
      uint64_t v17 = (uint64_t)(4 * v6) >> 2;
      uint64_t v18 = v13 - v10;
      v19 = (char *)(v10 + ((v13 - v10) & 0xFFFFFFFFFFFFFFFCLL));
      if (v17 > (v15 - v13) >> 2)
      {
        unint64_t v20 = v17 + ((v13 - v10) >> 2);
        if (v20 >> 62) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if ((v15 - v10) >> 1 > v20) {
          unint64_t v20 = (v15 - v10) >> 1;
        }
        if ((unint64_t)(v15 - v10) >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v20;
        }
        if (v21) {
          v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), v21);
        }
        else {
          v22 = 0;
        }
        v31 = &v22[4 * (v18 >> 2)];
        v32 = &v31[4 * v17];
        uint64_t v33 = 4 * v17;
        v34 = v31;
        do
        {
          int v35 = *(_DWORD *)v16;
          v16 += 4;
          *(_DWORD *)v34 = v35;
          v34 += 4;
          v33 -= 4;
        }
        while (v33);
        v36 = (char *)*a1;
        if ((char *)*a1 != v19)
        {
          v37 = v19;
          do
          {
            int v38 = *((_DWORD *)v37 - 1);
            v37 -= 4;
            *((_DWORD *)v31 - 1) = v38;
            v31 -= 4;
          }
          while (v37 != v36);
        }
        v39 = &v22[4 * v21];
        v40 = (unsigned char *)a1[1];
        uint64_t v41 = v40 - v19;
        if (v40 != v19) {
          memmove(v32, v19, v40 - v19);
        }
        v42 = (void *)*a1;
        *a1 = (uint64_t)v31;
        a1[1] = (uint64_t)&v32[v41];
        a1[2] = (uint64_t)v39;
        if (v42) {
          operator delete(v42);
        }
        return;
      }
      uint64_t v23 = (v13 - (uint64_t)v19) >> 2;
      if (v23 >= v17)
      {
        v24 = &v16[4 * v17];
        v26 = (char *)v13;
      }
      else
      {
        v24 = &v16[4 * v23];
        int64_t v25 = v7 - v24;
        if (v7 != v24) {
          memmove((void *)v13, &v16[4 * v23], v7 - v24);
        }
        v26 = (char *)(v13 + v25);
        a1[1] = v13 + v25;
        if (v13 - (uint64_t)v19 < 1) {
          return;
        }
      }
      v27 = &v19[4 * v17];
      v28 = (int *)&v26[-4 * v17];
      v29 = v26;
      if ((unint64_t)v28 < v13)
      {
        v29 = v26;
        do
        {
          int v30 = *v28++;
          *(_DWORD *)v29 = v30;
          v29 += 4;
        }
        while ((unint64_t)v28 < v13);
      }
      a1[1] = (uint64_t)v29;
      if (v26 != v27) {
        memmove(&v26[-4 * ((v26 - v27) >> 2)], v19, v26 - v27);
      }
      if (v24 != v16) {
        memmove(v19, v16, v24 - v16);
      }
    }
  }
}

- (void)resetContext
{
  if (self)
  {
    self->_active = 0;
    objc_setProperty_atomic(self, a2, 0, 64);
    objc_setProperty_atomic(self, v3, 0, 40);
  }
  self->_contextTokens.__end_ = self->_contextTokens.__begin_;
  self->_lineCount = 0;
  self->_verticalSpacingSumCount = 0;
  self->_verticalSpacingSum = 0.0;
  self->_lineHeightSum = 0.0;
}

- (double)averageVerticalSpacing
{
  double result = 0.0;
  if (self)
  {
    int64_t verticalSpacingSumCount = self->_verticalSpacingSumCount;
    if (verticalSpacingSumCount >= 1) {
      return self->_verticalSpacingSum / (double)verticalSpacingSumCount;
    }
  }
  return result;
}

- (double)averageLineHeight
{
  if (![(CRLineWrappingContext *)self lineCount]) {
    return 0.0;
  }
  if (self) {
    double lineHeightSum = self->_lineHeightSum;
  }
  else {
    double lineHeightSum = 0.0;
  }
  return lineHeightSum / (double)[(CRLineWrappingContext *)self lineCount];
}

- (void)addResult:(id)a3 mergeOversegmentation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(CRLineWrappingContext *)self active])
  {
    v7 = CROSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v7, OS_LOG_TYPE_FAULT, "Adding result to an inactive context", buf, 2u);
    }
  }
  unint64_t v8 = [v6 featureInTest];
  uint64_t v9 = [v8 locale];
  uint64_t v10 = [v9 languageIdentifier];
  unint64_t v11 = [(CRLineWrappingContext *)self locale];
  char v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = CROSLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [v6 featureInTest];
      uint64_t v15 = [v14 locale];
      long long v16 = [(CRLineWrappingContext *)self locale];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_1DD733000, v13, OS_LOG_TYPE_ERROR, "Attempting to add a feature with locale %@ to a context with locale %@", buf, 0x16u);
    }
  }
  if (v6)
  {
    [v6 featureTokens];
  }
  else
  {
    __p = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
  }
  [(CRLineWrappingContext *)(uint64_t *)buf contextByAddingNewTokens:&__p];
  if (__p)
  {
    uint64_t v41 = __p;
    operator delete(__p);
  }
  if (&self->_contextTokens != (vector<unsigned int, std::allocator<unsigned int>> *)buf) {
    std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)&self->_contextTokens, *(char **)buf, *(uint64_t *)&buf[8], (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 2);
  }
  uint64_t v18 = [v6 paragraphText];
  if (self) {
    objc_setProperty_atomic(self, v17, v18, 40);
  }

  if (([v6 isOversegmented] & v4) != 1) {
    goto LABEL_34;
  }
  id v20 = self ? objc_getProperty(self, v19, 64, 1) : 0;
  unint64_t v21 = [v20 lastObject];
  v22 = [v21 featureInTest];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    if (self) {
      id Property = objc_getProperty(self, v19, 64, 1);
    }
    else {
      id Property = 0;
    }
    v26 = [Property lastObject];
    if (self) {
      id v27 = objc_getProperty(self, v25, 64, 1);
    }
    else {
      id v27 = 0;
    }
    [v27 removeLastObject];
    v29 = [v26 resultByMerging:v6];
    if (self) {
      id v30 = objc_getProperty(self, v28, 64, 1);
    }
    else {
      id v30 = 0;
    }
    [v30 addObject:v29];
    [v29 featureInTestSize];
    double v32 = v31;
    [v26 featureInTestSize];
    if (self) {
      self->_double lineHeightSum = v32 - v33 + self->_lineHeightSum;
    }
    if ([v26 contributesToVerticalSpacing])
    {
      [v29 verticalSpacing];
      double v35 = v34;
      [v26 verticalSpacing];
      if (self) {
        self->_verticalSpacingSum = v35 - v36 + self->_verticalSpacingSum;
      }
    }
  }
  else
  {
LABEL_34:
    if (self) {
      id v37 = objc_getProperty(self, v19, 64, 1);
    }
    else {
      id v37 = 0;
    }
    [v37 addObject:v6];
    ++self->_lineCount;
    [v6 featureInTestSize];
    self->_double lineHeightSum = v38 + self->_lineHeightSum;
    if ([v6 contributesToVerticalSpacing])
    {
      [v6 verticalSpacing];
      self->_verticalSpacingSum = v39 + self->_verticalSpacingSum;
      ++self->_verticalSpacingSumCount;
    }
  }
  if (*(void *)buf)
  {
    *(void *)&uint8_t buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
}

- (CRLineWrappable)lastFeature
{
  if (self) {
    self = (CRLineWrappingContext *)objc_getProperty(self, a2, 64, 1);
  }
  id v2 = [(CRLineWrappingContext *)self lastObject];
  SEL v3 = [v2 featureInTest];

  return (CRLineWrappable *)v3;
}

- (vector<unsigned)tokenizeStringIntoWords:(CRLineWrappingContext *)self
{
  id v6 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x4812000000;
  double v31 = __Block_byref_object_copy__122;
  double v32 = __Block_byref_object_dispose__123;
  double v33 = &unk_1DD8FDA7A;
  double v35 = 0;
  uint64_t v36 = 0;
  double v34 = 0;
  if ([(CRLineWrappingContext *)self usesWordTokens])
  {
    v7 = [v6 stringByAppendingString:@" "];

    size_t v8 = [v7 maximumLengthOfBytesUsingEncoding:4];
    uint64_t v9 = [v7 length];
    int64_t v25 = 0;
    v26 = 0;
    uint64_t v27 = 0;
    if (v8)
    {
      std::vector<unsigned char>::__vallocate[abi:ne180100](&v25, v8);
      uint64_t v10 = (char *)v26 + v8;
      bzero(v26, v8);
      v26 = v10;
      unint64_t v11 = v25;
    }
    else
    {
      uint64_t v10 = 0;
      unint64_t v11 = 0;
    }
    uint64_t v24 = 0;
    objc_msgSend(v7, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v11, v10 - v11, &v24, 4, 0, 0, v9, 0);
    if (self) {
      id Property = objc_getProperty(self, v13, 72, 1);
    }
    else {
      id Property = 0;
    }
    id v15 = Property;
    long long v16 = [(CRLineWrappingContext *)self locale];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3321888768;
    v19[2] = __49__CRLineWrappingContext_tokenizeStringIntoWords___block_invoke;
    v19[3] = &unk_1F38ED6A8;
    unint64_t v21 = 0;
    uint64_t v22 = 0;
    __p = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v25, (uint64_t)v26, (unsigned char *)v26 - (unsigned char *)v25);
    uint64_t v23 = v24;
    v19[4] = &v28;
    [v15 lockResourcesForLocale:v16 sender:self block:v19];

    uint64_t v17 = v29;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    retstr->__begin_ = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(retstr, (const void *)v17[6], v17[7], (v17[7] - v17[6]) >> 2);
    if (__p)
    {
      unint64_t v21 = __p;
      operator delete(__p);
    }
    if (v25)
    {
      v26 = v25;
      operator delete(v25);
    }
  }
  else
  {
    char v12 = v29;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    retstr->__begin_ = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(retstr, (const void *)v12[6], v12[7], (v12[7] - v12[6]) >> 2);
    v7 = v6;
  }
  _Block_object_dispose(&v28, 8);
  if (v34)
  {
    double v35 = v34;
    operator delete(v34);
  }

  return result;
}

void __49__CRLineWrappingContext_tokenizeStringIntoWords___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 wordTokenizer];
  LMStreamTokenizerReset();
  id v3 = v2;
  LMStreamTokenizerPushBytes();
}

void __49__CRLineWrappingContext_tokenizeStringIntoWords___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, int TokenIDForString)
{
  id v6 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
  v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v25 = [v6 stringByTrimmingCharactersInSet:v7];

  if ([v25 length])
  {
    [*(id *)(a1 + 32) wordLanguageModel];
    int v8 = LMLanguageModelTokenIDisUnknown() ^ 1;
    if (!TokenIDForString) {
      LOBYTE(v8) = 0;
    }
    if ((v8 & 1) == 0)
    {
      [*(id *)(a1 + 32) wordLanguageModel];
      TokenIDForString = LMLanguageModelGetTokenIDForString();
      [*(id *)(a1 + 32) wordLanguageModel];
      int v9 = LMLanguageModelTokenIDisUnknown();
      int v10 = TokenIDForString ? v9 : 1;
      if (v10 == 1)
      {
        unint64_t v11 = [v25 lowercaseString];
        [*(id *)(a1 + 32) wordLanguageModel];
        TokenIDForString = LMLanguageModelGetTokenIDForString();
      }
    }
    char v12 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = (char *)v12[7];
    unint64_t v14 = v12[8];
    if ((unint64_t)v13 >= v14)
    {
      long long v16 = (char *)v12[6];
      uint64_t v17 = (v13 - v16) >> 2;
      if ((unint64_t)(v17 + 1) >> 62) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v18 = v14 - (void)v16;
      unint64_t v19 = (uint64_t)(v14 - (void)v16) >> 1;
      if (v19 <= v17 + 1) {
        unint64_t v19 = v17 + 1;
      }
      if (v18 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v19;
      }
      if (v20)
      {
        unint64_t v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v12 + 8), v20);
        long long v16 = (char *)v12[6];
        uint64_t v13 = (char *)v12[7];
      }
      else
      {
        unint64_t v21 = 0;
      }
      uint64_t v22 = &v21[4 * v17];
      uint64_t v23 = &v21[4 * v20];
      *(_DWORD *)uint64_t v22 = TokenIDForString;
      id v15 = v22 + 4;
      while (v13 != v16)
      {
        int v24 = *((_DWORD *)v13 - 1);
        v13 -= 4;
        *((_DWORD *)v22 - 1) = v24;
        v22 -= 4;
      }
      v12[6] = v22;
      v12[7] = v15;
      v12[8] = v23;
      if (v16) {
        operator delete(v16);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v13 = TokenIDForString;
      id v15 = v13 + 4;
    }
    v12[7] = v15;
  }
}

- (BOOL)isValidWordString:(id)a3
{
  id v5 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (self) {
    id Property = objc_getProperty(self, v4, 72, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  int v8 = [(CRLineWrappingContext *)self locale];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__CRLineWrappingContext_isValidWordString___block_invoke;
  v12[3] = &unk_1E6CDB4E8;
  id v9 = v5;
  id v13 = v9;
  unint64_t v14 = &v15;
  [v7 lockResourcesForLocale:v8 sender:self block:v12];

  char v10 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __43__CRLineWrappingContext_isValidWordString___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 wordLanguageModel];
  unsigned int TokenIDForString = LMLanguageModelGetTokenIDForString();
  if (TokenIDForString <= 0x1F3)
  {
    [*(id *)(a1 + 32) lowercaseString];
    [v4 wordLanguageModel];
    unsigned int TokenIDForString = LMLanguageModelGetTokenIDForString();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = TokenIDForString > 0x1F3;
}

- (BOOL)isRTL
{
  id v2 = [(CRLineWrappingContext *)self locale];
  BOOL v3 = +[CRImageReader languageIsArabic:v2];

  return v3;
}

- (double)wordLMScoreByAddingTokens:(const void *)a3
{
  if (![(CRLineWrappingContext *)self usesWordTokens]) {
    return -1.79769313e308;
  }
  if (self->_contextTokens.__end_ == self->_contextTokens.__begin_) {
    return -1.79769313e308;
  }
  double v39 = 0;
  v40 = 0;
  uint64_t v41 = 0;
  id v6 = *(unsigned int **)a3;
  id v7 = (unsigned int *)*((void *)a3 + 1);
  if (*(unsigned int **)a3 == v7) {
    return -1.79769313e308;
  }
  int v8 = 0;
  id v9 = 0;
  int v10 = 0;
  char v11 = 0;
  while (1)
  {
    unsigned int v12 = *v6;
    if (v9 >= v41)
    {
      uint64_t v13 = v9 - v8;
      unint64_t v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 62) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v15 = (char *)v41 - (char *)v8;
      if (((char *)v41 - (char *)v8) >> 1 > v14) {
        unint64_t v14 = v15 >> 1;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v5 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v5 = v14;
      }
      if (v5)
      {
        long long v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v41, v5);
        int v8 = (unsigned int *)v39;
        id v9 = v40;
      }
      else
      {
        long long v16 = 0;
      }
      uint64_t v17 = (unsigned int *)&v16[4 * v13];
      unsigned int *v17 = v12;
      uint64_t v18 = (uint64_t)(v17 + 1);
      while (v9 != v8)
      {
        unsigned int v19 = *--v9;
        *--uint64_t v17 = v19;
      }
      double v39 = v17;
      v40 = (unsigned int *)v18;
      uint64_t v41 = (unsigned int *)&v16[4 * v5];
      if (v8) {
        operator delete(v8);
      }
      id v9 = (unsigned int *)v18;
    }
    else
    {
      *v9++ = v12;
    }
    v40 = v9;
    v11 |= v12 != 0;
    v10 |= v12 > 0x1F3;
    if (v10 & 1) != 0 && (v11) {
      break;
    }
    int v8 = (unsigned int *)v39;
    ++v6;
    if ((char *)v9 - (unsigned char *)v39 == 12 || v6 == v7)
    {
      if ((v11 & 1) == 0)
      {
        double v25 = -1.79769313e308;
        goto LABEL_45;
      }
      break;
    }
  }
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0x7FEFFFFFFFFFFFFFLL;
  begin = self->_contextTokens.__begin_;
  uint64_t v22 = (char *)self->_contextTokens.__end_ - (char *)begin;
  if (v22)
  {
    unint64_t v23 = v22 >> 2;
    if (v23 <= 1) {
      unint64_t v23 = 1;
    }
    while (1)
    {
      unsigned int v24 = *begin++;
      if (v24 >= 0x1F4) {
        break;
      }
      if (!--v23) {
        goto LABEL_35;
      }
    }
    id v27 = objc_getProperty(self, (SEL)v5, 72, 1);
    uint64_t v28 = [(CRLineWrappingContext *)self locale];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3321888768;
    v31[2] = __51__CRLineWrappingContext_wordLMScoreByAddingTokens___block_invoke;
    v31[3] = &unk_1F38ED6E0;
    v31[4] = self;
    v31[5] = &v35;
    double v33 = 0;
    uint64_t v34 = 0;
    __p = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&__p, v39, (uint64_t)v40, ((char *)v40 - (unsigned char *)v39) >> 2);
    [v27 lockResourcesForLocale:v28 sender:self block:v31];

    long double v29 = *((double *)v36 + 3);
    double v30 = exp(v29);
    if (v29 >= 0.0) {
      double v25 = -1.79769313e308;
    }
    else {
      double v25 = v30;
    }
    if (__p)
    {
      double v33 = __p;
      operator delete(__p);
    }
  }
  else
  {
LABEL_35:
    double v25 = -1.79769313e308;
  }
  _Block_object_dispose(&v35, 8);
  int v8 = (unsigned int *)v39;
LABEL_45:
  if (v8)
  {
    v40 = v8;
    operator delete(v8);
  }
  return v25;
}

void __51__CRLineWrappingContext_wordLMScoreByAddingTokens___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  id v6 = *(unsigned char **)(v4 + 8);
  unint64_t v5 = *(unsigned char **)(v4 + 16);
  __p = 0;
  __dst = 0;
  unint64_t v26 = 0;
  int64_t v7 = v5 - v6;
  if (v5 != v6)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](&__p, v7 >> 2);
    int v8 = (char *)__dst;
    memmove(__dst, v6, v7);
    __dst = &v8[4 * (v7 >> 2)];
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
  id v9 = (int *)a1[6];
  int v10 = (int *)a1[7];
  if (v9 == v10)
  {
    uint64_t v23 = a1[6];
  }
  else
  {
    do
    {
      int v11 = *v9;
      [v3 wordLanguageModel];
      LMLanguageModelConditionalProbability();
      *(double *)(*(void *)(a1[5] + 8) + 24) = v12 + *(double *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v13 = (char *)__dst;
      if ((unint64_t)__dst >= v26)
      {
        uint64_t v15 = (char *)__p;
        int64_t v16 = ((unsigned char *)__dst - (unsigned char *)__p) >> 2;
        unint64_t v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 62) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v18 = v26 - (void)__p;
        if ((uint64_t)(v26 - (void)__p) >> 1 > v17) {
          unint64_t v17 = v18 >> 1;
        }
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v17;
        }
        if (v19)
        {
          unint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v26, v19);
          uint64_t v15 = (char *)__p;
          uint64_t v13 = (char *)__dst;
        }
        else
        {
          unint64_t v20 = 0;
        }
        unint64_t v21 = &v20[4 * v16];
        *(_DWORD *)unint64_t v21 = v11;
        unint64_t v14 = v21 + 4;
        while (v13 != v15)
        {
          int v22 = *((_DWORD *)v13 - 1);
          v13 -= 4;
          *((_DWORD *)v21 - 1) = v22;
          v21 -= 4;
        }
        __p = v21;
        __dst = v14;
        unint64_t v26 = (unint64_t)&v20[4 * v19];
        if (v15) {
          operator delete(v15);
        }
      }
      else
      {
        *(_DWORD *)__dst = v11;
        unint64_t v14 = v13 + 4;
      }
      __dst = v14;
      ++v9;
    }
    while (v9 != v10);
    id v9 = (int *)a1[6];
    uint64_t v23 = a1[7];
  }
  *(double *)(*(void *)(a1[5] + 8) + 24) = *(double *)(*(void *)(a1[5] + 8) + 24)
                                               / (double)(unint64_t)((v23 - (uint64_t)v9) >> 2);
  if (__p)
  {
    __dst = __p;
    operator delete(__p);
  }
}

- (double)wordLMScoreByAddingToken:(unsigned int)a3
{
  unint64_t v5 = operator new(4uLL);
  __p = v5;
  *unint64_t v5 = a3;
  int v10 = v5 + 1;
  int v11 = v5 + 1;
  [(CRLineWrappingContext *)self wordLMScoreByAddingTokens:&__p];
  double v7 = v6;
  if (__p)
  {
    int v10 = __p;
    operator delete(__p);
  }
  return v7;
}

- (double)charLMScoreByAddingString:(id)a3 eosScore:(double *)a4
{
  id v6 = a3;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__6;
  v51[4] = __Block_byref_object_dispose__6;
  v52 = &stru_1F38EED68;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  double v7 = [(CRLineWrappingContext *)self locale];
  if (+[CRImageReader languageIsThai:v7]) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = 2;
  }

  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x4812000000;
  v43[3] = __Block_byref_object_copy__122;
  v43[4] = __Block_byref_object_dispose__123;
  v43[5] = &unk_1DD8FDA7A;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v44 = 0;
  id v9 = [(CRLineWrappingContext *)self text];
  int v10 = [(CRLineWrappingContext *)self text];
  uint64_t v11 = [v10 length];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke;
  v42[3] = &unk_1E6CDB510;
  v42[6] = v43;
  v42[7] = &v47;
  v42[4] = self;
  v42[5] = v51;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, v8 | 0x100, v42);

  if (v48[3])
  {
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    double v39 = __Block_byref_object_copy__6;
    v40 = __Block_byref_object_dispose__6;
    id v41 = (id)objc_opt_new();
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x4812000000;
    double v30 = __Block_byref_object_copy__122;
    double v31 = __Block_byref_object_dispose__123;
    double v32 = &unk_1DD8FDA7A;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    __p = 0;
    uint64_t v12 = [v6 length];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke_2;
    v26[3] = &unk_1E6CDB538;
    v26[4] = &v36;
    v26[5] = &v27;
    objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v12, v8, v26);
    if (![(id)v37[5] count] || v28[7] == v28[6])
    {
      double v19 = -1.79769313e308;
    }
    else
    {
      uint64_t v22 = 0;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x2020000000;
      uint64_t v25 = 0;
      if (self) {
        id Property = objc_getProperty(self, v13, 72, 1);
      }
      else {
        id Property = 0;
      }
      id v15 = Property;
      int64_t v16 = [(CRLineWrappingContext *)self locale];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke_3;
      v21[3] = &unk_1E6CDB560;
      v21[4] = v43;
      v21[5] = &v27;
      v21[6] = &v22;
      v21[7] = &v47;
      v21[8] = &v36;
      v21[9] = v51;
      v21[10] = a4;
      [v15 lockResourcesForLocale:v16 sender:self block:v21];

      long double v17 = *((double *)v23 + 3);
      double v18 = exp(v17);
      if (v17 >= 0.0) {
        double v19 = -1.79769313e308;
      }
      else {
        double v19 = v18;
      }
      _Block_object_dispose(&v22, 8);
    }
    _Block_object_dispose(&v27, 8);
    if (__p)
    {
      uint64_t v34 = __p;
      operator delete(__p);
    }
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    double v19 = -1.79769313e308;
  }
  _Block_object_dispose(v43, 8);
  if (v44)
  {
    uint64_t v45 = v44;
    operator delete(v44);
  }
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v51, 8);

  return v19;
}

void __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v30 = a2;
  __int16 v9 = [v30 characterAtIndex:0];
  v10.i16[0] = v9 & 0xFFDF;
  v10.i16[1] = v9;
  if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x158001F0017001ALL, (uint16x4_t)vadd_s16(vzip1_s16(v10, vdup_lane_s16(v10, 1)), (int16x4_t)0xFF08FF28FF40FFBFLL))) & 1) != 0|| (unsigned __int16)(v9 - 880) < 0x1C0u)
  {
    goto LABEL_22;
  }
  uint64_t v11 = [v30 stringByAppendingString:*(void *)(*(void *)(a1[5] + 8) + 40)];
  uint64_t v12 = *(void *)(a1[5] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  unint64_t v14 = *(void **)(a1[6] + 8);
  int v15 = NSStringToUnicode((NSString *)v30);
  int v16 = v15;
  unint64_t v17 = v14[8];
  double v18 = (char *)v14[7];
  if ((unint64_t)v18 >= v17)
  {
    unint64_t v20 = (char *)v14[6];
    uint64_t v21 = (v18 - v20) >> 2;
    if ((unint64_t)(v21 + 1) >> 62) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v22 = v17 - (void)v20;
    unint64_t v23 = (uint64_t)(v17 - (void)v20) >> 1;
    if (v23 <= v21 + 1) {
      unint64_t v23 = v21 + 1;
    }
    if (v22 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v24 = v23;
    }
    if (v24)
    {
      uint64_t v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v14 + 8), v24);
      unint64_t v20 = (char *)v14[6];
      double v18 = (char *)v14[7];
    }
    else
    {
      uint64_t v25 = 0;
    }
    unint64_t v26 = &v25[4 * v21];
    uint64_t v27 = &v25[4 * v24];
    *(_DWORD *)unint64_t v26 = v16;
    double v19 = v26 + 4;
    while (v18 != v20)
    {
      int v28 = *((_DWORD *)v18 - 1);
      v18 -= 4;
      *((_DWORD *)v26 - 1) = v28;
      v26 -= 4;
    }
    v14[6] = v26;
    v14[7] = v19;
    v14[8] = v27;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    *(_DWORD *)double v18 = v15;
    double v19 = v18 + 4;
  }
  v14[7] = v19;
  ++*(void *)(*(void *)(a1[7] + 8) + 24);
  uint64_t v29 = a1[4];
  if (v29) {
    uint64_t v29 = *(void *)(v29 + 80);
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 24) == v29) {
LABEL_22:
  }
    *a7 = 1;
}

void __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v28 = a2;
  __int16 v9 = [v28 characterAtIndex:0];
  v10.i16[0] = v9 & 0xFFDF;
  v10.i16[1] = v9;
  if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x158001F0017001ALL, (uint16x4_t)vadd_s16(vzip1_s16(v10, vdup_lane_s16(v10, 1)), (int16x4_t)0xFF08FF28FF40FFBFLL))) & 1) != 0|| (unsigned __int16)(v9 - 880) < 0x1C0u)
  {
    goto LABEL_20;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v28];
  uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 8);
  int v12 = NSStringToUnicode((NSString *)v28);
  int v13 = v12;
  unint64_t v14 = v11[8];
  int v15 = (char *)v11[7];
  if ((unint64_t)v15 >= v14)
  {
    unint64_t v17 = (char *)v11[6];
    uint64_t v18 = (v15 - v17) >> 2;
    if ((unint64_t)(v18 + 1) >> 62) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v19 = v14 - (void)v17;
    unint64_t v20 = (uint64_t)(v14 - (void)v17) >> 1;
    if (v20 <= v18 + 1) {
      unint64_t v20 = v18 + 1;
    }
    if (v19 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v20;
    }
    if (v21)
    {
      unint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(v11 + 8), v21);
      unint64_t v17 = (char *)v11[6];
      int v15 = (char *)v11[7];
    }
    else
    {
      unint64_t v22 = 0;
    }
    unint64_t v23 = &v22[4 * v18];
    unint64_t v24 = &v22[4 * v21];
    *(_DWORD *)unint64_t v23 = v13;
    int v16 = v23 + 4;
    while (v15 != v17)
    {
      int v25 = *((_DWORD *)v15 - 1);
      v15 -= 4;
      *((_DWORD *)v23 - 1) = v25;
      v23 -= 4;
    }
    v11[6] = v23;
    v11[7] = v16;
    v11[8] = v24;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    *(_DWORD *)int v15 = v12;
    int v16 = v15 + 4;
  }
  v11[7] = v16;
  unint64_t v26 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  char v27 = [v28 _crContainsCharactersInSet:v26];

  if ((v27 & 1) == 0) {
LABEL_20:
  }
    *a7 = 1;
}

void __60__CRLineWrappingContext_charLMScoreByAddingString_eosScore___block_invoke_3(void *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 lmCharacterLanguageModel] || objc_msgSend(v3, "cvnlpCharacterLanguageModel"))
  {
    if ([v3 lmCharacterLanguageModel])
    {
      uint64_t v4 = *(void *)(a1[4] + 8);
      unint64_t v5 = *(void *)(v4 + 48);
      uint64_t v6 = *(void *)(v4 + 56);
      double v7 = (_DWORD *)(v6 - 4);
      if (v5 != v6 && (unint64_t)v7 > v5)
      {
        unint64_t v9 = v5 + 4;
        do
        {
          int v10 = *(_DWORD *)(v9 - 4);
          *(_DWORD *)(v9 - 4) = *v7;
          *v7-- = v10;
          BOOL v11 = v9 >= (unint64_t)v7;
          v9 += 4;
        }
        while (!v11);
      }
      uint64_t v12 = *(void *)(a1[5] + 8);
      uint64_t v13 = *(void *)(v12 + 48);
      uint64_t v14 = *(void *)(v12 + 56);
      if (v13 == v14)
      {
        uint64_t v17 = *(void *)(v12 + 48);
      }
      else
      {
        do
        {
          [v3 lmCharacterLanguageModel];
          LMLanguageModelConditionalProbability();
          *(double *)(*(void *)(a1[6] + 8) + 24) = v15 + *(double *)(*(void *)(a1[6] + 8) + 24);
          v13 += 4;
        }
        while (v13 != v14);
        uint64_t v16 = *(void *)(a1[5] + 8);
        uint64_t v13 = *(void *)(v16 + 48);
        uint64_t v17 = *(void *)(v16 + 56);
      }
      *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24)
                                                   / (double)(unint64_t)((v17 - v13) >> 2);
      unint64_t v26 = (void *)a1[10];
      if (v26)
      {
        void *v26 = 0xFFEFFFFFFFFFFFFFLL;
        [v3 lmCharacterLanguageModel];
        LMLanguageModelConditionalProbability();
        if (v25 < 0.0) {
          goto LABEL_28;
        }
      }
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v18 = *(id *)(*(void *)(a1[8] + 8) + 40);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v29;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v29 != v20) {
              objc_enumerationMutation(v18);
            }
            objc_msgSend(v3, "cvnlpCharacterLanguageModel", (void)v28);
            CVNLPLanguageModelLogConditionalProbabilityForTokenString();
            *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24)
                                                         + (float)(v22
                                                                 / (float)(unint64_t)[*(id *)(*(void *)(a1[8] + 8) + 40) count]);
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v19);
      }

      unint64_t v23 = (void *)a1[10];
      if (v23)
      {
        *unint64_t v23 = 0xFFEFFFFFFFFFFFFFLL;
        [v3 cvnlpCharacterLanguageModel];
        CVNLPLanguageModelLogConditionalProbabilityForTokenString();
        if (v24 < 0.0)
        {
          long double v25 = v24;
LABEL_28:
          *(long double *)a1[10] = exp(v25);
        }
      }
    }
  }
  else
  {
    char v27 = (void *)a1[10];
    if (v27) {
      void *v27 = 0xFFEFFFFFFFFFFFFFLL;
    }
  }
}

- (BOOL)shouldAllowWhitespaceDelimiterForString:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CRLineWrappingContext *)self locale];
  BOOL v6 = +[CRImageReader languageIsThai:v5];

  if (v6)
  {
    double v14 = 0.0;
    [(CRLineWrappingContext *)self charLMScoreByAddingString:v4 eosScore:&v14];
    double v8 = v7;
    unint64_t v9 = [NSString stringWithFormat:@" %@", v4];
    double v13 = 0.0;
    [(CRLineWrappingContext *)self charLMScoreByAddingString:v9 eosScore:&v13];
    BOOL v11 = v8 <= v10 && v14 <= v13;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)isClassifierAvailable
{
  if (self) {
    self = (CRLineWrappingContext *)objc_getProperty(self, a2, 112, 1);
  }
  return self != 0;
}

- (BOOL)classifierShouldCorrectOverwrappingWithEvaluation:(int64_t)a3 correctionMode:(int64_t)a4
{
  BOOL v6 = [(CRLineWrappingContext *)self isClassifierAvailable];
  BOOL v7 = (unint64_t)a3 < 0xA;
  if (a4 != 1) {
    BOOL v7 = 0;
  }
  BOOL v8 = a4 == 2 || v7;
  if (!v6) {
    BOOL v8 = 0;
  }
  return a3 >= 2 && v8;
}

- (BOOL)classifierShouldInsertLineBreakForEvaluationResult:(id)a3 threshold:(float)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (self && objc_getProperty(self, v6, 112, 1))
  {
    unint64_t v9 = objc_msgSend(objc_getProperty(self, v8, 112, 1), "modelLocale");
    double v10 = [v7 featureInTest];
    BOOL v11 = [(CRLineWrappingContext *)self lastFeature];
    [v7 imageSize];
    uint64_t v12 = +[CRWrappingClassifierFeatureExtractor extractFeatureMultiArrayForLocale:textFeature:lastFeature:evaluation:imageSize:](CRWrappingClassifierFeatureExtractor, "extractFeatureMultiArrayForLocale:textFeature:lastFeature:evaluation:imageSize:", v9, v10, v11, v7);

    if (v12)
    {
      double v13 = [[CRLineWrappingClassifierInput alloc] initWithFeatures:v12];
      id v22 = 0;
      double v15 = objc_msgSend(objc_getProperty(self, v14, 112, 1), "predictionFromFeatures:error:", v13, &v22);
      uint64_t v16 = v22;
      if (v16)
      {
        uint64_t v17 = CROSLogForCategory(4);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = [v16 description];
          *(_DWORD *)buf = 138412290;
          float v24 = v18;
          _os_log_impl(&dword_1DD733000, v17, OS_LOG_TYPE_ERROR, "Error occured during line wrapping classification: %@", buf, 0xCu);
        }
      }
      if (v15)
      {
        [v15 wrappingProbability];
        BOOL v20 = v19 <= a4;
      }
      else
      {
        BOOL v20 = 1;
      }
    }
    else
    {
      uint64_t v16 = CROSLogForCategory(4);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_ERROR, "Could not extract features for classifier", buf, 2u);
      }
      BOOL v20 = 1;
    }
  }
  else
  {
    uint64_t v12 = CROSLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD733000, v12, OS_LOG_TYPE_FAULT, "Unexpected call when the classifier is unavailable.", buf, 2u);
    }
    BOOL v20 = 1;
  }

  return v20;
}

- (void)dealloc
{
  id v2 = self;
  if (self) {
    self = (CRLineWrappingContext *)objc_getProperty(self, a2, 72, 1);
  }
  id v3 = self;
  id v4 = [(CRLineWrappingContext *)v2 locale];
  [(CRLineWrappingContext *)v3 removeSubscriber:v2 forLocale:v4];

  v5.receiver = v2;
  v5.super_class = (Class)CRLineWrappingContext;
  [(CRLineWrappingContext *)&v5 dealloc];
}

- (BOOL)usesWordTokens
{
  id v2 = [(CRLineWrappingContext *)self locale];
  BOOL v3 = +[CRLineWrappingContext _usesWordTokensForLocale:]((uint64_t)CRLineWrappingContext, v2);

  return v3;
}

- (BOOL)shouldConsiderLetterCase
{
  BOOL v3 = [(CRLineWrappingContext *)self locale];
  if (+[CRImageReader languageIsLatin:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    objc_super v5 = [(CRLineWrappingContext *)self locale];
    BOOL v4 = +[CRImageReader languageIsCyrillic:v5];
  }
  return v4;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)lineCount
{
  return self->_lineCount;
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_lrManager, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_text, 0);
  begin = self->_contextTokens.__begin_;
  if (begin)
  {
    self->_contextTokens.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end