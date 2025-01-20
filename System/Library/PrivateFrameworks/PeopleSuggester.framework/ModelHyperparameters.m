@interface ModelHyperparameters
- (ModelHyperparameters)initWithNumTrees:(id)a3 learningRate:(id)a4 minChildWeight:(id)a5 adaptationStrategy:(id)a6;
- (NSNumber)learningRate;
- (NSNumber)minChildWeight;
- (NSNumber)numTrees;
- (int64_t)adaptationStrategy;
- (void)setAdaptationStrategy:(int64_t)a3;
- (void)setLearningRate:(id)a3;
- (void)setMinChildWeight:(id)a3;
- (void)setNumTrees:(id)a3;
@end

@implementation ModelHyperparameters

- (ModelHyperparameters)initWithNumTrees:(id)a3 learningRate:(id)a4 minChildWeight:(id)a5 adaptationStrategy:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ModelHyperparameters;
  v15 = [(ModelHyperparameters *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_numTrees, a3);
    objc_storeStrong((id *)&v16->_learningRate, a4);
    objc_storeStrong((id *)&v16->_minChildWeight, a5);
    v16->_adaptationStrategy = (int)[v14 intValue];
  }

  return v16;
}

- (NSNumber)numTrees
{
  return self->_numTrees;
}

- (void)setNumTrees:(id)a3
{
}

- (NSNumber)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(id)a3
{
}

- (NSNumber)minChildWeight
{
  return self->_minChildWeight;
}

- (void)setMinChildWeight:(id)a3
{
}

- (int64_t)adaptationStrategy
{
  return self->_adaptationStrategy;
}

- (void)setAdaptationStrategy:(int64_t)a3
{
  self->_adaptationStrategy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minChildWeight, 0);
  objc_storeStrong((id *)&self->_learningRate, 0);

  objc_storeStrong((id *)&self->_numTrees, 0);
}

@end