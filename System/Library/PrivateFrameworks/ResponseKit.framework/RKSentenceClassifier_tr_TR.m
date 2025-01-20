@interface RKSentenceClassifier_tr_TR
- (id)addSentenceTerminatorQuestion:(id)a3;
- (id)alternativeConjunctions;
- (id)classifySentence;
- (void)analyzeSentence;
@end

@implementation RKSentenceClassifier_tr_TR

- (id)alternativeConjunctions
{
  return &unk_26C8EBF30;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RKSentenceClassifier_tr_TR;
  v3 = [(RKSentenceClassifier *)&v6 addSentenceTerminatorQuestion:a3];
  v4 = [v3 stringByAppendingString:@"?"];

  return v4;
}

- (void)analyzeSentence
{
  v2.receiver = self;
  v2.super_class = (Class)RKSentenceClassifier_tr_TR;
  [(RKSentenceClassifier *)&v2 analyzeSentence];
}

- (id)classifySentence
{
  v19.receiver = self;
  v19.super_class = (Class)RKSentenceClassifier_tr_TR;
  v3 = [(RKSentenceClassifier *)&v19 classifySentence];
  if (![v3 sentenceType])
  {
    v4 = [(RKSentenceClassifier *)self interrogatives];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __46__RKSentenceClassifier_tr_TR_classifySentence__block_invoke;
    v17[3] = &unk_2642D1DD8;
    id v18 = v3;
    [v4 enumerateObjectsUsingBlock:v17];
  }
  if (![v3 sentenceType])
  {
    v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"m[ıiuü][ ]*\\?" options:1 error:0];
    objc_super v6 = [(RKSentenceClassifier *)self sentenceString];
    v7 = [(RKSentenceClassifier *)self sentenceString];
    v8 = objc_msgSend(v5, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v7, "length"));

    if (v8)
    {
      uint64_t v9 = 3;
    }
    else
    {
      if (![(RKSentenceClassifier *)self sentenceHasQuestionTerminator])
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v9 = 1;
    }
    [v3 setSentenceType:v9];
    goto LABEL_9;
  }
LABEL_10:
  if ([v3 sentenceType] == 11)
  {
    v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"(string == 'neredesin')"];
    v11 = [(RKSentenceClassifier *)self sentenceEntities];
    v12 = [v11 filteredArrayUsingPredicate:v10];
    uint64_t v13 = [v12 count];

    if (v13) {
      [v3 setSentenceType:12];
    }
  }
  if (![v3 sentenceType] || objc_msgSend(v3, "sentenceType") == 31)
  {
    v14 = [(RKSentenceClassifier *)self appreciations];
    uint64_t v15 = [v14 count];

    if (v15) {
      [v3 setSentenceType:34];
    }
  }

  return v3;
}

@end