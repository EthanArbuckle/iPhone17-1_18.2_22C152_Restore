@interface _TUIInstantiateEntry
- (TUIBindings)bindings;
- (TUITemplate)aTemplate;
- (_TUIInstantiateEntry)initWithTemplate:(id)a3 bindings:(id)a4 actionObject:(id)a5;
- (id)actionObject;
@end

@implementation _TUIInstantiateEntry

- (_TUIInstantiateEntry)initWithTemplate:(id)a3 bindings:(id)a4 actionObject:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_TUIInstantiateEntry;
  v12 = [(_TUIInstantiateEntry *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_aTemplate, a3);
    objc_storeStrong((id *)&v13->_bindings, a4);
    objc_storeStrong(&v13->_actionObject, a5);
  }

  return v13;
}

- (TUITemplate)aTemplate
{
  return self->_aTemplate;
}

- (TUIBindings)bindings
{
  return self->_bindings;
}

- (id)actionObject
{
  return self->_actionObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionObject, 0);
  objc_storeStrong((id *)&self->_bindings, 0);

  objc_storeStrong((id *)&self->_aTemplate, 0);
}

@end