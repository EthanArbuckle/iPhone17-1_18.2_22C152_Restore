@interface EventKitUI_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
@end

@implementation EventKitUI_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_239830964;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A056A0 != -1) {
    dispatch_once(&qword_268A056A0, block);
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
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v20, v8, v9, &unk_26ED19400, *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, @"EKEventEditViewActionCanceled", v20);
  objc_msgSend_setObject_forKeyedSubscript_(v20, v12, v13, &unk_26ED19418, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, @"EKEventEditViewActionSaved", v20);
  objc_msgSend_setObject_forKeyedSubscript_(v20, v16, v17, &unk_26ED19430, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"EKEventEditViewActionDeleted", v20);
}

@end