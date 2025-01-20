@interface TMLJSONObjectDerived
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (TMLJSONObjectDerived)initWithParent:(id)a3 keyPath:(id)a4;
- (id)rawJSON;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (void)tmlAddObserver:(id)a3 forKeyPath:(id)a4 callback:(id)a5;
- (void)tmlRemoveObserver:(id)a3 forKeyPath:(id)a4;
@end

@implementation TMLJSONObjectDerived

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return objc_msgSend_isEqualToString_(a3, a2, v3, @"SCHEMA") ^ 1;
}

- (TMLJSONObjectDerived)initWithParent:(id)a3 keyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TMLJSONObjectDerived;
  v8 = [(TMLJSONObject *)&v15 initWithSchema:0 json:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parent, v6);
    uint64_t v12 = objc_msgSend_stringByAppendingString_(v7, v10, v11, @".");
    keyPath = v9->_keyPath;
    v9->_keyPath = (NSString *)v12;
  }
  return v9;
}

- (id)rawJSON
{
  p_parent = &self->_parent;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  keyPath = self->_keyPath;
  uint64_t v8 = objc_msgSend_length(keyPath, v6, v7);
  double v11 = objc_msgSend_substringToIndex_(keyPath, v9, v10, v8 - 1);
  id v12 = objc_loadWeakRetained((id *)p_parent);
  objc_super v15 = objc_msgSend_rawJSON(v12, v13, v14);
  v18 = objc_msgSend_rawValueForKeyPath_dictionary_(WeakRetained, v16, v17, v11, v15);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  return v20;
}

- (id)valueForKey:(id)a3
{
  p_parent = &self->_parent;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  v9 = objc_msgSend_stringByAppendingString_(self->_keyPath, v7, v8, v5);

  id v12 = objc_msgSend_valueForKeyPath_(WeakRetained, v10, v11, v9);

  return v12;
}

- (id)valueForKeyPath:(id)a3
{
  p_parent = &self->_parent;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  v9 = objc_msgSend_stringByAppendingString_(self->_keyPath, v7, v8, v5);

  id v12 = objc_msgSend_valueForKeyPath_(WeakRetained, v10, v11, v9);

  return v12;
}

- (void)tmlAddObserver:(id)a3 forKeyPath:(id)a4 callback:(id)a5
{
  p_parent = &self->_parent;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  double v14 = objc_msgSend_stringByAppendingString_(self->_keyPath, v12, v13, v10);

  objc_msgSend_tmlAddObserver_forKeyPath_callback_(WeakRetained, v15, v16, v11, v14, v9);
}

- (void)tmlRemoveObserver:(id)a3 forKeyPath:(id)a4
{
  p_parent = &self->_parent;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  id v11 = objc_msgSend_stringByAppendingString_(self->_keyPath, v9, v10, v7);

  objc_msgSend_tmlRemoveObserver_forKeyPath_(WeakRetained, v12, v13, v8, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end