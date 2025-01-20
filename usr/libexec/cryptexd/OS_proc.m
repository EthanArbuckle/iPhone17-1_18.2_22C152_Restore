@interface OS_proc
- (void)dealloc;
@end

@implementation OS_proc

- (void)dealloc
{
  sub_1000133B8((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_proc;
  [(OS_proc *)&v3 dealloc];
}

@end