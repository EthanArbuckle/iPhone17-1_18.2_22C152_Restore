@interface RCWeakRef
+ (id)weakRefWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)object;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation RCWeakRef

- (void)dealloc
{
  objc_storeWeak(&self->_weakStorage, 0);
  v3.receiver = self;
  v3.super_class = (Class)RCWeakRef;
  [(RCWeakRef *)&v3 dealloc];
}

- (unint64_t)hash
{
  return (unint64_t)self->_weakPointer;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0 && (id)*((void *)a3 + 2) == self->_weakPointer;
}

+ (id)weakRefWithObject:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  if ([a3 allowsWeakReference])
  {
    *((unsigned char *)v4 + 24) = 1;
    objc_storeWeak((id *)v4 + 1, a3);
  }
  *((void *)v4 + 2) = a3;
  return v4;
}

- (id)object
{
  if (self->_useWeakStorage) {
    return objc_loadWeak(&self->_weakStorage);
  }
  else {
    return self->_weakPointer;
  }
}

@end