@interface Messages_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
+ (void)initializeJSContext:(id)a3;
@end

@implementation Messages_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23983A500;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A056C0 != -1) {
    dispatch_once(&qword_268A056C0, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initializeJSContext:(id)a3
{
  id v12 = a3;
  objc_msgSend_defineConstants_(a1, v4, v5, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v6, v7, &unk_26ECEBC38, @"MSMessage");
  objc_msgSend_setObject_forKeyedSubscript_(v12, v8, v9, &unk_26ECEBC58, @"MSMessageTemplateLayout");
  objc_msgSend_setObject_forKeyedSubscript_(v12, v10, v11, &unk_26ECEBC78, @"MSMessageLiveLayout");
}

+ (void)defineConstants:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  id v60 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v60, v8, v9, &unk_26ED194D8, *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, @"MSMessagesAppPresentationStyleCompact", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v12, v13, &unk_26ED194F0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, @"MSMessagesAppPresentationStyleExpanded", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v16, v17, &unk_26ED19508, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"MSMessagesAppPresentationStyleTranscript", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v20, v21, *MEMORY[0x263F12590], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, @"MSStickersErrorDomain", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v24, v25, *MEMORY[0x263F12588], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, @"MSMessagesErrorDomain", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v28, v29, &unk_26ED19520, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, @"MSMessageErrorCodeFileNotFound", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v32, v33, &unk_26ED19538, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v34, v35, @"MSMessageErrorCodeFileUnreadable", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v36, v37, &unk_26ED19550, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v38, v39, @"MSMessageErrorCodeImproperFileType", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v40, v41, &unk_26ED19568, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, @"MSMessageErrorCodeImproperFileURL", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v44, v45, &unk_26ED19580, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, @"MSMessageErrorCodeStickerFileImproperFileAttributes", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v48, v49, &unk_26ED19598, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, @"MSMessageErrorCodeStickerFileImproperFileSize", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v52, v53, &unk_26ED195B0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, @"MSMessageErrorCodeStickerFileImproperFileFormat", v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v56, v57, &unk_26ED195C8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, @"MSMessageErrorCodeURLExceedsMaxSize", v60);
}

@end