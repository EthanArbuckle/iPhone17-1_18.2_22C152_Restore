@interface PRCandidate
+ (id)candidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 errorScore:(double)a7 capitalizationDictionaryArray:(id)a8;
+ (id)candidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 errorType:(unint64_t)a7 errorModel:(id)a8 capitalizationDictionaryArray:(id)a9;
+ (id)candidateWithString:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5;
+ (id)candidateWithString:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5 errorModel:(id)a6;
+ (id)candidateWithWords:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5;
+ (id)candidateWithWords:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5 errorModel:(id)a6;
+ (id)insertionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedPrecedingCharacter:(unsigned __int16)a7 insertedCharacter:(unsigned __int16)a8 intendedFollowingCharacter:(unsigned __int16)a9 errorModel:(id)a10 capitalizationDictionaryArray:(id)a11;
+ (id)insertionCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedPrecedingCharacter:(unsigned __int16)a5 insertedCharacter:(unsigned __int16)a6 intendedFollowingCharacter:(unsigned __int16)a7 errorModel:(id)a8;
+ (id)omissionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedPrecedingCharacter:(unsigned __int16)a7 omittedCharacter:(unsigned __int16)a8 intendedFollowingCharacter:(unsigned __int16)a9 errorModel:(id)a10 capitalizationDictionaryArray:(id)a11;
+ (id)omissionCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedPrecedingCharacter:(unsigned __int16)a5 omittedCharacter:(unsigned __int16)a6 intendedFollowingCharacter:(unsigned __int16)a7 errorModel:(id)a8;
+ (id)replacementCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedCharacter:(unsigned __int16)a7 actualCharacter:(unsigned __int16)a8 errorModel:(id)a9 capitalizationDictionaryArray:(id)a10;
+ (id)replacementCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedCharacter:(unsigned __int16)a5 actualCharacter:(unsigned __int16)a6 errorModel:(id)a7;
+ (id)transpositionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedFirstCharacter:(unsigned __int16)a7 intendedSecondCharacter:(unsigned __int16)a8 errorModel:(id)a9 capitalizationDictionaryArray:(id)a10;
+ (id)transpositionCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedFirstCharacter:(unsigned __int16)a5 intendedSecondCharacter:(unsigned __int16)a6 errorModel:(id)a7;
- (BOOL)hasCustomErrorScore;
- (BOOL)isBlocklisted;
- (NSArray)candidateWords;
- (NSString)string;
- (PRCandidate)initWithCandidateWords:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5;
- (PRCandidate)initWithString:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5;
- (_NSRange)replacementRange;
- (double)errorScore;
- (double)lexiconScore;
- (double)linguisticScore;
- (double)score;
- (id)description;
- (unint64_t)numberOfWords;
- (void)dealloc;
- (void)setBlocklisted:(BOOL)a3;
- (void)setCustomErrorScore:(BOOL)a3;
- (void)setErrorScore:(double)a3;
- (void)setLexiconScore:(double)a3;
- (void)setLinguisticScore:(double)a3;
@end

@implementation PRCandidate

- (PRCandidate)initWithCandidateWords:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v11.receiver = self;
  v11.super_class = (Class)PRCandidate;
  v9 = [(PRCandidate *)&v11 init];
  if (v9)
  {
    v9->_candidateWords = (NSArray *)[a3 copy];
    v9->_replacementRange.NSUInteger location = location;
    v9->_replacementRange.NSUInteger length = length;
    v9->_errorScore = a5;
    v9->_linguisticScore = 0.0;
    v9->_lexiconScore = 0.0;
    v9->_blocklisted = 0;
  }
  return v9;
}

- (PRCandidate)initWithString:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", (id)objc_msgSend(a3, "copy"));
  return -[PRCandidate initWithCandidateWords:replacementRange:errorScore:](self, "initWithCandidateWords:replacementRange:errorScore:", v9, location, length, a5);
}

+ (id)candidateWithWords:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5
{
  if (!a3) {
    return 0;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (![a3 count]) {
    return 0;
  }
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithCandidateWords:replacementRange:errorScore:", a3, location, length, a5);
  return v10;
}

+ (id)candidateWithWords:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5 errorModel:(id)a6
{
  if (!a3) {
    return 0;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (![a3 count]) {
    return 0;
  }
  id v12 = objc_alloc((Class)a1);
  [a6 errorScoreForType:a5];
  v13 = (void *)[v12 initWithCandidateWords:a3 replacementRange:location errorScore:length];
  return v13;
}

+ (id)candidateWithString:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5
{
  if (!a3) {
    return 0;
  }
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithString:replacementRange:errorScore:", a3, a4.location, a4.length, a5);
  return v5;
}

+ (id)candidateWithString:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5 errorModel:(id)a6
{
  if (!a3) {
    return 0;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = objc_alloc((Class)a1);
  [a6 errorScoreForType:a5];
  id v12 = (void *)[v11 initWithString:a3 replacementRange:location errorScore:length];
  return v12;
}

+ (id)replacementCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedCharacter:(unsigned __int16)a5 actualCharacter:(unsigned __int16)a6 errorModel:(id)a7
{
  if (!a3) {
    return 0;
  }
  uint64_t v8 = a6;
  uint64_t v9 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = objc_alloc((Class)a1);
  [a7 replacementErrorScoreForIntendedCharacter:v9 actualCharacter:v8];
  id v14 = (id)[v13 initWithString:a3 replacementRange:location errorScore:length];
  if (v14 && [a7 hasCustomReplacementErrorScores]) {
    [v14 setCustomErrorScore:1];
  }
  return v14;
}

+ (id)transpositionCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedFirstCharacter:(unsigned __int16)a5 intendedSecondCharacter:(unsigned __int16)a6 errorModel:(id)a7
{
  if (!a3) {
    return 0;
  }
  uint64_t v8 = a6;
  uint64_t v9 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = objc_alloc((Class)a1);
  [a7 transpositionErrorScoreForIntendedFirstCharacter:v9 intendedSecondCharacter:v8];
  id v14 = (id)[v13 initWithString:a3 replacementRange:location errorScore:length];
  if (v14 && [a7 hasCustomTranspositionErrorScores]) {
    [v14 setCustomErrorScore:1];
  }
  return v14;
}

+ (id)insertionCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedPrecedingCharacter:(unsigned __int16)a5 insertedCharacter:(unsigned __int16)a6 intendedFollowingCharacter:(unsigned __int16)a7 errorModel:(id)a8
{
  if (!a3) {
    return 0;
  }
  uint64_t v8 = a7;
  uint64_t v9 = a6;
  uint64_t v10 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = objc_alloc((Class)a1);
  [a8 insertionErrorScoreForIntendedPrecedingCharacter:v10 insertedCharacter:v9 intendedFollowingCharacter:v8];
  id v15 = (id)[v14 initWithString:a3 replacementRange:location errorScore:length];
  if (v15 && [a8 hasCustomInsertionErrorScores]) {
    [v15 setCustomErrorScore:1];
  }
  return v15;
}

+ (id)omissionCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedPrecedingCharacter:(unsigned __int16)a5 omittedCharacter:(unsigned __int16)a6 intendedFollowingCharacter:(unsigned __int16)a7 errorModel:(id)a8
{
  if (!a3) {
    return 0;
  }
  uint64_t v8 = a7;
  uint64_t v9 = a6;
  uint64_t v10 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = objc_alloc((Class)a1);
  [a8 omissionErrorScoreForIntendedPrecedingCharacter:v10 omittedCharacter:v9 intendedFollowingCharacter:v8];
  id v15 = (id)[v14 initWithString:a3 replacementRange:location errorScore:length];
  if (v15 && [a8 hasCustomOmissionErrorScores]) {
    [v15 setCustomErrorScore:1];
  }
  return v15;
}

+ (id)candidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 errorScore:(double)a7 capitalizationDictionaryArray:(id)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v14 = (id)CFStringCreateWithCString(0, a3, a4);
  uint64_t v15 = [(__CFString *)v14 lowercaseString];
  uint64_t v16 = 0;
  if (a4 == 1284 && a5 >= 2)
  {
    uint64_t v16 = candidateWithBuffer_encoding_transform_replacementRange_errorScore_capitalizationDictionaryArray__turkishLocale;
    if (!candidateWithBuffer_encoding_transform_replacementRange_errorScore_capitalizationDictionaryArray__turkishLocale)
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"tr"];
      candidateWithBuffer_encoding_transform_replacementRange_errorScore_capitalizationDictionaryArray__turkishLocale = v16;
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v17 = [a8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
LABEL_7:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v26 != v19) {
        objc_enumerationMutation(a8);
      }
      uint64_t v21 = [*(id *)(*((void *)&v25 + 1) + 8 * v20) objectForKey:v15];
      if (v21) {
        goto LABEL_20;
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = [a8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v18) {
          goto LABEL_7;
        }
        break;
      }
    }
  }
  switch(a5)
  {
    case 3uLL:
      uint64_t v21 = initialCapitalizedString(v14, v16);
LABEL_20:
      uint64_t v22 = v21;
      return (id)objc_msgSend(a1, "candidateWithString:replacementRange:errorScore:", v22, location, length, a7);
    case 2uLL:
      uint64_t v21 = uppercasedString(v14, v16);
      goto LABEL_20;
    case 1uLL:
      uint64_t v22 = v15;
      break;
    default:
      uint64_t v22 = (uint64_t)v14;
      break;
  }
  return (id)objc_msgSend(a1, "candidateWithString:replacementRange:errorScore:", v22, location, length, a7);
}

+ (id)candidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 errorType:(unint64_t)a7 errorModel:(id)a8 capitalizationDictionaryArray:(id)a9
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v12 = *(void *)&a4;
  [a8 errorScoreForType:a7];
  return (id)[a1 candidateWithBuffer:a3 encoding:v12 transform:a5 replacementRange:location errorScore:length capitalizationDictionaryArray:a9];
}

+ (id)replacementCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedCharacter:(unsigned __int16)a7 actualCharacter:(unsigned __int16)a8 errorModel:(id)a9 capitalizationDictionaryArray:(id)a10
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v13 = *(void *)&a4;
  [a9 replacementErrorScoreForIntendedCharacter:a7 actualCharacter:a8];
  uint64_t v16 = (void *)[a1 candidateWithBuffer:a3 encoding:v13 transform:a5 replacementRange:location errorScore:length capitalizationDictionaryArray:a10];
  if (v16 && [a9 hasCustomReplacementErrorScores]) {
    [v16 setCustomErrorScore:1];
  }
  return v16;
}

+ (id)transpositionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedFirstCharacter:(unsigned __int16)a7 intendedSecondCharacter:(unsigned __int16)a8 errorModel:(id)a9 capitalizationDictionaryArray:(id)a10
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v13 = *(void *)&a4;
  [a9 transpositionErrorScoreForIntendedFirstCharacter:a7 intendedSecondCharacter:a8];
  uint64_t v16 = (void *)[a1 candidateWithBuffer:a3 encoding:v13 transform:a5 replacementRange:location errorScore:length capitalizationDictionaryArray:a10];
  if (v16 && [a9 hasCustomTranspositionErrorScores]) {
    [v16 setCustomErrorScore:1];
  }
  return v16;
}

+ (id)insertionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedPrecedingCharacter:(unsigned __int16)a7 insertedCharacter:(unsigned __int16)a8 intendedFollowingCharacter:(unsigned __int16)a9 errorModel:(id)a10 capitalizationDictionaryArray:(id)a11
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v14 = *(void *)&a4;
  [a10 insertionErrorScoreForIntendedPrecedingCharacter:a7 insertedCharacter:a8 intendedFollowingCharacter:a9];
  uint64_t v17 = (void *)[a1 candidateWithBuffer:a3 encoding:v14 transform:a5 replacementRange:location errorScore:length capitalizationDictionaryArray:a11];
  if (v17 && [a10 hasCustomInsertionErrorScores]) {
    [v17 setCustomErrorScore:1];
  }
  return v17;
}

+ (id)omissionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedPrecedingCharacter:(unsigned __int16)a7 omittedCharacter:(unsigned __int16)a8 intendedFollowingCharacter:(unsigned __int16)a9 errorModel:(id)a10 capitalizationDictionaryArray:(id)a11
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v14 = *(void *)&a4;
  [a10 omissionErrorScoreForIntendedPrecedingCharacter:a7 omittedCharacter:a8 intendedFollowingCharacter:a9];
  uint64_t v17 = (void *)[a1 candidateWithBuffer:a3 encoding:v14 transform:a5 replacementRange:location errorScore:length capitalizationDictionaryArray:a11];
  if (v17 && [a10 hasCustomOmissionErrorScores]) {
    [v17 setCustomErrorScore:1];
  }
  return v17;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PRCandidate *)self string];
  [(PRCandidate *)self errorScore];
  uint64_t v6 = v5;
  [(PRCandidate *)self linguisticScore];
  uint64_t v8 = v7;
  BOOL v9 = [(PRCandidate *)self isBlocklisted];
  [(PRCandidate *)self score];
  return (id)[v3 stringWithFormat:@"%@(%.2g,%.2g,%d;%.2g)", v4, v6, v8, v9, v10];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRCandidate;
  [(PRCandidate *)&v3 dealloc];
}

- (unint64_t)numberOfWords
{
  return [(NSArray *)self->_candidateWords count];
}

- (NSString)string
{
  NSUInteger v3 = [(NSArray *)self->_candidateWords count];
  candidateWords = self->_candidateWords;
  if (v3 == 1)
  {
    return (NSString *)[(NSArray *)candidateWords firstObject];
  }
  else
  {
    return [(NSArray *)candidateWords componentsJoinedByString:@" "];
  }
}

- (double)score
{
  return self->_errorScore + self->_linguisticScore;
}

- (NSArray)candidateWords
{
  return self->_candidateWords;
}

- (_NSRange)replacementRange
{
  NSUInteger length = self->_replacementRange.length;
  NSUInteger location = self->_replacementRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (double)errorScore
{
  return self->_errorScore;
}

- (void)setErrorScore:(double)a3
{
  self->_errorScore = a3;
}

- (double)linguisticScore
{
  return self->_linguisticScore;
}

- (void)setLinguisticScore:(double)a3
{
  self->_linguisticScore = a3;
}

- (double)lexiconScore
{
  return self->_lexiconScore;
}

- (void)setLexiconScore:(double)a3
{
  self->_lexiconScore = a3;
}

- (BOOL)isBlocklisted
{
  return self->_blocklisted;
}

- (void)setBlocklisted:(BOOL)a3
{
  self->_blocklisted = a3;
}

- (BOOL)hasCustomErrorScore
{
  return self->_hasCustomErrorScore;
}

- (void)setCustomErrorScore:(BOOL)a3
{
  self->_hasCustomErrorScore = a3;
}

@end