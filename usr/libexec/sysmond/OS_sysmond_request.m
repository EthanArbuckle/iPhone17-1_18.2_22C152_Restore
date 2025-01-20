@interface OS_sysmond_request
- (void)dealloc;
@end

@implementation OS_sysmond_request

- (void)dealloc
{
  Class isa = self[3].super.super.super.isa;
  if (isa) {
    xpc_release(isa);
  }
  v4.receiver = self;
  v4.super_class = (Class)OS_sysmond_request;
  [(OS_sysmond_request *)&v4 dealloc];
}

@end