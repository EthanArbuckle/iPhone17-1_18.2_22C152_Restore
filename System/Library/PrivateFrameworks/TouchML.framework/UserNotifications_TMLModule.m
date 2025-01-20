@interface UserNotifications_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
@end

@implementation UserNotifications_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23986F6C4;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A05908 != -1) {
    dispatch_once(&qword_268A05908, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)defineConstants:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  id v60 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v60, v8, v9, &unk_26ED19EB0, *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, @"UNErrorCodeNotificationsNotAllowed", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v12, v13, &unk_26ED19EC8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, @"UNErrorCodeAttachmentInvalidURL", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v16, v17, &unk_26ED19EE0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"UNErrorCodeAttachmentUnrecognizedType", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v20, v21, &unk_26ED19EF8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, @"UNErrorCodeAttachmentInvalidFileSize", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v24, v25, &unk_26ED19F10, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, @"UNErrorCodeAttachmentNotInDataStore", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v28, v29, &unk_26ED19F28, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, @"UNErrorCodeAttachmentMoveIntoDataStoreFailed", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v32, v33, &unk_26ED19F40, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v34, v35, @"UNErrorCodeAttachmentCorrupt", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v36, v37, &unk_26ED19F58, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v38, v39, @"UNErrorCodeNotificationInvalidNoDate", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v40, v41, &unk_26ED19F70, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, @"UNErrorCodeNotificationInvalidNoContent", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v44, v45, &unk_26ED19F88, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, @"UNNotificationActionOptionAuthenticationRequired", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v48, v49, &unk_26ED19FA0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, @"UNNotificationActionOptionDestructive", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v52, v53, &unk_26ED19FB8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, @"UNNotificationActionOptionForeground", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v56, v57, &unk_26ED19FD0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, @"UNNotificationActionOptionNone", v60);
}

@end