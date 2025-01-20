@interface TMLUIControlState
+ (BOOL)isControlStateClass:(id)a3;
+ (void)registerControlState:(id)a3 forClass:(Class)a4;
+ (void)verifyStateProperty:(id)a3 withClass:(Class)a4;
- (unint64_t)state;
- (void)setState:(unint64_t)a3;
@end

@implementation TMLUIControlState

+ (BOOL)isControlStateClass:(id)a3
{
  v4 = objc_msgSend_className(a3, a2, v3);
  char isEqualToString = objc_msgSend_isEqualToString_(v4, v5, v6, @"UIControlState");

  return isEqualToString;
}

+ (void)registerControlState:(id)a3 forClass:(Class)a4
{
  id v6 = a3;
  v9 = objc_msgSend_properties(v6, v7, v8);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = sub_23988F558;
  v30[3] = &unk_264DAE138;
  v30[4] = a1;
  v30[5] = a4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v10, v11, v30);

  v12 = NSString;
  v13 = NSStringFromClass(a4);
  v16 = objc_msgSend_className(v6, v14, v15);
  objc_msgSend_stringWithFormat_(v12, v17, v18, @"%@_%@", v13, v16);
  id v19 = objc_claimAutoreleasedReturnValue();
  v22 = (const char *)objc_msgSend_UTF8String(v19, v20, v21);

  if (!objc_getClass(v22))
  {
    ClassPair = objc_allocateClassPair((Class)a1, v22, 0);
    v26 = objc_msgSend_properties(v6, v24, v25);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_23988F6C0;
    v29[3] = &unk_264DAF768;
    v29[4] = ClassPair;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v26, v27, v28, v29);

    objc_registerClassPair(ClassPair);
  }
}

+ (void)verifyStateProperty:(id)a3 withClass:(Class)a4
{
  v119[1] = *MEMORY[0x263EF8340];
  id v111 = a3;
  if (!objc_msgSend_type(v111, v5, v6))
  {
    v59 = (void *)MEMORY[0x263EFF940];
    v60 = NSString;
    v61 = objc_msgSend_description(v111, v7, v8);
    v64 = objc_msgSend_stringWithFormat_(v60, v62, v63, @"Cannot register property of unsupported type %@", v61);
    v118 = @"property";
    v119[0] = v111;
    v67 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v65, v66, v119, &v118, 1);
    objc_msgSend_exceptionWithName_reason_userInfo_(v59, v68, v69, @"TMLRuntimeException", v64, v67);
    id v70 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v70);
  }
  v9 = NSString;
  v10 = objc_msgSend_propertyName(v111, v7, v8);
  objc_msgSend_stringWithFormat_(v9, v11, v12, @"%@ForState:", v10);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  v14 = NSSelectorFromString(v13);
  InstanceMethod = class_getInstanceMethod(a4, v14);
  if (!InstanceMethod)
  {
    v71 = (void *)MEMORY[0x263EFF940];
    v72 = NSString;
    v73 = objc_msgSend_description(a4, v16, v17);
    v76 = objc_msgSend_stringWithFormat_(v72, v74, v75, @"Method %@ not found in class %@", v13, v73);
    v116 = @"property";
    id v117 = v111;
    v79 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v77, v78, &v117, &v116, 1);
    objc_msgSend_exceptionWithName_reason_userInfo_(v71, v80, v81, @"TMLRuntimeException", v76, v79);
    id v82 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  double v18 = method_copyReturnType(InstanceMethod);
  if (v18)
  {
    double v21 = v18;
    id v22 = [NSString alloc];
    size_t v23 = strlen(v21);
    v26 = (__CFString *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v22, v24, v25, v21, v23, 1, 1);
    uint64_t v29 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v27, v28, v26);
  }
  else
  {
    v26 = @" ";
    uint64_t v29 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v19, v20, @" ");
  }
  uint64_t v30 = v29;

  v31 = NSString;
  v34 = objc_msgSend_propertyName(v111, v32, v33);
  v37 = objc_msgSend_substringToIndex_(v34, v35, v36, 1);
  v40 = objc_msgSend_capitalizedString(v37, v38, v39);
  v43 = objc_msgSend_propertyName(v111, v41, v42);
  v46 = objc_msgSend_substringFromIndex_(v43, v44, v45, 1);
  v49 = objc_msgSend_stringWithFormat_(v31, v47, v48, @"%@%@", v40, v46);
  objc_msgSend_stringWithFormat_(v31, v50, v51, @"set%@:forState:", v49);
  v52 = (NSString *)objc_claimAutoreleasedReturnValue();

  v53 = NSSelectorFromString(v52);
  if (!class_getInstanceMethod(a4, v53))
  {
    v83 = (void *)MEMORY[0x263EFF940];
    v84 = NSString;
    v73 = objc_msgSend_description(a4, v54, v55);
    v87 = objc_msgSend_stringWithFormat_(v84, v85, v86, @"Method %@ not found in class %@", v52, v73);
    v114 = @"property";
    id v115 = v111;
    v90 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v88, v89, &v115, &v114, 1);
    objc_msgSend_exceptionWithName_reason_userInfo_(v83, v91, v92, @"TMLRuntimeException", v87, v90);
    id v82 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
    objc_exception_throw(v82);
  }
  uint64_t v56 = objc_msgSend_type(v111, v54, v55);
  if (v56 != v30
    && (v30 != 4 || v56 != 3)
    && (v30 != 3 || v56 != 4)
    && (v30 != 5 || v56 != 7)
    && (v30 != 16 || (unint64_t)objc_msgSend_type(v111, v57, v58) <= 0xF))
  {
    v93 = (void *)MEMORY[0x263EFF940];
    v94 = NSString;
    v95 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v57, v58, v30);
    v98 = objc_msgSend_description(v111, v96, v97);
    v101 = objc_msgSend_propertyName(v111, v99, v100);
    v104 = objc_msgSend_stringWithFormat_(v94, v102, v103, @"Runtime type mismatch %@ vs %@ for %@", v95, v98, v101);
    v112 = @"property";
    id v113 = v111;
    v107 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v105, v106, &v113, &v112, 1);
    objc_msgSend_exceptionWithName_reason_userInfo_(v93, v108, v109, @"TMLRuntimeException", v104, v107);
    id v110 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v110);
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

@end