@interface TIWordSearchCandidateResultSet
+ (id)emptySet;
- (BOOL)isEmpty;
- (NSArray)autoconvertedCandidates;
- (NSArray)disambiguationCandidates;
- (NSArray)proactiveCandidates;
- (NSMutableArray)mutableCandidates;
- (NSMutableArray)mutableProactiveTriggers;
- (NSMutableDictionary)mutableCandidateRefsDictionary;
- (NSString)autoconvertedCandidateString;
- (NSString)autoconvertedInputString;
- (TIKeyboardCandidate)candidateAfterSegmentBreak;
- (TIWordSearchCandidateResultSet)init;
- (TIWordSearchCandidateResultSet)initWithCandidates:(id)a3 candidateRefsDictionary:(id)a4;
- (TIWordSearchCandidateResultSet)initWithCandidates:(id)a3 candidateRefsDictionary:(id)a4 disambiguationCandidates:(id)a5 selectedDisambiguationCandidateIndex:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)selectedDisambiguationCandidateIndex;
- (void)addCandidates:(id)a3 candidateRefsDictionary:(id)a4;
- (void)addMecabraCandidate:(id)a3 mecabraCandidateRef:(void *)a4;
- (void)addMecabraFacemarkCandidate:(void *)a3 forInput:(id)a4;
- (void)addMecabraProactiveCandidate:(void *)a3 triggerSourceType:(unsigned __int8)a4;
- (void)addProactiveTrigger:(id)a3;
- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4;
- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5;
- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5 deleteCount:(unint64_t)a6;
- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5 deleteCount:(unint64_t)a6 cursorMovement:(int64_t)a7;
- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5 deleteCount:(unint64_t)a6 cursorMovement:(int64_t)a7 annotation:(id)a8;
- (void)addSyntheticMecabraProactiveCandidate:(id)a3 triggerSourceType:(unsigned __int8)a4;
- (void)clearProactiveTriggers;
- (void)insertMecabraCandidate:(id)a3 mecabraCandidateRef:(void *)a4 atIndex:(unint64_t)a5;
- (void)insertStickers:(id)a3;
- (void)insertSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 atIndex:(unint64_t)a5;
- (void)moveCandidate:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (void)setAutoconvertedCandidateString:(id)a3;
- (void)setAutoconvertedCandidates:(id)a3;
- (void)setAutoconvertedInputString:(id)a3;
- (void)setAutoconvertedMecabraCandidates:(id)a3 candidateRefsDictionary:(id)a4;
- (void)setCandidateAfterSegmentBreak:(id)a3;
- (void)setDisambiguationCandidates:(id)a3;
- (void)setMutableCandidateRefsDictionary:(id)a3;
- (void)setMutableCandidates:(id)a3;
- (void)setProactiveCandidates:(id)a3;
- (void)setSelectedDisambiguationCandidateIndex:(unint64_t)a3;
- (void)updateSupplementalMecabraCandidate:(id)a3 withMecabraCandidateRef:(void *)a4;
@end

@implementation TIWordSearchCandidateResultSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableProactiveTriggers, 0);
  objc_storeStrong((id *)&self->_autoconvertedInputString, 0);
  objc_storeStrong((id *)&self->_autoconvertedCandidateString, 0);
  objc_storeStrong((id *)&self->_autoconvertedCandidates, 0);
  objc_storeStrong((id *)&self->_proactiveCandidates, 0);
  objc_storeStrong((id *)&self->_candidateAfterSegmentBreak, 0);
  objc_storeStrong((id *)&self->_disambiguationCandidates, 0);
  objc_storeStrong((id *)&self->_mutableCandidateRefsDictionary, 0);

  objc_storeStrong((id *)&self->_mutableCandidates, 0);
}

- (NSMutableArray)mutableProactiveTriggers
{
  return self->_mutableProactiveTriggers;
}

- (void)setAutoconvertedInputString:(id)a3
{
}

- (NSString)autoconvertedInputString
{
  return self->_autoconvertedInputString;
}

- (void)setAutoconvertedCandidateString:(id)a3
{
}

- (NSString)autoconvertedCandidateString
{
  return self->_autoconvertedCandidateString;
}

- (void)setAutoconvertedCandidates:(id)a3
{
}

- (NSArray)autoconvertedCandidates
{
  return self->_autoconvertedCandidates;
}

- (void)setProactiveCandidates:(id)a3
{
}

- (NSArray)proactiveCandidates
{
  return self->_proactiveCandidates;
}

- (void)setCandidateAfterSegmentBreak:(id)a3
{
}

- (TIKeyboardCandidate)candidateAfterSegmentBreak
{
  return self->_candidateAfterSegmentBreak;
}

- (void)setSelectedDisambiguationCandidateIndex:(unint64_t)a3
{
  self->_selectedDisambiguationCandidateIndex = a3;
}

- (unint64_t)selectedDisambiguationCandidateIndex
{
  return self->_selectedDisambiguationCandidateIndex;
}

- (void)setDisambiguationCandidates:(id)a3
{
}

- (NSArray)disambiguationCandidates
{
  return self->_disambiguationCandidates;
}

- (void)setMutableCandidateRefsDictionary:(id)a3
{
}

- (NSMutableDictionary)mutableCandidateRefsDictionary
{
  return self->_mutableCandidateRefsDictionary;
}

- (void)setMutableCandidates:(id)a3
{
}

- (NSMutableArray)mutableCandidates
{
  return self->_mutableCandidates;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TIWordSearchCandidateResultSet allocWithZone:a3];
  v5 = [(TIWordSearchCandidateResultSet *)self mutableCandidates];
  v6 = [(TIWordSearchCandidateResultSet *)self mutableCandidateRefsDictionary];
  v7 = [(TIWordSearchCandidateResultSet *)self disambiguationCandidates];
  v8 = [(TIWordSearchCandidateResultSet *)v4 initWithCandidates:v5 candidateRefsDictionary:v6 disambiguationCandidates:v7 selectedDisambiguationCandidateIndex:[(TIWordSearchCandidateResultSet *)self selectedDisambiguationCandidateIndex]];

  return v8;
}

- (void)updateSupplementalMecabraCandidate:(id)a3 withMecabraCandidateRef:(void *)a4
{
  id v8 = a3;
  if (MecabraCandidateIsSupplementalLexiconCandidate())
  {
    [v8 setSupplementalItemIdentifiers:MecabraCandidateGetSupplementalLexiconIdentifiers()];
    [v8 setSupplementalItemPrefix:0];
    unsigned __int16 v4 = [(id)MecabraCandidateGetSupplementalLexiconItemPrefix() shortValue];
    v5 = [v8 input];
    if ([v5 length])
    {
      v6 = [v8 input];
      int v7 = [v6 characterAtIndex:0];

      if (v7 == v4) {
        [v8 setSupplementalItemPrefix:v4];
      }
    }
    else
    {
    }
  }
}

- (void)clearProactiveTriggers
{
  if ([(NSMutableArray *)self->_mutableProactiveTriggers count])
  {
    mutableProactiveTriggers = self->_mutableProactiveTriggers;
    [(NSMutableArray *)mutableProactiveTriggers removeAllObjects];
  }
}

- (void)insertStickers:(id)a3
{
  id v8 = a3;
  if ([v8 count])
  {
    unsigned __int16 v4 = [(TIWordSearchCandidateResultSet *)self mutableCandidates];
    v5 = (void *)MEMORY[0x1E4F28D60];
    v6 = [(TIWordSearchCandidateResultSet *)self mutableCandidates];
    int v7 = objc_msgSend(v5, "indexSetWithIndexesInRange:", objc_msgSend(v6, "count") != 0, objc_msgSend(v8, "count"));
    [v4 insertObjects:v8 atIndexes:v7];
  }
}

- (void)moveCandidate:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v14 = a3;
  id v8 = [(TIWordSearchCandidateResultSet *)self candidates];
  unint64_t v9 = [v8 count];

  if (v9 > a4)
  {
    v10 = [(TIWordSearchCandidateResultSet *)self mutableCandidates];
    [v10 removeObjectAtIndex:a4];

    v11 = [(TIWordSearchCandidateResultSet *)self candidates];
    unint64_t v12 = [v11 count];

    if (v12 < a5) {
      a5 = v12;
    }
    v13 = [(TIWordSearchCandidateResultSet *)self mutableCandidates];
    [v13 insertObject:v14 atIndex:a5];
  }
}

- (void)setAutoconvertedMecabraCandidates:(id)a3 candidateRefsDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TIWordSearchCandidateResultSet *)self setAutoconvertedCandidates:v7];
  id v8 = [v7 valueForKey:@"candidate"];
  unint64_t v9 = [v8 componentsJoinedByString:&stru_1F3F7A998];
  [(TIWordSearchCandidateResultSet *)self setAutoconvertedCandidateString:v9];

  v10 = [v7 valueForKey:@"input"];

  v11 = [v10 componentsJoinedByString:&stru_1F3F7A998];
  [(TIWordSearchCandidateResultSet *)self setAutoconvertedInputString:v11];

  id v12 = [(TIWordSearchCandidateResultSet *)self mutableCandidateRefsDictionary];
  [v12 addEntriesFromDictionary:v6];
}

- (void)insertMecabraCandidate:(id)a3 mecabraCandidateRef:(void *)a4 atIndex:(unint64_t)a5
{
  id v11 = a3;
  [(TIWordSearchCandidateResultSet *)self updateSupplementalMecabraCandidate:v11 withMecabraCandidateRef:a4];
  id v8 = [(TIWordSearchCandidateResultSet *)self mutableCandidates];
  [v8 insertObject:v11 atIndex:a5];

  if (a4)
  {
    unint64_t v9 = [(TIWordSearchCandidateResultSet *)self mutableCandidateRefsDictionary];
    v10 = [v11 mecabraCandidatePointerValue];
    [v9 setObject:a4 forKey:v10];
  }
}

- (void)addProactiveTrigger:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(TIWordSearchCandidateResultSet *)self mutableProactiveTriggers];
    [v5 addObject:v4];
  }
}

- (void)addSyntheticMecabraProactiveCandidate:(id)a3 triggerSourceType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = (void *)MecabraProactiveCandidateCreate();
  [(TIWordSearchCandidateResultSet *)self addMecabraProactiveCandidate:v6 triggerSourceType:v4];
  if (v6)
  {
  }
}

- (void)addMecabraFacemarkCandidate:(void *)a3 forInput:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v17 = v6;
    BOOL v7 = MecabraCandidateGetType() == 7;
    id v6 = v17;
    if (v7)
    {
      id v8 = MecabraCandidateGetSurface();
      unint64_t v9 = MecabraCandidateGetAttributes();
      v10 = (void *)MEMORY[0x1E4FAE3C0];
      id v11 = [v9 objectForKeyedSubscript:@"category"];
      id v12 = [NSNumber numberWithUnsignedLongLong:a3];
      v13 = [v10 candidateWithCandidate:v8 category:v11 input:v17 mecabraCandidatePointerValue:v12];

      id v14 = [(TIWordSearchCandidateResultSet *)self mutableCandidates];
      [v14 addObject:v13];

      v15 = [(TIWordSearchCandidateResultSet *)self mutableCandidateRefsDictionary];
      v16 = [v13 mecabraCandidatePointerValue];
      [v15 setObject:a3 forKey:v16];

      id v6 = v17;
    }
  }
}

- (void)addMecabraProactiveCandidate:(void *)a3 triggerSourceType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  if (MecabraCandidateGetType() == 6)
  {
    MecabraCandidateGetAttributes();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      BOOL v7 = [NSNumber numberWithUnsignedLongLong:a3];
      id v8 = [(TIWordSearchCandidateResultSet *)self mutableCandidateRefsDictionary];
      [v8 setObject:a3 forKey:v7];

      unint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v12];
      [v9 setObject:v7 forKey:*MEMORY[0x1E4FAEFD8]];
      v10 = [[TIProactiveTrigger alloc] initWithSourceType:v4 attributes:v9];
      id v11 = [(TIWordSearchCandidateResultSet *)self mutableProactiveTriggers];
      [v11 addObject:v10];
    }
  }
}

- (void)addMecabraCandidate:(id)a3 mecabraCandidateRef:(void *)a4
{
  id v9 = a3;
  [(TIWordSearchCandidateResultSet *)self updateSupplementalMecabraCandidate:v9 withMecabraCandidateRef:a4];
  id v6 = [(TIWordSearchCandidateResultSet *)self mutableCandidates];
  [v6 addObject:v9];

  if (a4)
  {
    BOOL v7 = [(TIWordSearchCandidateResultSet *)self mutableCandidateRefsDictionary];
    id v8 = [v9 mecabraCandidatePointerValue];
    [v7 setObject:a4 forKey:v8];
  }
}

- (void)insertSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)MecabraConversionCandidateCreate();
  id v11 = objc_alloc(MEMORY[0x1E4FAE3B8]);
  id v12 = [NSNumber numberWithUnsignedLongLong:v10];
  id v18 = (id)[v11 initWithSurface:v9 input:v8 mecabraCandidatePointerValue:v12];

  v13 = [(TIWordSearchCandidateResultSet *)self candidates];
  unint64_t v14 = [v13 count];

  if (v10)
  {
    if (v14 < a5) {
      a5 = v14;
    }
    v15 = [(TIWordSearchCandidateResultSet *)self mutableCandidates];
    [v15 insertObject:v18 atIndex:a5];

    v16 = [(TIWordSearchCandidateResultSet *)self mutableCandidateRefsDictionary];
    id v17 = [v18 mecabraCandidatePointerValue];
    [v16 setObject:v10 forKey:v17];
  }
}

- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5 deleteCount:(unint64_t)a6 cursorMovement:(int64_t)a7 annotation:(id)a8
{
  BOOL v10 = a5;
  id v23 = a8;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)MecabraConversionCandidateCreate();
  id v17 = objc_alloc(MEMORY[0x1E4FAE3B8]);
  id v18 = [NSNumber numberWithUnsignedLongLong:v16];
  v19 = (void *)[v17 initWithCandidate:v15 forInput:v14 mecabraCandidatePointerValue:v18 withFlags:v10 deleteCount:a6 cursorMovement:a7];

  if (v23) {
    [v19 setAnnotationText:v23];
  }
  v20 = [(TIWordSearchCandidateResultSet *)self mutableCandidates];
  [v20 addObject:v19];

  v21 = [(TIWordSearchCandidateResultSet *)self mutableCandidateRefsDictionary];
  v22 = [v19 mecabraCandidatePointerValue];
  [v21 setObject:v16 forKey:v22];
}

- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5 deleteCount:(unint64_t)a6 cursorMovement:(int64_t)a7
{
}

- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5 deleteCount:(unint64_t)a6
{
}

- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5
{
}

- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4
{
}

- (void)addCandidates:(id)a3 candidateRefsDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TIWordSearchCandidateResultSet *)self mutableCandidates];
  [v8 addObjectsFromArray:v7];

  id v9 = [(TIWordSearchCandidateResultSet *)self mutableCandidateRefsDictionary];
  [v9 addEntriesFromDictionary:v6];
}

- (BOOL)isEmpty
{
  v3 = [(TIWordSearchCandidateResultSet *)self candidates];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(TIWordSearchCandidateResultSet *)self disambiguationCandidates];
    if ([v5 count])
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [(TIWordSearchCandidateResultSet *)self proactiveTriggers];
      if ([v6 count])
      {
        BOOL v4 = 0;
      }
      else
      {
        id v7 = [(TIWordSearchCandidateResultSet *)self proactiveCandidates];
        BOOL v4 = [v7 count] == 0;
      }
    }
  }
  return v4;
}

- (TIWordSearchCandidateResultSet)initWithCandidates:(id)a3 candidateRefsDictionary:(id)a4
{
  return [(TIWordSearchCandidateResultSet *)self initWithCandidates:a3 candidateRefsDictionary:a4 disambiguationCandidates:0 selectedDisambiguationCandidateIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (TIWordSearchCandidateResultSet)initWithCandidates:(id)a3 candidateRefsDictionary:(id)a4 disambiguationCandidates:(id)a5 selectedDisambiguationCandidateIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TIWordSearchCandidateResultSet;
  v13 = [(TIWordSearchCandidateResultSet *)&v23 init];
  if (v13)
  {
    id v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableCandidates = v13->_mutableCandidates;
    v13->_mutableCandidates = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableCandidateRefsDictionary = v13->_mutableCandidateRefsDictionary;
    v13->_mutableCandidateRefsDictionary = v16;

    if (v10 && v11) {
      [(TIWordSearchCandidateResultSet *)v13 addCandidates:v10 candidateRefsDictionary:v11];
    }
    uint64_t v18 = [v12 copy];
    disambiguationCandidates = v13->_disambiguationCandidates;
    v13->_disambiguationCandidates = (NSArray *)v18;

    v13->_selectedDisambiguationCandidateIndex = a6;
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableProactiveTriggers = v13->_mutableProactiveTriggers;
    v13->_mutableProactiveTriggers = v20;
  }
  return v13;
}

- (TIWordSearchCandidateResultSet)init
{
  return [(TIWordSearchCandidateResultSet *)self initWithCandidates:0 candidateRefsDictionary:0];
}

+ (id)emptySet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__TIWordSearchCandidateResultSet_emptySet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emptySet___onceToken != -1) {
    dispatch_once(&emptySet___onceToken, block);
  }
  v2 = (void *)emptySet___emptySet;

  return v2;
}

uint64_t __42__TIWordSearchCandidateResultSet_emptySet__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithCandidates:0 candidateRefsDictionary:0];
  uint64_t v2 = emptySet___emptySet;
  emptySet___emptySet = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

@end