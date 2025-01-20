@interface RKSentenceClassifier_de_DE
- (id)addSentenceTerminatorQuestion:(id)a3;
- (id)alternativeConjunctions;
- (id)classifySentence;
- (void)analyzeSentence;
@end

@implementation RKSentenceClassifier_de_DE

- (id)alternativeConjunctions
{
  return &unk_26C8EC500;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RKSentenceClassifier_de_DE;
  v3 = [(RKSentenceClassifier *)&v6 addSentenceTerminatorQuestion:a3];
  v4 = [v3 stringByAppendingString:@"?"];

  return v4;
}

- (void)analyzeSentence
{
  v12[5] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)RKSentenceClassifier_de_DE;
  [(RKSentenceClassifier *)&v11 analyzeSentence];
  v3 = [MEMORY[0x263EFF8C0] array];
  [(RKSentenceClassifier *)self setInversions:v3];

  if (analyzeSentence_onceToken_0 != -1) {
    dispatch_once(&analyzeSentence_onceToken_0, &__block_literal_global_9);
  }
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F08298];
  v12[0] = *MEMORY[0x263F08238];
  v12[1] = v5;
  uint64_t v6 = *MEMORY[0x263F08288];
  v12[2] = *MEMORY[0x263F08280];
  v12[3] = v6;
  v12[4] = *MEMORY[0x263F08258];
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];
  v8 = [v4 setWithArray:v7];

  v9 = [(RKSentenceClassifier *)self sentenceEntities];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__RKSentenceClassifier_de_DE_analyzeSentence__block_invoke_2;
  v10[3] = &unk_2642D1E08;
  v10[4] = v8;
  v10[5] = self;
  [v9 enumerateObjectsUsingBlock:v10];
}

- (id)classifySentence
{
  v19.receiver = self;
  v19.super_class = (Class)RKSentenceClassifier_de_DE;
  v3 = [(RKSentenceClassifier *)&v19 classifySentence];
  if (![v3 sentenceType])
  {
    v4 = [(RKSentenceClassifier *)self interrogatives];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __46__RKSentenceClassifier_de_DE_classifySentence__block_invoke;
    v17[3] = &unk_2642D1E30;
    v17[4] = self;
    id v18 = v3;
    [v4 enumerateObjectsUsingBlock:v17];
  }
  if ([v3 sentenceType] == 11)
  {
    uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"partOfSpeech == %@ && ((word == 'du') || (string == 'Sie'))", *MEMORY[0x263F08298]];
    uint64_t v6 = [(RKSentenceClassifier *)self sentenceEntities];
    v7 = [v6 filteredArrayUsingPredicate:v5];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = 12;
LABEL_9:
      [v3 setSentenceType:v9];
    }
  }
  else
  {
    if ([v3 sentenceType] != 21) {
      goto LABEL_11;
    }
    uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"(string LIKE[cd] 'morgen') || (string LIKE[cd] 'morgigen') || (string LIKE[cd] 'gestern') || (string LIKE[cd] 'gestrigen')"];
    v10 = [(RKSentenceClassifier *)self sentenceEntities];
    objc_super v11 = [v10 filteredArrayUsingPredicate:v5];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      uint64_t v9 = 24;
      goto LABEL_9;
    }
  }

LABEL_11:
  if (![v3 sentenceType])
  {
    v13 = [(RKSentenceClassifier *)self inversions];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__RKSentenceClassifier_de_DE_classifySentence__block_invoke_2;
    v15[3] = &unk_2642D23B8;
    v15[4] = self;
    id v16 = v3;
    [v13 enumerateObjectsUsingBlock:v15];
  }
  if (![v3 sentenceType]
    && [(RKSentenceClassifier *)self sentenceHasQuestionTerminator])
  {
    [v3 setSentenceType:1];
  }

  return v3;
}

@end