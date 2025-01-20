@interface TMLValueExpression
+ (id)decode:(const ProtobufCMessage *)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)bindings;
- (NSString)expressionText;
- (TMLValueExpression)initWithExpressionText:(id)a3 bindings:(id)a4;
- (void)encode:(ProtobufCMessage *)a3;
@end

@implementation TMLValueExpression

- (TMLValueExpression)initWithExpressionText:(id)a3 bindings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TMLValueExpression;
  v9 = [(TMLValueExpression *)&v18 init];
  if (v9)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v10);
    expressionText = v9->_expressionText;
    v9->_expressionText = (NSString *)v11;

    uint64_t v15 = objc_msgSend_copy(v7, v13, v14);
    bindings = v9->_bindings;
    v9->_bindings = (NSArray *)v15;
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    expressionText = self->_expressionText;
    v8 = objc_msgSend_expressionText(v4, v5, v6);
    if (objc_msgSend_isEqualToString_(expressionText, v9, v10, v8))
    {
      bindings = self->_bindings;
      double v14 = objc_msgSend_bindings(v4, v11, v12);
      if (objc_msgSend_isEqualToArray_(bindings, v15, v16, v14))
      {
        BOOL v19 = 1;
      }
      else
      {
        v20 = self->_bindings;
        objc_msgSend_bindings(v4, v17, v18);
        v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
        BOOL v19 = v20 == v21;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5 = sub_239853470(a3);
  id v7 = (const char *)objc_msgSend_UTF8String(self->_expressionText, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  uint64_t v10 = objc_msgSend_count(self->_bindings, v8, v9);
  *(void *)&a3[1].var1 = v10;
  if (v10) {
    uint64_t v10 = (uint64_t)malloc_type_malloc(8 * v10, 0x80040B8603338uLL);
  }
  a3[1].var2 = (ProtobufCMessageUnknownField *)v10;
  bindings = self->_bindings;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_23988D2BC;
  v13[3] = &unk_264DADB78;
  v13[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(bindings, v11, COERCE_DOUBLE(3221225472), v13);
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  id v7 = objc_msgSend_stringWithUTF8String_(NSString, a2, v3, a3[1].var0);
  if (*(void *)&a3[1].var1)
  {
    id v9 = objc_alloc(MEMORY[0x263EFF980]);
    double v12 = objc_msgSend_initWithCapacity_(v9, v10, v11, *(void *)&a3[1].var1);
  }
  else
  {
    double v12 = 0;
  }
  if (*(void *)&a3[1].var1)
  {
    unint64_t v13 = 0;
    do
    {
      double v14 = objc_msgSend_stringWithUTF8String_(NSString, v6, v8, *((void *)a3[1].var2 + v13));
      objc_msgSend_addObject_(v12, v15, v16, v14);

      ++v13;
    }
    while (v13 < *(void *)&a3[1].var1);
  }
  id v17 = objc_alloc((Class)a1);
  v20 = objc_msgSend_initWithExpressionText_bindings_(v17, v18, v19, v7, v12);

  return v20;
}

- (NSString)expressionText
{
  return self->_expressionText;
}

- (NSArray)bindings
{
  return self->_bindings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_storeStrong((id *)&self->_expressionText, 0);
}

@end