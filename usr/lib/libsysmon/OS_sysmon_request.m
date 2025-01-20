@interface OS_sysmon_request
- (void)dealloc;
@end

@implementation OS_sysmon_request

- (void)dealloc
{
  Class isa = self[5].super.super.super.isa;
  if (isa) {
    xpc_release(isa);
  }
  dispatch_release((dispatch_object_t)self[2].super.super.super.isa);
  Class v4 = self[6].super.super.super.isa;
  if (v4) {
    xpc_release(v4);
  }
  Class v5 = self[7].super.super.super.isa;
  if (v5) {
    xpc_release(v5);
  }
  Class v6 = self[3].super.super.super.isa;
  if (v6) {
    _Block_release(v6);
  }
  Class v7 = self[4].super.super.super.isa;
  if (v7) {
    _Block_release(v7);
  }
  free(self[10].super.super.super.isa);
  v8.receiver = self;
  v8.super_class = (Class)OS_sysmon_request;
  [(OS_sysmon_request *)&v8 dealloc];
}

@end