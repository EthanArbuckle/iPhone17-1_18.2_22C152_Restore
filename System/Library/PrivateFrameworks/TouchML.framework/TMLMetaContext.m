@interface TMLMetaContext
+ (id)convertObject:(id)a3 toClass:(id)a4;
+ (id)convertObject:(id)a3 toProtocol:(id)a4;
+ (id)decode:(const ProtobufCMessage *)a3;
+ (id)deserializeFromData:(id)a3;
- (NSArray)categories;
- (NSArray)exports;
- (NSDictionary)classes;
- (NSDictionary)functions;
- (NSDictionary)objects;
- (NSDictionary)protocols;
- (NSSet)requires;
- (TMLMetaContext)init;
- (TMLMetaObject)rootObject;
- (id)findParentForObjectWithIdentifier:(id)a3;
- (id)serializedData;
- (void)addClass:(id)a3;
- (void)addExports:(id)a3;
- (void)addFunction:(id)a3;
- (void)addObject:(id)a3;
- (void)addObjectAsClass:(id)a3;
- (void)addObjectAsProtocol:(id)a3;
- (void)addProtocol:(id)a3;
- (void)addRequire:(id)a3;
- (void)commit;
- (void)encode:(ProtobufCMessage *)a3;
- (void)removeCategories;
- (void)removeClasses;
- (void)removeFunctions;
@end

@implementation TMLMetaContext

- (TMLMetaContext)init
{
  v29.receiver = self;
  v29.super_class = (Class)TMLMetaContext;
  v2 = [(TMLMetaContext *)&v29 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v6 = objc_msgSend_initWithCapacity_(v3, v4, v5, 16);
    objects = v2->_objects;
    v2->_objects = (NSMutableDictionary *)v6;

    id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v11 = objc_msgSend_initWithCapacity_(v8, v9, v10, 4);
    classes = v2->_classes;
    v2->_classes = (NSMutableDictionary *)v11;

    id v13 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v16 = objc_msgSend_initWithCapacity_(v13, v14, v15, 4);
    protocols = v2->_protocols;
    v2->_protocols = (NSMutableDictionary *)v16;

    id v18 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v21 = objc_msgSend_initWithCapacity_(v18, v19, v20, 16);
    functions = v2->_functions;
    v2->_functions = (NSMutableDictionary *)v21;

    id v23 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v26 = objc_msgSend_initWithCapacity_(v23, v24, v25, 16);
    categories = v2->_categories;
    v2->_categories = (NSMutableArray *)v26;
  }
  return v2;
}

- (TMLMetaObject)rootObject
{
  if (self->_rootObjectIdentifier) {
    return (TMLMetaObject *)objc_msgSend_objectForKeyedSubscript_(self->_objects, a2, v2, self->_rootObjectIdentifier);
  }
  else {
    return (TMLMetaObject *)objc_msgSend_objectForKeyedSubscript_(self->_objects, a2, v2, &stru_26ECF02A8);
  }
}

- (void)addObject:(id)a3
{
  id v33 = a3;
  uint64_t v6 = objc_msgSend_type(v33, v4, v5);
  int isEqualToString = objc_msgSend_isEqualToString_(v6, v7, v8, @"Class");

  if (isEqualToString)
  {
    objc_msgSend_addObjectAsClass_(self, v10, v11, v33);
  }
  else
  {
    v12 = objc_msgSend_type(v33, v10, v11);
    int v15 = objc_msgSend_isEqualToString_(v12, v13, v14, @"Protocol");

    if (v15)
    {
      objc_msgSend_addObjectAsProtocol_(self, v16, v17, v33);
    }
    else
    {
      id v18 = objc_msgSend_type(v33, v16, v17);
      int v21 = objc_msgSend_isEqualToString_(v18, v19, v20, @"Category");

      if (v21)
      {
        objc_msgSend_addObject_(self->_categories, v22, v23, v33);
      }
      else
      {
        if (!self->_rootObjectIdentifier)
        {
          v24 = objc_msgSend_identifier(v33, v22, v23);
          v27 = (NSString *)objc_msgSend_copy(v24, v25, v26);
          rootObjectIdentifier = self->_rootObjectIdentifier;
          self->_rootObjectIdentifier = v27;
        }
        objects = self->_objects;
        v30 = objc_msgSend_identifier(v33, v22, v23);
        objc_msgSend_setObject_forKey_(objects, v31, v32, v33, v30);
      }
    }
  }
}

- (void)commit
{
  id v3 = objc_alloc_init(MEMORY[0x263F089C8]);
  categories = self->_categories;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = sub_239882D54;
  id v13 = &unk_264DADC60;
  double v14 = self;
  id v15 = v3;
  id v5 = v3;
  objc_msgSend_enumerateObjectsUsingBlock_(categories, v6, v7, &v10);
  objc_msgSend_removeObjectsAtIndexes_(self->_categories, v8, v9, v5, v10, v11, v12, v13, v14);
}

- (void)removeClasses
{
  self->_classes = 0;
  MEMORY[0x270F9A758]();
}

- (void)removeFunctions
{
  self->_functions = 0;
  MEMORY[0x270F9A758]();
}

- (void)removeCategories
{
  self->_categories = 0;
  MEMORY[0x270F9A758]();
}

+ (id)convertObject:(id)a3 toClass:(id)a4
{
  id v5 = a3;
  id v7 = a4;
  if (!v7)
  {
    double v9 = [TMLClassDescriptor alloc];
    v12 = objc_msgSend_identifier(v5, v10, v11);
    id v15 = objc_msgSend_properties(v5, v13, v14);
    id v18 = objc_msgSend_objectForKeyedSubscript_(v15, v16, v17, @"superclass");
    int v21 = objc_msgSend_initializer(v5, v19, v20);
    v24 = objc_msgSend_attributes(v5, v22, v23);
    uint64_t v27 = objc_msgSend_containsObject_(v24, v25, v26, @"optional");
    id v7 = (id)objc_msgSend_initWithName_superClassName_initializer_optional_(v9, v28, v29, v12, v18, v21, v27);

    double v32 = objc_msgSend_properties(v5, v30, v31);
    v35 = objc_msgSend_objectForKeyedSubscript_(v32, v33, v34, @"nativeclass");
    objc_msgSend_setObjcClassName_(v7, v36, v37, v35);
  }
  v38 = objc_msgSend_declarations(v5, v6, v8);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_239882FD0;
  v43[3] = &unk_264DAC318;
  id v39 = v7;
  id v44 = v39;
  objc_msgSend_enumerateObjectsUsingBlock_(v38, v40, v41, v43);

  return v39;
}

- (void)addObjectAsClass:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  classes = self->_classes;
  double v9 = objc_msgSend_identifier(v4, v7, v8);
  v12 = objc_msgSend_objectForKeyedSubscript_(classes, v10, v11, v9);
  id v15 = objc_msgSend_convertObject_toClass_(v5, v13, v14, v4, v12);

  id v18 = objc_msgSend_objects(v4, v16, v17);

  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  double v26 = sub_2398831B4;
  uint64_t v27 = &unk_264DADC60;
  v28 = self;
  id v29 = v15;
  id v19 = v15;
  objc_msgSend_enumerateObjectsUsingBlock_(v18, v20, v21, &v24);

  objc_msgSend_addClass_(self, v22, v23, v19, v24, v25, v26, v27, v28);
}

+ (id)convertObject:(id)a3 toProtocol:(id)a4
{
  id v5 = a3;
  id v7 = a4;
  if (!v7)
  {
    double v9 = [TMLProtocolDescriptor alloc];
    v12 = objc_msgSend_identifier(v5, v10, v11);
    id v15 = objc_msgSend_implements(v5, v13, v14);
    id v7 = (id)objc_msgSend_initWithName_implementsProtocols_(v9, v16, v17, v12, v15);

    double v20 = objc_msgSend_properties(v5, v18, v19);
    double v23 = objc_msgSend_objectForKeyedSubscript_(v20, v21, v22, @"nativeclass");
    objc_msgSend_setObjcProtocolName_(v7, v24, v25, v23);
  }
  double v26 = objc_msgSend_declarations(v5, v6, v8);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_239883450;
  v31[3] = &unk_264DAC318;
  id v27 = v7;
  id v32 = v27;
  objc_msgSend_enumerateObjectsUsingBlock_(v26, v28, v29, v31);

  return v27;
}

- (void)addObjectAsProtocol:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  protocols = self->_protocols;
  double v9 = objc_msgSend_identifier(v4, v7, v8);
  v12 = objc_msgSend_objectForKeyedSubscript_(protocols, v10, v11, v9);
  objc_msgSend_convertObject_toProtocol_(v5, v13, v14, v4, v12);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addProtocol_(self, v15, v16, v17);
}

- (void)addClass:(id)a3
{
  classes = self->_classes;
  id v4 = a3;
  objc_msgSend_className(v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(classes, v7, v8, v4, v9);
}

- (void)addProtocol:(id)a3
{
  protocols = self->_protocols;
  id v4 = a3;
  objc_msgSend_protocolName(v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(protocols, v7, v8, v4, v9);
}

- (void)addFunction:(id)a3
{
  functions = self->_functions;
  id v4 = a3;
  objc_msgSend_functionName(v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(functions, v7, v8, v4, v9);
}

- (void)addExports:(id)a3
{
  id v4 = (const char *)a3;
  exports = self->_exports;
  v12 = (char *)v4;
  if (!exports)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v10 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    double v11 = self->_exports;
    self->_exports = v10;

    id v4 = v12;
    exports = self->_exports;
  }
  objc_msgSend_addObjectsFromArray_(exports, v4, v5, v4);
}

- (void)addRequire:(id)a3
{
  id v4 = (const char *)a3;
  requires = self->_requires;
  v12 = (char *)v4;
  if (!requires)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF9C0]);
    uint64_t v10 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    double v11 = self->_requires;
    self->_requires = v10;

    id v4 = v12;
    requires = self->_requires;
  }
  objc_msgSend_addObject_(requires, v4, v5, v4);
}

- (id)findParentForObjectWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_2398838CC;
  id v18 = sub_2398838DC;
  id v19 = 0;
  objects = self->_objects;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2398838E4;
  v11[3] = &unk_264DAECF0;
  id v6 = v4;
  id v12 = v6;
  id v13 = &v14;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(objects, v7, v8, v11);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5 = sub_239852AD4((uint64_t)a3);
  id v7 = objc_msgSend_allValues(self->_classes, v6, v5);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);
  a3[1].var0 = (ProtobufCMessageDescriptor *)v10;
  if (v10) {
    uint64_t v10 = (uint64_t)malloc_type_malloc(8 * v10, 0x2004093837F09uLL);
  }
  *(void *)&a3[1].var1 = v10;
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = sub_239883D9C;
  v60[3] = &unk_264DAEB88;
  v60[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v7, v11, v12, v60);
  id v15 = objc_msgSend_allValues(self->_objects, v13, v14);
  id v18 = objc_msgSend_mutableCopy(v15, v16, v17);

  double v21 = objc_msgSend_rootObject(self, v19, v20);
  uint64_t v24 = objc_msgSend_indexOfObjectIdenticalTo_(v18, v22, v23, v21);

  if (v24 && v24 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(v18, v25, v26, v24, 0);
  }
  objc_msgSend_addObjectsFromArray_(v18, v25, v26, self->_categories);
  uint64_t v29 = objc_msgSend_count(v18, v27, v28);
  a3[1].var2 = (ProtobufCMessageUnknownField *)v29;
  if (v29) {
    uint64_t v29 = (uint64_t)malloc_type_malloc(8 * v29, 0x2004093837F09uLL);
  }
  a3[2].var0 = (ProtobufCMessageDescriptor *)v29;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = sub_239883E14;
  v59[3] = &unk_264DAEC98;
  v59[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v18, v30, v31, v59);
  double v34 = objc_msgSend_allValues(self->_functions, v32, v33);
  uint64_t v37 = objc_msgSend_count(v34, v35, v36);
  *(void *)&a3[2].var1 = v37;
  if (v37) {
    uint64_t v37 = (uint64_t)malloc_type_malloc(8 * v37, 0x2004093837F09uLL);
  }
  a3[2].var2 = (ProtobufCMessageUnknownField *)v37;
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = sub_239883E8C;
  v58[3] = &unk_264DAED10;
  v58[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v34, v38, v39, v58);
  v42 = objc_msgSend_allValues(self->_protocols, v40, v41);
  uint64_t v45 = objc_msgSend_count(v42, v43, v44);
  a3[3].var0 = (ProtobufCMessageDescriptor *)v45;
  if (v45) {
    uint64_t v45 = (uint64_t)malloc_type_malloc(8 * v45, 0x2004093837F09uLL);
  }
  *(void *)&a3[3].var1 = v45;
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = sub_239883F04;
  v57[3] = &unk_264DAED30;
  v57[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v42, v46, v47, v57);
  v50 = objc_msgSend_allObjects(self->_requires, v48, v49);
  uint64_t v53 = objc_msgSend_count(v50, v51, v52);
  a3[3].var2 = (ProtobufCMessageUnknownField *)v53;
  if (v53) {
    uint64_t v53 = (uint64_t)malloc_type_malloc(8 * v53, 0x80040B8603338uLL);
  }
  a3[4].var0 = (ProtobufCMessageDescriptor *)v53;
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = sub_239883F7C;
  v56[3] = &unk_264DADB78;
  v56[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v50, v54, v55, v56);
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  id v5 = objc_alloc_init((Class)a1);
  if (a3[1].var0)
  {
    id v7 = 0;
    do
    {
      uint64_t v8 = *(void *)(*(void *)&a3[1].var1 + 8 * (void)v7);
      double v9 = objc_opt_class();
      double v12 = objc_msgSend_decode_(v9, v10, v11, v8);
      objc_msgSend_addClass_(v5, v13, v14, v12);

      id v7 = (ProtobufCMessageDescriptor *)((char *)v7 + 1);
    }
    while (v7 < a3[1].var0);
  }
  if (a3[3].var0)
  {
    id v15 = 0;
    do
    {
      uint64_t v16 = *(void *)(*(void *)&a3[3].var1 + 8 * (void)v15);
      double v17 = objc_opt_class();
      double v20 = objc_msgSend_decode_(v17, v18, v19, v16);
      objc_msgSend_addProtocol_(v5, v21, v22, v20);

      id v15 = (ProtobufCMessageDescriptor *)((char *)v15 + 1);
    }
    while (v15 < a3[3].var0);
  }
  if (a3[1].var2)
  {
    double v23 = 0;
    do
    {
      uint64_t v24 = *((void *)&a3[2].var0->var0 + (void)v23);
      double v25 = objc_opt_class();
      double v28 = objc_msgSend_decode_(v25, v26, v27, v24);
      objc_msgSend_addObject_(v5, v29, v30, v28);

      double v23 = (ProtobufCMessageUnknownField *)((char *)v23 + 1);
    }
    while (v23 < a3[1].var2);
  }
  if (*(void *)&a3[2].var1)
  {
    unint64_t v31 = 0;
    do
    {
      uint64_t v32 = *((void *)a3[2].var2 + v31);
      double v33 = objc_opt_class();
      double v36 = objc_msgSend_decode_(v33, v34, v35, v32);
      objc_msgSend_addFunction_(v5, v37, v38, v36);

      ++v31;
    }
    while (v31 < *(void *)&a3[2].var1);
  }
  if (a3[3].var2)
  {
    double v39 = 0;
    do
    {
      v40 = objc_msgSend_stringWithUTF8String_(NSString, v4, v6, *((void *)&a3[4].var0->var0 + (void)v39));
      objc_msgSend_addRequire_(v5, v41, v42, v40);

      double v39 = (ProtobufCMessageUnknownField *)((char *)v39 + 1);
    }
    while (v39 < a3[3].var2);
  }
  return v5;
}

- (id)serializedData
{
  id v3 = (void **)malloc_type_malloc(0x68uLL, 0x10E0040650DB1CFuLL);
  objc_msgSend_encode_(self, v4, v5, v3);
  uint64_t v8 = objc_msgSend_pack_(TMLModelSerialize, v6, v7, v3);
  sub_239852BCC(v3, 0);
  return v8;
}

+ (id)deserializeFromData:(id)a3
{
  uint64_t v5 = objc_msgSend_unpackData_withDescriptor_(TMLModelSerialize, a2, v3, a3, &unk_26ECEBFD8);
  if (v5)
  {
    uint64_t v8 = (void **)v5;
    double v9 = objc_msgSend_decode_(a1, v6, v7, v5);
    sub_239852BCC(v8, 0);
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

- (NSDictionary)objects
{
  return &self->_objects->super;
}

- (NSDictionary)classes
{
  return &self->_classes->super;
}

- (NSDictionary)protocols
{
  return &self->_protocols->super;
}

- (NSDictionary)functions
{
  return &self->_functions->super;
}

- (NSArray)exports
{
  return &self->_exports->super;
}

- (NSArray)categories
{
  return &self->_categories->super;
}

- (NSSet)requires
{
  return &self->_requires->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requires, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_exports, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_storeStrong((id *)&self->_rootObjectIdentifier, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_protocols, 0);
  objc_storeStrong((id *)&self->_classes, 0);
}

@end