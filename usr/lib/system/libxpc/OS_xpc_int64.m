@interface OS_xpc_int64
- (BOOL)allowsWeakReference;
- (BOOL)retainWeakReference;
- (OS_xpc_int64)retain;
- (unint64_t)retainCount;
- (void)release;
@end

@implementation OS_xpc_int64

- (OS_xpc_int64)retain
{
  if (((unint64_t)self & 0x8000000000000000) == 0) {
    return (OS_xpc_int64 *)MEMORY[0x270EDCAE0]();
  }
  return self;
}

- (void)release
{
  if (((unint64_t)self & 0x8000000000000000) == 0) {
    MEMORY[0x270EDCAD8]();
  }
}

- (BOOL)retainWeakReference
{
  if (((unint64_t)self & 0x8000000000000000) != 0) {
    return 1;
  }
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  v5.receiver = self;
  v5.super_class = (Class)OS_xpc_int64;
  return [(OS_object *)&v5 retainWeakReference];
}

- (BOOL)allowsWeakReference
{
  if (((unint64_t)self & 0x8000000000000000) != 0) {
    return 1;
  }
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  v5.receiver = self;
  v5.super_class = (Class)OS_xpc_int64;
  return [(OS_object *)&v5 allowsWeakReference];
}

- (unint64_t)retainCount
{
  if (((unint64_t)self & 0x8000000000000000) != 0) {
    return -1;
  }
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  v5.receiver = self;
  v5.super_class = (Class)OS_xpc_int64;
  return [(OS_object *)&v5 retainCount];
}

@end