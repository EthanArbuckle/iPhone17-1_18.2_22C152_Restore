@interface PMMTelephonyConnection
- (BOOL)phoneCallActiveOrHeld;
- (PMMTelephonyConnection)init;
- (void)dealloc;
@end

@implementation PMMTelephonyConnection

- (PMMTelephonyConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)PMMTelephonyConnection;
  v2 = [(PMMTelephonyConnection *)&v5 init];
  v3 = v2;
  if (v2) {
    v2->_ctServerConnnectionRef = (__CTServerConnection *)_CTServerConnectionCreate();
  }
  return v3;
}

- (void)dealloc
{
  ctServerConnnectionRef = self->_ctServerConnnectionRef;
  if (ctServerConnnectionRef)
  {
    CFRelease(ctServerConnnectionRef);
    self->_ctServerConnnectionRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PMMTelephonyConnection;
  [(PMMTelephonyConnection *)&v4 dealloc];
}

- (BOOL)phoneCallActiveOrHeld
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_ctServerConnnectionRef)
  {
    uint64_t v2 = _CTServerConnectionIsAnyCallActiveOrHeld();
    if (v2)
    {
      v3 = __atxlog_handle_pmm();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v7 = v2;
        __int16 v8 = 1024;
        int v9 = HIDWORD(v2);
        _os_log_impl(&dword_2247FC000, v3, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsAnyCallActiveOrHeld failed %d, %d", buf, 0xEu);
      }
    }
    objc_super v4 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = 0;
      _os_log_impl(&dword_2247FC000, v4, OS_LOG_TYPE_DEFAULT, "PhoneCallState is %{BOOL}d", buf, 8u);
    }
  }
  else
  {
    objc_super v4 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2247FC000, v4, OS_LOG_TYPE_DEFAULT, "Telephony Connection is NULL", buf, 2u);
    }
  }

  return 0;
}

@end