@interface CoreBluetooth_TMLModule
+ (BOOL)loadModule;
+ (void)defineConstants:(id)a3;
@end

@implementation CoreBluetooth_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_239837C38;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A056B8 != -1) {
    dispatch_once(&qword_268A056B8, block);
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
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *MEMORY[0x263F10368];
  objc_msgSend_setObject_forKeyedSubscript_(v36, v8, v9, &unk_26ED19448, *MEMORY[0x263F10368]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, @"CBManagerStateUnknown", v36);
  objc_msgSend_setObject_forKeyedSubscript_(v36, v12, v13, &unk_26ED19460, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, @"CBManagerStateResetting", v36);
  objc_msgSend_setObject_forKeyedSubscript_(v36, v16, v17, &unk_26ED19478, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, @"CBManagerStateUnsupported", v36);
  objc_msgSend_setObject_forKeyedSubscript_(v36, v20, v21, &unk_26ED19490, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, @"CBManagerStateUnauthorized", v36);
  objc_msgSend_setObject_forKeyedSubscript_(v36, v24, v25, &unk_26ED194A8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, @"CBManagerStatePoweredOff", v36);
  objc_msgSend_setObject_forKeyedSubscript_(v36, v28, v29, &unk_26ED194C0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, @"CBManagerStatePoweredOn", v36);
  objc_msgSend_setObject_forKeyedSubscript_(v36, v32, v33, *MEMORY[0x263EFED38], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v34, v35, @"CBCentralManagerOptionShowPowerAlertKey", v36);
}

@end