@interface __SwiftNativeNSArrayBase
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)new;
- (BOOL)_tryRetain;
- (BOOL)allowsWeakReference;
- (BOOL)retainWeakReference;
- (__SwiftNativeNSArrayBase)autorelease;
- (__SwiftNativeNSArrayBase)initWithCoder:(id)a3;
- (__SwiftNativeNSArrayBase)retain;
- (void)_noteAssociatedObjects;
- (void)_setWeaklyReferenced;
@end

@implementation __SwiftNativeNSArrayBase

- (__SwiftNativeNSArrayBase)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)__SwiftNativeNSArrayBase;
  return [(__SwiftNativeNSArrayBase *)&v4 init];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (__SwiftNativeNSArrayBase)retain
{
  return self;
}

- (__SwiftNativeNSArrayBase)autorelease
{
  return (__SwiftNativeNSArrayBase *)MEMORY[0x1F4181450](self, a2);
}

- (BOOL)_tryRetain
{
  return swift_tryRetain((uint64_t)self, (uint64_t)a2, v2, v3) != 0;
}

- (BOOL)allowsWeakReference
{
  return swift_isDeallocating((uint64_t)self) ^ 1;
}

- (BOOL)retainWeakReference
{
  return swift_tryRetain((uint64_t)self, (uint64_t)a2, v2, v3) != 0;
}

- (void)_setWeaklyReferenced
{
  Class isa = self[1].super.isa;
  if (((unint64_t)isa & 0x8000000000000001) == 1)
  {
    Class v3 = self[1].super.isa;
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&self[1], (unint64_t *)&v3, (unint64_t)isa & 0xFFFFFFFFFFFFFFFELL, memory_order_relaxed, memory_order_relaxed);
    if (v3 != isa)
    {
      objc_super v4 = v3;
      do
      {
        atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&self[1], (unint64_t *)&v4, (unint64_t)v3 & 0xFFFFFFFFFFFFFFFELL, memory_order_relaxed, memory_order_relaxed);
        BOOL v5 = v4 == v3;
        Class v3 = v4;
      }
      while (!v5);
    }
  }
}

- (void)_noteAssociatedObjects
{
  Class isa = self[1].super.isa;
  if (((unint64_t)isa & 0x8000000000000001) == 1)
  {
    Class v3 = self[1].super.isa;
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&self[1], (unint64_t *)&v3, (unint64_t)isa & 0xFFFFFFFFFFFFFFFELL, memory_order_relaxed, memory_order_relaxed);
    if (v3 != isa)
    {
      objc_super v4 = v3;
      do
      {
        atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&self[1], (unint64_t *)&v4, (unint64_t)v3 & 0xFFFFFFFFFFFFFFFELL, memory_order_relaxed, memory_order_relaxed);
        BOOL v5 = v4 == v3;
        Class v3 = v4;
      }
      while (!v5);
    }
  }
}

+ (id)new
{
  Class v2 = objc_lookUpClass("NSArray");

  return (id)MEMORY[0x1F41817C0](v2);
}

@end