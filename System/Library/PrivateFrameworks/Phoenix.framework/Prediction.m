@interface Prediction
- (Prediction)initWithModelOutput:(id)a3;
- (double)doubleTapScore;
- (double)maxConfidence;
- (double)noneScore;
- (double)tripleTapScore;
- (id)description;
- (unint64_t)predictedClass;
- (void)setNoneScore:(double)a3;
- (void)setPredictedClass:(unint64_t)a3;
@end

@implementation Prediction

- (Prediction)initWithModelOutput:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)Prediction;
  v14 = [(Prediction *)&v12 init];
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    id v9 = (id)[location[0] objectAtIndexedSubscript:0];
    [v9 doubleValue];
    v14->_noneScore = v4;

    id v10 = (id)[location[0] objectAtIndexedSubscript:1];
    [v10 doubleValue];
    v14->_doubleTapScore = v5;

    id v11 = (id)[location[0] objectAtIndexedSubscript:2];
    [v11 doubleValue];
    v14->_tripleTapScore = v6;

    v14->_maxConfidence = v14->_noneScore;
    v14->_predictedClass = 0;
    if (v14->_doubleTapScore > v14->_maxConfidence)
    {
      v14->_maxConfidence = v14->_doubleTapScore;
      v14->_predictedClass = 1;
    }
    if (v14->_tripleTapScore > v14->_maxConfidence)
    {
      v14->_maxConfidence = v14->_tripleTapScore;
      v14->_predictedClass = 2;
    }
  }
  v8 = v14;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v8;
}

- (id)description
{
  v3 = NSString;
  id v8 = (id)[NSNumber numberWithUnsignedInteger:self->_predictedClass];
  id v7 = (id)[NSNumber numberWithDouble:self->_maxConfidence];
  id v6 = (id)[NSNumber numberWithDouble:self->_noneScore];
  id v5 = (id)[NSNumber numberWithDouble:self->_doubleTapScore];
  id v4 = (id)[NSNumber numberWithDouble:self->_tripleTapScore];
  id v9 = (id)[v3 stringWithFormat:@"class: %@, maxScore: %@ scores:{%@, %@, %@}", v8, v7, v6, v5, v4];

  return v9;
}

- (double)noneScore
{
  return self->_noneScore;
}

- (void)setNoneScore:(double)a3
{
  self->_noneScore = a3;
}

- (double)doubleTapScore
{
  return self->_doubleTapScore;
}

- (double)tripleTapScore
{
  return self->_tripleTapScore;
}

- (double)maxConfidence
{
  return self->_maxConfidence;
}

- (unint64_t)predictedClass
{
  return self->_predictedClass;
}

- (void)setPredictedClass:(unint64_t)a3
{
  self->_predictedClass = a3;
}

@end