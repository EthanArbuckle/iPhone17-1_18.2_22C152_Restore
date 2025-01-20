@interface SignMerchantPaymentHandler
- (STSSigningSession)parent;
- (SignMerchantPaymentHandler)initWithParent:(id)a3;
- (id)signInAppPayment:(id)a3 authorization:(id)a4 error:(id *)a5;
- (id)startNFSessionWithCompletion:(id)a3;
- (unsigned)supportedCredentialType;
@end

@implementation SignMerchantPaymentHandler

- (SignMerchantPaymentHandler)initWithParent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SignMerchantPaymentHandler;
  v5 = [(SignMerchantPaymentHandler *)&v8 init];
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
  v9[2] = sub_2211948F8;
  v9[3] = &unk_264594D08;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 startECommercePaymentSession:v9];

  return v7;
}

- (id)signInAppPayment:(id)a3 authorization:(id)a4 error:(id *)a5
{
  v56[4] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v11 = [(STSHandler *)self activeSTSCredential];

  if (v11)
  {
    if ([v9 isMemberOfClass:objc_opt_class()])
    {
      if (self->_nfECommerceSession)
      {
        v16 = "is";
        if (!v10) {
          v16 = "is not";
        }
        sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[SignMerchantPaymentHandler signInAppPayment:authorization:error:]", 76, self, @"Authorization %s available", v14, v15, (uint64_t)v16);
        id v17 = v9;
        v18 = [(STSHandler *)self activeSTSCredential];
        v19 = [v18 identifier];

        v20 = [v17 toNFECommercePaymentRequest:v19];
        nfECommerceSession = self->_nfECommerceSession;
        id v48 = 0;
        v22 = [(NFECommercePaymentSession *)nfECommerceSession performECommercePayment:v10 request:v20 error:&v48];
        id v23 = v48;
        v26 = v23;
        if (v23)
        {
          sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignMerchantPaymentHandler signInAppPayment:authorization:error:]", 86, self, @"start transaction failed = %@", v24, v25, (uint64_t)v23);
          if (a5)
          {
            v47 = (void *)MEMORY[0x263F087E8];
            v45 = [NSString stringWithUTF8String:"STS.fwk"];
            v49[0] = *MEMORY[0x263F08320];
            v46 = [NSString stringWithUTF8String:"Unexpected Result"];
            uint64_t v27 = *MEMORY[0x263F08608];
            v50[0] = v46;
            v50[1] = v26;
            v49[1] = v27;
            v49[2] = @"Line";
            v50[2] = &unk_26D3082A8;
            v49[3] = @"Method";
            v44 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
            v50[3] = v44;
            v49[4] = *MEMORY[0x263F07F80];
            v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 88);
            v50[4] = v28;
            v29 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:5];
            *a5 = [v47 errorWithDomain:v45 code:10 userInfo:v29];
          }
          id v30 = 0;
        }
        else
        {
          id v30 = [[STSMerchantPaymentResponse alloc] initFromNFECommercePaymentResponse:v22];
        }
        goto LABEL_18;
      }
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignMerchantPaymentHandler signInAppPayment:authorization:error:]", 69, self, @"NF session does not exist!", v14, v15, v43);
      if (a5)
      {
        v31 = (void *)MEMORY[0x263F087E8];
        v26 = [NSString stringWithUTF8String:"STS.fwk"];
        v51[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Invalid State"];
        v52[0] = v17;
        v52[1] = &unk_26D308290;
        v51[1] = @"Line";
        v51[2] = @"Method";
        v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v52[2] = v19;
        v51[3] = *MEMORY[0x263F07F80];
        v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 71);
        v52[3] = v20;
        v32 = NSDictionary;
        v33 = v52;
        v34 = v51;
        goto LABEL_16;
      }
    }
    else
    {
      ClassName = object_getClassName(v9);
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignMerchantPaymentHandler signInAppPayment:authorization:error:]", 61, self, @"Class %s is not supported!", v36, v37, (uint64_t)ClassName);
      if (a5)
      {
        v38 = (void *)MEMORY[0x263F087E8];
        v26 = [NSString stringWithUTF8String:"STS.fwk"];
        v53[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Invalid Parameter"];
        v54[0] = v17;
        v54[1] = &unk_26D308278;
        v53[1] = @"Line";
        v53[2] = @"Method";
        v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v54[2] = v19;
        v53[3] = *MEMORY[0x263F07F80];
        v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 63);
        v54[3] = v20;
        v22 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:4];
        v39 = v38;
        v40 = v26;
        uint64_t v41 = 8;
LABEL_17:
        [v39 errorWithDomain:v40 code:v41 userInfo:v22];
        id v30 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

        goto LABEL_20;
      }
    }
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignMerchantPaymentHandler signInAppPayment:authorization:error:]", 55, self, @"Credential does not exist!", v12, v13, v43);
    if (a5)
    {
      v31 = (void *)MEMORY[0x263F087E8];
      v26 = [NSString stringWithUTF8String:"STS.fwk"];
      v55[0] = *MEMORY[0x263F08320];
      id v17 = [NSString stringWithUTF8String:"Invalid State"];
      v56[0] = v17;
      v56[1] = &unk_26D308260;
      v55[1] = @"Line";
      v55[2] = @"Method";
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v56[2] = v19;
      v55[3] = *MEMORY[0x263F07F80];
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 57);
      v56[3] = v20;
      v32 = NSDictionary;
      v33 = v56;
      v34 = v55;
LABEL_16:
      v22 = [v32 dictionaryWithObjects:v33 forKeys:v34 count:4];
      v39 = v31;
      v40 = v26;
      uint64_t v41 = 9;
      goto LABEL_17;
    }
  }
  id v30 = 0;
LABEL_20:

  return v30;
}

- (STSSigningSession)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (STSSigningSession *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_nfECommerceSession, 0);
}

@end