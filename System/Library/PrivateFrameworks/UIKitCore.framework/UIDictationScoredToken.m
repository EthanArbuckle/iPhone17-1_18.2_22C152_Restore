@interface UIDictationScoredToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (UIDictationScoredToken)initWithCoder:(id)a3;
- (UIDictationScoredToken)initWithText:(id)a3 removeSpaceBefore:(BOOL)a4 removeSpaceAfter:(BOOL)a5 confidenceScore:(double)a6;
- (double)confidenceScore;
- (id)_descriptionExtra;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIDictationScoredToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationScoredToken)initWithText:(id)a3 removeSpaceBefore:(BOOL)a4 removeSpaceAfter:(BOOL)a5 confidenceScore:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)UIDictationScoredToken;
  v7 = [(UIDictationToken *)&v11 initWithText:a3 removeSpaceBefore:a4 removeSpaceAfter:a5];
  v8 = v7;
  if (v7)
  {
    v7->_confidenceScore = a6;
    v9 = v7;
  }

  return v8;
}

- (UIDictationScoredToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIDictationScoredToken;
  v5 = [(UIDictationToken *)&v9 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"confidenceScore"];
    v5->_confidenceScore = v6;
    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIDictationScoredToken;
  id v4 = a3;
  [(UIDictationToken *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"confidenceScore", self->_confidenceScore, v5.receiver, v5.super_class);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIDictationScoredToken;
  if ([(UIDictationToken *)&v9 isEqual:v4])
  {
    double confidenceScore = self->_confidenceScore;
    [v4 confidenceScore];
    BOOL v7 = vabdd_f64(confidenceScore, v6) < 0.000000001;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_descriptionExtra
{
  return (id)[NSString stringWithFormat:@", score=%.2f", *(void *)&self->_confidenceScore];
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

@end