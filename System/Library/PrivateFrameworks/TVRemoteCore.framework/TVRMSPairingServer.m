@interface TVRMSPairingServer
- (BOOL)startServerWithExpectedPasscodeHash:(id)a3 advertisedDeviceName:(id)a4 advertisedDeviceModel:(id)a5;
- (TVRMSPairingServerDelegate)delegate;
- (id)_parsedQueryParametersWithQueryString:(id)a3;
- (unsigned)port;
- (void)handleHTTPServerConnectionDidFailToReplyToRequest:(_CFHTTPServerRequest *)a3 withResponse:(_CFHTTPServerResponse *)a4;
- (void)handleHTTPServerConnectionDidReceiveError:(__CFError *)a3;
- (void)handleHTTPServerConnectionDidReceiveRequest:(_CFHTTPServerRequest *)a3;
- (void)handleHTTPServerConnectionDidReplyToRequest:(_CFHTTPServerRequest *)a3 withResponse:(_CFHTTPServerResponse *)a4;
- (void)handleHTTPServerConnectionInvalidated;
- (void)handleHTTPServerDidCloseConnection:(_CFHTTPServerConnection *)a3;
- (void)handleHTTPServerDidOpenConnection:(_CFHTTPServerConnection *)a3;
- (void)handleHTTPServerDidReceiveError:(__CFError *)a3;
- (void)handleHTTPServerInvalidated;
- (void)setDelegate:(id)a3;
- (void)stopServer;
@end

@implementation TVRMSPairingServer

- (BOOL)startServerWithExpectedPasscodeHash:(id)a3 advertisedDeviceName:(id)a4 advertisedDeviceModel:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)&self->_expectedPasscodeHash, a3);
  objc_storeStrong((id *)&self->_advertisedDeviceName, a4);
  objc_storeStrong((id *)&self->_advertisedDeviceModel, a5);
  uint64_t v23 = MEMORY[0x263EFF3B8];
  uint64_t v24 = MEMORY[0x263EFF3B0];
  long long v20 = xmmword_26DA45910;
  long long v21 = *(_OWORD *)off_26DA45920;
  v22 = off_26DA45930;
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Service = (_CFHTTPServer *)_CFHTTPServerCreateService();
  self->_HTTPServer = Service;
  if (Service)
  {
    v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.TVRemoteMediaServices.DAAPPairing", MEMORY[0x263EF83A8]);
    HTTPServerQueue = self->_HTTPServerQueue;
    self->_HTTPServerQueue = v14;

    _CFHTTPServerSetDispatchQueue();
    v16 = _CFHTTPServerCopyProperty();
    self->_int port = [v16 unsignedShortValue];
    self->_HTTPServerConnections = CFDictionaryCreateMutable(v12, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    v17 = _TVRCRMSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int port = self->_port;
      *(_DWORD *)buf = 67109120;
      int v26 = port;
      _os_log_impl(&dword_2266D3000, v17, OS_LOG_TYPE_DEFAULT, "HTTP server for pin-pairing exchange started on port %u", buf, 8u);
    }
  }
  else
  {
    v16 = _TVRCRMSLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v16, OS_LOG_TYPE_DEFAULT, "Failed to start HTTP server for pin-pairing exchange", buf, 2u);
    }
  }

  return Service != 0;
}

- (void)stopServer
{
  v3 = _TVRCRMSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Stopping HTTP server", v6, 2u);
  }

  [(__CFDictionary *)self->_HTTPServerConnections enumerateKeysAndObjectsUsingBlock:&__block_literal_global_6];
  HTTPServerConnections = self->_HTTPServerConnections;
  if (HTTPServerConnections)
  {
    CFRelease(HTTPServerConnections);
    self->_HTTPServerConnections = 0;
  }
  if (self->_HTTPServer)
  {
    _CFHTTPServerInvalidate();
    CFRelease(self->_HTTPServer);
    self->_HTTPServer = 0;
  }
  HTTPServerQueue = self->_HTTPServerQueue;
  self->_HTTPServerQueue = 0;
}

uint64_t __32__TVRMSPairingServer_stopServer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270EE29C8](a3);
}

- (void)handleHTTPServerInvalidated
{
  v2 = _TVRCRMSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "HTTP server invalidated", v3, 2u);
  }
}

- (void)handleHTTPServerDidReceiveError:(__CFError *)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = a3;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "HTTP server error: %@", (uint8_t *)&v7, 0xCu);
  }

  [(TVRMSPairingServer *)self stopServer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pairingServerDidFail:self];
}

- (void)handleHTTPServerDidOpenConnection:(_CFHTTPServerConnection *)a3
{
  v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "HTTP server opened connection", (uint8_t *)v6, 2u);
  }

  CFDictionarySetValue(self->_HTTPServerConnections, a3, a3);
  uint64_t v7 = 0;
  v8 = self;
  uint64_t v9 = MEMORY[0x263EFF3B8];
  uint64_t v10 = MEMORY[0x263EFF3B0];
  uint64_t v11 = 0;
  v6[0] = xmmword_26DA45958;
  v6[1] = *(_OWORD *)&off_26DA45968;
  v6[2] = xmmword_26DA45978;
  _CFHTTPServerConnectionSetClient();
  _CFHTTPServerConnectionSetDispatchQueue();
}

- (void)handleHTTPServerDidCloseConnection:(_CFHTTPServerConnection *)a3
{
  HTTPServerConnections = self->_HTTPServerConnections;
  if (HTTPServerConnections) {
    CFDictionaryRemoveValue(HTTPServerConnections, a3);
  }
}

- (void)handleHTTPServerConnectionInvalidated
{
  v2 = _TVRCRMSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "HTTP connection invalidated", v3, 2u);
  }
}

- (void)handleHTTPServerConnectionDidReceiveError:(__CFError *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4 = _TVRCRMSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = a3;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "HTTP connection error: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)_parsedQueryParametersWithQueryString:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [MEMORY[0x263EFF9A0] dictionary];
  v16 = v3;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [v3 componentsSeparatedByString:@"&"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v9 count] == 2)
        {
          uint64_t v10 = [v9 firstObject];
          uint64_t v11 = [v9 lastObject];
          CFAllocatorRef v12 = [v11 componentsSeparatedByString:@","];
          if ((unint64_t)[v12 count] <= 1) {
            v13 = v11;
          }
          else {
            v13 = v12;
          }
          id v14 = v13;
          [v17 setValue:v14 forKey:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v17;
}

- (void)handleHTTPServerConnectionDidReceiveRequest:(_CFHTTPServerRequest *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)_CFHTTPServerRequestCopyProperty();
  uint64_t v6 = _TVRCRMSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "HTTP server received pairing request", buf, 2u);
  }

  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __66__TVRMSPairingServer_handleHTTPServerConnectionDidReceiveRequest___block_invoke;
  v36[3] = &unk_2647AF240;
  v38 = a3;
  id v7 = v5;
  id v37 = v7;
  v8 = (void (**)(void, void, void))MEMORY[0x22A6592D0](v36);
  uint64_t v9 = (void *)_CFHTTPServerRequestCopyProperty();
  if ([v9 isEqualToString:*MEMORY[0x263EFC708]])
  {
    if (!v7)
    {
      v8[2](v8, 400, 0);
      goto LABEL_25;
    }
    uint64_t v10 = (void *)_CFHTTPServerRequestCopyProperty();
    uint64_t v11 = [MEMORY[0x263F08BA0] componentsWithURL:v10 resolvingAgainstBaseURL:1];
    CFAllocatorRef v12 = [v11 path];
    if ([v12 isEqualToString:@"/pair"])
    {
      char v13 = [v7 isEqualToString:@"GET"];

      if (v13)
      {
        id v14 = [v11 query];
        v15 = [(TVRMSPairingServer *)self _parsedQueryParametersWithQueryString:v14];

        v16 = [v15 valueForKey:@"pairingcode"];
        v35 = v15;
        id v17 = [v15 valueForKey:@"servicename"];
        v34 = v16;
        if ([v17 length]
          && [v16 isEqualToString:self->_expectedPasscodeHash])
        {
          unsigned int v18 = time(0);
          srandom(v18);
          uint64_t v19 = random();
          uint64_t v20 = random() | (v19 << 32);
          objc_msgSend(NSString, "stringWithFormat:", @"0x%.16llX", v20);
          long long v21 = (NSString *)objc_claimAutoreleasedReturnValue();
          successfulPairingGUID = self->_successfulPairingGUID;
          self->_successfulPairingGUID = v21;

          objc_storeStrong((id *)&self->_successfulPairingServiceName, v17);
          uint64_t v23 = objc_opt_new();
          [v23 encodeInt64:v20 forCode:1668116583];
          [v23 encodeString:self->_advertisedDeviceName forCode:1668116077];
          [v23 encodeString:self->_advertisedDeviceModel forCode:1668117625];
          uint64_t v24 = [v23 data];
          v25 = objc_opt_new();

          [v25 encodeData:v24 forCode:1668116577];
          v33 = [v25 data];
          int v26 = _TVRCRMSLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = self->_successfulPairingGUID;
            *(_DWORD *)buf = 138412546;
            v40 = v17;
            __int16 v41 = 2112;
            v42 = v27;
            _os_log_impl(&dword_2266D3000, v26, OS_LOG_TYPE_DEFAULT, "Received successful pairing request from %@; pairing GUID is %@.",
              buf,
              0x16u);
          }

          if (v33)
          {
            ((void (**)(void, uint64_t, void *))v8)[2](v8, 200, v33);

LABEL_23:
            goto LABEL_24;
          }
        }
        else
        {
          v28 = _TVRCRMSLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            expectedPasscodeHash = self->_expectedPasscodeHash;
            *(_DWORD *)buf = 138412802;
            v40 = v17;
            __int16 v41 = 2112;
            v42 = (NSString *)v16;
            __int16 v43 = 2112;
            v44 = expectedPasscodeHash;
            _os_log_impl(&dword_2266D3000, v28, OS_LOG_TYPE_DEFAULT, "Received unsuccessful pairing request from %@; received passcode hash %@ but expected %@.",
              buf,
              0x20u);
          }

          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          char v31 = objc_opt_respondsToSelector();

          if (v31)
          {
            id v32 = objc_loadWeakRetained((id *)&self->_delegate);
            [v32 pairingServer:self didFailToPairWithService:v17];
          }
        }
        v8[2](v8, 404, 0);
        goto LABEL_23;
      }
    }
    else
    {
    }
    v8[2](v8, 404, 0);
LABEL_24:

    goto LABEL_25;
  }
  v8[2](v8, 505, 0);
LABEL_25:
}

void __66__TVRMSPairingServer_handleHTTPServerConnectionDidReceiveRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  ResponseMessage = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage();
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
  CFHTTPMessageSetHeaderFieldValue(ResponseMessage, @"Content-Length", (CFStringRef)[v6 stringValue]);

  CFHTTPMessageSetHeaderFieldValue(ResponseMessage, @"Connection", @"close");
  [*(id *)(a1 + 32) isEqualToString:@"HEAD"];
  id v7 = (const void *)_CFHTTPServerResponseCreateWithData();

  _CFHTTPServerResponseEnqueue();
  CFRelease(v7);

  CFRelease(ResponseMessage);
}

- (void)handleHTTPServerConnectionDidReplyToRequest:(_CFHTTPServerRequest *)a3 withResponse:(_CFHTTPServerResponse *)a4
{
  uint64_t v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "HTTP server did reply to request", v8, 2u);
  }

  uint64_t v6 = (__CFHTTPMessage *)_CFHTTPServerResponseCopyProperty();
  if (CFHTTPMessageGetResponseStatusCode(v6) == 200)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pairingServer:self didPairWithService:self->_successfulPairingServiceName pairingGUID:self->_successfulPairingGUID];

    [(TVRMSPairingServer *)self stopServer];
  }
  if (v6) {
    CFRelease(v6);
  }
}

- (void)handleHTTPServerConnectionDidFailToReplyToRequest:(_CFHTTPServerRequest *)a3 withResponse:(_CFHTTPServerResponse *)a4
{
  id v4 = _TVRCRMSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "HTTP server failed to reply to request", v5, 2u);
  }
}

- (TVRMSPairingServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRMSPairingServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advertisedDeviceModel, 0);
  objc_storeStrong((id *)&self->_advertisedDeviceName, 0);
  objc_storeStrong((id *)&self->_successfulPairingServiceName, 0);
  objc_storeStrong((id *)&self->_successfulPairingGUID, 0);
  objc_storeStrong((id *)&self->_expectedPasscodeHash, 0);

  objc_storeStrong((id *)&self->_HTTPServerQueue, 0);
}

@end