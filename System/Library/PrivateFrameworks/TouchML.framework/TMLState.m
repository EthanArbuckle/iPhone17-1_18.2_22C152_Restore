@interface TMLState
+ (Class)registerState:(id)a3 forClass:(Class)a4;
+ (id)stateForClass:(Class)a3 stateName:(id)a4;
- (NSOrderedSet)propertyKeys;
- (NSString)tmlStateExtends;
- (NSString)tmlStateName;
- (TMLState)init;
- (TMLState)initWithStateName:(id)a3;
- (id)tmlIdentifier;
- (id)valueForKeyPath:(id)a3;
- (void)applyToObject:(id)a3 fromState:(id)a4;
- (void)applyToObject:(id)a3 ignorePropertyKeys:(id)a4;
- (void)enterStateFromState:(id)a3;
- (void)leaveStateToState:(id)a3;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
@end

@implementation TMLState

- (TMLState)init
{
  v14.receiver = self;
  v14.super_class = (Class)TMLState;
  v2 = [(TMLState *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v6 = objc_msgSend_initWithCapacity_(v3, v4, v5, 8);
    properties = v2->_properties;
    v2->_properties = (NSMutableDictionary *)v6;

    id v8 = objc_alloc(MEMORY[0x263EFF9B0]);
    uint64_t v11 = objc_msgSend_initWithCapacity_(v8, v9, v10, 8);
    propertyKeys = v2->_propertyKeys;
    v2->_propertyKeys = (NSMutableOrderedSet *)v11;
  }
  return v2;
}

- (TMLState)initWithStateName:(id)a3
{
  id v4 = a3;
  id v8 = (TMLState *)objc_msgSend_init(self, v5, v6);
  if (v8)
  {
    uint64_t v10 = objc_msgSend_copy(v4, v7, v9);
    tmlStateName = v8->_tmlStateName;
    v8->_tmlStateName = (NSString *)v10;
  }
  return v8;
}

+ (Class)registerState:(id)a3 forClass:(Class)a4
{
  double v5 = NSString;
  double v6 = NSStringFromClass(a4);
  objc_msgSend_stringWithFormat_(v5, v7, v8, @"%@_State", v6);
  id v9 = objc_claimAutoreleasedReturnValue();
  v12 = (const char *)objc_msgSend_UTF8String(v9, v10, v11);

  Class = objc_getClass(v12);
  if (!Class)
  {
    Class = objc_allocateClassPair((Class)a1, v12, 0);
    objc_registerClassPair(Class);
  }
  return Class;
}

+ (id)stateForClass:(Class)a3 stateName:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    do
    {
      double v6 = NSString;
      v7 = NSStringFromClass(a3);
      objc_msgSend_stringWithFormat_(v6, v8, v9, @"%@_State", v7);
      id v10 = objc_claimAutoreleasedReturnValue();
      v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);

      Class = objc_getClass(v13);
      Superclass = class_getSuperclass(a3);
      a3 = Superclass;
      if (Class) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = Superclass == 0;
      }
    }
    while (!v16);
  }
  else
  {
    Class = 0;
  }
  id v17 = [Class alloc];
  v20 = objc_msgSend_initWithStateName_(v17, v18, v19, v5);

  return v20;
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  v29 = (char *)a3;
  id v6 = a4;
  if (objc_msgSend_isEqualToString_(v6, v7, v8, @"tmlState"))
  {
    if (self->_tmlStateName) {
      goto LABEL_11;
    }
    double v11 = objc_msgSend_description(v29, v9, v10);
    objc_super v14 = (NSString *)objc_msgSend_copy(v11, v12, v13);
    tmlStateName = self->_tmlStateName;
    self->_tmlStateName = v14;
LABEL_7:

    goto LABEL_11;
  }
  if (objc_msgSend_isEqualToString_(v6, v9, v10, @"tmlExtends"))
  {
    if (self->_tmlStateExtends) {
      goto LABEL_11;
    }
    double v11 = objc_msgSend_description(v29, v16, v17);
    v20 = (NSString *)objc_msgSend_copy(v11, v18, v19);
    tmlStateName = self->_tmlStateExtends;
    self->_tmlStateExtends = v20;
    goto LABEL_7;
  }
  v21 = objc_msgSend_tmlParent(self, v16, v17);
  id v24 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v22, v23, v6, v21, 1);

  v26 = v29;
  if (!v29)
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], 0, v25);
    v26 = (const char *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (char *)v26;
  objc_msgSend_setObject_forKey_(self->_properties, v26, v25, v26, v6);
  objc_msgSend_addObject_(self->_propertyKeys, v27, v28, v6);
LABEL_11:
}

- (id)valueForKeyPath:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v5, v6, v4, self, 0);
  double v10 = objc_msgSend_objectForKey_(self->_properties, v8, v9, v4);

  double v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v12);
  if (v10 == v13) {
    objc_super v14 = 0;
  }
  else {
    objc_super v14 = v10;
  }
  id v15 = v14;

  return v15;
}

- (void)applyToObject:(id)a3 fromState:(id)a4
{
  objc_msgSend_applyToObject_ignorePropertyKeys_(self, a2, v4, a3, 0);
}

- (void)applyToObject:(id)a3 ignorePropertyKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_tmlStateExtends)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_baseState);

    if (!WeakRetained)
    {
      double v11 = objc_msgSend_tmlStateForName_(v6, v9, v10, self->_tmlStateExtends);
      objc_storeWeak((id *)&self->_baseState, v11);
    }
    id v12 = objc_loadWeakRetained((id *)&self->_baseState);
    objc_msgSend_applyToObject_ignorePropertyKeys_(v12, v13, v14, self, self->_propertyKeys);
  }
  id v15 = self->_propertyKeys;
  v18 = v15;
  if (v7)
  {
    double v19 = (NSMutableOrderedSet *)objc_msgSend_mutableCopy(v15, v16, v17);

    objc_msgSend_minusOrderedSet_(v19, v20, v21, v7);
    v18 = v19;
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_2398327A8;
  v25[3] = &unk_264DAB788;
  v25[4] = self;
  id v26 = v6;
  id v22 = v6;
  objc_msgSend_enumerateObjectsUsingBlock_(v18, v23, v24, v25);
}

- (id)tmlIdentifier
{
  double v4 = objc_msgSend_tmlParent(self, a2, v2);
  id v7 = objc_msgSend_tmlIdentifier(v4, v5, v6);

  if (v7)
  {
    double v10 = objc_msgSend_stringWithFormat_(NSString, v8, v9, @"%@_State_%@", v7, self->_tmlStateName);
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)enterStateFromState:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseState);
  objc_msgSend_enterStateFromState_(WeakRetained, v6, v7, v4);

  if (v4)
  {
    v13[0] = v4;
    double v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v8, v9, v13, 1);
    objc_msgSend_emitTMLSignal_withArguments_(self, v11, v12, @"enterState", v10);
  }
  else
  {
    objc_msgSend_emitTMLSignal_withArguments_(self, v8, v9, @"enterState", 0);
  }
}

- (void)leaveStateToState:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseState);
  objc_msgSend_leaveStateToState_(WeakRetained, v6, v7, v4);

  if (v4)
  {
    v13[0] = v4;
    double v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v8, v9, v13, 1);
    objc_msgSend_emitTMLSignal_withArguments_(self, v11, v12, @"leaveState", v10);
  }
  else
  {
    objc_msgSend_emitTMLSignal_withArguments_(self, v8, v9, @"leaveState", 0);
  }
}

- (NSString)tmlStateName
{
  return self->_tmlStateName;
}

- (NSString)tmlStateExtends
{
  return self->_tmlStateExtends;
}

- (NSOrderedSet)propertyKeys
{
  return &self->_propertyKeys->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_baseState);
  objc_storeStrong((id *)&self->_tmlStateExtends, 0);
  objc_storeStrong((id *)&self->_tmlStateName, 0);
  objc_storeStrong((id *)&self->_propertyKeys, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end