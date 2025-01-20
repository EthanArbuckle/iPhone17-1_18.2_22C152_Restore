@interface NSObject
+ (BOOL)_isDeallocating;
+ (BOOL)_tryRetain;
+ (BOOL)allowsWeakReference;
+ (BOOL)conformsToProtocol:(Protocol *)protocol;
+ (BOOL)instancesRespondToSelector:(SEL)aSelector;
+ (BOOL)isAncestorOfObject:(id)a3;
+ (BOOL)isEqual:(id)a3;
+ (BOOL)isFault;
+ (BOOL)isKindOfClass:(Class)a3;
+ (BOOL)isMemberOfClass:(Class)a3;
+ (BOOL)isProxy;
+ (BOOL)isSubclassOfClass:(Class)aClass;
+ (BOOL)resolveClassMethod:(SEL)sel;
+ (BOOL)resolveInstanceMethod:(SEL)sel;
+ (BOOL)respondsToSelector:(SEL)a3;
+ (BOOL)retainWeakReference;
+ (Class)superclass;
+ (IMP)instanceMethodForSelector:(SEL)aSelector;
+ (NSMethodSignature)instanceMethodSignatureForSelector:(SEL)aSelector;
+ (NSObject)new;
+ (NSString)debugDescription;
+ (NSString)description;
+ (_NSZone)zone;
+ (id)forwardingTargetForSelector:(SEL)a3;
+ (id)methodSignatureForSelector:(SEL)a3;
+ (id)performSelector:(SEL)a3;
+ (id)performSelector:(SEL)a3 withObject:(id)a4;
+ (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
+ (unint64_t)retainCount;
+ (void)doesNotRecognizeSelector:(SEL)a3;
+ (void)forwardInvocation:(id)a3;
+ (void)methodForSelector:(SEL)a3;
- (BOOL)_isDeallocating;
- (BOOL)allowsWeakReference;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFault;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isProxy;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)retainWeakReference;
- (Class)superclass;
- (IMP)methodForSelector:(SEL)aSelector;
- (NSMethodSignature)methodSignatureForSelector:(SEL)aSelector;
- (NSString)debugDescription;
- (NSString)description;
- (_NSZone)zone;
- (id)copy;
- (id)forwardingTargetForSelector:(SEL)aSelector;
- (id)mutableCopy;
- (id)performSelector:(SEL)a3;
- (id)performSelector:(SEL)a3 withObject:(id)a4;
- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (void)doesNotRecognizeSelector:(SEL)aSelector;
- (void)forwardInvocation:(NSInvocation *)anInvocation;
@end

@implementation NSObject

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (_NSZone)zone
{
  return 0;
}

+ (NSObject)new
{
  if ((*(_WORD *)((*(void *)a1 & 0xFFFFFFFF8) + 0x1E) & 0x4000) != 0) {
    v2 = _objc_rootAllocWithZone((uint64_t)a1);
  }
  else {
    v2 = (void (*)(void))[a1 alloc];
  }

  return [v2 init];
}

- (BOOL)isProxy
{
  return 0;
}

- (id)copy
{
  return [self copyWithZone:0];
}

- (BOOL)isKindOfClass:(Class)a3
{
  Class v4 = [self class];
  BOOL v5 = v4 != 0;
  if (v4 != a3 && v4 != 0)
  {
    while (1)
    {
      v7 = (objc_class *)*((void *)v4 + 1);
      if (!v7) {
        break;
      }
      Class v4 = (Class)*((void *)v4 + 1);
      BOOL v5 = v7 != 0;
      if (v7 == a3 || v7 == 0) {
        return v5;
      }
    }
    return 0;
  }
  return v5;
}

- (IMP)methodForSelector:(SEL)aSelector
{
  v3 = self;
  if (aSelector)
  {
    Class v4 = (objc_selector *)aSelector;
  }
  else
  {
    -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_);
    self = v3;
    Class v4 = 0;
  }

  return (IMP)object_getMethodImplementation((unint64_t)self, v4);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
  return 0;
}

- (BOOL)retainWeakReference
{
  return [self _tryRetain];
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
  return 0;
}

- (BOOL)allowsWeakReference
{
  return ![self _isDeallocating];
}

- (BOOL)_isDeallocating
{
  if (((unint64_t)self & 0x8000000000000000) != 0) {
    return 0;
  }
  if ((uint64_t)self->isa) {
    return (unint64_t)self->isa >> 55 == 0;
  }
  return objc_object::sidetable_isDeallocating((objc_object *)self);
}

- (id)mutableCopy
{
  return [self mutableCopyWithZone:0];
}

+ (BOOL)isProxy
{
  return 0;
}

+ (BOOL)isSubclassOfClass:(Class)aClass
{
  BOOL v3 = a1 != 0;
  if (a1 != aClass && a1)
  {
    while (1)
    {
      Class v4 = (objc_class *)*((void *)a1 + 1);
      if (!v4) {
        break;
      }
      a1 = (id)*((void *)a1 + 1);
      BOOL v3 = v4 != 0;
      if (v4 == aClass || v4 == 0) {
        return v3;
      }
    }
    return 0;
  }
  return v3;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v5 = [self class];

  return class_respondsToSelector_inst((objc_object *)self, (objc_selector *)a3, v5);
}

- (BOOL)conformsToProtocol:(id)a3
{
  if (a3)
  {
    Class v4 = [self class];
    if (v4)
    {
      for (i = v4; ; i = (objc_class *)*((void *)i + 1))
      {
        LOBYTE(v4) = class_conformsToProtocol(i, (Protocol *)a3);
        if ((v4 & 1) != 0 || !*((void *)i + 1)) {
          break;
        }
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return [self class] == a3;
}

+ (IMP)instanceMethodForSelector:(SEL)aSelector
{
  if (aSelector)
  {
    return class_getMethodImplementation((Class)a1, aSelector);
  }
  else
  {
    [a1 doesNotRecognizeSelector:v3];
    return 0;
  }
}

+ (BOOL)isEqual:(id)a3
{
  return a3 == a1;
}

+ (BOOL)instancesRespondToSelector:(SEL)aSelector
{
  return class_respondsToSelector_inst(0, (objc_selector *)aSelector, a1);
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

+ (BOOL)conformsToProtocol:(Protocol *)protocol
{
  BOOL result = 0;
  if (protocol && a1)
  {
    while (1)
    {
      BOOL result = class_conformsToProtocol((Class)a1, protocol);
      if (result || !*((void *)a1 + 1)) {
        break;
      }
      a1 = (id)*((void *)a1 + 1);
    }
  }
  return result;
}

+ (BOOL)respondsToSelector:(SEL)a3
{
  return class_respondsToSelector_inst((objc_object *)a1, (objc_selector *)a3, (void *)(*(void *)a1 & 0xFFFFFFFF8));
}

+ (void)methodForSelector:(SEL)a3
{
  id v3 = a1;
  if (a3)
  {
    uint64_t v4 = (objc_selector *)a3;
  }
  else
  {
    [a1 doesNotRecognizeSelector:sel_doesNotRecognizeSelector_];
    a1 = v3;
    uint64_t v4 = 0;
  }

  return (void *)object_getMethodImplementation((unint64_t)a1, v4);
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
  return 0;
}

- (NSString)debugDescription
{
  return [self description];
}

- (id)performSelector:(SEL)a3
{
  if (!a3) {
    -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_);
  }

  return [self a3];
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (!a3) {
    -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_);
  }

  return [self a3:a4];
}

+ (BOOL)isMemberOfClass:(Class)a3
{
  return (*(void *)a1 & 0xFFFFFFFF8) == (void)a3;
}

- (BOOL)isFault
{
  return 0;
}

+ (BOOL)isKindOfClass:(Class)a3
{
  id v3 = (void *)(*(void *)a1 & 0xFFFFFFFF8);
  BOOL result = v3 != 0;
  if (v3 != (void *)a3 && v3 != 0)
  {
    while (1)
    {
      v6 = (objc_class *)v3[1];
      if (!v6) {
        break;
      }
      id v3 = (void *)v3[1];
      BOOL result = v6 != 0;
      if (v6 == a3 || v6 == 0) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

+ (id)performSelector:(SEL)a3
{
  if (!a3) {
    [a1 doesNotRecognizeSelector:sel_doesNotRecognizeSelector_];
  }

  return [a1 a3];
}

- (Class)superclass
{
  v2 = (objc_class *)*((void *)[self class] + 1);
  if (v2) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (!a3) {
    [a1 doesNotRecognizeSelector:sel_doesNotRecognizeSelector_];
  }

  return [a1 a3:a4];
}

+ (_NSZone)zone
{
  return 0;
}

+ (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)retainWeakReference
{
  return 1;
}

+ (BOOL)allowsWeakReference
{
  return 1;
}

+ (BOOL)_isDeallocating
{
  return 0;
}

+ (BOOL)_tryRetain
{
  return 1;
}

+ (NSString)debugDescription
{
  return (NSString *)[a1 sel_description];
}

+ (NSString)description
{
  return 0;
}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  return 0;
}

+ (void)forwardInvocation:(id)a3
{
  if (a3) {
    a3 = [a3 sel_selector];
  }

  [a1 doesNotRecognizeSelector:a3];
}

+ (id)methodSignatureForSelector:(SEL)a3
{
  _objc_fatal("+[NSObject methodSignatureForSelector:] not available without CoreFoundation", (uint64_t)a2, a3, v3);
}

+ (NSMethodSignature)instanceMethodSignatureForSelector:(SEL)aSelector
{
  _objc_fatal("+[NSObject instanceMethodSignatureForSelector:] not available without CoreFoundation", (uint64_t)a2, aSelector, v3);
}

+ (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (!a3) {
    [a1 doesNotRecognizeSelector:sel_doesNotRecognizeSelector_];
  }

  return [a1 a3:a4 a5:a5];
}

+ (void)doesNotRecognizeSelector:(SEL)a3
{
  Name = class_getName((Class)a1);
  SEL v9 = "<null selector>";
  if (a3) {
    SEL v9 = a3;
  }
  _objc_fatal("+[%s %s]: unrecognized selector sent to instance %p", v6, v7, v8, Name, v9, a1);
}

+ (BOOL)isFault
{
  return 0;
}

+ (BOOL)isAncestorOfObject:(id)a3
{
  uint64_t v4 = [a3 sel_class];
  BOOL v5 = v4 != 0;
  if (v4 != a1 && v4 != 0)
  {
    while (1)
    {
      id v7 = (id)v4[1];
      if (!v7) {
        break;
      }
      uint64_t v4 = (void *)v4[1];
      BOOL v5 = v7 != 0;
      if (v7 == a1 || v7 == 0) {
        return v5;
      }
    }
    return 0;
  }
  return v5;
}

- (NSString)description
{
  return 0;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
  if (anInvocation) {
    anInvocation = [(NSInvocation *)anInvocation selector];
  }

  [self doesNotRecognizeSelector:anInvocation];
}

- (NSMethodSignature)methodSignatureForSelector:(SEL)aSelector
{
  _objc_fatal("-[NSObject methodSignatureForSelector:] not available without CoreFoundation", (uint64_t)a2, aSelector, v3);
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (!a3) {
    -[NSObject doesNotRecognizeSelector:](self, sel_doesNotRecognizeSelector_);
  }

  return [self a3:a4:a5];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
  ClassName = object_getClassName(self);
  SEL v9 = "<null selector>";
  if (aSelector) {
    SEL v9 = aSelector;
  }
  _objc_fatal("-[%s %s]: unrecognized selector sent to instance %p", v6, v7, v8, ClassName, v9, self);
}

@end