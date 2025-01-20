@interface MTLToolsCounterSampleBuffer
- (NSString)label;
- (id)resolveCounterRange:(_NSRange)a3;
- (unint64_t)sampleCount;
@end

@implementation MTLToolsCounterSampleBuffer

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (unint64_t)sampleCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 sampleCount];
}

- (id)resolveCounterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(MTLToolsObject *)self baseObject];

  return (id)objc_msgSend(v5, "resolveCounterRange:", location, length);
}

@end