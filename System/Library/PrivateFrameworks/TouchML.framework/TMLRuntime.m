@interface TMLRuntime
+ (Class)createClass:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)childClassForName:(id)a3 inClass:(id)a4;
+ (id)classForName:(id)a3;
+ (id)classForObject:(id)a3;
+ (id)createObjectWithIdentifier:(id)a3 ofClass:(id)a4 initializer:(id)a5;
+ (id)createObjectWithIdentifier:(id)a3 ofType:(id)a4 initializer:(id)a5;
+ (id)createObjectWithIdentifier:(id)a3 ofType:(id)a4 initializer:(id)a5 parentObject:(id)a6;
+ (id)ensureClass:(id)a3;
+ (id)ensurePropertyWithKeyPath:(id)a3 forObject:(id)a4 writable:(BOOL)a5;
+ (id)property:(id)a3 forClass:(id)a4;
+ (id)property:(id)a3 forObject:(id)a4;
+ (id)propertyWithKeyPath:(id)a3 forObject:(id)a4;
+ (id)propertyWithKeyPath:(id)a3 inClass:(id)a4;
+ (id)protocolForName:(id)a3;
+ (id)requireModule:(id)a3;
+ (id)rootClassDescriptor;
+ (id)signal:(id)a3 forObject:(id)a4;
+ (void)addProperty:(id)a3 toClass:(Class)a4;
+ (void)bootstrap;
+ (void)makeObject:(id)a3 implementProtocols:(id)a4;
+ (void)registerClass:(id)a3;
+ (void)registerClass:(id)a3 className:(id)a4;
+ (void)registerMethod:(id)a3 forObject:(id)a4;
+ (void)registerProperty:(id)a3 forObject:(id)a4;
+ (void)registerProtocol:(id)a3;
+ (void)registerSignal:(id)a3 forObject:(id)a4;
+ (void)verifyMethod:(id)a3 forProtocol:(id)a4;
+ (void)verifyMethod:(id)a3 withClass:(Class)a4;
+ (void)verifyProperty:(id)a3 withClass:(Class)a4;
@end

@implementation TMLRuntime

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (void)bootstrap
{
  TouchML_init();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2398663E4;
  block[3] = &unk_264DAB680;
  block[4] = a1;
  if (qword_268A05890 != -1) {
    dispatch_once(&qword_268A05890, block);
  }
}

+ (id)rootClassDescriptor
{
  if (qword_268A058A0 != -1) {
    dispatch_once(&qword_268A058A0, &unk_26ECED0A8);
  }
  v2 = (void *)qword_268A05898;
  return v2;
}

+ (id)requireModule:(id)a3
{
  id v4 = a3;
  if (qword_268A058B0 != -1) {
    dispatch_once(&qword_268A058B0, &unk_26ECED0C8);
  }
  objc_msgSend_objectForKeyedSubscript_((void *)qword_268A058A8, v3, v5, v4);
  v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_stringWithFormat_(NSString, v6, v8, @"%@_TMLModule", v4);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    Class v10 = NSClassFromString(v9);

    if (v10)
    {
      v7 = v10;
      if (objc_msgSend_loadModule(v7, v13, v14))
      {
        objc_msgSend_setObject_forKeyedSubscript_((void *)qword_268A058A8, v15, v16, v7, v4);
        goto LABEL_7;
      }
      v19 = (void *)MEMORY[0x263EFF940];
      objc_msgSend_stringWithFormat_(NSString, v15, v16, @"Cannot load required module %@", v4);
    }
    else
    {
      v19 = (void *)MEMORY[0x263EFF940];
      objc_msgSend_stringWithFormat_(NSString, v11, v12, @"Cannot find required module %@", v4);
    v20 = };
    objc_msgSend_exceptionWithName_reason_userInfo_(v19, v21, v22, @"TMLRuntimeException", v20, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v23);
  }
LABEL_7:
  v17 = v7;

  return v17;
}

+ (id)createObjectWithIdentifier:(id)a3 ofType:(id)a4 initializer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_classForName_(a1, v11, v12, v9);
  if (!v13)
  {
    v19 = (void *)MEMORY[0x263EFF940];
    v20 = objc_msgSend_stringWithFormat_(NSString, v14, v15, @"Cannot create object of undeclared type %@", v9);
    objc_msgSend_exceptionWithName_reason_userInfo_(v19, v21, v22, @"TMLRuntimeException", v20, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v23);
  }
  double v16 = (void *)v13;
  v17 = objc_msgSend_createObjectWithIdentifier_ofClass_initializer_(a1, v14, v15, v8, v13, v10);

  return v17;
}

+ (id)createObjectWithIdentifier:(id)a3 ofClass:(id)a4 initializer:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, objc_class *))a5;
  double v12 = (objc_class *)objc_msgSend_objcClass(v8, v10, v11);
  if (v9)
  {
    v9[2](v9, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = objc_alloc_init(v12);
  }
  double v16 = v13;
  if (!v13)
  {
    v21 = (void *)MEMORY[0x263EFF940];
    double v22 = NSString;
    id v23 = objc_msgSend_className(v8, v14, v15);
    v26 = objc_msgSend_stringWithFormat_(v22, v24, v25, @"Failed to create object type %@", v23);
    objc_msgSend_exceptionWithName_reason_userInfo_(v21, v27, v28, @"TMLRuntimeException", v26, 0);
    id v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v29);
  }
  v17 = objc_getAssociatedObject(v13, "ccppmsc");

  if (!v17) {
    objc_setAssociatedObject(v16, "ccppmsc", v8, (void *)1);
  }
  objc_msgSend_setTmlIdentifier_(v16, v18, v19, v7);

  return v16;
}

+ (id)createObjectWithIdentifier:(id)a3 ofType:(id)a4 initializer:(id)a5 parentObject:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v14 = a6;
  if (v14)
  {
    double v16 = objc_msgSend_classForObject_(a1, v13, v15, v14);
    double v19 = objc_msgSend_childClassForName_inClass_(a1, v17, v18, v11, v16);

    if (v19)
    {
      v20 = objc_msgSend_createObjectWithIdentifier_ofClass_initializer_(a1, v13, v15, v10, v19, v12);

      if (v20) {
        goto LABEL_5;
      }
    }
  }
  v20 = objc_msgSend_createObjectWithIdentifier_ofType_initializer_(a1, v13, v15, v10, v11, v12);
  if (v14) {
LABEL_5:
  }
    objc_msgSend_setTmlParent_(v20, v13, v15, v14);

  return v20;
}

+ (void)makeObject:(id)a3 implementProtocols:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_count(v7, v8, v9))
  {
    id v10 = objc_alloc(MEMORY[0x263EFF9C0]);
    id v13 = objc_msgSend_initWithSet_(v10, v11, v12, v7);
    if (objc_msgSend_count(v13, v14, v15))
    {
      do
      {
        uint64_t v18 = objc_msgSend_count(v13, v16, v17);
        v69[0] = MEMORY[0x263EF8330];
        v69[1] = 3221225472;
        v69[2] = sub_239866FA8;
        v69[3] = &unk_264DAE0A8;
        id v71 = a1;
        id v19 = v13;
        id v70 = v19;
        objc_msgSend_enumerateObjectsUsingBlock_(v19, v20, v21, v69);
      }
      while (objc_msgSend_count(v19, v22, v23) != v18);
    }
    id v24 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v27 = objc_msgSend_count(v13, v25, v26);
    v30 = objc_msgSend_initWithCapacity_(v24, v28, v29, v27);
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = sub_23986704C;
    v65[3] = &unk_264DAE0D0;
    id v68 = a1;
    id v31 = v6;
    id v66 = v31;
    id v32 = v30;
    id v67 = v32;
    objc_msgSend_enumerateObjectsUsingBlock_(v13, v33, v34, v65);
    if (objc_msgSend_count(v32, v35, v36))
    {
      if (!objc_getAssociatedObject(v31, "cppmsc"))
      {
        Class = object_getClass(v31);
        v40 = objc_msgSend_allObjects(v7, v38, v39);
        v43 = objc_msgSend_sortedArrayUsingSelector_(v40, v41, v42, sel_compare_);
        v63 = objc_msgSend_componentsJoinedByString_(v43, v44, v45, @"_");

        v46 = NSString;
        v47 = NSStringFromClass(Class);
        objc_msgSend_stringWithFormat_(v46, v48, v49, @"%@_%@_%llu", v47, v63, qword_268A058B8);
        id v50 = objc_claimAutoreleasedReturnValue();
        v53 = (const char *)objc_msgSend_UTF8String(v50, v51, v52);

        ++qword_268A058B8;
        ClassPair = objc_allocateClassPair(Class, v53, 0);
        v64[0] = MEMORY[0x263EF8330];
        v64[1] = 3221225472;
        v64[2] = sub_239867144;
        v64[3] = &unk_264DAE118;
        v64[4] = ClassPair;
        objc_msgSend_enumerateObjectsUsingBlock_(v32, v55, v56, v64);
        objc_registerClassPair(ClassPair);
        object_setClass(v31, ClassPair);
        objc_setAssociatedObject(v31, "cppmsc", ClassPair, 0);
      }
      v58 = objc_getAssociatedObject(v31, "ppmsc");
      if (!v58)
      {
        id v60 = objc_alloc(MEMORY[0x263EFF9C0]);
        v58 = objc_msgSend_initWithCapacity_(v60, v61, v62, 2);
        objc_setAssociatedObject(v31, "ppmsc", v58, (void *)1);
      }
      objc_msgSend_addObjectsFromArray_(v58, v57, v59, v32);
    }
  }
}

+ (void)registerClass:(id)a3
{
  id v4 = a3;
  objc_msgSend_className(v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerClass_className_(a1, v7, v8, v4, v9);
}

+ (void)registerClass:(id)a3 className:(id)a4
{
  v188[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_objcClass(v6, v8, v9);
  id v13 = v10;
  if (v10)
  {
    id v14 = objc_getAssociatedObject(v10, "ccppmsc");
    double v17 = v14;
    if (!v14 || (objc_msgSend_isEqual_(v14, v15, v16, v6) & 1) != 0)
    {
      char v18 = 0;
      goto LABEL_9;
    }
    if (objc_msgSend_canMergeFromClassDescriptor_(v17, v15, v16, v6))
    {
      char v18 = objc_msgSend_mergeFromClassDescriptor_(v17, v29, v30, v6);
LABEL_9:
      id v32 = objc_msgSend_superClass(v6, v15, v16);
      if (v32)
      {
        objc_msgSend_registerClass_(a1, v31, v33, v32);
      }
      else
      {
        v130 = objc_msgSend_superClassName(v6, v31, v33);
        uint64_t v133 = objc_msgSend_length(v130, v131, v132);

        if (v133)
        {
          v136 = objc_msgSend_superClassName(v6, v134, v135);
          v139 = objc_msgSend_classForName_(a1, v137, v138, v136);
          objc_msgSend_setSuperClass_(v6, v140, v141, v139);

          v144 = objc_msgSend_superClass(v6, v142, v143);

          id v32 = 0;
          if (!v144)
          {
            objc_msgSend_addObject_((void *)qword_268A05888, v34, v35, v6);
            goto LABEL_27;
          }
        }
        else
        {
          objc_msgSend_rootClassDescriptor(a1, v134, v135);
          id v145 = (id)objc_claimAutoreleasedReturnValue();

          id v32 = 0;
          if (v145 != v6)
          {
            v146 = objc_msgSend_rootClassDescriptor(a1, v34, v35);
            objc_msgSend_setSuperClass_(v6, v147, v148, v146);
          }
        }
      }
      if ((v18 & 1) == 0)
      {
        double v36 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A05878, v34, v35, v7);

        if (v36)
        {
          if (!v17)
          {
            v37 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A05878, v34, v35, v7);

            if (v37)
            {
              v40 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A05878, v38, v39, v7);
              if ((objc_msgSend_isEqual_(v40, v41, v42, v6) & 1) == 0)
              {
                v158 = (void *)MEMORY[0x263EFF940];
                v159 = objc_msgSend_stringWithFormat_(NSString, v43, v44, @"Attempt to redeclare class %@", v7);
                v185 = @"class";
                id v186 = v6;
                v162 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v160, v161, &v186, &v185, 1);
                objc_msgSend_exceptionWithName_reason_userInfo_(v158, v163, v164, @"TMLRuntimeException", v159, v162);
                id v165 = (id)objc_claimAutoreleasedReturnValue();

                objc_exception_throw(v165);
              }
            }
          }
LABEL_22:
          v65 = (void *)qword_268A05878;
          v175[0] = MEMORY[0x263EF8330];
          v175[1] = 3221225472;
          v175[2] = sub_239867CB8;
          v175[3] = &unk_264DAE1A0;
          id v176 = v7;
          id v66 = v6;
          id v177 = v66;
          objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v65, v67, v68, v175);
          id v71 = objc_msgSend_childClasses(v66, v69, v70);
          v174[0] = MEMORY[0x263EF8330];
          v174[1] = 3221225472;
          v174[2] = sub_239867D30;
          v174[3] = &unk_264DAE1C0;
          v174[4] = v13;
          v174[5] = a1;
          objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v71, v72, v73, v174);

          Class cls = (Class)objc_msgSend_registerState_forClass_(TMLState, v74, v75, v66, v13);
          objc_setAssociatedObject(cls, "ccppmsc", v66, (void *)1);
          v76 = [TMLClassDescriptor alloc];
          v168 = v32;
          v79 = objc_msgSend_initWithName_superClassName_initializer_optional_(v76, v77, v78, @"State", 0, 0, 0);
          objc_msgSend_inheritedProperties(v66, v80, v81);
          v82 = v167 = v17;
          v172[0] = MEMORY[0x263EF8330];
          v172[1] = 3221225472;
          v172[2] = sub_239867DC0;
          v172[3] = &unk_264DAE1E8;
          id v173 = v79;
          id v83 = v79;
          objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v82, v84, v85, v172);

          v86 = [TMLPropertyDescriptor alloc];
          v89 = objc_msgSend_initWithName_type_attributes_(v86, v87, v88, @"tmlExtends", 17, 0);
          objc_msgSend_addProperty_(v83, v90, v91, v89);

          v92 = [TMLSignalDescriptor alloc];
          v93 = [TMLPropertyDescriptor alloc];
          v96 = objc_msgSend_initWithName_type_attributes_(v93, v94, v95, @"fromState", 17, 0);
          v184 = v96;
          v99 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v97, v98, &v184, 1);
          v102 = objc_msgSend_initWithName_parameters_(v92, v100, v101, @"enterState", v99);
          objc_msgSend_addSignal_(v83, v103, v104, v102);

          v105 = [TMLSignalDescriptor alloc];
          v106 = [TMLPropertyDescriptor alloc];
          v109 = objc_msgSend_initWithName_type_attributes_(v106, v107, v108, @"toState", 17, 0);
          v183 = v109;
          v112 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v110, v111, &v183, 1);
          v115 = objc_msgSend_initWithName_parameters_(v105, v113, v114, @"leaveState", v112);
          objc_msgSend_addSignal_(v83, v116, v117, v115);

          v118 = NSString;
          Name = class_getName(cls);
          v122 = objc_msgSend_stringWithCString_encoding_(v118, v120, v121, Name, 4);
          objc_msgSend_setObjcClassName_(v83, v123, v124, v122);

          objc_msgSend_addChildClass_(v66, v125, v126, v83);
          goto LABEL_23;
        }
      }
      double v45 = objc_msgSend_properties(v6, v34, v35);
      v180[0] = MEMORY[0x263EF8330];
      v180[1] = 3221225472;
      v180[2] = sub_239867C2C;
      v180[3] = &unk_264DAE138;
      v180[4] = a1;
      v180[5] = v13;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v45, v46, v47, v180);

      id v50 = objc_msgSend_methods(v6, v48, v49);
      v179[0] = MEMORY[0x263EF8330];
      v179[1] = 3221225472;
      v179[2] = sub_239867C38;
      v179[3] = &unk_264DAE158;
      v179[4] = a1;
      v179[5] = v13;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v50, v51, v52, v179);

      v55 = objc_msgSend_signals(v6, v53, v54);
      v178[0] = MEMORY[0x263EF8330];
      v178[1] = 3221225472;
      v178[2] = sub_239867C44;
      v178[3] = &unk_264DAE178;
      v178[4] = a1;
      v178[5] = v13;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v55, v56, v57, v178);

      if (qword_268A058C0 != -1) {
        dispatch_once(&qword_268A058C0, &unk_26ECED0E8);
      }
      id v60 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A05878, v58, v59, v7);

      if (!v60)
      {
        objc_msgSend_setObject_forKeyedSubscript_((void *)qword_268A05878, v61, v62, v6, v7);
        objc_msgSend_removeObject_((void *)qword_268A05888, v63, v64, v6);
        objc_setAssociatedObject(v13, "ccppmsc", v6, (void *)1);
      }
      if ((v18 & 1) == 0) {
        goto LABEL_22;
      }
LABEL_27:

      goto LABEL_28;
    }
    double v21 = (void *)MEMORY[0x263EFF940];
    v149 = NSString;
    double v23 = objc_msgSend_className(v6, v29, v30);
    double v26 = objc_msgSend_stringWithFormat_(v149, v150, v151, @"Attempt to redeclare class %@", v23);
    v187 = @"class";
    v188[0] = v6;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v152, v153, v188, &v187, 1);
    v154 = LABEL_32:;
    objc_msgSend_exceptionWithName_reason_userInfo_(v21, v155, v156, @"TMLRuntimeException", v26, v154);
    id v157 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v157);
  }
  if ((objc_msgSend_isOptional(v6, v11, v12) & 1) == 0)
  {
    double v21 = (void *)MEMORY[0x263EFF940];
    double v22 = NSString;
    double v23 = objc_msgSend_className(v6, v19, v20);
    double v26 = objc_msgSend_stringWithFormat_(v22, v24, v25, @"Cannot register unknown class %@", v23);
    v181 = @"class";
    id v182 = v6;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, v28, &v182, &v181, 1);
    goto LABEL_32;
  }
LABEL_23:
  objc_msgSend_tmlMakeJSObjectClass(v13, v19, v20);
  v127 = (void *)qword_268A05888;
  v169[0] = MEMORY[0x263EF8330];
  v169[1] = 3221225472;
  v169[2] = sub_239867DC8;
  v169[3] = &unk_264DAE210;
  id v170 = v6;
  id v171 = a1;
  objc_msgSend_enumerateObjectsUsingBlock_(v127, v128, v129, v169);
  double v17 = v170;
LABEL_28:
}

+ (void)registerProtocol:(id)a3
{
  id v4 = a3;
  double v8 = objc_msgSend_objcProtocol(v4, v5, v6);
  if (v8)
  {
    id v10 = objc_msgSend_protocolName(v4, v7, v9);
    id v13 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A05880, v11, v12, v10);

    if (!v13)
    {
      double v16 = objc_msgSend_signals(v4, v14, v15);
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      double v23 = sub_239867F94;
      id v24 = &unk_264DAE238;
      id v26 = a1;
      id v25 = v8;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v16, v17, v18, &v21);

      if (qword_268A058C8 != -1) {
        dispatch_once(&qword_268A058C8, &unk_26ECED108);
      }
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_268A05880, v19, v20, v4, v10, v21, v22, v23, v24);
    }
  }
}

+ (Class)createClass:(id)a3
{
  uint64_t v84 = 0;
  double v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = sub_2398686A4;
  double v88 = sub_2398686B4;
  id v4 = a3;
  id v89 = v4;
  id v7 = objc_msgSend_rootObject((void *)v85[5], v5, v6);
  id v10 = objc_msgSend_type(v7, v8, v9);
  id v13 = objc_msgSend_ensureClass_(a1, v11, v12, v10);
  double v16 = (objc_class *)objc_msgSend_objcClass(v13, v14, v15);

  double v17 = NSString;
  double v18 = NSStringFromClass(v16);
  objc_msgSend_stringWithFormat_(v17, v19, v20, @"%@_tml_%llu", v18, qword_268A058D0);
  id v21 = objc_claimAutoreleasedReturnValue();
  id v24 = (const char *)objc_msgSend_UTF8String(v21, v22, v23);

  ++qword_268A058D0;
  ClassPair = objc_allocateClassPair(v16, v24, 0);
  uint64_t v26 = objc_opt_class();
  if (objc_msgSend_isSubclassOfClass_(v16, v27, v28, v26))
  {
    InstanceMethod = class_getInstanceMethod(v16, sel_initWithStyle_reuseIdentifier_);
    v83[0] = MEMORY[0x263EF8330];
    v83[1] = 3221225472;
    v83[2] = sub_2398686BC;
    v83[3] = &unk_264DAE260;
    v83[5] = v16;
    v83[6] = sel_initWithStyle_reuseIdentifier_;
    v83[4] = &v84;
    double v30 = (void *)MEMORY[0x23ECA7DD0](v83);
    id v31 = imp_implementationWithBlock(v30);

    TypeEncoding = method_getTypeEncoding(InstanceMethod);
    class_addMethod(ClassPair, sel_initWithStyle_reuseIdentifier_, v31, TypeEncoding);
  }
  else
  {
    uint64_t v33 = objc_opt_class();
    if (objc_msgSend_isSubclassOfClass_(v16, v34, v35, v33))
    {
      double v36 = class_getInstanceMethod(v16, sel_initWithReuseIdentifier_);
      v82[0] = MEMORY[0x263EF8330];
      v82[1] = 3221225472;
      v82[2] = sub_239868978;
      v82[3] = &unk_264DAE288;
      v82[5] = v16;
      v82[6] = sel_initWithReuseIdentifier_;
      v82[4] = &v84;
      v37 = (void *)MEMORY[0x23ECA7DD0](v82);
      v38 = imp_implementationWithBlock(v37);

      double v39 = method_getTypeEncoding(v36);
      class_addMethod(ClassPair, sel_initWithReuseIdentifier_, v38, v39);
    }
    else
    {
      uint64_t v40 = objc_opt_class();
      if (objc_msgSend_isSubclassOfClass_(v16, v41, v42, v40))
      {
        v43 = class_getInstanceMethod(v16, sel_initWithFrame_);
        v81[0] = MEMORY[0x263EF8330];
        v81[1] = 3221225472;
        v81[2] = sub_239868A20;
        v81[3] = &unk_264DAE2B0;
        v81[5] = v16;
        v81[6] = sel_initWithFrame_;
        v81[4] = &v84;
        double v44 = (void *)MEMORY[0x23ECA7DD0](v81);
        double v45 = imp_implementationWithBlock(v44);

        v46 = method_getTypeEncoding(v43);
        class_addMethod(ClassPair, sel_initWithFrame_, v45, v46);
      }
      else
      {
        double v47 = class_getInstanceMethod(v16, sel_init);
        v80[0] = MEMORY[0x263EF8330];
        v80[1] = 3221225472;
        v80[2] = sub_239868AE4;
        v80[3] = &unk_264DAE2D8;
        v80[5] = v16;
        v80[6] = sel_init;
        v80[4] = &v84;
        v48 = (void *)MEMORY[0x23ECA7DD0](v80);
        double v49 = imp_implementationWithBlock(v48);

        id v50 = method_getTypeEncoding(v47);
        class_addMethod(ClassPair, sel_init, v49, v50);
      }
    }
  }
  v51 = class_getInstanceMethod(v16, sel_tmlDispose);
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = sub_239868B78;
  v79[3] = &unk_264DAE328;
  v79[4] = &v84;
  double v52 = (void *)MEMORY[0x23ECA7DD0](v79);
  v53 = imp_implementationWithBlock(v52);

  Class = object_getClass(ClassPair);
  v55 = method_getTypeEncoding(v51);
  class_addMethod(Class, sel_tmlDispose, v53, v55);
  id v56 = objc_alloc(MEMORY[0x263EFF9C0]);
  double v59 = objc_msgSend_implements(v7, v57, v58);
  double v62 = objc_msgSend_initWithSet_(v56, v60, v61, v59);

  if (objc_msgSend_count(v62, v63, v64))
  {
    do
    {
      uint64_t v67 = objc_msgSend_count(v62, v65, v66);
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = sub_239868C60;
      v76[3] = &unk_264DAE0A8;
      id v78 = a1;
      id v68 = v62;
      id v77 = v68;
      objc_msgSend_enumerateObjectsUsingBlock_(v68, v69, v70, v76);
    }
    while (objc_msgSend_count(v68, v71, v72) != v67);
  }
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = sub_239868D04;
  v75[3] = &unk_264DAE348;
  v75[4] = a1;
  v75[5] = ClassPair;
  objc_msgSend_enumerateObjectsUsingBlock_(v62, v65, v66, v75);
  objc_registerClassPair(ClassPair);
  double v73 = ClassPair;

  _Block_object_dispose(&v84, 8);
  return v73;
}

+ (void)verifyProperty:(id)a3 withClass:(Class)a4
{
  v140[1] = *MEMORY[0x263EF8340];
  id v132 = a3;
  if (!objc_msgSend_type(v132, v6, v7))
  {
    uint64_t v86 = (void *)MEMORY[0x263EFF940];
    v87 = NSString;
    double v88 = objc_msgSend_description(v132, v8, v9);
    double v91 = objc_msgSend_stringWithFormat_(v87, v89, v90, @"Cannot register property of unsupported type %@", v88);
    v139 = @"property";
    v140[0] = v132;
    v94 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v92, v93, v140, &v139, 1);
    objc_msgSend_exceptionWithName_reason_userInfo_(v86, v95, v96, @"TMLRuntimeException", v91, v94);
    id v97 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_37;
  }
  objc_msgSend_propertyName(v132, v8, v9);
  id v10 = objc_claimAutoreleasedReturnValue();
  id v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);
  Property = class_getProperty(a4, v13);

  if (Property)
  {
    uint64_t v18 = sub_2398694AC(Property);
    goto LABEL_18;
  }
  objc_msgSend_propertyName(v132, v15, v16);
  double v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v21 = NSSelectorFromString(v20);
  Method InstanceMethod = class_getInstanceMethod(a4, v21);
  if (InstanceMethod)
  {
    id v25 = InstanceMethod;
  }
  else
  {
    uint64_t v26 = NSString;
    uint64_t v27 = objc_msgSend_substringToIndex_(v20, v23, v24, 1);
    double v30 = objc_msgSend_capitalizedString(v27, v28, v29);
    uint64_t v33 = objc_msgSend_substringFromIndex_(v20, v31, v32, 1);
    objc_msgSend_stringWithFormat_(v26, v34, v35, @"is%@%@", v30, v33);
    double v36 = (NSString *)objc_claimAutoreleasedReturnValue();

    v37 = NSSelectorFromString(v36);
    Method v38 = class_getInstanceMethod(a4, v37);
    if (v38)
    {
      id v25 = v38;
    }
    else if (!objc_msgSend_isOptional(v132, v39, v40) {
           || (objc_msgSend_addProperty_toClass_(a1, v41, v42, v132, a4),
    }
               objc_msgSend_propertyName(v132, v43, v44),
               double v45 = (NSString *)objc_claimAutoreleasedReturnValue(),
               v46 = NSSelectorFromString(v45),
               id v25 = class_getInstanceMethod(a4, v46),
               v45,
               !v25))
    {
      double v98 = (void *)MEMORY[0x263EFF940];
      double v124 = NSString;
      v100 = objc_msgSend_description(a4, v41, v42);
      v103 = objc_msgSend_stringWithFormat_(v124, v125, v126, @"Method %@ not found in class %@", v36, v100);
      v137 = @"property";
      id v138 = v132;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v127, v128, &v138, &v137, 1);
      goto LABEL_36;
    }
    double v20 = v36;
  }
  double v47 = method_copyReturnType(v25);
  if (v47)
  {
    id v50 = v47;
    id v51 = [NSString alloc];
    size_t v52 = strlen(v50);
    v55 = (__CFString *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v51, v53, v54, v50, v52, 1, 1);
    uint64_t v58 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v56, v57, v55);
  }
  else
  {
    v55 = @" ";
    uint64_t v58 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v48, v49, @" ");
  }
  uint64_t v18 = v58;

  if (objc_msgSend_isReadonly(v132, v59, v60)) {
    goto LABEL_17;
  }
  v63 = NSString;
  double v64 = objc_msgSend_propertyName(v132, v61, v62);
  uint64_t v67 = objc_msgSend_substringToIndex_(v64, v65, v66, 1);
  double v70 = objc_msgSend_capitalizedString(v67, v68, v69);
  double v73 = objc_msgSend_propertyName(v132, v71, v72);
  v76 = objc_msgSend_substringFromIndex_(v73, v74, v75, 1);
  objc_msgSend_stringWithFormat_(v63, v77, v78, @"set%@%@:", v70, v76);
  v79 = (NSString *)objc_claimAutoreleasedReturnValue();

  v80 = NSSelectorFromString(v79);
  if (!class_getInstanceMethod(a4, v80))
  {
    double v98 = (void *)MEMORY[0x263EFF940];
    v99 = NSString;
    v100 = objc_msgSend_description(a4, v81, v82);
    v103 = objc_msgSend_stringWithFormat_(v99, v101, v102, @"Method %@ not found in class %@", v79, v100);
    double v135 = @"property";
    id v136 = v132;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v104, v105, &v136, &v135, 1);
    double v129 = LABEL_36:;
    objc_msgSend_exceptionWithName_reason_userInfo_(v98, v130, v131, @"TMLRuntimeException", v103, v129);
    id v97 = (id)objc_claimAutoreleasedReturnValue();

LABEL_37:
    objc_exception_throw(v97);
  }
  double v20 = v79;
LABEL_17:

LABEL_18:
  uint64_t v83 = objc_msgSend_type(v132, v17, v19);
  if (v83 != v18
    && (v18 != 4 || v83 != 3)
    && (v18 != 3 || v83 != 4)
    && (v18 != 5 || v83 != 7)
    && (v18 != 16 || (unint64_t)objc_msgSend_type(v132, v84, v85) <= 0xF))
  {
    if (Property) {
      uint64_t v18 = sub_2398694AC(Property);
    }
    v106 = (void *)MEMORY[0x263EFF940];
    v107 = NSString;
    double v108 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v84, v85, v18);
    double v111 = objc_msgSend_description(v132, v109, v110);
    double v114 = objc_msgSend_propertyName(v132, v112, v113);
    double v117 = objc_msgSend_stringWithFormat_(v107, v115, v116, @"Runtime type mismatch %@ vs %@ for %@", v108, v111, v114);
    uint64_t v133 = @"property";
    id v134 = v132;
    v120 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v118, v119, &v134, &v133, 1);
    objc_msgSend_exceptionWithName_reason_userInfo_(v106, v121, v122, @"TMLRuntimeException", v117, v120);
    id v123 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v123);
  }
}

+ (void)addProperty:(id)a3 toClass:(Class)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (objc_msgSend_isOptional(v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_type(v5, v8, v9);
    objc_msgSend_encodedTypeForType_(TMLTypeRegistry, v11, v12, v10);
    id v13 = objc_claimAutoreleasedReturnValue();
    attributes.name = "T";
    attributes.value = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
    long long v62 = xmmword_264DAE368;
    objc_msgSend_propertyName(v5, v16, COERCE_DOUBLE(0x2398C59A5));
    id v17 = objc_claimAutoreleasedReturnValue();
    double v20 = (const char *)objc_msgSend_UTF8String(v17, v18, v19);
    class_addProperty(a4, v20, &attributes, 2u);

    id v21 = imp_implementationWithBlock(&unk_26ECED128);
    objc_msgSend_propertyName(v5, v22, v23);
    double v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v25 = NSSelectorFromString(v24);
    objc_msgSend_stringWithFormat_(NSString, v26, v27, @"%@@:", v13);
    id v28 = objc_claimAutoreleasedReturnValue();
    id v31 = (const char *)objc_msgSend_UTF8String(v28, v29, v30);
    class_addMethod(a4, v25, v21, v31);

    if ((objc_msgSend_isReadonly(v5, v32, v33) & 1) == 0)
    {
      IMP imp = imp_implementationWithBlock(&unk_26ECED148);
      double v34 = NSString;
      v37 = objc_msgSend_propertyName(v5, v35, v36);
      double v40 = objc_msgSend_substringToIndex_(v37, v38, v39, 1);
      v43 = objc_msgSend_capitalizedString(v40, v41, v42);
      v46 = objc_msgSend_propertyName(v5, v44, v45);
      double v49 = objc_msgSend_substringFromIndex_(v46, v47, v48, 1);
      objc_msgSend_stringWithFormat_(v34, v50, v51, @"set%@%@:", v43, v49);
      size_t v52 = (NSString *)objc_claimAutoreleasedReturnValue();

      v53 = NSSelectorFromString(v52);
      objc_msgSend_stringWithFormat_(NSString, v54, v55, @"v@:%@", v13);
      id v56 = objc_claimAutoreleasedReturnValue();
      double v59 = (const char *)objc_msgSend_UTF8String(v56, v57, v58);
      class_addMethod(a4, v53, imp, v59);

      double v24 = v52;
    }
  }
}

+ (void)registerProperty:(id)a3 forObject:(id)a4
{
  id v52 = a3;
  id v6 = a4;
  double v8 = objc_getAssociatedObject(v6, "pmsc");
  if (!v8)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
    double v8 = objc_msgSend_initWithCapacity_(v10, v11, v12, 4);
    objc_setAssociatedObject(v6, "pmsc", v8, (void *)1);
  }
  id v13 = objc_msgSend_propertyName(v52, v7, v9);
  double v16 = objc_msgSend_objectForKeyedSubscript_(v8, v14, v15, v13);

  if (v16) {
    goto LABEL_5;
  }
  double v19 = objc_msgSend_classForObject_(a1, v17, v18, v6);
  uint64_t v22 = objc_msgSend_properties(v19, v20, v21);
  id v25 = objc_msgSend_propertyName(v52, v23, v24);
  double v16 = objc_msgSend_objectForKeyedSubscript_(v22, v26, v27, v25);

  if (v16)
  {
LABEL_5:
    if ((objc_msgSend_isEqual_(v16, v17, v18, v52) & 1) == 0)
    {
      double v40 = (void *)MEMORY[0x263EFF940];
      v41 = NSString;
      double v42 = objc_msgSend_propertyName(v52, v28, v29);
      double v45 = objc_msgSend_tmlIdentifier(v6, v43, v44);
      double v48 = objc_msgSend_stringWithFormat_(v41, v46, v47, @"Attempt to redeclare property %@ for %@", v42, v45);
      objc_msgSend_exceptionWithName_reason_userInfo_(v40, v49, v50, @"TMLRuntimeException", v48, 0);
      id v51 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v51);
    }
  }
  else
  {
    double v30 = objc_msgSend_propertyName(v52, v17, v18);
    objc_msgSend_setObject_forKeyedSubscript_(v8, v31, v32, v52, v30);

    if (objc_msgSend_subclassInstance_(TMLRuntimeObject, v33, v34, v6))
    {
      v37 = objc_msgSend_propertyName(v52, v35, v36);
      objc_msgSend_registerTMLProperty_(v6, v38, v39, v37);
    }
    double v16 = 0;
  }
}

+ (id)property:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_getAssociatedObject(v7, "pmsc");
  double v12 = objc_msgSend_objectForKeyedSubscript_(v8, v9, v10, v6);
  if (!v12)
  {
    id v14 = objc_msgSend_classForObject_(a1, v11, v13, v7);
    id v17 = objc_msgSend_properties(v14, v15, v16);
    double v12 = objc_msgSend_objectForKeyedSubscript_(v17, v18, v19, v6);
  }
  return v12;
}

+ (void)registerMethod:(id)a3 forObject:(id)a4
{
  id v58 = a3;
  id v6 = a4;
  double v8 = objc_getAssociatedObject(v6, "msc");
  if (!v8)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
    double v8 = objc_msgSend_initWithCapacity_(v10, v11, v12, 4);
    objc_setAssociatedObject(v6, "msc", v8, (void *)1);
  }
  double v13 = objc_msgSend_methodName(v58, v7, v9);
  objc_msgSend_objectForKeyedSubscript_(v8, v14, v15, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16) {
    goto LABEL_5;
  }
  double v19 = objc_msgSend_classForObject_(a1, v17, v18, v6);
  uint64_t v22 = objc_msgSend_methods(v19, v20, v21);
  id v25 = objc_msgSend_methodName(v58, v23, v24);
  objc_msgSend_objectForKeyedSubscript_(v22, v26, v27, v25);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
LABEL_5:
    if ((objc_msgSend_isEqual_(v16, v17, v18, v58) & 1) == 0)
    {
      v46 = (void *)MEMORY[0x263EFF940];
      double v47 = NSString;
      double v48 = objc_msgSend_methodName(v58, v17, v18);
      objc_msgSend_stringWithFormat_(v47, v49, v50, @"Attempt to redeclare method %@ for %@", v48, v6);
      goto LABEL_17;
    }
    id v28 = v58;
    if (v16 != v58) {
      goto LABEL_13;
    }
  }
  else
  {
    id v28 = 0;
  }
  double v29 = objc_msgSend_methodName(v58, v17, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v8, v30, v31, v58, v29);

  double v34 = objc_msgSend_methodSelector(v58, v32, v33);
  if (!v34)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_12;
    }
    v46 = (void *)MEMORY[0x263EFF940];
    double v55 = NSString;
    double v48 = objc_msgSend_methodName(v58, v35, v36);
    objc_msgSend_stringWithFormat_(v55, v56, v57, @"Method selector unspecified for %@ in %@", v48, v6);
    id v51 = LABEL_17:;
    objc_msgSend_exceptionWithName_reason_userInfo_(v46, v52, v53, @"TMLRuntimeException", v51, 0);
    id v54 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v54);
  }

LABEL_12:
  uint64_t v37 = objc_opt_class();
  objc_msgSend_verifyMethod_withClass_(a1, v38, v39, v58, v37);
  double v40 = [TMLMethodCall alloc];
  v43 = objc_msgSend_initWithMethodDescriptor_forClass_(v40, v41, v42, v58, v37);
  objc_msgSend_tmlAddMethod_(v6, v44, v45, v43);

  id v16 = v28;
LABEL_13:
}

+ (void)registerSignal:(id)a3 forObject:(id)a4
{
  id v46 = a3;
  id v6 = a4;
  double v8 = objc_getAssociatedObject(v6, "sc");
  if (!v8)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
    double v8 = objc_msgSend_initWithCapacity_(v10, v11, v12, 4);
    objc_setAssociatedObject(v6, "sc", v8, (void *)1);
  }
  double v13 = objc_msgSend_signalName(v46, v7, v9);
  id v16 = objc_msgSend_objectForKeyedSubscript_(v8, v14, v15, v13);

  if (v16) {
    goto LABEL_5;
  }
  double v19 = objc_msgSend_classForObject_(a1, v17, v18, v6);
  uint64_t v22 = objc_msgSend_signals(v19, v20, v21);
  id v25 = objc_msgSend_signalName(v46, v23, v24);
  id v16 = objc_msgSend_objectForKeyedSubscript_(v22, v26, v27, v25);

  if (v16)
  {
LABEL_5:
    if ((objc_msgSend_isEqual_(v16, v17, v18, v46) & 1) == 0)
    {
      double v34 = (void *)MEMORY[0x263EFF940];
      double v39 = NSString;
      double v36 = objc_msgSend_signalName(v46, v17, v18);
      objc_msgSend_stringWithFormat_(v39, v40, v41, @"Attempt to redeclare signal %@ for %@", v36, v6);
      double v42 = LABEL_12:;
      objc_msgSend_exceptionWithName_reason_userInfo_(v34, v43, v44, @"TMLRuntimeException", v42, 0);
      id v45 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v45);
    }
  }
  id v28 = objc_msgSend_methodSelector(v46, v17, v18);

  if (v28)
  {
    double v34 = (void *)MEMORY[0x263EFF940];
    double v35 = NSString;
    double v36 = objc_msgSend_signalName(v46, v29, v30);
    objc_msgSend_stringWithFormat_(v35, v37, v38, @"Attempt to declare signal with method selector %@ for %@", v36, v6);
    goto LABEL_12;
  }
  double v31 = objc_msgSend_signalName(v46, v29, v30);
  objc_msgSend_setObject_forKeyedSubscript_(v8, v32, v33, v46, v31);
}

+ (void)verifyMethod:(id)a3 forProtocol:(id)a4
{
  v137[1] = *MEMORY[0x263EF8340];
  id v129 = a3;
  id v5 = (Protocol *)a4;
  objc_msgSend_methodSelector(v129, v6, v7);
  double v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    id v11 = objc_msgSend_methodName(v129, v8, v10);
    id v14 = objc_msgSend_parameters(v129, v12, v13);
    objc_msgSend_methodSelectorForMethodName_parameters_(TMLMethodDescriptor, v15, v16, v11, v14);
    double v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  id v17 = NSSelectorFromString(v9);
  char v20 = objc_msgSend_isOptional(v129, v18, v19) ^ 1;
  char hasPrefix = objc_msgSend_hasPrefix_(v9, v21, v22, @"+");
  objc_method_description MethodDescription = protocol_getMethodDescription(v5, v17, v20, hasPrefix != 1);
  if (!MethodDescription.name)
  {
    if (objc_msgSend_isOptional(v129, MethodDescription.types, v24)) {
      goto LABEL_30;
    }
    double v95 = (void *)MEMORY[0x263EFF940];
    v103 = NSString;
    Name = protocol_getName(v5);
    v100 = objc_msgSend_stringWithFormat_(v103, v105, v106, @"Method %@ not found in protocol %s", v9, Name);
    id v136 = @"method";
    v137[0] = v129;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v107, v108, v137, &v136, 1);
    v109 = LABEL_37:;
    objc_msgSend_exceptionWithName_reason_userInfo_(v95, v110, v111, @"TMLRuntimeException", v100, v109);
    id v112 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v112);
  }
  uint64_t v26 = objc_msgSend_signatureWithObjCTypes_(MEMORY[0x263EFF970], MethodDescription.types, v24, MethodDescription.types);
  uint64_t v29 = objc_msgSend_numberOfArguments(v26, v27, v28);
  double v32 = objc_msgSend_parameters(v129, v30, v31);
  uint64_t v35 = objc_msgSend_count(v32, v33, v34);

  if (v29 - 2 != v35)
  {
    double v95 = (void *)MEMORY[0x263EFF940];
    double v96 = NSString;
    id v97 = protocol_getName(v5);
    v100 = objc_msgSend_stringWithFormat_(v96, v98, v99, @"Argument count mismatch for method %@ in protocol %s", v9, v97);
    id v134 = @"method";
    id v135 = v129;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v101, v102, &v135, &v134, 1);
    goto LABEL_37;
  }
  if (v29 != 2)
  {
    uint64_t v36 = 2;
    while (1)
    {
      id v37 = v26;
      uint64_t ArgumentTypeAtIndex = objc_msgSend_getArgumentTypeAtIndex_(v37, v38, v39, v36);
      v43 = objc_msgSend_stringWithCString_encoding_(NSString, v41, v42, ArgumentTypeAtIndex, 1);
      uint64_t v46 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v44, v45, v43);

      double v49 = objc_msgSend_parameters(v129, v47, v48);
      id v52 = objc_msgSend_objectAtIndexedSubscript_(v49, v50, v51, v36 - 2);

      uint64_t v55 = objc_msgSend_type(v52, v53, v54);
      if (v55 != v46)
      {
        BOOL v58 = v46 == 4 && v55 == 3;
        if (!v58
          && (v46 != 3 || v55 != 4)
          && (v46 != 5 || v55 != 7)
          && (v46 != 16 || (unint64_t)objc_msgSend_type(v52, v56, v57) <= 0xF))
        {
          break;
        }
      }

      if (v29 == ++v36) {
        goto LABEL_19;
      }
    }
    v74 = (void *)MEMORY[0x263EFF940];
    double v75 = NSString;
    v76 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v56, v57, v46);
    v79 = objc_msgSend_description(v52, v77, v78);
    double v82 = objc_msgSend_propertyName(v52, v80, v81);
    double v85 = objc_msgSend_methodName(v129, v83, v84);
    double v88 = objc_msgSend_stringWithFormat_(v75, v86, v87, @"Runtime type mismatch %@ vs %@ for argument %@ in method %@", v76, v79, v82, v85);
    v132[0] = @"property";
    v132[1] = @"method";
    v133[0] = v52;
    v133[1] = v129;
    double v91 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v89, v90, v133, v132, 2);
    objc_msgSend_exceptionWithName_reason_userInfo_(v74, v92, v93, @"TMLRuntimeException", v88, v91);
    id v94 = (id)objc_claimAutoreleasedReturnValue();

LABEL_34:
    objc_exception_throw(v94);
  }
LABEL_19:
  id v59 = v26;
  uint64_t v62 = objc_msgSend_methodReturnType(v59, v60, v61);
  v65 = objc_msgSend_stringWithCString_encoding_(NSString, v63, v64, v62, 1);
  uint64_t v68 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v66, v67, v65);

  uint64_t v71 = objc_msgSend_returnType(v129, v69, v70);
  if (v71 != v68
    && (v68 != 4 || v71 != 3)
    && (v68 != 3 || v71 != 4)
    && (v68 != 5 || v71 != 7)
    && (v68 != 16 || (unint64_t)objc_msgSend_returnType(v129, v72, v73) <= 0xF))
  {
    double v113 = (void *)MEMORY[0x263EFF940];
    double v114 = NSString;
    v76 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v72, v73, v68);
    uint64_t v117 = objc_msgSend_returnType(v129, v115, v116);
    v79 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v118, v119, v117);
    double v82 = objc_msgSend_methodName(v129, v120, v121);
    double v85 = objc_msgSend_stringWithFormat_(v114, v122, v123, @"Runtime type mismatch %@ vs %@ for return type in method %@", v76, v79, v82);
    v130 = @"method";
    id v131 = v129;
    double v126 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v124, v125, &v131, &v130, 1);
    objc_msgSend_exceptionWithName_reason_userInfo_(v113, v127, v128, @"TMLRuntimeException", v85, v126);
    id v94 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_34;
  }

LABEL_30:
}

+ (void)verifyMethod:(id)a3 withClass:(Class)a4
{
  v128[1] = *MEMORY[0x263EF8340];
  id v120 = a3;
  double v7 = objc_msgSend_methodSelector(v120, v5, v6);
  if (objc_msgSend_hasPrefix_(v7, v8, v9, @"+"))
  {
    objc_msgSend_substringFromIndex_(v7, v10, v11, 1);
    double v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    double v13 = NSSelectorFromString(v12);
    ClassMethod = class_getClassMethod(a4, v13);
    double v7 = v12;
    if (ClassMethod) {
      goto LABEL_3;
    }
LABEL_29:
    if (objc_msgSend_isOptional(v120, v14, v16)) {
      goto LABEL_30;
    }
    v103 = (void *)MEMORY[0x263EFF940];
    double v111 = NSString;
    double v105 = objc_msgSend_description(a4, v80, v81);
    double v108 = objc_msgSend_stringWithFormat_(v111, v112, v113, @"Method %@ not found in class %@", v7, v105);
    v127 = @"method";
    v128[0] = v120;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v114, v115, v128, &v127, 1);
    double v116 = LABEL_36:;
    objc_msgSend_exceptionWithName_reason_userInfo_(v103, v117, v118, @"TMLRuntimeException", v108, v116);
    id v119 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v119);
  }
  v79 = NSSelectorFromString((NSString *)v7);
  ClassMethod = class_getInstanceMethod(a4, v79);
  if (!ClassMethod) {
    goto LABEL_29;
  }
LABEL_3:
  uint64_t v17 = method_getNumberOfArguments(ClassMethod) - 2;
  char v20 = objc_msgSend_parameters(v120, v18, v19);
  uint64_t v23 = objc_msgSend_count(v20, v21, v22);

  if (v23 != v17)
  {
    v103 = (void *)MEMORY[0x263EFF940];
    double v104 = NSString;
    double v105 = objc_msgSend_description(a4, v24, v25);
    double v108 = objc_msgSend_stringWithFormat_(v104, v106, v107, @"Argument count mismatch for method %@ in class %@", v7, v105);
    double v125 = @"method";
    id v126 = v120;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v109, v110, &v126, &v125, 1);
    goto LABEL_36;
  }
  if (v17)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      double v27 = method_copyArgumentType(ClassMethod, (int)i + 2);
      double v30 = objc_msgSend_stringWithCString_encoding_(NSString, v28, v29, v27, 1);
      uint64_t v33 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v31, v32, v30);

      free(v27);
      uint64_t v36 = objc_msgSend_parameters(v120, v34, v35);
      double v39 = objc_msgSend_objectAtIndexedSubscript_(v36, v37, v38, i);

      uint64_t v42 = objc_msgSend_type(v39, v40, v41);
      if (v42 != v33)
      {
        BOOL v45 = v33 == 4 && v42 == 3;
        if (!v45
          && (v33 != 3 || v42 != 4)
          && (v33 != 5 || v42 != 7)
          && (v33 != 16 || (unint64_t)objc_msgSend_type(v39, v43, v44) <= 0xF))
        {
          double v82 = (void *)MEMORY[0x263EFF940];
          uint64_t v83 = NSString;
          double v84 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v43, v44, v33);
          double v87 = objc_msgSend_description(v39, v85, v86);
          double v90 = objc_msgSend_propertyName(v39, v88, v89);
          double v93 = objc_msgSend_methodName(v120, v91, v92);
          double v96 = objc_msgSend_stringWithFormat_(v83, v94, v95, @"Runtime type mismatch %@ vs %@ for argument %@ in method %@", v84, v87, v90, v93);
          v123[0] = @"property";
          v123[1] = @"method";
          v124[0] = v39;
          v124[1] = v120;
          double v99 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v97, v98, v124, v123, 2);
          objc_msgSend_exceptionWithName_reason_userInfo_(v82, v100, v101, @"TMLRuntimeException", v96, v99);
          id v102 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v102);
        }
      }
    }
  }
  uint64_t v46 = method_copyReturnType(ClassMethod);
  double v49 = objc_msgSend_stringWithCString_encoding_(NSString, v47, v48, v46, 1);
  uint64_t v52 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v50, v51, v49);

  free(v46);
  uint64_t v55 = objc_msgSend_returnType(v120, v53, v54);
  if (v55 != v52
    && (v52 != 4 || v55 != 3)
    && (v52 != 3 || v55 != 4)
    && (v52 != 5 || v55 != 7)
    && (v52 != 16 || (unint64_t)objc_msgSend_returnType(v120, v56, v57) <= 0xF))
  {
    BOOL v58 = (void *)MEMORY[0x263EFF940];
    id v59 = NSString;
    double v60 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v56, v57, v52);
    uint64_t v63 = objc_msgSend_returnType(v120, v61, v62);
    double v66 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v64, v65, v63);
    double v69 = objc_msgSend_methodName(v120, v67, v68);
    double v72 = objc_msgSend_stringWithFormat_(v59, v70, v71, @"Runtime type mismatch %@ vs %@ for return type in method %@", v60, v66, v69);
    double v121 = @"method";
    id v122 = v120;
    double v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v73, v74, &v122, &v121, 1);
    objc_msgSend_exceptionWithName_reason_userInfo_(v58, v76, v77, @"TMLRuntimeException", v72, v75);
    id v78 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v78);
  }
LABEL_30:
}

+ (id)signal:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v39 = 0;
  double v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_2398686A4;
  v43 = sub_2398686B4;
  id v44 = 0;
  double v8 = objc_getAssociatedObject(v7, "ppmsc");
  if (v8)
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_23986ADB4;
    v35[3] = &unk_264DAE3A0;
    double v38 = &v39;
    id v36 = v6;
    id v37 = v7;
    objc_msgSend_enumerateObjectsUsingBlock_(v8, v9, v10, v35);
    double v11 = (void *)v40[5];
    if (v11)
    {
      id v12 = v11;

      id v13 = v36;
      goto LABEL_17;
    }
  }
  objc_getAssociatedObject(v7, "sc");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v13, v14, v15, v6);
  uint64_t v17 = (void *)v40[5];
  v40[5] = v16;

  char v20 = (void *)v40[5];
  if (!v20)
  {
    uint64_t v21 = objc_msgSend_classForObject_(a1, v18, v19, v7);
    double v24 = (void *)v21;
    if (v40[5] || !v21)
    {
      double v32 = (void *)v21;
    }
    else
    {
      do
      {
        double v25 = objc_msgSend_signals(v24, v22, v23);
        uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v25, v26, v27, v6);
        double v29 = (void *)v40[5];
        v40[5] = v28;

        double v32 = objc_msgSend_superClass(v24, v30, v31);

        if (v40[5]) {
          BOOL v33 = 1;
        }
        else {
          BOOL v33 = v32 == 0;
        }
        double v24 = v32;
      }
      while (!v33);
    }

    char v20 = (void *)v40[5];
  }
  id v12 = v20;
LABEL_17:

  _Block_object_dispose(&v39, 8);
  return v12;
}

+ (id)classForObject:(id)a3
{
  unint64_t v3 = (unint64_t)a3;
  id v4 = objc_getAssociatedObject((id)v3, "ccppmsc");
  if (!v4)
  {
    Superclass = objc_opt_class();
    uint64_t v6 = objc_getAssociatedObject(Superclass, "ccppmsc");
    id v4 = (void *)v6;
    BOOL v7 = v6 == 0;
    if (Superclass && !v6)
    {
      do
      {
        Superclass = class_getSuperclass((Class)Superclass);
        uint64_t v8 = objc_getAssociatedObject(Superclass, "ccppmsc");
        id v4 = (void *)v8;
        BOOL v7 = v8 == 0;
      }
      while (Superclass && !v8);
    }
    if ((v3 & 0x8000000000000000) == 0 && !v7) {
      objc_setAssociatedObject((id)v3, "ccppmsc", v4, (void *)1);
    }
  }
  id v9 = v4;

  return v9;
}

+ (id)childClassForName:(id)a3 inClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = v7;
  if (v7)
  {
    uint64_t v28 = 0;
    double v29 = &v28;
    uint64_t v30 = 0x3032000000;
    double v31 = sub_2398686A4;
    double v32 = sub_2398686B4;
    id v33 = 0;
    double v10 = objc_msgSend_childClasses(v7, v8, COERCE_DOUBLE(0x3032000000));
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    double v24 = sub_23986B124;
    double v25 = &unk_264DAE3C8;
    id v11 = v6;
    id v26 = v11;
    double v27 = &v28;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v12, v13, &v22);

    uint64_t v16 = (void *)v29[5];
    if (v16)
    {
      id v17 = v16;
    }
    else
    {
      double v18 = objc_msgSend_superClass(v9, v14, v15, v22, v23, v24, v25);
      objc_msgSend_childClassForName_inClass_(a1, v19, v20, v11, v18);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)classForName:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_((void *)qword_268A05878, a2, v3, a3);
}

+ (id)protocolForName:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_((void *)qword_268A05880, a2, v3, a3);
}

+ (id)property:(id)a3 forClass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v9 = objc_msgSend_properties(v6, v7, v8);
  id v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, v11, v5);

  while (!v12 && v6)
  {
    double v15 = v6;
    objc_msgSend_superClass(v6, v13, v14);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    double v18 = objc_msgSend_properties(v6, v16, v17);
    id v12 = objc_msgSend_objectForKeyedSubscript_(v18, v19, v20, v5);
  }
  return v12;
}

+ (id)propertyWithKeyPath:(id)a3 inClass:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (qword_268A058E0 != -1) {
    dispatch_once(&qword_268A058E0, &unk_26ECED168);
  }
  unint64_t v10 = 0x263F08000uLL;
  double v11 = NSString;
  double v13 = objc_msgSend_objcClassName(v8, v7, v9);
  if (v13) {
    objc_msgSend_objcClassName(v8, v12, v14);
  }
  else {
  double v15 = objc_msgSend_className(v8, v12, v14);
  }
  double v18 = objc_msgSend_stringWithFormat_(v11, v16, v17, @"%@:%@", v15, v6);

  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A058D8, v19, v20, v18);
  if (!v22)
  {
    uint64_t v24 = objc_msgSend_rangeOfString_(v6, v21, v23, @".");
    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v22 = objc_msgSend_property_forClass_(a1, v25, v26, v6, v8);
      if (v22)
      {
LABEL_9:
        objc_msgSend_setObject_forKeyedSubscript_((void *)qword_268A058D8, v27, v28, v22, v18);
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v29 = v24;
      uint64_t v30 = objc_msgSend_substringToIndex_(v6, v25, v26, v24);
      id v33 = objc_msgSend_property_forClass_(a1, v31, v32, v30, v8);
      id v36 = v33;
      if (v33)
      {
        id v37 = objc_msgSend_typeClassName(v33, v34, v35);
        double v40 = objc_msgSend_classForName_(a1, v38, v39, v37);

        if (!v40)
        {
          double v60 = (void *)MEMORY[0x263EFF940];
          double v61 = NSString;
          double v62 = objc_msgSend_typeClassName(v36, v41, v42);
          double v65 = objc_msgSend_stringWithFormat_(v61, v63, v64, @"Attempt to access undeclared class %@", v62);
          objc_msgSend_exceptionWithName_reason_userInfo_(v60, v66, v67, @"TMLRuntimeException", v65, 0);
          id v68 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v68);
        }
        v43 = objc_msgSend_substringFromIndex_(v6, v41, v42, v29 + 1);
        uint64_t v22 = objc_msgSend_propertyWithKeyPath_inClass_(a1, v44, v45, v43, v40);

        unint64_t v10 = 0x263F08000;
      }
      else
      {
        uint64_t v22 = 0;
      }

      if (v22) {
        goto LABEL_9;
      }
    }
    uint64_t v46 = objc_msgSend_objcClass(v8, v27, v28);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend_tmlPropertyWithKeyPath_(v46, v47, v48, v6),
          (uint64_t v22 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      double v51 = (void *)MEMORY[0x263EFF940];
      uint64_t v52 = *(void **)(v10 + 2880);
      double v53 = objc_msgSend_className(v8, v47, v48);
      id v56 = objc_msgSend_stringWithFormat_(v52, v54, v55, @"Attempt to access undeclared property %@ in class %@", v6, v53);
      objc_msgSend_exceptionWithName_reason_userInfo_(v51, v57, v58, @"TMLRuntimeException", v56, 0);
      id v59 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v59);
    }
  }
LABEL_17:
  id v49 = v22;

  return v49;
}

+ (id)propertyWithKeyPath:(id)a3 forObject:(id)a4
{
  v56[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v10 = objc_msgSend_tmlParent(v7, v8, v9);
    double v11 = objc_getAssociatedObject(v10, "pmsc");
  }
  else
  {
    double v11 = objc_getAssociatedObject(v7, "pmsc");
  }
  id v12 = v6;
  uint64_t v16 = objc_msgSend_rangeOfString_(v12, v13, v14, @".");
  double v18 = v12;
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v18 = objc_msgSend_substringToIndex_(v12, v15, v17, v16);
  }
  double v19 = objc_msgSend_objectForKeyedSubscript_(v11, v15, v17, v18);
  uint64_t v22 = v19;
  if (v19)
  {
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v23 = v19;
    }
    else
    {
      double v28 = objc_msgSend_typeClassName(v19, v20, v21);
      double v31 = objc_msgSend_classForName_(a1, v29, v30, v28);

      double v34 = objc_msgSend_substringFromIndex_(v12, v32, v33, v16 + 1);
      objc_msgSend_propertyWithKeyPath_inClass_(a1, v35, v36, v34, v31);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v24 = objc_msgSend_classForObject_(a1, v20, v21, v7);
    if (!v24)
    {
      double v38 = (void *)MEMORY[0x263EFF940];
      double v39 = NSString;
      uint64_t v40 = objc_opt_class();
      v43 = objc_msgSend_stringWithFormat_(v39, v41, v42, @"Attempt to access undeclared class %@", v40);
      double v55 = @"identifier";
      uint64_t v46 = objc_msgSend_tmlIdentifier(v7, v44, v45);
      id v49 = (void *)v46;
      double v50 = &stru_26ECF02A8;
      if (v46) {
        double v50 = (__CFString *)v46;
      }
      v56[0] = v50;
      double v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v47, v48, v56, &v55, 1);
      objc_msgSend_exceptionWithName_reason_userInfo_(v38, v52, v53, @"TMLRuntimeException", v43, v51);
      id v54 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v54);
    }
    double v27 = (void *)v24;
    objc_msgSend_propertyWithKeyPath_inClass_(TMLRuntime, v25, v26, v12, v24);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v23;
}

+ (id)ensurePropertyWithKeyPath:(id)a3 forObject:(id)a4 writable:(BOOL)a5
{
  BOOL v5 = a5;
  v47[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v12 = objc_msgSend_propertyWithKeyPath_forObject_(a1, v10, v11, v8, v9);
  if (!v12)
  {
    double v17 = (void *)MEMORY[0x263EFF940];
    double v18 = NSString;
    uint64_t v19 = objc_opt_class();
    uint64_t v22 = objc_msgSend_stringWithFormat_(v18, v20, v21, @"Attempt to access undeclared property %@ in class %@", v8, v19);
    uint64_t v46 = @"identifier";
    uint64_t v25 = objc_msgSend_tmlIdentifier(v9, v23, v24);
    double v28 = (void *)v25;
    uint64_t v29 = &stru_26ECF02A8;
    if (v25) {
      uint64_t v29 = (__CFString *)v25;
    }
    v47[0] = v29;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, v27, v47, &v46, 1);
    uint64_t v40 = LABEL_13:;
    objc_msgSend_exceptionWithName_reason_userInfo_(v17, v41, v42, @"TMLRuntimeException", v22, v40);
    id v43 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v43);
  }
  double v15 = v12;
  if (v5 && objc_msgSend_isReadonly(v12, v13, v14))
  {
    double v17 = (void *)MEMORY[0x263EFF940];
    double v30 = NSString;
    uint64_t v31 = objc_opt_class();
    uint64_t v22 = objc_msgSend_stringWithFormat_(v30, v32, v33, @"Attempt to modify read-only property %@ in class %@", v8, v31);
    id v44 = @"identifier";
    uint64_t v36 = objc_msgSend_tmlIdentifier(v9, v34, v35);
    double v28 = (void *)v36;
    double v39 = &stru_26ECF02A8;
    if (v36) {
      double v39 = (__CFString *)v36;
    }
    double v45 = v39;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v37, v38, &v45, &v44, 1);
    goto LABEL_13;
  }

  return v15;
}

+ (id)ensureClass:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_classForName_(a1, v5, v6, v4);
  if (!v7)
  {
    id v12 = (void *)MEMORY[0x263EFF940];
    double v13 = objc_msgSend_stringWithFormat_(NSString, v8, v9, @"Attempt to access undeclared class %@", v4);
    objc_msgSend_exceptionWithName_reason_userInfo_(v12, v14, v15, @"TMLRuntimeException", v13, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }
  unint64_t v10 = (void *)v7;

  return v10;
}

@end