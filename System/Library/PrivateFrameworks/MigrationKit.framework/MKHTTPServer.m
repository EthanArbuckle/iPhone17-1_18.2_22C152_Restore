@interface MKHTTPServer
- (BOOL)useHTTPS;
- (BOOL)useQUIC;
- (MKCertificate)certificate;
- (MKCertificate)clientCertificate;
- (MKHTTPServer)init;
- (MKHTTPServerDelegate)delegate;
- (NSString)service;
- (unint64_t)port;
- (void)cancel;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)listener:(id)a3 didOpen:(int64_t)a4;
- (void)listenerDidCancel:(id)a3;
- (void)run;
- (void)setCertificate:(id)a3;
- (void)setClientCertificate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPort:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setUseHTTPS:(BOOL)a3;
- (void)setUseQUIC:(BOOL)a3;
@end

@implementation MKHTTPServer

- (MKHTTPServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)MKHTTPServer;
  v2 = [(MKHTTPRequestMultiplexer *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    requests = v2->_requests;
    v2->_requests = v3;

    v5 = objc_alloc_init(MKHTTPParser);
    parser = v2->_parser;
    v2->_parser = v5;
  }
  return v2;
}

- (void)run
{
  v3 = objc_alloc_init(MKListener);
  listener = self->_listener;
  self->_listener = v3;

  [(MKListener *)self->_listener setDelegate:self];
  [(MKListener *)self->_listener setPort:self->_port];
  [(MKListener *)self->_listener setCertificate:self->_certificate];
  [(MKListener *)self->_listener setClientCertificate:self->_clientCertificate];
  [(MKListener *)self->_listener setUseTLS:self->_useHTTPS];
  BOOL v5 = self->_useHTTPS && self->_useQUIC;
  [(MKListener *)self->_listener setUseQUIC:v5];
  [(MKListener *)self->_listener setService:self->_service];
  v6 = self->_listener;
  [(MKListener *)v6 listen];
}

- (void)cancel
{
}

- (void)listener:(id)a3 didOpen:(int64_t)a4
{
  [(MKHTTPServer *)self setPort:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained server:self didOpen:a4];
}

- (void)listenerDidCancel:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained serverDidCancel:self];
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v55 = a4;
  v52 = objc_alloc_init(MKTime);
  v7 = self->_requests;
  objc_sync_enter(v7);
  requests = self->_requests;
  v9 = [v6 identifier];
  v10 = [(NSMutableDictionary *)requests objectForKey:v9];

  objc_sync_exit(v7);
  if (v10)
  {
    [v10 appendData:v55];
    v11 = v10;
  }
  else
  {
    parser = self->_parser;
    v13 = [v6 hostname];
    uint64_t v14 = [(MKHTTPParser *)parser parse:v55 hostname:v13];

    v11 = (void *)v14;
  }
  v57 = v11;
  v58 = [v11 headers];
  v15 = objc_alloc_init(MKHTTPResponse);
  v54 = [v58 method];
  v53 = [v58 path];
  v56 = [v57 body];
  unsigned int v51 = [v58 isClosed];
  unint64_t v16 = [v58 contentLength];
  unint64_t v17 = [v56 length];
  char v18 = [v58 transferEncoding];
  char v19 = v18;
  if (v16 <= v17 && (v18 & 1) == 0) {
    goto LABEL_6;
  }
  if (!v10)
  {
    v33 = self->_requests;
    objc_sync_enter(v33);
    v34 = self->_requests;
    v35 = [v6 identifier];
    [(NSMutableDictionary *)v34 setObject:v57 forKey:v35];

    objc_sync_exit(v33);
  }
  if (v16 > v17)
  {
    [(MKListener *)self->_listener readData:v6];
    goto LABEL_28;
  }
  if ((v19 & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v64 = 0;
  unsigned __int8 v63 = 0;
  v48 = [(MKHTTPParser *)self->_parser chunk:v56 offset:&v64 done:&v63];
  [v57 setChunkedTransferCompleted:v63];
  v49 = [v57 chunk];
  objc_msgSend(v57, "setChunkOffset:", objc_msgSend(v57, "chunkOffset") + objc_msgSend(v49, "length"));

  [v57 setChunk:v48];
  if (v64) {
    objc_msgSend(v57, "sliceData:");
  }
  if (v63)
  {

LABEL_6:
    v20 = self->_requests;
    objc_sync_enter(v20);
    v21 = self->_requests;
    v22 = [v6 identifier];
    [(NSMutableDictionary *)v21 removeObjectForKey:v22];

    objc_sync_exit(v20);
    v23 = [(MKHTTPResponse *)v15 headers];
    [v23 close:v51];

    v24 = [(MKHTTPRequestMultiplexer *)self routerForMethod:v54 path:v53];
    v25 = [v58 boundary];
    LODWORD(v22) = v25 == 0;

    if (v22)
    {
      [v24 server:self didReceiveRequest:v57 response:v15];
    }
    else
    {
      v26 = self->_parser;
      v27 = [v58 boundary];
      v28 = [(MKHTTPParser *)v26 parts:v56 boundary:v27 container:v57];

      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v60 != v31) {
              objc_enumerationMutation(v29);
            }
            [v24 server:self didReceiveRequest:*(void *)(*((void *)&v59 + 1) + 8 * i) response:v15];
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:v65 count:16];
        }
        while (v30);
      }
    }
    v36 = [(MKHTTPResponse *)v15 headers];
    v37 = [v36 serverTiming];
    [(MKTime *)v52 elapsedTimeInSeconds];
    double v39 = v38;
    [v37 response];
    [v37 setResponse:v39 + v40];

    v41 = [(MKHTTPResponse *)v15 bodyStream];
    listener = self->_listener;
    id v43 = [(MKHTTPResponse *)v15 responseData];
    if (v41)
    {
      [(MKListener *)listener sendData:v43 throughConnection:v6 close:0];

      [v41 open];
      uint64_t v44 = objc_msgSend(v41, "read:maxLength:", objc_msgSend(v6, "buffer"), objc_msgSend(v6, "bufferSize"));
      if (v44)
      {
        v45 = 0;
        do
        {
          v46 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v6, "buffer"), v44, 0);

          [(MKListener *)self->_listener sendData:v46 throughConnection:v6 close:0];
          uint64_t v44 = objc_msgSend(v41, "read:maxLength:", objc_msgSend(v6, "buffer"), objc_msgSend(v6, "bufferSize"));
          v45 = v46;
        }
        while (v44);
      }
      [v41 close];
      v47 = self->_listener;
      id v43 = objc_alloc_init(MEMORY[0x263EFF8F8]);
      [(MKListener *)v47 sendData:v43 throughConnection:v6 close:v51];
    }
    else
    {
      [(MKListener *)listener sendData:v43 throughConnection:v6 close:v51];
    }

    goto LABEL_28;
  }
  if ([v48 length])
  {
    v50 = [(MKHTTPRequestMultiplexer *)self routerForMethod:v54 path:v53];
    [v50 server:self didReceiveRequest:v57 response:v15];
  }
  [(MKListener *)self->_listener readData:v6];

LABEL_28:
}

- (MKHTTPServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKHTTPServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useHTTPS
{
  return self->_useHTTPS;
}

- (void)setUseHTTPS:(BOOL)a3
{
  self->_useHTTPS = a3;
}

- (BOOL)useQUIC
{
  return self->_useQUIC;
}

- (void)setUseQUIC:(BOOL)a3
{
  self->_useQUIC = a3;
}

- (unint64_t)port
{
  return self->_port;
}

- (void)setPort:(unint64_t)a3
{
  self->_port = a3;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (MKCertificate)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (MKCertificate)clientCertificate
{
  return self->_clientCertificate;
}

- (void)setClientCertificate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCertificate, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end