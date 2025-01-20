@interface RKSentenceClassifier_fr_FR
- (id)alternativeConjunctions;
- (id)classifySentence;
- (id)lexicalEntitiesFromString:(id)a3;
- (void)analyzeSentence;
@end

@implementation RKSentenceClassifier_fr_FR

- (id)alternativeConjunctions
{
  return &unk_26C8EBE88;
}

- (id)lexicalEntitiesFromString:(id)a3
{
  v4 = [a3 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
  v5 = [v4 lowercaseString];

  v8.receiver = self;
  v8.super_class = (Class)RKSentenceClassifier_fr_FR;
  v6 = [(RKSentenceClassifier *)&v8 lexicalEntitiesFromString:v5];

  return v6;
}

- (void)analyzeSentence
{
  v12[5] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)RKSentenceClassifier_fr_FR;
  [(RKSentenceClassifier *)&v11 analyzeSentence];
  v3 = [MEMORY[0x263EFF8C0] array];
  [(RKSentenceClassifier *)self setInversions:v3];

  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F08298];
  v12[0] = *MEMORY[0x263F08238];
  v12[1] = v5;
  uint64_t v6 = *MEMORY[0x263F08288];
  v12[2] = *MEMORY[0x263F08280];
  v12[3] = v6;
  v12[4] = *MEMORY[0x263F08258];
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];
  objc_super v8 = [v4 setWithArray:v7];

  v9 = [(RKSentenceClassifier *)self sentenceEntities];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__RKSentenceClassifier_fr_FR_analyzeSentence__block_invoke;
  v10[3] = &unk_2642D1E08;
  v10[4] = v8;
  v10[5] = self;
  [v9 enumerateObjectsUsingBlock:v10];
}

- (id)classifySentence
{
  v35.receiver = self;
  v35.super_class = (Class)RKSentenceClassifier_fr_FR;
  v3 = [(RKSentenceClassifier *)&v35 classifySentence];
  if (![v3 sentenceType])
  {
    v4 = [(RKSentenceClassifier *)self sentenceEntities];
    if ([v4 count])
    {
      uint64_t v5 = [(RKSentenceClassifier *)self sentenceEntities];
      uint64_t v6 = [v5 objectAtIndexedSubscript:0];
      uint64_t v7 = [v6 word];
      if (v7)
      {
        objc_super v8 = (void *)v7;
        v9 = [(RKSentenceClassifier *)self sentenceEntities];
        v10 = [v9 objectAtIndexedSubscript:0];
        objc_super v11 = [v10 word];
        int v12 = [&unk_26C8EBEA0 containsObject:v11];

        if (v12)
        {
          [v3 setSentenceType:8];
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
LABEL_8:
    v13 = [(RKSentenceClassifier *)self interrogatives];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __46__RKSentenceClassifier_fr_FR_classifySentence__block_invoke;
    v33[3] = &unk_2642D1E30;
    v33[4] = self;
    id v34 = v3;
    [v13 enumerateObjectsUsingBlock:v33];
  }
LABEL_9:
  if (![v3 sentenceType])
  {
    v14 = [(RKSentenceClassifier *)self inversions];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __46__RKSentenceClassifier_fr_FR_classifySentence__block_invoke_2;
    v31[3] = &unk_2642D1E58;
    id v32 = v3;
    [v14 enumerateObjectsUsingBlock:v31];
  }
  v15 = [(RKSentenceClassifier *)self sentenceString];
  v16 = [v15 lowercaseString];

  if ([v3 sentenceType] && objc_msgSend(v16, "containsString:", @"comment"))
  {
    v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"(lemma == 'appeler') || (lemma == 'appelles') || (lemma == \"s'appeler\""];
    v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"(lemma == 'dire')"];
    if (([v16 isEqualToString:@"comment?"] & 1) == 0
      && ([v16 isEqualToString:@"comment!"] & 1) == 0)
    {
      v25 = [(RKSentenceClassifier *)self sentenceEntities];
      v26 = [v25 filteredArrayUsingPredicate:v17];
      uint64_t v27 = [v26 count];

      if (v27)
      {
        uint64_t v19 = 9;
        goto LABEL_16;
      }
      v28 = [(RKSentenceClassifier *)self sentenceEntities];
      v29 = [v28 filteredArrayUsingPredicate:v18];
      uint64_t v30 = [v29 count];

      if (!v30
        && !+[RKUtilities prefixInArray:withArray:](RKUtilities, "prefixInArray:withArray:", v16, &unk_26C8EBED0)&& (!+[RKUtilities prefixInArray:withArray:](RKUtilities, "prefixInArray:withArray:", v16, &unk_26C8EBEE8)|| !+[RKUtilities suffixInArray:withArray:](RKUtilities, "suffixInArray:withArray:", v16, &unk_26C8EBF00)&& !+[RKUtilities tokenInArray:v16 withArray:&unk_26C8EBEB8])
        && !+[RKUtilities tokenInArray:v16 withArray:&unk_26C8EBF18])
      {
        goto LABEL_17;
      }
    }
    uint64_t v19 = 8;
LABEL_16:
    [v3 setSentenceType:v19];
LABEL_17:
  }
  if ([v3 sentenceType] == 11)
  {
    v20 = [MEMORY[0x263F08A98] predicateWithFormat:@"partOfSpeech == %@ &&(word == 't\\'' || string == 'tu')", *MEMORY[0x263F08298]];
    v21 = [(RKSentenceClassifier *)self sentenceEntities];
    v22 = [v21 filteredArrayUsingPredicate:v20];
    uint64_t v23 = [v22 count];

    if (v23) {
      [v3 setSentenceType:12];
    }
  }
  if (![v3 sentenceType]
    && [(RKSentenceClassifier *)self sentenceHasQuestionTerminator])
  {
    [v3 setSentenceType:1];
  }

  return v3;
}

@end