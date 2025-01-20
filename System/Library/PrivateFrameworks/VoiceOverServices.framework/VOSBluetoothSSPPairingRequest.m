@interface VOSBluetoothSSPPairingRequest
- (VOSBluetoothSSPPairingRequest)initWithDevice:(id)a3 andSpecifier:(id)a4;
- (VOSBluetoothSSPPairingRequest)initWithDevice:(id)a3 andSpecifier:(id)a4 acceptPairingBlock:(id)a5 cancelPairingBlock:(id)a6;
- (id)_sanitizeNameForAlert:(id)a3;
- (id)acceptPairingBlock;
- (id)cancelPairingBlock;
- (int)pairingStyle;
- (void)dealloc;
- (void)dismiss;
- (void)setAcceptPairingBlock:(id)a3;
- (void)setCancelPairingBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPairingStyle:(int)a3 andPasskey:(id)a4;
- (void)showWithViewController:(id)a3;
- (void)showWithWindow:(id)a3;
@end

@implementation VOSBluetoothSSPPairingRequest

- (VOSBluetoothSSPPairingRequest)initWithDevice:(id)a3 andSpecifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VOSBluetoothSSPPairingRequest;
  v9 = [(VOSBluetoothSSPPairingRequest *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_specifier, a4);
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v10 selector:sel_hidPairingResult_ name:*MEMORY[0x263F22A48] object:0];
  }
  return v10;
}

- (VOSBluetoothSSPPairingRequest)initWithDevice:(id)a3 andSpecifier:(id)a4 acceptPairingBlock:(id)a5 cancelPairingBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)VOSBluetoothSSPPairingRequest;
  v15 = [(VOSBluetoothSSPPairingRequest *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_device, a3);
    objc_storeStrong((id *)&v16->_specifier, a4);
    uint64_t v17 = [v13 copy];
    id acceptPairingBlock = v16->_acceptPairingBlock;
    v16->_id acceptPairingBlock = (id)v17;

    uint64_t v19 = [v14 copy];
    id cancelPairingBlock = v16->_cancelPairingBlock;
    v16->_id cancelPairingBlock = (id)v19;
  }
  return v16;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(VOSBluetoothSSPPairingRequest *)self dismiss];
  v4.receiver = self;
  v4.super_class = (Class)VOSBluetoothSSPPairingRequest;
  [(VOSBluetoothSSPPairingRequest *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
}

- (id)_sanitizeNameForAlert:(id)a3
{
  id v3 = a3;
  objc_super v4 = [MEMORY[0x263F08B08] scannerWithString:v3];
  v5 = [MEMORY[0x263F08708] illegalCharacterSet];
  [v4 setCharactersToBeSkipped:v5];

  v6 = [MEMORY[0x263F089D8] string];
  id v7 = [MEMORY[0x263F089D8] string];
  while (1)
  {
    id v8 = v7;
    v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v16 = v7;
    int v10 = [v4 scanUpToCharactersFromSet:v9 intoString:&v16];
    id v7 = v16;

    if (!v10) {
      break;
    }
    [v6 appendString:v7];
    id v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    int v12 = [v4 scanCharactersFromSet:v11 intoString:0];

    if (v12) {
      [v6 appendString:@" "];
    }
  }
  if ((unint64_t)[v6 length] <= 0x32)
  {
    id v13 = v6;
  }
  else
  {
    id v13 = [v6 substringToIndex:50];
  }
  id v14 = v13;

  return v14;
}

- (int)pairingStyle
{
  return self->_pairingStyle;
}

- (void)setPairingStyle:(int)a3 andPasskey:(id)a4
{
  id v6 = a4;
  v46 = VOSLocString(@"CANCEL");
  id v7 = [(AXUIBluetoothDevice *)self->_device name];
  id v8 = [(VOSBluetoothSSPPairingRequest *)self _sanitizeNameForAlert:v7];

  self->_pairingStyle = a3;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2050000000;
  v9 = (void *)getUIDeviceClass_softClass;
  uint64_t v65 = getUIDeviceClass_softClass;
  if (!getUIDeviceClass_softClass)
  {
    uint64_t v57 = MEMORY[0x263EF8330];
    uint64_t v58 = 3221225472;
    v59 = __getUIDeviceClass_block_invoke;
    v60 = &unk_2643FD9C0;
    v61 = &v62;
    __getUIDeviceClass_block_invoke((uint64_t)&v57);
    v9 = (void *)v63[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v62, 8);
  id v11 = [v10 currentDevice];
  switch(a3)
  {
    case 0:
      int v12 = NSString;
      id v13 = VOSLocString(@"NUMERIC_TITLE");
      id v14 = [v11 localizedModel];
      v50 = objc_msgSend(v12, "stringWithFormat:", v13, v8, v14);

      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%06u", objc_msgSend(v6, "unsignedIntValue"));
      id v16 = NSString;
      uint64_t v17 = VOSLocString(@"NUMERIC_MESSAGE");
      v45 = (void *)v15;
      v49 = objc_msgSend(v16, "stringWithFormat:", v17, v15, v8);

      v48 = VOSLocString(@"NUMERIC_BUTTON");
      break;
    case 1:
      v18 = NSString;
      uint64_t v19 = VOSLocString(@"JUST_WORKS_TITLE");
      v20 = [v11 localizedModel];
      v50 = objc_msgSend(v18, "stringWithFormat:", v19, v8, v20);

      v49 = VOSLocString(@"JUST_WORKS_MESSAGE");
      v48 = VOSLocString(@"JUST_WORKS_BUTTON");
      v45 = 0;
      break;
    case 2:
      v21 = NSString;
      objc_super v22 = VOSLocString(@"PASSKEY_TITLE");
      v23 = [v11 localizedModel];
      v50 = objc_msgSend(v21, "stringWithFormat:", v22, v8, v23);

      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%06u", objc_msgSend(v6, "unsignedIntValue"));
      v25 = NSString;
      v26 = @"PASSKEY_MESSAGE";
      goto LABEL_9;
    case 3:
      v27 = NSString;
      v28 = VOSLocString(@"PASSKEY_TITLE");
      v29 = [v11 localizedModel];
      v50 = objc_msgSend(v27, "stringWithFormat:", v28, v8, v29);

      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%04u", objc_msgSend(v6, "unsignedIntValue"));
      v25 = NSString;
      v26 = @"HID_MESSAGE";
LABEL_9:
      v30 = VOSLocString(v26);
      v45 = (void *)v24;
      v49 = objc_msgSend(v25, "stringWithFormat:", v30, v24, v8);

      v48 = 0;
      break;
    default:
      v45 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      break;
  }
  v31 = [(VOSBluetoothSSPPairingRequest *)self acceptPairingBlock];
  v32 = v31;
  if (!v31)
  {
    v31 = aBlock;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke;
    aBlock[3] = &unk_2643FD728;
    aBlock[4] = self;
  }
  v47 = _Block_copy(v31);

  v33 = [(VOSBluetoothSSPPairingRequest *)self cancelPairingBlock];
  v34 = v33;
  if (!v33)
  {
    v33 = v55;
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_2;
    v55[3] = &unk_2643FD728;
    v55[4] = self;
  }
  v35 = _Block_copy(v33);

  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2050000000;
  v36 = (void *)getUIAlertControllerClass_softClass_0;
  uint64_t v65 = getUIAlertControllerClass_softClass_0;
  if (!getUIAlertControllerClass_softClass_0)
  {
    uint64_t v57 = MEMORY[0x263EF8330];
    uint64_t v58 = 3221225472;
    v59 = __getUIAlertControllerClass_block_invoke_0;
    v60 = &unk_2643FD9C0;
    v61 = &v62;
    __getUIAlertControllerClass_block_invoke_0((uint64_t)&v57);
    v36 = (void *)v63[3];
  }
  id v37 = v36;
  _Block_object_dispose(&v62, 8);
  v38 = [v37 alertControllerWithTitle:v50 message:v49 preferredStyle:1];
  alert = self->_alert;
  self->_alert = v38;

  if (v48)
  {
    id UIAlertActionClass = getUIAlertActionClass();
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_3;
    v53[3] = &unk_2643FDCB8;
    id v54 = v47;
    v41 = [UIAlertActionClass actionWithTitle:v48 style:0 handler:v53];
    [(UIAlertController *)self->_alert addAction:v41];
  }
  id v42 = getUIAlertActionClass();
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_4;
  v51[3] = &unk_2643FDCB8;
  id v52 = v35;
  id v43 = v35;
  v44 = [v42 actionWithTitle:v46 style:1 handler:v51];
  [(UIAlertController *)self->_alert addAction:v44];
}

void __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) userInfo];
  id v3 = __UIAccessibilityCastAsClass();

  [v3 setObject:@"accepted" forKey:@"PIN-ended"];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v4 + 32) != 3)
  {
    if (*(void *)(v4 + 8))
    {
      v5 = +[VOSBluetoothManager sharedInstance];
      [v5 acceptSSP:0 forDevice:*(void *)(*(void *)(a1 + 32) + 8)];
    }
  }
}

void __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) userInfo];
  id v3 = __UIAccessibilityCastAsClass();

  [v3 setObject:@"cancelled" forKey:@"PIN-ended"];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  if (v5)
  {
    if (*(_DWORD *)(v4 + 32) == 3)
    {
      [v5 setPIN:0];
    }
    else
    {
      id v6 = +[VOSBluetoothManager sharedInstance];
      [v6 acceptSSP:1 forDevice:*(void *)(*(void *)(a1 + 32) + 8)];
    }
  }
}

uint64_t __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__VOSBluetoothSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showWithWindow:(id)a3
{
  id v4 = [a3 rootViewController];
  [v4 presentViewController:self->_alert animated:1 completion:0];
}

- (void)showWithViewController:(id)a3
{
}

- (void)dismiss
{
}

- (id)acceptPairingBlock
{
  return self->_acceptPairingBlock;
}

- (void)setAcceptPairingBlock:(id)a3
{
}

- (id)cancelPairingBlock
{
  return self->_cancelPairingBlock;
}

- (void)setCancelPairingBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelPairingBlock, 0);
  objc_storeStrong(&self->_acceptPairingBlock, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_specifier, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end