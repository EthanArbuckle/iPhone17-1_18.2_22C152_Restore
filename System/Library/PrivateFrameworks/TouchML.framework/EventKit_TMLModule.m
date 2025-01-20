@interface EventKit_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
+ (void)initializeJSContext:(id)a3;
@end

@implementation EventKit_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23982F74C;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A05658 != -1) {
    dispatch_once(&qword_268A05658, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initializeJSContext:(id)a3
{
  id v4 = a3;
  objc_msgSend_defineConstants_(a1, v5, v6, v4);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v7, v8, &unk_26ECEB9F8, @"EKEventStore");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v9, v10, &unk_26ECEBA18, @"EKEvent");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, v12, &unk_26ECEBA38, @"EKAlarm");
  v15 = objc_msgSend_objectForKeyedSubscript_(v4, v13, v14, @"EKAlarm");
  objc_msgSend_setObject_forKeyedSubscript_(v15, v16, v17, &unk_26ECEBA58, @"withRelativeOffset");

  objc_msgSend_objectForKeyedSubscript_(v4, v18, v19, @"EKAlarm");
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v22, v20, v21, &unk_26ECEBA78, @"withAbsoluteDate");
}

+ (void)defineConstants:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  id v60 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v60, v8, v9, &unk_26ED19208, *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, @"EKAuthorizationStatusNotDetermined", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v12, v13, &unk_26ED19220, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, @"EKAuthorizationStatusRestricted", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v16, v17, &unk_26ED19238, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"EKAuthorizationStatusDenied", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v20, v21, &unk_26ED19250, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, @"EKAuthorizationStatusAuthorized", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v24, v25, &unk_26ED19208, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, @"EKEventStatusNone", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v28, v29, &unk_26ED19220, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, @"EKEventStatusConfirmed", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v32, v33, &unk_26ED19238, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v34, v35, @"EKEventStatusTentative", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v36, v37, &unk_26ED19250, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v38, v39, @"EKEventStatusCanceled", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v40, v41, &unk_26ED19268, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, @"EKEntityTypeEvent", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v44, v45, &unk_26ED19280, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, @"EKEntityTypeReminder", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v48, v49, &unk_26ED19208, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, @"EKSpanThisEvent", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v52, v53, &unk_26ED19220, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, @"EKSpanFutureEvents", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v56, v57, *MEMORY[0x263F04AD8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, @"EKEventStoreChangedNotification", v60);
}

@end