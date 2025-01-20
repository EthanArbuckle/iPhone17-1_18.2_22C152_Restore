@interface ScoreBasedResolutionResult
- (NSArray)resolutionSummary;
- (NSArray)resolvedEntities;
- (ScoreBasedResolutionResult)initWithType:(unint64_t)a3 resolvedEntities:(id)a4 resolutionSummary:(id)a5;
- (unint64_t)resolutionResultType;
- (void)setResolutionResultType:(unint64_t)a3;
- (void)setResolutionSummary:(id)a3;
- (void)setResolvedEntities:(id)a3;
@end

@implementation ScoreBasedResolutionResult

- (ScoreBasedResolutionResult)initWithType:(unint64_t)a3 resolvedEntities:(id)a4 resolutionSummary:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ScoreBasedResolutionResult;
  v10 = [(ScoreBasedResolutionResult *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_resolutionResultType = a3;
    v12 = (NSArray *)[v8 copy];
    resolvedEntities = v11->_resolvedEntities;
    v11->_resolvedEntities = v12;

    v14 = (NSArray *)[v9 copy];
    resolutionSummary = v11->_resolutionSummary;
    v11->_resolutionSummary = v14;
  }
  return v11;
}

- (unint64_t)resolutionResultType
{
  return self->_resolutionResultType;
}

- (void)setResolutionResultType:(unint64_t)a3
{
  self->_resolutionResultType = a3;
}

- (NSArray)resolvedEntities
{
  return self->_resolvedEntities;
}

- (void)setResolvedEntities:(id)a3
{
}

- (NSArray)resolutionSummary
{
  return self->_resolutionSummary;
}

- (void)setResolutionSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionSummary, 0);

  objc_storeStrong((id *)&self->_resolvedEntities, 0);
}

@end