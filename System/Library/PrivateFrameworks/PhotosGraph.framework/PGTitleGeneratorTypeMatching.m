@interface PGTitleGeneratorTypeMatching
+ (id)typeMatchingWithType:(int64_t)a3 eventEvaluationBlock:(id)a4;
- (PGTitleGeneratorTypeMatching)initWithType:(int64_t)a3 eventEvaluationBlock:(id)a4;
- (id)eventEvaluationBlock;
- (int64_t)type;
@end

@implementation PGTitleGeneratorTypeMatching

- (void).cxx_destruct
{
}

- (id)eventEvaluationBlock
{
  return self->_eventEvaluationBlock;
}

- (int64_t)type
{
  return self->_type;
}

- (PGTitleGeneratorTypeMatching)initWithType:(int64_t)a3 eventEvaluationBlock:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGTitleGeneratorTypeMatching;
  v7 = [(PGTitleGeneratorTypeMatching *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    id eventEvaluationBlock = v8->_eventEvaluationBlock;
    v8->_id eventEvaluationBlock = (id)v9;
  }
  return v8;
}

+ (id)typeMatchingWithType:(int64_t)a3 eventEvaluationBlock:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithType:a3 eventEvaluationBlock:v6];

  return v7;
}

@end