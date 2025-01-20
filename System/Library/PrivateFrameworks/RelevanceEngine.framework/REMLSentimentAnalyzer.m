@interface REMLSentimentAnalyzer
- (REMLSentimentAnalyzer)initWithContentRanker:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sentimentForText:(id)a3;
- (id)sentimentForTokens:(id)a3;
@end

@implementation REMLSentimentAnalyzer

- (REMLSentimentAnalyzer)initWithContentRanker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMLSentimentAnalyzer;
  v6 = [(REMLSentimentAnalyzer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentRanker, a3);
  }

  return v7;
}

- (id)sentimentForText:(id)a3
{
  v4 = RETokenizeString(a3);
  id v5 = [(REMLSentimentAnalyzer *)self sentimentForTokens:v4];

  return v5;
}

- (id)sentimentForTokens:(id)a3
{
  id v4 = a3;
  id v5 = [(REContentRanker *)self->_contentRanker predict:v4];
  if ([v5 valid])
  {
    v6 = objc_opt_new();
    [v5 positivePolarity];
    *(float *)&double v7 = v7;
    [v6 setPostivieSentiment:v7];
    [v5 negativePolarity];
    *(float *)&double v8 = v8;
    [v6 setNegativeSentiment:v8];
    float v9 = (float)(int)[v5 unknownCount];
    *(float *)&double v10 = 1.0 - (float)(v9 / (float)(unint64_t)[v4 count]);
    [v6 setCertainty:v10];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  contentRanker = self->_contentRanker;
  return (id)[v4 initWithContentRanker:contentRanker];
}

- (void).cxx_destruct
{
}

@end