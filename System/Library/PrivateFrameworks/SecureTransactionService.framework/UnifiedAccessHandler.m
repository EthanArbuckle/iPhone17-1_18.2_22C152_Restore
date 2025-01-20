@interface UnifiedAccessHandler
- (id)setActiveCredential:(id)a3;
- (id)setActiveCredentials:(id)a3;
- (id)startNFSessionWithCompletion:(id)a3;
- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4;
- (id)stopTransaction;
- (unsigned)supportedCredentialType;
- (void)unifiedAccessSession:(id)a3 didDetectField:(BOOL)a4;
- (void)unifiedAccessSession:(id)a3 didEndTransaction:(id)a4;
- (void)unifiedAccessSession:(id)a3 didEnterFieldWithNotification:(id)a4;
- (void)unifiedAccessSession:(id)a3 didExpireTransactionForApplet:(id)a4;
- (void)unifiedAccessSession:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5;
- (void)unifiedAccessSession:(id)a3 didSelectApplet:(id)a4;
- (void)unifiedAccessSession:(id)a3 didStartTransaction:(id)a4;
@end

@implementation UnifiedAccessHandler

- (id)startNFSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(STSHandler *)self nfHardwareManager];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_22119EFB8;
  v9[3] = &unk_264594E88;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 startUnifiedAccessSession:v9];

  return v7;
}

- (unsigned)supportedCredentialType
{
  return 3;
}

- (id)setActiveCredential:(id)a3
{
  v112[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v96.receiver = self;
  v96.super_class = (Class)UnifiedAccessHandler;
  id v6 = [(STSHandler *)&v96 setActiveCredential:v5];
  if (v5)
  {
    uint64_t v7 = [v5 identifier];
    if (v7
      && (v8 = (void *)v7,
          [v5 secondaryIdentifier],
          v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      nfSession = self->_nfSession;
      v11 = [v5 identifier];
      v12 = [v5 secondaryIdentifier];
      uint64_t v13 = [(NFUnifiedAccessSession *)nfSession appletsWithIdentifiers:v11 secondaryIdentifier:v12];

      v14 = [v5 identifier];
      if (v13)
      {
        v91 = (void *)v13;
        sel = a2;
        v15 = [v5 subIdentifier];
        sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 74, self, @"primaryAid %@ and primaryKeyID %@", v16, v17, (uint64_t)v14);

        v18 = [v5 secondaryIdentifier];
        v84 = [v5 secondarySubIdentifier];
        sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 76, self, @"secondaryAid %@ and secondaryKeyID %@", v19, v20, (uint64_t)v18);

        uint64_t v21 = [v5 subIdentifier];
        if (v21
          && (v24 = (void *)v21,
              [v5 secondarySubIdentifier],
              v25 = objc_claimAutoreleasedReturnValue(),
              v25,
              v24,
              v25))
        {
          v26 = [v5 identifier];
          v111[0] = v26;
          v27 = [v5 subIdentifier];
          v112[0] = v27;
          v28 = [v5 secondaryIdentifier];
          v111[1] = v28;
          v29 = [v5 secondarySubIdentifier];
          v112[1] = v29;
          v30 = [NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:2];

          if ([v30 count] == 2)
          {
            v33 = self->_nfSession;
            id v95 = v6;
            char v34 = [(NFUnifiedAccessSession *)v33 setActivePaymentApplets:v30 error:&v95];
            id v35 = v95;

            if (v34)
            {
              v38 = (void *)v13;
LABEL_26:

              id v6 = v35;
              goto LABEL_27;
            }
            v89 = v30;
            sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 88, self, @"set active applet failed = %@", v36, v37, (uint64_t)v35);
            v88 = (void *)MEMORY[0x263F087E8];
            v55 = [NSString stringWithUTF8String:"STS.fwk"];
            v107[0] = *MEMORY[0x263F08320];
            v56 = [NSString stringWithUTF8String:"Unexpected Result"];
            v108[0] = v56;
            v107[1] = *MEMORY[0x263F08608];
            id v6 = v35;
            if (!v35)
            {
              v78 = (void *)MEMORY[0x263F087E8];
              v27 = [NSString stringWithUTF8String:"STS.fwk"];
              id v6 = [v78 errorWithDomain:v27 code:5 userInfo:0];
            }
            v108[1] = v6;
            v108[2] = &unk_26D308650;
            v107[2] = @"Line";
            v107[3] = @"Method";
            v79 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel), v84);
            v108[3] = v79;
            v107[4] = *MEMORY[0x263F07F80];
            v80 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel), 89);
            v108[4] = v80;
            v81 = [NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:5];
            uint64_t v61 = [v88 errorWithDomain:v55 code:10 userInfo:v81];

LABEL_33:
            v30 = v89;
            v38 = v91;
            if (v35) {
              goto LABEL_25;
            }
            goto LABEL_24;
          }
          sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 85, self, @"Invalid number of aids and keys ", v31, v32, v82);
          v90 = (void *)MEMORY[0x263F087E8];
          v55 = [NSString stringWithUTF8String:"STS.fwk"];
          v109[0] = *MEMORY[0x263F08320];
          v56 = [NSString stringWithUTF8String:"Missing Parameter"];
          v110[0] = v56;
          v110[1] = &unk_26D308638;
          v109[1] = @"Line";
          v109[2] = @"Method";
          v27 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel), v84);
          v110[2] = v27;
          v109[3] = *MEMORY[0x263F07F80];
          uint64_t v63 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sel), 86);
          v110[3] = v63;
          v76 = [NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:4];
          uint64_t v61 = [v90 errorWithDomain:v55 code:7 userInfo:v76];
        }
        else
        {
          sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 92, self, @"keyIdentifier missing", v22, v23, v82);
          v62 = (void *)MEMORY[0x263F087E8];
          v30 = [NSString stringWithUTF8String:"STS.fwk"];
          v105[0] = *MEMORY[0x263F08320];
          v55 = [NSString stringWithUTF8String:"Missing Parameter"];
          v106[0] = v55;
          v106[1] = &unk_26D308668;
          v105[1] = @"Line";
          v105[2] = @"Method";
          v56 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2), v84);
          v106[2] = v56;
          v105[3] = *MEMORY[0x263F07F80];
          v27 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 93);
          v106[3] = v27;
          uint64_t v63 = [NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:4];
          uint64_t v61 = [v62 errorWithDomain:v30 code:7 userInfo:v63];
        }
        id v6 = (void *)v63;
        v38 = (void *)v13;
        goto LABEL_24;
      }
      v86 = [v5 secondaryIdentifier];
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 97, self, @"applets not found for identifiers = %@ and/or %@", v64, v65, (uint64_t)v14);

      v66 = (void *)MEMORY[0x263F087E8];
      v38 = [NSString stringWithUTF8String:"STS.fwk"];
      v103[0] = *MEMORY[0x263F08320];
      v30 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v104[0] = v30;
      v104[1] = &unk_26D308680;
      v103[1] = @"Line";
      v103[2] = @"Method";
      v55 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2), v86);
      v104[2] = v55;
      v103[3] = *MEMORY[0x263F07F80];
      v56 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 98);
      v104[3] = v56;
      v67 = NSDictionary;
      v68 = v104;
      v69 = v103;
    }
    else
    {
      v39 = [v5 identifier];

      if (!v39) {
        goto LABEL_27;
      }
      v40 = self->_nfSession;
      v41 = [v5 identifier];
      v38 = [(NFUnifiedAccessSession *)v40 appletWithIdentifier:v41];

      if (v38)
      {
        sela = a2;
        sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 104, self, @"applet %@", v42, v43, (uint64_t)v38);
        v44 = [v5 identifier];
        v27 = [v5 subIdentifier];
        v85 = v27;
        sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 106, self, @"aid %@ and keyID %@", v45, v46, (uint64_t)v44);

        v47 = [v5 subIdentifier];

        if (v47)
        {
          v50 = (void *)MEMORY[0x263EFFA08];
          uint64_t v51 = [v5 subIdentifier];
          v30 = [v50 setWithObject:v51];

          v52 = self->_nfSession;
          id v94 = v6;
          LOBYTE(v51) = [(NFUnifiedAccessSession *)v52 setActivePaymentApplet:v38 keys:v30 error:&v94];
          id v35 = v94;

          if (v51) {
            goto LABEL_26;
          }
          v89 = v30;
          v91 = v38;
          sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 111, self, @"set active applet failed = %@", v53, v54, (uint64_t)v35);
          v87 = (void *)MEMORY[0x263F087E8];
          v55 = [NSString stringWithUTF8String:"STS.fwk"];
          v101[0] = *MEMORY[0x263F08320];
          v56 = [NSString stringWithUTF8String:"Unexpected Result"];
          v102[0] = v56;
          v101[1] = *MEMORY[0x263F08608];
          id v6 = v35;
          if (!v35)
          {
            v57 = (void *)MEMORY[0x263F087E8];
            v27 = [NSString stringWithUTF8String:"STS.fwk"];
            id v6 = [v57 errorWithDomain:v27 code:5 userInfo:0];
          }
          v102[1] = v6;
          v102[2] = &unk_26D308698;
          v101[2] = @"Line";
          v101[3] = @"Method";
          v58 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sela), v85);
          v102[3] = v58;
          v101[4] = *MEMORY[0x263F07F80];
          v59 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sela), 112);
          v102[4] = v59;
          v60 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:5];
          uint64_t v61 = [v87 errorWithDomain:v55 code:10 userInfo:v60];

          goto LABEL_33;
        }
        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 115, self, @"keyIdentifier missing", v48, v49, v83);
        v73 = (void *)MEMORY[0x263F087E8];
        uint64_t v74 = [NSString stringWithUTF8String:"STS.fwk"];
        v99[0] = *MEMORY[0x263F08320];
        v55 = [NSString stringWithUTF8String:"Missing Parameter"];
        v100[0] = v55;
        v100[1] = &unk_26D3086B0;
        v99[1] = @"Line";
        v99[2] = @"Method";
        v56 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sela), v85);
        v100[2] = v56;
        v99[3] = *MEMORY[0x263F07F80];
        v30 = (void *)v74;
        v27 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(sela), 116);
        v100[3] = v27;
        uint64_t v75 = [NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:4];
        uint64_t v61 = [v73 errorWithDomain:v30 code:7 userInfo:v75];

        id v6 = (void *)v75;
LABEL_24:

LABEL_25:
        id v35 = (id)v61;
        goto LABEL_26;
      }
      v70 = [v5 identifier];
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 119, self, @"applet not found for identifier = %@", v71, v72, (uint64_t)v70);

      v66 = (void *)MEMORY[0x263F087E8];
      v38 = [NSString stringWithUTF8String:"STS.fwk"];
      v97[0] = *MEMORY[0x263F08320];
      v30 = [NSString stringWithUTF8String:"Invalid Parameter"];
      v98[0] = v30;
      v98[1] = &unk_26D3086C8;
      v97[1] = @"Line";
      v97[2] = @"Method";
      v55 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v98[2] = v55;
      v97[3] = *MEMORY[0x263F07F80];
      v56 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 120);
      v98[3] = v56;
      v67 = NSDictionary;
      v68 = v98;
      v69 = v97;
    }
    v27 = [v67 dictionaryWithObjects:v68 forKeys:v69 count:4];
    uint64_t v61 = [v66 errorWithDomain:v38 code:8 userInfo:v27];
    goto LABEL_24;
  }
LABEL_27:

  return v6;
}

- (id)setActiveCredentials:(id)a3
{
  v138[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_27;
  }
  id v8 = v6;
  v9 = v8;
  if (!self)
  {

    goto LABEL_27;
  }
  if ((unint64_t)[v8 count] < 3)
  {
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v18 = v9;
    uint64_t v21 = [v18 countByEnumeratingWithState:&v117 objects:v136 count:16];
    if (!v21)
    {
      v3 = 0;
      goto LABEL_22;
    }
    uint64_t v22 = v21;
    v105 = self;
    v106 = v9;
    v107 = a2;
    v108 = v7;
    uint64_t v23 = *(void *)v118;
    id v110 = v18;
LABEL_7:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v118 != v23) {
        objc_enumerationMutation(v18);
      }
      v25 = *(void **)(*((void *)&v117 + 1) + 8 * v24);
      if ([v25 type] != 3)
      {
        self = v105;
        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler validateCredentials:]", 139, v105, @"Invalid credential types.", v26, v27, (uint64_t)Name);
        uint64_t v32 = (void *)MEMORY[0x263F087E8];
        v15 = [NSString stringWithUTF8String:"STS.fwk"];
        v134[0] = *MEMORY[0x263F08320];
        uint64_t v16 = [NSString stringWithUTF8String:"Invalid Parameter"];
        v135[0] = v16;
        v135[1] = &unk_26D3086F8;
        v134[1] = @"Line";
        v134[2] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_validateCredentials_));
        v135[2] = v19;
        v134[3] = *MEMORY[0x263F07F80];
        v33 = NSString;
        Name = sel_getName(sel_validateCredentials_);
        uint64_t v20 = [v33 stringWithFormat:@"%s:%d"];
        v135[3] = v20;
        char v34 = NSDictionary;
        id v35 = v135;
        uint64_t v36 = v134;
LABEL_20:
        uint64_t v37 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:4];
        v3 = [v32 errorWithDomain:v15 code:8 userInfo:v37];

        v9 = v106;
        id v18 = v110;
        goto LABEL_21;
      }
      v28 = [v25 identifier];
      if ([v28 hasPrefix:0x26D2FEE20]) {
        goto LABEL_14;
      }
      v29 = [v25 identifier];
      if ([v29 hasPrefix:0x26D2FEE40]) {
        break;
      }
      v30 = [v25 identifier];
      char v31 = [v30 hasPrefix:0x26D2FEEA0];

      id v18 = v110;
      if ((v31 & 1) == 0)
      {
        uint64_t v46 = [v25 identifier];
        self = v105;
        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler validateCredentials:]", 146, v105, @"Not a valid UA or Aliro aid - %@", v47, v48, (uint64_t)v46);

        uint64_t v32 = (void *)MEMORY[0x263F087E8];
        v15 = [NSString stringWithUTF8String:"STS.fwk"];
        v132[0] = *MEMORY[0x263F08320];
        uint64_t v16 = [NSString stringWithUTF8String:"Invalid Parameter"];
        v133[0] = v16;
        v133[1] = &unk_26D308710;
        v132[1] = @"Line";
        v132[2] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_validateCredentials_));
        v133[2] = v19;
        v132[3] = *MEMORY[0x263F07F80];
        uint64_t v49 = NSString;
        Name = sel_getName(sel_validateCredentials_);
        uint64_t v20 = [v49 stringWithFormat:@"%s:%d"];
        v133[3] = v20;
        char v34 = NSDictionary;
        id v35 = v133;
        uint64_t v36 = v132;
        goto LABEL_20;
      }
LABEL_16:
      if (v22 == ++v24)
      {
        uint64_t v22 = [v18 countByEnumeratingWithState:&v117 objects:v136 count:16];
        if (v22) {
          goto LABEL_7;
        }
        v3 = 0;
        a2 = v107;
        self = v105;
        v9 = v106;
        goto LABEL_22;
      }
    }

LABEL_14:
    goto LABEL_16;
  }
  v107 = a2;
  v108 = v7;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler validateCredentials:]", 133, self, @"Currently we support a max of two credentials. One Aliro and one UA", v10, v11, (uint64_t)Name);
  v12 = v9;
  uint64_t v13 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = [NSString stringWithUTF8String:"STS.fwk"];
  v137[0] = *MEMORY[0x263F08320];
  v15 = [NSString stringWithUTF8String:"Invalid Parameter"];
  v138[0] = v15;
  v138[1] = &unk_26D3086E0;
  v137[1] = @"Line";
  v137[2] = @"Method";
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(sel_validateCredentials_));
  v138[2] = v16;
  v137[3] = *MEMORY[0x263F07F80];
  uint64_t v17 = NSString;
  id v18 = (id)v14;
  Name = sel_getName(sel_validateCredentials_);
  uint64_t v19 = [v17 stringWithFormat:@"%s:%d"];
  v138[3] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v138 forKeys:v137 count:4];
  v9 = v12;
  v3 = [v13 errorWithDomain:v14 code:8 userInfo:v20];
LABEL_21:

  a2 = v107;
  uint64_t v7 = v108;
LABEL_22:

  if (v3)
  {
    v38 = (void *)MEMORY[0x263F087E8];
    v39 = [NSString stringWithUTF8String:"STS.fwk"];
    v130[0] = *MEMORY[0x263F08320];
    v40 = [NSString stringWithUTF8String:"Invalid Parameter"];
    uint64_t v41 = *MEMORY[0x263F08608];
    v131[0] = v40;
    v131[1] = v3;
    v130[1] = v41;
    v130[2] = @"Line";
    v131[2] = &unk_26D308728;
    v130[3] = @"Method";
    uint64_t v42 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v131[3] = v42;
    v130[4] = *MEMORY[0x263F07F80];
    uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 166);
    v131[4] = v43;
    v44 = [NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:5];
    uint64_t v45 = [v38 errorWithDomain:v39 code:8 userInfo:v44];

LABEL_29:
    id v60 = v45;
    goto LABEL_53;
  }
LABEL_27:
  v116.receiver = self;
  v116.super_class = (Class)UnifiedAccessHandler;
  uint64_t v50 = [(STSHandler *)&v116 setActiveCredentials:v7];
  if (v50)
  {
    uint64_t v53 = (void *)v50;
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredentials:]", 173, self, @"Failed to set active credentials", v51, v52, (uint64_t)Name);
    uint64_t v54 = (void *)MEMORY[0x263F087E8];
    v39 = [NSString stringWithUTF8String:"STS.fwk"];
    v128[0] = *MEMORY[0x263F08320];
    v55 = [NSString stringWithUTF8String:"Invalid Parameter"];
    uint64_t v56 = *MEMORY[0x263F08608];
    v129[0] = v55;
    v129[1] = v53;
    v128[1] = v56;
    v128[2] = @"Line";
    v129[2] = &unk_26D308740;
    v128[3] = @"Method";
    v57 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v129[3] = v57;
    v128[4] = *MEMORY[0x263F07F80];
    v58 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 174);
    v129[4] = v58;
    v59 = [NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:5];
    uint64_t v45 = [v54 errorWithDomain:v39 code:8 userInfo:v59];

    goto LABEL_29;
  }
  id v63 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!v63) {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredentials:]", 180, self, @"No resource available", v61, v62, (uint64_t)Name);
  }
  uint64_t v64 = self;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v65 = v7;
  uint64_t v66 = [v65 countByEnumeratingWithState:&v112 objects:v127 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    v3 = *(void **)v113;
    while (2)
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void **)v113 != v3) {
          objc_enumerationMutation(v65);
        }
        v69 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        v70 = [v69 subIdentifier];

        if (!v70)
        {
          sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredentials:]", 186, v64, @"Invalid credential provided %@", v71, v72, (uint64_t)v69);
          id v94 = (void *)MEMORY[0x263F087E8];
          id v95 = [NSString stringWithUTF8String:"STS.fwk"];
          v125[0] = *MEMORY[0x263F08320];
          objc_super v96 = [NSString stringWithUTF8String:"Invalid Parameter"];
          v126[0] = v96;
          v126[1] = &unk_26D308758;
          v125[1] = @"Line";
          v125[2] = @"Method";
          v97 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
          v126[2] = v97;
          v125[3] = *MEMORY[0x263F07F80];
          v98 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 187);
          v126[3] = v98;
          v99 = [NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:4];
          v100 = [v94 errorWithDomain:v95 code:8 userInfo:v99];

          id v60 = v100;
          goto LABEL_52;
        }
        v73 = [v69 subIdentifier];
        uint64_t v74 = [v69 identifier];
        [v63 setObject:v73 forKey:v74];
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v112 objects:v127 count:16];
      if (v67) {
        continue;
      }
      break;
    }
  }

  if (v7 && ![v63 count])
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredentials:]", 194, v64, @"Invalid credentials provided %@", v75, v76, (uint64_t)v65);
    v101 = (void *)MEMORY[0x263F087E8];
    v84 = [NSString stringWithUTF8String:"STS.fwk"];
    v123[0] = *MEMORY[0x263F08320];
    v85 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v124[0] = v85;
    v124[1] = &unk_26D308770;
    v123[1] = @"Line";
    v123[2] = @"Method";
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v124[2] = v3;
    v123[3] = *MEMORY[0x263F07F80];
    v86 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 195);
    v124[3] = v86;
    v102 = [NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:4];
    uint64_t v93 = [v101 errorWithDomain:v84 code:8 userInfo:v102];

LABEL_49:
    goto LABEL_50;
  }
  nfSession = v64->_nfSession;
  id v111 = 0;
  char v78 = [(NFUnifiedAccessSession *)nfSession setActivePaymentApplets:v63 error:&v111];
  id v79 = v111;
  uint64_t v82 = v79;
  if (v78) {
    goto LABEL_51;
  }
  v109 = v7;
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredentials:]", 197, v64, @"set active applet failed = %@", v80, v81, (uint64_t)v79);
  uint64_t v83 = (void *)MEMORY[0x263F087E8];
  v84 = [NSString stringWithUTF8String:"STS.fwk"];
  v121[0] = *MEMORY[0x263F08320];
  v85 = [NSString stringWithUTF8String:"Unexpected Result"];
  v122[0] = v85;
  v121[1] = *MEMORY[0x263F08608];
  v86 = v82;
  if (!v82)
  {
    v87 = (void *)MEMORY[0x263F087E8];
    v3 = [NSString stringWithUTF8String:"STS.fwk"];
    v86 = [v87 errorWithDomain:v3 code:5 userInfo:0];
  }
  v122[1] = v86;
  v122[2] = &unk_26D308788;
  v121[2] = @"Line";
  v121[3] = @"Method";
  uint64_t v88 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
  v89 = a2;
  v90 = (void *)v88;
  v122[3] = v88;
  v121[4] = *MEMORY[0x263F07F80];
  v91 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(v89), 198);
  v122[4] = v91;
  v92 = [NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:5];
  uint64_t v93 = [v83 errorWithDomain:v84 code:10 userInfo:v92];

  uint64_t v7 = v109;
  if (!v82) {
    goto LABEL_49;
  }
LABEL_50:

  uint64_t v82 = (void *)v93;
LABEL_51:
  id v60 = v82;
LABEL_52:

LABEL_53:
  return v60;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  v43[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v10 = v7;
  if (self->_nfSession)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler startTransactionWithAuthorization:options:]", 218, self, @"auth: %@  deferred:%d", v8, v9, (uint64_t)v7);
    nfSession = self->_nfSession;
    if (a4)
    {
      v39 = 0;
      char v12 = [(NFUnifiedAccessSession *)nfSession startDeferredCardEmulationWithAuthorization:v10 error:&v39];
      uint64_t v13 = v39;
    }
    else
    {
      v38 = 0;
      char v12 = [(NFUnifiedAccessSession *)nfSession startCardEmulationWithAuthorization:v10 error:&v38];
      uint64_t v13 = v38;
    }
    id v21 = v13;
    uint64_t v20 = v21;
    if ((v12 & 1) == 0)
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler startTransactionWithAuthorization:options:]", 227, self, @"start transaction failed = %@", v22, v23, (uint64_t)v21);
      id v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = [NSString stringWithUTF8String:"STS.fwk"];
      v40[0] = *MEMORY[0x263F08320];
      uint64_t v24 = [NSString stringWithUTF8String:"Unexpected Result"];
      v41[0] = v24;
      v40[1] = *MEMORY[0x263F08608];
      v25 = v20;
      if (!v20)
      {
        uint64_t v26 = (void *)MEMORY[0x263F087E8];
        char v34 = [NSString stringWithUTF8String:"STS.fwk"];
        v25 = objc_msgSend(v26, "errorWithDomain:code:userInfo:");
      }
      v41[1] = v25;
      v41[2] = &unk_26D3087B8;
      v40[2] = @"Line";
      v40[3] = @"Method";
      uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2), a4 & 1);
      v41[3] = v27;
      v40[4] = *MEMORY[0x263F07F80];
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 228);
      v41[4] = v28;
      v29 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:5];
      uint64_t v30 = [v35 errorWithDomain:v36 code:10 userInfo:v29];

      if (!v20)
      {
      }
      uint64_t v20 = (void *)v30;
    }
    if (!v20)
    {
      v37.receiver = self;
      v37.super_class = (Class)UnifiedAccessHandler;
      id v31 = [(STSTransactionHandler *)&v37 startTransactionWithAuthorization:v10 options:a4];
    }
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler startTransactionWithAuthorization:options:]", 212, self, @"NF session does not exist!", v8, v9, v33);
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    v15 = [NSString stringWithUTF8String:"STS.fwk"];
    v42[0] = *MEMORY[0x263F08320];
    uint64_t v16 = [NSString stringWithUTF8String:"Invalid State"];
    v43[0] = v16;
    v43[1] = &unk_26D3087A0;
    v42[1] = @"Line";
    v42[2] = @"Method";
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v43[2] = v17;
    v42[3] = *MEMORY[0x263F07F80];
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 213);
    v43[3] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4];
    uint64_t v20 = [v14 errorWithDomain:v15 code:9 userInfo:v19];
  }
  return v20;
}

- (id)stopTransaction
{
  v21[4] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)UnifiedAccessHandler;
  id v6 = [(STSTransactionHandler *)&v19 stopTransaction];
  if (self->_nfSession)
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[UnifiedAccessHandler stopTransaction]", 249, self, &stru_26D2FDEC0, v4, v5, v17);
    nfSession = self->_nfSession;
    id v18 = v6;
    [(NFUnifiedAccessSession *)nfSession stopCardEmulation:&v18];
    id v8 = v18;

    id v9 = v8;
    id v6 = v9;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler stopTransaction]", 245, self, @"NF session does not exist!", v4, v5, v17);
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = [NSString stringWithUTF8String:"STS.fwk"];
    v20[0] = *MEMORY[0x263F08320];
    char v12 = [NSString stringWithUTF8String:"Invalid State"];
    v21[0] = v12;
    v21[1] = &unk_26D3087D0;
    v20[1] = @"Line";
    v20[2] = @"Method";
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v21[2] = v13;
    v20[3] = *MEMORY[0x263F07F80];
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 246);
    v21[3] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
    id v9 = [v10 errorWithDomain:v11 code:9 userInfo:v15];
  }
  return v9;
}

- (void)unifiedAccessSession:(id)a3 didDetectField:(BOOL)a4
{
  BOOL v6 = a4;
  if (a4) {
    id v8 = @"Field On";
  }
  else {
    id v8 = @"Field Off";
  }
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didDetectField:]", 274, self, v8, v4, v5, v9);
  id v10 = [(STSTransactionHandler *)self parent];
  [v10 fireFieldDetectEvent:v6];
}

- (void)unifiedAccessSession:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didEnterFieldWithNotification:]", 280, self, @"%@", v6, v7, (uint64_t)v5);
  sub_221199468(v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [(STSTransactionHandler *)self parent];
  [v8 fireFieldNotificationEvent:v9];
}

- (void)unifiedAccessSession:(id)a3 didSelectApplet:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didSelectApplet:]", 286, self, @"SELECT: %@", v4, v5, (uint64_t)a4);
}

- (void)unifiedAccessSession:(id)a3 didExpireTransactionForApplet:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didExpireTransactionForApplet:]", 297, self, @"EXPIRED: %@", v4, v5, (uint64_t)a4);
  id v7 = [(STSTransactionHandler *)self parent];
  [v7 fireDidExpireTransaction:1];
}

- (void)unifiedAccessSession:(id)a3 didStartTransaction:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didStartTransaction:]", 303, self, @"START: %@", v6, v7, (uint64_t)v5);
  id v8 = [v5 appletIdentifier];
  sub_2211A1438(self, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [[STSTransactionStartEvent alloc] initWithCredential:v11 andNearFieldStartEvent:v5];
  id v10 = [(STSTransactionHandler *)self parent];
  [v10 fireTransactionStartEvent:v9];
}

- (void)unifiedAccessSession:(id)a3 didEndTransaction:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didEndTransaction:]", 314, self, @"END: %@", v6, v7, (uint64_t)v5);
  id v8 = [v5 appletIdentifier];
  sub_2211A1438(self, v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [[STSTransactionEndEvent alloc] initWithCredential:v11 andNearFieldEndEvent:v5];
  id v10 = [(STSTransactionHandler *)self parent];
  [v10 fireTransactionEndEvent:v9];
}

- (void)unifiedAccessSession:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didExpressModeStateChange:withObject:]", 336, self, @"%d - %@", v8, v9, v5);
  uint64_t v10 = 0;
  if ((v5 - 1) <= 8) {
    uint64_t v10 = dword_2211A67D0[(int)v5 - 1];
  }
  char v12 = [[STSExpressEventInfoWithDetail alloc] initWithState:v10 detail:v7];

  id v11 = [(STSTransactionHandler *)self parent];
  [v11 fireExpressModeStateChangeWithInfo:v12];
}

- (void).cxx_destruct
{
}

@end