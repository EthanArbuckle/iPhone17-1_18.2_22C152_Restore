@interface OS_os_eventlink
- (OS_os_eventlink)init;
- (void)dealloc;
@end

@implementation OS_os_eventlink

- (OS_os_eventlink)init
{
  qword_1E91199C0 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)dealloc
{
  _os_eventlink_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_os_eventlink;
  [(OS_os_eventlink *)&v3 dealloc];
}

@end