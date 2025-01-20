@interface OS_session
- (void)dealloc;
@end

@implementation OS_session

- (void)dealloc
{
  _session_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_session;
  [(OS_session *)&v3 dealloc];
}

@end