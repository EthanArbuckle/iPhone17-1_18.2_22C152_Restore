@interface STSSigningSession
- (id)_createHandlerForMerchantPaymentSign;
- (id)_createHandlerForPeerPaymentSign;
- (id)canStartSession;
- (id)createHandlerForCredential:(id)a3;
- (id)setActiveCredential:(id)a3;
- (id)signInAppPayment:(id)a3 authorization:(id)a4 error:(id *)a5;
- (id)signPeerPayment:(id)a3 authorization:(id)a4 error:(id *)a5;
@end

@implementation STSSigningSession

- (id)canStartSession
{
  v18[4] = *MEMORY[0x263EF8340];
  v4 = [(STSSessionBase *)self nfHardwareManager];
  int v5 = [v4 getHwSupport];

  if (v5 == 2)
  {
    v8 = 0;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession canStartSession]", 25, self, @"Hardware not available", v6, v7, v16);
    v9 = (void *)MEMORY[0x263F087E8];
    v10 = [NSString stringWithUTF8String:"STS.fwk"];
    v17[0] = *MEMORY[0x263F08320];
    v11 = [NSString stringWithUTF8String:"Hardware Not Available"];
    v18[0] = v11;
    v18[1] = &unk_26D308188;
    v17[1] = @"Line";
    v17[2] = @"Method";
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v18[2] = v12;
    v17[3] = *MEMORY[0x263F07F80];
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 26);
    v18[3] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
    v8 = [v9 errorWithDomain:v10 code:12 userInfo:v14];
  }
  return v8;
}

- (id)createHandlerForCredential:(id)a3
{
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession createHandlerForCredential:]", 35, self, @"Not Applicable", v3, v4, vars0);
  return 0;
}

- (id)_createHandlerForMerchantPaymentSign
{
  v33[4] = *MEMORY[0x263EF8340];
  if ([(STSCredential *)self->_activeCredential type] != 1)
  {
    unsigned int v10 = [(STSCredential *)self->_activeCredential type];
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForMerchantPaymentSign]", 42, self, @"Unsupported credential type %02x", v11, v12, v10);
    v13 = (void *)MEMORY[0x263F087E8];
    v14 = [NSString stringWithUTF8String:"STS.fwk"];
    v32[0] = *MEMORY[0x263F08320];
    v15 = [NSString stringWithUTF8String:"Invalid State"];
    v33[0] = v15;
    v33[1] = &unk_26D3081A0;
    v32[1] = @"Line";
    v32[2] = @"Method";
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v33[2] = v16;
    v32[3] = *MEMORY[0x263F07F80];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 43);
    v33[3] = v17;
    v18 = NSDictionary;
    v19 = v33;
    v20 = v32;
LABEL_9:
    v25 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:4];
    v9 = [v13 errorWithDomain:v14 code:9 userInfo:v25];

    goto LABEL_10;
  }
  uint64_t v4 = [(STSSessionBase *)self handler];

  if (v4)
  {
    int v5 = [(STSSessionBase *)self handler];
    char v6 = [v5 isMemberOfClass:objc_opt_class()];

    if (v6)
    {
      sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSigningSession _createHandlerForMerchantPaymentSign]", 52, self, @"Using existing handler.", v7, v8, v29);
      v9 = 0;
      goto LABEL_10;
    }
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForMerchantPaymentSign]", 48, self, @"Handler already exists but is of wrong class type", v7, v8, v29);
    v13 = (void *)MEMORY[0x263F087E8];
    v14 = [NSString stringWithUTF8String:"STS.fwk"];
    v30[0] = *MEMORY[0x263F08320];
    v15 = [NSString stringWithUTF8String:"Invalid State"];
    v31[0] = v15;
    v31[1] = &unk_26D3081B8;
    v30[1] = @"Line";
    v30[2] = @"Method";
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v31[2] = v16;
    v30[3] = *MEMORY[0x263F07F80];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 49);
    v31[3] = v17;
    v18 = NSDictionary;
    v19 = v31;
    v20 = v30;
    goto LABEL_9;
  }
  v21 = [[SignMerchantPaymentHandler alloc] initWithParent:self];
  [(STSSessionBase *)self setHandler:v21];

  uint64_t v22 = [(STSSessionBase *)self activateChildSession];
  if (v22)
  {
    v9 = (void *)v22;
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForMerchantPaymentSign]", 60, self, @"Handler activation failure: %@", v23, v24, v22);
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSigningSession _createHandlerForMerchantPaymentSign]", 62, self, @"Setting new activeCredential %@ on handler", v23, v24, (uint64_t)self->_activeCredential);
    v27 = [(STSSessionBase *)self handler];
    v9 = [v27 setActiveCredential:self->_activeCredential];

    if (!v9) {
      goto LABEL_10;
    }
  }
  v28 = [(STSSessionBase *)self handler];
  [v28 tearDownWithCompletion:0];

  [(STSSessionBase *)self setHandler:0];
LABEL_10:
  return v9;
}

- (id)_createHandlerForPeerPaymentSign
{
  v33[4] = *MEMORY[0x263EF8340];
  if ([(STSCredential *)self->_activeCredential type] != 1)
  {
    unsigned int v10 = [(STSCredential *)self->_activeCredential type];
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForPeerPaymentSign]", 77, self, @"Unsupported credential type %02x", v11, v12, v10);
    v13 = (void *)MEMORY[0x263F087E8];
    v14 = [NSString stringWithUTF8String:"STS.fwk"];
    v32[0] = *MEMORY[0x263F08320];
    v15 = [NSString stringWithUTF8String:"Invalid State"];
    v33[0] = v15;
    v33[1] = &unk_26D3081D0;
    v32[1] = @"Line";
    v32[2] = @"Method";
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v33[2] = v16;
    v32[3] = *MEMORY[0x263F07F80];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 78);
    v33[3] = v17;
    v18 = NSDictionary;
    v19 = v33;
    v20 = v32;
LABEL_9:
    v25 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:4];
    v9 = [v13 errorWithDomain:v14 code:9 userInfo:v25];

    goto LABEL_10;
  }
  uint64_t v4 = [(STSSessionBase *)self handler];

  if (v4)
  {
    int v5 = [(STSSessionBase *)self handler];
    char v6 = [v5 isMemberOfClass:objc_opt_class()];

    if (v6)
    {
      sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSigningSession _createHandlerForPeerPaymentSign]", 87, self, @"Using existing handler.", v7, v8, v29);
      v9 = 0;
      goto LABEL_10;
    }
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForPeerPaymentSign]", 83, self, @"Handler already exists but is of wrong class type", v7, v8, v29);
    v13 = (void *)MEMORY[0x263F087E8];
    v14 = [NSString stringWithUTF8String:"STS.fwk"];
    v30[0] = *MEMORY[0x263F08320];
    v15 = [NSString stringWithUTF8String:"Invalid State"];
    v31[0] = v15;
    v31[1] = &unk_26D3081E8;
    v30[1] = @"Line";
    v30[2] = @"Method";
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v31[2] = v16;
    v30[3] = *MEMORY[0x263F07F80];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 84);
    v31[3] = v17;
    v18 = NSDictionary;
    v19 = v31;
    v20 = v30;
    goto LABEL_9;
  }
  v21 = [[SignPeerPaymentHandler alloc] initWithParent:self];
  [(STSSessionBase *)self setHandler:v21];

  uint64_t v22 = [(STSSessionBase *)self activateChildSession];
  if (v22)
  {
    v9 = (void *)v22;
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForPeerPaymentSign]", 95, self, @"Handler activation failure: %@", v23, v24, v22);
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSigningSession _createHandlerForPeerPaymentSign]", 97, self, @"Seting new activeCredential %@ on handler", v23, v24, (uint64_t)self->_activeCredential);
    v27 = [(STSSessionBase *)self handler];
    v9 = [v27 setActiveCredential:self->_activeCredential];

    if (!v9) {
      goto LABEL_10;
    }
  }
  v28 = [(STSSessionBase *)self handler];
  [v28 tearDownWithCompletion:0];

  [(STSSessionBase *)self setHandler:0];
LABEL_10:
  return v9;
}

- (id)signPeerPayment:(id)a3 authorization:(id)a4 error:(id *)a5
{
  v27[4] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = _os_activity_create(&dword_221170000, "signPeerPayment:authorization:error:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if ([v9 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v12 = [(STSSigningSession *)self _createHandlerForPeerPaymentSign];
    if (!v12)
    {
      uint64_t v23 = [(STSSessionBase *)self handler];
      v14 = [v23 signPeerPayment:v9 authorization:v10 error:a5];

      id v13 = 0;
      goto LABEL_9;
    }
    id v13 = v12;
    if (a5)
    {
      id v13 = v12;
      v14 = 0;
      *a5 = v13;
LABEL_9:

      goto LABEL_10;
    }
LABEL_7:
    v14 = 0;
    goto LABEL_9;
  }
  ClassName = object_getClassName(v9);
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession signPeerPayment:authorization:error:]", 115, self, @"Unsupported request type - %s", v16, v17, (uint64_t)ClassName);
  if (a5)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    id v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v26[0] = *MEMORY[0x263F08320];
    v19 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v27[0] = v19;
    v27[1] = &unk_26D308200;
    v26[1] = @"Line";
    v26[2] = @"Method";
    v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v27[2] = v20;
    v26[3] = *MEMORY[0x263F07F80];
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 117);
    v27[3] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
    *a5 = [v18 errorWithDomain:v13 code:8 userInfo:v22];

    goto LABEL_7;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (id)signInAppPayment:(id)a3 authorization:(id)a4 error:(id *)a5
{
  v27[4] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = _os_activity_create(&dword_221170000, "signInAppPayment:authorization:error:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if ([v9 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v12 = [(STSSigningSession *)self _createHandlerForMerchantPaymentSign];
    if (!v12)
    {
      uint64_t v23 = [(STSSessionBase *)self handler];
      v14 = [v23 signInAppPayment:v9 authorization:v10 error:a5];

      id v13 = 0;
      goto LABEL_9;
    }
    id v13 = v12;
    if (a5)
    {
      id v13 = v12;
      v14 = 0;
      *a5 = v13;
LABEL_9:

      goto LABEL_10;
    }
LABEL_7:
    v14 = 0;
    goto LABEL_9;
  }
  ClassName = object_getClassName(v9);
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession signInAppPayment:authorization:error:]", 142, self, @"Unsupported request type - %s", v16, v17, (uint64_t)ClassName);
  if (a5)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    id v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v26[0] = *MEMORY[0x263F08320];
    v19 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v27[0] = v19;
    v27[1] = &unk_26D308218;
    v26[1] = @"Line";
    v26[2] = @"Method";
    v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v27[2] = v20;
    v26[3] = *MEMORY[0x263F07F80];
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 144);
    v27[3] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
    *a5 = [v18 errorWithDomain:v13 code:8 userInfo:v22];

    goto LABEL_7;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (id)setActiveCredential:(id)a3
{
  v51[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_221170000, "setActiveCredential:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 165, self, @"%@", v8, v9, (uint64_t)v6);
  id v10 = [(STSSessionBase *)self handler];

  if (v10)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 168, self, @"New handler will be required, Tearing down current handler.", v11, v12, v45);
    id v13 = [(STSSessionBase *)self handler];
    [v13 tearDownWithCompletion:0];

    [(STSSessionBase *)self setHandler:0];
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 172, self, @"Waiting for Control SE session ready", v14, v15, v46);
    uint64_t v16 = [(STSSessionBase *)self waitForControlSessionToBeReady:1];
    if (v16)
    {
      v19 = (void *)v16;
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 176, self, @"Control SE session not ready: %@", v17, v18, v16);
      goto LABEL_13;
    }
  }
  v20 = [v6 identifier];
  uint64_t v21 = [v20 length];

  if (v21)
  {
    uint64_t v24 = [(STSSessionBase *)self masterSESession];
    v25 = [v6 identifier];
    v26 = [v24 appletWithIdentifier:v25];

    if (v26)
    {
      sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 184, self, @"Applet is present: applet=%@", v27, v28, (uint64_t)v26);
LABEL_10:

      objc_storeStrong((id *)&self->_activeCredential, a3);
      v19 = 0;
      goto LABEL_13;
    }
    v37 = [v6 identifier];
    int v38 = [v37 isEqualToString:0x26D2FEE60];

    uint64_t v39 = [v6 identifier];
    v42 = (void *)v39;
    if (v38)
    {
      sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 192, self, @"Applet is presumed to be present = %@", v40, v41, v39);

      goto LABEL_10;
    }
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 189, self, @"Applet not found for identifier = %@", v40, v41, v39);

    uint64_t v29 = (void *)MEMORY[0x263F087E8];
    v30 = [NSString stringWithUTF8String:"STS.fwk"];
    v50[0] = *MEMORY[0x263F08320];
    v31 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v51[0] = v31;
    v51[1] = &unk_26D308230;
    v50[1] = @"Line";
    v50[2] = @"Method";
    v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v51[2] = v32;
    v50[3] = *MEMORY[0x263F07F80];
    v33 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 190);
    v51[3] = v33;
    v34 = NSDictionary;
    v35 = v51;
    v36 = v50;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 196, self, @"Credential did not specify an AID", v22, v23, v45);
    uint64_t v29 = (void *)MEMORY[0x263F087E8];
    v30 = [NSString stringWithUTF8String:"STS.fwk"];
    v48[0] = *MEMORY[0x263F08320];
    v31 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v49[0] = v31;
    v49[1] = &unk_26D308248;
    v48[1] = @"Line";
    v48[2] = @"Method";
    v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v49[2] = v32;
    v48[3] = *MEMORY[0x263F07F80];
    v33 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 197);
    v49[3] = v33;
    v34 = NSDictionary;
    v35 = v49;
    v36 = v48;
  }
  v43 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:4];
  v19 = [v29 errorWithDomain:v30 code:8 userInfo:v43];

LABEL_13:
  return v19;
}

- (void).cxx_destruct
{
}

@end