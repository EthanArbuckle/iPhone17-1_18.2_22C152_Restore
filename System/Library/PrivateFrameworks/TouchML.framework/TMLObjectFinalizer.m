@interface TMLObjectFinalizer
+ (void)runBlock:(id)a3 onFinalize:(id)a4;
- (TMLObjectFinalizer)initWithBlock:(id)a3;
- (void)dealloc;
@end

@implementation TMLObjectFinalizer

- (TMLObjectFinalizer)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TMLObjectFinalizer;
  v5 = [(TMLObjectFinalizer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x23ECA7DD0](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)dealloc
{
  id block = (void (**)(id, SEL))self->_block;
  if (block) {
    block[2](block, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)TMLObjectFinalizer;
  [(TMLObjectFinalizer *)&v4 dealloc];
}

+ (void)runBlock:(id)a3 onFinalize:(id)a4
{
  id object = a4;
  id v5 = a3;
  uint64_t v6 = objc_getAssociatedObject(object, &unk_23989EA14);
  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v6 = objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    objc_setAssociatedObject(object, &unk_23989EA14, v6, (void *)1);
  }
  v10 = [TMLObjectFinalizer alloc];
  v13 = objc_msgSend_initWithBlock_(v10, v11, v12, v5);

  objc_msgSend_addObject_(v6, v14, v15, v13);
}

- (void).cxx_destruct
{
}

@end