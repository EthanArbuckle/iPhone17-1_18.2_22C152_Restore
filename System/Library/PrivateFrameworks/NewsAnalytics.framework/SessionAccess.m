@interface SessionAccess
- (AAAccessQueue)accessQueue;
@end

@implementation SessionAccess

- (AAAccessQueue)accessQueue
{
  return (AAAccessQueue *)*(id *)self->accessQueue;
}

@end