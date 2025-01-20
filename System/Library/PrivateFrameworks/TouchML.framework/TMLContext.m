@interface TMLContext
+ (BOOL)loadClasses:(id)a3;
+ (BOOL)loadClasses:(id)a3 path:(id)a4;
+ (BOOL)loadClassesFromPath:(id)a3;
+ (Class)createClassFromPath:(id)a3;
+ (id)cloneContext:(id)a3 objects:(id)a4;
+ (id)currentContext;
+ (id)loadMetaContextWithSource:(id)a3 path:(id)a4 options:(unint64_t)a5;
+ (void)addGloballyRequiredModules:(id)a3;
+ (void)initialize;
+ (void)initializeJSContext:(id)a3;
- (BOOL)loadSource:(id)a3;
- (BOOL)loadSource:(id)a3 path:(id)a4;
- (BOOL)loadSourceFromPath:(id)a3;
- (BOOL)raiseException:(id)a3;
- (BOOL)valid;
- (NSDictionary)allObjects;
- (NSObject)rootObject;
- (TMLContext)init;
- (TMLContext)initWithOptions:(unint64_t)a3;
- (id)apiObject;
- (id)applyProperties:(id)a3 inOrder:(id)a4 toObject:(id)a5;
- (id)callFunction:(id)a3 arguments:(id)a4 returnType:(unint64_t)a5;
- (id)createObjectFromMetaObject:(id)a3 parent:(id)a4;
- (id)didCreateObject:(id)a3;
- (id)evaluateExpression:(id)a3 ofType:(unint64_t)a4 withBindings:(id)a5;
- (id)existingObjectWithIdentifier:(id)a3;
- (id)metaContext;
- (id)objectWithIdentifier:(id)a3;
- (id)objectWithIdentifier:(id)a3 unwrapWeak:(BOOL)a4;
- (id)objectWithIdentifier:(id)a3 unwrapWeak:(BOOL)a4 createIfMissing:(BOOL)a5;
- (id)objectWithIdentifierNoCreate:(id)a3;
- (id)objectsOfType:(id)a3;
- (id)processValue:(id)a3 ofType:(unint64_t)a4 selfValue:(id)a5;
- (void)addObject:(id)a3 withIdentifier:(id)a4;
- (void)addObjectReference:(id)a3;
- (void)attachToAPIObject;
- (void)callFunction:(id)a3 arguments:(id)a4;
- (void)dealloc;
- (void)dispose;
- (void)disposeIfNecessary;
- (void)initializeJSContext;
- (void)initializeWithCloneContext:(id)a3;
- (void)initizalizeContext;
- (void)makeWeakObjectWithIdentifier:(id)a3;
- (void)raiseJSException:(id)a3;
- (void)requireModule:(id)a3;
- (void)resetException;
- (void)resetJSException;
@end

@implementation TMLContext

+ (void)initialize
{
}

- (TMLContext)init
{
  return (TMLContext *)objc_msgSend_initWithOptions_(self, a2, v2, 1);
}

- (TMLContext)initWithOptions:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TMLContext;
  v4 = [(TMLContext *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    id v6 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v9 = objc_msgSend_initWithCapacity_(v6, v7, v8, 16);
    objects = v5->_objects;
    v5->_objects = (NSMutableDictionary *)v9;
  }
  return v5;
}

- (void)dealloc
{
  objc_msgSend_dispose(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)TMLContext;
  [(TMLContext *)&v4 dealloc];
}

- (void)disposeIfNecessary
{
  if (!self->_beingDisposed) {
    objc_msgSend_dispose(self, a2, v2);
  }
}

- (void)dispose
{
  self->_beingDisposed = 1;
  if (self->_jsContext) {
    objc_msgSend_callFunction_arguments_(self, a2, v2, @"onunload", 0);
  }
  objc_msgSend_makeObjectsPerformSelector_(self->_signalHandlers, a2, v2, sel_detach);
  signalHandlers = self->_signalHandlers;
  self->_signalHandlers = 0;

  contextObjects = self->_contextObjects;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = sub_23985E280;
  v38[3] = &unk_264DADBC0;
  v38[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(contextObjects, v6, COERCE_DOUBLE(3221225472), v38);
  v7 = self->_contextObjects;
  self->_contextObjects = 0;

  objects = self->_objects;
  self->_objects = 0;

  jsContext = self->_jsContext;
  if (self->_apiObject && jsContext)
  {
    objc_super v12 = objc_msgSend_valueWithUndefinedInContext_(MEMORY[0x263F10390], v9, v10);
    v15 = objc_msgSend_objectForKeyedSubscript_(self->_apiObject, v13, v14, @"_$ctxs");
    if (objc_msgSend_isArray(v15, v16, v17))
    {
      v20 = objc_msgSend_toArray(v15, v18, v19);
      apiObject = objc_msgSend_mutableCopy(v20, v21, v22);

      objc_msgSend_removeObject_(apiObject, v24, v25, self);
      if (objc_msgSend_count(apiObject, v26, v27))
      {
        v30 = objc_msgSend_valueWithObject_inContext_(MEMORY[0x263F10390], v28, v29, apiObject, self->_jsContext);
        objc_msgSend_setObject_forKeyedSubscript_(self->_apiObject, v31, v32, v30, @"_$ctxs");

LABEL_10:
        jsContext = self->_jsContext;
        goto LABEL_11;
      }
      objc_msgSend_setObject_forKeyedSubscript_(self->_apiObject, v28, v29, v12, @"_$ctxs");
    }
    v33 = objc_msgSend_globalObject(self->_jsContext, v18, v19);
    objc_msgSend_setObject_forKeyedSubscript_(v33, v34, v35, v12, self->_apiObjectKey);

    apiObjectKey = self->_apiObjectKey;
    self->_apiObjectKey = 0;

    apiObject = self->_apiObject;
    self->_apiObject = 0;
    goto LABEL_10;
  }
LABEL_11:
  self->_jsContext = 0;

  metaContext = self->_metaContext;
  self->_metaContext = 0;
}

- (id)apiObject
{
  return self->_apiObject;
}

- (BOOL)valid
{
  return self->_metaContext != 0;
}

- (id)metaContext
{
  return self->_metaContext;
}

- (BOOL)raiseException:(id)a3
{
  v5 = (NSException *)a3;
  if (self->_jsEvaluationException == v5) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&self->_jsEvaluationException, a3);
  if ((objc_msgSend_valid(self, v6, v7) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x263F10390];
    objc_super v12 = objc_msgSend_currentContext(MEMORY[0x263F10378], v8, v9);
    v15 = objc_msgSend_valueWithNewErrorFromMessage_inContext_(v11, v13, v14, @"Disposed TML context", v12);
    v18 = objc_msgSend_currentContext(MEMORY[0x263F10378], v16, v17);
    objc_msgSend_setException_(v18, v19, v20, v15);

LABEL_5:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (void)resetJSException
{
  objc_super v4 = objc_msgSend_name(self->_jsEvaluationException, a2, v2);
  int isEqualToString = objc_msgSend_isEqualToString_(v4, v5, v6, @"TMLJSException");

  if (isEqualToString)
  {
    objc_msgSend_resetException(self, v8, v9);
  }
}

- (void)resetException
{
  self->_jsEvaluationException = 0;
  MEMORY[0x270F9A758]();
}

- (void)raiseJSException:(id)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, v6, @"stack");
  BOOL v10 = objc_msgSend_toString(v7, v8, v9);
  v13 = objc_msgSend_componentsSeparatedByString_(v10, v11, v12, @"\n");
  v16 = objc_msgSend_mutableCopy(v13, v14, v15);

  if (v16)
  {
    double v19 = objc_msgSend_firstObject(v16, v17, v18);
    double v20 = NSString;
    v23 = objc_msgSend_objectForKeyedSubscript_(v4, v21, v22, @"line");
    v26 = objc_msgSend_toString(v23, v24, v25);
    double v29 = objc_msgSend_stringWithFormat_(v20, v27, v28, @"%@:#%@", v19, v26);
    objc_msgSend_replaceObjectAtIndex_withObject_(v16, v30, v31, 0, v29);
  }
  id v32 = objc_alloc(MEMORY[0x263EFF940]);
  double v35 = objc_msgSend_toString(v4, v33, v34);
  v44 = @"stack";
  v45[0] = v16;
  v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v36, v37, v45, &v44, 1);
  v41 = objc_msgSend_initWithName_reason_userInfo_(v32, v39, v40, @"TMLJSException", v35, v38);
  objc_msgSend_raiseException_(self, v42, v43, v41);
}

- (BOOL)loadSource:(id)a3
{
  return objc_msgSend_loadSource_path_(self, a2, v3, a3, 0);
}

- (BOOL)loadSourceFromPath:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF8F8];
  id v5 = a3;
  double v8 = objc_msgSend_dataWithContentsOfFile_(v4, v6, v7, v5);
  LOBYTE(self) = objc_msgSend_loadSource_path_(self, v9, v10, v8, v5);

  return (char)self;
}

- (BOOL)loadSource:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_opt_class();
  v11 = objc_msgSend_loadMetaContextWithSource_path_options_(v8, v9, v10, v6, v7, self->_options);
  if (v11)
  {
    objc_storeStrong((id *)&self->_metaContext, v11);
    objc_msgSend_initizalizeContext(self, v12, v13);
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)initializeWithCloneContext:(id)a3
{
  id v33 = a3;
  objc_msgSend_metaContext(v33, v4, v5);
  id v6 = (TMLMetaContext *)objc_claimAutoreleasedReturnValue();
  metaContext = self->_metaContext;
  self->_metaContext = v6;

  self->_options |= 8uLL;
  objc_msgSend_jsContext(v33, v8, v9);
  double v10 = (JSContext *)objc_claimAutoreleasedReturnValue();
  jsContext = self->_jsContext;
  self->_jsContext = v10;

  objc_msgSend_apiObject(v33, v12, v13);
  BOOL v14 = (JSValue *)objc_claimAutoreleasedReturnValue();
  apiObject = self->_apiObject;
  self->_apiObject = v14;

  objc_msgSend_apiObjectKey(v33, v16, v17);
  double v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  apiObjectKey = self->_apiObjectKey;
  self->_apiObjectKey = v18;

  objc_msgSend_initizalizeContext(self, v20, v21);
  v24 = objc_msgSend_jsContext(v33, v22, v23);

  if (!v24) {
    objc_msgSend_setJsContext_(v33, v25, v26, self->_jsContext);
  }
  double v27 = objc_msgSend_apiObject(v33, v25, v26);

  if (!v27) {
    objc_msgSend_setApiObject_(v33, v28, v29, self->_apiObject);
  }
  v30 = objc_msgSend_apiObjectKey(v33, v28, v29);

  if (!v30) {
    objc_msgSend_setApiObjectKey_(v33, v31, v32, self->_apiObjectKey);
  }
}

+ (id)loadMetaContextWithSource:(id)a3 path:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v7 = a3;
  id v8 = a4;
  double v12 = objc_msgSend_decode_(TMLModelSerialize, v9, v10, v7);
  if (v12)
  {
    objc_msgSend_deserializeFromData_(TMLMetaContext, v11, v13, v12);
    BOOL v14 = (TMLMetaContext *)objc_claimAutoreleasedReturnValue();
    if (v14) {
      goto LABEL_12;
    }
    goto LABEL_5;
  }
  if ((v5 & 4) == 0)
  {
LABEL_5:
    double v15 = objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v11, v13, @"TMLRuntimeException", @"Malformed format error", 0);
    objc_msgSend_raiseException_(TMLExceptionHandler, v16, v17, v15);
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  BOOL v14 = objc_alloc_init(TMLMetaContext);
  double v18 = [TMLParser alloc];
  double v15 = objc_msgSend_initWithContext_(v18, v19, v20, v14);
  objc_msgSend_addPreprocessorMacro_(v15, v21, v22, @"TARGET_OS_IPHONE");
  objc_msgSend_addPreprocessorMacro_(v15, v23, v24, @"TARGET_OS_IOS");
  id v25 = [NSString alloc];
  double v29 = objc_msgSend_initWithData_encoding_(v25, v26, v27, v7, 4);
  if (!v29
    || (objc_msgSend_stringByDeletingLastPathComponent(v8, v28, v30),
        double v31 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_lastPathComponent(v8, v32, v33),
        double v34 = objc_claimAutoreleasedReturnValue(),
        char v37 = objc_msgSend_parseString_basePath_filename_(v15, v35, v36, v29, v31, v34),
        v34,
        v31,
        (v37 & 1) == 0))
  {
    v38 = (void *)MEMORY[0x263EFF940];
    v39 = objc_msgSend_error(v15, v28, v30);
    v42 = objc_msgSend_exceptionWithName_reason_userInfo_(v38, v40, v41, @"TMLRuntimeException", v39, 0);
    objc_msgSend_raiseException_(TMLExceptionHandler, v43, v44, v42);

    double v15 = v14;
    goto LABEL_10;
  }

LABEL_11:
LABEL_12:

  return v14;
}

+ (BOOL)loadClasses:(id)a3
{
  return objc_msgSend_loadClasses_path_(a1, a2, v3, a3, 0);
}

+ (BOOL)loadClassesFromPath:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF8F8];
  id v5 = a3;
  id v8 = objc_msgSend_dataWithContentsOfFile_(v4, v6, v7, v5);
  LOBYTE(a1) = objc_msgSend_loadClasses_path_(a1, v9, v10, v8, v5);

  return (char)a1;
}

+ (BOOL)loadClasses:(id)a3 path:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [TMLContext alloc];
  double v10 = objc_msgSend_initWithOptions_(v7, v8, v9, 3);
  char Source_path = objc_msgSend_loadSource_path_(v10, v11, v12, v6, v5);

  return Source_path;
}

+ (Class)createClassFromPath:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF8F8];
  id v5 = a3;
  id v8 = objc_msgSend_dataWithContentsOfFile_(v4, v6, v7, v5);
  v11 = objc_msgSend_loadMetaContextWithSource_path_options_(a1, v9, v10, v8, v5, 1);

  double v12 = [TMLCloneContext alloc];
  double v15 = objc_msgSend_initWithMetaContext_(v12, v13, v14, v11);
  Class = objc_msgSend_createClass_(TMLRuntime, v16, v17, v15);
  double v21 = objc_msgSend_currentContext(TMLJSEnvironment, v19, v20);
  objc_msgSend_addObjectReference_(v21, v22, v23, Class);

  double v24 = Class;
  return v24;
}

+ (id)cloneContext:(id)a3 objects:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_23985EE04;
  v15[3] = &unk_264DAC1A8;
  id v9 = v8;
  id v16 = v9;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v10, v11, v15);

  objc_msgSend_initializeWithCloneContext_(v9, v12, v13, v7);
  return v9;
}

- (NSObject)rootObject
{
  id v4 = objc_msgSend_rootObject(self->_metaContext, a2, v2);
  id v7 = objc_msgSend_identifier(v4, v5, v6);
  double v10 = objc_msgSend_objectWithIdentifier_(self, v8, v9, v7);

  return v10;
}

- (NSDictionary)allObjects
{
  double v3 = objc_msgSend_copy(self->_objects, a2, v2);
  return (NSDictionary *)v3;
}

- (id)existingObjectWithIdentifier:(id)a3
{
  id v4 = objc_msgSend_objectForKeyedSubscript_(self->_objects, a2, v3, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend_object(v4, v5, v6);

    id v4 = (void *)v7;
  }
  return v4;
}

- (void)addObjectReference:(id)a3
{
  objc_msgSend_addObject_(self->_contextObjects, a2, v3, a3);
}

- (id)objectWithIdentifier:(id)a3
{
  return (id)objc_msgSend_objectWithIdentifier_unwrapWeak_(self, a2, v3, a3, 1);
}

- (id)objectWithIdentifierNoCreate:(id)a3
{
  return (id)((uint64_t (*)(TMLContext *, char *))MEMORY[0x270F9A6D0])(self, sel_objectWithIdentifier_unwrapWeak_createIfMissing_);
}

- (id)objectWithIdentifier:(id)a3 unwrapWeak:(BOOL)a4
{
  return (id)((uint64_t (*)(TMLContext *, char *))MEMORY[0x270F9A6D0])(self, sel_objectWithIdentifier_unwrapWeak_createIfMissing_);
}

- (id)objectWithIdentifier:(id)a3 unwrapWeak:(BOOL)a4 createIfMissing:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  double v12 = objc_msgSend_objectForKeyedSubscript_(self->_objects, v9, v10, v8);
  if (v12) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = !v5;
  }
  if (!v14)
  {
    double v15 = objc_msgSend_objects(self->_metaContext, v11, v13);
    double v18 = objc_msgSend_objectForKeyedSubscript_(v15, v16, v17, v8);

    if (v18)
    {
      double v12 = objc_msgSend_createObjectFromMetaObject_parent_(self, v19, v20, v18, 0);
LABEL_10:

      goto LABEL_11;
    }
    double v21 = objc_msgSend_findParentForObjectWithIdentifier_(self->_metaContext, v19, v20, v8);
    double v24 = v21;
    if (v21
      && (objc_msgSend_identifier(v21, v22, v23),
          id v25 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectWithIdentifier_(self, v26, v27, v25),
          double v28 = objc_claimAutoreleasedReturnValue(),
          v28,
          v25,
          v28))
    {
      double v12 = objc_msgSend_objectForKeyedSubscript_(self->_objects, v29, v30, v8);

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    char v37 = (void *)MEMORY[0x263EFF940];
    v38 = objc_msgSend_stringWithFormat_(NSString, v31, v32, @"Unknown object identifier %@", v8);
    objc_msgSend_exceptionWithName_reason_userInfo_(v37, v39, v40, @"TMLRuntimeException", v38, 0);
    id v41 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v41);
  }
LABEL_11:
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v35 = objc_msgSend_object(v12, v33, v34);

      double v12 = (void *)v35;
    }
  }

  return v12;
}

- (id)objectsOfType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = objc_msgSend_objects(self->_metaContext, v6, v7);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_23985F214;
  v16[3] = &unk_264DADBE8;
  id v17 = v4;
  double v18 = self;
  id v9 = v5;
  id v19 = v9;
  id v10 = v4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v8, v11, v12, v16);

  double v13 = v19;
  id v14 = v9;

  return v14;
}

- (id)createObjectFromMetaObject:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_identifier(v6, v8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  double v13 = objc_msgSend_initializer(v6, v11, v12);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(self->_objects, v14, v15, v10);
  if (v16)
  {
    id v19 = (void *)v16;
    BOOL v105 = 0;
  }
  else
  {
    double v21 = objc_msgSend_type(v6, v17, v18);
    BOOL v105 = v13 != 0;
    if (v13)
    {
      double v23 = v116;
      v116[0] = MEMORY[0x263EF8330];
      v116[1] = 3221225472;
      v116[2] = sub_23985F8A0;
      v116[3] = &unk_264DADC10;
      v116[4] = self;
      v102 = &v117;
      id v117 = v13;
    }
    else
    {
      double v23 = 0;
    }
    id v19 = objc_msgSend_createObjectWithIdentifier_ofType_initializer_parentObject_(TMLRuntime, v20, v22, v10, v21, v23, v7);

    if (!v19)
    {
LABEL_8:
      double v26 = (void *)MEMORY[0x263EFF940];
      double v27 = NSString;
      double v28 = objc_msgSend_reason(v19, v24, v25);
      double v31 = objc_msgSend_stringWithFormat_(v27, v29, v30, @"Unable create object with identifier %@.\nRoot cause: %@", v10, v28);
      double v34 = objc_msgSend_exceptionWithName_reason_userInfo_(v26, v32, v33, @"TMLRuntimeException", v31, 0);
      objc_msgSend_raiseException_(TMLExceptionHandler, v35, v36, v34);

      char v37 = 0;
      if (!v105) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  v103 = v13;
  id v39 = v19;
  double v44 = v39;
  if (objc_msgSend_length(v10, v40, v41))
  {
    double v44 = v39;
    if (objc_msgSend_containsObject_(self->_weakObjectIdentifiers, v42, v43, v10))
    {
      objc_opt_class();
      double v44 = v39;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v44 = objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v45, v46, v39);
      }
    }
    objc_msgSend_setObject_forKeyedSubscript_(self->_objects, v45, v46, v44, v10);
  }
  id v104 = v7;
  id v47 = v44;
  objc_opt_class();
  v50 = v47;
  if (objc_opt_isKindOfClass())
  {
    v50 = objc_msgSend_object(v47, v48, v49);
  }
  v51 = objc_msgSend_implements(v6, v48, v49);
  objc_msgSend_makeObject_implementProtocols_(TMLRuntime, v52, v53, v50, v51);

  v56 = objc_msgSend_declarations(v6, v54, v55);
  v113[0] = MEMORY[0x263EF8330];
  v113[1] = 3221225472;
  v113[2] = sub_23985F8FC;
  v113[3] = &unk_264DADC38;
  id v57 = v50;
  id v114 = v57;
  id v58 = v10;
  id v115 = v58;
  objc_msgSend_enumerateObjectsUsingBlock_(v56, v59, v60, v113);

  v63 = objc_msgSend_properties(v6, v61, v62);
  v66 = objc_msgSend_propertyKeys(v6, v64, v65);
  v69 = objc_msgSend_applyProperties_inOrder_toObject_(self, v67, v68, v63, v66, v57);

  v72 = objc_msgSend_objects(v6, v70, v71);
  v111[0] = MEMORY[0x263EF8330];
  v111[1] = 3221225472;
  v111[2] = sub_23985FA78;
  v111[3] = &unk_264DADC60;
  v111[4] = self;
  id v73 = v57;
  id v112 = v73;
  objc_msgSend_enumerateObjectsUsingBlock_(v72, v74, v75, v111);

  if (v69) {
    objc_msgSend_setTMLValue_forKeyPath_(v73, v76, v77, v69, @"tmlState");
  }
  if (!v58)
  {
    objc_msgSend_tmlIdentifier(v73, v76, v77);
    id v58 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v78 = objc_msgSend_setTMLOwnerContext_(v73, v76, v77, self);
  objc_msgSend_addObject_(self->_contextObjects, v79, v80, v47);
  objc_msgSend_addMetaObject_(v73, v81, v82, v6);
  v85 = objc_msgSend_signalHandlers(v6, v83, v84);
  v106[0] = MEMORY[0x263EF8330];
  v106[1] = 3221225472;
  v106[2] = sub_23985FAA4;
  v106[3] = &unk_264DADC88;
  id v86 = v73;
  id v107 = v86;
  id v87 = v6;
  id v108 = v87;
  id v10 = v58;
  id v109 = v10;
  v110 = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v85, v88, v89, v106);

  objc_msgSend_tmlMakeJSObjectClass(v86, v90, v91);
  if (v78)
  {
    v94 = objc_msgSend_type(v87, v92, v93);
    char isEqualToString = objc_msgSend_isEqualToString_(v94, v95, v96, @"Category");

    if ((isEqualToString & 1) == 0)
    {
      if (objc_opt_respondsToSelector()) {
        objc_msgSend_tmlObjectCompleted(v86, v98, v99);
      }
      objc_msgSend_emitTMLSignal_withArguments_(v86, v98, v99, @"initialize", 0);
    }
  }

  char v37 = objc_msgSend_didCreateObject_(self, v100, v101, v86);

  double v13 = v103;
  id v7 = v104;
  if (v105) {
LABEL_9:
  }

LABEL_10:
  return v37;
}

- (id)applyProperties:(id)a3 inOrder:(id)a4 toObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v13 = objc_msgSend_tmlDefaultState(v10, v11, v12);
  uint64_t v27 = 0;
  double v28 = &v27;
  uint64_t v29 = 0x3032000000;
  double v30 = sub_239860278;
  double v31 = sub_239860288;
  id v32 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_239860290;
  v21[3] = &unk_264DADCB0;
  id v14 = v8;
  id v22 = v14;
  double v23 = self;
  id v15 = v10;
  id v24 = v15;
  id v16 = v13;
  id v25 = v16;
  double v26 = &v27;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v17, v18, v21);
  id v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v19;
}

- (void)makeWeakObjectWithIdentifier:(id)a3
{
  id v4 = (const char *)a3;
  weakObjectIdentifiers = self->_weakObjectIdentifiers;
  double v12 = (char *)v4;
  if (!weakObjectIdentifiers)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF9C0]);
    id v10 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    double v11 = self->_weakObjectIdentifiers;
    self->_weakObjectIdentifiers = v10;

    id v4 = v12;
    weakObjectIdentifiers = self->_weakObjectIdentifiers;
  }
  objc_msgSend_addObject_(weakObjectIdentifiers, v4, v5, v4);
}

- (void)addObject:(id)a3 withIdentifier:(id)a4
{
  v55[2] = *MEMORY[0x263EF8340];
  id v51 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_objectForKeyedSubscript_(self->_objects, v7, v8, v6);
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend_object(v51, v12, v13),
          id v14 = objc_claimAutoreleasedReturnValue(),
          int isEqual = objc_msgSend_isEqual_(v10, v15, v16, v14),
          v14,
          isEqual))
    {
      objc_msgSend_setObject_forKeyedSubscript_(self->_objects, v12, v13, v51, v6);
      objc_msgSend_removeObject_(self->_contextObjects, v18, v19, v10);
      objc_msgSend_addObject_(self->_contextObjects, v20, v21, v51);
    }
    else if ((objc_msgSend_isEqual_(v10, v12, v13, v51) & 1) == 0)
    {
      id v24 = (void *)MEMORY[0x263EFF940];
      id v25 = objc_msgSend_stringWithFormat_(NSString, v22, v23, @"Object with identifier %@ already exists in the context", v6);
      v54[0] = @"existing";
      v54[1] = @"object";
      v55[0] = v10;
      v55[1] = v51;
      double v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, v27, v55, v54, 2);
      objc_msgSend_exceptionWithName_reason_userInfo_(v24, v29, v30, @"TMLRuntimeException", v25, v28);
      id v31 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v31);
    }
  }
  else
  {
    if (self->_initialized)
    {
      id v32 = objc_msgSend_classForObject_(TMLRuntime, v9, v11, v51);

      if (!v32)
      {
        id v39 = (void *)MEMORY[0x263EFF940];
        double v40 = NSString;
        uint64_t v41 = objc_opt_class();
        double v44 = objc_msgSend_stringWithFormat_(v40, v42, v43, @"Attempt to add object of undeclared class %@", v41);
        v52 = @"object";
        id v53 = v51;
        id v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v45, v46, &v53, &v52, 1);
        objc_msgSend_exceptionWithName_reason_userInfo_(v39, v48, v49, @"TMLRuntimeException", v44, v47);
        id v50 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v50);
      }
    }
    objc_msgSend_setTmlIdentifier_(v51, v9, v11, v6);
    objc_msgSend_setObject_forKeyedSubscript_(self->_objects, v33, v34, v51, v6);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v37 = objc_msgSend_object(v51, v35, v36);

      v38 = (void *)v37;
    }
    else
    {
      v38 = v51;
    }
    id v51 = v38;
    objc_msgSend_tmlMakeJSObjectClass(v38, v35, v36);
  }
}

- (void)requireModule:(id)a3
{
  id v18 = a3;
  id v6 = objc_msgSend_defaultModules(TMLJSEnvironment, v4, v5);
  char v9 = objc_msgSend_containsObject_(v6, v7, v8, v18);

  if ((v9 & 1) == 0)
  {
    requires = self->_requires;
    if (!requires)
    {
      id v13 = objc_alloc(MEMORY[0x263EFF9C0]);
      double v16 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v13, v14, v15, 4);
      id v17 = self->_requires;
      self->_requires = v16;

      requires = self->_requires;
    }
    objc_msgSend_addObject_(requires, v10, v11, v18);
  }
}

- (id)processValue:(id)a3 ofType:(unint64_t)a4 selfValue:(id)a5
{
  v62[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  objc_initWeak(&location, a5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    id v12 = objc_alloc(MEMORY[0x263EFF980]);
    double v15 = objc_msgSend_bindings(v11, v13, v14);
    uint64_t v18 = objc_msgSend_count(v15, v16, v17);
    double v21 = objc_msgSend_initWithCapacity_(v12, v19, v20, v18);

    objc_initWeak(&from, self);
    id v22 = objc_loadWeakRetained(&location);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v26 = objc_loadWeakRetained(&location);
      uint64_t v29 = objc_msgSend_tmlParent(v26, v27, v28);
      objc_storeWeak(&location, v29);
    }
    double v30 = objc_msgSend_bindings(v11, v24, v25);
    uint64_t v52 = MEMORY[0x263EF8330];
    uint64_t v53 = 3221225472;
    v54 = sub_239860C9C;
    double v55 = &unk_264DADD00;
    objc_copyWeak(&v58, &location);
    v56 = self;
    id v31 = v21;
    id v57 = v31;
    objc_copyWeak(&v59, &from);
    objc_msgSend_enumerateObjectsUsingBlock_(v30, v32, v33, &v52);

    double v34 = [TMLExpressionReactiveValue alloc];
    uint64_t v37 = objc_msgSend_expressionText(v11, v35, v36, v52, v53, v54, v55, v56);
    id v9 = (id)objc_msgSend_initWithExpression_context_bindings_valueType_(v34, v38, v39, v37, self, v31, a4);

    objc_destroyWeak(&v59);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&from);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_3:
      id v9 = v8;
      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = objc_msgSend_createObjectFromMetaObject_parent_(self, v40, v41, v8, 0);
      double v43 = [TMLExpressionReactiveValue alloc];
      double v46 = objc_msgSend_referenceForTarget_(TMLReference, v44, v45, v42);
      v62[0] = v46;
      double v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v47, v48, v62, 1);
      id v9 = (id)objc_msgSend_initWithExpression_context_bindings_valueType_(v43, v50, v51, @"$(0)", self, v49, a4);
    }
    else
    {
      id v9 = 0;
    }
  }
LABEL_4:
  objc_destroyWeak(&location);

  return v9;
}

+ (void)addGloballyRequiredModules:(id)a3
{
}

- (void)attachToAPIObject
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_objectForKeyedSubscript_(self->_apiObject, a2, v2, @"_$ctxs");
  if (objc_msgSend_isArray(v4, v5, v6))
  {
    id v9 = objc_msgSend_toArray(v4, v7, v8);
    id v12 = objc_msgSend_arrayByAddingObject_(v9, v10, v11, self);

    objc_msgSend_valueWithObject_inContext_(MEMORY[0x263F10390], v13, v14, v12, self->_jsContext);
  }
  else
  {
    double v15 = (void *)MEMORY[0x263F10390];
    v21[0] = self;
    id v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v7, v8, v21, 1);
    objc_msgSend_valueWithObject_inContext_(v15, v16, v17, v12, self->_jsContext);
  uint64_t v18 = };
  objc_msgSend_setObject_forKeyedSubscript_(self->_apiObject, v19, v20, v18, @"_$ctxs");
}

- (void)initializeJSContext
{
  if (self->_apiObject)
  {
    objc_msgSend_attachToAPIObject(self, a2, v2);
  }
  else
  {
    objc_msgSend_createJSContextWithRuntimeContext_(TMLJSEnvironment, a2, v2, self);
    id v4 = (JSContext *)objc_claimAutoreleasedReturnValue();
    jsContext = self->_jsContext;
    self->_jsContext = v4;

    objc_msgSend_setExceptionHandler_(self->_jsContext, v6, v7, &unk_26ECECCA8);
    objc_msgSend_valueWithNewObjectInContext_(MEMORY[0x263F10390], v8, v9, self->_jsContext);
    id v10 = (JSValue *)objc_claimAutoreleasedReturnValue();
    apiObject = self->_apiObject;
    self->_apiObject = v10;

    objc_msgSend_stringWithFormat_(NSString, v12, v13, @"api%p", self);
    double v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    apiObjectKey = self->_apiObjectKey;
    self->_apiObjectKey = v14;

    double v16 = self->_apiObject;
    double v19 = objc_msgSend_globalObject(self->_jsContext, v17, v18);
    objc_msgSend_setObject_forKeyedSubscript_(v19, v20, v21, v16, self->_apiObjectKey);

    objc_msgSend_attachToAPIObject(self, v22, v23);
    if (objc_msgSend_count(self->_requires, v24, v25))
    {
      requires = self->_requires;
      uint64_t v29 = objc_msgSend_requires(self->_metaContext, v26, v27);
      id v32 = objc_msgSend_setByAddingObjectsFromSet_(requires, v30, v31, v29);
      uint64_t v35 = objc_msgSend_mutableCopy(v32, v33, v34);
    }
    else
    {
      uint64_t v29 = objc_msgSend_requires(self->_metaContext, v26, v27);
      uint64_t v35 = objc_msgSend_mutableCopy(v29, v36, v37);
    }

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = sub_239861240;
    v39[3] = &unk_264DADD28;
    v39[4] = self;
    objc_msgSend_enumerateObjectsUsingBlock_(v35, v38, COERCE_DOUBLE(3221225472), v39);
  }
}

+ (void)initializeJSContext:(id)a3
{
  id v17 = a3;
  objc_msgSend_setObject_forKeyedSubscript_(v17, v3, v4, &unk_26ECECCC8, @"$");
  objc_msgSend_setObject_forKeyedSubscript_(v17, v5, v6, &unk_26ECECCE8, @"get");
  objc_msgSend_setObject_forKeyedSubscript_(v17, v7, v8, &unk_26ECECCE8, @"$$");
  objc_msgSend_setObject_forKeyedSubscript_(v17, v9, v10, &unk_26ECECD08, @"$ctor$");
  objc_msgSend_setObject_forKeyedSubscript_(v17, v11, v12, &unk_26ECECD28, @"$new$");
  objc_msgSend_setObject_forKeyedSubscript_(v17, v13, v14, &unk_26ECECD48, @"trycatch");
  objc_msgSend_setObject_forKeyedSubscript_(v17, v15, v16, &unk_26ECECD68, @"currentContext");
}

- (void)initizalizeContext
{
  objc_msgSend_commit(self->_metaContext, a2, v2);
  double v6 = objc_msgSend_requires(self->_metaContext, v4, v5);
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v7, v8, &unk_26ECECD88);

  unint64_t options = self->_options;
  if (options)
  {
    double v12 = objc_msgSend_protocols(self->_metaContext, v9, v10);
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v13, v14, &unk_26ECECDA8);

    id v17 = objc_msgSend_classes(self->_metaContext, v15, v16);
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v17, v18, v19, &unk_26ECECDC8);

    unint64_t options = self->_options;
  }
  if ((~(_BYTE)options & 3) != 0)
  {
    id v20 = objc_alloc(MEMORY[0x263EFF9C0]);
    double v23 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v20, v21, v22, 16);
    contextObjects = self->_contextObjects;
    self->_contextObjects = v23;

    id v25 = objc_alloc(MEMORY[0x263EFF980]);
    double v28 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v25, v26, v27, 32);
    signalHandlers = self->_signalHandlers;
    self->_signalHandlers = v28;

    apiObject = self->_apiObject;
    objc_msgSend_initializeJSContext(self, v31, v32);
    uint64_t v35 = objc_msgSend_sharedInstance(TMLApplication, v33, v34);
    objc_msgSend_addObject_withIdentifier_(self, v36, v37, v35, @"application");

    if (!apiObject)
    {
      double v40 = objc_msgSend_functions(self->_metaContext, v38, v39);
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = sub_239861C64;
      v60[3] = &unk_264DADE10;
      v60[4] = self;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v40, v41, COERCE_DOUBLE(3221225472), v60);
    }
    self->_initialized = 1;
    v42 = objc_msgSend_copy(self->_objects, v38, v39);
    double v45 = objc_msgSend_categories(self->_metaContext, v43, v44);
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = sub_239861E24;
    v59[3] = &unk_264DADE38;
    v59[4] = self;
    objc_msgSend_enumerateObjectsUsingBlock_(v45, v46, v47, v59);

    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = sub_239861EB8;
    v58[3] = &unk_264DAC1A8;
    v58[4] = self;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v42, v48, v49, v58);
    objc_msgSend_callFunction_arguments_(self, v50, v51, @"onload", 0);
    objc_msgSend_removeClasses(self->_metaContext, v52, v53);
    if ((self->_options & 8) == 0)
    {
      objc_msgSend_removeFunctions(self->_metaContext, v54, v55);
      objc_msgSend_removeCategories(self->_metaContext, v56, v57);
    }
  }
}

- (id)evaluateExpression:(id)a3 ofType:(unint64_t)a4 withBindings:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  double v37 = sub_239860278;
  v38 = sub_239860288;
  id v39 = 0;
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  double v28 = sub_23986221C;
  uint64_t v29 = &unk_264DADE60;
  double v30 = self;
  id v10 = v9;
  id v31 = v10;
  id v11 = v8;
  id v32 = v11;
  double v33 = &v34;
  objc_msgSend_runInContext_block_(TMLJSEnvironment, v12, v13, self, &v26);
  jsEvaluationException = self->_jsEvaluationException;
  if (jsEvaluationException)
  {
    id v17 = jsEvaluationException;
    double v18 = self->_jsEvaluationException;
    self->_jsEvaluationException = 0;

    double v21 = objc_msgSend_name(v17, v19, v20, v26, v27, v28, v29, v30, v31);
    char isEqualToString = objc_msgSend_isEqualToString_(v21, v22, v23, @"TMLJSException");

    if ((isEqualToString & 1) == 0) {
      objc_exception_throw(v17);
    }
  }
  else
  {
    objc_msgSend_convertJsValue_toType_(TMLJSEnvironment, v14, v15, v35[5], a4, v26, v27, v28, v29, v30, v31);
    id v17 = (NSException *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v34, 8);
  return v17;
}

- (void)callFunction:(id)a3 arguments:(id)a4
{
  id v5 = (id)objc_msgSend_callFunction_arguments_returnType_(self, a2, v4, a3, a4, 1);
}

- (id)callFunction:(id)a3 arguments:(id)a4 returnType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  double v12 = objc_msgSend_objectForKeyedSubscript_(self->_apiObject, v10, v11, v8);
  if (objc_msgSend_isObject(v12, v13, v14))
  {
    uint64_t v27 = 0;
    double v28 = &v27;
    uint64_t v29 = 0x3032000000;
    double v30 = sub_239860278;
    id v31 = sub_239860288;
    id v32 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_239862500;
    v23[3] = &unk_264DADE88;
    uint64_t v26 = &v27;
    id v24 = v12;
    id v25 = v9;
    objc_msgSend_runInContext_block_(TMLJSEnvironment, v15, v16, self, v23);
    jsEvaluationException = self->_jsEvaluationException;
    if (jsEvaluationException)
    {
      double v20 = jsEvaluationException;
      double v21 = self->_jsEvaluationException;
      self->_jsEvaluationException = 0;
    }
    else
    {
      objc_msgSend_convertJsValue_toType_(TMLJSEnvironment, v17, v18, v28[5], a5);
      double v20 = (NSException *)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

+ (id)currentContext
{
  return (id)objc_msgSend_currentContext(TMLJSEnvironment, a2, v2);
}

- (id)didCreateObject:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requires, 0);
  objc_storeStrong((id *)&self->_apiObjectKey, 0);
  objc_storeStrong((id *)&self->_apiObject, 0);
  objc_storeStrong((id *)&self->_jsEvaluationException, 0);
  objc_storeStrong((id *)&self->_currentEvaluationBindings, 0);
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_storeStrong((id *)&self->_signalHandlers, 0);
  objc_storeStrong((id *)&self->_weakObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_contextObjects, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_metaContext, 0);
}

@end