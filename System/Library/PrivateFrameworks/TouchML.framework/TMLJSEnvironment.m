@interface TMLJSEnvironment
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)convertJsValue:(id)a3 toType:(unint64_t)a4;
+ (id)convertTmlValue:(id)a3;
+ (id)createJSContextWithRuntimeContext:(id)a3;
+ (id)currentContext;
+ (id)defaultModules;
+ (id)normalizeValue:(id)a3 toType:(unint64_t)a4;
+ (id)protoJSContext;
+ (id)sharedVM;
+ (id)validCurrentContext;
+ (void)addGCCallback:(id)a3;
+ (void)addToDefaultModules:(id)a3;
+ (void)applicationDidReceiveMemoryWarningNotification:(id)a3;
+ (void)forceGC;
+ (void)initializeJSContext:(id)a3;
+ (void)requireModule:(id)a3 forJSContext:(id)a4;
+ (void)runInContext:(id)a3 block:(id)a4;
+ (void)setCurrentContext:(id)a3;
@end

@implementation TMLJSEnvironment

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (id)sharedVM
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2398428D4;
  block[3] = &unk_264DAB680;
  block[4] = a1;
  if (qword_268A05758 != -1) {
    dispatch_once(&qword_268A05758, block);
  }
  v2 = (void *)qword_268A05750;
  return v2;
}

+ (void)applicationDidReceiveMemoryWarningNotification:(id)a3
{
}

+ (id)protoJSContext
{
  if (!qword_268A05740)
  {
    id v3 = objc_alloc(MEMORY[0x263F10378]);
    v6 = objc_msgSend_sharedVM(a1, v4, v5);
    uint64_t v9 = objc_msgSend_initWithVirtualMachine_(v3, v7, v8, v6);
    v10 = (void *)qword_268A05740;
    qword_268A05740 = v9;

    objc_msgSend_initializeJSContext_(a1, v11, v12, qword_268A05740);
  }
  v13 = (void *)qword_268A05740;
  return v13;
}

+ (id)createJSContextWithRuntimeContext:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return (id)MEMORY[0x270F9A6D0](v3, sel_protoJSContext, v4);
}

+ (void)runInContext:(id)a3 block:(id)a4
{
  id v11 = a3;
  v6 = (void (**)(void))a4;
  if (objc_msgSend_valid(v11, v7, v8))
  {
    id v9 = (id)qword_268A05730;
    objc_storeStrong((id *)&qword_268A05730, a3);
    v6[2](v6);
    v10 = (void *)qword_268A05730;
    qword_268A05730 = (uint64_t)v9;
  }
}

+ (id)currentContext
{
  return (id)qword_268A05730;
}

+ (void)setCurrentContext:(id)a3
{
}

+ (id)validCurrentContext
{
  id v2 = (id)qword_268A05730;
  return v2;
}

+ (void)forceGC
{
  id v18 = (id)objc_msgSend_copy((void *)qword_268A05760, a2, v2);
  objc_msgSend_removeAllObjects((void *)qword_268A05760, v4, v5);
  id v6 = objc_alloc(MEMORY[0x263F10378]);
  id v9 = objc_msgSend_sharedVM(a1, v7, v8);
  double v12 = objc_msgSend_initWithVirtualMachine_(v6, v10, v11, v9);

  v15 = (const OpaqueJSContext *)objc_msgSend_JSGlobalContextRef(v12, v13, v14);
  JSGarbageCollect(v15);
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v18, v16, v17, 2, &unk_26ECEBE18);
}

+ (void)addGCCallback:(id)a3
{
  uint64_t v3 = (void *)qword_268A05760;
  id v6 = (id)MEMORY[0x23ECA7DD0](a3, a2);
  objc_msgSend_addObject_(v3, v4, v5, v6);
}

+ (void)requireModule:(id)a3 forJSContext:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if ((id)qword_268A05740 != v6 || (objc_msgSend_containsObject_((void *)qword_268A05748, v5, v7, v19) & 1) == 0)
  {
    double v8 = objc_msgSend_requireModule_(TMLRuntime, v5, v7, v19);
    if (objc_opt_respondsToSelector())
    {
      double v11 = objc_msgSend_globalObject(v6, v9, v10);
      objc_msgSend_initializeJSContext_(v8, v12, v13, v11);

      if ((id)qword_268A05740 == v6)
      {
        v16 = (void *)qword_268A05748;
        if (!qword_268A05748)
        {
          uint64_t v17 = objc_msgSend_set(MEMORY[0x263EFF9C0], v14, v15);
          id v18 = (void *)qword_268A05748;
          qword_268A05748 = v17;

          v16 = (void *)qword_268A05748;
        }
        objc_msgSend_addObject_(v16, v14, v15, v19);
      }
    }
  }
}

+ (void)addToDefaultModules:(id)a3
{
  uint64_t v3 = (void *)qword_268A05740;
  qword_268A05740 = 0;
  id v4 = a3;

  double v5 = objc_opt_class();
  double v8 = objc_msgSend_defaultModules(v5, v6, v7);
  double v11 = objc_msgSend_array(v8, v9, v10);
  objc_msgSend_arrayByAddingObjectsFromArray_(v11, v12, v13, v4);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v16 = objc_msgSend_orderedSetWithArray_(MEMORY[0x263EFF9D8], v14, v15, v18);
  uint64_t v17 = (void *)qword_268A05738;
  qword_268A05738 = v16;
}

+ (id)defaultModules
{
  uint64_t v3 = (void *)qword_268A05738;
  if (!qword_268A05738)
  {
    uint64_t v4 = objc_msgSend_orderedSetWithObjects_(MEMORY[0x263EFF9D8], a2, v2, @"Foundation", @"CoreGraphics", @"UIKit", 0);
    double v5 = (void *)qword_268A05738;
    qword_268A05738 = v4;

    uint64_t v3 = (void *)qword_268A05738;
  }
  return v3;
}

+ (void)initializeJSContext:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_msgSend_setExceptionHandler_(v3, v4, v5, &unk_26ECEBE38);
  objc_msgSend_initializeJSContext_(TMLContext, v6, v7, v3);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  double v8 = objc_opt_class();
  double v11 = objc_msgSend_defaultModules(v8, v9, v10, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, v13, &v54, v58, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v55;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * v17);
        id v19 = objc_opt_class();
        objc_msgSend_requireModule_forJSContext_(v19, v20, v21, v18, v3);
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v22, v23, &v54, v58, 16);
    }
    while (v15);
  }

  v26 = objc_msgSend_globalObject(v3, v24, v25);
  v29 = objc_msgSend_jsValueInContext_(TMLJSNil, v27, v28, v3);
  objc_msgSend_setObject_forKeyedSubscript_(v26, v30, v31, v29, @"Nil");
  objc_msgSend_setObject_forKeyedSubscript_(v26, v32, v33, v29, @"nil");

  v36 = objc_msgSend_valueWithBool_inContext_(MEMORY[0x263F10390], v34, v35, 0, v3);
  objc_msgSend_setObject_forKeyedSubscript_(v26, v37, v38, v36, @"NO");

  v41 = objc_msgSend_valueWithBool_inContext_(MEMORY[0x263F10390], v39, v40, 1, v3);
  objc_msgSend_setObject_forKeyedSubscript_(v26, v42, v43, v41, @"YES");

  objc_msgSend_setObject_forKeyedSubscript_(v26, v44, v45, &unk_26ECEBE58, @"object");
  objc_msgSend_setObject_forKeyedSubscript_(v26, v46, v47, &unk_26ECEBE58, @"value");
  objc_msgSend_setObject_forKeyedSubscript_(v26, v48, v49, &unk_26ECEBE78, @"isNil");
  objc_msgSend_setObject_forKeyedSubscript_(v26, v50, v51, &unk_26ECEBE98, @"isEmpty");
  objc_msgSend_setObject_forKeyedSubscript_(v26, v52, v53, &unk_26ECEBEB8, @"safearray");
}

+ (id)convertTmlValue:(id)a3
{
  v97[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v6 = objc_msgSend_valueType(v3, v4, v5);
  uint64_t v9 = objc_msgSend_value(v3, v7, v8);
  double v12 = (void *)v9;
  double v13 = 0;
  switch(v6)
  {
    case 1:
      goto LABEL_37;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_27;
      }
      double v13 = 0;
      goto LABEL_37;
    case 8:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      uint64_t v14 = [TMLSize alloc];
      objc_msgSend_CGSizeValue(v12, v15, v16);
      id v19 = (id)objc_msgSend_initWithSize_(v14, v17, v18);
      goto LABEL_28;
    case 9:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      v20 = [TMLRect alloc];
      objc_msgSend_CGRectValue(v12, v21, v22);
      id v19 = (id)objc_msgSend_initWithRect_(v20, v23, v24);
      goto LABEL_28;
    case 10:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      double v25 = [TMLPoint alloc];
      objc_msgSend_CGPointValue(v12, v26, v27);
      id v19 = (id)objc_msgSend_initWithPoint_(v25, v28, v29);
      goto LABEL_28;
    case 11:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      double v31 = [TMLAffineTransform alloc];
      if (v12)
      {
        objc_msgSend_CGAffineTransformValue(v12, v30, v32);
      }
      else
      {
        double v33 = 0.0;
        memset(v93, 0, sizeof(v93));
      }
      id v19 = (id)objc_msgSend_initWithAffineTransform_(v31, v30, v33, v93);
      goto LABEL_28;
    case 12:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      double v35 = [TMLTransform3D alloc];
      if (v12)
      {
        objc_msgSend_CATransform3DValue(v12, v34, v36);
      }
      else
      {
        double v37 = 0.0;
        memset(v92, 0, sizeof(v92));
      }
      id v19 = (id)objc_msgSend_initWithTransform3D_(v35, v34, v37, v92);
      goto LABEL_28;
    case 13:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      double v38 = [TMLInsets alloc];
      objc_msgSend_UIEdgeInsetsValue(v12, v39, v40);
      id v19 = (id)objc_msgSend_initWithInsets_(v38, v41, v42);
      goto LABEL_28;
    case 14:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      double v43 = [TMLRange alloc];
      uint64_t v46 = objc_msgSend_rangeValue(v12, v44, v45);
      id v19 = (id)objc_msgSend_initWithRange_(v43, v47, v48, v46, v47);
      goto LABEL_28;
    case 15:
      goto LABEL_27;
    case 16:
      if (!v9) {
        goto LABEL_36;
      }
      goto LABEL_27;
    case 17:
    case 19:
    case 20:
    case 21:
    case 23:
    case 24:
    case 27:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
LABEL_27:
      id v19 = v12;
      goto LABEL_28;
    case 18:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      double v49 = [TMLAttributedString alloc];
      id v19 = (id)objc_msgSend_initWithAttributedString_(v49, v50, v51, v12);
      goto LABEL_28;
    case 22:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      v52 = [TMLFont alloc];
      id v19 = (id)objc_msgSend_initWithFont_(v52, v53, v54, v12);
      goto LABEL_28;
    case 25:
      goto LABEL_35;
    case 28:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      double v94 = 0.0;
      double v95 = 0.0;
      objc_msgSend_getValue_(v12, v10, v11, &v94);
      long long v55 = [TMLVector alloc];
      id v19 = (id)objc_msgSend_initWithVector_(v55, v56, v94, v95);
      goto LABEL_28;
    case 29:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      long long v57 = [TMLOffset alloc];
      objc_msgSend_UIOffsetValue(v12, v58, v59);
      id v19 = (id)objc_msgSend_initWithOffset_(v57, v60, v61);
      goto LABEL_28;
    case 30:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v62 = [TMLDirectionalEdgeInsets alloc];
        objc_msgSend_directionalEdgeInsetsValue(v12, v63, v64);
        id v19 = (id)objc_msgSend_initWithDirectionalEdgeInsets_(v62, v65, v66);
LABEL_28:
        double v13 = v19;
      }
      else
      {
LABEL_35:
        if (v12)
        {
          v71 = (void *)MEMORY[0x263EFF940];
          v72 = NSString;
          v73 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v10, v11, v6);
          v76 = objc_msgSend_stringWithFormat_(v72, v74, v75, @"Value conversion failed for type '%@'", v73);
          v96 = @"value";
          v97[0] = v12;
          v79 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v77, v78, v97, &v96, 1);
          objc_msgSend_exceptionWithName_reason_userInfo_(v71, v80, v81, @"TMLRuntimeException", v76, v79);
          id v82 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v82);
        }
LABEL_36:
        v67 = objc_msgSend_currentContext(MEMORY[0x263F10378], v10, v11);
        double v13 = objc_msgSend_jsValueInContext_(TMLJSNil, v68, v69, v67);
      }
LABEL_37:

      return v13;
    default:
      v83 = (void *)MEMORY[0x263EFF940];
      v84 = NSString;
      v85 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v10, v11, v6);
      v88 = objc_msgSend_stringWithFormat_(v84, v86, v87, @"Unsupported value type '%@'", v85);
      objc_msgSend_exceptionWithName_reason_userInfo_(v83, v89, v90, @"TMLRuntimeException", v88, 0);
      id v91 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v91);
  }
}

+ (id)convertJsValue:(id)a3 toType:(unint64_t)a4
{
  id v5 = a3;
  double v8 = v5;
  uint64_t v9 = 0;
  switch(a4)
  {
    case 1uLL:
      break;
    case 2uLL:
      double v10 = NSNumber;
      uint64_t v11 = objc_msgSend_toBool(v5, v6, v7);
      uint64_t v14 = objc_msgSend_numberWithBool_(v10, v12, v13, v11);
      goto LABEL_28;
    case 3uLL:
      uint64_t v15 = NSNumber;
      objc_msgSend_toDouble(v5, v6, v7);
      *(float *)&double v16 = v16;
      uint64_t v14 = objc_msgSend_numberWithFloat_(v15, v17, v16);
      goto LABEL_28;
    case 4uLL:
      double v18 = NSNumber;
      objc_msgSend_toDouble(v5, v6, v7);
      uint64_t v14 = objc_msgSend_numberWithDouble_(v18, v19, v20);
      goto LABEL_28;
    case 5uLL:
      double v21 = NSNumber;
      unsigned int v22 = objc_msgSend_toUInt32(v5, v6, v7);
      uint64_t v14 = objc_msgSend_numberWithUnsignedInteger_(v21, v23, v24, v22);
      goto LABEL_28;
    case 6uLL:
      double v25 = NSNumber;
      int v26 = objc_msgSend_toInt32(v5, v6, v7);
      uint64_t v14 = objc_msgSend_numberWithInteger_(v25, v27, v28, v26);
      goto LABEL_28;
    case 7uLL:
      double v29 = NSNumber;
      v30 = objc_msgSend_toNumber(v5, v6, v7);
      uint64_t v33 = objc_msgSend_unsignedLongLongValue(v30, v31, v32);
      objc_msgSend_numberWithUnsignedLongLong_(v29, v34, v35, v33);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 8uLL:
      uint64_t v37 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v38, v39, v37);
      objc_msgSend_CGSizeValue(v30, v40, v41);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 9uLL:
      uint64_t v42 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v43, v44, v42);
      objc_msgSend_CGRectValue(v30, v45, v46);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xAuLL:
      uint64_t v47 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v48, v49, v47);
      objc_msgSend_CGPointValue(v30, v50, v51);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xBuLL:
      uint64_t v52 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v53, v54, v52);
      objc_msgSend_CGAffineTransformValue(v30, v55, v56);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xCuLL:
      uint64_t v57 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v58, v59, v57);
      objc_msgSend_CATransform3DValue(v30, v60, v61);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xDuLL:
      uint64_t v62 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v63, v64, v62);
      objc_msgSend_UIEdgeInsetsValue(v30, v65, v66);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xEuLL:
      uint64_t v67 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v68, v69, v67);
      objc_msgSend_NSRangeValue(v30, v70, v71);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xFuLL:
      uint64_t v14 = objc_msgSend_toObject(v5, v6, v7);
      goto LABEL_28;
    case 0x10uLL:
      if (objc_msgSend_isUndefined(v5, v6, v7)) {
        goto LABEL_21;
      }
      v30 = objc_msgSend_toObject(v8, v72, v73);
      if (objc_msgSend_isNil_(TMLJSNil, v74, v75, v30))
      {
        uint64_t v9 = 0;
      }
      else
      {
        id v36 = v30;
LABEL_32:
        uint64_t v9 = v36;
      }

      break;
    case 0x11uLL:
      if ((objc_msgSend_isUndefined(v5, v6, v7) & 1) != 0
        || (objc_msgSend_toObject(v8, v76, v77),
            double v78 = objc_claimAutoreleasedReturnValue(),
            char isNil = objc_msgSend_isNil_(TMLJSNil, v79, v80, v78),
            v78,
            (isNil & 1) != 0))
      {
LABEL_21:
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v14 = objc_msgSend_toString(v8, v82, v83);
LABEL_28:
        uint64_t v9 = (void *)v14;
      }
      break;
    case 0x12uLL:
      uint64_t v84 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v85, v86, v84);
      objc_msgSend_NSAttributedString(v30, v87, v88);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x13uLL:
      v30 = objc_msgSend_toArray(v5, v6, v7);
      sub_23984413C(v30);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x14uLL:
      v30 = objc_msgSend_toDictionary(v5, v6, v7);
      sub_23984420C(v30);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x15uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x1BuLL:
      uint64_t v99 = objc_opt_class();
      uint64_t v14 = objc_msgSend_toObjectOfClass_(v8, v100, v101, v99);
      goto LABEL_28;
    case 0x16uLL:
      uint64_t v89 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v90, v91, v89);
      objc_msgSend_UIFontValue(v30, v92, v93);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x19uLL:
      uint64_t v94 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v95, v96, v94);
      objc_msgSend_blockValue(v30, v97, v98);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x1CuLL:
      uint64_t v102 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v103, v104, v102);
      objc_msgSend_CGVectorValue(v30, v105, v106);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x1DuLL:
      uint64_t v107 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v108, v109, v107);
      objc_msgSend_UIOffsetValue(v30, v110, v111);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x1EuLL:
      uint64_t v112 = objc_opt_class();
      v30 = objc_msgSend_toObjectOfClass_(v8, v113, v114, v112);
      objc_msgSend_NSDirectionalEdgeInsetsValue(v30, v115, v116);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    default:
      v118 = (void *)MEMORY[0x263EFF940];
      v119 = NSString;
      v120 = objc_msgSend_typeNameForType_(TMLTypeRegistry, v6, v7, a4);
      v123 = objc_msgSend_stringWithFormat_(v119, v121, v122, @"Unsupported value type '%@'", v120);
      objc_msgSend_exceptionWithName_reason_userInfo_(v118, v124, v125, @"TMLRuntimeException", v123, 0);
      id v126 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v126);
  }

  return v9;
}

+ (id)normalizeValue:(id)a3 toType:(unint64_t)a4
{
  return sub_2398442E8(a3, a4);
}

@end