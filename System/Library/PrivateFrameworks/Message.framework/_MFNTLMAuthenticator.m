@interface _MFNTLMAuthenticator
- (id)responseForServerData:(id)a3;
- (void)dealloc;
- (void)setAuthenticationState:(int64_t)a3;
@end

@implementation _MFNTLMAuthenticator

- (void)dealloc
{
  if (self->_ntlmGeneratorRef) {
    NtlmGeneratorRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)_MFNTLMAuthenticator;
  [(_MFNTLMAuthenticator *)&v3 dealloc];
}

- (void)setAuthenticationState:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_MFNTLMAuthenticator;
  -[ECSASLAuthenticator setAuthenticationState:](&v11, sel_setAuthenticationState_);
  if (a3 == 1)
  {
    v5 = MFLogGeneral();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)v10 = 0;
    v6 = "start NTLM authentication";
    v7 = v5;
  }
  else
  {
    if (self->_ntlmGeneratorRef)
    {
      NtlmGeneratorRelease();
      self->_ntlmGeneratorRef = 0;
    }
    self->_ntlmError = 0;
    v8 = MFLogGeneral();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (a3 == 4)
    {
      if (!v9) {
        return;
      }
      *(_WORD *)v10 = 0;
      v6 = "NTLM authentication succeeded";
    }
    else
    {
      if (!v9) {
        return;
      }
      *(_WORD *)v10 = 0;
      v6 = "NTLM authentication failed";
    }
    v7 = v8;
  }
  _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_INFO, v6, v10, 2u);
}

- (id)responseForServerData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_ntlmError = &self->_ntlmError;
  if (self->_ntlmError) {
    return 0;
  }
  if (self->_ntlmGeneratorRef)
  {
    v5 = [(ECSASLAuthenticator *)self account];
    uint64_t v6 = [(ECAuthenticatableAccount *)v5 domain];
    if (v6) {
      v7 = (__CFString *)v6;
    }
    else {
      v7 = &stru_1EFF11268;
    }
    uint64_t v8 = [(ECAuthenticatableAccount *)v5 username];
    if (v8) {
      BOOL v9 = (__CFString *)v8;
    }
    else {
      BOOL v9 = &stru_1EFF11268;
    }
    [(ECAuthenticatableAccount *)v5 password];
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_INFO, "NTLM - respond to server challenge; user = %@; domain = %@",
        buf,
        0x16u);
    }
    int ClientResponse = NtlmCreateClientResponse();
  }
  else
  {
    if (objc_msgSend(a3, "length", a3))
    {
      v12 = MFLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_INFO, "*** Unexpected server response during NTLM authentication", buf, 2u);
      }
    }
    int v13 = NtlmGeneratorCreate();
    int *p_ntlmError = v13;
    if (v13) {
      goto LABEL_19;
    }
    int ClientResponse = NtlmCreateClientRequest();
  }
  int *p_ntlmError = ClientResponse;
  if (ClientResponse)
  {
LABEL_19:
    v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_MFNTLMAuthenticator responseForServerData:](p_ntlmError, v14);
    }
  }
  return 0;
}

- (void)responseForServerData:(int *)a1 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "*** Error %ld occurred during NTLM authentication", (uint8_t *)&v3, 0xCu);
}

@end