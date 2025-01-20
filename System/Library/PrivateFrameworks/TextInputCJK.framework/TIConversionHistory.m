@interface TIConversionHistory
- (BOOL)inputChangedSinceLastConversion;
- (BOOL)invalid;
- (BOOL)isValid;
- (BOOL)shouldRevertConvertedCandidateOnDeletionFromMarkedText:(id)a3;
- (NSMutableArray)convertedCandidates;
- (NSMutableArray)mutableConvertedCandidateRefs;
- (NSMutableString)mutableConvertedCandidateText;
- (NSString)convertedCandidateText;
- (TIConversionHistory)init;
- (TIConvertedCandidate)lastConvertedCandidate;
- (unint64_t)convertedLength;
- (unint64_t)revertCount;
- (void)addCandidate:(id)a3 candidateRef:(id)a4 replacedAmbiguousPinyinSyllables:(id)a5 replacementUnambiguousPinyinSyllables:(id)a6 convertedInput:(id)a7;
- (void)clear;
- (void)didRevertLastConvertedCandidate;
- (void)invalidate;
- (void)setConvertedCandidates:(id)a3;
- (void)setInputChangedSinceLastConversion:(BOOL)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setMutableConvertedCandidateRefs:(id)a3;
- (void)setMutableConvertedCandidateText:(id)a3;
- (void)setRevertCount:(unint64_t)a3;
@end

@implementation TIConversionHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableConvertedCandidateText, 0);
  objc_storeStrong((id *)&self->_mutableConvertedCandidateRefs, 0);
  objc_storeStrong((id *)&self->_convertedCandidates, 0);
}

- (void)setRevertCount:(unint64_t)a3
{
  self->_revertCount = a3;
}

- (unint64_t)revertCount
{
  return self->_revertCount;
}

- (void)setMutableConvertedCandidateText:(id)a3
{
}

- (NSMutableString)mutableConvertedCandidateText
{
  return self->_mutableConvertedCandidateText;
}

- (void)setMutableConvertedCandidateRefs:(id)a3
{
}

- (NSMutableArray)mutableConvertedCandidateRefs
{
  return self->_mutableConvertedCandidateRefs;
}

- (void)setConvertedCandidates:(id)a3
{
}

- (NSMutableArray)convertedCandidates
{
  return self->_convertedCandidates;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (void)setInputChangedSinceLastConversion:(BOOL)a3
{
  self->_inputChangedSinceLastConversion = a3;
}

- (BOOL)inputChangedSinceLastConversion
{
  return self->_inputChangedSinceLastConversion;
}

- (TIConvertedCandidate)lastConvertedCandidate
{
  v2 = [(TIConversionHistory *)self convertedCandidates];
  v3 = [v2 lastObject];

  return (TIConvertedCandidate *)v3;
}

- (BOOL)shouldRevertConvertedCandidateOnDeletionFromMarkedText:(id)a3
{
  id v4 = a3;
  if ([(TIConversionHistory *)self invalid]
    || ![v4 length]
    || [(TIConversionHistory *)self revertCount]
    || ([(TIConversionHistory *)self mutableConvertedCandidateText],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v4 hasPrefix:v5],
        v5,
        !v6))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    uint64_t v7 = [v4 length];
    if (v7 == [(TIConversionHistory *)self convertedLength]) {
      LOBYTE(v8) = 1;
    }
    else {
      BOOL v8 = ![(TIConversionHistory *)self inputChangedSinceLastConversion];
    }
  }

  return v8;
}

- (void)didRevertLastConvertedCandidate
{
  if (![(TIConversionHistory *)self invalid])
  {
    v3 = [(TIConversionHistory *)self lastConvertedCandidate];
    id v4 = [v3 candidate];
    id v9 = [v4 candidate];

    v5 = [(TIConversionHistory *)self convertedCandidates];
    [v5 removeLastObject];

    int v6 = [(TIConversionHistory *)self mutableConvertedCandidateRefs];
    [v6 removeLastObject];

    uint64_t v7 = [(TIConversionHistory *)self mutableConvertedCandidateText];
    BOOL v8 = [(TIConversionHistory *)self mutableConvertedCandidateText];
    objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v8, "length") - objc_msgSend(v9, "length"), objc_msgSend(v9, "length"));

    [(TIConversionHistory *)self setInputChangedSinceLastConversion:0];
    [(TIConversionHistory *)self setRevertCount:[(TIConversionHistory *)self revertCount] + 1];
  }
}

- (void)addCandidate:(id)a3 candidateRef:(id)a4 replacedAmbiguousPinyinSyllables:(id)a5 replacementUnambiguousPinyinSyllables:(id)a6 convertedInput:(id)a7
{
  id v21 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (![(TIConversionHistory *)self invalid])
  {
    v16 = [[TIConvertedCandidate alloc] initWithCandidate:v21 replacedAmbiguousPinyinSyllables:v13 replacementUnambiguousPinyinSyllables:v14 convertedInput:v15];
    v17 = [(TIConversionHistory *)self convertedCandidates];
    [v17 addObject:v16];

    v18 = [(TIConversionHistory *)self mutableConvertedCandidateRefs];
    [v18 addObject:v12];

    v19 = [(TIConversionHistory *)self mutableConvertedCandidateText];
    v20 = [v21 candidate];
    [v19 appendString:v20];

    [(TIConversionHistory *)self setInputChangedSinceLastConversion:0];
    [(TIConversionHistory *)self setRevertCount:0];
  }
}

- (BOOL)isValid
{
  return !self->_invalid;
}

- (void)invalidate
{
  self->_invalid = 1;
}

- (NSString)convertedCandidateText
{
  v2 = [(TIConversionHistory *)self mutableConvertedCandidateText];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (unint64_t)convertedLength
{
  v2 = [(TIConversionHistory *)self mutableConvertedCandidateText];
  unint64_t v3 = [v2 length];

  return v3;
}

- (void)clear
{
  unint64_t v3 = [(TIConversionHistory *)self convertedCandidates];
  [v3 removeAllObjects];

  id v4 = [(TIConversionHistory *)self mutableConvertedCandidateRefs];
  [v4 removeAllObjects];

  v5 = [(TIConversionHistory *)self mutableConvertedCandidateText];
  [v5 setString:&stru_270B867F0];

  *(_WORD *)&self->_inputChangedSinceLastConversion = 0;
  [(TIConversionHistory *)self setRevertCount:0];
}

- (TIConversionHistory)init
{
  v10.receiver = self;
  v10.super_class = (Class)TIConversionHistory;
  v2 = [(TIConversionHistory *)&v10 init];
  if (v2)
  {
    unint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    convertedCandidates = v2->_convertedCandidates;
    v2->_convertedCandidates = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableConvertedCandidateRefs = v2->_mutableConvertedCandidateRefs;
    v2->_mutableConvertedCandidateRefs = v5;

    uint64_t v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    mutableConvertedCandidateText = v2->_mutableConvertedCandidateText;
    v2->_mutableConvertedCandidateText = v7;
  }
  return v2;
}

@end