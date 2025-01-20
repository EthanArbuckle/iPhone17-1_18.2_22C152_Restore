@interface SCMLTextModerationLMResult
- (BOOL)safe;
- (NSArray)predictions;
- (SCMLTextModerationLMResult)init;
- (void)setPredictions:(id)a3;
- (void)setSafe:(BOOL)a3;
@end

@implementation SCMLTextModerationLMResult

- (SCMLTextModerationLMResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)SCMLTextModerationLMResult;
  v2 = [(SCMLTextModerationLMResult *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_safe = 1;
    uint64_t v4 = [MEMORY[0x263EFFA68] mutableCopy];
    predictions = v3->_predictions;
    v3->_predictions = (NSArray *)v4;
  }
  return v3;
}

- (BOOL)safe
{
  return self->_safe;
}

- (void)setSafe:(BOOL)a3
{
  self->_safe = a3;
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (void)setPredictions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end