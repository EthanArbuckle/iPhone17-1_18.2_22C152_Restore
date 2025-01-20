@interface PKXPCForwarder
- (PKXPCForwarder)init;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_initWithTarget:(uint64_t)a3 targetClass:;
- (void)forwardInvocation:(id)a3;
@end

@implementation PKXPCForwarder

- (void).cxx_destruct
{
}

- (void)_initWithTarget:(uint64_t)a3 targetClass:
{
  result = a2;
  v6 = result;
  if (!a1) {
    goto LABEL_5;
  }
  if (a3)
  {
    v8.receiver = a1;
    v8.super_class = (Class)PKXPCForwarder;
    id v7 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v7;
    if (v7)
    {
      *((_DWORD *)v7 + 2) = 0;
      objc_storeWeak((id *)v7 + 2, v6);
      a1[3] = a3;
    }
LABEL_5:

    return a1;
  }
  __break(1u);
  return result;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  os_unfair_lock_unlock(p_lock);
  return WeakRetained;
}

- (PKXPCForwarder)init
{
  return 0;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKXPCForwarder;
  v5 = -[PKXPCForwarder methodSignatureForSelector:](&v11, sel_methodSignatureForSelector_);
  if (!v5)
  {
    os_unfair_lock_lock(&self->_lock);
    id WeakRetained = objc_loadWeakRetained(&self->_target);
    os_unfair_lock_unlock(&self->_lock);
    if (WeakRetained)
    {
      uint64_t v7 = [WeakRetained methodSignatureForSelector:a3];
    }
    else
    {
      InstanceMethod = class_getInstanceMethod(self->_targetClass, a3);
      if (!InstanceMethod || (Description = method_getDescription(InstanceMethod)) == 0)
      {
        v5 = 0;
        goto LABEL_9;
      }
      uint64_t v7 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:Description->types];
    }
    v5 = (void *)v7;
LABEL_9:
  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  os_unfair_lock_unlock(&self->_lock);
  if (WeakRetained)
  {
    [v4 invokeWithTarget:WeakRetained];
  }
  else
  {
    v6 = PKLogFacilityTypeGetObject(4uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = NSStringFromClass(self->_targetClass);
      objc_super v8 = NSStringFromSelector((SEL)[v4 selector]);
      int v9 = 138543618;
      v10 = v7;
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKXPCForwarder: dropping -[%{public}@ %@].", (uint8_t *)&v9, 0x16u);
    }
    [v4 setTarget:0];
    [v4 invoke];
  }
}

@end