@interface OspreyMescalSession
- (BOOL)completeWithHandshakeResponse:(id)a3 error:(id *)a4;
- (OspreyMescalSession)init;
- (id)_exchangeData:(id)a3 error:(id *)a4;
- (id)signData:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)init;
- (void)invalidate;
@end

@implementation OspreyMescalSession

- (OspreyMescalSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)OspreyMescalSession;
  v2 = [(OspreyMescalSession *)&v6 init];
  if (v2)
  {
    zxcm2Qme0x(0, 0, (uint64_t)&v2->_hardwareInfo);
    if (v3)
    {
      OspreyLoggingInit();
      if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_ERROR)) {
        -[OspreyMescalSession init]();
      }
    }
    else
    {
      cp2g1b9ro((uint64_t)&v2->_fairplayContext, (uint64_t)&v2->_hardwareInfo);
      if (!v4)
      {
        v2->_state = 1;
        return v2;
      }
      OspreyLoggingInit();
      if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_ERROR)) {
        -[OspreyMescalSession init]();
      }
    }

    return 0;
  }
  return v2;
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OspreyLoggingInit();
  int v3 = OspreyLogContextDeviceAuth;
  if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    objc_super v6 = "-[OspreyMescalSession invalidate]";
    _os_log_impl(&dword_1BEDB4000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  self->_state = 0;
  fairplayContext = self->_fairplayContext;
  if (fairplayContext)
  {
    IPaI1oem5iL((uint64_t)fairplayContext);
    self->_fairplayContext = 0;
  }
}

- (void)dealloc
{
  [(OspreyMescalSession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)OspreyMescalSession;
  [(OspreyMescalSession *)&v3 dealloc];
}

- (BOOL)completeWithHandshakeResponse:(id)a3 error:(id *)a4
{
  int v4 = [(OspreyMescalSession *)self _exchangeData:a3 error:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_exchangeData:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  fairplayContext = self->_fairplayContext;
  if (!fairplayContext)
  {
    id v14 = 0;
LABEL_8:
    v15 = 0;
    goto LABEL_15;
  }
  uint64_t v20 = 0;
  unsigned int v19 = 0;
  char v18 = -1;
  p_hardwareInfo = &self->_hardwareInfo;
  id v8 = a3;
  uint64_t v9 = [v8 bytes];
  uint64_t v10 = [v8 length];

  Mib5yocT(200, (uint64_t)p_hardwareInfo, (uint64_t)fairplayContext, v9, v10, (uint64_t)&v20, (uint64_t)&v19, (uint64_t)&v18);
  if (v11)
  {
    int v12 = v11;
    OspreyLoggingInit();
    v13 = OspreyLogContextDeviceAuth;
    if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[OspreyMescalSession _exchangeData:error:]";
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      _os_log_error_impl(&dword_1BEDB4000, v13, OS_LOG_TYPE_ERROR, "%s SAP exchange failed: %li", buf, 0x16u);
    }
    [(OspreyMescalSession *)self invalidate];
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"OspreyDeviceAuthenticationErrorDomain" code:v12 userInfo:&unk_1F1A03668];
    if (a4)
    {
      id v14 = v14;
      v15 = 0;
      *a4 = v14;
      goto LABEL_15;
    }
    goto LABEL_8;
  }
  if (v18 == 1)
  {
    unint64_t v16 = 2;
    goto LABEL_13;
  }
  if (!v18)
  {
    unint64_t v16 = 3;
LABEL_13:
    self->_state = v16;
  }
  v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v20 length:v19];
  id v14 = 0;
LABEL_15:

  return v15;
}

- (id)signData:(id)a3 error:(id *)a4
{
  fairplayContext = self->_fairplayContext;
  if (!fairplayContext) {
    goto LABEL_6;
  }
  uint64_t v13 = 0;
  unsigned int v12 = 0;
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  Fc3vhtJDvr((uint64_t)fairplayContext, v7, v8, (uint64_t)&v13, (uint64_t)&v12);
  if (!v9)
  {
    fairplayContext = [MEMORY[0x1E4F1C9B8] dataWithBytes:v13 length:v12];
LABEL_6:
    id v10 = 0;
    goto LABEL_8;
  }
  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"OspreyDeviceAuthenticationErrorDomain" code:v9 userInfo:&unk_1F1A03690];
  if (a4)
  {
    id v10 = v10;
    fairplayContext = 0;
    *a4 = v10;
  }
  else
  {
    fairplayContext = 0;
  }
LABEL_8:

  return fairplayContext;
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1BEDB4000, v0, OS_LOG_TYPE_ERROR, "%s Could not initialize hardware info: %d", (uint8_t *)v1, 0x12u);
}

@end