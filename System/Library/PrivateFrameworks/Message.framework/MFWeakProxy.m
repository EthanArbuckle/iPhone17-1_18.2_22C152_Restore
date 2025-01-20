@interface MFWeakProxy
+ (id)weakProxyForObject:(id)a3;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProxy;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)class;
- (Class)superclass;
- (MFWeakProxy)initWithObject:(id)a3;
- (MFWeakProxy)self;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)doesNotRecognizeSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation MFWeakProxy

+ (id)weakProxyForObject:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithObject:a3];
  return v3;
}

- (MFWeakProxy)initWithObject:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&initWithObject__lock);
  v5 = (MFWeakProxy *)objc_getAssociatedObject(a3, (const void *)sWeakProxyContext);
  if (v5)
  {
    v6 = v5;

    self = v6;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F73598] weakReferenceWithObject:a3];
    if (v8)
    {
      if (self)
      {
        v9 = (void *)v8;
        self->_objectClass = (Class)objc_opt_class();
        self->_hash = [a3 hash];
        self->_weakRef = (MFWeakReferenceHolder *)v9;
        objc_setAssociatedObject(a3, (const void *)sWeakProxyContext, self, (void *)1);
      }
    }
    else
    {

      self = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&initWithObject__lock);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFWeakProxy;
  [(MFWeakProxy *)&v3 dealloc];
}

- (MFWeakProxy)self
{
  result = (MFWeakProxy *)[(MFWeakReferenceHolder *)self->_weakRef reference];
  if (!result) {
    return self;
  }
  return result;
}

- (Class)superclass
{
  return class_getSuperclass(self->_objectClass);
}

- (Class)class
{
  return self->_objectClass;
}

- (BOOL)isProxy
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  Class = object_getClass(self);
  if (Class == object_getClass(a3))
  {
    uint64_t v8 = (MFWeakReferenceHolder *)*((void *)a3 + 2);
    weakRef = self->_weakRef;
    if (weakRef == v8) {
      return 1;
    }
    v10 = (void *)[(MFWeakReferenceHolder *)weakRef reference];
    uint64_t v11 = [(MFWeakReferenceHolder *)v8 reference];
    BOOL v12 = !v10 || v11 == 0;
    if (!v12 && ([v10 isEqual:v11] & 1) != 0) {
      return 1;
    }
  }
  v6 = (void *)[(MFWeakReferenceHolder *)self->_weakRef reference];
  return [v6 isEqual:a3];
}

- (unint64_t)hash
{
  return self->_hash;
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
}

- (id)descriptionWithLocale:(id)a3
{
  uint64_t v4 = objc_msgSend((id)-[MFWeakReferenceHolder reference](self->_weakRef, "reference", a3), "description");
  if (!v4) {
    return (id)[NSString stringWithFormat:@"<%@(%@): %p> zeroed reference", object_getClass(self), self->_objectClass, self];
  }
  return (id)[@"(weak proxy) " stringByAppendingString:v4];
}

- (id)description
{
  return [(MFWeakProxy *)self descriptionWithLocale:0];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_isEqual(a3, sel_respondsToSelector_)
    || sel_isEqual(a3, sel_conformsToProtocol_)
    || sel_isEqual(a3, sel_descriptionWithLocale_)
    || sel_isEqual(a3, sel_description))
  {
    char v5 = 1;
    return v5 & 1;
  }
  if ([(MFWeakReferenceHolder *)self->_weakRef reference])
  {
    char v5 = objc_opt_respondsToSelector();
    return v5 & 1;
  }
  Class objectClass = self->_objectClass;
  return [(objc_class *)objectClass instancesRespondToSelector:a3];
}

- (BOOL)conformsToProtocol:(id)a3
{
  Class objectClass = (Class)[(MFWeakReferenceHolder *)self->_weakRef reference];
  if (!objectClass) {
    Class objectClass = self->_objectClass;
  }
  return [(objc_class *)objectClass conformsToProtocol:a3];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return (id)[(MFWeakReferenceHolder *)self->_weakRef reference];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(objc_class *)self->_objectClass instanceMethodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  size_t v4 = objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "methodReturnLength");
  if (v4)
  {
    size_t v5 = v4;
    v6 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    memset(v6, 170, v4);
    bzero(v6, v5);
    [a3 setReturnValue:v6];
  }
}

@end