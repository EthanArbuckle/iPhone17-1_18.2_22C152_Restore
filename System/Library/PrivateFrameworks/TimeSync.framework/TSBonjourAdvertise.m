@interface TSBonjourAdvertise
- (BOOL)startAdvertisingWithError:(id *)a3;
- (BOOL)stopAdvertising;
- (TSBonjourAdvertise)init;
- (TSBonjourAdvertiseDelegate)delegate;
- (void)dealloc;
- (void)registeredServiceWithName:(const char *)a3 regType:(const char *)a4 domain:(const char *)a5 withFlags:(unsigned int)a6;
- (void)setDelegate:(id)a3;
@end

@implementation TSBonjourAdvertise

- (TSBonjourAdvertise)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSBonjourAdvertise;
  v2 = [(TSBonjourAdvertise *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.timesync.bonjour.advertise", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)registeredServiceWithName:(const char *)a3 regType:(const char *)a4 domain:(const char *)a5 withFlags:(unsigned int)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315906;
    v20 = a3;
    __int16 v21 = 2080;
    v22 = a4;
    __int16 v23 = 2080;
    v24 = a5;
    __int16 v25 = 1024;
    unsigned int v26 = a6;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Registered service with name %s type %s domain %s flags 0x%08x\n", (uint8_t *)&v19, 0x26u);
  }
  v11 = [NSString stringWithUTF8String:a3];
  v12 = [NSString stringWithUTF8String:a4];
  v13 = [NSString stringWithUTF8String:a5];
  uint64_t v14 = [(TSBonjourAdvertise *)self delegate];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(TSBonjourAdvertise *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v18 = [(TSBonjourAdvertise *)self delegate];
      [v18 didChangeServiceName:v11 type:v12 andDomain:v13 onAdvertiser:self];
    }
  }
}

- (BOOL)startAdvertisingWithError:(id *)a3
{
  sdRef = self->_sdRef;
  p_sdRef = &self->_sdRef;
  if (!sdRef)
  {
    DNSServiceErrorType v6 = DNSServiceRegister(p_sdRef, 0x100000u, 0, 0, "_ptp-general._udp.", 0, 0, 0x4001u, 0, 0, (DNSServiceRegisterReply)TSBARegisterServiceReply, self);
    if (a3 && v6)
    {
      TSBonjourErrorFromErrorCode(v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      DNSServiceErrorType v6 = 1;
      return v6 == 0;
    }
    if (v6) {
      return v6 == 0;
    }
    DNSServiceSetDispatchQueue(self->_sdRef, (dispatch_queue_t)self->_queue);
  }
  DNSServiceErrorType v6 = 0;
  return v6 == 0;
}

- (BOOL)stopAdvertising
{
  sdRef = self->_sdRef;
  if (sdRef)
  {
    DNSServiceRefDeallocate(self->_sdRef);
    self->_sdRef = 0;
  }
  return sdRef != 0;
}

- (void)dealloc
{
  sdRef = self->_sdRef;
  if (sdRef) {
    DNSServiceRefDeallocate(sdRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSBonjourAdvertise;
  [(TSBonjourAdvertise *)&v4 dealloc];
}

- (TSBonjourAdvertiseDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSBonjourAdvertiseDelegate *)a3;
}

- (void).cxx_destruct
{
}

@end