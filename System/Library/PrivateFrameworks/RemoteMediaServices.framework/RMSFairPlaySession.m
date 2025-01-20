@interface RMSFairPlaySession
- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3;
- (BOOL)isHandshakeComplete;
- (id)_hexStringForData:(id)a3;
- (id)handshakeData;
- (id)handshakeIterationWithData:(id)a3;
- (id)headerForURL:(id)a3;
- (void)dealloc;
- (void)handshakeData;
- (void)invalidate;
@end

@implementation RMSFairPlaySession

- (void)dealloc
{
  [(RMSFairPlaySession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)RMSFairPlaySession;
  [(RMSFairPlaySession *)&v3 dealloc];
}

- (id)handshakeData
{
  [(RMSFairPlaySession *)self _getHardwareInfo:&self->_hardwareInfo];
  cp2g1b9ro();
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = RMSLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(RMSFairPlaySession *)v4 handshakeData];
    }

    v12 = 0;
  }
  else
  {
    v12 = [(RMSFairPlaySession *)self handshakeIterationWithData:0];
  }
  return v12;
}

- (id)handshakeIterationWithData:(id)a3
{
  v20 = 0;
  unsigned int v19 = 0;
  char v18 = -1;
  id v3 = a3;
  [v3 bytes];
  [v3 length];

  Mib5yocT();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = RMSLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[RMSFairPlaySession handshakeIterationWithData:](v5, v6, v7, v8, v9, v10, v11, v12);
    }

    v15 = 0;
    goto LABEL_14;
  }
  if (v18 == -1)
  {
    v14 = RMSLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[RMSFairPlaySession handshakeIterationWithData:](v14);
    }

    goto LABEL_13;
  }
  if (v18 != 1)
  {
LABEL_13:
    v15 = v20;
    goto LABEL_14;
  }
  v13 = RMSLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_23C83A000, v13, OS_LOG_TYPE_DEFAULT, "RemoteServices: FairPlaySAPExchange requires further negotiation.", v17, 2u);
  }

  v15 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v20 length:v19];
LABEL_14:
  return v15;
}

- (id)headerForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 absoluteString];
  uint64_t v6 = [v4 path];

  uint64_t v7 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "rangeOfString:", v6));

  uint64_t v8 = [v7 dataUsingEncoding:4];
  uint64_t v9 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x2B5AB4F1uLL);
  id v10 = v8;
  CC_MD5((const void *)[v10 bytes], objc_msgSend(v10, "length"), v9);
  U4HBs();
  uint64_t v12 = v11;
  free(v9);
  if (v12)
  {
    v13 = RMSLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RMSFairPlaySession headerForURL:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    v20 = 0;
  }
  else
  {
    v13 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:0 length:0];
    v20 = [(RMSFairPlaySession *)self _hexStringForData:v13];
  }

  return v20;
}

- (void)invalidate
{
  self->_handshakeComplete = 0;
  if (self->_sessionToken)
  {
    IPaI1oem5iL();
    self->_sessionToken = 0;
  }
}

- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3
{
  id v3 = a3;
  if (a3)
  {
    id v4 = (void *)MGCopyAnswer();
    if (v4)
    {
      uint64_t v5 = v4;
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 == CFDataGetTypeID() && (CFIndex Length = CFDataGetLength((CFDataRef)v5), Length <= 20))
      {
        v3->IDCFIndex Length = Length;
        objc_msgSend(v5, "getBytes:length:", v3->ID);
        LOBYTE(v3) = 1;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
      CFRelease(v5);
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)_hexStringForData:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithCapacity:", 2 * objc_msgSend(v3, "length"));
  uint64_t v5 = [v3 length];
  id v6 = v3;
  uint64_t v7 = [v6 bytes];
  if (v5)
  {
    uint64_t v8 = (unsigned __int8 *)v7;
    do
    {
      unsigned int v9 = *v8++;
      objc_msgSend(v4, "appendFormat:", @"%02X", v9);
      --v5;
    }
    while (v5);
  }

  return v4;
}

- (BOOL)isHandshakeComplete
{
  return self->_handshakeComplete;
}

- (void)handshakeData
{
}

- (void)handshakeIterationWithData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23C83A000, log, OS_LOG_TYPE_ERROR, "RemoteServices: FairPlaySAPExchange failed.", v1, 2u);
}

- (void)handshakeIterationWithData:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)headerForURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end