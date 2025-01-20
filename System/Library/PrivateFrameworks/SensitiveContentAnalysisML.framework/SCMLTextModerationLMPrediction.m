@interface SCMLTextModerationLMPrediction
- (BOOL)safe;
- (NSString)nameP1;
- (SCMLTextModerationLMPrediction)initWithNameP1:(id)a3 safe:(BOOL)a4 probability:(float)a5;
- (float)probability;
- (void)setNameP1:(id)a3;
- (void)setProbability:(float)a3;
- (void)setSafe:(BOOL)a3;
@end

@implementation SCMLTextModerationLMPrediction

- (SCMLTextModerationLMPrediction)initWithNameP1:(id)a3 safe:(BOOL)a4 probability:(float)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCMLTextModerationLMPrediction;
  v10 = [(SCMLTextModerationLMPrediction *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_nameP1, a3);
    v11->_safe = a4;
    v11->_probability = a5;
  }

  return v11;
}

- (NSString)nameP1
{
  return self->_nameP1;
}

- (void)setNameP1:(id)a3
{
}

- (BOOL)safe
{
  return self->_safe;
}

- (void)setSafe:(BOOL)a3
{
  self->_safe = a3;
}

- (float)probability
{
  return self->_probability;
}

- (void)setProbability:(float)a3
{
  self->_probability = a3;
}

- (void).cxx_destruct
{
}

@end