@interface PRCandidateList
- (BOOL)isFull;
- (PRCandidateList)initWithMaxCount:(unint64_t)a3 defaultReplacementRange:(_NSRange)a4 customErrorModel:(id)a5 capitalizationDictionaryArray:(id)a6;
- (_NSRange)defaultReplacementRange;
- (id)candidateStrings;
- (id)candidateWithString:(id)a3;
- (id)candidates;
- (id)description;
- (unint64_t)count;
- (unint64_t)maxCount;
- (void)addCandidate:(id)a3;
- (void)addCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 errorType:(unint64_t)a5;
- (void)addCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 errorType:(unint64_t)a6;
- (void)addCandidateWithString:(id)a3 errorType:(unint64_t)a4;
- (void)addCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5;
- (void)addCandidateWithWords:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5;
- (void)addInsertionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedPrecedingCharacter:(unsigned __int16)a6 insertedCharacter:(unsigned __int16)a7 intendedFollowingCharacter:(unsigned __int16)a8;
- (void)addOmissionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedPrecedingCharacter:(unsigned __int16)a6 omittedCharacter:(unsigned __int16)a7 intendedFollowingCharacter:(unsigned __int16)a8;
- (void)addReplacementCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedCharacter:(unsigned __int16)a6 actualCharacter:(unsigned __int16)a7;
- (void)addTranspositionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedFirstCharacter:(unsigned __int16)a6 intendedSecondCharacter:(unsigned __int16)a7;
- (void)dealloc;
@end

@implementation PRCandidateList

- (PRCandidateList)initWithMaxCount:(unint64_t)a3 defaultReplacementRange:(_NSRange)a4 customErrorModel:(id)a5 capitalizationDictionaryArray:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v13.receiver = self;
  v13.super_class = (Class)PRCandidateList;
  v11 = [(PRCandidateList *)&v13 init];
  if (v11)
  {
    v11->_candidates = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v11->_maxCount = a3;
    v11->_defaultReplacementRange.NSUInteger location = location;
    v11->_defaultReplacementRange.NSUInteger length = length;
    v11->_errorModel = [[PRErrorModel alloc] initWithCustomErrorModel:a5];
    v11->_capitalizationDictionaryArray = (NSArray *)[a6 copy];
  }
  return v11;
}

- (id)description
{
  return (id)[(NSMutableArray *)self->_candidates componentsJoinedByString:@"/"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRCandidateList;
  [(PRCandidateList *)&v3 dealloc];
}

- (void)addCandidate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a3 && ![(PRCandidateList *)self isFull])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    candidates = self->_candidates;
    uint64_t v6 = [(NSMutableArray *)candidates countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(candidates);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(a3, "string"), "isEqualToString:", objc_msgSend(v10, "string")))
          {
            if ([a3 hasCustomErrorScore])
            {
              [a3 errorScore];
              objc_msgSend(v10, "setErrorScore:");
              [v10 setCustomErrorScore:1];
            }
            else
            {
              [v10 errorScore];
              double v12 = v11;
              [a3 errorScore];
              if (v12 < v13)
              {
                [a3 errorScore];
                objc_msgSend(v10, "setErrorScore:");
              }
            }
            return;
          }
        }
        uint64_t v7 = [(NSMutableArray *)candidates countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    [(NSMutableArray *)self->_candidates addObject:a3];
  }
}

- (void)addCandidateWithWords:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5
{
  uint64_t v6 = +[PRCandidate candidateWithWords:replacementRange:errorType:errorModel:](PRCandidate, "candidateWithWords:replacementRange:errorType:errorModel:", a3, a4.location, a4.length, a5, self->_errorModel);
  [(PRCandidateList *)self addCandidate:v6];
}

- (void)addCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5
{
  uint64_t v6 = +[PRCandidate candidateWithString:replacementRange:errorType:errorModel:](PRCandidate, "candidateWithString:replacementRange:errorType:errorModel:", a3, a4.location, a4.length, a5, self->_errorModel);
  [(PRCandidateList *)self addCandidate:v6];
}

- (void)addCandidateWithString:(id)a3 errorType:(unint64_t)a4
{
  v5 = +[PRCandidate candidateWithString:replacementRange:errorType:errorModel:](PRCandidate, "candidateWithString:replacementRange:errorType:errorModel:", a3, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a4, self->_errorModel);
  [(PRCandidateList *)self addCandidate:v5];
}

- (void)addCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 errorType:(unint64_t)a5
{
  uint64_t v6 = +[PRCandidate candidateWithBuffer:encoding:transform:replacementRange:errorType:errorModel:capitalizationDictionaryArray:](PRCandidate, "candidateWithBuffer:encoding:transform:replacementRange:errorType:errorModel:capitalizationDictionaryArray:", a3, *(void *)&a4, 0, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a5, self->_errorModel, self->_capitalizationDictionaryArray);
  [(PRCandidateList *)self addCandidate:v6];
}

- (void)addCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 errorType:(unint64_t)a6
{
  uint64_t v7 = +[PRCandidate candidateWithBuffer:encoding:transform:replacementRange:errorType:errorModel:capitalizationDictionaryArray:](PRCandidate, "candidateWithBuffer:encoding:transform:replacementRange:errorType:errorModel:capitalizationDictionaryArray:", a3, *(void *)&a4, a5, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a6, self->_errorModel, self->_capitalizationDictionaryArray);
  [(PRCandidateList *)self addCandidate:v7];
}

- (void)addReplacementCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedCharacter:(unsigned __int16)a6 actualCharacter:(unsigned __int16)a7
{
  LOWORD(v9) = a7;
  id v8 = +[PRCandidate replacementCandidateWithBuffer:encoding:transform:replacementRange:intendedCharacter:actualCharacter:errorModel:capitalizationDictionaryArray:](PRCandidate, "replacementCandidateWithBuffer:encoding:transform:replacementRange:intendedCharacter:actualCharacter:errorModel:capitalizationDictionaryArray:", a3, *(void *)&a4, a5, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a6, v9, self->_errorModel, self->_capitalizationDictionaryArray);
  [(PRCandidateList *)self addCandidate:v8];
}

- (void)addTranspositionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedFirstCharacter:(unsigned __int16)a6 intendedSecondCharacter:(unsigned __int16)a7
{
  LOWORD(v9) = a7;
  id v8 = +[PRCandidate transpositionCandidateWithBuffer:encoding:transform:replacementRange:intendedFirstCharacter:intendedSecondCharacter:errorModel:capitalizationDictionaryArray:](PRCandidate, "transpositionCandidateWithBuffer:encoding:transform:replacementRange:intendedFirstCharacter:intendedSecondCharacter:errorModel:capitalizationDictionaryArray:", a3, *(void *)&a4, a5, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a6, v9, self->_errorModel, self->_capitalizationDictionaryArray);
  [(PRCandidateList *)self addCandidate:v8];
}

- (void)addInsertionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedPrecedingCharacter:(unsigned __int16)a6 insertedCharacter:(unsigned __int16)a7 intendedFollowingCharacter:(unsigned __int16)a8
{
  WORD1(v10) = a8;
  LOWORD(v10) = a7;
  id v9 = +[PRCandidate insertionCandidateWithBuffer:a3 encoding:*(void *)&a4 transform:a5 replacementRange:self->_defaultReplacementRange.location intendedPrecedingCharacter:self->_defaultReplacementRange.length insertedCharacter:a6 intendedFollowingCharacter:v10 errorModel:self->_errorModel capitalizationDictionaryArray:self->_capitalizationDictionaryArray];
  [(PRCandidateList *)self addCandidate:v9];
}

- (void)addOmissionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedPrecedingCharacter:(unsigned __int16)a6 omittedCharacter:(unsigned __int16)a7 intendedFollowingCharacter:(unsigned __int16)a8
{
  WORD1(v10) = a8;
  LOWORD(v10) = a7;
  id v9 = +[PRCandidate omissionCandidateWithBuffer:a3 encoding:*(void *)&a4 transform:a5 replacementRange:self->_defaultReplacementRange.location intendedPrecedingCharacter:self->_defaultReplacementRange.length omittedCharacter:a6 intendedFollowingCharacter:v10 errorModel:self->_errorModel capitalizationDictionaryArray:self->_capitalizationDictionaryArray];
  [(PRCandidateList *)self addCandidate:v9];
}

- (id)candidates
{
  return self->_candidates;
}

- (id)candidateStrings
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF980] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  candidates = self->_candidates;
  uint64_t v5 = [(NSMutableArray *)candidates countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(candidates);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "string"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)candidates countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_candidates count];
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (BOOL)isFull
{
  unint64_t v3 = [(PRCandidateList *)self count];
  return v3 >= [(PRCandidateList *)self maxCount];
}

- (_NSRange)defaultReplacementRange
{
  NSUInteger length = self->_defaultReplacementRange.length;
  NSUInteger location = self->_defaultReplacementRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)candidateWithString:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  candidates = self->_candidates;
  uint64_t v5 = [(NSMutableArray *)candidates countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(candidates);
    }
    id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "string"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)candidates countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

@end