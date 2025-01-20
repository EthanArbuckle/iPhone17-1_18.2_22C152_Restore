@interface TVRMSFairPlaySession
- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3;
- (BOOL)isHandshakeComplete;
- (id)_hexStringForData:(id)a3;
- (id)handshakeData;
- (id)handshakeIterationWithData:(id)a3;
- (id)headerForURL:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation TVRMSFairPlaySession

- (void)dealloc
{
  [(TVRMSFairPlaySession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TVRMSFairPlaySession;
  [(TVRMSFairPlaySession *)&v3 dealloc];
}

- (id)handshakeData
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [(TVRMSFairPlaySession *)self _getHardwareInfo:&self->_hardwareInfo];
  cp2g1b9ro();
  if (v3)
  {
    int v4 = v3;
    v5 = _TVRCRMSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v4;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "RemoteServices: FairPlaySAPInit failed with error: %d.", (uint8_t *)v8, 8u);
    }

    v6 = 0;
  }
  else
  {
    v6 = [(TVRMSFairPlaySession *)self handshakeIterationWithData:0];
  }

  return v6;
}

- (id)handshakeIterationWithData:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 bytes];
  [v3 length];

  Mib5yocT();
  if (v4)
  {
    int v5 = v4;
    v6 = _TVRCRMSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = v5;
      _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "RemoteServices: FairPlaySAPExchange failed with error: %d.", buf, 8u);
    }
  }
  else
  {
    v6 = _TVRCRMSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "RemoteServices: FairPlaySAPExchange failed.", buf, 2u);
    }
  }

  return 0;
}

- (id)headerForURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 absoluteString];
  v6 = [v4 path];

  v7 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "rangeOfString:", v6));

  v8 = [v7 dataUsingEncoding:4];
  int v9 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x13DB2599uLL);
  id v10 = v8;
  CC_MD5((const void *)[v10 bytes], objc_msgSend(v10, "length"), v9);
  U4HBs();
  int v12 = v11;
  free(v9);
  if (v12)
  {
    v13 = _TVRCRMSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v17 = v12;
      _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "RemoteServices: FairPlaySAPEncrypt failed with error: %d.", buf, 8u);
    }
    v14 = 0;
  }
  else
  {
    v13 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:0 length:0];
    v14 = [(TVRMSFairPlaySession *)self _hexStringForData:v13];
  }

  return v14;
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
      int v5 = v4;
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
    v8 = (unsigned __int8 *)v7;
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

@end