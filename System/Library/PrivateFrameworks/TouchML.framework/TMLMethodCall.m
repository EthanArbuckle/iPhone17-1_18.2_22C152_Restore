@interface TMLMethodCall
- (BOOL)classMethod;
- (NSString)methodName;
- (TMLMethodCall)callWithArguments:(id)a3;
- (TMLMethodCall)initWithMethodDescriptor:(id)a3 forClass:(Class)a4;
- (id)_callWithArguments:(id)a3;
@end

@implementation TMLMethodCall

- (TMLMethodCall)initWithMethodDescriptor:(id)a3 forClass:(Class)a4
{
  v110[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v108.receiver = self;
  v108.super_class = (Class)TMLMethodCall;
  v8 = [(TMLMethodCall *)&v108 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_38;
  }
  objc_storeStrong((id *)&v8->_methodDescriptor, a3);
  v12 = objc_msgSend_methodSelector(v7, v10, v11);
  if (objc_msgSend_hasPrefix_(v12, v13, v14, @"+"))
  {
    v9->_BOOL classSelector = 1;
    uint64_t v17 = objc_msgSend_substringFromIndex_(v12, v15, v16, 1);

    v12 = (void *)v17;
  }
  SEL v18 = NSSelectorFromString((NSString *)v12);
  if (!v18)
  {
    SEL v23 = 0;
    p_BOOL classSelector = &v9->_classSelector;
    BOOL classSelector = v9->_classSelector;
    v9->_SEL selector = 0;
    if (classSelector)
    {
      objc_msgSend_methodSignatureForSelector_(a4, v19, v20, 0);
      goto LABEL_11;
    }
LABEL_12:
    uint64_t v25 = objc_msgSend_instanceMethodSignatureForSelector_(a4, v19, v20, v23);
    goto LABEL_13;
  }
  p_BOOL classSelector = &v9->_classSelector;
  BOOL v21 = v9->_classSelector;
  v9->_SEL selector = v18;
  if (!v21)
  {
    SEL v23 = v18;
    goto LABEL_12;
  }
  objc_msgSend_methodSignatureForSelector_(a4, v19, v20, v18);
  uint64_t v25 = LABEL_11:;
LABEL_13:
  v26 = (void *)v25;
  id v27 = objc_alloc(MEMORY[0x263F089D8]);
  v30 = v27;
  if (v26)
  {
    id v31 = v26;
    uint64_t v34 = objc_msgSend_methodReturnType(v31, v32, v33);
    v37 = objc_msgSend_initWithCString_encoding_(v30, v35, v36, v34, 1);
    unint64_t v41 = objc_msgSend_numberOfArguments(v31, v38, v39);
    if (v41 >= 3)
    {
      v107 = v26;
      v43 = a4;
      for (uint64_t i = 2; i != v41; ++i)
      {
        id v45 = v31;
        uint64_t ArgumentTypeAtIndex = objc_msgSend_getArgumentTypeAtIndex_(v45, v46, v47, i);
        objc_msgSend_appendFormat_(v37, v49, v50, @"%s", ArgumentTypeAtIndex);
      }
      a4 = v43;
      v26 = v107;
    }
  }
  else
  {
    v37 = objc_msgSend_initWithString_(v27, v28, v29, @"optional");
    unint64_t v41 = 0;
  }
  if (qword_268A05800 != -1) {
    dispatch_once(&qword_268A05800, &unk_26ECEC508);
  }
  uint64_t v51 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268A057F8, v40, v42, v37);
  id block = v9->_block;
  v9->_id block = (id)v51;

  if (!v9->_block)
  {
    if (v41 >= 0xB)
    {
      v91 = (void *)MEMORY[0x263EFF940];
      v92 = NSString;
      v93 = objc_msgSend_methodSelector(v7, v53, v54);
      v96 = objc_msgSend_description(a4, v94, v95);
      v99 = objc_msgSend_stringWithFormat_(v92, v97, v98, @"Unsupported number of arguments for method %@ in class %@", v93, v96);
      v109 = @"method";
      v110[0] = v7;
      v102 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v100, v101, v110, &v109, 1);
      objc_msgSend_exceptionWithName_reason_userInfo_(v91, v103, v104, @"TMLRuntimeException", v99, v102);
      id v105 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v105);
    }
    uint64_t v55 = objc_msgSend_invocationWithMethodSignature_(MEMORY[0x263EFF958], v53, v54, v26);
    invocation = v9->_invocation;
    v9->_invocation = (NSInvocation *)v55;

    v59 = v9->_invocation;
    SEL selector = v9->_selector;
    if (selector) {
      objc_msgSend_setSelector_(v59, v57, v58, selector);
    }
    else {
      objc_msgSend_setSelector_(v59, v57, v58, 0);
    }
    if (*p_classSelector) {
      objc_msgSend_setTarget_(v9->_invocation, v61, v62, a4);
    }
  }
  if (v41 >= 3)
  {
    v63 = v26;
    v106 = v12;
    id v64 = objc_alloc(MEMORY[0x263EFF980]);
    v68 = objc_msgSend_initWithCapacity_(v64, v65, v66, v41 - 2);
    uint64_t v70 = 2;
    while (1)
    {
      id v71 = v7;
      v72 = objc_msgSend_parameters(v7, v67, v69);
      v75 = objc_msgSend_objectAtIndexedSubscript_(v72, v73, v74, v70 - 2);
      uint64_t v78 = objc_msgSend_type(v75, v76, v77);

      if (v78 != 3) {
        goto LABEL_34;
      }
      id v81 = v63;
      v84 = (const char *)objc_msgSend_getArgumentTypeAtIndex_(v81, v82, v83, v70);
      if (strcmp(v84, "d")) {
        break;
      }
      objc_msgSend_numberWithUnsignedInteger_(NSNumber, v79, v80, 4);
      v85 = LABEL_35:;
      objc_msgSend_addObject_(v68, v86, v87, v85);

      ++v70;
      id v7 = v71;
      if (v41 == v70)
      {
        uint64_t v88 = objc_msgSend_copy(v68, v67, v69);
        argTypes = v9->_argTypes;
        v9->_argTypes = (NSArray *)v88;

        v12 = v106;
        v26 = v63;
        goto LABEL_37;
      }
    }
    uint64_t v78 = 3;
LABEL_34:
    objc_msgSend_numberWithUnsignedInteger_(NSNumber, v79, v80, v78);
    goto LABEL_35;
  }
LABEL_37:

LABEL_38:
  return v9;
}

- (NSString)methodName
{
  return (NSString *)objc_msgSend_methodName(self->_methodDescriptor, a2, v2);
}

- (TMLMethodCall)callWithArguments:(id)a3
{
  v5 = objc_msgSend__callWithArguments_(self, a2, v3, a3);
  v6 = [TMLValue alloc];
  uint64_t v9 = objc_msgSend_returnType(self->_methodDescriptor, v7, v8);
  v12 = objc_msgSend_initWithValue_valueType_(v6, v10, v11, v5, v9);

  return (TMLMethodCall *)v12;
}

- (id)_callWithArguments:(id)a3
{
  uint64_t v3 = MEMORY[0x270FA5388](self, a2, a3);
  v272[1] = *MEMORY[0x263EF8340];
  id v5 = v4;
  uint64_t v8 = objc_msgSend_count(v5, v6, v7);
  double v11 = objc_msgSend_parameters(*(void **)(v3 + 8), v9, v10);
  uint64_t v14 = objc_msgSend_count(v11, v12, v13) + 1;

  uint64_t v233 = v3;
  if (v8 != v14)
  {
    v204 = (void *)MEMORY[0x263EFF940];
    v205 = NSString;
    v206 = objc_msgSend_methodSelector(*(void **)(v3 + 8), v15, v16);
    if (*(void *)(v3 + 16)) {
      v207 = *(const char **)(v3 + 16);
    }
    else {
      v207 = 0;
    }
    v208 = NSStringFromSelector(v207);
    v211 = objc_msgSend_stringWithFormat_(v205, v209, v210, @"Argument count mismatch for method %@ with selector %@", v206, v208);
    uint64_t v212 = *(void *)(v3 + 8);
    v271 = @"method";
    v272[0] = v212;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v213, v214, v272, &v271, 1);
    v222 = LABEL_98:;
    objc_msgSend_exceptionWithName_reason_userInfo_(v204, v223, v224, @"TMLRuntimeException", v211, v222);
    id v225 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v225);
  }
  uint64_t v17 = objc_msgSend_firstObject(v5, v15, v16);
  unint64_t v20 = objc_msgSend_count(v5, v18, v19);
  if (v20 >= 2)
  {
    unint64_t v23 = v20;
    v228 = v17;
    for (uint64_t i = 1; i != v23; ++i)
    {
      uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v5, v21, v22, i);
      v28 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(v3 + 48), v26, v27, i - 1);
      uint64_t v31 = objc_msgSend_unsignedIntegerValue(v28, v29, v30);
      uint64_t v34 = objc_msgSend_normalizeValue_toType_(TMLJSEnvironment, v32, v33, v25, v31);

      if (!v34)
      {
        uint64_t v34 = objc_msgSend_null(MEMORY[0x263EFF9D0], v35, v36);
      }
      if (v25 != v34)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v39 = objc_msgSend_mutableCopy(v5, v37, v38);

          id v5 = (id)v39;
        }
        objc_msgSend_replaceObjectAtIndex_withObject_(v5, v37, v38, i, v34);
      }
    }
    if (*(void *)(v3 + 40))
    {
      v231 = v5;
      v232 = (void **)(v3 + 40);
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      double v45 = 0.0;
      long long v269 = 0u;
      long long v270 = 0u;
      long long v267 = 0u;
      long long v268 = 0u;
      unint64_t v46 = v23 - 1;
      long long v266 = 0u;
      long long v259 = 0u;
      double v47 = v254;
      v48 = v261;
      long long v258 = 0u;
      long long v257 = 0u;
      v49 = v262;
      long long v256 = 0u;
      long long v255 = 0u;
      unint64_t v226 = v46;
      while (1)
      {
        v234 = v48;
        uint64_t v235 = v44 + 2;
        double v50 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(v3 + 48), v21, v45, v44);
        uint64_t v53 = objc_msgSend_unsignedIntegerValue(v50, v51, v52);

        switch(v53)
        {
          case 2:
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v265[v44 + 192] = objc_msgSend_BOOLValue(v77, v78, v79);
            goto LABEL_43;
          case 3:
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            objc_msgSend_floatValue(v77, v80, v81);
            *(_DWORD *)&v265[4 * v44 + 156] = v82;
            goto LABEL_43;
          case 4:
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            objc_msgSend_doubleValue(v77, v83, v84);
            *(void *)&v265[8 * v44 + 80] = v85;
            goto LABEL_43;
          case 5:
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            uint64_t v88 = objc_msgSend_unsignedIntegerValue(v77, v86, v87);
            v89 = &v264;
            goto LABEL_25;
          case 6:
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            uint64_t v88 = objc_msgSend_integerValue(v77, v90, v91);
            v89 = (uint64_t *)v265;
            goto LABEL_25;
          case 7:
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            uint64_t v88 = objc_msgSend_unsignedLongLongValue(v77, v92, v93);
            v89 = &v263;
LABEL_25:
            v89[v44] = v88;
            goto LABEL_43;
          case 8:
            v94 = &v262[v42 + 1056];
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            objc_msgSend_CGSizeValue(v77, v95, v96);
            goto LABEL_40;
          case 9:
            v99 = &v262[v41 + 768];
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            objc_msgSend_CGRectValue(v77, v100, v101);
            goto LABEL_42;
          case 10:
            v94 = &v262[v42 + 576];
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            objc_msgSend_CGPointValue(v77, v106, v107);
            goto LABEL_40;
          case 11:
            objc_super v108 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v111 = v108;
            if (v108)
            {
              objc_msgSend_CGAffineTransformValue(v108, v109, v110);
            }
            else
            {
              long long v245 = 0u;
              long long v246 = 0u;
              long long v244 = 0u;
            }
            uint64_t v3 = v233;
            long long v143 = v245;
            *(_OWORD *)v49 = v244;
            *((_OWORD *)v49 + 1) = v143;
            *((_OWORD *)v49 + 2) = v246;

            objc_msgSend_setArgument_atIndex_(*v232, v144, v145, v49, v235);
            goto LABEL_45;
          case 12:
            v112 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            v115 = v112;
            if (v112)
            {
              objc_msgSend_CATransform3DValue(v112, v113, v114);
            }
            else
            {
              long long v250 = 0u;
              long long v251 = 0u;
              long long v248 = 0u;
              long long v249 = 0u;
              long long v246 = 0u;
              long long v247 = 0u;
              long long v244 = 0u;
              long long v245 = 0u;
            }
            uint64_t v3 = v233;
            long long v146 = v249;
            v147 = (long long *)&v261[v42];
            v147[4] = v248;
            v147[5] = v146;
            long long v148 = v251;
            v147[6] = v250;
            v147[7] = v148;
            long long v149 = v245;
            long long *v147 = v244;
            v147[1] = v149;
            long long v150 = v247;
            v147[2] = v246;
            v147[3] = v150;

            v138 = v234;
            objc_msgSend_setArgument_atIndex_(*v232, v151, v152, v234, v235);
            goto LABEL_46;
          case 13:
            v99 = &v260[v41 + 512];
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            objc_msgSend_UIEdgeInsetsValue(v77, v116, v117);
            goto LABEL_42;
          case 14:
            v118 = (uint64_t *)&v260[v42];
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            uint64_t *v118 = objc_msgSend_rangeValue(v77, v119, v120);
            v118[1] = v121;
            goto LABEL_43;
          case 15:
            v122 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            *((void *)&v256 + v44) = v122;

            goto LABEL_36;
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
            __s1 = v49;
            v56 = v47;
            unint64_t v57 = v46;
            uint64_t v58 = v42;
            uint64_t v59 = v41;
            uint64_t v60 = v40;
            uint64_t v61 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            double v62 = (void *)*((void *)&v267 + v44);
            *((void *)&v267 + v44) = v61;

            v63 = (void *)*((void *)&v267 + v44);
            double v66 = objc_msgSend_null(MEMORY[0x263EFF9D0], v64, v65);

            if (v63 == v66)
            {
              double v69 = (void *)*((void *)&v267 + v44);
              *((void *)&v267 + v44) = 0;
            }
            objc_msgSend_setArgument_atIndex_(*v232, v67, v68, (char *)&v267 + v43, v235);
            uint64_t v3 = v233;
            uint64_t v40 = v60;
            uint64_t v41 = v59;
            uint64_t v42 = v58;
            unint64_t v46 = v57;
            double v47 = v56;
            v49 = __s1;
            goto LABEL_45;
          case 27:
            objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            id v123 = objc_claimAutoreleasedReturnValue();
            __s1a = (char *)objc_msgSend_objCType(v123, v124, v125);

            objc_msgSend_methodSignature(*v232, v126, v127);
            id v128 = objc_claimAutoreleasedReturnValue();
            __s2 = (char *)objc_msgSend_getArgumentTypeAtIndex_(v128, v129, v130, v235);

            if (strcmp(__s1a, __s2))
            {
              v204 = (void *)MEMORY[0x263EFF940];
              v215 = NSString;
              v206 = objc_msgSend_methodSelector(*(void **)(v233 + 8), v131, v132);
              if (*(void *)(v233 + 16)) {
                v216 = *(const char **)(v233 + 16);
              }
              else {
                v216 = 0;
              }
              v208 = NSStringFromSelector(v216);
              v211 = objc_msgSend_stringWithFormat_(v215, v217, v218, @"Struct argument type mismatch for method %@ with selector %@", v206, v208);
              uint64_t v219 = *(void *)(v233 + 8);
              v252 = @"method";
              uint64_t v253 = v219;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v220, v221, &v253, &v252, 1);
              goto LABEL_98;
            }
            v133 = objc_msgSend_objectAtIndexedSubscript_(v231, v131, v132, v44 + 1);
            objc_msgSend_getValue_(v133, v134, v135, v47);

            objc_msgSend_setArgument_atIndex_(*v232, v136, v137, v47, v235);
            uint64_t v3 = v233;
            v138 = v234;
            unint64_t v46 = v226;
LABEL_46:
            ++v44;
            v43 += 8;
            v42 += 16;
            v47 += 64;
            v48 = v138 + 16;
            v49 += 48;
            v41 += 32;
            v40 += 4;
            if (v46 == v44)
            {
              id v5 = v231;
              v153 = v232;
              uint64_t v17 = v228;
              goto LABEL_54;
            }
            break;
          case 28:
            long long v244 = 0uLL;
            v73 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            objc_msgSend_getValue_(v73, v74, v75, &v244);

            double v72 = *(double *)&v244;
            *(_OWORD *)&v262[v42 + 416] = v244;
            v76 = *v232;
            goto LABEL_44;
          case 29:
            v94 = &v254[v42 + 544];
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            objc_msgSend_UIOffsetValue(v77, v139, v140);
LABEL_40:
            *(void *)v94 = v97;
            *((void *)v94 + 1) = v98;
            goto LABEL_43;
          case 30:
            v99 = &v260[v41 + 192];
            double v77 = objc_msgSend_objectAtIndexedSubscript_(v231, v54, v55, v44 + 1);
            objc_msgSend_directionalEdgeInsetsValue(v77, v141, v142);
LABEL_42:
            void *v99 = v102;
            v99[1] = v103;
            v99[2] = v104;
            v99[3] = v105;
LABEL_43:

            v76 = *v232;
            goto LABEL_44;
          default:
            uint64_t v70 = (void *)*((void *)&v267 + v44);
            *((void *)&v267 + v44) = 0;

LABEL_36:
            v76 = *v232;
LABEL_44:
            objc_msgSend_setArgument_atIndex_(v76, v71, v72);
            uint64_t v3 = v233;
LABEL_45:
            v138 = v234;
            goto LABEL_46;
        }
      }
    }
    uint64_t v17 = v228;
    goto LABEL_64;
  }
  v153 = (void **)(v3 + 40);
  if (!*(void *)(v3 + 40))
  {
LABEL_64:
    if (*(unsigned char *)(v3 + 24))
    {
      uint64_t v162 = objc_opt_class();

      uint64_t v17 = (void *)v162;
    }
    if (*(void *)(v3 + 16)) {
      uint64_t v163 = *(void *)(v3 + 16);
    }
    else {
      uint64_t v163 = 0;
    }
    v159 = (*(void (**)(void, void *, uint64_t, id))(*(void *)(v3 + 32) + 16))(*(void *)(v3 + 32), v17, v163, v5);
    goto LABEL_70;
  }
  double v45 = 0.0;
  long long v269 = 0u;
  long long v270 = 0u;
  long long v267 = 0u;
  long long v268 = 0u;
  long long v266 = 0u;
  long long v259 = 0u;
  long long v258 = 0u;
  long long v257 = 0u;
  long long v256 = 0u;
  long long v255 = 0u;
LABEL_54:
  v154 = *(void **)(v3 + 40);
  if (*(unsigned char *)(v3 + 24)) {
    objc_msgSend_invoke(v154, v21, v45);
  }
  else {
    objc_msgSend_invokeWithTarget_(v154, v21, v45, v17);
  }
  v159 = 0;
  switch(objc_msgSend_returnType(*(void **)(v3 + 8), v155, v156))
  {
    case 2:
      LOBYTE(v244) = 0;
      objc_msgSend_getReturnValue_(*v153, v157, v158, &v244);
      objc_msgSend_numberWithBool_(NSNumber, v165, v166, v244);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 3:
      LODWORD(v244) = 0;
      objc_msgSend_getReturnValue_(*v153, v157, v158, &v244);
      LODWORD(v167) = v244;
      objc_msgSend_numberWithFloat_(NSNumber, v168, v167);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 4:
      *(void *)&long long v244 = 0;
      objc_msgSend_getReturnValue_(*v153, v157, v158, &v244);
      objc_msgSend_numberWithDouble_(NSNumber, v169, *(double *)&v244);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 5:
      *(void *)&long long v244 = 0;
      objc_msgSend_getReturnValue_(*v153, v157, v158, &v244);
      objc_msgSend_numberWithUnsignedInteger_(NSNumber, v170, v171, (void)v244);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 6:
      *(void *)&long long v244 = 0;
      objc_msgSend_getReturnValue_(*v153, v157, v158, &v244);
      objc_msgSend_numberWithInteger_(NSNumber, v172, v173, (void)v244);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 7:
      *(void *)&long long v244 = 0;
      objc_msgSend_getReturnValue_(*v153, v157, v158, &v244);
      objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v174, v175, (void)v244);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 8:
      long long v244 = *MEMORY[0x263F001B0];
      objc_msgSend_getReturnValue_(*v153, v157, *(double *)&v244, &v244);
      objc_msgSend_valueWithCGSize_(MEMORY[0x263F08D40], v176, *(double *)&v244, *((double *)&v244 + 1));
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 9:
      long long v177 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
      long long v244 = *MEMORY[0x263F001A8];
      long long v245 = v177;
      objc_msgSend_getReturnValue_(*v153, v157, *(double *)&v244, &v244);
      objc_msgSend_valueWithCGRect_(MEMORY[0x263F08D40], v178, *(double *)&v244, *((double *)&v244 + 1), v245);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 10:
      long long v244 = *MEMORY[0x263F00148];
      objc_msgSend_getReturnValue_(*v153, v157, *(double *)&v244, &v244);
      objc_msgSend_valueWithCGPoint_(MEMORY[0x263F08D40], v179, *(double *)&v244, *((double *)&v244 + 1));
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 11:
      long long v180 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      long long v244 = *MEMORY[0x263F000D0];
      long long v245 = v180;
      long long v246 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      objc_msgSend_getReturnValue_(*v153, v157, *(double *)&v246, &v244);
      long long v236 = v244;
      long long v237 = v245;
      long long v238 = v246;
      objc_msgSend_valueWithCGAffineTransform_(MEMORY[0x263F08D40], v181, *(double *)&v246, &v236);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 12:
      long long v182 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
      long long v248 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
      long long v249 = v182;
      long long v183 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
      long long v250 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
      long long v251 = v183;
      long long v184 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
      long long v244 = *MEMORY[0x263F15740];
      long long v245 = v184;
      long long v185 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
      long long v246 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
      long long v247 = v185;
      objc_msgSend_getReturnValue_(*v153, v157, *(double *)&v246, &v244);
      long long v240 = v248;
      long long v241 = v249;
      long long v242 = v250;
      long long v243 = v251;
      long long v236 = v244;
      long long v237 = v245;
      long long v238 = v246;
      long long v239 = v247;
      objc_msgSend_valueWithCATransform3D_(MEMORY[0x263F08D40], v186, *(double *)&v246, &v236);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 13:
      long long v187 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
      long long v244 = *MEMORY[0x263F1D1C0];
      long long v245 = v187;
      objc_msgSend_getReturnValue_(*v153, v157, *(double *)&v244, &v244);
      objc_msgSend_valueWithUIEdgeInsets_(MEMORY[0x263F08D40], v188, *(double *)&v244, *((double *)&v244 + 1), v245);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 14:
      long long v244 = xmmword_23989EA20;
      objc_msgSend_getReturnValue_(*v153, v157, NAN, &v244);
      objc_msgSend_valueWithRange_(MEMORY[0x263F08D40], v189, v190, v244);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
      *(void *)&long long v244 = 0;
      objc_msgSend_getReturnValue_(*v153, v157, v158, &v244);
      id v160 = (id)v244;
      goto LABEL_59;
    case 27:
      long long v246 = 0u;
      long long v247 = 0u;
      long long v244 = 0u;
      long long v245 = 0u;
      objc_msgSend_getReturnValue_(*v153, v157, 0.0, &v244);
      objc_msgSend_methodSignature(*v153, v191, v192);
      id v193 = objc_claimAutoreleasedReturnValue();
      uint64_t v196 = objc_msgSend_methodReturnType(v193, v194, v195);

      objc_msgSend_valueWithBytes_objCType_(MEMORY[0x263F08D40], v197, v198, &v244, v196);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 28:
      long long v244 = 0uLL;
      objc_msgSend_getReturnValue_(*v153, v157, v158, &v244);
      objc_msgSend_value_withObjCType_(MEMORY[0x263F08D40], v199, v200, &v244, "{CGVector=dd}");
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 29:
      long long v244 = *MEMORY[0x263F1D4E8];
      objc_msgSend_getReturnValue_(*v153, v157, *(double *)&v244, &v244);
      objc_msgSend_valueWithUIOffset_(MEMORY[0x263F08D40], v201, *(double *)&v244, *((double *)&v244 + 1));
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    case 30:
      long long v202 = *(_OWORD *)(MEMORY[0x263F1C228] + 16);
      long long v244 = *MEMORY[0x263F1C228];
      long long v245 = v202;
      objc_msgSend_getReturnValue_(*v153, v157, *(double *)&v244, &v244);
      objc_msgSend_valueWithDirectionalEdgeInsets_(MEMORY[0x263F08D40], v203, *(double *)&v244, *((double *)&v244 + 1), v245);
      id v160 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:
      v159 = v160;
      break;
    default:
      break;
  }
  for (uint64_t j = 72; j != -8; j -= 8)

LABEL_70:
  return v159;
}

- (BOOL)classMethod
{
  return self->_classSelector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argTypes, 0);
  objc_storeStrong((id *)&self->_invocation, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_methodDescriptor, 0);
}

@end