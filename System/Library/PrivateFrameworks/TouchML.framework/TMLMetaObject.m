@interface TMLMetaObject
+ (id)decode:(const ProtobufCMessage *)a3;
- (NSArray)declarations;
- (NSArray)objects;
- (NSDictionary)properties;
- (NSDictionary)signalHandlers;
- (NSOrderedSet)propertyKeys;
- (NSSet)attributes;
- (NSSet)implements;
- (NSString)identifier;
- (NSString)type;
- (TMLMetaObject)initWithType:(id)a3 attributes:(id)a4;
- (TMLValueExpression)initializer;
- (id)propertyDeclaration:(id)a3;
- (id)signalDeclaration:(id)a3;
- (void)addConstructorDeclaration:(id)a3 parameters:(id)a4 methodSelector:(id)a5 attributes:(id)a6;
- (void)addDeclaration:(id)a3;
- (void)addImplements:(id)a3;
- (void)addMethodDeclaration:(id)a3 returnType:(id)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7;
- (void)addObject:(id)a3;
- (void)addProperty:(id)a3 value:(id)a4;
- (void)addPropertyDeclaration:(id)a3 typeName:(id)a4 attributes:(id)a5;
- (void)addSignalDeclaration:(id)a3 returnType:(id)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7;
- (void)addSignalHandler:(id)a3 signalTarget:(id)a4;
- (void)applyCategory:(id)a3;
- (void)encode:(ProtobufCMessage *)a3;
- (void)setInitializer:(id)a3;
@end

@implementation TMLMetaObject

- (TMLMetaObject)initWithType:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TMLMetaObject;
  v9 = [(TMLMetaObject *)&v23 init];
  if (v9)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v10);
    type = v9->_type;
    v9->_type = (NSString *)v11;

    id v13 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v16 = objc_msgSend_initWithCapacity_(v13, v14, v15, 8);
    declarations = v9->_declarations;
    v9->_declarations = (NSMutableArray *)v16;

    uint64_t v20 = objc_msgSend_copy(v7, v18, v19);
    attributes = v9->_attributes;
    v9->_attributes = (NSSet *)v20;
  }
  return v9;
}

- (void)addProperty:(id)a3 value:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  if (objc_msgSend_isEqualToString_(v26, v7, v8, @"id"))
  {
    uint64_t v11 = (NSString *)objc_msgSend_copy(v6, v9, v10);
    identifier = self->_identifier;
    self->_identifier = v11;
  }
  else
  {
    properties = self->_properties;
    if (!properties)
    {
      id v14 = objc_alloc(MEMORY[0x263EFF9A0]);
      v17 = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v14, v15, v16, 8);
      v18 = self->_properties;
      self->_properties = v17;

      id v19 = objc_alloc(MEMORY[0x263EFF9B0]);
      v22 = (NSMutableOrderedSet *)objc_msgSend_initWithCapacity_(v19, v20, v21, 8);
      propertyKeys = self->_propertyKeys;
      self->_propertyKeys = v22;

      properties = self->_properties;
    }
    objc_msgSend_setObject_forKeyedSubscript_(properties, v9, v10, v6, v26);
    objc_msgSend_addObject_(self->_propertyKeys, v24, v25, v26);
  }
}

- (void)addSignalHandler:(id)a3 signalTarget:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  signalHandlers = self->_signalHandlers;
  if (!signalHandlers)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v13 = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v10, v11, v12, 8);
    id v14 = self->_signalHandlers;
    self->_signalHandlers = v13;

    signalHandlers = self->_signalHandlers;
  }
  objc_msgSend_setObject_forKeyedSubscript_(signalHandlers, v6, v8, v15, v7);
}

- (void)addDeclaration:(id)a3
{
  objc_msgSend_addObject_(self->_declarations, a2, v3, a3);
}

- (void)addPropertyDeclaration:(id)a3 typeName:(id)a4 attributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [TMLPropertyDescriptor alloc];
  id v16 = (id)objc_msgSend_initWithName_typeName_attributes_(v11, v12, v13, v10, v9, v8);

  objc_msgSend_addDeclaration_(self, v14, v15, v16);
}

- (void)addSignalDeclaration:(id)a3 returnType:(id)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [TMLSignalDescriptor alloc];
  uint64_t v20 = objc_msgSend_typeForTypeName_(TMLTypeRegistry, v18, v19, v15);

  id v25 = (id)objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(v17, v21, v22, v16, v20, v14, v13, v12);
  objc_msgSend_addDeclaration_(self, v23, v24, v25);
}

- (void)addMethodDeclaration:(id)a3 returnType:(id)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7
{
  id v26 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  id v16 = [TMLMethodDescriptor alloc];
  uint64_t v19 = objc_msgSend_typeForTypeName_(TMLTypeRegistry, v17, v18, v15);

  double v22 = v13;
  if (!v13)
  {
    double v22 = objc_msgSend_methodSelectorForMethodName_parameters_(TMLMethodDescriptor, v20, v21, v26, v12);
  }
  objc_super v23 = objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(v16, v20, v21, v26, v19, v12, v22, v14);
  objc_msgSend_addDeclaration_(self, v24, v25, v23);

  if (!v13) {
}
  }

- (void)addConstructorDeclaration:(id)a3 parameters:(id)a4 methodSelector:(id)a5 attributes:(id)a6
{
  id v23 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [TMLMethodDescriptor alloc];
  uint64_t v17 = objc_msgSend_typeForTypeName_(TMLTypeRegistry, v14, v15, self->_type);
  uint64_t v19 = v11;
  if (!v11)
  {
    uint64_t v19 = objc_msgSend_methodSelectorForMethodName_parameters_(TMLMethodDescriptor, v16, v18, v23, v10);
  }
  uint64_t v20 = objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(v13, v16, v18, v23, v17, v10, v19, v12);
  objc_msgSend_addDeclaration_(self, v21, v22, v20);

  if (!v11) {
}
  }

- (void)addImplements:(id)a3
{
  v4 = (const char *)a3;
  implements = self->_implements;
  id v12 = (char *)v4;
  if (!implements)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF9C0]);
    id v10 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v7, v8, v9, 2);
    id v11 = self->_implements;
    self->_implements = v10;

    v4 = v12;
    implements = self->_implements;
  }
  objc_msgSend_addObject_(implements, v4, v5, v4);
}

- (void)addObject:(id)a3
{
  v4 = (const char *)a3;
  objects = self->_objects;
  id v12 = (char *)v4;
  if (!objects)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF980]);
    id v10 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    id v11 = self->_objects;
    self->_objects = v10;

    v4 = v12;
    objects = self->_objects;
  }
  objc_msgSend_addObject_(objects, v4, v5, v4);
}

- (void)applyCategory:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_declarations(v4, v5, v6);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_23988175C;
  v33[3] = &unk_264DAC318;
  v33[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v7, v8, v9, v33);

  id v12 = objc_msgSend_signalHandlers(v4, v10, v11);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_239881768;
  v32[3] = &unk_264DAEC50;
  v32[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v13, v14, v32);

  uint64_t v17 = objc_msgSend_properties(v4, v15, v16);
  uint64_t v20 = objc_msgSend_propertyKeys(v4, v18, v19);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = sub_239881774;
  v30[3] = &unk_264DAB788;
  v30[4] = self;
  id v31 = v17;
  id v21 = v17;
  objc_msgSend_enumerateObjectsUsingBlock_(v20, v22, v23, v30);

  id v26 = objc_msgSend_objects(v4, v24, v25);

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = sub_2398817E8;
  v29[3] = &unk_264DADE38;
  v29[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v26, v27, v28, v29);
}

- (id)propertyDeclaration:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_239881920;
  double v18 = sub_239881930;
  id v19 = 0;
  declarations = self->_declarations;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_239881938;
  v11[3] = &unk_264DABF70;
  id v6 = v4;
  id v12 = v6;
  id v13 = &v14;
  objc_msgSend_enumerateObjectsUsingBlock_(declarations, v7, v8, v11);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)signalDeclaration:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_239881920;
  double v18 = sub_239881930;
  id v19 = 0;
  declarations = self->_declarations;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_239881B1C;
  v11[3] = &unk_264DABF70;
  id v6 = v4;
  id v12 = v6;
  id v13 = &v14;
  objc_msgSend_enumerateObjectsUsingBlock_(declarations, v7, v8, v11);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5 = sub_2398530E4(a3);
  id v7 = (const char *)objc_msgSend_UTF8String(self->_type, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  identifier = self->_identifier;
  if (identifier)
  {
    double v11 = (const char *)objc_msgSend_UTF8String(identifier, v8, v9);
    identifier = strdup(v11);
  }
  *(void *)&a3[1].var1 = identifier;
  uint64_t v12 = objc_msgSend_count(self->_propertyKeys, v8, v9);
  a3[1].var2 = (ProtobufCMessageUnknownField *)v12;
  if (v12) {
    uint64_t v12 = (uint64_t)malloc_type_malloc(8 * v12, 0x2004093837F09uLL);
  }
  a3[2].var0 = (ProtobufCMessageDescriptor *)v12;
  propertyKeys = self->_propertyKeys;
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = sub_239882010;
  v68[3] = &unk_264DAEC78;
  v68[4] = self;
  v68[5] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(propertyKeys, v13, v14, v68);
  uint64_t v18 = objc_msgSend_count(self->_objects, v16, v17);
  a3[5].var0 = (ProtobufCMessageDescriptor *)v18;
  if (v18) {
    uint64_t v18 = (uint64_t)malloc_type_malloc(8 * v18, 0x2004093837F09uLL);
  }
  *(void *)&a3[5].var1 = v18;
  objects = self->_objects;
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = sub_239882264;
  v67[3] = &unk_264DAEC98;
  v67[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(objects, v19, v20, v67);
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
  declarations = self->_declarations;
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = sub_2398822DC;
  v64[3] = &unk_264DADC38;
  id v25 = v22;
  id v65 = v25;
  id v26 = v23;
  id v66 = v26;
  objc_msgSend_enumerateObjectsUsingBlock_(declarations, v27, v28, v64);
  uint64_t v31 = objc_msgSend_count(v25, v29, v30);
  a3[3].var0 = (ProtobufCMessageDescriptor *)v31;
  if (v31) {
    uint64_t v31 = (uint64_t)malloc_type_malloc(8 * v31, 0x2004093837F09uLL);
  }
  *(void *)&a3[3].var1 = v31;
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = sub_239882378;
  v63[3] = &unk_264DAB750;
  v63[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v25, v32, v33, v63);
  uint64_t v36 = objc_msgSend_count(v26, v34, v35);
  a3[3].var2 = (ProtobufCMessageUnknownField *)v36;
  if (v36) {
    uint64_t v36 = (uint64_t)malloc_type_malloc(8 * v36, 0x2004093837F09uLL);
  }
  a3[4].var0 = (ProtobufCMessageDescriptor *)v36;
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = sub_2398823F0;
  v62[3] = &unk_264DADB98;
  v62[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v26, v37, v38, v62);
  uint64_t v41 = objc_msgSend_count(self->_signalHandlers, v39, v40);
  *(void *)&a3[2].var1 = v41;
  if (v41) {
    uint64_t v41 = (uint64_t)malloc_type_malloc(8 * v41, 0x2004093837F09uLL);
  }
  a3[2].var2 = (ProtobufCMessageUnknownField *)v41;
  v44 = objc_msgSend_allKeys(self->_signalHandlers, v42, v43);
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = sub_239882468;
  v61[3] = &unk_264DAEC78;
  v61[4] = self;
  v61[5] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v44, v45, v46, v61);

  if (self->_initializer)
  {
    v49 = (ProtobufCMessageUnknownField *)malloc_type_malloc(0x30uLL, 0x10F004065BF17CFuLL);
    a3[5].var2 = v49;
    objc_msgSend_encode_(self->_initializer, v50, v51, v49);
  }
  if (objc_msgSend_count(self->_implements, v47, v48))
  {
    uint64_t v54 = objc_msgSend_count(self->_implements, v52, v53);
    a3[6].var0 = (ProtobufCMessageDescriptor *)v54;
    if (v54) {
      uint64_t v54 = (uint64_t)malloc_type_malloc(8 * v54, 0x80040B8603338uLL);
    }
    *(void *)&a3[6].var1 = v54;
    v57 = objc_msgSend_allObjects(self->_implements, v55, v56);
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = sub_23988252C;
    v60[3] = &unk_264DADB78;
    v60[4] = a3;
    objc_msgSend_enumerateObjectsUsingBlock_(v57, v58, v59, v60);
  }
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  uint64_t v6 = objc_msgSend_stringWithUTF8String_(NSString, a2, v3, a3[1].var0);
  id v7 = objc_alloc((Class)a1);
  v79 = (void *)v6;
  double v11 = objc_msgSend_initWithType_attributes_(v7, v8, v9, v6, 0);
  if (*(void *)&a3[1].var1)
  {
    id v13 = objc_msgSend_stringWithUTF8String_(NSString, v10, v12);
    objc_msgSend_addProperty_value_(v11, v14, v15, @"id", v13);
  }
  else
  {
    id v13 = 0;
    objc_msgSend_addProperty_value_(v11, v10, v12, @"id", 0);
  }
  if (a3[1].var2)
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = *((void *)&a3[2].var0->var0 + (void)v18);
      switch(*(_DWORD *)(v19 + 32))
      {
        case 0:
          uint64_t v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17);
          goto LABEL_16;
        case 1:
          uint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v16, v17, *(void *)(v19 + 40));
          goto LABEL_16;
        case 2:
          uint64_t v20 = objc_msgSend_numberWithInteger_(NSNumber, v16, v17, *(int *)(v19 + 52));
          goto LABEL_16;
        case 3:
          LODWORD(v17) = *(_DWORD *)(v19 + 68);
          uint64_t v20 = objc_msgSend_numberWithFloat_(NSNumber, v16, v17);
          goto LABEL_16;
        case 4:
          uint64_t v20 = objc_msgSend_numberWithBool_(NSNumber, v16, v17, *(_DWORD *)(v19 + 60) != 0);
          goto LABEL_16;
        case 5:
          id v22 = objc_opt_class();
          objc_msgSend_decode_(v22, v23, v24, *(void *)(v19 + 72));
          goto LABEL_15;
        case 6:
          id v25 = objc_opt_class();
          objc_msgSend_decode_(v25, v26, v27, *(void *)(v19 + 80));
          uint64_t v20 = LABEL_15:;
LABEL_16:
          id v21 = (void *)v20;
          break;
        default:
          id v21 = 0;
          break;
      }
      double v28 = objc_msgSend_stringWithUTF8String_(NSString, v16, v17, *(void *)(v19 + 24));
      objc_msgSend_addProperty_value_(v11, v29, v30, v28, v21);

      uint64_t v18 = (ProtobufCMessageUnknownField *)((char *)v18 + 1);
    }
    while (v18 < a3[1].var2);
  }
  if (a3[5].var0)
  {
    uint64_t v31 = 0;
    do
    {
      uint64_t v32 = *(void *)(*(void *)&a3[5].var1 + 8 * (void)v31);
      double v33 = objc_opt_class();
      uint64_t v36 = objc_msgSend_decode_(v33, v34, v35, v32);
      objc_msgSend_addObject_(v11, v37, v38, v36);

      uint64_t v31 = (ProtobufCMessageDescriptor *)((char *)v31 + 1);
    }
    while (v31 < a3[5].var0);
  }
  if (a3[3].var0)
  {
    v39 = 0;
    do
    {
      uint64_t v40 = *(void *)(*(void *)&a3[3].var1 + 8 * (void)v39);
      uint64_t v41 = objc_opt_class();
      v44 = objc_msgSend_decode_(v41, v42, v43, v40);
      objc_msgSend_addDeclaration_(v11, v45, v46, v44);

      v39 = (ProtobufCMessageDescriptor *)((char *)v39 + 1);
    }
    while (v39 < a3[3].var0);
  }
  if (a3[3].var2)
  {
    v47 = 0;
    do
    {
      uint64_t v48 = *((void *)&a3[4].var0->var0 + (void)v47);
      v49 = objc_opt_class();
      v52 = objc_msgSend_decode_(v49, v50, v51, v48);
      objc_msgSend_addDeclaration_(v11, v53, v54, v52);

      v47 = (ProtobufCMessageUnknownField *)((char *)v47 + 1);
    }
    while (v47 < a3[3].var2);
  }
  if (*(void *)&a3[2].var1)
  {
    unint64_t v55 = 0;
    do
    {
      uint64_t v56 = *((void *)a3[2].var2 + v55);
      v57 = objc_opt_class();
      v60 = objc_msgSend_decode_(v57, v58, v59, v56);
      v63 = objc_msgSend_stringWithUTF8String_(NSString, v61, v62, *(void *)(v56 + 48));
      objc_msgSend_addSignalHandler_signalTarget_(v11, v64, v65, v60, v63);

      ++v55;
    }
    while (v55 < *(void *)&a3[2].var1);
  }
  if (a3[5].var2)
  {
    id v66 = objc_opt_class();
    v69 = objc_msgSend_decode_(v66, v67, v68, a3[5].var2);
    objc_msgSend_setInitializer_(v11, v70, v71, v69);
  }
  else
  {
    objc_msgSend_setInitializer_(v11, v16, v17, 0);
  }
  if (a3[6].var0)
  {
    v74 = 0;
    do
    {
      v75 = objc_msgSend_stringWithUTF8String_(NSString, v72, v73, *(void *)(*(void *)&a3[6].var1 + 8 * (void)v74));
      objc_msgSend_addImplements_(v11, v76, v77, v75);

      v74 = (ProtobufCMessageDescriptor *)((char *)v74 + 1);
    }
    while (v74 < a3[6].var0);
  }

  return v11;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)properties
{
  return &self->_properties->super;
}

- (NSOrderedSet)propertyKeys
{
  return &self->_propertyKeys->super;
}

- (NSDictionary)signalHandlers
{
  return &self->_signalHandlers->super;
}

- (NSArray)declarations
{
  return &self->_declarations->super;
}

- (NSArray)objects
{
  return &self->_objects->super;
}

- (TMLValueExpression)initializer
{
  return self->_initializer;
}

- (void)setInitializer:(id)a3
{
}

- (NSSet)implements
{
  return &self->_implements->super;
}

- (NSSet)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_initializer, 0);
  objc_storeStrong((id *)&self->_implements, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_declarations, 0);
  objc_storeStrong((id *)&self->_signalHandlers, 0);
  objc_storeStrong((id *)&self->_propertyKeys, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end