@interface RKSentenceClassifier_ru_RU
- (id)addSentenceTerminatorQuestion:(id)a3;
- (id)alternativeConjunctions;
- (id)classifySentence;
- (void)analyzeSentence;
@end

@implementation RKSentenceClassifier_ru_RU

- (id)alternativeConjunctions
{
  return &unk_26C8EC3C8;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RKSentenceClassifier_ru_RU;
  v3 = [(RKSentenceClassifier *)&v6 addSentenceTerminatorQuestion:a3];
  v4 = [v3 stringByAppendingString:@"?"];

  return v4;
}

- (void)analyzeSentence
{
  v2.receiver = self;
  v2.super_class = (Class)RKSentenceClassifier_ru_RU;
  [(RKSentenceClassifier *)&v2 analyzeSentence];
}

- (id)classifySentence
{
  v12.receiver = self;
  v12.super_class = (Class)RKSentenceClassifier_ru_RU;
  v3 = [(RKSentenceClassifier *)&v12 classifySentence];
  if (![v3 sentenceType])
  {
    v4 = [(RKSentenceClassifier *)self interrogatives];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__RKSentenceClassifier_ru_RU_classifySentence__block_invoke;
    v10[3] = &unk_2642D1DD8;
    id v11 = v3;
    [v4 enumerateObjectsUsingBlock:v10];
  }
  if ([v3 sentenceType] == 11)
  {
    v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"(string == 'ты' || string == 'вы')"];
    objc_super v6 = [(RKSentenceClassifier *)self sentenceEntities];
    v7 = [v6 filteredArrayUsingPredicate:v5];
    uint64_t v8 = [v7 count];

    if (v8) {
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