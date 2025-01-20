@interface PPExtractionContext
- (PPExtractionContext)initWithProbabilities:(id)a3;
- (double)probabilityForDomain:(unsigned int)a3;
@end

@implementation PPExtractionContext

- (void).cxx_destruct
{
}

- (double)probabilityForDomain:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  probabilities = self->_probabilities;
  v5 = (void *)MEMORY[0x1CB79D060]();
  v6 = [NSNumber numberWithUnsignedInt:v3];
  v7 = [(NSDictionary *)probabilities objectForKeyedSubscript:v6];
  [v7 doubleValue];
  double v9 = v8;

  return v9;
}

- (PPExtractionContext)initWithProbabilities:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPExtractionContext;
  v6 = [(PPExtractionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_probabilities, a3);
  }

  return v7;
}

@end