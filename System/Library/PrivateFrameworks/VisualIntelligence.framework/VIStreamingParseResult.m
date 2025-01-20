@interface VIStreamingParseResult
- (NSArray)detectedObjects;
- (VIStreamingParseResult)initWithDetectedObjects:(id)a3;
@end

@implementation VIStreamingParseResult

- (VIStreamingParseResult)initWithDetectedObjects:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIStreamingParseResult;
  v5 = [(VIStreamingParseResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    detectedObjects = v5->_detectedObjects;
    v5->_detectedObjects = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)detectedObjects
{
  return self->_detectedObjects;
}

- (void).cxx_destruct
{
}

@end