@interface PGMeaningfulEventMatchingResult
- (BOOL)isMatching;
- (BOOL)isReliable;
- (PGMeaningfulEventMatchingResult)initWithIsMatching:(BOOL)a3 score:(double)a4 isReliable:(BOOL)a5 requiredCriteria:(id)a6;
- (PGMeaningfulEventRequiredCriteria)requiredCriteria;
- (double)score;
- (id)description;
@end

@implementation PGMeaningfulEventMatchingResult

- (void).cxx_destruct
{
}

- (PGMeaningfulEventRequiredCriteria)requiredCriteria
{
  return self->_requiredCriteria;
}

- (BOOL)isReliable
{
  return self->_isReliable;
}

- (double)score
{
  return self->_score;
}

- (BOOL)isMatching
{
  return self->_isMatching;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PGMeaningfulEventMatchingResult;
  uint64_t v4 = [(PGMeaningfulEventMatchingResult *)&v10 description];
  v5 = (void *)v4;
  v6 = @"YES";
  if (self->_isMatching) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if (!self->_isReliable) {
    v6 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"%@ isMatching %@, score %.2f, isReliable %@, criteria %@", v4, v7, *(void *)&self->_score, v6, self->_requiredCriteria];

  return v8;
}

- (PGMeaningfulEventMatchingResult)initWithIsMatching:(BOOL)a3 score:(double)a4 isReliable:(BOOL)a5 requiredCriteria:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PGMeaningfulEventMatchingResult;
  v12 = [(PGMeaningfulEventMatchingResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_isMatching = a3;
    v12->_score = a4;
    v12->_isReliable = a5;
    objc_storeStrong((id *)&v12->_requiredCriteria, a6);
  }

  return v13;
}

@end