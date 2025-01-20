@interface REMLPrediction
+ (id)predictionWithProbability:(float)a3 mean:(float)a4 variance:(float)a5 pessimistic:(float)a6;
- (NSSet)explanations;
- (float)bias;
- (float)mean;
- (float)pessimistic;
- (float)probability;
- (float)variance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)explanationDescription;
- (void)addExplanation:(id)a3;
- (void)setBias:(float)a3;
@end

@implementation REMLPrediction

+ (id)predictionWithProbability:(float)a3 mean:(float)a4 variance:(float)a5 pessimistic:(float)a6
{
  uint64_t v10 = objc_opt_new();
  *(float *)(v10 + 16) = a4;
  *(float *)(v10 + 20) = a5;
  *(float *)(v10 + 24) = a3;
  *(float *)(v10 + 28) = a6;
  *(_DWORD *)(v10 + 32) = 0;
  return (id)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  *(float *)&double v4 = self->_mean;
  *(float *)&double v5 = self->_variance;
  *(float *)&double v3 = self->_probability;
  *(float *)&double v6 = self->_pessimistic;
  uint64_t v8 = +[REMLPrediction predictionWithProbability:mean:variance:pessimistic:](REMLPrediction, "predictionWithProbability:mean:variance:pessimistic:", a3, v3, v4, v5, v6);
  *(float *)(v8 + 32) = self->_bias;
  uint64_t v9 = [*(id *)(v8 + 8) mutableCopy];
  uint64_t v10 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v9;

  return (id)v8;
}

- (void)addExplanation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    explanations = self->_explanations;
    id v8 = v4;
    if (!explanations)
    {
      double v6 = [MEMORY[0x263EFF9C0] set];
      v7 = self->_explanations;
      self->_explanations = v6;

      explanations = self->_explanations;
    }
    [(NSMutableSet *)explanations addObject:v8];
  }
  MEMORY[0x270F9A758]();
}

- (id)explanationDescription
{
  double v3 = objc_alloc_init(REMLExplanationFormatter);
  id v4 = [(REMLExplanationFormatter *)v3 descriptionFromExplanations:self->_explanations];

  return v4;
}

- (NSSet)explanations
{
  v2 = (void *)[(NSMutableSet *)self->_explanations copy];
  double v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFFA08] set];
  }
  double v5 = v4;

  return (NSSet *)v5;
}

- (float)mean
{
  return self->_mean;
}

- (float)variance
{
  return self->_variance;
}

- (float)probability
{
  return self->_probability;
}

- (float)pessimistic
{
  return self->_pessimistic;
}

- (float)bias
{
  return self->_bias;
}

- (void)setBias:(float)a3
{
  self->_bias = a3;
}

- (void).cxx_destruct
{
}

@end