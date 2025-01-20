@interface OS_voucher
- (OS_voucher)init;
- (OS_voucher)retain;
- (id)debugDescription;
- (void)dealloc;
- (void)release;
- (void)retain;
@end

@implementation OS_voucher

- (OS_voucher)init
{
  qword_6D1C0 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (OS_voucher)retain
{
  if ((int)atomic_fetch_add_explicit((atomic_uint *volatile)&self[1].super.super.isa + 1, 1u, memory_order_relaxed) <= 0) {
    -[OS_voucher retain]();
  }
  return self;
}

- (void)release
{
  qword_6D1C0 = (uint64_t)"API MISUSE: Voucher over-release";
  __break(1u);
}

- (void)dealloc
{
  _voucher_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_voucher;
  [(OS_voucher *)&v3 dealloc];
}

- (id)debugDescription
{
  id result = objc_lookUpClass("NSString");
  if (result)
  {
    id v4 = result;
    _voucher_debug((uint64_t)self, __str, 0x800uLL);
    id result = [v4 stringWithUTF8String:"<%s: %s>"];
    if (result) {
      return [v4 stringWithFormat:result, object_getClassName(self), __str];
    }
  }
  return result;
}

- (void)retain
{
  qword_6D1C0 = (uint64_t)"API MISUSE: Voucher resurrection";
  __break(1u);
}

@end