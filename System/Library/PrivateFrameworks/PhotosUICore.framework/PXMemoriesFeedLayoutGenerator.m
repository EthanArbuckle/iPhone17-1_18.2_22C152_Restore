@interface PXMemoriesFeedLayoutGenerator
- (BOOL)includeDateHeader;
- (BOOL)isFirstHeader;
- (PXMemoriesFeedLayoutGenerator)initWithMetrics:(id)a3;
- (void)setIncludeDateHeader:(BOOL)a3;
- (void)setIsFirstHeader:(BOOL)a3;
@end

@implementation PXMemoriesFeedLayoutGenerator

- (void)setIsFirstHeader:(BOOL)a3
{
  self->_isFirstHeader = a3;
}

- (BOOL)isFirstHeader
{
  return self->_isFirstHeader;
}

- (void)setIncludeDateHeader:(BOOL)a3
{
  self->_includeDateHeader = a3;
}

- (BOOL)includeDateHeader
{
  return self->_includeDateHeader;
}

- (PXMemoriesFeedLayoutGenerator)initWithMetrics:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXMemoriesFeedLayoutGenerator.m", 16, @"Invalid parameter not satisfying: %@", @"[metrics isKindOfClass:[PXMemoriesFeedLayoutMetrics class]]" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)PXMemoriesFeedLayoutGenerator;
  v6 = [(PXMemoriesFeedLayoutGenerator *)&v9 initWithMetrics:v5];

  return v6;
}

@end