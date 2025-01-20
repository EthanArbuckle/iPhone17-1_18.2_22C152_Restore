@interface TMLPropertyChangedBlockSignalHandler
- (TMLPropertyChangedBlockSignalHandler)initWithBlock:(id)a3 binding:(id)a4;
- (int64_t)bindingOrder;
- (void)attach;
- (void)bindingValueChanged:(id)a3;
- (void)detach;
@end

@implementation TMLPropertyChangedBlockSignalHandler

- (TMLPropertyChangedBlockSignalHandler)initWithBlock:(id)a3 binding:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TMLPropertyChangedBlockSignalHandler;
  v8 = [(TMLBlockSignalHandler *)&v11 initWithBlock:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_binding, a4);
  }

  return v9;
}

- (int64_t)bindingOrder
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)attach
{
  v5.receiver = self;
  v5.super_class = (Class)TMLPropertyChangedBlockSignalHandler;
  [(TMLBlockSignalHandler *)&v5 attach];
  objc_msgSend_bind_(self->_binding, v3, v4, self);
}

- (void)detach
{
  objc_msgSend_unbind_(self->_binding, a2, v2, self);
  v4.receiver = self;
  v4.super_class = (Class)TMLPropertyChangedBlockSignalHandler;
  [(TMLBlockSignalHandler *)&v4 detach];
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