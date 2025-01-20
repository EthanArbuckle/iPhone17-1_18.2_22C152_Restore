@interface MontrealLogIndent
+ (id)indentWithLevel:(id)a3;
+ (id)indentWithLevel:(id)a3 step:(id)a4 factor:(unint64_t)a5;
- (MontrealLogIndent)initWithLevel:(id)a3 step:(id)a4 factor:(unint64_t)a5;
- (NSString)level;
- (NSString)step;
- (id)description;
- (id)indentByFactor:(unint64_t)a3;
- (unint64_t)factor;
@end

@implementation MontrealLogIndent

+ (id)indentWithLevel:(id)a3
{
  id v3 = a3;
  v4 = [MontrealLogIndent alloc];
  v6 = objc_msgSend_initWithLevel_step_factor_(v4, v5, (uint64_t)v3, (uint64_t)v3, 0);

  return v6;
}

+ (id)indentWithLevel:(id)a3 step:(id)a4 factor:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [MontrealLogIndent alloc];
  v11 = objc_msgSend_initWithLevel_step_factor_(v9, v10, (uint64_t)v8, (uint64_t)v7, a5);

  return v11;
}

- (MontrealLogIndent)initWithLevel:(id)a3 step:(id)a4 factor:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MontrealLogIndent;
  v13 = [(MontrealLogIndent *)&v28 init];
  if (v13)
  {
    if (objc_msgSend_length(v8, v10, v11, v12)) {
      uint64_t v17 = objc_msgSend_copy(v8, v14, v15, v16);
    }
    else {
      uint64_t v17 = objc_msgSend_copy(@"    ", v14, v15, v16);
    }
    level = v13->_level;
    v13->_level = (NSString *)v17;

    if (objc_msgSend_length(v9, v19, v20, v21)) {
      uint64_t v25 = objc_msgSend_copy(v9, v22, v23, v24);
    }
    else {
      uint64_t v25 = objc_msgSend_copy(@"    ", v22, v23, v24);
    }
    step = v13->_step;
    v13->_step = (NSString *)v25;

    v13->_factor = a5;
  }

  return v13;
}

- (id)description
{
  return self->_level;
}

- (id)indentByFactor:(unint64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  unint64_t v6 = self->_factor + a3;
  uint64_t v10 = objc_msgSend_length(self->_step, v7, v8, v9);
  v13 = objc_msgSend_initWithCapacity_(v5, v11, v10 * v6, v12);
  objc_msgSend_appendString_(v13, v14, (uint64_t)self->_level, v15);
  if (a3)
  {
    unint64_t v18 = a3;
    do
    {
      objc_msgSend_appendString_(v13, v16, (uint64_t)self->_step, v17);
      --v18;
    }
    while (v18);
  }
  v19 = objc_msgSend_indentWithLevel_step_factor_(MontrealLogIndent, v16, (uint64_t)v13, (uint64_t)self->_step, self->_factor + a3);

  return v19;
}

- (NSString)step
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)factor
{
  return self->_factor;
}

- (NSString)level
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_level, 0);

  objc_storeStrong((id *)&self->_step, 0);
}

@end