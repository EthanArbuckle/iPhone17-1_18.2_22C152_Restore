@interface TMLRuntimeObject
- (BOOL)tmlHasPropertyForKey:(id)a3;
- (id)valueForKey:(id)a3;
- (void)registerTMLProperty:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation TMLRuntimeObject

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_getAssociatedObject(self, "pc");
  v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, v7, v4);
  if (v9)
  {
    v11 = objc_msgSend_null(MEMORY[0x263EFF9D0], v8, v10);
    if (v9 == v11) {
      v12 = 0;
    }
    else {
      v12 = v9;
    }
    id v13 = v12;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TMLRuntimeObject;
    id v13 = [(TMLRuntimeObject *)&v15 valueForKey:v4];
  }

  return v13;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9 = objc_msgSend_unwrap_(TMLJSNil, v7, v8, a3);
  double v10 = objc_getAssociatedObject(self, "pc");
  v14 = objc_msgSend_objectForKeyedSubscript_(v10, v11, v12, v6);
  if (v14)
  {
    if (!v9)
    {
      v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v15);
    }
    v16 = objc_msgSend_objectForKeyedSubscript_(v10, v13, v15, v6);
    char isEqual = objc_msgSend_isEqual_(v9, v17, v18, v16);

    if ((isEqual & 1) == 0)
    {
      objc_msgSend_willChangeValueForKey_(self, v20, v21, v6);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v22, v23, v9, v6);
      objc_msgSend_didChangeValueForKey_(self, v24, v25, v6);
    }
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)TMLRuntimeObject;
    [(TMLRuntimeObject *)&v26 setValue:v9 forKey:v6];
  }
}

- (void)registerTMLProperty:(id)a3
{
  id v4 = a3;
  objc_getAssociatedObject(self, "pc");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v13 = (id)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    objc_setAssociatedObject(self, "pc", v13, (void *)1);
  }
  double v10 = objc_msgSend_null(MEMORY[0x263EFF9D0], v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v13, v11, v12, v10, v4);
}

- (BOOL)tmlHasPropertyForKey:(id)a3
{
  id v4 = a3;
  v5 = objc_getAssociatedObject(self, "pc");
  double v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, v7, v4);

  if (!v8) {
    id v11 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v9, v10, v4, self, 0);
  }

  return 1;
}

@end