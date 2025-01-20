@interface TMLWeakReferenceObject
+ (id)weakReferenceWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (TMLWeakReferenceObject)initWithObject:(id)a3;
- (id)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)object;
- (unint64_t)hash;
@end

@implementation TMLWeakReferenceObject

- (TMLWeakReferenceObject)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TMLWeakReferenceObject;
  v5 = [(TMLWeakReferenceObject *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_object, v4);
  }

  return v6;
}

+ (id)weakReferenceWithObject:(id)a3
{
  id v3 = a3;
  id v4 = [TMLWeakReferenceObject alloc];
  v7 = objc_msgSend_initWithObject_(v4, v5, v6, v3);

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  unint64_t v5 = objc_msgSend_hash(WeakRetained, v3, v4);

  return v5;
}

- (id)description
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  unint64_t v5 = objc_msgSend_description(WeakRetained, v3, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  if (objc_msgSend_isEqual_(WeakRetained, v6, v7, v4))
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = objc_msgSend_object(v4, v9, v10);
      char isEqual = objc_msgSend_isEqual_(WeakRetained, v12, v13, v11);
    }
    else
    {
      char isEqual = 0;
    }
  }

  return isEqual;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end