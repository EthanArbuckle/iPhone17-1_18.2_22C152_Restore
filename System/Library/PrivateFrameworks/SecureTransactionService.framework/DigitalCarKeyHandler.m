@interface DigitalCarKeyHandler
- (id)setActiveCredential:(id)a3;
- (id)startNFSessionWithCompletion:(id)a3;
- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4;
- (id)stopTransaction;
- (unsigned)supportedCredentialType;
- (void)session:(id)a3 didEndTransaction:(id)a4;
- (void)session:(id)a3 didEnterFieldWithNotification:(id)a4;
- (void)session:(id)a3 didExpireTransactionForApplet:(id)a4;
- (void)session:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5;
- (void)session:(id)a3 didReceivePassthroughMessage:(id)a4;
- (void)session:(id)a3 didStartTransaction:(id)a4;
- (void)session:(id)a3 event:(id)a4;
- (void)sessionDidExitField:(id)a3;
- (void)sessionDidFailDeferredAuthorization:(id)a3;
- (void)sessionDidReceiveActivityTimeout:(id)a3 result:(id)a4;
@end

@implementation DigitalCarKeyHandler

- (unsigned)supportedCredentialType
{
  return 4;
}

- (id)startNFSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(STSHandler *)self nfHardwareManager];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2211954CC;
  v9[3] = &unk_264594D58;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 startDigitalCarKeySession:v9];

  return v7;
}

- (id)setActiveCredential:(id)a3
{
  v44[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)DigitalCarKeyHandler;
  v8 = [(STSHandler *)&v38 setActiveCredential:v5];
  if (!v5 || ([v5 identifier], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler setActiveCredential:]", 67, self, @"Invalid credential", v6, v7, v34);
    v27 = (void *)MEMORY[0x263F087E8];
    v12 = [NSString stringWithUTF8String:"STS.fwk"];
    v39[0] = *MEMORY[0x263F08320];
    v20 = [NSString stringWithUTF8String:"Invalid State"];
    v40[0] = v20;
    v40[1] = &unk_26D3082F0;
    v39[1] = @"Line";
    v39[2] = @"Method";
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v40[2] = v21;
    v39[3] = *MEMORY[0x263F07F80];
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 68);
    v40[3] = v16;
    v22 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
    uint64_t v26 = [v27 errorWithDomain:v12 code:9 userInfo:v22];
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  nfSession = self->_nfSession;
  v11 = [v5 identifier];
  v12 = [(NFDigitalCarKeySession *)nfSession appletWithIdentifier:v11];

  if (!v12)
  {
    v29 = [v5 identifier];
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler setActiveCredential:]", 63, self, @"applet not found for identifier = %@", v30, v31, (uint64_t)v29);

    v32 = (void *)MEMORY[0x263F087E8];
    v20 = [NSString stringWithUTF8String:"STS.fwk"];
    v41[0] = *MEMORY[0x263F08320];
    v21 = [NSString stringWithUTF8String:"Unexpected Result"];
    v42[0] = v21;
    v42[1] = &unk_26D3082D8;
    v41[1] = @"Line";
    v41[2] = @"Method";
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v42[2] = v16;
    v41[3] = *MEMORY[0x263F07F80];
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 64);
    v42[3] = v22;
    uint64_t v33 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
    uint64_t v26 = [v32 errorWithDomain:v20 code:10 userInfo:v33];

    v12 = 0;
    v8 = (void *)v33;
    goto LABEL_10;
  }
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler setActiveCredential:]", 57, self, @"applet %@", v13, v14, (uint64_t)v12);
  v15 = self->_nfSession;
  v16 = [v5 subIdentifier];
  id v37 = v8;
  LOBYTE(v15) = [(NFDigitalCarKeySession *)v15 setActiveApplet:v12 key:v16 outError:&v37];
  id v17 = v37;

  if (v15) {
    goto LABEL_13;
  }
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler setActiveCredential:]", 59, self, @"set active applet failed = %@", v18, v19, (uint64_t)v17);
  v36 = (void *)MEMORY[0x263F087E8];
  v20 = [NSString stringWithUTF8String:"STS.fwk"];
  v43[0] = *MEMORY[0x263F08320];
  v21 = [NSString stringWithUTF8String:"Unexpected Result"];
  v44[0] = v21;
  v43[1] = *MEMORY[0x263F08608];
  v22 = v17;
  if (!v17)
  {
    v23 = (void *)MEMORY[0x263F087E8];
    v16 = [NSString stringWithUTF8String:"STS.fwk"];
    v22 = [v23 errorWithDomain:v16 code:5 userInfo:0];
  }
  v44[1] = v22;
  v44[2] = &unk_26D3082C0;
  v43[2] = @"Line";
  v43[3] = @"Method";
  v35 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
  v44[3] = v35;
  v43[4] = *MEMORY[0x263F07F80];
  v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 60);
  v44[4] = v24;
  v25 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:5];
  uint64_t v26 = [v36 errorWithDomain:v20 code:10 userInfo:v25];

  if (!v17) {
    goto LABEL_11;
  }
LABEL_12:

  id v17 = (id)v26;
LABEL_13:

  return v17;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  void v40[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v36.receiver = self;
  v36.super_class = (Class)DigitalCarKeyHandler;
  id v10 = [(STSTransactionHandler *)&v36 startTransactionWithAuthorization:v7 options:a4];
  if (self->_nfSession)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler startTransactionWithAuthorization:options:]", 82, self, @"auth: %@", v8, v9, (uint64_t)v7);
    nfSession = self->_nfSession;
    id v35 = v10;
    char v12 = [(NFDigitalCarKeySession *)nfSession startCardEmulationAuthorization:v7 deferred:0 error:&v35];
    id v13 = v35;

    if ((v12 & 1) == 0)
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler startTransactionWithAuthorization:options:]", 84, self, @"start transaction failed = %@", v14, v15, (uint64_t)v13);
      v16 = (void *)MEMORY[0x263F087E8];
      id v17 = [NSString stringWithUTF8String:"STS.fwk"];
      v37[0] = *MEMORY[0x263F08320];
      uint64_t v18 = [NSString stringWithUTF8String:"Unexpected Result"];
      v38[0] = v18;
      v37[1] = *MEMORY[0x263F08608];
      uint64_t v19 = v13;
      if (!v13)
      {
        v20 = (void *)MEMORY[0x263F087E8];
        uint64_t v34 = [NSString stringWithUTF8String:"STS.fwk"];
        uint64_t v19 = objc_msgSend(v20, "errorWithDomain:code:userInfo:");
      }
      v38[1] = v19;
      v38[2] = &unk_26D308320;
      v37[2] = @"Line";
      v37[3] = @"Method";
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v38[3] = v21;
      v37[4] = *MEMORY[0x263F07F80];
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 85);
      v38[4] = v22;
      v23 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];
      uint64_t v24 = [v16 errorWithDomain:v17 code:10 userInfo:v23];

      if (!v13)
      {
      }
      id v13 = (id)v24;
    }
    id v25 = v13;
    id v10 = v25;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler startTransactionWithAuthorization:options:]", 78, self, @"NF session does not exist!", v8, v9, v33);
    uint64_t v26 = (void *)MEMORY[0x263F087E8];
    v27 = [NSString stringWithUTF8String:"STS.fwk"];
    v39[0] = *MEMORY[0x263F08320];
    v28 = [NSString stringWithUTF8String:"Invalid State"];
    v40[0] = v28;
    v40[1] = &unk_26D308308;
    v39[1] = @"Line";
    v39[2] = @"Method";
    v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v40[2] = v29;
    v39[3] = *MEMORY[0x263F07F80];
    uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 79);
    v40[3] = v30;
    uint64_t v31 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
    id v25 = [v26 errorWithDomain:v27 code:9 userInfo:v31];
  }
  return v25;
}

- (id)stopTransaction
{
  v21[4] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)DigitalCarKeyHandler;
  uint64_t v6 = [(STSTransactionHandler *)&v19 stopTransaction];
  if (self->_nfSession)
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[DigitalCarKeyHandler stopTransaction]", 99, self, &stru_26D2FDEC0, v4, v5, v17);
    nfSession = self->_nfSession;
    id v18 = v6;
    [(NFDigitalCarKeySession *)nfSession stopCardEmulation:&v18];
    id v8 = v18;

    id v9 = v8;
    uint64_t v6 = v9;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler stopTransaction]", 95, self, @"NF session does not exist!", v4, v5, v17);
    id v10 = (void *)MEMORY[0x263F087E8];
    v11 = [NSString stringWithUTF8String:"STS.fwk"];
    v20[0] = *MEMORY[0x263F08320];
    char v12 = [NSString stringWithUTF8String:"Invalid State"];
    v21[0] = v12;
    v21[1] = &unk_26D308338;
    v20[1] = @"Line";
    v20[2] = @"Method";
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v21[2] = v13;
    v20[3] = *MEMORY[0x263F07F80];
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 96);
    v21[3] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
    id v9 = [v10 errorWithDomain:v11 code:9 userInfo:v15];
  }
  return v9;
}

- (void)session:(id)a3 event:(id)a4
{
  id v19 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:event:]", 178, self, @"%@", v5, v6, (uint64_t)v19);
  id v7 = [v19 objectForKeyedSubscript:*MEMORY[0x263F580F8]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler session:event:]", 182, self, @"Received invalid key=%@ for payload=%@", v8, v9, (uint64_t)v7);
    goto LABEL_13;
  }
  char v12 = [(STSTransactionHandler *)self parent];
  if (v12)
  {
    id v13 = [v19 objectForKeyedSubscript:*MEMORY[0x263F580E8]];
    uint64_t v14 = [v19 objectForKeyedSubscript:*MEMORY[0x263F580F0]];
    if ([v7 isEqualToString:@"com.apple.secureelementservice.dck.event.vehicle.did.unlock"])
    {
      uint64_t v15 = [STSExpressEventInfoWithIdentifiers alloc];
      uint64_t v16 = 10;
    }
    else
    {
      if (![v7 isEqualToString:@"com.apple.secureelementservice.dck.event.vehicle.did.lock"])
      {
        [v12 fireDigitalCarKeyEventPayload:v19];
        goto LABEL_11;
      }
      uint64_t v15 = [STSExpressEventInfoWithIdentifiers alloc];
      uint64_t v16 = 9;
    }
    uint64_t v17 = [(STSExpressEventInfoWithIdentifiers *)v15 initWithState:v16 appletIdentifier:v13 keyIdentifier:v14];
    [v12 fireExpressModeStateChangeWithInfo:v17];

LABEL_11:
    goto LABEL_12;
  }
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:event:]", 188, self, @"Parent session is no longer available", v10, v11, v18);
LABEL_12:

LABEL_13:
}

- (void)session:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didEnterFieldWithNotification:]", 213, self, @"%@", v6, v7, (uint64_t)v5);
  sub_221199468(v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [(STSTransactionHandler *)self parent];
  [v8 fireFieldNotificationEvent:v9];
}

- (void)sessionDidExitField:(id)a3
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler sessionDidExitField:]", 219, self, @"Field Off", v3, v4, v6);
  id v7 = [(STSTransactionHandler *)self parent];
  [v7 fireFieldDetectEvent:0];
}

- (void)session:(id)a3 didExpireTransactionForApplet:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didExpireTransactionForApplet:]", 224, self, @"EXPIRED: %@", v4, v5, (uint64_t)a4);
  id v7 = [(STSTransactionHandler *)self parent];
  [v7 fireDidExpireTransaction:1];
}

- (void)session:(id)a3 didStartTransaction:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didStartTransaction:]", 229, self, @"START: %@", v6, v7, (uint64_t)v5);
  uint64_t v8 = [STSTransactionStartEvent alloc];
  id v9 = [(STSHandler *)self activeSTSCredential];
  uint64_t v11 = [(STSTransactionStartEvent *)v8 initWithCredential:v9 andDigitalCarKeyStartEvent:v5];

  uint64_t v10 = [(STSTransactionHandler *)self parent];
  [v10 fireTransactionStartEvent:v11];
}

- (void)session:(id)a3 didEndTransaction:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didEndTransaction:]", 236, self, @"END: %@", v6, v7, (uint64_t)v5);
  uint64_t v8 = [STSTransactionEndEvent alloc];
  id v9 = [(STSHandler *)self activeSTSCredential];
  uint64_t v11 = [(STSTransactionEndEvent *)v8 initWithCredential:v9 andDigitalCarKeyEndEvent:v5];

  uint64_t v10 = [(STSTransactionHandler *)self parent];
  [v10 fireTransactionEndEvent:v11];
}

- (void)sessionDidFailDeferredAuthorization:(id)a3
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler sessionDidFailDeferredAuthorization:]", 243, self, @"Failed deferred authorization", v3, v4, v6);
  id v7 = [(STSTransactionHandler *)self parent];
  [v7 fireDidFailDeferredAuth:1];
}

- (void)session:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didExpressModeStateChange:withObject:]", 250, self, @"%d - %@", v8, v9, v5);
  uint64_t v10 = 0;
  if ((v5 - 1) <= 8) {
    uint64_t v10 = dword_2211A6708[(int)v5 - 1];
  }
  char v12 = [[STSExpressEventInfoWithDetail alloc] initWithState:v10 detail:v7];

  uint64_t v11 = [(STSTransactionHandler *)self parent];
  [v11 fireExpressModeStateChangeWithInfo:v12];
}

- (void)sessionDidReceiveActivityTimeout:(id)a3 result:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler sessionDidReceiveActivityTimeout:result:]", 257, self, @"Activity Timeout : %@", v6, v7, (uint64_t)v5);
  id v8 = [(STSTransactionHandler *)self parent];
  [v8 fireDidReceiveActivityTimeout:v5];
}

- (void)session:(id)a3 didReceivePassthroughMessage:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didReceivePassthroughMessage:]", 264, self, @"Received passhtrough message", v6, v7, v8);
  id v9 = [(STSTransactionHandler *)self parent];
  [v9 fireDidReceivePassthroughMessage:v5];
}

- (void).cxx_destruct
{
}

@end