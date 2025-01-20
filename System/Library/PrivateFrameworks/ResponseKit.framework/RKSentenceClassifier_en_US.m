@interface RKSentenceClassifier_en_US
+ (id)preProcessTextMessageForLinguisticTagger:(id)a3;
- (id)addSentenceTerminatorQuestion:(id)a3;
- (id)alternativeConjunctions;
- (id)classifySentence;
- (void)analyzeSentence;
@end

@implementation RKSentenceClassifier_en_US

- (id)alternativeConjunctions
{
  return &unk_26C8EC278;
}

+ (id)preProcessTextMessageForLinguisticTagger:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F08948];
  id v4 = a3;
  id v5 = [v3 alloc];
  v18[0] = *MEMORY[0x263F082B0];
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v7 = (void *)[v5 initWithTagSchemes:v6 options:6];

  [v7 setString:v4];
  v8 = (void *)[v4 mutableCopy];

  uint64_t v9 = [v8 length];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__RKSentenceClassifier_en_US_preProcessTextMessageForLinguisticTagger___block_invoke;
  v15[3] = &unk_2642D22F8;
  id v16 = v7;
  id v10 = v8;
  id v17 = v10;
  id v11 = v7;
  objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 259, v15);
  v12 = v17;
  id v13 = v10;

  return v13;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RKSentenceClassifier_en_US;
  v3 = [(RKSentenceClassifier *)&v6 addSentenceTerminatorQuestion:a3];
  id v4 = [v3 stringByAppendingString:@"?"];

  return v4;
}

- (void)analyzeSentence
{
  v14[5] = *MEMORY[0x263EF8340];
  v3 = [(RKSentenceClassifier *)self sentenceEntities];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_3];

  v13.receiver = self;
  v13.super_class = (Class)RKSentenceClassifier_en_US;
  [(RKSentenceClassifier *)&v13 analyzeSentence];
  id v4 = [MEMORY[0x263EFF8C0] array];
  [(RKSentenceClassifier *)self setInversions:v4];

  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_26C8EC290];
  objc_super v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = *MEMORY[0x263F08298];
  v14[0] = *MEMORY[0x263F08238];
  v14[1] = v7;
  uint64_t v8 = *MEMORY[0x263F08288];
  v14[2] = *MEMORY[0x263F08280];
  v14[3] = v8;
  v14[4] = *MEMORY[0x263F08258];
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:5];
  id v10 = [v6 setWithArray:v9];

  id v11 = [(RKSentenceClassifier *)self sentenceEntities];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__RKSentenceClassifier_en_US_analyzeSentence__block_invoke_2;
  v12[3] = &unk_2642D2340;
  v12[4] = v10;
  v12[5] = self;
  v12[6] = v5;
  [v11 enumerateObjectsUsingBlock:v12];
}

- (id)classifySentence
{
  v3 = objc_opt_new();
  if (![v3 sentenceType])
  {
    id v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"lemma == 'please'"];
    id v5 = [(RKSentenceClassifier *)self sentenceEntities];
    objc_super v6 = [v5 filteredArrayUsingPredicate:v4];
    uint64_t v7 = [v6 count];

    if (v7) {
      [v3 setSentenceType:4];
    }
  }
  if (![v3 sentenceType])
  {
    v60.receiver = self;
    v60.super_class = (Class)RKSentenceClassifier_en_US;
    uint64_t v8 = [(RKSentenceClassifier *)&v60 classifySentence];

    v3 = (void *)v8;
  }
  if ([v3 sentenceType] == 6)
  {
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    uint64_t v59 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    v55[3] = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    char v54 = 0;
    uint64_t v9 = [(RKSentenceClassifier *)self sentenceEntities];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __46__RKSentenceClassifier_en_US_classifySentence__block_invoke;
    v48[3] = &unk_2642D2390;
    v48[4] = self;
    v50 = &v56;
    v51 = v53;
    id v10 = v3;
    id v49 = v10;
    v52 = v55;
    [v9 enumerateObjectsUsingBlock:v48];

    if (v57[3]) {
      goto LABEL_10;
    }
    id v11 = [(RKSentenceClassifier *)self sentenceEntities];
    v12 = [(RKSentenceClassifier *)self alternatives];
    objc_super v13 = [(RKSentenceClassifier *)self alternatives];
    v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 1);
    v15 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v14, "rangeValue"));
    id v16 = [v15 word];
    int v17 = [v16 isEqualToString:@"so"];

    if (v17)
    {
LABEL_10:
      [v10 setSentenceType:0];
      [v10 setCustomResponses:0];
    }

    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v55, 8);
    _Block_object_dispose(&v56, 8);
  }
  if (![v3 sentenceType])
  {
    v18 = [(RKSentenceClassifier *)self interrogatives];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_3;
    v46[3] = &unk_2642D1E30;
    v46[4] = self;
    id v47 = v3;
    [v18 enumerateObjectsUsingBlock:v46];
  }
  if ([v3 sentenceType] == 19)
  {
    v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"partOfSpeech == %@ && lemma == 'time'", *MEMORY[0x263F08238]];
    v20 = [(RKSentenceClassifier *)self sentenceEntities];
    v21 = [v20 filteredArrayUsingPredicate:v19];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      v23 = v3;
      uint64_t v24 = 28;
LABEL_20:
      [v23 setSentenceType:v24];
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  if ([v3 sentenceType] != 11)
  {
    if ([v3 sentenceType] != 21) {
      goto LABEL_31;
    }
    v19 = [MEMORY[0x263EFFA08] setWithArray:&unk_26C8EC2C0];
    v28 = [MEMORY[0x263F08A98] predicateWithFormat:@"(lemma == 'tomorrow') || (lemma == 'yesterday')"];
    uint64_t v29 = *MEMORY[0x263F082E8];
    v30 = [MEMORY[0x263F08A98] predicateWithFormat:@"(partOfSpeech == %@ && lemma == 'will') || (partOfSpeech == %@ && lemma == 'next')", *MEMORY[0x263F082E8], *MEMORY[0x263F08290]];
    v31 = [MEMORY[0x263F08A98] predicateWithFormat:@"(partOfSpeech == %@ && string.lowercaseString IN %@) || (partOfSpeech == %@ && lemma == 'last')", v29, v19, *MEMORY[0x263F081F0]];
    v32 = [(RKSentenceClassifier *)self sentenceEntities];
    v33 = [v32 filteredArrayUsingPredicate:v28];
    uint64_t v34 = [v33 count];

    if (v34)
    {
      uint64_t v35 = 24;
    }
    else
    {
      v36 = [(RKSentenceClassifier *)self sentenceEntities];
      v37 = [v36 filteredArrayUsingPredicate:v31];
      uint64_t v38 = [v37 count];

      if (v38)
      {
        uint64_t v35 = 22;
      }
      else
      {
        v39 = [(RKSentenceClassifier *)self sentenceEntities];
        v40 = [v39 filteredArrayUsingPredicate:v30];
        uint64_t v41 = [v40 count];

        if (!v41)
        {
LABEL_29:

          goto LABEL_30;
        }
        uint64_t v35 = 23;
      }
    }
    [v3 setSentenceType:v35];
    goto LABEL_29;
  }
  v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"partOfSpeech == %@ && lemma == 'you'", *MEMORY[0x263F08298]];
  v25 = [(RKSentenceClassifier *)self sentenceEntities];
  v26 = [v25 filteredArrayUsingPredicate:v19];
  uint64_t v27 = [v26 count];

  if (v27)
  {
    v23 = v3;
    uint64_t v24 = 12;
    goto LABEL_20;
  }
LABEL_30:

LABEL_31:
  if (![v3 sentenceType])
  {
    v42 = [(RKSentenceClassifier *)self inversions];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_4;
    v44[3] = &unk_2642D23B8;
    v44[4] = self;
    id v45 = v3;
    [v42 enumerateObjectsUsingBlock:v44];
  }
  if (![v3 sentenceType]
    && [(RKSentenceClassifier *)self sentenceHasQuestionTerminator])
  {
    [v3 setSentenceType:1];
  }

  return v3;
}

@end