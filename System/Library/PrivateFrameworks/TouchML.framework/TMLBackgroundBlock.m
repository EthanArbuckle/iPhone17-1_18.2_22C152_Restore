@interface TMLBackgroundBlock
+ (id)executeFunction:(id)a3 argument:(id)a4;
+ (id)sharedVM;
+ (void)handleException:(id)a3;
+ (void)initializeJSContext:(id)a3;
@end

@implementation TMLBackgroundBlock

+ (void)initializeJSContext:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23982FCFC;
  block[3] = &unk_264DAB680;
  block[4] = a1;
  uint64_t v3 = qword_268A05668;
  id v5 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_268A05668, block);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v5, v4, v6, &unk_26ECEBA98, @"background");
}

+ (id)sharedVM
{
  if (qword_268A05678 != -1) {
    dispatch_once(&qword_268A05678, &unk_26ECEBAB8);
  }
  v2 = (void *)qword_268A05670;
  return v2;
}

+ (id)executeFunction:(id)a3 argument:(id)a4
{
  v40[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x263F10378];
  id v8 = a3;
  id v9 = [v7 alloc];
  v12 = objc_msgSend_sharedVM(a1, v10, v11);
  v15 = objc_msgSend_initWithVirtualMachine_(v9, v13, v14, v12);

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = sub_2398302DC;
  v39[3] = &unk_264DAB710;
  v39[4] = a1;
  objc_msgSend_setExceptionHandler_(v15, v16, COERCE_DOUBLE(3221225472), v39);
  v19 = objc_msgSend_globalObject(v15, v17, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v19, v20, v21, &unk_26ECEBAD8, @"nslog");
  v24 = objc_msgSend_stringWithFormat_(NSString, v22, v23, @"var _tmlResult=%@ _tmlResult", v8);;

  v27 = objc_msgSend_evaluateScript_(v15, v25, v26, v24);

  v30 = v6;
  if (!v6)
  {
    v30 = objc_msgSend_null(MEMORY[0x263EFF9D0], v28, v29);
  }
  v40[0] = v30;
  v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v28, v29, v40, 1);
  v34 = objc_msgSend_callWithArguments_(v27, v32, v33, v31);

  if (!v6) {
  v37 = objc_msgSend_convertJsValue_toType_(TMLJSEnvironment, v35, v36, v34, 16);
  }

  return v37;
}

+ (void)handleException:(id)a3
{
  v44[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, v5, @"stack");
  id v9 = objc_msgSend_toString(v6, v7, v8);
  v12 = objc_msgSend_componentsSeparatedByString_(v9, v10, v11, @"\n");
  v15 = objc_msgSend_mutableCopy(v12, v13, v14);

  if (v15)
  {
    double v18 = objc_msgSend_firstObject(v15, v16, v17);
    v19 = NSString;
    v22 = objc_msgSend_objectForKeyedSubscript_(v3, v20, v21, @"line");
    v25 = objc_msgSend_toString(v22, v23, v24);
    v28 = objc_msgSend_stringWithFormat_(v19, v26, v27, @"%@:#%@", v18, v25);
    objc_msgSend_replaceObjectAtIndex_withObject_(v15, v29, v30, 0, v28);
  }
  id v31 = objc_alloc(MEMORY[0x263EFF940]);
  v34 = objc_msgSend_toString(v3, v32, v33);
  v43 = @"stack";
  v44[0] = v15;
  v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, v36, v44, &v43, 1);
  v40 = objc_msgSend_initWithName_reason_userInfo_(v31, v38, v39, @"TMLJSException", v34, v37);

  objc_msgSend_raiseException_(TMLExceptionHandler, v41, v42, v40);
}

@end