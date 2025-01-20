@interface OS_os_workgroup
- (OS_os_workgroup)init;
- (id)debugDescription;
- (void)_xref_dispose;
- (void)dealloc;
@end

@implementation OS_os_workgroup

- (OS_os_workgroup)init
{
  qword_1E91199C0 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  _os_workgroup_xref_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_os_workgroup;
  [(OS_object *)&v3 _xref_dispose];
}

- (void)dealloc
{
  _os_workgroup_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_os_workgroup;
  [(OS_os_workgroup *)&v3 dealloc];
}

- (id)debugDescription
{
  uint64_t v6 = *MEMORY[0x1E4F14BF8];
  id result = objc_lookUpClass("NSString");
  if (result)
  {
    id v4 = result;
    _os_workgroup_debug((uint64_t)self, __str, 0x800uLL);
    return (id)[v4 stringWithUTF8String:__str];
  }
  return result;
}

@end