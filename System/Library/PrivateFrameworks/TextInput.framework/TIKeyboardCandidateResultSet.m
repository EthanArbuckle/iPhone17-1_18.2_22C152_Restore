@interface TIKeyboardCandidateResultSet
+ (BOOL)supportsSecureCoding;
+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3;
+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 disambiguationCandidates:(id)a10 selectedDisambiguationCandidateIndex:(unint64_t)a11;
+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 disambiguationCandidates:(id)a10 selectedDisambiguationCandidateIndex:(unint64_t)a11 proactiveTriggers:(id)a12;
+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 initiallyHiddenCandidates:(id)a10 selectedHiddenCandidateIndex:(unint64_t)a11;
+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 initiallyHiddenCandidates:(id)a10 selectedHiddenCandidateIndex:(unint64_t)a11 proactiveTriggers:(id)a12;
+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 proactiveTriggers:(id)a4;
+ (id)dummySet;
- (BOOL)excludedExtensionCandidates;
- (BOOL)hasCandidates;
- (BOOL)hasMetadata;
- (BOOL)hasOnlyProactiveCandidates;
- (BOOL)hasSupplementalCandidates;
- (BOOL)inputManagerHasPendingCandidatesUpdate;
- (BOOL)isDummySet;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubsetOf:(id)a3;
- (NSArray)candidates;
- (NSArray)candidatesIfSupplemental;
- (NSArray)disambiguationCandidates;
- (NSArray)proactiveTriggers;
- (NSArray)sortMethods;
- (NSDictionary)indexTitles;
- (NSDictionary)showExtensionCandidates;
- (NSDictionary)sortMethodGroups;
- (NSString)committedText;
- (TIKeyboardCandidate)acceptedCandidate;
- (TIKeyboardCandidate)defaultCandidate;
- (TIKeyboardCandidate)firstCandidate;
- (TIKeyboardCandidateResultSet)initWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 disambiguationCandidates:(id)a10 selectedDisambiguationCandidateIndex:(unint64_t)a11 proactiveTriggers:(id)a12;
- (TIKeyboardCandidateResultSet)initWithCoder:(id)a3;
- (TIKeyboardIntermediateText)uncommittedText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)setByAppendingSet:(id)a3;
- (unint64_t)batchCandidateLocation;
- (unint64_t)generatedCandidateCount;
- (unint64_t)initialSelectedIndex;
- (unint64_t)positionInCandidateList:(id)a3;
- (unint64_t)selectedDisambiguationCandidateIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptedCandidate:(id)a3;
- (void)setBatchCandidateLocation:(unint64_t)a3;
- (void)setCandidates:(id)a3;
- (void)setCommittedText:(id)a3;
- (void)setDefaultCandidate:(id)a3;
- (void)setDisambiguationCandidates:(id)a3;
- (void)setExcludedExtensionCandidates:(BOOL)a3;
- (void)setGeneratedCandidateCount:(unint64_t)a3;
- (void)setIndexTitles:(id)a3;
- (void)setInitialSelectedIndex:(unint64_t)a3;
- (void)setInputManagerHasPendingCandidatesUpdate:(BOOL)a3;
- (void)setSelectedDisambiguationCandidateIndex:(unint64_t)a3;
- (void)setShowExtensionCandidates:(id)a3;
- (void)setSortMethodGroups:(id)a3;
- (void)setSortMethods:(id)a3;
- (void)setUncommittedText:(id)a3;
@end

@implementation TIKeyboardCandidateResultSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedCandidate, 0);
  objc_storeStrong((id *)&self->_uncommittedText, 0);
  objc_storeStrong((id *)&self->_committedText, 0);
  objc_storeStrong((id *)&self->_proactiveTriggers, 0);
  objc_storeStrong((id *)&self->_disambiguationCandidates, 0);
  objc_storeStrong((id *)&self->_showExtensionCandidates, 0);
  objc_storeStrong((id *)&self->_indexTitles, 0);
  objc_storeStrong((id *)&self->_sortMethodGroups, 0);
  objc_storeStrong((id *)&self->_sortMethods, 0);
  objc_storeStrong((id *)&self->_defaultCandidate, 0);

  objc_storeStrong((id *)&self->_candidates, 0);
}

- (void)setInputManagerHasPendingCandidatesUpdate:(BOOL)a3
{
  self->_inputManagerHasPendingCandidatesUpdate = a3;
}

- (BOOL)inputManagerHasPendingCandidatesUpdate
{
  return self->_inputManagerHasPendingCandidatesUpdate;
}

- (void)setAcceptedCandidate:(id)a3
{
}

- (TIKeyboardCandidate)acceptedCandidate
{
  return self->_acceptedCandidate;
}

- (void)setUncommittedText:(id)a3
{
}

- (TIKeyboardIntermediateText)uncommittedText
{
  return self->_uncommittedText;
}

- (void)setCommittedText:(id)a3
{
}

- (NSString)committedText
{
  return self->_committedText;
}

- (void)setExcludedExtensionCandidates:(BOOL)a3
{
  self->_excludedExtensionCandidates = a3;
}

- (BOOL)excludedExtensionCandidates
{
  return self->_excludedExtensionCandidates;
}

- (NSArray)proactiveTriggers
{
  return self->_proactiveTriggers;
}

- (void)setSelectedDisambiguationCandidateIndex:(unint64_t)a3
{
  self->_selectedDisambiguationCandidateIndex = a3;
}

- (unint64_t)selectedDisambiguationCandidateIndex
{
  return self->_selectedDisambiguationCandidateIndex;
}

- (void)setBatchCandidateLocation:(unint64_t)a3
{
  self->_batchCandidateLocation = a3;
}

- (unint64_t)batchCandidateLocation
{
  return self->_batchCandidateLocation;
}

- (void)setGeneratedCandidateCount:(unint64_t)a3
{
  self->_generatedCandidateCount = a3;
}

- (unint64_t)generatedCandidateCount
{
  return self->_generatedCandidateCount;
}

- (void)setDisambiguationCandidates:(id)a3
{
}

- (NSArray)disambiguationCandidates
{
  return self->_disambiguationCandidates;
}

- (void)setShowExtensionCandidates:(id)a3
{
}

- (NSDictionary)showExtensionCandidates
{
  return self->_showExtensionCandidates;
}

- (void)setIndexTitles:(id)a3
{
}

- (NSDictionary)indexTitles
{
  return self->_indexTitles;
}

- (void)setSortMethodGroups:(id)a3
{
}

- (NSDictionary)sortMethodGroups
{
  return self->_sortMethodGroups;
}

- (void)setSortMethods:(id)a3
{
}

- (NSArray)sortMethods
{
  return self->_sortMethods;
}

- (void)setDefaultCandidate:(id)a3
{
}

- (TIKeyboardCandidate)defaultCandidate
{
  return self->_defaultCandidate;
}

- (void)setInitialSelectedIndex:(unint64_t)a3
{
  self->_initialSelectedIndex = a3;
}

- (unint64_t)initialSelectedIndex
{
  return self->_initialSelectedIndex;
}

- (void)setCandidates:(id)a3
{
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (BOOL)isSubsetOf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(TIKeyboardCandidateResultSet *)self generatedCandidateCount];
  if (v5 != [v4 generatedCandidateCount]) {
    goto LABEL_3;
  }
  v6 = [(TIKeyboardCandidateResultSet *)self candidates];
  unint64_t v7 = [v6 count];
  v8 = [v4 candidates];
  unint64_t v9 = [v8 count];

  if (v7 <= v9)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v11 = [(TIKeyboardCandidateResultSet *)self candidates];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v18 = [v4 candidates];
          v19 = [v18 objectAtIndex:v14 + i];

          if (v17 != v19)
          {
            BOOL v10 = 0;
            goto LABEL_14;
          }
        }
        v14 += i;
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 1;
LABEL_14:
  }
  else
  {
LABEL_3:
    BOOL v10 = 0;
  }

  return v10;
}

- (id)setByAppendingSet:(id)a3
{
  id v4 = a3;
  if ([v4 batchCandidateLocation]
    && (uint64_t v5 = [v4 generatedCandidateCount], v5 == objc_msgSend(v4, "generatedCandidateCount"))
    && (uint64_t v6 = [v4 batchCandidateLocation],
        [(TIKeyboardCandidateResultSet *)self candidates],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6 == v8))
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
    BOOL v10 = [(TIKeyboardCandidateResultSet *)self candidates];
    v28 = [v9 arrayWithArray:v10];

    v11 = [v4 candidates];
    [v28 addObjectsFromArray:v11];

    v25 = [TIKeyboardCandidateResultSet alloc];
    unint64_t v27 = [(TIKeyboardCandidateResultSet *)self initialSelectedIndex];
    uint64_t v26 = [(TIKeyboardCandidateResultSet *)self defaultCandidate];
    long long v24 = [(TIKeyboardCandidateResultSet *)self sortMethods];
    uint64_t v12 = [(TIKeyboardCandidateResultSet *)self sortMethodGroups];
    uint64_t v13 = [(TIKeyboardCandidateResultSet *)self indexTitles];
    uint64_t v14 = [(TIKeyboardCandidateResultSet *)self showExtensionCandidates];
    uint64_t v15 = [(TIKeyboardCandidateResultSet *)self disambiguationCandidates];
    unint64_t v16 = [(TIKeyboardCandidateResultSet *)self selectedDisambiguationCandidateIndex];
    v17 = [(TIKeyboardCandidateResultSet *)self proactiveTriggers];
    uint64_t v18 = [v4 proactiveTriggers];
    v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = MEMORY[0x1E4F1CBF0];
    }
    long long v21 = [v17 arrayByAddingObjectsFromArray:v20];
    long long v22 = [(TIKeyboardCandidateResultSet *)v25 initWithCandidates:v28 initialSelectedIndex:v27 defaultCandidate:v26 sortMethods:v24 sortMethodGroups:v12 indexTitles:v13 showExtensionCandidates:v14 disambiguationCandidates:v15 selectedDisambiguationCandidateIndex:v16 proactiveTriggers:v21];

    [(TIKeyboardCandidateResultSet *)v22 setGeneratedCandidateCount:[(TIKeyboardCandidateResultSet *)self generatedCandidateCount]];
    -[TIKeyboardCandidateResultSet setBatchCandidateLocation:](v22, "setBatchCandidateLocation:", [v4 batchCandidateLocation]);
  }
  else
  {
    long long v22 = 0;
  }

  return v22;
}

- (TIKeyboardCandidateResultSet)initWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 disambiguationCandidates:(id)a10 selectedDisambiguationCandidateIndex:(unint64_t)a11 proactiveTriggers:(id)a12
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a12;
  v44.receiver = self;
  v44.super_class = (Class)TIKeyboardCandidateResultSet;
  uint64_t v26 = [(TIKeyboardCandidateResultSet *)&v44 init];
  if (v26)
  {
    uint64_t v27 = [v18 copy];
    candidates = v26->_candidates;
    v26->_candidates = (NSArray *)v27;

    v26->_initialSelectedIndex = a4;
    uint64_t v29 = [v24 copy];
    disambiguationCandidates = v26->_disambiguationCandidates;
    v26->_disambiguationCandidates = (NSArray *)v29;

    uint64_t v31 = [v19 copy];
    defaultCandidate = v26->_defaultCandidate;
    v26->_defaultCandidate = (TIKeyboardCandidate *)v31;

    uint64_t v33 = [v20 copy];
    sortMethods = v26->_sortMethods;
    v26->_sortMethods = (NSArray *)v33;

    uint64_t v35 = [v21 copy];
    sortMethodGroups = v26->_sortMethodGroups;
    v26->_sortMethodGroups = (NSDictionary *)v35;

    uint64_t v37 = [v22 copy];
    indexTitles = v26->_indexTitles;
    v26->_indexTitles = (NSDictionary *)v37;

    uint64_t v39 = [v23 copy];
    showExtensionCandidates = v26->_showExtensionCandidates;
    v26->_showExtensionCandidates = (NSDictionary *)v39;

    v26->_selectedDisambiguationCandidateIndex = a11;
    uint64_t v41 = [v25 copy];
    proactiveTriggers = v26->_proactiveTriggers;
    v26->_proactiveTriggers = (NSArray *)v41;
  }
  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(TIKeyboardCandidateResultSet *)self candidates];
    uint64_t v6 = [v4 candidates];
    char v7 = [v5 isEqualToArray:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)positionInCandidateList:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardCandidateResultSet *)self hasCandidates]
    && ([(TIKeyboardCandidateResultSet *)self candidates],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [(TIKeyboardCandidateResultSet *)self candidates];
      unint64_t v9 = [v8 objectAtIndex:v7];

      BOOL v10 = [v9 candidate];
      char v11 = [v10 isEqual:v4];

      if (v11) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BOOL)isDummySet
{
  v3 = [(TIKeyboardCandidateResultSet *)self candidates];
  if ([v3 count] == 1)
  {
    id v4 = [(TIKeyboardCandidateResultSet *)self candidates];
    uint64_t v5 = [v4 objectAtIndex:0];
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)hasMetadata
{
  v2 = [(TIKeyboardCandidateResultSet *)self sortMethodGroups];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (TIKeyboardCandidate)firstCandidate
{
  if ([(TIKeyboardCandidateResultSet *)self hasCandidates])
  {
    BOOL v3 = [(TIKeyboardCandidateResultSet *)self candidates];
    id v4 = [v3 objectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }

  return (TIKeyboardCandidate *)v4;
}

- (NSArray)candidatesIfSupplemental
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_candidates;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v14);
        if (v9 == (void *)v10)
        {
        }
        else
        {
          char v11 = (void *)v10;
          int v12 = [v9 isSupplementalItemCandidate];

          if (v12) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)hasSupplementalCandidates
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_candidates;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v11);
        if (v6 == (void *)v7)
        {
        }
        else
        {
          uint64_t v8 = (void *)v7;
          char v9 = [v6 isSupplementalItemCandidate];

          if (v9)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
LABEL_12:

  return v3;
}

- (BOOL)hasOnlyProactiveCandidates
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(TIKeyboardCandidateResultSet *)self candidates];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) slotID])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)hasCandidates
{
  uint64_t v3 = [(TIKeyboardCandidateResultSet *)self candidates];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  if (v4 != 1) {
    return 1;
  }
  uint64_t v5 = [(TIKeyboardCandidateResultSet *)self candidates];
  uint64_t v6 = [v5 objectAtIndex:0];
  BOOL v7 = [MEMORY[0x1E4F1CA98] null];
  BOOL v8 = v6 != v7;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [+[TIKeyboardCandidateResultSet allocWithZone:](TIKeyboardCandidateResultSet, "allocWithZone:") init];
  uint64_t v6 = [(TIKeyboardCandidateResultSet *)self candidates];

  if (v6)
  {
    BOOL v7 = (void *)[MEMORY[0x1E4F1C978] allocWithZone:a3];
    BOOL v8 = [(TIKeyboardCandidateResultSet *)self candidates];
    long long v9 = (void *)[v7 initWithArray:v8 copyItems:1];
    [(TIKeyboardCandidateResultSet *)v5 setCandidates:v9];
  }
  [(TIKeyboardCandidateResultSet *)v5 setInitialSelectedIndex:[(TIKeyboardCandidateResultSet *)self initialSelectedIndex]];
  long long v10 = [(TIKeyboardCandidateResultSet *)self defaultCandidate];

  if (v10)
  {
    long long v11 = [(TIKeyboardCandidate *)self->_defaultCandidate copyWithZone:a3];
    defaultCandidate = v5->_defaultCandidate;
    v5->_defaultCandidate = v11;
  }
  long long v13 = [(TIKeyboardCandidateResultSet *)self sortMethods];

  if (v13)
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1C978] allocWithZone:a3];
    long long v15 = [(TIKeyboardCandidateResultSet *)self sortMethods];
    uint64_t v16 = (void *)[v14 initWithArray:v15 copyItems:1];
    [(TIKeyboardCandidateResultSet *)v5 setSortMethods:v16];
  }
  long long v17 = [(TIKeyboardCandidateResultSet *)self indexTitles];

  if (v17)
  {
    id v18 = (void *)[MEMORY[0x1E4F1C9E8] allocWithZone:a3];
    uint64_t v19 = [(TIKeyboardCandidateResultSet *)self indexTitles];
    id v20 = (void *)[v18 initWithDictionary:v19 copyItems:1];
    [(TIKeyboardCandidateResultSet *)v5 setIndexTitles:v20];
  }
  id v21 = [(TIKeyboardCandidateResultSet *)self showExtensionCandidates];

  if (v21)
  {
    id v22 = (void *)[MEMORY[0x1E4F1C9E8] allocWithZone:a3];
    id v23 = [(TIKeyboardCandidateResultSet *)self showExtensionCandidates];
    id v24 = (void *)[v22 initWithDictionary:v23 copyItems:1];
    [(TIKeyboardCandidateResultSet *)v5 setShowExtensionCandidates:v24];
  }
  id v25 = [(TIKeyboardCandidateResultSet *)self disambiguationCandidates];

  if (v25)
  {
    uint64_t v26 = (void *)[MEMORY[0x1E4F1C978] allocWithZone:a3];
    uint64_t v27 = [(TIKeyboardCandidateResultSet *)self disambiguationCandidates];
    v28 = (void *)[v26 initWithArray:v27 copyItems:1];
    [(TIKeyboardCandidateResultSet *)v5 setDisambiguationCandidates:v28];
  }
  [(TIKeyboardCandidateResultSet *)v5 setSelectedDisambiguationCandidateIndex:[(TIKeyboardCandidateResultSet *)self selectedDisambiguationCandidateIndex]];
  uint64_t v29 = [(TIKeyboardCandidateResultSet *)self sortMethodGroups];
  if (v29)
  {
    v30 = (void *)v29;
    uint64_t v31 = [(TIKeyboardCandidateResultSet *)self candidates];

    if (v31)
    {
      v75 = a3;
      v32 = [(TIKeyboardCandidateResultSet *)self candidates];
      uint64_t v33 = [v32 count];

      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (v33 >= 1)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          v36 = [(TIKeyboardCandidateResultSet *)v5 candidates];
          uint64_t v37 = [v36 objectAtIndex:i];
          v38 = [(TIKeyboardCandidateResultSet *)self candidates];
          uint64_t v39 = [v38 objectAtIndex:i];
          [v34 setObject:v37 forKey:v39];
        }
      }
      v40 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v41 = [(TIKeyboardCandidateResultSet *)self sortMethodGroups];
      v70 = objc_msgSend(v40, "dictionaryWithCapacity:", objc_msgSend(v41, "count"));

      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      obuint64_t j = [(TIKeyboardCandidateResultSet *)self sortMethodGroups];
      uint64_t v71 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
      if (v71)
      {
        uint64_t v68 = *(void *)v87;
        v69 = self;
        do
        {
          uint64_t v42 = 0;
          do
          {
            if (*(void *)v87 != v68) {
              objc_enumerationMutation(obj);
            }
            uint64_t v73 = v42;
            uint64_t v43 = *(void *)(*((void *)&v86 + 1) + 8 * v42);
            objc_super v44 = [(TIKeyboardCandidateResultSet *)self sortMethodGroups];
            uint64_t v72 = v43;
            v45 = [v44 objectForKey:v43];

            v77 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v45, "count"));
            long long v82 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            id v74 = v45;
            uint64_t v46 = [v74 countByEnumeratingWithState:&v82 objects:v91 count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v76 = *(void *)v83;
              do
              {
                for (uint64_t j = 0; j != v47; ++j)
                {
                  if (*(void *)v83 != v76) {
                    objc_enumerationMutation(v74);
                  }
                  v49 = *(void **)(*((void *)&v82 + 1) + 8 * j);
                  v50 = [+[TIKeyboardCandidateGroup allocWithZone:v75] init];
                  v51 = [v49 title];
                  [(TIKeyboardCandidateGroup *)v50 setTitle:v51];

                  long long v80 = 0u;
                  long long v81 = 0u;
                  long long v78 = 0u;
                  long long v79 = 0u;
                  v52 = [v49 candidates];
                  uint64_t v53 = [v52 countByEnumeratingWithState:&v78 objects:v90 count:16];
                  if (v53)
                  {
                    uint64_t v54 = v53;
                    uint64_t v55 = *(void *)v79;
                    do
                    {
                      for (uint64_t k = 0; k != v54; ++k)
                      {
                        if (*(void *)v79 != v55) {
                          objc_enumerationMutation(v52);
                        }
                        v57 = *(void **)(*((void *)&v78 + 1) + 8 * k);
                        v58 = [v34 objectForKey:v57];
                        if (!v58)
                        {
                          v58 = (void *)[v57 copy];
                          [v34 setObject:v58 forKey:v57];
                        }
                        [(TIKeyboardCandidateGroup *)v50 addCandidate:v58];
                      }
                      uint64_t v54 = [v52 countByEnumeratingWithState:&v78 objects:v90 count:16];
                    }
                    while (v54);
                  }

                  [v77 addObject:v50];
                }
                uint64_t v47 = [v74 countByEnumeratingWithState:&v82 objects:v91 count:16];
              }
              while (v47);
            }

            [v70 setObject:v77 forKey:v72];
            uint64_t v42 = v73 + 1;
            self = v69;
          }
          while (v73 + 1 != v71);
          uint64_t v71 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
        }
        while (v71);
      }

      uint64_t v5 = v66;
      [(TIKeyboardCandidateResultSet *)v66 setSortMethodGroups:v70];

      a3 = v75;
    }
  }
  v5->_generatedCandidateCount = self->_generatedCandidateCount;
  v5->_batchCandidateLocation = self->_batchCandidateLocation;
  uint64_t v59 = [(NSString *)self->_committedText copy];
  committedText = v5->_committedText;
  v5->_committedText = (NSString *)v59;

  objc_storeStrong((id *)&v5->_uncommittedText, self->_uncommittedText);
  v61 = [(TIKeyboardCandidate *)self->_acceptedCandidate copyWithZone:a3];
  acceptedCandidate = v5->_acceptedCandidate;
  v5->_acceptedCandidate = v61;

  uint64_t v63 = [(NSArray *)self->_proactiveTriggers copyWithZone:a3];
  proactiveTriggers = v5->_proactiveTriggers;
  v5->_proactiveTriggers = (NSArray *)v63;

  v5->_inputManagerHasPendingCandidatesUpdate = self->_inputManagerHasPendingCandidatesUpdate;
  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(TIKeyboardCandidateResultSet *)self candidates];
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p count=%lu>", v4, self, objc_msgSend(v5, "count")];

  BOOL v7 = [(TIKeyboardCandidateResultSet *)self candidates];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    objc_msgSend(v6, "appendString:", @"(\n");
    long long v9 = [(TIKeyboardCandidateResultSet *)self candidates];
    long long v10 = [v9 componentsJoinedByString:@",\n"];
    [v6 appendString:v10];

    [v6 appendString:@"\n"]);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  uint64_t v4 = +[TIKeyboardCandidateResultSetCoder encodeWithCandidateResultSet:self];
  [v9 encodeObject:v4 forKey:@"data"];
  committedText = self->_committedText;
  if (committedText) {
    [v9 encodeObject:committedText forKey:@"committedText"];
  }
  uncommittedText = self->_uncommittedText;
  if (uncommittedText) {
    [v9 encodeObject:uncommittedText forKey:@"uncommittedText"];
  }
  acceptedCandidate = self->_acceptedCandidate;
  uint64_t v8 = v9;
  if (acceptedCandidate)
  {
    [v9 encodeObject:acceptedCandidate forKey:@"acceptedCandidate"];
    uint64_t v8 = v9;
  }
  [v8 encodeBool:self->_inputManagerHasPendingCandidatesUpdate forKey:@"inputManagerHasPendingCandidatesUpdate"];
}

- (TIKeyboardCandidateResultSet)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardCandidateResultSet;
  id v3 = a3;
  uint64_t v4 = [(TIKeyboardCandidateResultSet *)&v12 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"data", v12.receiver, v12.super_class);
  uint64_t v6 = +[TIKeyboardCandidateResultSetCoder decodeWithData:v5];
  BOOL v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"committedText"];
  [(TIKeyboardCandidateResultSet *)v6 setCommittedText:v7];

  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"uncommittedText"];
  [(TIKeyboardCandidateResultSet *)v6 setUncommittedText:v8];

  id v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"acceptedCandidate"];
  [(TIKeyboardCandidateResultSet *)v6 setAcceptedCandidate:v9];

  uint64_t v10 = [v3 decodeBoolForKey:@"inputManagerHasPendingCandidatesUpdate"];
  [(TIKeyboardCandidateResultSet *)v6 setInputManagerHasPendingCandidatesUpdate:v10];

  return v6;
}

+ (id)dummySet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__TIKeyboardCandidateResultSet_dummySet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dummySet___onceToken != -1) {
    dispatch_once(&dummySet___onceToken, block);
  }
  v2 = (void *)dummySet___dummySet;

  return v2;
}

void __40__TIKeyboardCandidateResultSet_dummySet__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1CA98] null];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  uint64_t v3 = [v0 setWithCandidates:v2 proactiveTriggers:0];
  uint64_t v4 = (void *)dummySet___dummySet;
  dummySet___dummySet = v3;
}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 disambiguationCandidates:(id)a10 selectedDisambiguationCandidateIndex:(unint64_t)a11 proactiveTriggers:(id)a12
{
  id v18 = a12;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a3;
  uint64_t v26 = (void *)[objc_alloc((Class)a1) initWithCandidates:v25 initialSelectedIndex:a4 defaultCandidate:v24 sortMethods:v23 sortMethodGroups:v22 indexTitles:v21 showExtensionCandidates:v20 disambiguationCandidates:v19 selectedDisambiguationCandidateIndex:a11 proactiveTriggers:v18];

  return (TIKeyboardCandidateResultSet *)v26;
}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 disambiguationCandidates:(id)a10 selectedDisambiguationCandidateIndex:(unint64_t)a11
{
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a3;
  id v25 = (void *)[objc_alloc((Class)a1) initWithCandidates:v24 initialSelectedIndex:a4 defaultCandidate:v23 sortMethods:v22 sortMethodGroups:v21 indexTitles:v20 showExtensionCandidates:v19 disambiguationCandidates:v18 selectedDisambiguationCandidateIndex:a11 proactiveTriggers:0];

  return (TIKeyboardCandidateResultSet *)v25;
}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 proactiveTriggers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithCandidates:v7 initialSelectedIndex:0x7FFFFFFFFFFFFFFFLL defaultCandidate:0 sortMethods:0 sortMethodGroups:0 indexTitles:0 showExtensionCandidates:0 disambiguationCandidates:0 selectedDisambiguationCandidateIndex:0x7FFFFFFFFFFFFFFFLL proactiveTriggers:v6];

  return (TIKeyboardCandidateResultSet *)v8;
}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3
{
  return (TIKeyboardCandidateResultSet *)[a1 setWithCandidates:a3 proactiveTriggers:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 initiallyHiddenCandidates:(id)a10 selectedHiddenCandidateIndex:(unint64_t)a11 proactiveTriggers:(id)a12
{
  return (TIKeyboardCandidateResultSet *)objc_msgSend(a1, "setWithCandidates:initialSelectedIndex:defaultCandidate:sortMethods:sortMethodGroups:indexTitles:showExtensionCandidates:disambiguationCandidates:selectedDisambiguationCandidateIndex:proactiveTriggers:", a3, a4, a5, a6, a7, a8);
}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 initiallyHiddenCandidates:(id)a10 selectedHiddenCandidateIndex:(unint64_t)a11
{
  return (TIKeyboardCandidateResultSet *)objc_msgSend(a1, "setWithCandidates:initialSelectedIndex:defaultCandidate:sortMethods:sortMethodGroups:indexTitles:showExtensionCandidates:disambiguationCandidates:selectedDisambiguationCandidateIndex:", a3, a4, a5, a6, a7, a8);
}

@end