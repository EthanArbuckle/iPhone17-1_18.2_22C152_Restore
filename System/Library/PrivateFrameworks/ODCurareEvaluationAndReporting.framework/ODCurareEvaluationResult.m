@interface ODCurareEvaluationResult
- (NSDictionary)metadata;
- (NSString)evaluationName;
- (ODCurareEvaluationResult)initWithEvaluationName:(id)a3 numberOfSamplesPositive:(int64_t)a4 numberOfSamplesTotal:(int64_t)a5;
- (id)description;
- (int64_t)numberOfSamplesPositive;
- (int64_t)numberOfSamplesTotal;
- (void)setEvaluationName:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNumberOfSamplesPositive:(int64_t)a3;
- (void)setNumberOfSamplesTotal:(int64_t)a3;
@end

@implementation ODCurareEvaluationResult

- (ODCurareEvaluationResult)initWithEvaluationName:(id)a3 numberOfSamplesPositive:(int64_t)a4 numberOfSamplesTotal:(int64_t)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODCurareEvaluationResult;
  v9 = [(ODCurareEvaluationResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(ODCurareEvaluationResult *)v9 setEvaluationName:v8];
    [(ODCurareEvaluationResult *)v10 setNumberOfSamplesPositive:a4];
    [(ODCurareEvaluationResult *)v10 setNumberOfSamplesTotal:a5];
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = [(ODCurareEvaluationResult *)self evaluationName];
  v5 = [v3 stringWithFormat:@"name: %@, numSampPos: %ld, numSampTot: %ld", v4, -[ODCurareEvaluationResult numberOfSamplesPositive](self, "numberOfSamplesPositive"), -[ODCurareEvaluationResult numberOfSamplesTotal](self, "numberOfSamplesTotal")];

  return v5;
}

- (NSString)evaluationName
{
  return self->_evaluationName;
}

- (void)setEvaluationName:(id)a3
{
}

- (int64_t)numberOfSamplesPositive
{
  return self->_numberOfSamplesPositive;
}

- (void)setNumberOfSamplesPositive:(int64_t)a3
{
  self->_numberOfSamplesPositive = a3;
}

- (int64_t)numberOfSamplesTotal
{
  return self->_numberOfSamplesTotal;
}

- (void)setNumberOfSamplesTotal:(int64_t)a3
{
  self->_numberOfSamplesTotal = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_evaluationName, 0);
}

@end