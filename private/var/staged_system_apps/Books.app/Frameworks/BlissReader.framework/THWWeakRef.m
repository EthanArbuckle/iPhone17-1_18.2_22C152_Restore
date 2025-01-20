@interface THWWeakRef
+ (id)weakRefWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)object;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation THWWeakRef

- (void)dealloc
{
  objc_storeWeak(&self->_object, 0);
  v3.receiver = self;
  v3.super_class = (Class)THWWeakRef;
  [(THWWeakRef *)&v3 dealloc];
}

- (unint64_t)hash
{
  return self->_objectAddress;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0 && *((void *)a3 + 2) == self->_objectAddress;
}

+ (id)weakRefWithObject:(id)a3
{
  v4 = (id *)objc_alloc_init((Class)a1);
  objc_storeWeak(v4 + 1, a3);
  v4[2] = a3;

  return v4;
}

- (id)object
{
  return objc_loadWeak(&self->_object);
}

@end