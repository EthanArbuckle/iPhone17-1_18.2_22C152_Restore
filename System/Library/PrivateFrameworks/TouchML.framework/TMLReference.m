@interface TMLReference
+ (id)referenceForTarget:(id)a3;
+ (id)referenceWithBlock:(id)a3;
- (NSString)description;
- (TMLReference)initWithTarget:(id)a3 block:(id)a4;
- (id)value;
- (unint64_t)valueType;
@end

@implementation TMLReference

- (TMLReference)initWithTarget:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TMLReference;
  v9 = [(TMLReference *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_target, a3);
    uint64_t v11 = MEMORY[0x23ECA7DD0](v8);
    id block = v10->_block;
    v10->_id block = (id)v11;
  }
  return v10;
}

+ (id)referenceForTarget:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v8 = objc_msgSend_initWithTarget_block_(v5, v6, v7, v4, 0);

  return v8;
}

+ (id)referenceWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v8 = objc_msgSend_initWithTarget_block_(v5, v6, v7, 0, v4);

  return v8;
}

- (id)value
{
  id block = (void (**)(id, SEL))self->_block;
  if (block)
  {
    id v4 = block[2](block, a2);
    id target = self->_target;
    self->_id target = v4;

    id v6 = self->_block;
    self->_id block = 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v10 = self->_target;
  if (isKindOfClass)
  {
    objc_msgSend_object(v10, v7, v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v10;
  }
  return v11;
}

- (unint64_t)valueType
{
  return 16;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v7 = objc_msgSend_tmlIdentifier(self->_target, v5, v6);
  id v10 = objc_msgSend_stringWithFormat_(v3, v8, v9, @"%@:%@", v4, v7);

  return (NSString *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_target, 0);
}

@end