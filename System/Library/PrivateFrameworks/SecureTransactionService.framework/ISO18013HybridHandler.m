@interface ISO18013HybridHandler
- (BOOL)activateChildSessionOnSetActiveCredential;
- (id)activateWithHandoffToken:(id)a3;
- (id)setActiveCredential:(id)a3;
- (id)setActiveCredentials:(id)a3;
- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4;
- (id)stopTransaction;
- (unsigned)supportedCredentialType;
- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3;
- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3;
- (void)alternativeCarrierReceived:(id)a3 dataPending:(BOOL)a4;
- (void)connectionHandoverCompleted:(id)a3;
- (void)notificationClientConnected;
- (void)processISO18013CredentialProposals:(id)a3 readerAuthInfo:(id)a4;
- (void)session:(id)a3 connectionHandoverProcessFailure:(id)a4;
- (void)session:(id)a3 didDetectField:(BOOL)a4;
- (void)session:(id)a3 didEndTransaction:(id)a4;
- (void)session:(id)a3 didEndUnexpectedly:(id)a4;
- (void)session:(id)a3 didEnterFieldWithNotification:(id)a4;
- (void)session:(id)a3 didExpireTransactionForApplet:(id)a4;
- (void)session:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5;
- (void)session:(id)a3 didSelectApplet:(id)a4;
- (void)session:(id)a3 didStartTransaction:(id)a4;
- (void)session:(id)a3 fieldChange:(BOOL)a4;
- (void)session:(id)a3 fieldNotification:(id)a4;
- (void)session:(id)a3 tnepService:(id)a4;
- (void)sessionDidExitField:(id)a3;
- (void)tearDownWithCompletion:(id)a3;
- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4;
- (void)transactionStarted:(unint64_t)a3;
- (void)xpcInterrupted;
- (void)xpcInvalidated;
@end

@implementation ISO18013HybridHandler

- (id)setActiveCredential:(id)a3
{
  v37[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    int v7 = [v5 type];
    if (v7 == [(ISO18013HybridHandler *)self supportedCredentialType])
    {
      uint64_t v10 = [v6 subIdentifier];
      if (v10)
      {
        v13 = (void *)v10;
        v14 = [v6 subIdentifier];
        uint64_t v15 = [v14 lengthOfBytesUsingEncoding:4];

        if (v15)
        {
          v16 = [STSCredential alloc];
          uint64_t v17 = [v6 type];
          v18 = [v6 identifier];
          v19 = [(STSCredential *)v16 initWithType:v17 identifier:v18 subIdentifier:0];

          v33[0] = v6;
          v33[1] = v19;
          v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
          v21 = [(ISO18013HybridHandler *)self setActiveCredentials:v20];

          goto LABEL_10;
        }
      }
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredential:]", 193, self, @"Missing required subIdentifier", v11, v12, v32);
      v22 = (void *)MEMORY[0x263F087E8];
      v23 = [NSString stringWithUTF8String:"STS.fwk"];
      v34[0] = *MEMORY[0x263F08320];
      v24 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v35[0] = v24;
      v35[1] = &unk_26D308080;
      v34[1] = @"Line";
      v34[2] = @"Method";
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v35[2] = v25;
      v34[3] = *MEMORY[0x263F07F80];
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 194);
      v35[3] = v26;
      v27 = NSDictionary;
      v28 = v35;
      v29 = v34;
    }
    else
    {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredential:]", 187, self, @"Invalid credential type", v8, v9, v32);
      v22 = (void *)MEMORY[0x263F087E8];
      v23 = [NSString stringWithUTF8String:"STS.fwk"];
      v36[0] = *MEMORY[0x263F08320];
      v24 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v37[0] = v24;
      v37[1] = &unk_26D308068;
      v36[1] = @"Line";
      v36[2] = @"Method";
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v37[2] = v25;
      v36[3] = *MEMORY[0x263F07F80];
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 188);
      v37[3] = v26;
      v27 = NSDictionary;
      v28 = v37;
      v29 = v36;
    }
    v30 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:4];
    v21 = [v22 errorWithDomain:v23 code:8 userInfo:v30];
  }
  else
  {
    v21 = [(ISO18013HybridHandler *)self setActiveCredentials:0];
  }
LABEL_10:

  return v21;
}

- (id)setActiveCredentials:(id)a3
{
  v140[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    sub_22118EB10((uint64_t)self, 0);
    v112.receiver = self;
    v112.super_class = (Class)ISO18013HybridHandler;
    uint64_t v11 = [(STSHandler *)&v112 setActiveCredentials:0];
    goto LABEL_41;
  }
  if ([v5 count] != 2)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredentials:]", 215, self, @"Non expected number of credentials provided", v7, v8, v87);
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v131[0] = *MEMORY[0x263F08320];
    v14 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v132[0] = v14;
    v132[1] = &unk_26D308098;
    v131[1] = @"Line";
    v131[2] = @"Method";
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v132[2] = v15;
    v131[3] = *MEMORY[0x263F07F80];
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 216);
    v132[3] = v16;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:4];
    uint64_t v11 = [v12 errorWithDomain:v13 code:8 userInfo:v17];

    goto LABEL_41;
  }
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x3032000000;
  v109 = sub_22118D364;
  v110 = sub_22118D374;
  id v111 = 0;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x3032000000;
  v103 = sub_22118D364;
  v104 = sub_22118D374;
  id v105 = 0;
  v99[0] = MEMORY[0x263EF8330];
  v99[1] = 3221225472;
  v99[2] = sub_22118EB28;
  v99[3] = &unk_264594C40;
  v99[4] = self;
  v99[5] = &v106;
  v99[6] = &v100;
  [v6 enumerateObjectsUsingBlock:v99];
  if (v107[5] && v101[5])
  {
    if (!self) {
      goto LABEL_21;
    }
    if (self->_handoverSession)
    {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"[(ISO18013HybridHandler *)"handover session already exists _startHandoverSession], v9, v10, v87);
      goto LABEL_21;
    }
    self->_transactionState = 0;
    uint64_t v116 = 0;
    v117 = &v116;
    uint64_t v118 = 0x3032000000;
    v119 = sub_22118D364;
    v120 = sub_22118D374;
    id v121 = 0;
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"[(ISO18013HybridHandler *)"Starting handover device session _startHandoverSession], v9, v10, 2);
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    v25 = [(STSHandler *)self nfHardwareManager];
    v113[0] = MEMORY[0x263EF8330];
    v113[1] = 3221225472;
    v113[2] = sub_22118D37C;
    v113[3] = &unk_264594C18;
    v113[4] = self;
    v115 = &v116;
    v26 = v24;
    v114 = v26;
    v91 = v25;
    id obj = [v25 startHandoverHybridSessionWithCompletion:v113];
    v29 = sel__startHandoverSession;
    if (obj)
    {
      objc_storeStrong((id *)&self->_handoverSession, obj);
      v30 = self->_handoverSession;
      [(NFSecureTransactionServicesHandoverHybridSession *)v30 setDelegate:self];

      v31 = [(STSHandler *)self handoffToken];
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]", 153, self, @"Activating session with token: %@", v32, v33, (uint64_t)v31);

      v34 = self->_handoverSession;
      v35 = [(STSHandler *)self handoffToken];
      v36 = [(NFSecureTransactionServicesHandoverHybridSession *)v34 activateWithToken:v35];

      if (v36)
      {
        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]", 156, self, @"Session switching error=%@", v37, v38, (uint64_t)v36);
        sub_22118D2F8((uint64_t)self);
        v39 = (void *)MEMORY[0x263F087E8];
        v92 = [NSString stringWithUTF8String:"STS.fwk"];
        v137[0] = *MEMORY[0x263F08320];
        v94 = [NSString stringWithUTF8String:"Unexpected Result"];
        uint64_t v40 = *MEMORY[0x263F08608];
        v138[0] = v94;
        v138[1] = v36;
        v137[1] = v40;
        v137[2] = @"Line";
        v138[2] = &unk_26D308020;
        v137[3] = @"Method";
        v41 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel__startHandoverSession));
        v138[3] = v41;
        v137[4] = *MEMORY[0x263F07F80];
        v42 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel__startHandoverSession), 158);
        v138[4] = v42;
        v43 = [NSDictionary dictionaryWithObjects:v138 forKeys:v137 count:5];
        v29 = [v39 errorWithDomain:v92 code:10 userInfo:v43];
      }
      else
      {
        dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);

        if (!v117[5])
        {
          v36 = 0;
          v26 = 0;
          char v45 = 1;
          goto LABEL_18;
        }
        sub_22118D2F8((uint64_t)self);
        uint64_t v76 = [(id)v117[5] code];
        v41 = (void *)0x263F08000;
        v90 = (void *)MEMORY[0x263F087E8];
        if (v76 != 50)
        {
          v92 = [NSString stringWithUTF8String:"STS.fwk"];
          v133[0] = *MEMORY[0x263F08320];
          v94 = [NSString stringWithUTF8String:"Unexpected Result"];
          v134[0] = v94;
          v133[1] = *MEMORY[0x263F08608];
          v42 = (void *)v117[5];
          v89 = v42;
          if (!v42)
          {
            v83 = (void *)MEMORY[0x263F087E8];
            v41 = [NSString stringWithUTF8String:"STS.fwk"];
            v42 = [v83 errorWithDomain:v41 code:5 userInfo:0];
          }
          v134[1] = v42;
          v134[2] = &unk_26D308050;
          v133[2] = @"Line";
          v133[3] = @"Method";
          v84 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel__startHandoverSession));
          v134[3] = v84;
          v133[4] = *MEMORY[0x263F07F80];
          v85 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel__startHandoverSession), 172);
          v134[4] = v85;
          v86 = [NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:5];
          v29 = [v90 errorWithDomain:v92 code:10 userInfo:v86];

          v36 = 0;
          v26 = 0;
          if (v89) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
        v92 = [NSString stringWithUTF8String:"STS.fwk"];
        v135[0] = *MEMORY[0x263F08320];
        v94 = [NSString stringWithUTF8String:"NFC radio disabled"];
        v136[0] = v94;
        v136[1] = &unk_26D308038;
        v135[1] = @"Line";
        v135[2] = @"Method";
        v41 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel__startHandoverSession));
        v136[2] = v41;
        v135[3] = *MEMORY[0x263F07F80];
        v42 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel__startHandoverSession), 170);
        v136[3] = v42;
        v43 = [NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:4];
        v29 = [v90 errorWithDomain:v92 code:18 userInfo:v43];
        v26 = 0;
      }
    }
    else
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]", 142, self, @"Fail to start SecureTransactionServicesSession", v27, v28, v88);
      sub_22118D2F8((uint64_t)self);
      v44 = (void *)MEMORY[0x263F087E8];
      v36 = [NSString stringWithUTF8String:"STS.fwk"];
      v139[0] = *MEMORY[0x263F08320];
      v92 = [NSString stringWithUTF8String:"Invalid State"];
      v140[0] = v92;
      v140[1] = &unk_26D308008;
      v139[1] = @"Line";
      v139[2] = @"Method";
      v94 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel__startHandoverSession));
      v140[2] = v94;
      v139[3] = *MEMORY[0x263F07F80];
      v41 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel__startHandoverSession), 144);
      v140[3] = v41;
      v42 = [NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:4];
      v29 = [v44 errorWithDomain:v36 code:9 userInfo:v42];
    }
LABEL_16:

LABEL_17:
    char v45 = 0;
LABEL_18:

    _Block_object_dispose(&v116, 8);
    if ((v45 & 1) == 0 && v29)
    {
      v46 = v29;
LABEL_39:
      v19 = v46;
      uint64_t v11 = v46;
      goto LABEL_40;
    }
LABEL_21:
    uint64_t v47 = v101[5];
    v128[0] = v107[5];
    v128[1] = v47;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:2];
    v98.receiver = self;
    v98.super_class = (Class)ISO18013HybridHandler;
    v19 = [(STSHandler *)&v98 setActiveCredentials:v48];

    if (v19)
    {
      v49 = (void *)MEMORY[0x263F087E8];
      v50 = [NSString stringWithUTF8String:"STS.fwk"];
      v126[0] = *MEMORY[0x263F08320];
      v51 = [NSString stringWithUTF8String:"Unexpected Result"];
      uint64_t v52 = *MEMORY[0x263F08608];
      v127[0] = v51;
      v127[1] = v19;
      v126[1] = v52;
      v126[2] = @"Line";
      v127[2] = &unk_26D3080C8;
      v126[3] = @"Method";
      v53 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v127[3] = v53;
      v126[4] = *MEMORY[0x263F07F80];
      v54 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 249);
      v127[4] = v54;
      v55 = [NSDictionary dictionaryWithObjects:v127 forKeys:v126 count:5];
      uint64_t v11 = [v49 errorWithDomain:v50 code:10 userInfo:v55];

      goto LABEL_40;
    }
    v56 = (void *)v101[5];
    if (!v56)
    {
      v67 = 0;
LABEL_38:
      v46 = v67;
      goto LABEL_39;
    }
    handoverSession = self->_handoverSession;
    v58 = [v56 identifier];
    v59 = [(NFSecureTransactionServicesHandoverHybridSession *)handoverSession appletWithIdentifier:v58];

    if (v59)
    {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredentials:]", 256, self, @"applet %@", v60, v61, (uint64_t)v59);
      v62 = self->_handoverSession;
      id v97 = 0;
      char v63 = [(NFSecureTransactionServicesHandoverHybridSession *)v62 setActiveApplet:v59 authorization:0 error:&v97];
      id v64 = v97;
      v67 = v64;
      if (v63)
      {
LABEL_37:
        sub_22118EB10((uint64_t)self, (void *)v101[5]);

        goto LABEL_38;
      }
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredentials:]", 258, self, @"set active applet failed = %@", v65, v66, (uint64_t)v64);
      v68 = (void *)MEMORY[0x263F087E8];
      id obja = [NSString stringWithUTF8String:"STS.fwk"];
      v124[0] = *MEMORY[0x263F08320];
      v69 = [NSString stringWithUTF8String:"Unexpected Result"];
      v125[0] = v69;
      v124[1] = *MEMORY[0x263F08608];
      v70 = v67;
      if (!v67)
      {
        v71 = (void *)MEMORY[0x263F087E8];
        v94 = [NSString stringWithUTF8String:"STS.fwk"];
        v70 = [v71 errorWithDomain:v94 code:5 userInfo:0];
      }
      v125[1] = v70;
      v125[2] = &unk_26D3080E0;
      v124[2] = @"Line";
      v124[3] = @"Method";
      v93 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v125[3] = v93;
      v124[4] = *MEMORY[0x263F07F80];
      v72 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 259);
      v125[4] = v72;
      v73 = [NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:5];
      uint64_t v74 = [v68 errorWithDomain:obja code:10 userInfo:v73];
      BOOL v75 = v67 == 0;

      v67 = (void *)v74;
      if (!v75)
      {
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      v77 = [(id)v101[5] identifier];
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredentials:]", 262, self, @"applet not found for identifier = %@", v78, v79, (uint64_t)v77);

      v80 = (void *)MEMORY[0x263F087E8];
      id obja = [NSString stringWithUTF8String:"STS.fwk"];
      v122[0] = *MEMORY[0x263F08320];
      v69 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v123[0] = v69;
      v123[1] = &unk_26D3080F8;
      v122[1] = @"Line";
      v122[2] = @"Method";
      v94 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v123[2] = v94;
      v122[3] = *MEMORY[0x263F07F80];
      v70 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 263);
      v123[3] = v70;
      v81 = [NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:4];
      v67 = [v80 errorWithDomain:obja code:8 userInfo:v81];
    }
    goto LABEL_36;
  }
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredentials:]", 238, self, @"Invalid credential configuration", v9, v10, v87);
  v18 = (void *)MEMORY[0x263F087E8];
  v19 = [NSString stringWithUTF8String:"STS.fwk"];
  v129[0] = *MEMORY[0x263F08320];
  v20 = [NSString stringWithUTF8String:"Invalid Parameter"];
  v130[0] = v20;
  v130[1] = &unk_26D3080B0;
  v129[1] = @"Line";
  v129[2] = @"Method";
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
  v130[2] = v21;
  v129[3] = *MEMORY[0x263F07F80];
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 239);
  v130[3] = v22;
  v23 = [NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:4];
  uint64_t v11 = [v18 errorWithDomain:v19 code:8 userInfo:v23];

LABEL_40:
  _Block_object_dispose(&v100, 8);

  _Block_object_dispose(&v106, 8);
LABEL_41:

  return v11;
}

- (id)activateWithHandoffToken:(id)a3
{
  id v4 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler activateWithHandoffToken:]", 285, self, &stru_26D2FDEC0, v5, v6, v8);
  [(STSHandler *)self setHandoffToken:v4];

  return 0;
}

- (BOOL)activateChildSessionOnSetActiveCredential
{
  return 1;
}

- (id)stopTransaction
{
  v32[5] = *MEMORY[0x263EF8340];
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler stopTransaction]", 321, self, &stru_26D2FDEC0, v2, v3, v27);
  v30.receiver = self;
  v30.super_class = (Class)ISO18013HybridHandler;
  uint64_t v6 = [(STSTransactionHandler *)&v30 stopTransaction];
  uint64_t v7 = [(STSHandler *)self activeSTSCredential];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(STSHandler *)self activeSTSCredential];
    if ([v9 type] == 5)
    {
      uint64_t v10 = [(STSHandler *)self activeSTSCredential];
      uint64_t v11 = [v10 identifier];

      if (v11)
      {
        sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013HybridHandler stopTransaction]", 328, self, &stru_26D2FDEC0, v12, v13, v28);
        handoverSession = self->_handoverSession;
        id v29 = v6;
        [(NFSecureTransactionServicesHandoverHybridSession *)handoverSession stopCardEmulation:&v29];
        id v15 = v29;

        unint64_t transactionState = self->_transactionState;
        uint64_t v6 = v15;
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  if (!self) {
    goto LABEL_11;
  }
  unint64_t transactionState = self->_transactionState;
LABEL_8:
  if (transactionState == 1 || transactionState == 2)
  {
    uint64_t v17 = [(STSTransactionHandler *)self parent];
    [v17 fireSessionDidEndUnexpectedlyEventWithStatus:3];
  }
LABEL_11:
  sub_22118ECC4((os_unfair_lock_s *)self, 0);
  if (v6)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    v19 = [NSString stringWithUTF8String:"STS.fwk"];
    v31[0] = *MEMORY[0x263F08320];
    v20 = [NSString stringWithUTF8String:"Unexpected Result"];
    uint64_t v21 = *MEMORY[0x263F08608];
    v32[0] = v20;
    v32[1] = v6;
    v31[1] = v21;
    v31[2] = @"Line";
    v32[2] = &unk_26D308110;
    v31[3] = @"Method";
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v32[3] = v22;
    v31[4] = *MEMORY[0x263F07F80];
    v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 340);
    v32[4] = v23;
    dispatch_semaphore_t v24 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:5];
    v25 = [v18 errorWithDomain:v19 code:10 userInfo:v24];
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)tearDownWithCompletion:(id)a3
{
  id v7 = a3;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013HybridHandler tearDownWithCompletion:]", 344, self, &stru_26D2FDEC0, v4, v5, v6);
  sub_22118ECC4((os_unfair_lock_s *)self, v7);
}

- (unsigned)supportedCredentialType
{
  return 5;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  v59[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 385, self, @"options = 0x%04x", v8, v9, a4);
  if ((a4 & 4) != 0)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 387, self, @"Non supported options", v10, v11, v47);
    id v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = [NSString stringWithUTF8String:"STS.fwk"];
    v58[0] = *MEMORY[0x263F08320];
    objc_super v30 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v59[0] = v30;
    v59[1] = &unk_26D308128;
    v58[1] = @"Line";
    v58[2] = @"Method";
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v59[2] = v31;
    v58[3] = *MEMORY[0x263F07F80];
    uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 388);
    v59[3] = v32;
    uint64_t v33 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:4];
    v34 = v29;
    v35 = v28;
    uint64_t v36 = 8;
LABEL_11:
    uint64_t v38 = [v34 errorWithDomain:v35 code:v36 userInfo:v33];

    goto LABEL_12;
  }
  uint64_t v12 = [(STSHandler *)self handoffToken];

  if (!v12)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 392, self, @"Handoff has not been started", v13, v14, v47);
    uint64_t v37 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = [NSString stringWithUTF8String:"STS.fwk"];
    v56[0] = *MEMORY[0x263F08320];
    objc_super v30 = [NSString stringWithUTF8String:"Invalid State"];
    v57[0] = v30;
    v57[1] = &unk_26D308140;
    v56[1] = @"Line";
    v56[2] = @"Method";
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v57[2] = v31;
    v56[3] = *MEMORY[0x263F07F80];
    uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 393);
    v57[3] = v32;
    uint64_t v33 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:4];
    v34 = v37;
    v35 = v28;
    uint64_t v36 = 9;
    goto LABEL_11;
  }
  if (self) {
    self->_startTransactionOption = a4;
  }
  id v15 = [(STSHandler *)self activeSTSCredentials];
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 398, self, @"active credentials=%@", v16, v17, (uint64_t)v15);

  v18 = [(STSHandler *)self activeSTSCredential];
  if ([v18 type] == 5)
  {
    v19 = [(STSHandler *)self activeSTSCredential];
    v20 = [v19 identifier];

    if (v20)
    {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 403, self, @"auth: %@", v21, v22, (uint64_t)v7);
      handoverSession = self->_handoverSession;
      id v49 = 0;
      int v24 = [(NFSecureTransactionServicesHandoverHybridSession *)handoverSession startCardEmulationWithAuthorization:v7 error:&v49];
      id v25 = v49;
      uint64_t v28 = v25;
      if (v24)
      {

        uint64_t v28 = [(STSHandler *)self handoffToken];
LABEL_15:
        v50[0] = MEMORY[0x263EF8330];
        v50[1] = 3221225472;
        v51 = sub_22118EC0C;
        uint64_t v52 = &unk_264594A10;
        v53 = self;
        os_unfair_lock_lock(&self->_handoverSessionMutex);
        uint64_t v38 = v51((uint64_t)v50);
        os_unfair_lock_unlock(&self->_handoverSessionMutex);
        goto LABEL_16;
      }
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 405, self, @"start transaction failed = %@", v26, v27, (uint64_t)v25);
      uint64_t v40 = (void *)MEMORY[0x263F087E8];
      objc_super v30 = [NSString stringWithUTF8String:"STS.fwk"];
      v54[0] = *MEMORY[0x263F08320];
      v41 = [NSString stringWithUTF8String:"Unexpected Result"];
      v55[0] = v41;
      v54[1] = *MEMORY[0x263F08608];
      v42 = v28;
      if (!v28)
      {
        v43 = (void *)MEMORY[0x263F087E8];
        v48 = [NSString stringWithUTF8String:"STS.fwk"];
        v42 = objc_msgSend(v43, "errorWithDomain:code:userInfo:");
      }
      v55[1] = v42;
      v55[2] = &unk_26D308158;
      v54[2] = @"Line";
      v54[3] = @"Method";
      v44 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v55[3] = v44;
      v54[4] = *MEMORY[0x263F07F80];
      char v45 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 406);
      v55[4] = v45;
      v46 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:5];
      uint64_t v38 = [v40 errorWithDomain:v30 code:10 userInfo:v46];

      if (!v28)
      {
      }
LABEL_12:

      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v28 = [(STSHandler *)self handoffToken];
  if (self) {
    goto LABEL_15;
  }
  uint64_t v38 = 0;
LABEL_16:

  return v38;
}

- (void)transactionStarted:(unint64_t)a3
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionStarted:]", 415, self, @"status=%lu", v3, v4, a3);
  if (self)
  {
    unint64_t transactionState = self->_transactionState;
    if (transactionState && transactionState != 3) {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionStarted:]", 419, self, @"Unexpected transaction state=%d", v7, v8, self->_transactionState);
    }
  }
  uint64_t v11 = [(STSTransactionHandler *)self parent];
  if (a3 == 9)
  {
    id v17 = v11;
    [v11 fireRequestHandoverConfirmation];
  }
  else
  {
    if (a3) {
      goto LABEL_17;
    }
    id v17 = v11;
    if (self && self->_transactionState)
    {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionStarted:]", 430, self, @"Unexpected state, dropping start event", v12, v13, v16);
    }
    else
    {
      uint64_t v14 = objc_opt_new();
      id v15 = [(STSHandler *)self activeSTSCredential];
      [v14 setCredential:v15];

      [v14 setTransactionMode:4];
      [v17 fireTransactionStartEvent:v14];
      if (self) {
        self->_unint64_t transactionState = 1;
      }
    }
  }
  uint64_t v11 = v17;
LABEL_17:
}

- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4
{
  id v22 = a3;
  id v8 = a4;
  if (!self)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionEndedWithIdentifier:error:]", 453, 0, @"keyIdentifier: %@, error: %@", v6, v7, (uint64_t)v22);
    goto LABEL_8;
  }
  if (self->_transactionState - 3 <= 1)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionEndedWithIdentifier:error:]", 449, self, @"Dropping transaction end event, keyIdentifier: %@, error: %@", v6, v7, (uint64_t)v22);
    goto LABEL_22;
  }
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionEndedWithIdentifier:error:]", 453, self, @"keyIdentifier: %@, error: %@", v6, v7, (uint64_t)v22);
  uint64_t v9 = self->_releasedCredential;
  if (!v9)
  {
LABEL_8:
    uint64_t v11 = [(STSHandler *)self activeSTSCredential];
    if (v11) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v12 = 5;
    uint64_t v11 = +[STSCredential credentialWithType:5 identifier:0x26D2FEE80 subIdentifier:v22];
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler transactionEndedWithIdentifier:error:]", 463, self, @"A credential is not available.  Creating a credential for event - credential=%@", v13, v14, (uint64_t)v11);
    goto LABEL_10;
  }
  uint64_t v10 = v9;
  uint64_t v11 = self->_releasedCredential;

  if (!v11) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v12 = 0;
LABEL_10:
  id v15 = objc_alloc_init(STSTransactionEndEvent);
  [(STSTransactionEndEvent *)v15 setCredential:v11];
  [(STSTransactionEndEvent *)v15 setStatus:v12];
  if (v8)
  {
    uint64_t v16 = [v8 domain];
    int v17 = [v16 isEqual:@"STSXPCHelperErrorDomain"];

    if (v17)
    {
      uint64_t v18 = [v8 code];
      uint64_t v19 = 3;
      if (v18 == 14) {
        uint64_t v19 = 4;
      }
      if (v18 == 15) {
        uint64_t v20 = 6;
      }
      else {
        uint64_t v20 = v19;
      }
    }
    else
    {
      uint64_t v20 = 2;
    }
    [(STSTransactionEndEvent *)v15 setStatus:v20];
  }
  uint64_t v21 = [(STSTransactionHandler *)self parent];
  [v21 fireTransactionEndEvent:v15];

  if (self) {
    self->_unint64_t transactionState = 3;
  }

LABEL_22:
}

- (void)notificationClientConnected
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler notificationClientConnected]", 492, self, &stru_26D2FDEC0, v2, v3, v7);
  if (self && (self->_startTransactionOption & 2) != 0) {
    id v5 = [(STSXPCClientNotificationListener *)self->_stsNotificationListener setRequestHandoverConfirmation:1];
  }
  sub_221190140((id *)&self->super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(STSTransactionHandler *)self parent];
  [v8 stsSessionNotificationListenerStarted:v6];
}

- (void)alternativeCarrierReceived:(id)a3 dataPending:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler alternativeCarrierReceived:dataPending:]", 501, self, @"dataPending=%d", v7, v8, v4);
  id v10 = [(STSTransactionHandler *)self parent];
  uint64_t v9 = sub_221190140((id *)&self->super.super.super.isa);
  [v9 stsSession:v10 receivedFromAlternativeCarrier:v6 dataPending:v4];
}

- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3
{
  v19[4] = *MEMORY[0x263EF8340];
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler alternativeCarrierConnectedWithStatus:]", 510, self, @"status=%lu", v3, v4, a3);
  if (a3)
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = [NSString stringWithUTF8String:"STS.fwk"];
    v18[0] = *MEMORY[0x263F08320];
    id v10 = [NSString stringWithUTF8String:"Unexpected Result"];
    v19[0] = v10;
    v19[1] = &unk_26D308170;
    v18[1] = @"Line";
    v18[2] = @"Method";
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v19[2] = v11;
    v18[3] = *MEMORY[0x263F07F80];
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 514);
    v19[3] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    uint64_t v14 = [v8 errorWithDomain:v9 code:10 userInfo:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = [(STSTransactionHandler *)self parent];
  uint64_t v16 = sub_221190140((id *)&self->super.super.super.isa);
  [v16 stsSession:v15 connectedAlternativeCarrierWithStatus:v14];

  if (a3)
  {
    if (a3 == 3) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    [v15 fireSessionDidEndUnexpectedlyEventWithStatus:v17];
    sub_22118ECC4((os_unfair_lock_s *)self, 0);
  }
}

- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler alternativeCarrierDisconnectedWithStatus:]", 532, self, @"status=%d, transactionState=%lu", v3, v4, a3);
  id v20 = [(STSTransactionHandler *)self parent];
  uint64_t v7 = sub_221190140((id *)&self->super.super.super.isa);
  [v7 stsSessionAlternativeCarrierDisconnected:v20];

  if (self && self->_transactionState - 1 <= 1)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler alternativeCarrierDisconnectedWithStatus:]", 538, self, @"Transaction end unexpectedly", v8, v9, v18);
    switch(a3)
    {
      case 0uLL:
        int v10 = 0;
        uint64_t v11 = 7;
        break;
      case 1uLL:
      case 2uLL:
      case 4uLL:
      case 5uLL:
      case 9uLL:
        int v10 = 0;
        uint64_t v11 = 2;
        break;
      case 3uLL:
        int v10 = 0;
        uint64_t v11 = 1;
        break;
      case 6uLL:
      case 7uLL:
        int v10 = 0;
        uint64_t v11 = 12;
        break;
      case 8uLL:
        int v10 = 0;
        uint64_t v11 = 6;
        break;
      default:
        uint64_t v11 = 0;
        int v10 = 1;
        break;
    }
    uint64_t v12 = objc_alloc_init(STSTransactionEndEvent);
    [(STSTransactionEndEvent *)v12 setStatus:v11];
    if (self->_releasedCredential)
    {
      -[STSTransactionEndEvent setCredential:](v12, "setCredential:");
    }
    else
    {
      uint64_t v13 = [(STSHandler *)self activeSTSCredential];

      if (v13)
      {
        uint64_t v14 = [(STSHandler *)self activeSTSCredential];
        [(STSTransactionEndEvent *)v12 setCredential:v14];
      }
      else
      {
        id v15 = +[STSCredential credentialWithType:2 identifier:0x26D2FEE80 subIdentifier:0];
        [(STSTransactionEndEvent *)v12 setCredential:v15];

        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler alternativeCarrierDisconnectedWithStatus:]", 574, self, @"Neither an active nor a released credential are set.", v16, v17, v19);
        if (v10) {
          [(STSTransactionEndEvent *)v12 setStatus:5];
        }
      }
    }
    [v20 fireTransactionEndEvent:v12];
  }
  sub_22118ECC4((os_unfair_lock_s *)self, 0);
}

- (void)processISO18013CredentialProposals:(id)a3 readerAuthInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler processISO18013CredentialProposals:readerAuthInfo:]", 589, self, &stru_26D2FDEC0, v8, v9, v12);
  int v10 = sub_22119847C();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_221170000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessCredentialProposals", (const char *)&unk_2211AD787, (uint8_t *)&v12, 2u);
  }

  if (self) {
    self->_unint64_t transactionState = 2;
  }
  uint64_t v11 = [(STSTransactionHandler *)self parent];
  [v11 fireDidReceive18013Requests:v7 readerAuthInfo:v6];
}

- (void)xpcInvalidated
{
  if (!self || self->_transactionState != 4)
  {
    uint64_t v3 = [(STSTransactionHandler *)self parent];
    [v3 fireSessionDidEndUnexpectedlyEventWithStatus:2];

    sub_22118ECC4((os_unfair_lock_s *)self, 0);
  }
}

- (void)xpcInterrupted
{
  if (!self || self->_transactionState != 4)
  {
    uint64_t v3 = [(STSTransactionHandler *)self parent];
    [v3 fireSessionDidEndUnexpectedlyEventWithStatus:2];

    sub_22118ECC4((os_unfair_lock_s *)self, 0);
  }
}

- (void)session:(id)a3 fieldChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = sub_22119847C();
  if (os_signpost_enabled(v6))
  {
    id v7 = "no";
    if (v4) {
      id v7 = "yes";
    }
    int v9 = 136315138;
    int v10 = v7;
    _os_signpost_emit_with_name_impl(&dword_221170000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013HybridHandler_FieldChange", "fieldPresent=%s", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
  {
    if (self) {
      stsNotificationListener = self->_stsNotificationListener;
    }
    else {
      stsNotificationListener = 0;
    }
    [(STSXPCClientNotificationListener *)stsNotificationListener sendConnectionHandoverStarted];
  }
}

- (void)session:(id)a3 fieldNotification:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:fieldNotification:]", 645, self, @"field=%@", v6, v7, (uint64_t)v5);
  uint64_t v8 = sub_22119847C();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_signpost_emit_with_name_impl(&dword_221170000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013HybridHandler_FieldDetect", "field=%@", buf, 0xCu);
  }

  int v9 = sub_221199468(v5);
  int v10 = [(STSTransactionHandler *)self parent];
  [v10 fireFieldNotificationEvent:v9];
}

- (void)session:(id)a3 tnepService:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = sub_22119847C();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_signpost_emit_with_name_impl(&dword_221170000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013HybridHandler_TnepService_Selected", "service=%@", buf, 0xCu);
  }

  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:tnepService:]", 655, self, @"service=%@", v7, v8, (uint64_t)v5);
}

- (void)session:(id)a3 connectionHandoverProcessFailure:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = sub_22119847C();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_signpost_emit_with_name_impl(&dword_221170000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013HybridHandler_HandoverFailure", "error=%@", buf, 0xCu);
  }

  if ([v5 code] != 2 && objc_msgSend(v5, "code") != 8)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler session:connectionHandoverProcessFailure:]", 668, self, @"error=%@", v7, v8, (uint64_t)v5);
    if ([v5 code] == 6)
    {
      uint64_t v9 = 4;
LABEL_20:
      sub_2211908BC((os_unfair_lock_s *)self);
      uint64_t v16 = [(STSTransactionHandler *)self parent];
      [v16 fireSessionDidEndUnexpectedlyEventWithStatus:v9];

      goto LABEL_21;
    }
    if ([v5 code] != 12)
    {
      uint64_t v9 = 0;
      goto LABEL_20;
    }
    id v10 = [v5 userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    id v12 = [v11 domain];
    if ([v12 isEqualToString:@"WifiDomain"])
    {
      uint64_t v13 = [v11 code];

      if (v13 == 3)
      {
        uint64_t v9 = 5;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
    }
    uint64_t v14 = [v11 domain];
    if ([v14 isEqualToString:@"BluetoothDomain"])
    {
      uint64_t v15 = [v11 code];

      if (v15) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = 6;
      }
    }
    else
    {

      uint64_t v9 = 0;
    }
    goto LABEL_19;
  }
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:connectionHandoverProcessFailure:]", 665, self, @"Allows reader to retry", v7, v8, v17);
LABEL_21:
}

- (void)connectionHandoverCompleted:(id)a3
{
  BOOL v4 = sub_22119847C();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_221170000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013HybridHandler_HandoverCompleted", (const char *)&unk_2211AD787, buf, 2u);
  }

  if (self)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler connectionHandoverCompleted:]", 690, self, @"transactionState=%lu", v5, v6, self->_transactionState);
    [(STSXPCClientNotificationListener *)self->_stsNotificationListener sendConnectionHandoverCompleted];
    if (self->_transactionState) {
      sub_2211908BC((os_unfair_lock_s *)self);
    }
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler connectionHandoverCompleted:]", 690, 0, @"transactionState=%lu", v5, v6, 0);
    [0 sendConnectionHandoverCompleted];
  }
}

- (void)session:(id)a3 didEndUnexpectedly:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didEndUnexpectedly:]", 700, self, @"reason: %@", v4, v5, (uint64_t)a4);
  id v7 = [(STSTransactionHandler *)self parent];
  [v7 fireSessionDidEndUnexpectedlyEventWithStatus:0];
}

- (void)session:(id)a3 didDetectField:(BOOL)a4
{
  BOOL v6 = a4;
  if (a4) {
    uint64_t v8 = @"Field On";
  }
  else {
    uint64_t v8 = @"Field Off";
  }
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didDetectField:]", 705, self, v8, v4, v5, v9);
  id v10 = [(STSTransactionHandler *)self parent];
  [v10 fireFieldDetectEvent:v6];
}

- (void)session:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didEnterFieldWithNotification:]", 711, self, @"%@", v6, v7, (uint64_t)v5);
  sub_221199468(v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [(STSTransactionHandler *)self parent];
  [v8 fireFieldNotificationEvent:v9];
}

- (void)sessionDidExitField:(id)a3
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler sessionDidExitField:]", 717, self, @"Field Off", v3, v4, v6);
  id v7 = [(STSTransactionHandler *)self parent];
  [v7 fireFieldDetectEvent:0];
}

- (void)session:(id)a3 didSelectApplet:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didSelectApplet:]", 722, self, @"SELECT: %@", v4, v5, (uint64_t)a4);
}

- (void)session:(id)a3 didExpireTransactionForApplet:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didExpireTransactionForApplet:]", 728, self, @"EXPIRED: %@", v4, v5, (uint64_t)a4);
  id v7 = [(STSTransactionHandler *)self parent];
  [v7 fireDidExpireTransaction:1];
}

- (void)session:(id)a3 didStartTransaction:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didStartTransaction:]", 734, self, @"START: %@", v6, v7, (uint64_t)v5);
  uint64_t v8 = [STSTransactionStartEvent alloc];
  if (self) {
    jpkiCredential = self->_jpkiCredential;
  }
  else {
    jpkiCredential = 0;
  }
  uint64_t v11 = [(STSTransactionStartEvent *)v8 initWithCredential:jpkiCredential andNearFieldStartEvent:v5];

  id v10 = [(STSTransactionHandler *)self parent];
  [v10 fireTransactionStartEvent:v11];
}

- (void)session:(id)a3 didEndTransaction:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didEndTransaction:]", 742, self, @"END: %@", v6, v7, (uint64_t)v5);
  uint64_t v8 = [STSTransactionEndEvent alloc];
  if (self) {
    jpkiCredential = self->_jpkiCredential;
  }
  else {
    jpkiCredential = 0;
  }
  uint64_t v11 = [(STSTransactionEndEvent *)v8 initWithCredential:jpkiCredential andNearFieldEndEvent:v5];

  id v10 = [(STSTransactionHandler *)self parent];
  [v10 fireTransactionEndEvent:v11];
}

- (void)session:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didExpressModeStateChange:withObject:]", 751, self, @"%d - %@", v8, v9, v5);
  uint64_t v10 = 0;
  if ((v5 - 1) <= 8) {
    uint64_t v10 = dword_2211A66E4[(int)v5 - 1];
  }
  id v12 = [[STSExpressEventInfoWithDetail alloc] initWithState:v10 detail:v7];

  uint64_t v11 = [(STSTransactionHandler *)self parent];
  [v11 fireExpressModeStateChangeWithInfo:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jpkiCredential, 0);
  objc_storeStrong((id *)&self->_releasedCredential, 0);
  objc_storeStrong((id *)&self->_handoverSession, 0);
  objc_destroyWeak((id *)&self->_notificationTesterDelegate);
  objc_storeStrong((id *)&self->_stsHelper, 0);
  objc_storeStrong((id *)&self->_stsNotificationListener, 0);
}

@end