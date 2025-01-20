@interface TMLMethodDescriptor
+ (id)decode:(const ProtobufCMessage *)a3;
+ (id)methodSelectorForMethodName:(id)a3 parameters:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOptional;
- (NSArray)parameters;
- (NSString)methodName;
- (NSString)methodSelector;
- (TMLMethodDescriptor)initWithName:(id)a3 returnType:(unint64_t)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7;
- (unint64_t)returnType;
- (void)encode:(ProtobufCMessage *)a3;
@end

@implementation TMLMethodDescriptor

- (TMLMethodDescriptor)initWithName:(id)a3 returnType:(unint64_t)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)TMLMethodDescriptor;
  v17 = [(TMLMethodDescriptor *)&v28 init];
  if (v17)
  {
    uint64_t v19 = objc_msgSend_copy(v12, v16, v18);
    methodName = v17->_methodName;
    v17->_methodName = (NSString *)v19;

    v17->_returnType = a4;
    uint64_t v23 = objc_msgSend_copy(v13, v21, v22);
    parameters = v17->_parameters;
    v17->_parameters = (NSArray *)v23;

    objc_storeStrong((id *)&v17->_methodSelector, a6);
    v17->_optional = objc_msgSend_containsObject_(v15, v25, v26, @"optional");
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t returnType;
  const char *v15;
  double v16;
  uint64_t optional;
  const char *v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  double v24;
  NSArray *parameters;
  const char *v26;
  double v27;
  int v28;
  char isEqualToString;
  NSString *methodSelector;
  uint64_t v32;
  const char *v33;
  double v34;
  void *v35;
  NSString *v36;
  void *v37;
  const char *v38;
  double v39;

  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    methodName = self->_methodName;
    v9 = objc_msgSend_methodName(v5, v6, v7);
    if (!objc_msgSend_isEqualToString_(methodName, v10, v11, v9)
      || (returnType = self->_returnType, returnType != objc_msgSend_returnType(v5, v12, v13))
      || (optional = self->_optional, optional != objc_msgSend_isOptional(v5, v15, v16)))
    {
      isEqualToString = 0;
LABEL_11:

      goto LABEL_12;
    }
    v21 = objc_msgSend_count(self->_parameters, v18, v19);
    if (v21
      || (objc_msgSend_parameters(v5, v20, v22),
          optional = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_count((void *)optional, v23, v24)))
    {
      parameters = self->_parameters;
      v3 = objc_msgSend_parameters(v5, v20, v22);
      if (!objc_msgSend_isEqualToArray_(parameters, v26, v27, v3))
      {
        isEqualToString = 0;
        goto LABEL_17;
      }
      objc_super v28 = 1;
    }
    else
    {
      objc_super v28 = 0;
    }
    methodSelector = self->_methodSelector;
    v32 = objc_msgSend_methodSelector(v5, v20, v22);
    if (methodSelector == (NSString *)v32)
    {

      isEqualToString = 1;
      if (!v28)
      {
LABEL_18:
        if (!v21) {

        }
        goto LABEL_11;
      }
    }
    else
    {
      v35 = (void *)v32;
      v36 = self->_methodSelector;
      v37 = objc_msgSend_methodSelector(v5, v33, v34);
      isEqualToString = objc_msgSend_isEqualToString_(v36, v38, v39, v37);

      if ((v28 & 1) == 0) {
        goto LABEL_18;
      }
    }
LABEL_17:

    goto LABEL_18;
  }
  isEqualToString = 0;
LABEL_12:

  return isEqualToString;
}

+ (id)methodSelectorForMethodName:(id)a3 parameters:(id)a4
{
  id v5 = a3;
  if (objc_msgSend_count(a4, v6, v7))
  {
    objc_msgSend_stringByAppendingString_(v5, v8, v9, @":");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v5;
  }
  double v11 = v10;

  return v11;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5 = sub_239852F8C((uint64_t)a3);
  double v7 = (const char *)objc_msgSend_UTF8String(self->_methodName, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  a3[1].var1 = self->_returnType;
  BOOL optional = self->_optional;
  LODWORD(a3[2].var2) = optional;
  HIDWORD(a3[2].var2) = 2 * optional;
  methodSelector = self->_methodSelector;
  if (methodSelector)
  {
    id v12 = (const char *)objc_msgSend_UTF8String(methodSelector, v8, v9);
    methodSelector = strdup(v12);
  }
  *(void *)&a3[2].var1 = methodSelector;
  uint64_t v13 = objc_msgSend_count(self->_parameters, v8, v9);
  a3[1].var2 = (ProtobufCMessageUnknownField *)v13;
  if (v13) {
    uint64_t v13 = (uint64_t)malloc_type_malloc(8 * v13, 0x2004093837F09uLL);
  }
  a3[2].var0 = (ProtobufCMessageDescriptor *)v13;
  parameters = self->_parameters;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_239831F84;
  v16[3] = &unk_264DAB750;
  v16[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(parameters, v14, COERCE_DOUBLE(3221225472), v16);
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  double v7 = objc_msgSend_stringWithUTF8String_(NSString, a2, v3, a3[1].var0);
  if (*(void *)&a3[2].var1)
  {
    double v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, v8);
  }
  else
  {
    double v9 = 0;
  }
  if (a3[1].var2)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF980]);
    id v13 = (id)objc_msgSend_initWithCapacity_(v10, v11, v12, a3[1].var2);
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  v16 = v13;
  if (a3[1].var2)
  {
    v17 = 0;
    do
    {
      uint64_t v18 = *((void *)&a3[2].var0->var0 + (void)v17);
      uint64_t v19 = objc_opt_class();
      double v22 = objc_msgSend_decode_(v19, v20, v21, v18);
      objc_msgSend_addObject_(v16, v23, v24, v22);

      v17 = (ProtobufCMessageUnknownField *)((char *)v17 + 1);
    }
    while (v17 < a3[1].var2);
  }
  if (LODWORD(a3[2].var2) && (BYTE4(a3[2].var2) & 2) != 0)
  {
    v25 = objc_msgSend_setWithObject_(MEMORY[0x263EFFA08], v14, v15, @"optional");
  }
  else
  {
    v25 = 0;
  }
  id v26 = objc_alloc((Class)a1);
  v29 = objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(v26, v27, v28, v7, a3[1].var1, v16, v9, v25);

  return v29;
}

- (NSString)methodName
{
  return self->_methodName;
}

- (unint64_t)returnType
{
  return self->_returnType;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)methodSelector
{
  return self->_methodSelector;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methodSelector, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_methodName, 0);
}

@end