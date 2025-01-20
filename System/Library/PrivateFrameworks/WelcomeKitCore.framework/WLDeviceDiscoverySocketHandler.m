@interface WLDeviceDiscoverySocketHandler
- (BOOL)_didReceiveHandshakeData:(id)a3;
- (WLDeviceDiscoverySocketHandler)initWithSocket:(int)a3 srpPassword:(id)a4 delegate:(id)a5;
- (WLDeviceDiscoverySocketHandlerDelegate)delegate;
- (id)_commandStringWithData:(id)a3;
- (id)_handshakeCommandData;
- (id)_handshakeResponseData;
- (id)_okResponseData;
- (int)sockfd;
- (void)_performSRPAuthenticationAndHandshake;
- (void)close;
- (void)invalidateWithError:(id)a3;
- (void)resume;
- (void)sendData:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation WLDeviceDiscoverySocketHandler

- (WLDeviceDiscoverySocketHandler)initWithSocket:(int)a3 srpPassword:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WLDeviceDiscoverySocketHandler;
  v11 = [(WLSocketHandler *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_srpPassword, a4);
    dispatch_queue_t v13 = dispatch_queue_create("Socket Write Serialization Queue", 0);
    writeQueue = v12->_writeQueue;
    v12->_writeQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v12->_delegate, v10);
    v12->_sockfd = a3;
  }

  return v12;
}

- (void)resume
{
  v3 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__WLDeviceDiscoverySocketHandler_resume__block_invoke;
  block[3] = &unk_26490C1A0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __40__WLDeviceDiscoverySocketHandler_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSRPAuthenticationAndHandshake];
}

- (void)close
{
}

- (void)invalidateWithError:(id)a3
{
  readSource = self->_readSource;
  id v5 = a3;
  dispatch_source_cancel(readSource);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained deviceDiscoverySocketHandler:self didFailToHandshakeWithSourceDevice:self->_sourceDevice error:v5];
}

- (void)_performSRPAuthenticationAndHandshake
{
  v140[1] = *MEMORY[0x263EF8340];
  [(WLSocketHandler *)self beginReadingIntoCacheFromSocket:self->_sockfd];
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__4;
  v123 = __Block_byref_object_dispose__4;
  id v124 = 0;
  dispatch_semaphore_t v104 = dispatch_semaphore_create(0);
  v105 = 0;
  if (v120[5]) {
    goto LABEL_5;
  }
  _WLLog();
  v3 = (id *)(v120 + 5);
  id obj = (id)v120[5];
  [(WLSocketHandler *)self waitForCommand:@"AUTHENTICATE", &obj, self fromReadCacheReturningError];
  objc_storeStrong(v3, obj);
  v82 = self;
  uint64_t v89 = v120[5];
  _WLLog();
  if (v120[5]) {
    goto LABEL_3;
  }
  v105 = [[WLSRPServer alloc] initWithUsername:@"movetoios", self->_srpPassword, self, v89 password];
  v82 = self;
  _WLLog();
  if (!v105)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v139 = *MEMORY[0x263F08320];
    v140[0] = @"Failed to create SRP session";
    v19 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v140, &v139, 1, self, 0);
    uint64_t v20 = [v18 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v19];
    v21 = (void *)v120[5];
    v120[5] = v20;

LABEL_3:
    v105 = 0;
  }
LABEL_5:
  if (v120[5]) {
    goto LABEL_18;
  }
  v4 = (void *)MEMORY[0x263EFF8F8];
  id v5 = [(WLSRPServer *)v105 salt_s];
  v6 = objc_msgSend(v5, "wl_hexEncodedData");
  v138[0] = v6;
  v7 = [(WLSRPServer *)v105 serverPublicKey_B];
  v8 = objc_msgSend(v7, "wl_hexEncodedData");
  v138[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:2];
  id v10 = objc_msgSend(v4, "wl_lengthPrefixedBlobSequenceFromDataArray:", v9);

  v11 = [(WLSRPServer *)v105 salt_s];
  v83 = objc_msgSend(v11, "wl_hexEncodedString");
  _WLLog();

  v12 = [(WLSRPServer *)v105 serverPublicKey_B];
  v84 = objc_msgSend(v12, "wl_hexEncodedString");
  _WLLog();

  v90 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "length", v84));
  _WLLog();

  v115[0] = MEMORY[0x263EF8330];
  v115[1] = 3221225472;
  v115[2] = __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke;
  v115[3] = &unk_26490CDD0;
  v115[4] = self;
  v117 = &v119;
  dispatch_queue_t v13 = v104;
  v116 = v13;
  -[WLDeviceDiscoverySocketHandler sendData:completion:](self, "sendData:completion:", v10, v115, self, v90);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

  if (v120[5]) {
    goto LABEL_18;
  }
  _WLLog();
  v14 = (id *)(v120 + 5);
  id v114 = (id)v120[5];
  v15 = -[WLSocketHandler waitForBlobDataFromReadCacheReturningError:](self, "waitForBlobDataFromReadCacheReturningError:", &v114, self);
  objc_storeStrong(v14, v114);
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
  v91 = v82 = self;
  _WLLog();

  if (v120[5])
  {
    objc_super v16 = 0;
    v17 = 0;
  }
  else
  {
    _WLLog();
    v22 = objc_msgSend(v15, "wl_arrayOfDataFromLengthPrefixedBlobSequenceWithExpectedCount:", 2, self, v91);
    v92 = [NSNumber numberWithInt:v22 != 0];
    _WLLog();

    if (v22)
    {
      v23 = objc_msgSend(v22, "objectAtIndexedSubscript:", 0, self, v92);
      v85 = objc_msgSend(v23, "wl_utf8String");
      _WLLog();

      v24 = objc_msgSend(v22, "objectAtIndexedSubscript:", 1, v85);
      v86 = objc_msgSend(v24, "wl_utf8String");
      _WLLog();

      v25 = (void *)MEMORY[0x263EFF8F8];
      v26 = objc_msgSend(v22, "objectAtIndexedSubscript:", 0, v86);
      objc_super v16 = objc_msgSend(v25, "wl_dataFromHexEncodedData:", v26);

      v27 = (void *)MEMORY[0x263EFF8F8];
      v28 = [v22 objectAtIndexedSubscript:1];
      v17 = objc_msgSend(v27, "wl_dataFromHexEncodedData:", v28);
    }
    else
    {
      v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v136 = *MEMORY[0x263F08320];
      v137 = @"Failed to parse client public key and proof of match";
      v28 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1, self, v92);
      uint64_t v30 = [v29 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v28];
      v31 = (void *)v120[5];
      v120[5] = v30;

      v17 = 0;
      objc_super v16 = 0;
    }

    if (!v120[5])
    {
      _WLLog();
      uint64_t v32 = -[WLSRPServer didReceiveClientPublicKey_A:proofOfMatch_M:](v105, "didReceiveClientPublicKey_A:proofOfMatch_M:", v16, v17, self);
      [NSNumber numberWithBool:v32];
      v93 = v82 = self;
      _WLLog();

      if ((v32 & 1) == 0)
      {
        v33 = (void *)MEMORY[0x263F087E8];
        uint64_t v134 = *MEMORY[0x263F08320];
        v135 = @"Failed to validate client public key and proof of match";
        v34 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1, self, v93);
        uint64_t v35 = [v33 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v34];
        v36 = (void *)v120[5];
        v120[5] = v35;
      }
    }
  }

  if (v120[5]) {
    goto LABEL_18;
  }
  v37 = [(WLSRPServer *)v105 hashOfProofOfMatch_HAMK];
  v38 = objc_msgSend(v37, "wl_hexEncodedData");
  v39 = objc_msgSend(v38, "wl_lengthPrefixedBlob");

  v94 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v39, "length"));
  _WLLog();

  v111[0] = MEMORY[0x263EF8330];
  v111[1] = 3221225472;
  v111[2] = __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke_2;
  v111[3] = &unk_26490CDD0;
  v111[4] = self;
  v113 = &v119;
  v40 = v13;
  v112 = v40;
  -[WLDeviceDiscoverySocketHandler sendData:completion:](self, "sendData:completion:", v39, v111, self, v94);
  dispatch_semaphore_wait(v40, 0xFFFFFFFFFFFFFFFFLL);

  if (v120[5])
  {
LABEL_18:
    v103 = 0;
  }
  else
  {
    _WLLog();
    v103 = +[WLAuthenticationCredentials generateAuthenticationCredentialsContainingSelfSignedCertificate];
    [NSNumber numberWithInt:v103 != 0];
    v96 = v82 = self;
    _WLLog();

    if (!v120[5])
    {
      _WLLog();
      v55 = (id *)(v120 + 5);
      id v110 = (id)v120[5];
      v56 = -[WLSocketHandler waitForBlobDataFromReadCacheReturningError:](self, "waitForBlobDataFromReadCacheReturningError:", &v110, self, v96);
      objc_storeStrong(v55, v110);
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "length"));
      v97 = v82 = self;
      _WLLog();

      if (v120[5])
      {
        v57 = 0;
        v58 = 0;
        v59 = 0;
      }
      else
      {
        _WLLog();
        v60 = objc_msgSend(v56, "wl_arrayOfDataFromLengthPrefixedBlobSequenceWithExpectedCount:", 3, self, v97);
        v98 = [NSNumber numberWithInt:v60 != 0];
        _WLLog();

        if (v60)
        {
          v59 = objc_msgSend(v60, "objectAtIndex:", 0, self, v98);
          v58 = [v60 objectAtIndex:1];
          v61 = [v60 objectAtIndexedSubscript:2];
          v88 = objc_msgSend(v61, "wl_utf8String");
          _WLLog();

          v62 = (void *)MEMORY[0x263EFF8F8];
          v63 = objc_msgSend(v60, "objectAtIndexedSubscript:", 2, v88);
          v57 = objc_msgSend(v62, "wl_dataFromHexEncodedData:", v63);
        }
        else
        {
          v64 = (void *)MEMORY[0x263F087E8];
          uint64_t v132 = *MEMORY[0x263F08320];
          v133 = @"Failed to parse client cert and handshake and mac";
          v63 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1, self, v98);
          uint64_t v65 = [v64 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v63];
          v66 = (void *)v120[5];
          v120[5] = v65;

          v57 = 0;
          v58 = 0;
          v59 = 0;
        }

        if (!v120[5])
        {
          _WLLog();
          v67 = objc_msgSend(v59, "mutableCopy", self);
          [v67 appendData:v58];
          uint64_t v68 = [(WLSRPServer *)v105 isHmacData:v57 validForData:v67];
          [NSNumber numberWithBool:v68];
          v99 = v82 = self;
          _WLLog();

          if ((v68 & 1) == 0)
          {
            v69 = (void *)MEMORY[0x263F087E8];
            uint64_t v130 = *MEMORY[0x263F08320];
            v131 = @"Client cert and handshake data does not match MAC";
            v70 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1, self, v99);
            uint64_t v71 = [v69 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v70];
            v72 = (void *)v120[5];
            v120[5] = v71;
          }
          if (!v120[5])
          {
            [v103 setRemoteCertificate:SecCertificateCreateWithPEM()];
            v100 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v103, "remoteCertificate") != 0);
            _WLLog();

            if (!objc_msgSend(v103, "remoteCertificate", self, v100))
            {
              v73 = (void *)MEMORY[0x263F087E8];
              uint64_t v128 = *MEMORY[0x263F08320];
              v129 = @"Failed to create client cert";
              v74 = [NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
              uint64_t v75 = [v73 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v74];
              v76 = (void *)v120[5];
              v120[5] = v75;
            }
          }
        }
      }
      if (!v120[5])
      {
        _WLLog();
        BOOL v77 = -[WLDeviceDiscoverySocketHandler _didReceiveHandshakeData:](self, "_didReceiveHandshakeData:", v58, self);
        [NSNumber numberWithBool:v77];
        v101 = v82 = self;
        _WLLog();

        if (!v77)
        {
          v78 = (void *)MEMORY[0x263F087E8];
          uint64_t v126 = *MEMORY[0x263F08320];
          v127 = @"Failed to parse client handshake data";
          v79 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1, self, v101);
          uint64_t v80 = [v78 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v79];
          v81 = (void *)v120[5];
          v120[5] = v80;
        }
      }
    }
  }
  if ([(WLSourceDevice *)self->_sourceDevice isSelectingDataTypeInHandshake])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deviceDiscoverySocketHandler:self didDiscoverCandidate:self->_sourceDevice];
  }
  if (!v120[5])
  {
    CFDataRef v102 = SecCertificateCopyData((SecCertificateRef)[v103 localCertificate]);
    v42 = +[WLAuthenticationUtilities pemFormattedCertificateData:](WLAuthenticationUtilities, "pemFormattedCertificateData:");
    v43 = [(WLDeviceDiscoverySocketHandler *)self _handshakeResponseData];
    v44 = (void *)[v42 mutableCopy];
    [v44 appendData:v43];
    v45 = [(WLSRPServer *)v105 hmacDataForData:v44];
    v87 = objc_msgSend(v45, "wl_hexEncodedString");
    _WLLog();

    v46 = (void *)MEMORY[0x263EFF8F8];
    v125[0] = v42;
    v125[1] = v43;
    v47 = objc_msgSend(v45, "wl_hexEncodedData", v87);
    v125[2] = v47;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:3];
    v49 = objc_msgSend(v46, "wl_lengthPrefixedBlobSequenceFromDataArray:", v48);

    v95 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v49, "length"));
    _WLLog();

    v107[0] = MEMORY[0x263EF8330];
    v107[1] = 3221225472;
    v107[2] = __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke_3;
    v107[3] = &unk_26490CDD0;
    v107[4] = self;
    v109 = &v119;
    v50 = v104;
    v108 = v50;
    -[WLDeviceDiscoverySocketHandler sendData:completion:](self, "sendData:completion:", v49, v107, self, v95);
    dispatch_semaphore_wait(v50, 0xFFFFFFFFFFFFFFFFLL);

    if (!v120[5] && ([(WLSourceDevice *)self->_sourceDevice useMigrationKit] & 1) == 0)
    {
      _WLLog();
      v51 = (id *)(v120 + 5);
      id v106 = (id)v120[5];
      [(WLSocketHandler *)self waitForCommand:@"OK", &v106, self fromReadCacheReturningError];
      objc_storeStrong(v51, v106);
      _WLLog();
    }
  }
  if (v120[5] || ([(WLSocketHandler *)self endReadingIntoCache], v120[5]))
  {
    _WLLog();
    id v52 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v52, "deviceDiscoverySocketHandler:didFailToHandshakeWithSourceDevice:error:", self, self->_sourceDevice, v120[5], self);
  }
  else
  {
    _WLLog();
    id v52 = objc_alloc_init(MEMORY[0x263F86298]);
    v53 = +[WLCredentialStore sharedInstance];
    [v53 setCredentials:v103 forAuthentication:v52];

    id v54 = objc_loadWeakRetained((id *)&self->_delegate);
    [v54 deviceDiscoverySocketHandler:self didFinishHandshakeWithSourceDevice:self->_sourceDevice];
  }
  _Block_object_dispose(&v119, 8);
}

void __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v8 = [NSNumber numberWithBool:a2];
  _WLLog();

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v8 = [NSNumber numberWithBool:a2];
  _WLLog();

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v8 = [NSNumber numberWithBool:a2];
  _WLLog();

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_commandStringWithData:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = v4;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  id v9 = (void *)[v5 initWithBytesNoCopy:v7 length:v8 encoding:4 freeWhenDone:0];
  id v10 = [NSString stringWithFormat:@"\r\n"];
  LODWORD(v7) = [v9 hasSuffix:v10];

  if (v7)
  {
    uint64_t v11 = objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v9, "length") - 2, 2, &stru_26DF81F20);

    id v9 = (void *)v11;
  }
  return v9;
}

- (id)_okResponseData
{
  v2 = [NSString stringWithFormat:@"OK\r\n"];
  v3 = [v2 dataUsingEncoding:4];

  return v3;
}

- (id)_handshakeCommandData
{
  v2 = [NSString stringWithFormat:@"HANDSHAKE\r\n"];
  v3 = [v2 dataUsingEncoding:4];

  return v3;
}

- (BOOL)_didReceiveHandshakeData:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (WLSourceDevice *)objc_alloc_init(MEMORY[0x263F862C8]);
  sourceDevice = self->_sourceDevice;
  self->_sourceDevice = v5;

  v12 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  _WLLog();

  *(void *)&v14.sa_len = 0;
  *(void *)&v14.sa_data[6] = 0;
  socklen_t v13 = 16;
  if (getpeername(self->_sockfd, &v14, &v13))
  {
    _WLLog();
  }
  else
  {
    v7.s_addr = *(_DWORD *)&v14.sa_data[2];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", inet_ntoa(v7), self, v12);
    [(WLSourceDevice *)self->_sourceDevice setIpAddress:v8];
  }
  id v9 = objc_alloc_init(WLSourceDeviceHandshakeParser);
  BOOL v10 = [(WLSourceDeviceHandshakeParser *)v9 parseData:v4 modifyingSourceDevice:self->_sourceDevice completion:&__block_literal_global_11];

  return v10;
}

- (id)_handshakeResponseData
{
  v3 = xmlNewDoc((const xmlChar *)"1.0");
  id v4 = xmlNewNode(0, (const xmlChar *)"root");
  xmlDocSetRootElement(v3, v4);
  id v5 = xmlNewChild(v4, 0, (const xmlChar *)"device_info", 0);
  id v6 = +[WLDevice deviceName];
  xmlNewChild(v5, 0, (const xmlChar *)"name", (const xmlChar *)[v6 UTF8String]);

  xmlNewChild(v5, 0, (const xmlChar *)"supports_name", (const xmlChar *)"1");
  xmlNewChild(v5, 0, (const xmlChar *)"port", (const xmlChar *)"0");
  xmlNewChild(v5, 0, (const xmlChar *)"device_type", (const xmlChar *)"ios");
  xmlNewChild(v5, 0, (const xmlChar *)"supports_role", (const xmlChar *)"migration_target");
  xmlNewChild(v5, 0, (const xmlChar *)"protocol_version", (const xmlChar *)"2");
  xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"photos");
  xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"contacts");
  xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"calendar");
  if ([(WLSourceDevice *)self->_sourceDevice isSelectingDataTypeInHandshake])xmlNewChild(v5, 0, (const xmlChar *)"is_selecting_data_type_in_handshake", (const xmlChar *)"1"); {
  if ([(WLSourceDevice *)self->_sourceDevice useMigrationKit])
  }
    xmlNewChild(v5, 0, (const xmlChar *)"upgrade", (const xmlChar *)"api/2.0");
  if ([(WLSourceDevice *)self->_sourceDevice canAddDisplay]) {
    xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"display");
  }
  if ([(WLSourceDevice *)self->_sourceDevice canAddAccessibility]) {
    xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"accessibility");
  }
  if ([(WLSourceDevice *)self->_sourceDevice canAddFiles]) {
    xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"files");
  }
  xmlNewChild(v5, 0, (const xmlChar *)"supports_retry_after", (const xmlChar *)"1");
  if (WLLoggingEnabled()) {
    xmlNewChild(v5, 0, (const xmlChar *)"logging_enabled", (const xmlChar *)"1");
  }
  mem = 0;
  int size = 0;
  xmlDocDumpFormatMemory(v3, &mem, &size, 0);
  if (mem)
  {
    in_addr v7 = [MEMORY[0x263EFF8F8] dataWithBytes:mem length:size];
  }
  else
  {
    in_addr v7 = 0;
  }
  xmlFreeDoc(v3);
  xmlCleanupParser();
  return v7;
}

- (void)sendData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__WLDeviceDiscoverySocketHandler_sendData_completion___block_invoke;
  block[3] = &unk_26490CE18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(writeQueue, block);
}

void __54__WLDeviceDiscoverySocketHandler_sendData_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) bytes];
  uint64_t v4 = [*(id *)(a1 + 40) length];
  uint64_t v5 = *(unsigned int *)(*(void *)(a1 + 32) + 72);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__WLDeviceDiscoverySocketHandler_sendData_completion___block_invoke_2;
  v7[3] = &unk_26490C820;
  id v6 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v2 writeBytes:v3 length:v4 toSocket:v5 completion:v7];
}

void __54__WLDeviceDiscoverySocketHandler_sendData_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    id v5 = v7;
  }
  if ((a2 & 1) == 0)
  {
    [*(id *)(a1 + 32) invalidateWithError:0];
    id v5 = v7;
  }
}

- (int)sockfd
{
  return self->_sockfd;
}

- (WLDeviceDiscoverySocketHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WLDeviceDiscoverySocketHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sourceDevice, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_srpPassword, 0);
}

@end