@interface TMLClassDescriptor
+ (id)decode:(const ProtobufCMessage *)a3;
- (BOOL)canMergeFromClassDescriptor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOptional;
- (BOOL)mergeFromClassDescriptor:(id)a3;
- (Class)objcClass;
- (NSDictionary)childClasses;
- (NSDictionary)inheritedMethods;
- (NSDictionary)inheritedProperties;
- (NSDictionary)inheritedSignals;
- (NSDictionary)methods;
- (NSDictionary)properties;
- (NSDictionary)signals;
- (NSString)className;
- (NSString)objcClassName;
- (NSString)superClassName;
- (TMLClassDescriptor)initWithName:(id)a3 superClassName:(id)a4 initializer:(id)a5 optional:(BOOL)a6;
- (TMLClassDescriptor)superClass;
- (TMLValueExpression)initializer;
- (id)propertyForName:(id)a3;
- (void)addChildClass:(id)a3;
- (void)addMethod:(id)a3;
- (void)addProperty:(id)a3;
- (void)addSignal:(id)a3;
- (void)encode:(ProtobufCMessage *)a3;
- (void)setObjcClassName:(id)a3;
- (void)setSuperClass:(id)a3;
@end

@implementation TMLClassDescriptor

- (TMLClassDescriptor)initWithName:(id)a3 superClassName:(id)a4 initializer:(id)a5 optional:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)TMLClassDescriptor;
  v14 = [(TMLClassDescriptor *)&v31 init];
  if (v14)
  {
    uint64_t v16 = objc_msgSend_copy(v10, v13, v15);
    className = v14->_className;
    v14->_className = (NSString *)v16;

    uint64_t v20 = objc_msgSend_copy(v11, v18, v19);
    superClassName = v14->_superClassName;
    v14->_superClassName = (NSString *)v20;

    objc_storeStrong((id *)&v14->_initializer, a5);
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    properties = v14->_properties;
    v14->_properties = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    signals = v14->_signals;
    v14->_signals = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    methods = v14->_methods;
    v14->_methods = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    childClasses = v14->_childClasses;
    v14->_childClasses = v28;

    v14->_optional = a6;
  }

  return v14;
}

- (Class)objcClass
{
  objcClass = self->_objcClass;
  if (!objcClass)
  {
    uint64_t v5 = objc_msgSend_length(self->_objcClassName, a2, v2);
    uint64_t v6 = 88;
    if (!v5) {
      uint64_t v6 = 8;
    }
    NSClassFromString(*(NSString **)((char *)&self->super.isa + v6));
    objcClass = (objc_class *)objc_claimAutoreleasedReturnValue();
    Class v7 = self->_objcClass;
    self->_objcClass = objcClass;
  }
  return objcClass;
}

- (void)addProperty:(id)a3
{
  properties = self->_properties;
  id v4 = a3;
  objc_msgSend_propertyName(v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(properties, v7, v8, v4, v9);
}

- (id)propertyForName:(id)a3
{
  id v4 = a3;
  Class v7 = objc_msgSend_objectForKeyedSubscript_(self->_properties, v5, v6, v4);
  id v10 = v7;
  if (v7)
  {
    id v11 = v7;
  }
  else
  {
    objc_msgSend_propertyForName_(self->_superClass, v8, v9, v4);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = v11;

  return v12;
}

- (void)addSignal:(id)a3
{
  signals = self->_signals;
  id v4 = a3;
  objc_msgSend_signalName(v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(signals, v7, v8, v4, v9);
}

- (void)addMethod:(id)a3
{
  methods = self->_methods;
  id v4 = a3;
  objc_msgSend_methodName(v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(methods, v7, v8, v4, v9);
}

- (void)addChildClass:(id)a3
{
  childClasses = self->_childClasses;
  id v4 = a3;
  objc_msgSend_className(v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(childClasses, v7, v8, v4, v9);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (TMLClassDescriptor *)a3;
  if (self == v5)
  {
    char isEqualToDictionary = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v6 = v5;
      className = self->_className;
      id v10 = objc_msgSend_className(v6, v8, v9);
      if (!objc_msgSend_isEqualToString_(className, v11, v12, v10))
      {
        char isEqualToDictionary = 0;
LABEL_18:

        goto LABEL_19;
      }
      superClassName = self->_superClassName;
      objc_msgSend_superClassName(v6, v13, v14);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (superClassName != v17)
      {
        double v19 = self->_superClassName;
        v3 = objc_msgSend_superClassName(v6, v16, v18);
        if (!objc_msgSend_isEqualToString_(v19, v20, v21, v3))
        {
          char isEqualToDictionary = 0;
          goto LABEL_16;
        }
      }
      properties = self->_properties;
      v24 = objc_msgSend_properties(v6, v16, v18);
      if (objc_msgSend_isEqualToDictionary_(properties, v25, v26, v24))
      {
        signals = self->_signals;
        v30 = objc_msgSend_signals(v6, v27, v28);
        if (objc_msgSend_isEqualToDictionary_(signals, v31, v32, v30))
        {
          methods = self->_methods;
          v36 = objc_msgSend_methods(v6, v33, v34);
          char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(methods, v37, v38, v36);

          goto LABEL_15;
        }
      }
      char isEqualToDictionary = 0;
LABEL_15:
      if (superClassName == v17)
      {
LABEL_17:

        goto LABEL_18;
      }
LABEL_16:

      goto LABEL_17;
    }
    char isEqualToDictionary = 0;
  }
LABEL_19:

  return isEqualToDictionary;
}

- (NSDictionary)inheritedProperties
{
  superClass = self->_superClass;
  if (superClass)
  {
    uint64_t v5 = objc_msgSend_inheritedProperties(superClass, a2, v2);
    double v8 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v5, v6, v7);

    objc_msgSend_addEntriesFromDictionary_(v8, v9, v10, self->_properties);
  }
  else
  {
    double v8 = self->_properties;
  }
  return (NSDictionary *)v8;
}

- (NSDictionary)inheritedSignals
{
  superClass = self->_superClass;
  if (superClass)
  {
    uint64_t v5 = objc_msgSend_inheritedSignals(superClass, a2, v2);
    double v8 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v5, v6, v7);

    objc_msgSend_addEntriesFromDictionary_(v8, v9, v10, self->_signals);
  }
  else
  {
    double v8 = self->_signals;
  }
  return (NSDictionary *)v8;
}

- (NSDictionary)inheritedMethods
{
  superClass = self->_superClass;
  if (superClass)
  {
    uint64_t v5 = objc_msgSend_inheritedMethods(superClass, a2, v2);
    double v8 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v5, v6, v7);

    objc_msgSend_addEntriesFromDictionary_(v8, v9, v10, self->_methods);
  }
  else
  {
    double v8 = self->_methods;
  }
  return (NSDictionary *)v8;
}

- (BOOL)canMergeFromClassDescriptor:(id)a3
{
  id v4 = a3;
  className = self->_className;
  double v8 = objc_msgSend_className(v4, v6, v7);
  if (objc_msgSend_isEqualToString_(className, v9, v10, v8))
  {
    superClassName = self->_superClassName;
    uint64_t v14 = objc_msgSend_superClassName(v4, v11, v12);
    if (superClassName == (NSString *)v14)
    {

LABEL_8:
      uint64_t v59 = 0;
      v60 = &v59;
      uint64_t v61 = 0x2020000000;
      char v62 = 1;
      v24 = objc_msgSend_inheritedProperties(self, v22, COERCE_DOUBLE(0x2020000000));
      v27 = objc_msgSend_properties(v4, v25, v26);
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = sub_23987DCAC;
      v56[3] = &unk_264DAEAA0;
      id v28 = v24;
      id v57 = v28;
      v58 = &v59;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v27, v29, v30, v56);

      v33 = objc_msgSend_inheritedMethods(self, v31, v32);
      v36 = objc_msgSend_methods(v4, v34, v35);
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = sub_23987DD50;
      v53[3] = &unk_264DAEAC8;
      id v37 = v33;
      id v54 = v37;
      v55 = &v59;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v36, v38, v39, v53);

      v42 = objc_msgSend_inheritedSignals(self, v40, v41);
      v45 = objc_msgSend_signals(v4, v43, v44);
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = sub_23987DDE4;
      v50[3] = &unk_264DAEAF0;
      id v46 = v42;
      id v51 = v46;
      v52 = &v59;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v45, v47, v48, v50);

      BOOL v23 = *((unsigned char *)v60 + 24) != 0;
      _Block_object_dispose(&v59, 8);
      goto LABEL_9;
    }
    v17 = (void *)v14;
    double v18 = self->_superClassName;
    double v19 = objc_msgSend_superClassName(v4, v15, v16);
    LODWORD(v18) = objc_msgSend_isEqualToString_(v18, v20, v21, v19);

    if (v18) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  BOOL v23 = 0;
LABEL_9:

  return v23;
}

- (BOOL)mergeFromClassDescriptor:(id)a3
{
  id v4 = a3;
  double v7 = objc_msgSend_properties(v4, v5, v6);
  double v10 = objc_msgSend_mutableCopy(v7, v8, v9);

  v13 = objc_msgSend_inheritedProperties(self, v11, v12);
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = sub_23987E104;
  v63[3] = &unk_264DAEB18;
  id v64 = v10;
  id v14 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v13, v15, v16, v63);

  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = sub_23987E198;
  v62[3] = &unk_264DAEB18;
  v62[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v14, v17, v18, v62);
  double v21 = objc_msgSend_methods(v4, v19, v20);
  v24 = objc_msgSend_mutableCopy(v21, v22, v23);

  v27 = objc_msgSend_inheritedMethods(self, v25, v26);
  double v30 = objc_msgSend_allKeys(v27, v28, v29);
  objc_msgSend_removeObjectsForKeys_(v24, v31, v32, v30);

  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = sub_23987E1A0;
  v61[3] = &unk_264DAEB40;
  v61[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v24, v33, v34, v61);
  id v37 = objc_msgSend_signals(v4, v35, v36);

  v40 = objc_msgSend_mutableCopy(v37, v38, v39);
  v43 = objc_msgSend_inheritedSignals(self, v41, v42);
  id v46 = objc_msgSend_allKeys(v43, v44, v45);
  objc_msgSend_removeObjectsForKeys_(v40, v47, v48, v46);

  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = sub_23987E1A8;
  v60[3] = &unk_264DAEB68;
  v60[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v40, v49, v50, v60);
  uint64_t v53 = objc_msgSend_count(v14, v51, v52);
  uint64_t v56 = objc_msgSend_count(v24, v54, v55) + v53;
  LOBYTE(v56) = v56 + objc_msgSend_count(v40, v57, v58) != 0;

  return v56;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5 = sub_239852C08(a3);
  double v7 = (const char *)objc_msgSend_UTF8String(self->_className, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  superClassName = self->_superClassName;
  if (superClassName)
  {
    id v11 = (const char *)objc_msgSend_UTF8String(superClassName, v8, v9);
    superClassName = strdup(v11);
  }
  *(void *)&a3[1].var1 = superClassName;
  objcClassName = (ProtobufCMessageUnknownField *)self->_objcClassName;
  if (objcClassName)
  {
    v13 = (const char *)objc_msgSend_UTF8String(objcClassName, v8, v9);
    objcClassName = (ProtobufCMessageUnknownField *)strdup(v13);
  }
  a3[1].var2 = objcClassName;
  id v14 = objc_msgSend_allValues(self->_properties, v8, v9);
  uint64_t v17 = objc_msgSend_count(v14, v15, v16);
  a3[2].var0 = (ProtobufCMessageDescriptor *)v17;
  if (v17) {
    uint64_t v17 = (uint64_t)malloc_type_malloc(8 * v17, 0x2004093837F09uLL);
  }
  *(void *)&a3[2].var1 = v17;
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = sub_23987E494;
  v51[3] = &unk_264DAB750;
  v51[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v14, v18, v19, v51);
  v22 = objc_msgSend_allValues(self->_signals, v20, v21);
  uint64_t v25 = objc_msgSend_count(v22, v23, v24);
  a3[2].var2 = (ProtobufCMessageUnknownField *)v25;
  if (v25) {
    uint64_t v25 = (uint64_t)malloc_type_malloc(8 * v25, 0x2004093837F09uLL);
  }
  a3[3].var0 = (ProtobufCMessageDescriptor *)v25;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = sub_23987E50C;
  v50[3] = &unk_264DADB98;
  void v50[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v22, v26, v27, v50);
  double v30 = objc_msgSend_allValues(self->_childClasses, v28, v29);
  uint64_t v33 = objc_msgSend_count(v30, v31, v32);
  a3[4].var0 = (ProtobufCMessageDescriptor *)v33;
  if (v33) {
    uint64_t v33 = (uint64_t)malloc_type_malloc(8 * v33, 0x2004093837F09uLL);
  }
  *(void *)&a3[4].var1 = v33;
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = sub_23987E584;
  v49[3] = &unk_264DAEB88;
  v49[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v30, v34, v35, v49);
  double v38 = objc_msgSend_allValues(self->_methods, v36, v37);
  uint64_t v41 = objc_msgSend_count(v38, v39, v40);
  *(void *)&a3[3].var1 = v41;
  if (v41) {
    uint64_t v41 = (uint64_t)malloc_type_malloc(8 * v41, 0x2004093837F09uLL);
  }
  a3[3].var2 = (ProtobufCMessageUnknownField *)v41;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = sub_23987E5FC;
  v48[3] = &unk_264DAEBA8;
  v48[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v38, v42, v43, v48);
  if (self->_initializer)
  {
    double v44 = (ProtobufCMessageUnknownField *)malloc_type_malloc(0x30uLL, 0x10F004065BF17CFuLL);
    a3[4].var2 = v44;
    objc_msgSend_encode_(self->_initializer, v45, v46, v44);
  }
  BOOL optional = self->_optional;
  LODWORD(a3[5].var0) = optional;
  HIDWORD(a3[5].var0) = optional;
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  double v7 = objc_msgSend_stringWithUTF8String_(NSString, a2, v3, a3[1].var0);
  if (*(void *)&a3[1].var1)
  {
    double v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, v8);
  }
  else
  {
    double v9 = 0;
  }
  if (a3[4].var2)
  {
    double v10 = objc_opt_class();
    v13 = objc_msgSend_decode_(v10, v11, v12, a3[4].var2);
  }
  else
  {
    v13 = 0;
  }
  if (LODWORD(a3[5].var0)) {
    uint64_t v14 = BYTE4(a3[5].var0) & 1;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = objc_alloc((Class)a1);
  double v19 = objc_msgSend_initWithName_superClassName_initializer_optional_(v15, v16, v17, v7, v9, v13, v14);
  if (a3[1].var2)
  {
    double v21 = objc_msgSend_stringWithUTF8String_(NSString, v18, v20);
    objc_msgSend_setObjcClassName_(v19, v22, v23, v21);
  }
  if (a3[2].var0)
  {
    double v24 = 0;
    do
    {
      uint64_t v25 = *(void *)(*(void *)&a3[2].var1 + 8 * (void)v24);
      double v26 = objc_opt_class();
      double v29 = objc_msgSend_decode_(v26, v27, v28, v25);
      objc_msgSend_addProperty_(v19, v30, v31, v29);

      double v24 = (ProtobufCMessageDescriptor *)((char *)v24 + 1);
    }
    while (v24 < a3[2].var0);
  }
  if (a3[2].var2)
  {
    double v32 = 0;
    do
    {
      uint64_t v33 = *((void *)&a3[3].var0->var0 + (void)v32);
      double v34 = objc_opt_class();
      double v37 = objc_msgSend_decode_(v34, v35, v36, v33);
      objc_msgSend_addSignal_(v19, v38, v39, v37);

      double v32 = (ProtobufCMessageUnknownField *)((char *)v32 + 1);
    }
    while (v32 < a3[2].var2);
  }
  if (a3[4].var0)
  {
    double v40 = 0;
    do
    {
      uint64_t v41 = *(void *)(*(void *)&a3[4].var1 + 8 * (void)v40);
      double v42 = objc_opt_class();
      double v45 = objc_msgSend_decode_(v42, v43, v44, v41);
      objc_msgSend_addChildClass_(v19, v46, v47, v45);

      double v40 = (ProtobufCMessageDescriptor *)((char *)v40 + 1);
    }
    while (v40 < a3[4].var0);
  }
  if (*(void *)&a3[3].var1)
  {
    unint64_t v48 = 0;
    do
    {
      uint64_t v49 = *((void *)a3[3].var2 + v48);
      double v50 = objc_opt_class();
      uint64_t v53 = objc_msgSend_decode_(v50, v51, v52, v49);
      objc_msgSend_addMethod_(v19, v54, v55, v53);

      ++v48;
    }
    while (v48 < *(void *)&a3[3].var1);
  }

  return v19;
}

- (NSString)className
{
  return self->_className;
}

- (NSString)superClassName
{
  return self->_superClassName;
}

- (NSDictionary)properties
{
  return &self->_properties->super;
}

- (NSDictionary)signals
{
  return &self->_signals->super;
}

- (NSDictionary)methods
{
  return &self->_methods->super;
}

- (NSDictionary)childClasses
{
  return &self->_childClasses->super;
}

- (TMLClassDescriptor)superClass
{
  return self->_superClass;
}

- (void)setSuperClass:(id)a3
{
}

- (NSString)objcClassName
{
  return self->_objcClassName;
}

- (void)setObjcClassName:(id)a3
{
}

- (TMLValueExpression)initializer
{
  return self->_initializer;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objcClassName, 0);
  objc_storeStrong((id *)&self->_objcClass, 0);
  objc_storeStrong((id *)&self->_superClass, 0);
  objc_storeStrong((id *)&self->_initializer, 0);
  objc_storeStrong((id *)&self->_childClasses, 0);
  objc_storeStrong((id *)&self->_methods, 0);
  objc_storeStrong((id *)&self->_signals, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_superClassName, 0);
  objc_storeStrong((id *)&self->_className, 0);
}

@end