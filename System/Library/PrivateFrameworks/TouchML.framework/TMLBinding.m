@interface TMLBinding
+ (id)bindingForTarget:(id)a3 withKeyPath:(id)a4;
+ (id)bindingForTarget:(id)a3 withKeyPath:(id)a4 valueType:(unint64_t)a5;
- (TMLBinding)initWithTarget:(id)a3 keyPath:(id)a4 valueType:(unint64_t)a5;
- (id)target;
- (id)value;
- (unint64_t)valueType;
- (void)bind:(id)a3;
- (void)dealloc;
- (void)observeTarget;
- (void)tmlObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)unbind:(id)a3;
- (void)unobserveTarget;
@end

@implementation TMLBinding

- (TMLBinding)initWithTarget:(id)a3 keyPath:(id)a4 valueType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TMLBinding;
  v11 = [(TMLBinding *)&v28 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_target, a3);
    uint64_t v15 = objc_msgSend_copy(v10, v13, v14);
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v15;

    id v17 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v20 = objc_msgSend_initWithCapacity_(v17, v18, v19, 4);
    binders = v12->_binders;
    v12->_binders = (NSMutableArray *)v20;

    if (a5)
    {
      v12->_valueType = a5;
    }
    else
    {
      v24 = objc_msgSend_propertyWithKeyPath_forObject_(TMLRuntime, v22, v23, v10, v9);
      v12->_valueType = objc_msgSend_type(v24, v25, v26);
    }
  }

  return v12;
}

- (void)dealloc
{
  if (self->_bindCount) {
    objc_msgSend_unobserveTarget(self, a2, v2);
  }
  v4 = objc_getAssociatedObject(self->_target, "bccppmsc");
  objc_msgSend_removeObjectForKey_(v4, v5, v6, self->_keyPath);
  id target = self->_target;
  self->_id target = 0;

  keyPath = self->_keyPath;
  self->_keyPath = 0;

  v9.receiver = self;
  v9.super_class = (Class)TMLBinding;
  [(TMLBinding *)&v9 dealloc];
}

- (void)bind:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v6 = v4;
  if (v4)
  {
    v21 = (const char *)v4;
    uint64_t v4 = objc_msgSend_containsObject_(self->_binders, (const char *)v4, v5, v4);
    uint64_t v6 = (uint64_t)v21;
    if ((v4 & 1) == 0)
    {
      if (!atomic_fetch_add(&self->_bindCount, 1u)) {
        objc_msgSend_observeTarget(self, v21, v7);
      }
      v8 = [TMLWeakReferenceObject alloc];
      v11 = objc_msgSend_initWithObject_(v8, v9, v10, v21);
      binders = self->_binders;
      uint64_t v15 = objc_msgSend_count(binders, v13, v14);
      uint64_t v18 = objc_msgSend_indexOfObject_inSortedRange_options_usingComparator_(binders, v16, v17, v11, 0, v15, 1536, &unk_26ECECFE8);
      objc_msgSend_insertObject_atIndex_(self->_binders, v19, v20, v11, v18);

      uint64_t v6 = (uint64_t)v21;
    }
  }
  MEMORY[0x270F9A758](v4, v6);
}

- (void)unbind:(id)a3
{
  uint64_t v4 = (const char *)a3;
  uint64_t v6 = v4;
  if (v4)
  {
    objc_super v9 = v4;
    uint64_t v4 = (const char *)objc_msgSend_containsObject_(self->_binders, v4, v5, v4);
    uint64_t v6 = v9;
    if (v4)
    {
      uint64_t v4 = (const char *)objc_msgSend_removeObject_(self->_binders, v9, v7, v9);
      uint64_t v6 = v9;
      if (atomic_fetch_add(&self->_bindCount, 0xFFFFFFFF) == 1)
      {
        uint64_t v4 = (const char *)objc_msgSend_unobserveTarget(self, v9, v8);
        uint64_t v6 = v9;
      }
    }
  }
  MEMORY[0x270F9A758](v4, v6);
}

- (void)observeTarget
{
  if (objc_msgSend_conformsToProtocol_(self->_target, a2, v2, &unk_26ED20438))
  {
    self->_didAttachToTargetViaTMLObservable = 1;
    objc_initWeak(&location, self);
    id target = self->_target;
    keyPath = self->_keyPath;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_239864154;
    v10[3] = &unk_264DADFF0;
    objc_copyWeak(&v11, &location);
    objc_msgSend_tmlAddObserver_forKeyPath_callback_(target, v7, v8, self, keyPath, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_didAttachToTargetViaTMLObservable = 0;
    id v9 = self->_target;
    MEMORY[0x270F9A6D0](v9, sel_addObserver_forKeyPath_options_context_, v4);
  }
}

- (void)unobserveTarget
{
  BOOL didAttachToTargetViaTMLObservable = self->_didAttachToTargetViaTMLObservable;
  id target = self->_target;
  if (didAttachToTargetViaTMLObservable)
  {
    objc_msgSend_tmlRemoveObserver_forKeyPath_(target, a2, v2, self, self->_keyPath);
    self->_BOOL didAttachToTargetViaTMLObservable = 0;
  }
  else
  {
    ((void (*)(id, char *))MEMORY[0x270F9A6D0])(target, sel_removeObserver_forKeyPath_context_);
  }
}

+ (id)bindingForTarget:(id)a3 withKeyPath:(id)a4
{
  return (id)((uint64_t (*)(id, char *))MEMORY[0x270F9A6D0])(a1, sel_bindingForTarget_withKeyPath_valueType_);
}

+ (id)bindingForTarget:(id)a3 withKeyPath:(id)a4 valueType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = objc_getAssociatedObject(v7, "bccppmsc");
    v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, v11, v8);
    uint64_t v15 = objc_msgSend_object(v12, v13, v14);

    if (!v15)
    {
      v16 = [TMLBinding alloc];
      uint64_t v15 = objc_msgSend_initWithTarget_keyPath_valueType_(v16, v17, v18, v7, v8, a5);
      if (!v9)
      {
        id v19 = objc_alloc(MEMORY[0x263EFF9A0]);
        id v9 = objc_msgSend_initWithCapacity_(v19, v20, v21, 4);
        objc_setAssociatedObject(v7, "bccppmsc", v9, (void *)1);
      }
      v22 = [TMLWeakReferenceObject alloc];
      v25 = objc_msgSend_initWithObject_(v22, v23, v24, v15);
      objc_msgSend_setObject_forKeyedSubscript_(v9, v26, v27, v25, v8);
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)tmlObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v41[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_msgSend_objectForKeyedSubscript_(v11, v12, v13, *MEMORY[0x263F081B8]);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id value = self->_value;
  if (value != v15 && (objc_msgSend_isEqual_(value, v14, v16, v15) & 1) == 0)
  {
    if ((atomic_fetch_or((atomic_uchar *volatile)&self->_flags, 0x40u) & 0x40) != 0)
    {
      double v20 = (void *)MEMORY[0x263EFF940];
      double v21 = NSString;
      v22 = objc_opt_class();
      v25 = objc_msgSend_description(v22, v23, v24);
      objc_super v28 = objc_msgSend_stringWithFormat_(v21, v26, v27, @"Inconsistent binding cycle detected for %@:%@", v25, self->_keyPath);
      id target = self->_target;
      v40[0] = @"target";
      v40[1] = @"keyPath";
      keyPath = self->_keyPath;
      v41[0] = target;
      v41[1] = keyPath;
      v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v31, v32, v41, v40, 2);
      v36 = objc_msgSend_exceptionWithName_reason_userInfo_(v20, v34, v35, @"TMLRuntimeException", v28, v33);
      objc_msgSend_raiseException_(TMLExceptionHandler, v37, v38, v36);
    }
    else
    {
      objc_storeStrong(&self->_value, v15);
      binders = self->_binders;
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = sub_23986466C;
      v39[3] = &unk_264DAB5C0;
      v39[4] = self;
      objc_msgSend_enumerateObjectsUsingBlock_(binders, v19, COERCE_DOUBLE(3221225472), v39);
      atomic_fetch_and_explicit((atomic_uchar *volatile)&self->_flags, 0xBFu, memory_order_relaxed);
    }
  }
}

- (id)value
{
  id value = self->_value;
  objc_msgSend_null(MEMORY[0x263EFF9D0], a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (value == v5) {
    id v6 = 0;
  }
  else {
    id v6 = self->_value;
  }
  id v7 = v6;

  return v7;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (id)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_binders, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_target, 0);
}

@end