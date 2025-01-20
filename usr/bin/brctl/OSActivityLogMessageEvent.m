@interface OSActivityLogMessageEvent
- (BOOL)br_isOversize;
@end

@implementation OSActivityLogMessageEvent

- (BOOL)br_isOversize
{
  return ((unint64_t)[(OSActivityLogMessageEvent *)self traceID] >> 27) & 1;
}

@end