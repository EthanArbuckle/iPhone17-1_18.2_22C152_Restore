@interface OS_dispatch_object
- (OS_dispatch_object)init;
- (id)debugDescription;
@end

@implementation OS_dispatch_object

- (OS_dispatch_object)init
{
  qword_6D1C0 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (id)debugDescription
{
  id result = objc_lookUpClass("NSString");
  if (result)
  {
    id v4 = result;
    v5 = (void (*)(OS_dispatch_object *, unsigned char *, uint64_t))*((void *)self->super.super.isa + 7);
    if (v5)
    {
      v5(self, v6, 2048);
    }
    else
    {
      object_getClassName(self);
      __strlcpy_chk();
    }
    id result = [v4 stringWithUTF8String:"<%s: %s>"];
    if (result) {
      return [v4 stringWithFormat:result, object_getClassName(self), v6];
    }
  }
  return result;
}

@end