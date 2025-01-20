@interface SignPeerPaymentHandler
- (STSSigningSession)parent;
- (SignPeerPaymentHandler)initWithParent:(id)a3;
- (id)signPeerPayment:(id)a3 authorization:(id)a4 error:(id *)a5;
- (id)startNFSessionWithCompletion:(id)a3;
- (unsigned)supportedCredentialType;
@end

@implementation SignPeerPaymentHandler

- (SignPeerPaymentHandler)initWithParent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SignPeerPaymentHandler;
  v5 = [(SignPeerPaymentHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_parent, v4);
  }

  return v6;
}

- (unsigned)supportedCredentialType
{
  return 1;
}

- (id)startNFSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(STSHandler *)self nfHardwareManager];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_22117F3A4;
  v9[3] = &unk_2645948E8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 startPeerPaymentSession:v9];

  return v7;
}

- (id)signPeerPayment:(id)a3 authorization:(id)a4 error:(id *)a5
{
  v60[4] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v11 = [(STSHandler *)self activeSTSCredential];

  if (!v11)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignPeerPaymentHandler signPeerPayment:authorization:error:]", 57, self, @"Credential does not exist!", v12, v13, v49);
    if (!a5) {
      goto LABEL_19;
    }
    v34 = (void *)MEMORY[0x263F087E8];
    v28 = [NSString stringWithUTF8String:"STS.fwk"];
    v59[0] = *MEMORY[0x263F08320];
    v22 = [NSString stringWithUTF8String:"Invalid State"];
    v60[0] = v22;
    v60[1] = &unk_26D307B40;
    v59[1] = @"Line";
    v59[2] = @"Method";
    v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v60[2] = v24;
    v59[3] = *MEMORY[0x263F07F80];
    v35 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 59);
    v60[3] = v35;
    v36 = NSDictionary;
    v37 = v60;
    v38 = v59;
LABEL_15:
    v44 = [v36 dictionaryWithObjects:v37 forKeys:v38 count:4];
    v45 = v34;
    v46 = v28;
    uint64_t v47 = 9;
LABEL_16:
    *a5 = [v45 errorWithDomain:v46 code:v47 userInfo:v44];

    goto LABEL_17;
  }
  v14 = [(STSHandler *)self activeSTSCredential];
  v15 = [v14 identifier];
  char v16 = [v15 isEqualToString:0x26D2FEE60];

  if ((v16 & 1) == 0)
  {
    v39 = [(STSHandler *)self activeSTSCredential];
    v40 = [v39 identifier];
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignPeerPaymentHandler signPeerPayment:authorization:error:]", 65, self, @"AID is not supported by Peer Payment handler - %@", v41, v42, (uint64_t)v40);

    if (!a5) {
      goto LABEL_19;
    }
    v43 = (void *)MEMORY[0x263F087E8];
    v28 = [NSString stringWithUTF8String:"STS.fwk"];
    v57[0] = *MEMORY[0x263F08320];
    v22 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v58[0] = v22;
    v58[1] = &unk_26D307B58;
    v57[1] = @"Line";
    v57[2] = @"Method";
    v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v58[2] = v24;
    v57[3] = *MEMORY[0x263F07F80];
    v35 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 67);
    v58[3] = v35;
    v44 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:4];
    v45 = v43;
    v46 = v28;
    uint64_t v47 = 8;
    goto LABEL_16;
  }
  if (!self->_nfPeerPaymentSession)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignPeerPaymentHandler signPeerPayment:authorization:error:]", 74, self, @"NF session does not exist!", v17, v18, v49);
    if (!a5) {
      goto LABEL_19;
    }
    v34 = (void *)MEMORY[0x263F087E8];
    v28 = [NSString stringWithUTF8String:"STS.fwk"];
    v55[0] = *MEMORY[0x263F08320];
    v22 = [NSString stringWithUTF8String:"Invalid State"];
    v56[0] = v22;
    v56[1] = &unk_26D307B70;
    v55[1] = @"Line";
    v55[2] = @"Method";
    v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v56[2] = v24;
    v55[3] = *MEMORY[0x263F07F80];
    v35 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 76);
    v56[3] = v35;
    v36 = NSDictionary;
    v37 = v56;
    v38 = v55;
    goto LABEL_15;
  }
  v19 = "is";
  if (!v10) {
    v19 = "is not";
  }
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[SignPeerPaymentHandler signPeerPayment:authorization:error:]", 81, self, @"Authorization %s available", v17, v18, (uint64_t)v19);
  v20 = [(STSHandler *)self activeSTSCredential];
  v21 = [v20 identifier];
  v22 = [v9 toNFPeerPaymentRequest:v21];

  nfPeerPaymentSession = self->_nfPeerPaymentSession;
  id v52 = 0;
  v24 = [(NFPeerPaymentSession *)nfPeerPaymentSession performPeerPayment:v10 request:v22 error:&v52];
  id v25 = v52;
  v28 = v25;
  if (!v25)
  {
    a5 = [[STSPeerPaymentResponse alloc] initFromNFPeerPaymentResponse:v24];
    goto LABEL_18;
  }
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignPeerPaymentHandler signPeerPayment:authorization:error:]", 89, self, @"start transaction failed = %@", v26, v27, (uint64_t)v25);
  if (a5)
  {
    v29 = (void *)MEMORY[0x263F087E8];
    v50 = [NSString stringWithUTF8String:"STS.fwk"];
    v53[0] = *MEMORY[0x263F08320];
    v51 = [NSString stringWithUTF8String:"Unexpected Result"];
    uint64_t v30 = *MEMORY[0x263F08608];
    v54[0] = v51;
    v54[1] = v28;
    v53[1] = v30;
    v53[2] = @"Line";
    v54[2] = &unk_26D307B88;
    v53[3] = @"Method";
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v54[3] = v31;
    v53[4] = *MEMORY[0x263F07F80];
    v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 91);
    v54[4] = v32;
    v33 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:5];
    *a5 = [v29 errorWithDomain:v50 code:10 userInfo:v33];

LABEL_17:
    a5 = 0;
  }
LABEL_18:

LABEL_19:
  return a5;
}

- (STSSigningSession)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (STSSigningSession *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_nfPeerPaymentSession, 0);
}

@end