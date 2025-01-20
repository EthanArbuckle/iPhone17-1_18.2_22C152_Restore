@interface TMLSignalMethods
+ (id)allocWithZone:(_NSZone *)a3;
+ (void)addSignalMethod:(id)a3 forProtocol:(id)a4 toClass:(Class)a5;
+ (void)verifySignalMethod:(id)a3 forProtocol:(id)a4;
@end

@implementation TMLSignalMethods

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (void)addSignalMethod:(id)a3 forProtocol:(id)a4 toClass:(Class)a5
{
  v94[1] = *MEMORY[0x263EF8340];
  id v88 = a3;
  v7 = (Protocol *)a4;
  objc_msgSend_methodSelector(v88, v8, v9);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v13 = objc_msgSend_methodName(v88, v10, v12);
    v16 = objc_msgSend_parameters(v88, v14, v15);
    objc_msgSend_methodSelectorForMethodName_parameters_(TMLMethodDescriptor, v17, v18, v13, v16);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v19 = NSSelectorFromString(v11);
  if (!class_getInstanceMethod(a5, v19))
  {
    char isOptional = objc_msgSend_isOptional(v88, v20, v21);
    objc_method_description MethodDescription = protocol_getMethodDescription(v7, v19, isOptional != 1, 1);
    if (MethodDescription.name)
    {
      v25 = objc_msgSend_signatureWithObjCTypes_(MEMORY[0x263EFF970], MethodDescription.types, v23, MethodDescription.types);
      id v26 = objc_alloc(MEMORY[0x263F089D8]);
      id v27 = v25;
      uint64_t v30 = objc_msgSend_methodReturnType(v27, v28, v29);
      v33 = objc_msgSend_initWithCString_encoding_(v26, v31, v32, v30, 1);
      unint64_t v36 = objc_msgSend_numberOfArguments(v27, v34, v35);
      if (v36 >= 3)
      {
        unint64_t v37 = v36;
        for (uint64_t i = 2; i != v37; ++i)
        {
          id v39 = v27;
          uint64_t ArgumentTypeAtIndex = objc_msgSend_getArgumentTypeAtIndex_(v39, v40, v41, i);
          objc_msgSend_appendFormat_(v33, v43, v44, @"%s", ArgumentTypeAtIndex);
        }
      }
      v45 = sub_239884A20();
      objc_msgSend_objectForKeyedSubscript_(v45, v46, v47, v33);
      v48 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        v51 = objc_msgSend_signalName(v88, v49, v50);
        v52 = (void (*)(void))((uint64_t (**)(void, void *))v48)[2](v48, v51);

        if (class_addMethod(a5, v19, v52, MethodDescription.types))
        {

          goto LABEL_11;
        }
        v74 = (void *)MEMORY[0x263EFF940];
        v75 = NSString;
        v76 = objc_msgSend_signalName(v88, v53, v54);
        v79 = objc_msgSend_description(a5, v77, v78);
        v82 = objc_msgSend_stringWithFormat_(v75, v80, v81, @"Failed to add method for signal %@ to class %@", v76, v79);
        v89 = @"method";
        id v90 = v88;
        v85 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v83, v84, &v90, &v89, 1);
        objc_msgSend_exceptionWithName_reason_userInfo_(v74, v86, v87, @"TMLRuntimeException", v82, v85);
        id v73 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
        objc_exception_throw(v73);
      }
      v55 = (void *)MEMORY[0x263EFF940];
      v64 = NSString;
      v57 = objc_msgSend_signalName(v88, v49, v50);
      Name = protocol_getName(v7);
      v61 = objc_msgSend_stringWithFormat_(v64, v66, v67, @"Unsupported method signature for signal %@ in protocol %s", v57, Name);
      v91 = @"method";
      id v92 = v88;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v68, v69, &v92, &v91, 1);
    }
    else
    {
      v55 = (void *)MEMORY[0x263EFF940];
      v56 = NSString;
      v57 = objc_msgSend_methodSelector(v88, MethodDescription.types, v23);
      v58 = protocol_getName(v7);
      v61 = objc_msgSend_stringWithFormat_(v56, v59, v60, @"Protocol method not found %@ in protocol %s", v57, v58);
      v93 = @"method";
      v94[0] = v88;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v62, v63, v94, &v93, 1);
    v70 = };
    objc_msgSend_exceptionWithName_reason_userInfo_(v55, v71, v72, @"TMLRuntimeException", v61, v70);
    id v73 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
LABEL_11:
}

+ (void)verifySignalMethod:(id)a3 forProtocol:(id)a4
{
  v64[1] = *MEMORY[0x263EF8340];
  id v62 = a3;
  v5 = (Protocol *)a4;
  objc_msgSend_methodSelector(v62, v6, v7);
  double v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v11 = objc_msgSend_methodName(v62, v8, v10);
    v14 = objc_msgSend_parameters(v62, v12, v13);
    objc_msgSend_methodSelectorForMethodName_parameters_(TMLMethodDescriptor, v15, v16, v11, v14);
    double v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v17 = NSSelectorFromString(v9);
  char isOptional = objc_msgSend_isOptional(v62, v18, v19);
  objc_method_description MethodDescription = protocol_getMethodDescription(v5, v17, isOptional != 1, 1);
  if (MethodDescription.name)
  {
    double v23 = objc_msgSend_signatureWithObjCTypes_(MEMORY[0x263EFF970], MethodDescription.types, v21, MethodDescription.types);
    id v24 = objc_alloc(MEMORY[0x263F089D8]);
    id v25 = v23;
    uint64_t v28 = objc_msgSend_methodReturnType(v25, v26, v27);
    v31 = objc_msgSend_initWithCString_encoding_(v24, v29, v30, v28, 1);
    unint64_t v34 = objc_msgSend_numberOfArguments(v25, v32, v33);
    if (v34 >= 3)
    {
      unint64_t v35 = v34;
      for (uint64_t i = 2; i != v35; ++i)
      {
        id v37 = v25;
        uint64_t ArgumentTypeAtIndex = objc_msgSend_getArgumentTypeAtIndex_(v37, v38, v39, i);
        objc_msgSend_appendFormat_(v31, v41, v42, @"%s", ArgumentTypeAtIndex);
      }
    }
    v43 = sub_239884A20();
    v46 = objc_msgSend_objectForKeyedSubscript_(v43, v44, v45, v31);

    if (!v46)
    {
      v49 = (void *)MEMORY[0x263EFF940];
      double v50 = NSString;
      v51 = objc_msgSend_signalName(v62, v47, v48);
      Name = protocol_getName(v5);
      v55 = objc_msgSend_stringWithFormat_(v50, v53, v54, @"Unsupported method signature for signal %@ in protocol %s", v51, Name);
      double v63 = @"method";
      v64[0] = v62;
      v58 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v56, v57, v64, &v63, 1);
      objc_msgSend_exceptionWithName_reason_userInfo_(v49, v59, v60, @"TMLRuntimeException", v55, v58);
      id v61 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v61);
    }
  }
}

@end