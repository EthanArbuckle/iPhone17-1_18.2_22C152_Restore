@interface TIAutocorrectionList
+ (BOOL)supportsSecureCoding;
+ (TIAutocorrectionList)autocorrectionListWithCandidates:(id)a3 shouldAcceptTopCandidate:(BOOL)a4;
+ (TIAutocorrectionList)listWithAutocorrection:(id)a3;
+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4;
+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4 emojiList:(id)a5;
+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4 emojiList:(id)a5 inlineCompletions:(id)a6;
+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6;
+ (TIAutocorrectionList)listWithCorrections:(id)a3;
+ (TIAutocorrectionList)listWithCorrections:(id)a3 inlineCompletionList:(id)a4;
+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4;
+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5;
+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 inlineCompletionList:(id)a6 proactiveTriggers:(id)a7;
+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 inlineCompletions:(id)a6;
+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6;
+ (TIAutocorrectionList)listWithPredictions:(id)a3 emojiList:(id)a4 proactiveTriggers:(id)a5;
+ (TIAutocorrectionList)listWithPredictions:(id)a3 proactiveTriggers:(id)a4;
- (BOOL)containsProactiveTriggers;
- (BOOL)empty;
- (BOOL)hasSupplementalCandidates;
- (BOOL)isSupplementalCandidateInPredictions:(id)a3;
- (BOOL)proactiveSuggestionsEmpty;
- (BOOL)shouldAcceptInlineCompletion;
- (BOOL)shouldAcceptTopCandidate;
- (NSArray)alternateCorrections;
- (NSArray)candidates;
- (NSArray)emojiList;
- (NSArray)inlineCompletions;
- (NSArray)predictions;
- (NSArray)predictionsIfSupplemental;
- (NSArray)proactiveTriggers;
- (TIAutocorrectionList)initWithCandidates:(id)a3;
- (TIAutocorrectionList)initWithCandidates:(id)a3 shouldAcceptTopCandidate:(BOOL)a4;
- (TIAutocorrectionList)initWithCoder:(id)a3;
- (TIAutocorrectionList)initWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6;
- (TIAutocorrectionList)initWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6 inlineCompletions:(id)a7;
- (TICorrectionCandidates)corrections;
- (TIKeyboardCandidate)autocorrection;
- (TIKeyboardCandidate)autocorrectionIfSupplemental;
- (id)description;
- (id)initListWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6 inlineCompletions:(id)a7;
- (void)encodeWithCoder:(id)a3;
- (void)setContainsProactiveTriggers:(BOOL)a3;
- (void)setProactiveSuggestionsEmpty:(BOOL)a3;
@end

@implementation TIAutocorrectionList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveTriggers, 0);
  objc_storeStrong((id *)&self->_emojiList, 0);
  objc_storeStrong((id *)&self->_inlineCompletions, 0);
  objc_storeStrong((id *)&self->_predictions, 0);

  objc_storeStrong((id *)&self->_corrections, 0);
}

- (void)setProactiveSuggestionsEmpty:(BOOL)a3
{
  self->_proactiveSuggestionsEmpty = a3;
}

- (BOOL)proactiveSuggestionsEmpty
{
  return self->_proactiveSuggestionsEmpty;
}

- (void)setContainsProactiveTriggers:(BOOL)a3
{
  self->_containsProactiveTriggers = a3;
}

- (BOOL)containsProactiveTriggers
{
  return self->_containsProactiveTriggers;
}

- (NSArray)proactiveTriggers
{
  return self->_proactiveTriggers;
}

- (NSArray)emojiList
{
  return self->_emojiList;
}

- (NSArray)inlineCompletions
{
  return self->_inlineCompletions;
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (TICorrectionCandidates)corrections
{
  return self->_corrections;
}

- (BOOL)shouldAcceptInlineCompletion
{
  v2 = [(TIAutocorrectionList *)self inlineCompletions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isSupplementalCandidateInPredictions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_predictions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSupplementalItemCandidate", (void)v13))
        {
          v10 = [v9 candidate];
          char v11 = [v4 isEqualToString:v10];

          if (v11)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (NSArray)predictionsIfSupplemental
{
  predictions = self->_predictions;
  if (predictions)
  {
    BOOL v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_771];
    id v4 = [(NSArray *)predictions filteredArrayUsingPredicate:v3];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

uint64_t __49__TIAutocorrectionList_predictionsIfSupplemental__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSupplementalItemCandidate];
}

- (TIKeyboardCandidate)autocorrectionIfSupplemental
{
  BOOL v3 = [(TIAutocorrectionList *)self corrections];
  id v4 = [v3 autocorrection];
  if ([v4 isSupplementalItemCandidate])
  {
    v5 = [(TIAutocorrectionList *)self corrections];
    uint64_t v6 = [v5 autocorrection];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (TIKeyboardCandidate *)v6;
}

- (BOOL)hasSupplementalCandidates
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TIAutocorrectionList *)self corrections];
  id v4 = [v3 autocorrection];
  char v5 = [v4 isSupplementalItemCandidate];

  if (v5)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v7 = self->_predictions;
    uint64_t v6 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isSupplementalItemCandidate", (void)v11))
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v6;
}

- (BOOL)shouldAcceptTopCandidate
{
  v2 = [(TIAutocorrectionList *)self corrections];
  BOOL v3 = [v2 autocorrection];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSArray)candidates
{
  v14[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TIAutocorrectionList *)self corrections];
  BOOL v4 = [v3 autocorrection];
  uint64_t v5 = MEMORY[0x1E4F1CBF0];
  if (v4)
  {
    uint64_t v6 = [(TIAutocorrectionList *)self corrections];
    uint64_t v7 = [v6 autocorrection];
    v14[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  uint64_t v9 = [(TIAutocorrectionList *)self predictions];
  v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v5;
  }
  long long v12 = [v8 arrayByAddingObjectsFromArray:v11];

  return (NSArray *)v12;
}

- (BOOL)empty
{
  BOOL v3 = [(TIAutocorrectionList *)self corrections];
  BOOL v4 = [v3 autocorrection];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(TIAutocorrectionList *)self corrections];
    uint64_t v7 = [v6 alternateCorrections];
    BOOL v5 = [v7 count]
      || [(NSArray *)self->_predictions count]
      || [(NSArray *)self->_emojiList count] != 0;
  }
  return !v5;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p corrections=%@ predictions=%@", objc_opt_class(), self, self->_corrections, self->_predictions];
  BOOL v4 = v3;
  if (self->_emojiList) {
    [v3 appendFormat:@" emojiList=%@", self->_emojiList];
  }
  [v4 appendFormat:@">"];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  corrections = self->_corrections;
  id v9 = v4;
  if (corrections)
  {
    [v4 encodeObject:corrections forKey:@"corrections"];
    id v4 = v9;
  }
  predictions = self->_predictions;
  if (predictions)
  {
    [v9 encodeObject:predictions forKey:@"predictions"];
    id v4 = v9;
  }
  inlineCompletions = self->_inlineCompletions;
  if (inlineCompletions)
  {
    [v9 encodeObject:inlineCompletions forKey:@"inlineCompletions"];
    id v4 = v9;
  }
  emojiList = self->_emojiList;
  if (emojiList)
  {
    [v9 encodeObject:emojiList forKey:@"emojiList"];
    id v4 = v9;
  }
  [v4 encodeBool:self->_containsProactiveTriggers forKey:@"containsProactiveTriggers"];
  [v9 encodeBool:self->_proactiveSuggestionsEmpty forKey:@"proactiveSuggestionsEmpty"];
}

- (TIAutocorrectionList)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TIAutocorrectionList;
  BOOL v5 = [(TIAutocorrectionList *)&v24 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"corrections"];
    corrections = v5->_corrections;
    v5->_corrections = (TICorrectionCandidates *)v9;

    if (!v5->_corrections)
    {
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autocorrection"];
      if (v11)
      {
        long long v12 = [[TICorrectionCandidates alloc] initWithAutocorrection:v11 alternateCorrections:0];
        long long v13 = v5->_corrections;
        v5->_corrections = v12;
      }
    }
    long long v14 = [v4 decodeObjectOfClasses:v8 forKey:@"predictions"];
    uint64_t v15 = [v14 copy];
    predictions = v5->_predictions;
    v5->_predictions = (NSArray *)v15;

    v17 = [v4 decodeObjectOfClasses:v8 forKey:@"inlineCompletions"];
    uint64_t v18 = [v17 copy];
    inlineCompletions = v5->_inlineCompletions;
    v5->_inlineCompletions = (NSArray *)v18;

    v20 = [v4 decodeObjectOfClasses:v8 forKey:@"emojiList"];
    uint64_t v21 = [v20 copy];
    emojiList = v5->_emojiList;
    v5->_emojiList = (NSArray *)v21;

    v5->_containsProactiveTriggers = [v4 decodeBoolForKey:@"containsProactiveTriggers"];
    v5->_proactiveSuggestionsEmpty = [v4 decodeBoolForKey:@"proactiveSuggestionsEmpty"];
  }
  return v5;
}

- (TIAutocorrectionList)initWithCandidates:(id)a3 shouldAcceptTopCandidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v4 && [v6 count])
  {
    uint64_t v8 = [v7 firstObject];
    uint64_t v9 = objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = v7;
  }
  v10 = [[TICorrectionCandidates alloc] initWithAutocorrection:v8 alternateCorrections:0];
  uint64_t v11 = [(TIAutocorrectionList *)self initWithCorrections:v10 predictions:v9 emojiList:0 proactiveTriggers:0 inlineCompletions:0];

  return v11;
}

- (TIAutocorrectionList)initWithCandidates:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[TIAutocorrectionList initWithCandidates:shouldAcceptTopCandidate:](self, "initWithCandidates:shouldAcceptTopCandidate:", v4, [v4 count] != 0);

  return v5;
}

- (NSArray)alternateCorrections
{
  v2 = [(TIAutocorrectionList *)self corrections];
  BOOL v3 = [v2 alternateCorrections];

  return (NSArray *)v3;
}

- (TIKeyboardCandidate)autocorrection
{
  v2 = [(TIAutocorrectionList *)self corrections];
  BOOL v3 = [v2 autocorrection];

  return (TIKeyboardCandidate *)v3;
}

- (TIAutocorrectionList)initWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TIAutocorrectionList;
  uint64_t v15 = [(TIAutocorrectionList *)&v24 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_corrections, a3);
    uint64_t v17 = [v12 copy];
    predictions = v16->_predictions;
    v16->_predictions = (NSArray *)v17;

    uint64_t v19 = [v13 copy];
    emojiList = v16->_emojiList;
    v16->_emojiList = (NSArray *)v19;

    uint64_t v21 = [v14 copy];
    proactiveTriggers = v16->_proactiveTriggers;
    v16->_proactiveTriggers = (NSArray *)v21;
  }
  return v16;
}

- (id)initListWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6 inlineCompletions:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)TIAutocorrectionList;
  uint64_t v18 = [(TIAutocorrectionList *)&v29 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_corrections, a3);
    uint64_t v20 = [v14 copy];
    predictions = v19->_predictions;
    v19->_predictions = (NSArray *)v20;

    uint64_t v22 = [v15 copy];
    emojiList = v19->_emojiList;
    v19->_emojiList = (NSArray *)v22;

    uint64_t v24 = [v16 copy];
    proactiveTriggers = v19->_proactiveTriggers;
    v19->_proactiveTriggers = (NSArray *)v24;

    uint64_t v26 = [v17 copy];
    inlineCompletions = v19->_inlineCompletions;
    v19->_inlineCompletions = (NSArray *)v26;
  }
  return v19;
}

- (TIAutocorrectionList)initWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6 inlineCompletions:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)TIAutocorrectionList;
  uint64_t v18 = [(TIAutocorrectionList *)&v29 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_corrections, a3);
    uint64_t v20 = [v14 copy];
    predictions = v19->_predictions;
    v19->_predictions = (NSArray *)v20;

    uint64_t v22 = [v15 copy];
    emojiList = v19->_emojiList;
    v19->_emojiList = (NSArray *)v22;

    uint64_t v24 = [v16 copy];
    proactiveTriggers = v19->_proactiveTriggers;
    v19->_proactiveTriggers = (NSArray *)v24;

    uint64_t v26 = [v17 copy];
    inlineCompletions = v19->_inlineCompletions;
    v19->_inlineCompletions = (NSArray *)v26;
  }
  return v19;
}

+ (TIAutocorrectionList)autocorrectionListWithCandidates:(id)a3 shouldAcceptTopCandidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithCandidates:v6 shouldAcceptTopCandidate:v4];

  return (TIAutocorrectionList *)v7;
}

+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[TICorrectionCandidates alloc] initWithAutocorrection:v12 alternateCorrections:0];

  id v14 = +[TIAutocorrectionList listWithCorrections:v13 predictions:v11 emojiList:v10 proactiveTriggers:v9];

  return (TIAutocorrectionList *)v14;
}

+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4 emojiList:(id)a5 inlineCompletions:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[TICorrectionCandidates alloc] initWithAutocorrection:v12 alternateCorrections:0];

  id v14 = +[TIAutocorrectionList listWithCorrections:v13 predictions:v11 emojiList:v10 inlineCompletions:v9];

  return (TIAutocorrectionList *)v14;
}

+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4 emojiList:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[TICorrectionCandidates alloc] initWithAutocorrection:v9 alternateCorrections:0];

  id v11 = +[TIAutocorrectionList listWithCorrections:v10 predictions:v8 emojiList:v7];

  return (TIAutocorrectionList *)v11;
}

+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[TICorrectionCandidates alloc] initWithAutocorrection:v6 alternateCorrections:0];

  id v8 = +[TIAutocorrectionList listWithCorrections:v7 predictions:v5];

  return (TIAutocorrectionList *)v8;
}

+ (TIAutocorrectionList)listWithAutocorrection:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[TICorrectionCandidates alloc] initWithAutocorrection:v3 alternateCorrections:0];

  id v5 = +[TIAutocorrectionList listWithCorrections:v4];

  return (TIAutocorrectionList *)v5;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 inlineCompletions:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithCorrections:v13 predictions:v12 emojiList:v11 proactiveTriggers:0 inlineCompletions:v10];

  return (TIAutocorrectionList *)v14;
}

+ (TIAutocorrectionList)listWithPredictions:(id)a3 emojiList:(id)a4 proactiveTriggers:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithCorrections:0 predictions:v10 emojiList:v9 proactiveTriggers:v8];

  return (TIAutocorrectionList *)v11;
}

+ (TIAutocorrectionList)listWithPredictions:(id)a3 proactiveTriggers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithCorrections:0 predictions:v7 emojiList:0 proactiveTriggers:v6 inlineCompletions:0];

  return (TIAutocorrectionList *)v8;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 inlineCompletionList:(id)a6 proactiveTriggers:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = (void *)[objc_alloc((Class)a1) initListWithCorrections:v16 predictions:v15 emojiList:v14 proactiveTriggers:v12 inlineCompletions:v13];

  return (TIAutocorrectionList *)v17;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithCorrections:v13 predictions:v12 emojiList:v11 proactiveTriggers:v10];

  return (TIAutocorrectionList *)v14;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithCorrections:v10 predictions:v9 emojiList:v8 proactiveTriggers:0 inlineCompletions:0];

  return (TIAutocorrectionList *)v11;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 inlineCompletionList:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithCorrections:v7 predictions:0 emojiList:0 proactiveTriggers:0 inlineCompletions:v6];

  return (TIAutocorrectionList *)v8;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithCorrections:v7 predictions:v6 emojiList:0 proactiveTriggers:0 inlineCompletions:0];

  return (TIAutocorrectionList *)v8;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithCorrections:v4 predictions:0 emojiList:0 proactiveTriggers:0 inlineCompletions:0];

  return (TIAutocorrectionList *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end