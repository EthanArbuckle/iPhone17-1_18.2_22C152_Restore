@interface STSHandler
- (BOOL)activateChildSessionOnSetActiveCredential;
- (NFSession)startedNFSession;
- (NSArray)activeSTSCredentials;
- (NSData)handoffToken;
- (STSCredential)activeSTSCredential;
- (STSHardwareManagerWrapper)nfHwManager;
- (id)activateWithHandoffToken:(id)a3;
- (id)nfHardwareManager;
- (id)setActiveCredential:(id)a3;
- (id)setActiveCredentials:(id)a3;
- (id)startNFSessionWithCompletion:(id)a3;
- (unsigned)supportedCredentialType;
- (void)_tearDown;
- (void)setHandoffToken:(id)a3;
- (void)setNfHwManager:(id)a3;
- (void)setStartedNFSession:(id)a3;
- (void)tearDownWithCompletion:(id)a3;
@end

@implementation STSHandler

- (unsigned)supportedCredentialType
{
  return 0;
}

- (id)nfHardwareManager
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(STSHandler *)v2 nfHwManager];

  if (!v3)
  {
    v4 = objc_opt_new();
    [(STSHandler *)v2 setNfHwManager:v4];
  }
  v5 = [(STSHandler *)v2 nfHwManager];
  v6 = [v5 manager];

  objc_sync_exit(v2);
  return v6;
}

- (id)setActiveCredential:(id)a3
{
  v22[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSHandler setActiveCredential:]", 35, self, @"credential=%@", v7, v8, (uint64_t)v6);
  if (v6
    && (int v9 = [v6 type], v9 != -[STSHandler supportedCredentialType](self, "supportedCredentialType")))
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSHandler setActiveCredential:]", 37, self, @"Invalid credential type", v10, v11, v20);
    v13 = (void *)MEMORY[0x263F087E8];
    v14 = [NSString stringWithUTF8String:"STS.fwk"];
    v21[0] = *MEMORY[0x263F08320];
    v15 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v22[0] = v15;
    v22[1] = &unk_26D307F60;
    v21[1] = @"Line";
    v21[2] = @"Method";
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v22[2] = v16;
    v21[3] = *MEMORY[0x263F07F80];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 38);
    v22[3] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
    v12 = [v13 errorWithDomain:v14 code:8 userInfo:v18];
  }
  else
  {
    objc_storeStrong((id *)&self->_activeSTSCredential, a3);
    v12 = 0;
  }

  return v12;
}

- (id)setActiveCredentials:(id)a3
{
  v24[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSHandler setActiveCredentials:]", 46, self, @"credentials=%@", v7, v8, (uint64_t)v6);
  int v9 = [v6 firstObject];
  uint64_t v10 = v9;
  if (v9
    && (int v11 = [v9 type], v11 != -[STSHandler supportedCredentialType](self, "supportedCredentialType")))
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSHandler setActiveCredentials:]", 50, self, @"Invalid credential type", v12, v13, v22);
    v15 = (void *)MEMORY[0x263F087E8];
    v16 = [NSString stringWithUTF8String:"STS.fwk"];
    v23[0] = *MEMORY[0x263F08320];
    v17 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v24[0] = v17;
    v24[1] = &unk_26D307F78;
    v23[1] = @"Line";
    v23[2] = @"Method";
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v24[2] = v18;
    v23[3] = *MEMORY[0x263F07F80];
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 51);
    v24[3] = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    v14 = [v15 errorWithDomain:v16 code:8 userInfo:v20];
  }
  else
  {
    objc_storeStrong((id *)&self->_activeSTSCredential, v10);
    objc_storeStrong((id *)&self->_activeSTSCredentials, a3);
    v14 = 0;
  }

  return v14;
}

- (void)tearDownWithCompletion:(id)a3
{
  id v4 = a3;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSHandler tearDownWithCompletion:]", 61, self, &stru_26D2FDEC0, v5, v6, v8);
  [(STSHandler *)self _tearDown];
  startedNFSession = self->_startedNFSession;
  if (startedNFSession)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_22118C538;
    v9[3] = &unk_264594648;
    id v10 = v4;
    [startedNFSession endSessionWithCompletion:v9];
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)activateWithHandoffToken:(id)a3
{
  v66[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSHandler activateWithHandoffToken:]", 75, self, @"Creating session with token: %@", v6, v7, (uint64_t)v5);
  handoffToken = self->_handoffToken;
  self->_handoffToken = 0;

  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_22118CD40;
  v57 = sub_22118CD50;
  id v58 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = sub_22118CD58;
  v50[3] = &unk_2645949B8;
  v50[4] = self;
  v52 = &v53;
  id v10 = v9;
  v51 = v10;
  uint64_t v13 = [(STSHandler *)self startNFSessionWithCompletion:v50];
  if (v13)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSHandler activateWithHandoffToken:]", 95, self, @"Activating session with token: %@", v11, v12, (uint64_t)v5);
    uint64_t v14 = [v13 activateWithToken:v5];
    v17 = (void *)v14;
    if (v14)
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHandler activateWithHandoffToken:]", 98, self, @"Session switching error=%@", v15, v16, v14);
      [v13 endSession];
      v18 = (void *)MEMORY[0x263F087E8];
      v46 = [NSString stringWithUTF8String:"STS.fwk"];
      v63[0] = *MEMORY[0x263F08320];
      v19 = [NSString stringWithUTF8String:"Unexpected Result"];
      uint64_t v20 = *MEMORY[0x263F08608];
      v64[0] = v19;
      v64[1] = v17;
      v63[1] = v20;
      v63[2] = @"Line";
      v64[2] = &unk_26D307FA8;
      v63[3] = @"Method";
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v64[3] = v21;
      v63[4] = *MEMORY[0x263F07F80];
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 100);
      v64[4] = v22;
      v23 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:5];
      v24 = [v18 errorWithDomain:v46 code:10 userInfo:v23];
    }
    else
    {
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

      if (v54[5])
      {
        [v13 endSession];
        uint64_t v29 = [(id)v54[5] code];
        v45 = (void *)MEMORY[0x263F087E8];
        if (v29 == 50)
        {
          v48 = [NSString stringWithUTF8String:"STS.fwk"];
          v61[0] = *MEMORY[0x263F08320];
          v30 = [NSString stringWithUTF8String:"NFC radio disabled"];
          v62[0] = v30;
          v62[1] = &unk_26D307FC0;
          v61[1] = @"Line";
          v61[2] = @"Method";
          v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
          v62[2] = v31;
          v61[3] = *MEMORY[0x263F07F80];
          v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 111);
          v62[3] = v32;
          v33 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:4];
          v24 = [v45 errorWithDomain:v48 code:18 userInfo:v33];
        }
        else
        {
          v48 = [NSString stringWithUTF8String:"STS.fwk"];
          v59[0] = *MEMORY[0x263F08320];
          v35 = [NSString stringWithUTF8String:"Unexpected Result"];
          v60[0] = v35;
          v59[1] = *MEMORY[0x263F08608];
          uint64_t v36 = v54[5];
          if (v36)
          {
            v37 = (void *)v54[5];
          }
          else
          {
            v38 = (void *)MEMORY[0x263F087E8];
            v44 = [NSString stringWithUTF8String:"STS.fwk"];
            v37 = [v38 errorWithDomain:v44 code:5 userInfo:0];
          }
          v60[1] = v37;
          v60[2] = &unk_26D307FD8;
          v59[2] = @"Line";
          v59[3] = @"Method";
          v39 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
          v60[3] = v39;
          v59[4] = *MEMORY[0x263F07F80];
          v40 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 113);
          v60[4] = v40;
          v41 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:5];
          v24 = [v45 errorWithDomain:v48 code:10 userInfo:v41];

          if (!v36)
          {
          }
        }
        v17 = 0;
        id v10 = 0;
      }
      else
      {
        objc_storeStrong((id *)&self->_startedNFSession, v13);
        v34 = (NSData *)v5;
        v17 = 0;
        id v10 = 0;
        v24 = 0;
        v49 = self->_handoffToken;
        self->_handoffToken = v34;
      }
    }
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHandler activateWithHandoffToken:]", 91, self, @"Failed to start session.", v11, v12, v43);
    v25 = (void *)MEMORY[0x263F087E8];
    v17 = [NSString stringWithUTF8String:"STS.fwk"];
    v65[0] = *MEMORY[0x263F08320];
    v47 = [NSString stringWithUTF8String:"Unknown Error"];
    v66[0] = v47;
    v66[1] = &unk_26D307F90;
    v65[1] = @"Line";
    v65[2] = @"Method";
    v26 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v66[2] = v26;
    v65[3] = *MEMORY[0x263F07F80];
    v27 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 92);
    v66[3] = v27;
    v28 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:4];
    v24 = [v25 errorWithDomain:v17 code:5 userInfo:v28];
  }
  _Block_object_dispose(&v53, 8);

  return v24;
}

- (BOOL)activateChildSessionOnSetActiveCredential
{
  return 1;
}

- (void)_tearDown
{
  self->_handoffToken = 0;
  MEMORY[0x270F9A758]();
}

- (id)startNFSessionWithCompletion:(id)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = NSString;
  id v7 = a3;
  uint64_t v8 = [v6 stringWithUTF8String:"STS.fwk"];
  v15[0] = *MEMORY[0x263F08320];
  dispatch_semaphore_t v9 = [NSString stringWithUTF8String:"Unexpected Result"];
  v16[0] = v9;
  v16[1] = &unk_26D307FF0;
  v15[1] = @"Line";
  v15[2] = @"Method";
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
  v16[2] = v10;
  v15[3] = *MEMORY[0x263F07F80];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 132);
  v16[3] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  uint64_t v13 = [v5 errorWithDomain:v8 code:10 userInfo:v12];
  (*((void (**)(id, void *))a3 + 2))(v7, v13);

  return 0;
}

- (STSCredential)activeSTSCredential
{
  return self->_activeSTSCredential;
}

- (NSArray)activeSTSCredentials
{
  return self->_activeSTSCredentials;
}

- (NSData)handoffToken
{
  return self->_handoffToken;
}

- (void)setHandoffToken:(id)a3
{
}

- (STSHardwareManagerWrapper)nfHwManager
{
  return self->_nfHwManager;
}

- (void)setNfHwManager:(id)a3
{
}

- (NFSession)startedNFSession
{
  return self->_startedNFSession;
}

- (void)setStartedNFSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startedNFSession, 0);
  objc_storeStrong((id *)&self->_nfHwManager, 0);
  objc_storeStrong((id *)&self->_handoffToken, 0);
  objc_storeStrong((id *)&self->_activeSTSCredentials, 0);
  objc_storeStrong((id *)&self->_activeSTSCredential, 0);
}

@end