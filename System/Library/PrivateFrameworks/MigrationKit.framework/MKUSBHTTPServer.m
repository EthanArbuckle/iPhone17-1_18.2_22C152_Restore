@interface MKUSBHTTPServer
+ (BOOL)isEnabled;
- (BOOL)_listen:(id)a3;
- (MKUSBBHTTPServerDelegate)delegate;
- (MKUSBHTTPServer)init;
- (void)cancel;
- (void)dealloc;
- (void)device:(id)a3 didChangeState:(unsigned __int8)a4;
- (void)device:(id)a3 didFail:(id)a4;
- (void)deviceDidCancel:(id)a3;
- (void)deviceDidOpen:(id)a3;
- (void)listen;
- (void)run;
- (void)setDelegate:(id)a3;
- (void)start:(id)a3;
- (void)stop;
@end

@implementation MKUSBHTTPServer

- (MKUSBHTTPServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)MKUSBHTTPServer;
  v2 = [(MKHTTPRequestMultiplexer *)&v9 init];
  if (v2)
  {
    if (+[MKInternal isInternal]
      && !+[MKUSBHTTPServer isEnabled])
    {
      p_super = +[MKLog log];
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_22BFAC000, p_super, OS_LOG_TYPE_INFO, "will disable USB", v8, 2u);
      }
    }
    else
    {
      v3 = objc_alloc_init(MKUSBDevice);
      device = v2->_device;
      v2->_device = v3;

      [(MKUSBDevice *)v2->_device setDelegate:v2];
      v5 = objc_alloc_init(MKHTTPParser);
      p_super = &v2->_parser->super;
      v2->_parser = v5;
    }
  }
  return v2;
}

- (void)dealloc
{
  [(MKUSBHTTPServer *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)MKUSBHTTPServer;
  [(MKUSBHTTPServer *)&v3 dealloc];
}

- (void)run
{
}

- (void)cancel
{
  [(MKUSBHTTPServer *)self stop];
  device = self->_device;
  [(MKUSBDevice *)device cancel];
}

- (void)listen
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v3 = +[MKLog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "usb server will listen.", buf, 2u);
  }

  id v4 = [(MKUSBDevice *)self->_device endpoints];
  objc_sync_enter(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        objc_sync_enter(v9);
        v10 = objc_msgSend(v9, "thread", (void)v14);
        BOOL v11 = v10 == 0;

        if (v11)
        {
          v12 = (void *)[objc_alloc(MEMORY[0x263F08B88]) initWithTarget:self selector:sel_start_ object:v9];
          [v9 setThread:v12];
          [v12 start];
        }
        objc_sync_exit(v9);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v5);
  v13 = +[MKLog log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22BFAC000, v13, OS_LOG_TYPE_INFO, "usb server did listen.", buf, 2u);
  }
}

- (void)start:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08B88] currentThread];
  uint64_t v6 = +[MKLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_22BFAC000, v6, OS_LOG_TYPE_INFO, "usb server will listen on a background thread. thread=%@", (uint8_t *)&v11, 0xCu);
  }

  while (1)
  {
    uint64_t v7 = (void *)MEMORY[0x230F5C060]();
    if (![(MKUSBHTTPServer *)self _listen:v4]
      || ![v5 isExecuting]
      || ([v5 isCancelled] & 1) != 0)
    {
      break;
    }
    char v8 = [v5 isFinished];
    if (v8) {
      goto LABEL_10;
    }
  }
LABEL_10:
  id v9 = v4;
  objc_sync_enter(v9);
  [v9 setThread:0];
  objc_sync_exit(v9);

  v10 = +[MKLog log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_22BFAC000, v10, OS_LOG_TYPE_INFO, "usb server did listen on a background thread. thread=%@.", (uint8_t *)&v11, 0xCu);
  }
}

- (void)stop
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [(MKUSBDevice *)self->_device endpoints];
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v9 + 1) + 8 * v6);
        objc_sync_enter(v7);
        char v8 = objc_msgSend(v7, "thread", (void)v9);
        [v8 cancel];

        [v7 setThread:0];
        objc_sync_exit(v7);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v3);
}

- (BOOL)_listen:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(MKTime);
  uint64_t v64 = 0;
  uint64_t v6 = objc_alloc_init(MKHTTPResponse);
  id v7 = 0;
  unint64_t v8 = 0x268496000uLL;
  v49 = v5;
  id v50 = v4;
  do
  {
    context = (void *)MEMORY[0x230F5C060]();
    uint64_t v51 = *(int *)(v8 + 1104);
    int v9 = [*(id *)((char *)&self->super.super.isa + v51) read:&v64 fromEndpoint:v4];
    if (v9 >= 1)
    {
      long long v10 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v64 length:v9 freeWhenDone:1];
      if (v7)
      {
        [v7 appendData:v10];
      }
      else
      {
        id v7 = [(MKHTTPParser *)self->_parser parse:v10 hostname:&stru_26DF6A8B0];
      }
    }
    long long v11 = [v7 headers];
    v56 = [v11 method];
    v55 = [v11 path];
    long long v12 = [v7 body];
    unint64_t v53 = [v11 contentLength];
    unint64_t v52 = [v12 length];
    if ([v11 transferEncoding])
    {
      uint64_t v63 = 0;
      char v62 = 0;
      uint64_t v14 = [(MKHTTPParser *)self->_parser chunk:v12 offset:&v63 done:&v62];
      BOOL v13 = v62 == 0;
      objc_msgSend(v7, "setChunkedTransferCompleted:");
      long long v15 = [v7 chunk];
      long long v16 = v7;
      uint64_t v17 = [v15 length];
      uint64_t v18 = [v16 chunkOffset] + v17;
      id v7 = v16;
      [v16 setChunkOffset:v18];

      [v16 setChunk:v14];
      if (v63) {
        objc_msgSend(v16, "sliceData:");
      }
      uint64_t v5 = v49;
      if (!v62 && [v14 length])
      {
        v19 = [(MKHTTPRequestMultiplexer *)self routerForMethod:v56 path:v55];
        [v19 server:self didReceiveRequest:v16 response:v6];

        id v7 = v16;
      }

      id v4 = v50;
      unint64_t v8 = 0x268496000;
    }
    else
    {
      BOOL v13 = 0;
    }
    if (v53 > v52) {
      BOOL v13 = 1;
    }
  }
  while (v9 >= 1 && v13);
  if (v9 < 0)
  {
    BOOL v36 = 0;
  }
  else
  {
    self->_used = 1;
    uint64_t v20 = [v7 headers];
    v21 = [v20 method];
    v22 = [v20 path];
    uint64_t v23 = [v7 body];
    v24 = [(MKHTTPRequestMultiplexer *)self routerForMethod:v21 path:v22];
    v25 = [v20 boundary];

    v48 = v7;
    v57 = (void *)v23;
    if (v25)
    {
      parser = self->_parser;
      uint64_t v27 = [v20 boundary];
      v28 = v7;
      v29 = (void *)v27;
      v30 = [(MKHTTPParser *)parser parts:v23 boundary:v27 container:v28];

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v58 objects:v65 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v59 != v34) {
              objc_enumerationMutation(v31);
            }
            [v24 server:self didReceiveRequest:*(void *)(*((void *)&v58 + 1) + 8 * i) response:v6];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v58 objects:v65 count:16];
        }
        while (v33);
      }
    }
    else
    {
      [v24 server:self didReceiveRequest:v7 response:v6];
    }
    v37 = [(MKHTTPResponse *)v6 headers];
    v38 = [v37 serverTiming];
    [(MKTime *)v49 elapsedTimeInSeconds];
    double v40 = v39;
    [v38 response];
    [v38 setResponse:v40 + v41];

    id v42 = [(MKHTTPResponse *)v6 responseData];
    uint64_t v43 = [v42 bytes];
    uint64_t v64 = v43;
    v44 = *(Class *)((char *)&self->super.super.isa + v51);
    uint64_t v45 = [v42 length];
    v46 = v44;
    id v4 = v50;
    LODWORD(v43) = [v46 write:v43 length:v45 toEndpoint:v50];
    BOOL v36 = [v42 length] == (int)v43;

    uint64_t v5 = v49;
    id v7 = v48;
  }

  return v36;
}

- (void)deviceDidOpen:(id)a3
{
  id v3 = +[MKLog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "usb device is ready to accept a connection.", v4, 2u);
  }
}

- (void)deviceDidCancel:(id)a3
{
  id v3 = +[MKLog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "usb device is closed.", v4, 2u);
  }
}

- (void)device:(id)a3 didFail:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a4;
  uint64_t v5 = +[MKLog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22BFAC000, v5, OS_LOG_TYPE_INFO, "usb device failed to initialize. error=%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)device:(id)a3 didChangeState:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v6 = +[MKLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_22BFAC000, v6, OS_LOG_TYPE_INFO, "usb device did change state. state=%d", (uint8_t *)v8, 8u);
  }

  if (v4 == 5)
  {
LABEL_6:
    [(MKUSBHTTPServer *)self listen];
    return;
  }
  if (v4 != 4)
  {
    if (v4 != 3) {
      return;
    }
    goto LABEL_6;
  }
  if (self->_used)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained usbHTTPServerDidClose:self];
  }
}

+ (BOOL)isEnabled
{
  return +[MKPreferences BOOLForKey:@"disable_usb"] != 1;
}

- (MKUSBBHTTPServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKUSBBHTTPServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end