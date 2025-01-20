@interface _SwiftObject
+ (BOOL)_isDeallocating;
+ (BOOL)_tryRetain;
+ (BOOL)allowsWeakReference;
+ (BOOL)conformsToProtocol:(id)a3;
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)isMemberOfClass:(Class)a3;
+ (BOOL)isSubclassOfClass:(Class)a3;
+ (BOOL)respondsToSelector:(SEL)a3;
+ (BOOL)retainWeakReference;
+ (Class)superclass;
+ (_TtCs12_SwiftObject)alloc;
+ (_TtCs12_SwiftObject)allocWithZone:(_NSZone *)a3;
+ (id)debugDescription;
+ (id)description;
+ (unint64_t)retainCount;
+ (void)instanceMethodForSelector:(SEL)a3;
+ (void)methodForSelector:(SEL)a3;
- (BOOL)_tryRetain;
- (BOOL)allowsWeakReference;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isNSArray__;
- (BOOL)isNSCFConstantString__;
- (BOOL)isNSData__;
- (BOOL)isNSDate__;
- (BOOL)isNSDictionary__;
- (BOOL)isNSNumber__;
- (BOOL)isNSObject__;
- (BOOL)isNSOrderedSet__;
- (BOOL)isNSSet__;
- (BOOL)isNSString__;
- (BOOL)isNSTimeZone__;
- (BOOL)isNSValue__;
- (BOOL)isProxy;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)retainWeakReference;
- (Class)class;
- (Class)superclass;
- (NSString)debugDescription;
- (NSString)description;
- (_NSZone)zone;
- (_TtCs12_SwiftObject)autorelease;
- (_TtCs12_SwiftObject)retain;
- (id)_copyDescription;
- (id)performSelector:(SEL)a3;
- (id)performSelector:(SEL)a3 withObject:(id)a4;
- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (unint64_t)_cfTypeID;
- (unint64_t)hash;
- (void)_noteAssociatedObjects;
- (void)_setWeaklyReferenced;
- (void)doesNotRecognizeSelector:(SEL)a3;
- (void)methodForSelector:(SEL)a3;
@end

@implementation _SwiftObject

+ (_TtCs12_SwiftObject)allocWithZone:(_NSZone *)a3
{
  size_t InstanceSize = class_getInstanceSize((Class)a1);

  return (_TtCs12_SwiftObject *)swift_allocObject((unint64_t *)a1, InstanceSize, 0xFuLL);
}

+ (_TtCs12_SwiftObject)alloc
{
  size_t InstanceSize = class_getInstanceSize((Class)a1);

  return (_TtCs12_SwiftObject *)swift_allocObject((unint64_t *)a1, InstanceSize, 0xFuLL);
}

- (Class)class
{
  return (Class)((uint64_t)self->isa & 0x7FFFFFFFFFFFF8);
}

+ (Class)superclass
{
  if (*((void *)a1 + 1)) {
    return (Class)*((void *)a1 + 1);
  }
  else {
    return 0;
  }
}

- (Class)superclass
{
  if (*(void *)(((uint64_t)self->isa & 0x7FFFFFFFFFFFF8) + 8)) {
    return *(Class *)(((uint64_t)self->isa & 0x7FFFFFFFFFFFF8) + 8);
  }
  else {
    return 0;
  }
}

+ (BOOL)isMemberOfClass:(Class)a3
{
  return (*(void *)a1 & 0x7FFFFFFFFFFFF8) == (void)a3;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return ((uint64_t)self->isa & 0x7FFFFFFFFFFFF8) == (void)a3;
}

- (BOOL)isProxy
{
  return 0;
}

- (_NSZone)zone
{
  result = (_NSZone *)malloc_zone_from_ptr(self);
  if (!result)
  {
    return (_NSZone *)malloc_default_zone();
  }
  return result;
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  v4 = (objc_class *)((uint64_t)self->isa & 0x7FFFFFFFFFFFF8);
  BOOL isMetaClass = class_isMetaClass(v4);
  Name = class_getName(v4);
  v10 = sel_getName(a3);
  uint64_t v8 = 45;
  if (isMetaClass) {
    uint64_t v8 = 43;
  }
  swift::fatalError(0, "Unrecognized selector %c[%s %s]\n", v6, v7, v8, Name, v10);
}

- (_TtCs12_SwiftObject)retain
{
  return self;
}

- (_TtCs12_SwiftObject)autorelease
{
  return (_TtCs12_SwiftObject *)MEMORY[0x1F4181450](self, a2);
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
  Class isa = self[1].isa;
  if (((unint64_t)isa & 0x8000000000000001) == 1)
  {
    Class v3 = self[1].isa;
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&self[1], (unint64_t *)&v3, (unint64_t)isa & 0xFFFFFFFFFFFFFFFELL, memory_order_relaxed, memory_order_relaxed);
    if (v3 != isa)
    {
      v4 = v3;
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
  Class isa = self[1].isa;
  if (((unint64_t)isa & 0x8000000000000001) == 1)
  {
    Class v3 = self[1].isa;
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&self[1], (unint64_t *)&v3, (unint64_t)isa & 0xFFFFFFFFFFFFFFFELL, memory_order_relaxed, memory_order_relaxed);
    if (v3 != isa)
    {
      v4 = v3;
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

+ (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)_isDeallocating
{
  return 0;
}

+ (BOOL)_tryRetain
{
  return 1;
}

+ (BOOL)allowsWeakReference
{
  return 1;
}

+ (BOOL)retainWeakReference
{
  return 1;
}

- (BOOL)isKindOfClass:(Class)a3
{
  Class v3 = (objc_class *)((uint64_t)self->isa & 0x7FFFFFFFFFFFF8);
  BOOL result = v3 != 0;
  if (v3 != a3 && v3 != 0)
  {
    v6 = v3;
    while (1)
    {
      v7 = (objc_class *)*((void *)v6 + 1);
      if (!v7) {
        break;
      }
      v6 = (objc_class *)*((void *)v6 + 1);
      BOOL result = v7 != 0;
      if (v7 == a3 || v7 == 0) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

+ (BOOL)isSubclassOfClass:(Class)a3
{
  BOOL v3 = a1 != 0;
  if (a1 == a3 || !a1) {
    return v3;
  }
  while (1)
  {
    v4 = (objc_class *)*((void *)a1 + 1);
    if (!v4) {
      break;
    }
    a1 = (id)*((void *)a1 + 1);
    BOOL v3 = v4 != 0;
    if (v4 == a3 || v4 == 0) {
      return v3;
    }
  }
  return 0;
}

+ (BOOL)respondsToSelector:(SEL)a3
{
  return a3 && class_respondsToSelector((Class)(*(void *)a1 & 0x7FFFFFFFFFFFF8), a3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return a3 && class_respondsToSelector((Class)((uint64_t)self->isa & 0x7FFFFFFFFFFFF8), a3);
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  return a3 && class_respondsToSelector((Class)a1, a3);
}

+ (void)methodForSelector:(SEL)a3
{
  Class = object_getClass(a1);

  return class_getMethodImplementation(Class, a3);
}

- (void)methodForSelector:(SEL)a3
{
  Class = object_getClass(self);

  return class_getMethodImplementation(Class, a3);
}

+ (void)instanceMethodForSelector:(SEL)a3
{
  return class_getMethodImplementation((Class)a1, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  if (!a3 || ((uint64_t)self->isa & 0x7FFFFFFFFFFFF8) == 0) {
    return 0;
  }
  Superclass = (objc_class *)((uint64_t)self->isa & 0x7FFFFFFFFFFFF8);
  do
  {
    BOOL v5 = class_conformsToProtocol(Superclass, (Protocol *)a3);
    if (v5) {
      break;
    }
    Superclass = class_getSuperclass(Superclass);
  }
  while (Superclass);
  return v5;
}

+ (BOOL)conformsToProtocol:(id)a3
{
  BOOL v3 = 0;
  if (a3)
  {
    Superclass = (objc_class *)a1;
    if (a1)
    {
      do
      {
        BOOL v3 = class_conformsToProtocol(Superclass, (Protocol *)a3);
        if (v3) {
          break;
        }
        Superclass = class_getSuperclass(Superclass);
      }
      while (Superclass);
    }
  }
  return v3;
}

- (unint64_t)hash
{
  v2 = self;
  v12 = self;
  if (!swift::runtime::bincompat::useLegacySwiftObjCHashing((swift::runtime::bincompat *)self))
  {
    uint64_t v3 = (uint64_t)v2->isa & 0x7FFFFFFFFFFFF8;
    uint64_t v4 = swift_conformsToProtocolCommon(v3, (uint64_t)&protocol descriptor for Hashable);
    if (v4)
    {
      return _swift_stdlib_Hashable_hashValue_indirect((uint64_t)&v12, v3, v4);
    }
    else if (swift_conformsToProtocolCommon(v3, (uint64_t)&protocol descriptor for Equatable))
    {
      uint64_t v11 = objc_opt_class();
      os_unfair_lock_lock((os_unfair_lock_t)&-[_TtCs12_SwiftObject hash]::warnedLock);
      if (qword_1E8ECFB30 != -1) {
        dispatch_once_f(&qword_1E8ECFB30, &-[_TtCs12_SwiftObject hash]::warned, (dispatch_function_t)swift::Lazy<std::unordered_set<objc_class *>>::defaultInitCallback);
      }
      std::__hash_table<objc_class *,std::hash<objc_class *>,std::equal_to<objc_class *>,std::allocator<objc_class *>>::__emplace_unique_key_args<objc_class *,objc_class * const&>((uint64_t)&-[_TtCs12_SwiftObject hash]::warned, &v11, &v11);
      if (v5)
      {
        v6 = (objc_class *)objc_opt_class();
        Name = class_getName(v6);
          "ead to severe performance problems.\n",
          v8,
          v9,
          Name);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&-[_TtCs12_SwiftObject hash]::warnedLock);
      return 1;
    }
  }
  return (unint64_t)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v11 = a3;
  v12 = self;
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    if (swift::runtime::bincompat::useLegacySwiftObjCHashing((swift::runtime::bincompat *)self)) {
      goto LABEL_10;
    }
    uint64_t v5 = (uint64_t)self->isa & 0x7FFFFFFFFFFFF8;
    uint64_t v6 = swift_conformsToProtocolCommon(v5, (uint64_t)&protocol descriptor for Equatable);
    if (v6)
    {
      uint64_t v7 = v6;
      if (*(void *)v6) {
        uint64_t v8 = *(void *)v6;
      }
      else {
        uint64_t v8 = 0;
      }
      ConformingSuperclass = (uint64_t *)swift::findConformingSuperclass(v5, v8);
      if (_swift_class_isSubclass(*(void *)a3 & 0x7FFFFFFFFFFFF8, ConformingSuperclass))
      {
        LOBYTE(v6) = _swift_stdlib_Equatable_isEqual_indirect((uint64_t)&v12, (uint64_t)&v11, (uint64_t)ConformingSuperclass, v7);
        return v6 & 1;
      }
LABEL_10:
      LOBYTE(v6) = 0;
    }
  }
  return v6 & 1;
}

- (id)performSelector:(SEL)a3
{
  return [self a3];
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  return [self a3:a4];
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  return [self a3:a4:a5];
}

- (NSString)description
{
  uint64_t v7 = self;
  swift_retain((atomic_ullong *)self);
  uint64_t v3 = (Class *)((uint64_t)self->isa & 0x7FFFFFFFFFFFF8);
  Description = (void *)swift_stdlib_getDescription((uint64_t)&v7, v3);
  if (*(v3 - 1)) {
    uint64_t v5 = (uint64_t)*(v3 - 1);
  }
  else {
    uint64_t v5 = 0;
  }
  (*(void (**)(_TtCs12_SwiftObject **, Class *))(v5 + 8))(&v7, v3);
  return (NSString *)Description;
}

- (NSString)debugDescription
{
  uint64_t v7 = self;
  swift_retain((atomic_ullong *)self);
  uint64_t v3 = (Class *)((uint64_t)self->isa & 0x7FFFFFFFFFFFF8);
  Description = (void *)swift_stdlib_getDescription((uint64_t)&v7, v3);
  if (*(v3 - 1)) {
    uint64_t v5 = (uint64_t)*(v3 - 1);
  }
  else {
    uint64_t v5 = 0;
  }
  (*(void (**)(_TtCs12_SwiftObject **, Class *))(v5 + 8))(&v7, v3);
  return (NSString *)Description;
}

+ (id)description
{
  Name = (uint8x16_t *)class_getName((Class)a1);
  size_t v3 = strlen(Name->i8);
  uint64_t v4 = (void *)swift_stdlib_NSStringFromUTF8(Name, v3);

  return v4;
}

+ (id)debugDescription
{
  Name = (uint8x16_t *)class_getName((Class)a1);
  size_t v3 = strlen(Name->i8);
  uint64_t v4 = (void *)swift_stdlib_NSStringFromUTF8(Name, v3);

  return v4;
}

- (id)_copyDescription
{
  v2 = [(_SwiftObject *)self description];

  return v2;
}

- (unint64_t)_cfTypeID
{
  return 1;
}

- (BOOL)isNSArray__
{
  return 0;
}

- (BOOL)isNSCFConstantString__
{
  return 0;
}

- (BOOL)isNSData__
{
  return 0;
}

- (BOOL)isNSDate__
{
  return 0;
}

- (BOOL)isNSDictionary__
{
  return 0;
}

- (BOOL)isNSObject__
{
  return 0;
}

- (BOOL)isNSOrderedSet__
{
  return 0;
}

- (BOOL)isNSNumber__
{
  return 0;
}

- (BOOL)isNSSet__
{
  return 0;
}

- (BOOL)isNSString__
{
  return 0;
}

- (BOOL)isNSTimeZone__
{
  return 0;
}

- (BOOL)isNSValue__
{
  return 0;
}

@end