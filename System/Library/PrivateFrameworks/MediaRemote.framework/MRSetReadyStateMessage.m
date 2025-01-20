@interface MRSetReadyStateMessage
- (unint64_t)type;
@end

@implementation MRSetReadyStateMessage

- (unint64_t)type
{
  return 36;
}

@end