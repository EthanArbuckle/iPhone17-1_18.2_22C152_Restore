@interface TMLJSONObserverInfo
- (BOOL)isEqual:(id)a3;
- (NSString)keyPath;
- (TMLJSONObserverInfo)initWithObserver:(id)a3 keyPath:(id)a4 callback:(id)a5;
- (id)callback;
- (id)target;
- (id)targetUnsafe;
- (unint64_t)hash;
- (void)notify:(id)a3;
@end

@implementation TMLJSONObserverInfo

- (TMLJSONObserverInfo)initWithObserver:(id)a3 keyPath:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TMLJSONObserverInfo;
  v11 = [(TMLJSONObserverInfo *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_keyPath, a4);
    v12->_targetUnsafe = v8;
    objc_storeWeak(&v12->_target, v8);
    uint64_t v13 = MEMORY[0x23ECA7DD0](v10);
    id callback = v12->_callback;
    v12->_id callback = (id)v13;

    v12->_hash = objc_msgSend_hash(v8, v15, v16);
  }

  return v12;
}

- (void)notify:(id)a3
{
  id callback = (void (**)(id, id, NSString *, id))self->_callback;
  p_target = &self->_target;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(p_target);
  callback[2](callback, WeakRetained, self->_keyPath, v6);
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v8 = objc_msgSend_targetUnsafe(v5, v6, v7);
    v12 = objc_msgSend_targetUnsafe(self, v9, v10);
    if (v8 == v12)
    {
      v15 = objc_msgSend_keyPath(v5, v11, v13);
      objc_super v18 = objc_msgSend_keyPath(self, v16, v17);
      BOOL v14 = v15 == v18;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)targetUnsafe
{
  return self->_targetUnsafe;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (id)callback
{
  return self->_callback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end