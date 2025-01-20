@interface NIServerSystemStatusPublisher
- (NIServerSystemStatusPublisher)initWithSystemStatus:(int)a3;
@end

@implementation NIServerSystemStatusPublisher

- (NIServerSystemStatusPublisher)initWithSystemStatus:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NIServerSystemStatusPublisher;
  return [(NIServerSystemStatusPublisher *)&v4 init];
}

@end