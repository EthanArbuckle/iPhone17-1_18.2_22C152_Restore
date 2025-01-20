@interface OS_view
- (void)dealloc;
@end

@implementation OS_view

- (void)dealloc
{
  sub_10000B44C((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_view;
  [(OS_view *)&v3 dealloc];
}

@end