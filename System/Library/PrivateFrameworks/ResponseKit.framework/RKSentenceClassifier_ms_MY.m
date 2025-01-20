@interface RKSentenceClassifier_ms_MY
- (id)addSentenceTerminatorQuestion:(id)a3;
- (id)alternativeConjunctions;
- (id)classifySentence;
- (void)analyzeSentence;
@end

@implementation RKSentenceClassifier_ms_MY

- (id)alternativeConjunctions
{
  return &unk_26C8EC368;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RKSentenceClassifier_ms_MY;
  v3 = [(RKSentenceClassifier *)&v6 addSentenceTerminatorQuestion:a3];
  v4 = [v3 stringByAppendingString:@"?"];

  return v4;
}

- (void)analyzeSentence
{
  v2.receiver = self;
  v2.super_class = (Class)RKSentenceClassifier_ms_MY;
  [(RKSentenceClassifier *)&v2 analyzeSentence];
}

- (id)classifySentence
{
  v18.receiver = self;
  v18.super_class = (Class)RKSentenceClassifier_ms_MY;
  v3 = [(RKSentenceClassifier *)&v18 classifySentence];
  if (![v3 sentenceType])
  {
    v4 = [(RKSentenceClassifier *)self interrogatives];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__RKSentenceClassifier_ms_MY_classifySentence__block_invoke;
    v16[3] = &unk_2642D1DD8;
    id v17 = v3;
    [v4 enumerateObjectsUsingBlock:v16];
  }
  if ([v3 sentenceType] == 2)
  {
    v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"word == 'boleh'"];
    objc_super v6 = [(RKSentenceClassifier *)self sentenceEntities];
    v7 = [v6 filteredArrayUsingPredicate:v5];
    uint64_t v8 = [v7 count];

    if (v8) {
      [v3 setSentenceType:4];
    }
  }
  if ([v3 sentenceType] == 11)
  {
    v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"word == 'anda'"];
    v10 = [(RKSentenceClassifier *)self sentenceEntities];
    v11 = [v10 filteredArrayUsingPredicate:v9];
    uint64_t v12 = [v11 count];

    if (v12) {
      [v3 setSentenceType:12];
    }
  }
  if (![v3 sentenceType])
  {
    v13 = [(RKSentenceClassifier *)self appreciations];
    uint64_t v14 = [v13 count];

    if (v14) {
      [v3 setSentenceType:34];
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