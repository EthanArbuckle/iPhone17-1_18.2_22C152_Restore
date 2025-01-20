@interface NotificationCenter_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
@end

@implementation NotificationCenter_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2398649B4;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A05858 != -1) {
    dispatch_once(&qword_268A05858, block);
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
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v28, v8, v9, &unk_26ED19B98, *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, @"NCUpdateResultNewData", v28);
  objc_msgSend_setObject_forKeyedSubscript_(v28, v12, v13, &unk_26ED19BB0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, @"NCUpdateResultNoData", v28);
  objc_msgSend_setObject_forKeyedSubscript_(v28, v16, v17, &unk_26ED19BC8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"NCUpdateResultFailed", v28);
  objc_msgSend_setObject_forKeyedSubscript_(v28, v20, v21, &unk_26ED19BE0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, @"NCWidgetDisplayModeCompact", v28);
  objc_msgSend_setObject_forKeyedSubscript_(v28, v24, v25, &unk_26ED19BF8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, @"NCWidgetDisplayModeExpanded", v28);
}

@end