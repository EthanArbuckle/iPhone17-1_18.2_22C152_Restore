@interface TMLReactiveValue
+ (id)valueForTarget:(id)a3 withKeyPath:(id)a4;
+ (void)removeReactiveValuesForTarget:(id)a3;
- (NSArray)bindings;
- (TMLReactiveValue)initWithBindings:(id)a3 valueType:(unint64_t)a4;
- (id)value;
- (int64_t)bindingOrder;
- (unint64_t)valueType;
- (void)assignToTarget:(id)a3 withKeyPath:(id)a4;
- (void)bindingValueChanged:(id)a3;
- (void)unassign;
@end

@implementation TMLReactiveValue

- (TMLReactiveValue)initWithBindings:(id)a3 valueType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TMLReactiveValue;
  v8 = [(TMLReactiveValue *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bindings, a3);
    v9->_valueType = a4;
  }

  return v9;
}

- (int64_t)bindingOrder
{
  return 0;
}

- (id)value
{
  return 0;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void)assignToTarget:(id)a3 withKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_unassign(self, v8, v9);
  if (objc_msgSend_count(self->_bindings, v10, v11))
  {
    v12 = objc_getAssociatedObject(v6, "pbccppmsc");
    if (!v12)
    {
      id v13 = objc_alloc(MEMORY[0x263EFF9A0]);
      v12 = objc_msgSend_initWithCapacity_(v13, v14, v15, 4);
      objc_setAssociatedObject(v6, "pbccppmsc", v12, (void *)1);
    }
    objc_storeStrong((id *)&self->_keyPath, a4);
    uint64_t v17 = objc_opt_class();
    if (qword_268A05848 != -1) {
      dispatch_once(&qword_268A05848, &unk_26ECECFC8);
    }
    if (objc_msgSend_containsObject_((void *)qword_268A05840, v16, v18, v17)) {
      self->_targetUnsafe = v6;
    }
    else {
      objc_storeWeak(&self->_targetWeak, v6);
    }
    objc_msgSend_setObject_forKey_(v12, v19, v20, self, v7);
    bindings = self->_bindings;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_2398638C8;
    v23[3] = &unk_264DAC318;
    v23[4] = self;
    objc_msgSend_enumerateObjectsUsingBlock_(bindings, v22, COERCE_DOUBLE(3221225472), v23);
  }
}

- (void)unassign
{
  p_targetWeak = &self->_targetWeak;
  id WeakRetained = objc_loadWeakRetained(&self->_targetWeak);
  if (WeakRetained || (id WeakRetained = self->_targetUnsafe) != 0)
  {
    if (self->_keyPath)
    {
      v5 = objc_getAssociatedObject(WeakRetained, "pbccppmsc");
      objc_msgSend_removeObjectForKey_(v5, v6, v7, self->_keyPath);
      bindings = self->_bindings;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = sub_239863A24;
      v11[3] = &unk_264DAC318;
      v11[4] = self;
      objc_msgSend_enumerateObjectsUsingBlock_(bindings, v9, COERCE_DOUBLE(3221225472), v11);
    }
  }
  objc_storeWeak(p_targetWeak, 0);
  keyPath = self->_keyPath;
  self->_targetUnsafe = 0;
  self->_keyPath = 0;
}

+ (id)valueForTarget:(id)a3 withKeyPath:(id)a4
{
  id v5 = a4;
  id v6 = objc_getAssociatedObject(a3, "pbccppmsc");
  double v9 = objc_msgSend_objectForKeyedSubscript_(v6, v7, v8, v5);

  return v9;
}

+ (void)removeReactiveValuesForTarget:(id)a3
{
}

- (void)bindingValueChanged:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_targetWeak);
  if (WeakRetained || (id WeakRetained = self->_targetUnsafe) != 0)
  {
    id v10 = WeakRetained;
    double v7 = objc_msgSend_value(self, v5, v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_msgSend_setValue_forKeyPath_(v10, v8, v9, v7, self->_keyPath);
    }
  }
}

- (NSArray)bindings
{
  return self->_bindings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_destroyWeak(&self->_targetWeak);
  objc_storeStrong((id *)&self->_bindings, 0);
}

@end