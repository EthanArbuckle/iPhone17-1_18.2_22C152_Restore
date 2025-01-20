@interface PMLHashingVectorizer
+ (id)withBucketSize:(int)a3 andCharNgramOrder:(int)a4;
+ (id)withBucketSize:(int)a3 andNgramOrder:(int)a4;
+ (id)withBucketSize:(int)a3 andNgrams:(int)a4;
+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7;
+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9;
+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9 idVectorLength:(unint64_t)a10 extraIdOptions:(unint64_t)a11 vectorizerStrategy:(unint64_t)a12 vectorNormalization:(int64_t)a13;
+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9 idVectorLength:(unint64_t)a10 extraIdOptions:(unint64_t)a11 vectorizerStrategy:(unint64_t)a12 vectorNormalization:(int64_t)a13 vocab:(id)a14;
+ (id)withBucketSize:(int)a3 ngrams:(int)a4 localeForNonwordTokens:(id)a5 tokenizeNewlines:(BOOL)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHashingVectorizer:(id)a3;
- (PMLHashingVectorizer)initWithBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9 idVectorLength:(unint64_t)a10 extraIdOptions:(unint64_t)a11 vectorizerStrategy:(unint64_t)a12 vectorNormalization:(int64_t)a13 vocab:(id)a14;
- (PMLHashingVectorizer)initWithBucketSize:(int)a3 ngrams:(int)a4 localeForNonwordTokens:(id)a5 tokenizeNewlines:(BOOL)a6;
- (PMLHashingVectorizer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (id)transformBagOfIds:(id)a3 shouldDecrement:(BOOL)a4;
- (id)transformBatch:(id)a3;
- (id)transformSequentialNGrams:(id)a3;
- (id)transformWithFrequency:(id)a3 shouldDecrement:(BOOL)a4;
- (id)transformWithWordPiece:(id)a3;
- (unint64_t)hash;
- (void)setVectorizerNormalization:(int64_t)a3;
@end

@implementation PMLHashingVectorizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_localeForNonwordTokens, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = self->_vectorizerStrategy - self->_buckets + 32 * self->_buckets;
  NSUInteger v4 = self->_characterNGramRange.location - v3 + 32 * v3;
  NSUInteger v5 = self->_characterNGramRange.length - v4 + 32 * v4;
  NSUInteger v6 = self->_tokenNGramRange.location - v5 + 32 * v5;
  NSUInteger v7 = self->_shouldNormalizeTokens
     - (self->_tokenNGramRange.length
      - v6
      + 32 * v6)
     + 32 * (self->_tokenNGramRange.length - v6 + 32 * v6);
  uint64_t v8 = self->_shouldNormalizeCharacters - v7 + 32 * v7;
  uint64_t v9 = [(NSLocale *)self->_localeForNonwordTokens hash];
  uint64_t v10 = self->_tokenizeNewlines - (v9 - v8 + 32 * v8) + 32 * (v9 - v8 + 32 * v8);
  unint64_t v11 = self->_idVectorLength - v10 + 32 * v10;
  unint64_t v12 = self->_extraIdOptions - v11 + 32 * v11;
  unint64_t v13 = self->_vectorizerStrategy - v12 + 32 * v12;
  return self->_vectorNormalization - v13 + 32 * v13;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (PMLHashingVectorizer *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PMLHashingVectorizer *)self isEqualToHashingVectorizer:v5];

  return v6;
}

- (BOOL)isEqualToHashingVectorizer:(id)a3
{
  NSUInteger v4 = (id *)a3;
  NSUInteger v5 = v4;
  if (!v4 || self->_buckets != *((_DWORD *)v4 + 2) || self->_vectorizerStrategy != v4[11]) {
    goto LABEL_22;
  }
  if (self->_characterNGramRange.location != v4[2] || self->_characterNGramRange.length != (void)v4[3]) {
    goto LABEL_22;
  }
  BOOL v7 = 0;
  if (self->_tokenNGramRange.location == v4[4] && self->_tokenNGramRange.length == v4[5])
  {
    if (self->_shouldNormalizeTokens != *((unsigned __int8 *)v4 + 48)
      || self->_shouldNormalizeCharacters != *((unsigned __int8 *)v4 + 49))
    {
      goto LABEL_22;
    }
    localeForNonwordTokens = self->_localeForNonwordTokens;
    uint64_t v9 = (NSLocale *)v4[7];
    if (localeForNonwordTokens == v9)
    {
    }
    else
    {
      uint64_t v10 = v9;
      unint64_t v11 = localeForNonwordTokens;
      char v12 = [(NSLocale *)v11 isEqual:v10];

      if ((v12 & 1) == 0)
      {
LABEL_22:
        BOOL v7 = 0;
        goto LABEL_23;
      }
    }
    if (self->_tokenizeNewlines != *((unsigned __int8 *)v5 + 64)
      || self->_idVectorLength != v5[9]
      || self->_extraIdOptions != v5[10]
      || self->_vectorizerStrategy != v5[11])
    {
      goto LABEL_22;
    }
    BOOL v7 = self->_vectorNormalization == (void)v5[12];
  }
LABEL_23:

  return v7;
}

- (PMLHashingVectorizer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v5 = a3;
  BOOL v6 = [v5 objectForKeyedSubscript:@"BUCKET_SIZE"];
  unsigned int v50 = [v6 intValue];

  BOOL v7 = [v5 objectForKeyedSubscript:@"NGRAM_SIZE"];
  uint64_t v8 = [v7 intValue];

  uint64_t v9 = [v5 objectForKeyedSubscript:@"CHARACTER_NGRAM_LOCATION"];
  uint64_t v10 = v9;
  if (!v9) {
    uint64_t v9 = &unk_26D336548;
  }
  int v49 = [v9 intValue];

  unint64_t v11 = [v5 objectForKeyedSubscript:@"CHARACTER_NGRAM_LENGTH"];
  char v12 = v11;
  if (!v11) {
    unint64_t v11 = &unk_26D336548;
  }
  int v48 = [v11 intValue];

  unint64_t v13 = [v5 objectForKeyedSubscript:@"TOKEN_NGRAM_LOCATION"];
  v14 = v13;
  if (!v13) {
    unint64_t v13 = &unk_26D336560;
  }
  int v47 = [v13 intValue];

  v15 = [v5 objectForKeyedSubscript:@"TOKEN_NGRAM_LENGTH"];
  v16 = v15;
  if (v15)
  {
    int v46 = [v15 intValue];
  }
  else
  {
    v17 = [NSNumber numberWithInt:v8];
    int v46 = [v17 intValue];
  }
  v18 = [v5 objectForKeyedSubscript:@"TOKEN_NORMALIZATION"];
  v19 = v18;
  if (!v18) {
    v18 = (void *)MEMORY[0x263EFFA88];
  }
  uint64_t v20 = [v18 BOOLValue];

  v21 = [v5 objectForKeyedSubscript:@"CHARACTER_NORMALIZATION"];
  v22 = v21;
  v23 = (void *)MEMORY[0x263EFFA80];
  if (!v21) {
    v21 = (void *)MEMORY[0x263EFFA80];
  }
  char v24 = [v21 BOOLValue];

  v25 = [v5 objectForKeyedSubscript:@"SHOULD_TOKENIZE_NEWLINES"];
  v26 = v25;
  if (!v25) {
    v25 = v23;
  }
  char v27 = [v25 BOOLValue];

  v28 = [v5 objectForKeyedSubscript:@"ID_VECTOR_LENGTH"];
  v29 = v28;
  if (!v28) {
    v28 = &unk_26D336548;
  }
  int v30 = [v28 intValue];

  v31 = [v5 objectForKeyedSubscript:@"EXTRA_ID_OPTIONS"];
  v32 = v31;
  if (!v31) {
    v31 = &unk_26D336548;
  }
  int v33 = [v31 intValue];

  v34 = [v5 objectForKeyedSubscript:@"VECTORIZER_STRATEGY"];
  v35 = v34;
  if (!v34) {
    v34 = &unk_26D336578;
  }
  int v36 = [v34 intValue];

  v37 = [v5 objectForKeyedSubscript:@"VECTOR_NORMALIZATION"];
  v38 = v37;
  if (!v37) {
    v37 = &unk_26D336590;
  }
  int v39 = [v37 intValue];

  v40 = [v5 objectForKeyedSubscript:@"NON_WORD_TOKENS_LOCALE"];
  if (v40)
  {
    v41 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v40];
  }
  else
  {
    v41 = 0;
  }
  LOBYTE(v45) = v27;
  LOBYTE(v44) = v24;
  v42 = -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:](self, "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", v50, v49, v48, v47, v46, v20, v44, v41, v45, v30, v33, v36, v39, 0);

  return v42;
}

- (id)toPlistWithChunks:(id)a3
{
  v23[13] = *MEMORY[0x263EF8340];
  v22[0] = @"BUCKET_SIZE";
  v21 = [NSNumber numberWithInt:self->_buckets];
  v23[0] = v21;
  v22[1] = @"NGRAM_SIZE";
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:self->_tokenNGramRange.length];
  v23[1] = v20;
  v22[2] = @"CHARACTER_NGRAM_LOCATION";
  v19 = [NSNumber numberWithUnsignedInteger:self->_characterNGramRange.location];
  v23[2] = v19;
  v22[3] = @"CHARACTER_NGRAM_LENGTH";
  v18 = [NSNumber numberWithUnsignedInteger:self->_characterNGramRange.length];
  v23[3] = v18;
  v22[4] = @"CHARACTER_NORMALIZATION";
  v17 = [NSNumber numberWithBool:self->_shouldNormalizeCharacters];
  v23[4] = v17;
  v22[5] = @"TOKEN_NGRAM_LOCATION";
  v16 = [NSNumber numberWithUnsignedInteger:self->_tokenNGramRange.location];
  v23[5] = v16;
  v22[6] = @"TOKEN_NGRAM_LENGTH";
  NSUInteger v4 = [NSNumber numberWithUnsignedInteger:self->_tokenNGramRange.length];
  v23[6] = v4;
  v22[7] = @"TOKEN_NORMALIZATION";
  id v5 = [NSNumber numberWithBool:self->_shouldNormalizeTokens];
  v23[7] = v5;
  v22[8] = @"SHOULD_TOKENIZE_NEWLINES";
  BOOL v6 = [NSNumber numberWithBool:self->_tokenizeNewlines];
  v23[8] = v6;
  v22[9] = @"ID_VECTOR_LENGTH";
  BOOL v7 = [NSNumber numberWithUnsignedInteger:self->_idVectorLength];
  v23[9] = v7;
  v22[10] = @"EXTRA_ID_OPTIONS";
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_extraIdOptions];
  v23[10] = v8;
  v22[11] = @"VECTORIZER_STRATEGY";
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:self->_vectorizerStrategy];
  v23[11] = v9;
  v22[12] = @"VECTOR_NORMALIZATION";
  uint64_t v10 = [NSNumber numberWithInteger:self->_vectorNormalization];
  v23[12] = v10;
  unint64_t v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:13];
  char v12 = (void *)[v11 mutableCopy];

  localeForNonwordTokens = self->_localeForNonwordTokens;
  if (localeForNonwordTokens)
  {
    v14 = [(NSLocale *)localeForNonwordTokens localeIdentifier];
    [v12 setObject:v14 forKeyedSubscript:@"NON_WORD_TOKENS_LOCALE"];
  }
  return v12;
}

- (id)transformWithWordPiece:(id)a3
{
  id v4 = a3;
  id v5 = [[PMLWordPieceTokenizer alloc] initWithVocab:self->_vocab];
  BOOL v6 = [(PMLWordPieceTokenizer *)v5 tokenize:v4 withLength:self->_idVectorLength];

  if (self->_startId) {
    uint64_t v7 = [(PMLWordPieceTokenizer *)v5 startId];
  }
  else {
    uint64_t v7 = 0;
  }
  if (self->_endId) {
    uint64_t v8 = [(PMLWordPieceTokenizer *)v5 endId];
  }
  else {
    uint64_t v8 = 0;
  }
  if (self->_paddingId) {
    uint64_t v9 = [(PMLWordPieceTokenizer *)v5 padId];
  }
  else {
    uint64_t v9 = 0;
  }
  [v6 addStartId:v7 endId:v8 paddingId:v9 withMaxVectorLength:self->_idVectorLength];

  return v6;
}

- (id)transformBatch:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = -[PMLHashingVectorizer transform:](self, "transform:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)transformBagOfIds:(id)a3 shouldDecrement:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (self->_endId)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PMLHashingVectorizer.m", 612, @"Invalid parameter not satisfying: %@", @"_endId == 0" object file lineNumber description];
  }
  if (self->_startId)
  {
    unint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PMLHashingVectorizer.m", 613, @"Invalid parameter not satisfying: %@", @"_startId == 0" object file lineNumber description];
  }
  uint64_t v8 = [(PMLHashingVectorizer *)self transformWithFrequency:v7 shouldDecrement:v4];
  [v8 convertToBagOfIds];
  [v8 addStartId:self->_startId endId:self->_endId paddingId:self->_paddingId withMaxVectorLength:self->_idVectorLength];

  return v8;
}

- (id)transformSequentialNGrams:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  long long v11 = 0uLL;
  unint64_t vectorizerStrategy = self->_vectorizerStrategy;
  if (vectorizerStrategy == 3)
  {
    hashingVectorizeCharacters(v4, (uint64_t)&v11, self->_buckets, self->_characterNGramRange.location, LODWORD(self->_characterNGramRange.length) + LODWORD(self->_characterNGramRange.location), self->_shouldNormalizeTokens, 0, 1);
  }
  else if (vectorizerStrategy == 2)
  {
    hashingVectorizeTokens(v4, &v11, self->_buckets, self->_tokenNGramRange.location, LODWORD(self->_tokenNGramRange.length) + LODWORD(self->_tokenNGramRange.location), self->_localeForNonwordTokens, self->_tokenizeNewlines, self->_shouldNormalizeTokens, 0, 1);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__PMLHashingVectorizer_transformSequentialNGrams___block_invoke;
  v9[3] = &__block_descriptor_56_e13_v24__0_q8_f16l;
  v9[4] = v11;
  long long v10 = v11;
  id v7 = +[PMLSparseVector sparseVectorWithLength:v11 numberOfNonZeroValues:v11 block:v9];
  free(*((void **)&v11 + 1));
  [v7 addStartId:self->_startId endId:self->_endId paddingId:self->_paddingId withMaxVectorLength:self->_idVectorLength];

  return v7;
}

float __50__PMLHashingVectorizer_transformSequentialNGrams___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = 0;
    id v5 = *(unsigned int **)(a1 + 48);
    do
    {
      *(void *)(a2 + 8 * v4) = v4;
      unsigned int v6 = *v5;
      v5 += 2;
      float result = (float)v6;
      *(float *)(a3 + 4 * v4++) = (float)v6;
    }
    while (v3 != v4);
  }
  return result;
}

- (id)transformWithFrequency:(id)a3 shouldDecrement:(BOOL)a4
{
  id v6 = a3;
  long long v16 = 0uLL;
  hashingVectorizeTokens(v6, &v16, self->_buckets, self->_tokenNGramRange.location, LODWORD(self->_tokenNGramRange.length) + LODWORD(self->_tokenNGramRange.location), self->_localeForNonwordTokens, self->_tokenizeNewlines, self->_shouldNormalizeTokens, a4, 0);
  hashingVectorizeCharacters(v6, (uint64_t)&v16, self->_buckets, self->_characterNGramRange.location, LODWORD(self->_characterNGramRange.length) + LODWORD(self->_characterNGramRange.location), self->_shouldNormalizeCharacters, a4, 0);
  qsort(*((void **)&v16 + 1), v16, 8uLL, (int (__cdecl *)(const void *, const void *))compareHashAndCounts);
  uint64_t v7 = v16;
  if (v16)
  {
    uint64_t v8 = 0;
    uint64_t v9 = (int *)(*((void *)&v16 + 1) + 4);
    do
    {
      int v10 = *v9;
      v9 += 2;
      if (v10) {
        ++v8;
      }
      --v7;
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t buckets = self->_buckets;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__PMLHashingVectorizer_transformWithFrequency_shouldDecrement___block_invoke;
  v14[3] = &__block_descriptor_48_e13_v24__0_q8_f16l;
  long long v15 = v16;
  char v12 = +[PMLSparseVector sparseVectorWithLength:buckets numberOfNonZeroValues:v8 block:v14];
  free(*((void **)&v16 + 1));
  [v12 scaleWithVectorNormalization:self->_vectorNormalization];

  return v12;
}

uint64_t __63__PMLHashingVectorizer_transformWithFrequency_shouldDecrement___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned int *)(result + 32);
  if (v3)
  {
    unsigned int v4 = 0;
    id v5 = (int *)(*(void *)(result + 40) + 4);
    do
    {
      int v6 = *v5;
      if (*v5)
      {
        *(void *)(a2 + 8 * v4) = *(v5 - 1);
        *(float *)(a3 + 4 * v4++) = (float)v6;
      }
      v5 += 2;
      --v3;
    }
    while (v3);
  }
  return result;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  switch(self->_vectorizerStrategy)
  {
    case 0uLL:
      uint64_t v7 = self;
      id v8 = v4;
      uint64_t v9 = 1;
      goto LABEL_8;
    case 1uLL:
      uint64_t v7 = self;
      id v8 = v4;
      uint64_t v9 = 0;
LABEL_8:
      uint64_t v5 = [(PMLHashingVectorizer *)v7 transformWithFrequency:v8 shouldDecrement:v9];
      goto LABEL_13;
    case 2uLL:
    case 3uLL:
      uint64_t v5 = [(PMLHashingVectorizer *)self transformSequentialNGrams:v4];
      goto LABEL_13;
    case 4uLL:
      int v10 = self;
      id v11 = v4;
      uint64_t v12 = 1;
      goto LABEL_11;
    case 5uLL:
      int v10 = self;
      id v11 = v4;
      uint64_t v12 = 0;
LABEL_11:
      uint64_t v5 = [(PMLHashingVectorizer *)v10 transformBagOfIds:v11 shouldDecrement:v12];
      goto LABEL_13;
    case 6uLL:
      uint64_t v5 = [(PMLHashingVectorizer *)self transformWithWordPiece:v4];
LABEL_13:
      int v6 = (void *)v5;
      break;
    default:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long v14 = 0;
        _os_log_fault_impl(&dword_2212A0000, &_os_log_internal, OS_LOG_TYPE_FAULT, "PMLHashingVectorizer: unknown vectorizer strategy", v14, 2u);
      }
      int v6 = 0;
      break;
  }

  return v6;
}

- (void)setVectorizerNormalization:(int64_t)a3
{
  self->_vectorNormalization = a3;
}

- (PMLHashingVectorizer)initWithBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9 idVectorLength:(unint64_t)a10 extraIdOptions:(unint64_t)a11 vectorizerStrategy:(unint64_t)a12 vectorNormalization:(int64_t)a13 vocab:(id)a14
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v34 = a4.length;
  NSUInteger v35 = a4.location;
  id v18 = a8;
  id v19 = a14;
  if (a3 <= 0)
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PMLHashingVectorizer.m", 377, @"Invalid parameter not satisfying: %@", @"buckets > 0" object file lineNumber description];
  }
  if (a11 >= 8)
  {
    char v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PMLHashingVectorizer.m", 378, @"Invalid parameter not satisfying: %@", @"extraIdOptions < PMLHashingVectorizerIdOptionLimit" object file lineNumber description];
  }
  if (a12 >= 7)
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PMLHashingVectorizer.m", 379, @"Invalid parameter not satisfying: %@", @"vectorizerStrategy < PMLHashingVectorizerStrategyLimit" object file lineNumber description];
  }
  if ((unint64_t)(a13 - 5) <= 0xFFFFFFFFFFFFFFF9)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PMLHashingVectorizer.m", 380, @"Invalid parameter not satisfying: %@", @"vectorNormalization >= PMLVectorNormalizationNone && vectorNormalization < PMLVectorNormalizationLimit" object file lineNumber description];
  }
  if ((!v35 || !v34) && (!location || !length))
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PMLHashingVectorizer.m", 381, @"Invalid parameter not satisfying: %@", @"(characterNGramRange.location && characterNGramRange.length) || (tokenNGramRange.location && tokenNGramRange.length)" object file lineNumber description];
  }
  if (a12 == 6 && !v19)
  {
    int v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PMLHashingVectorizer.m", 382, @"Invalid parameter not satisfying: %@", @"vectorizerStrategy != PMLHashingVectorizerStrategyWordPiece || vocab != nil" object file lineNumber description];
  }
  v36.receiver = self;
  v36.super_class = (Class)PMLHashingVectorizer;
  uint64_t v20 = [(PMLHashingVectorizer *)&v36 init];
  v21 = v20;
  if (v20)
  {
    v20->_uint64_t buckets = a3;
    v20->_characterNGramRange.NSUInteger location = v35;
    v20->_characterNGramRange.NSUInteger length = v34;
    v20->_tokenNGramRange.NSUInteger location = location;
    v20->_tokenNGramRange.NSUInteger length = length;
    v20->_shouldNormalizeTokens = a6;
    v20->_shouldNormalizeCharacters = a7;
    objc_storeStrong((id *)&v20->_localeForNonwordTokens, a8);
    v21->_tokenizeNewlines = a9;
    if (a10) {
      unint64_t v22 = a10;
    }
    else {
      unint64_t v22 = a3;
    }
    v21->_idVectorLength = v22;
    v21->_extraIdOptions = a11;
    v21->_unint64_t vectorizerStrategy = a12;
    v21->_vectorNormalization = a13;
    v21->_paddingId = ((uint64_t)(a11 << 63) >> 63) & a3;
    int32x2_t v23 = vadd_s32(vdup_n_s32(a3), (int32x2_t)0x200000001);
    v24.i64[0] = v23.i32[0];
    v24.i64[1] = v23.i32[1];
    *(int8x16_t *)&v21->_endId = vbicq_s8(v24, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8((int8x16_t)vdupq_n_s64(a11), (int8x16_t)xmmword_2212E92A0)));
    objc_storeStrong((id *)&v21->_vocab, a14);
  }

  return v21;
}

- (PMLHashingVectorizer)initWithBucketSize:(int)a3 ngrams:(int)a4 localeForNonwordTokens:(id)a5 tokenizeNewlines:(BOOL)a6
{
  LOBYTE(v8) = a6;
  LOBYTE(v7) = 0;
  return -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:](self, "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", *(void *)&a3, 0, 0, 1, a4, 1, v7, a5, v8, 0, 0, 0, 2, 0);
}

+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7
{
  LOBYTE(v9) = 0;
  LOBYTE(v8) = a7;
  return +[PMLHashingVectorizer withBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:](PMLHashingVectorizer, "withBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:", *(void *)&a3, a4.location, a4.length, a5.location, a5.length, a6, v8, 0, v9);
}

+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9
{
  BOOL v9 = a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v12 = a4.length;
  NSUInteger v13 = a4.location;
  uint64_t v14 = *(void *)&a3;
  id v15 = a8;
  LOBYTE(v19) = a9;
  LOBYTE(v18) = a7;
  long long v16 = -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:]([PMLHashingVectorizer alloc], "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", v14, v13, v12, location, length, v9, v18, v15, v19, 0, 0, 0, 2, 0);

  return v16;
}

+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9 idVectorLength:(unint64_t)a10 extraIdOptions:(unint64_t)a11 vectorizerStrategy:(unint64_t)a12 vectorNormalization:(int64_t)a13 vocab:(id)a14
{
  BOOL v24 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v16 = *(void *)&a3;
  id v17 = a14;
  id v18 = a8;
  LOBYTE(v22) = a9;
  LOBYTE(v21) = a7;
  uint64_t v19 = -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:]([PMLHashingVectorizer alloc], "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", v16, location, length, a5.location, a5.length, v24, v21, v18, v22, a10, a11, a12, a13, v17);

  return v19;
}

+ (id)withBucketSize:(int)a3 characterNGramRange:(_NSRange)a4 tokenNGramRange:(_NSRange)a5 shouldNormalizeTokens:(BOOL)a6 shouldNormalizeCharacters:(BOOL)a7 localeForNonwordTokens:(id)a8 tokenizeNewlines:(BOOL)a9 idVectorLength:(unint64_t)a10 extraIdOptions:(unint64_t)a11 vectorizerStrategy:(unint64_t)a12 vectorNormalization:(int64_t)a13
{
  BOOL v23 = a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v14 = a4.length;
  NSUInteger v15 = a4.location;
  uint64_t v16 = *(void *)&a3;
  id v17 = a8;
  LOBYTE(v21) = a9;
  LOBYTE(v20) = a7;
  id v18 = -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:]([PMLHashingVectorizer alloc], "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", v16, v15, v14, location, length, v23, v20, v17, v21, a10, a11, a12, a13, 0);

  return v18;
}

+ (id)withBucketSize:(int)a3 ngrams:(int)a4 localeForNonwordTokens:(id)a5 tokenizeNewlines:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v9 = a5;
  int v10 = [[PMLHashingVectorizer alloc] initWithBucketSize:v8 ngrams:v7 localeForNonwordTokens:v9 tokenizeNewlines:v6];

  return v10;
}

+ (id)withBucketSize:(int)a3 andNgrams:(int)a4
{
  id v4 = [[PMLHashingVectorizer alloc] initWithBucketSize:*(void *)&a3 ngrams:*(void *)&a4 localeForNonwordTokens:0 tokenizeNewlines:0];
  return v4;
}

+ (id)withBucketSize:(int)a3 andCharNgramOrder:(int)a4
{
  LOBYTE(v7) = 0;
  LOBYTE(v6) = 0;
  id v4 = -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:]([PMLHashingVectorizer alloc], "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", *(void *)&a3, a4, 1, 0, 0, 1, v6, 0, v7, 0, 0, 3, -1, 0);
  return v4;
}

+ (id)withBucketSize:(int)a3 andNgramOrder:(int)a4
{
  LOBYTE(v7) = 0;
  LOBYTE(v6) = 0;
  id v4 = -[PMLHashingVectorizer initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:]([PMLHashingVectorizer alloc], "initWithBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:idVectorLength:extraIdOptions:vectorizerStrategy:vectorNormalization:vocab:", *(void *)&a3, 0, 0, a4, 1, 1, v6, 0, v7, 0, 0, 2, -1, 0);
  return v4;
}

@end