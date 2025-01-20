@interface OS_resource
- (void)dealloc;
@end

@implementation OS_resource

- (void)dealloc
{
  sub_1000291F0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_resource;
  [(OS_resource *)&v3 dealloc];
}

@end