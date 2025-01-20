@interface TMLPropertyChangedScriptSignalHandler
- (TMLPropertyChangedScriptSignalHandler)initWithFunctionName:(id)a3 context:(id)a4 binding:(id)a5;
- (int64_t)bindingOrder;
- (void)attach;
- (void)bindingValueChanged:(id)a3;
- (void)detach;
@end

@implementation TMLPropertyChangedScriptSignalHandler

- (TMLPropertyChangedScriptSignalHandler)initWithFunctionName:(id)a3 context:(id)a4 binding:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v14 = objc_msgSend_target(v9, v12, v13);
  v17.receiver = self;
  v17.super_class = (Class)TMLPropertyChangedScriptSignalHandler;
  v15 = [(TMLScriptSignalHandler *)&v17 initWithFunctionName:v11 returnType:1 target:v14 context:v10];

  if (v15) {
    objc_storeStrong((id *)&v15->_binding, a5);
  }

  return v15;
}

- (int64_t)bindingOrder
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)attach
{
  v5.receiver = self;
  v5.super_class = (Class)TMLPropertyChangedScriptSignalHandler;
  [(TMLScriptSignalHandler *)&v5 attach];
  objc_msgSend_bind_(self->_binding, v3, v4, self);
}

- (void)detach
{
  objc_msgSend_unbind_(self->_binding, a2, v2, self);
  v4.receiver = self;
  v4.super_class = (Class)TMLPropertyChangedScriptSignalHandler;
  [(TMLScriptSignalHandler *)&v4 detach];
}

- (void)bindingValueChanged:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  objc_super v5 = objc_msgSend_target(a3, a2, v3);
  v12[0] = v5;
  v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, v7, v12, 1);
  id v11 = (id)objc_msgSend_callWithArguments_(self, v9, v10, v8);
}

- (void).cxx_destruct
{
}

@end