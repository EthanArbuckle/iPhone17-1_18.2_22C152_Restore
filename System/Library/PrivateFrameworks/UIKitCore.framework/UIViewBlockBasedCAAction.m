@interface UIViewBlockBasedCAAction
- (UIViewBlockBasedCAAction)initWithActionBlock:(id)a3;
- (UIViewBlockBasedCAAction)initWithEmptyBlock:(id)a3;
- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5;
@end

@implementation UIViewBlockBasedCAAction

- (UIViewBlockBasedCAAction)initWithActionBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIViewBlockBasedCAAction;
  v5 = [(UIViewBlockBasedCAAction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  id block = (void (**)(id, id, id, id))self->_block;
  if (!block)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"UIView.m", 782, @"%@ must be initialized with a non-nil block", v14 object file lineNumber description];

    id block = (void (**)(id, id, id, id))self->_block;
  }
  block[2](block, v15, v9, v10);
}

uint64_t __47__UIViewBlockBasedCAAction_initWithEmptyBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (UIViewBlockBasedCAAction)initWithEmptyBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__UIViewBlockBasedCAAction_initWithEmptyBlock___block_invoke;
  v8[3] = &unk_1E530FB18;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(UIViewBlockBasedCAAction *)self initWithActionBlock:v8];

  return v6;
}

@end