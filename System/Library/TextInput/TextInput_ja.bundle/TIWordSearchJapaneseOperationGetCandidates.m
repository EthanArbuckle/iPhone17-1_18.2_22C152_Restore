@interface TIWordSearchJapaneseOperationGetCandidates
- (BOOL)allowIncompleteRomaji;
- (BOOL)flickUsed;
- (BOOL)phraseBoundarySet;
- (BOOL)referenceMode;
- (BOOL)singlePhrase;
- (NSString)contextString;
- (NSString)previousCacheKey;
- (TIWordSearchJapaneseOperationGetCandidates)initWithWordSearch:(id)a3 inputString:(id)a4 keyboardInput:(id)a5 contextString:(id)a6 segmentBreakIndex:(unint64_t)a7 predictionEnabled:(BOOL)a8 reanalysisMode:(BOOL)a9 autocapitalizationType:(unint64_t)a10 target:(id)a11 action:(SEL)a12 geometryModelData:(id)a13 flickUsed:(BOOL)a14 phraseBoundarySet:(BOOL)a15 hardwareKeyboardMode:(BOOL)a16 logger:(id)a17;
- (id)results;
- (void)checkForCachedResultsIfNeeded;
- (void)setAllowIncompleteRomaji:(BOOL)a3;
- (void)setFlickUsed:(BOOL)a3;
- (void)setPhraseBoundarySet:(BOOL)a3;
- (void)setPreviousCacheKey:(id)a3;
- (void)setReferenceMode:(BOOL)a3;
- (void)setSinglePhrase:(BOOL)a3;
@end

@implementation TIWordSearchJapaneseOperationGetCandidates

- (TIWordSearchJapaneseOperationGetCandidates)initWithWordSearch:(id)a3 inputString:(id)a4 keyboardInput:(id)a5 contextString:(id)a6 segmentBreakIndex:(unint64_t)a7 predictionEnabled:(BOOL)a8 reanalysisMode:(BOOL)a9 autocapitalizationType:(unint64_t)a10 target:(id)a11 action:(SEL)a12 geometryModelData:(id)a13 flickUsed:(BOOL)a14 phraseBoundarySet:(BOOL)a15 hardwareKeyboardMode:(BOOL)a16 logger:(id)a17
{
  BOOL v28 = a8;
  id v22 = a6;
  v29.receiver = self;
  v29.super_class = (Class)TIWordSearchJapaneseOperationGetCandidates;
  v23 = [(TIWordSearchOperationGetCandidates *)&v29 initWithWordSearch:a3 inputString:a4 keyboardInput:a5 segmentBreakIndex:a7 predictionEnabled:v28 reanalysisMode:a9 autocapitalizationType:0 target:a11 action:a12 geometryModelData:a13 hardwareKeyboardMode:a16 logger:a17];
  if (v23)
  {
    uint64_t v24 = [v22 copy];
    contextString = v23->_contextString;
    v23->_contextString = (NSString *)v24;

    v23->_flickUsed = a14;
    v23->_phraseBoundarySet = a15;
  }

  return v23;
}

- (id)results
{
  [(TIWordSearchJapaneseOperationGetCandidates *)self checkForCachedResultsIfNeeded];
  v5.receiver = self;
  v5.super_class = (Class)TIWordSearchJapaneseOperationGetCandidates;
  v3 = [(TIWordSearchOperationGetCandidates *)&v5 results];
  return v3;
}

- (void)checkForCachedResultsIfNeeded
{
  v3 = [(TIWordSearchOperationGetCandidates *)self wordSearch];
  id v8 = [v3 candidatesCacheKeyForOperation:self];

  uint64_t v4 = [(TIWordSearchJapaneseOperationGetCandidates *)self previousCacheKey];
  if (!v4
    || (objc_super v5 = (void *)v4,
        [(TIWordSearchJapaneseOperationGetCandidates *)self previousCacheKey],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v8 isEqualToString:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    [(TIWordSearchOperationGetCandidates *)self checkForCachedResults];
    [(TIWordSearchJapaneseOperationGetCandidates *)self setPreviousCacheKey:v8];
  }
}

- (BOOL)flickUsed
{
  return self->_flickUsed;
}

- (void)setFlickUsed:(BOOL)a3
{
  self->_flickUsed = a3;
}

- (NSString)contextString
{
  return self->_contextString;
}

- (BOOL)phraseBoundarySet
{
  return self->_phraseBoundarySet;
}

- (void)setPhraseBoundarySet:(BOOL)a3
{
  self->_phraseBoundarySet = a3;
}

- (BOOL)allowIncompleteRomaji
{
  return self->_allowIncompleteRomaji;
}

- (void)setAllowIncompleteRomaji:(BOOL)a3
{
  self->_allowIncompleteRomaji = a3;
}

- (BOOL)referenceMode
{
  return self->_referenceMode;
}

- (void)setReferenceMode:(BOOL)a3
{
  self->_referenceMode = a3;
}

- (BOOL)singlePhrase
{
  return self->_singlePhrase;
}

- (void)setSinglePhrase:(BOOL)a3
{
  self->_singlePhrase = a3;
}

- (NSString)previousCacheKey
{
  return self->_previousCacheKey;
}

- (void)setPreviousCacheKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousCacheKey, 0);
  objc_storeStrong((id *)&self->_contextString, 0);
}

@end