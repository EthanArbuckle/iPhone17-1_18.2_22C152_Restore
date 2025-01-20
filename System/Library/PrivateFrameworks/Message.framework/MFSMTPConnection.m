@interface MFSMTPConnection
+ (OS_os_log)log;
- (BOOL)_connectUsingAccount:(id)a3;
- (BOOL)_hasParameter:(id)a3 forKeyword:(id)a4;
- (BOOL)_supportsExtension:(id)a3;
- (BOOL)_supportsSaveSentExtension;
- (BOOL)authenticateUsingAccount:(id)a3;
- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4;
- (BOOL)connectUsingAccount:(id)a3;
- (BOOL)supportsChunking;
- (BOOL)supportsEnhancedStatusCodes;
- (BOOL)supportsOutboxCopy;
- (BOOL)supportsPipelining;
- (BOOL)supportsSMTPUTF8;
- (MFSMTPConnection)init;
- (const)_trailerForMailFromWithEmailAddressFormatStyle:(int64_t)a3;
- (id)_dataForCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6;
- (id)authenticationMechanisms;
- (id)dataForDataCmd;
- (id)dataForMailFrom:(id)a3 emailFormatStyle:(int64_t)a4;
- (id)dataForRcptTo:(id)a3;
- (id)domainName;
- (id)lastResponse;
- (id)lastResponseLine;
- (int64_t)mailFrom:(id)a3 recipients:(id)a4 withData:(id)a5 host:(id)a6 emailFormatStyle:(int64_t)a7 errorTitle:(id *)a8 errorMessage:(id *)a9 serverResponse:(id *)a10 displayError:(BOOL *)a11 errorCode:(int *)a12 errorUserInfo:(id *)a13;
- (int64_t)timeLastCommandWasSent;
- (unint64_t)_doHandshakeUsingAccount:(id)a3;
- (unint64_t)_getReply;
- (unint64_t)_readResponseRange:(_NSRange *)a3 isContinuation:(BOOL *)a4;
- (unint64_t)_sendBytes:(const char *)a3 length:(unint64_t)a4 progressHandler:(id)a5;
- (unint64_t)_sendCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6;
- (unint64_t)_sendData:(id)a3;
- (unint64_t)_sendData:(id)a3 progressHandler:(id)a4;
- (unint64_t)mailFrom:(id)a3 emailFormatStyle:(int64_t)a4;
- (unint64_t)maximumMessageBytes;
- (unint64_t)noop;
- (unint64_t)quit;
- (unint64_t)rcptTo:(id)a3;
- (unint64_t)sendBData:(id)a3;
- (unint64_t)sendData:(id)a3;
- (unint64_t)state;
- (void)_setLastResponse:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDomainName:(id)a3;
@end

@implementation MFSMTPConnection

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__MFSMTPConnection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_33 != -1) {
    dispatch_once(&log_onceToken_33, block);
  }
  v2 = (void *)log_log_33;
  return (OS_os_log *)v2;
}

void __23__MFSMTPConnection_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_33;
  log_log_33 = (uint64_t)v1;
}

- (MFSMTPConnection)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFSMTPConnection;
  v2 = [(MFConnection *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F73540]) initWithCapacity:128];
    mdata = v2->_mdata;
    v2->_mdata = (NSMutableData *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  unint64_t v2 = [(MFSMTPResponse *)self->_lastResponse status];
  if (v2 > 0x257) {
    return 6;
  }
  else {
    return *(void *)((char *)&unk_1A8AC66E8
  }
                     + ((2 * (((v2 >> 2) * (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64)) & 0x1FFFFFFFFFFFFFF8));
}

- (id)lastResponse
{
  unint64_t v2 = (void *)[(MFSMTPResponse *)self->_lastResponse copy];
  return v2;
}

- (id)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  domainName = self->_domainName;
  self->_domainName = v4;
}

- (BOOL)supportsOutboxCopy
{
  if ([(MFSMTPConnection *)self _hasParameter:0 forKeyword:@"X-AOL-OUTBOX-COPY"]) {
    return 1;
  }
  return [(MFSMTPConnection *)self _supportsSaveSentExtension];
}

- (BOOL)supportsPipelining
{
  return [(MFSMTPConnection *)self _supportsExtension:@"PIPELINING"];
}

- (BOOL)supportsSMTPUTF8
{
  return [(MFSMTPConnection *)self _supportsExtension:@"SMTPUTF8"];
}

- (BOOL)supportsEnhancedStatusCodes
{
  return [(MFSMTPConnection *)self _supportsExtension:@"ENHANCEDSTATUSCODES"];
}

- (BOOL)supportsChunking
{
  int v2 = [(MFSMTPConnection *)self _supportsExtension:@"CHUNKING"];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v4 = [v3 BOOLForKey:@"DisableCHUNKING"];

    LOBYTE(v2) = v4 ^ 1;
  }
  return v2;
}

- (unint64_t)maximumMessageBytes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NSMutableArray *)self->_serviceExtensions count];
  if (!v3)
  {
    id v6 = 0;
LABEL_16:
    unint64_t v9 = 0;
    goto LABEL_17;
  }
  unint64_t v4 = 1;
  do
  {
    v5 = [(NSMutableArray *)self->_serviceExtensions objectAtIndex:v4 - 1];
    if ([v5 caseInsensitiveCompare:@"SIZE"])
    {
      id v6 = 0;
    }
    else
    {
      objc_super v7 = [(NSMutableArray *)self->_serviceExtensions objectAtIndex:v4];
      if ([v7 count])
      {
        id v6 = [v7 objectAtIndex:0];
      }
      else
      {
        id v6 = 0;
      }
    }
    v4 += 2;
  }
  while (v4 <= v3 && !v6);
  if (!v6) {
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  memset(__str, 170, 21);
  uint64_t v8 = [v6 length];
  v11 = &v12;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  if (v8 != MFStringGetBytes()) {
    goto LABEL_16;
  }
  __str[v12] = 0;
  unint64_t v9 = strtoull(__str, 0, 10);
LABEL_17:

  return v9;
}

- (id)authenticationMechanisms
{
  uint64_t v3 = [(NSMutableArray *)self->_serviceExtensions count];
  if (v3)
  {
    unint64_t v4 = v3;
    v5 = 0;
    for (unint64_t i = 1; i <= v4; i += 2)
    {
      objc_super v7 = [(NSMutableArray *)self->_serviceExtensions objectAtIndex:i - 1];
      if (![v7 caseInsensitiveCompare:@"AUTH"])
      {
        uint64_t v8 = [(NSMutableArray *)self->_serviceExtensions objectAtIndex:i];
        if ([v8 count])
        {
          if (v5) {
            [v5 addObjectsFromArray:v8];
          }
          else {
            v5 = (void *)[v8 mutableCopyWithZone:0];
          }
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)authenticateUsingAccount:(id)a3
{
  id v4 = a3;
  v5 = [v4 preferredAuthScheme];

  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)MFSMTPConnection;
    BOOL v6 = [(MFConnection *)&v8 authenticateUsingAccount:v4];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27 = [v7 saslName];
  int v28 = [v7 usesBase64EncodeResponseData];
  [v7 setAuthenticationState:1];
  objc_super v8 = [v7 responseForServerData:0];
  self->_hideLoggedData = [v7 justSentPlainTextPassword];
  if (v8)
  {
    if (v28)
    {
      uint64_t v9 = objc_msgSend(v8, "mf_encodeBase64WithoutLineBreaks");

      objc_super v8 = (void *)v9;
    }
    v10 = (void *)[v27 mutableCopyWithZone:0];
    v11 = (void *)MFCreateStringWithData();
    [v10 appendString:@" "];
    [v10 appendString:v11];
    unint64_t v12 = [(MFSMTPConnection *)self _sendCommand:"AUTH " length:5 argument:v10 trailer:0];
  }
  else
  {
    unint64_t v12 = [(MFSMTPConnection *)self _sendCommand:"AUTH " length:5 argument:v27 trailer:0];
  }
  if (v12 == 2) {
    unint64_t v12 = [(MFSMTPConnection *)self _getReply];
  }
  else {
    [v7 setAuthenticationState:3];
  }
  *(void *)&long long v13 = 134218242;
  long long v26 = v13;
  while (objc_msgSend(v7, "authenticationState", v26) == 1)
  {
    if (v12 - 4 < 2)
    {
      v15 = [v6 errorForResponse:self->_lastResponse];
      v16 = [(MFSMTPConnection *)self lastResponseLine];
      [v15 setMoreInfo:v16];

      v17 = +[MFActivityMonitor currentMonitor];
      [v17 setError:v15];

      [v7 setAuthenticationState:2];
      goto LABEL_32;
    }
    if (v12 == 2)
    {
      [v7 setAuthenticationState:4];
    }
    else if (v12 == 3)
    {
      v15 = [(MFSMTPResponse *)self->_lastResponse lastResponseLine];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v15;
      }
      else
      {
        id v19 = [MEMORY[0x1E4F1C9B8] data];
      }
      v20 = v19;
      if (v28)
      {
        uint64_t v21 = objc_msgSend(v19, "mf_decodeBase64");

        v20 = (void *)v21;
      }
      id v22 = [v7 responseForServerData:v20];
      self->_hideLoggedData = [v7 justSentPlainTextPassword];
      if (v22)
      {
        if (v28)
        {
          uint64_t v23 = objc_msgSend(v22, "mf_encodeBase64WithoutLineBreaks");

          id v22 = (id)v23;
        }
        id v22 = v22;
        unint64_t v12 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", [v22 bytes], objc_msgSend(v22, "length"), 0, 0);
        if (v12 == 2) {
          unint64_t v12 = [(MFSMTPConnection *)self _getReply];
        }
        else {
          [v7 setAuthenticationState:3];
        }
      }
      else
      {
        [v7 setAuthenticationState:2];
        unint64_t v12 = 3;
      }

LABEL_32:
    }
    else
    {
      uint64_t v14 = +[MFSMTPConnection log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = [v6 parentAccountIdentifier];
        *(_DWORD *)buf = v26;
        v30 = self;
        __int16 v31 = 2114;
        v32 = v18;
        _os_log_error_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_ERROR, "MFSMTPConnection[%p]: Unexpected response during authentication for SMTP account %{public}@", buf, 0x16u);
      }
      [v7 setAuthenticationState:3];
    }
  }
  self->_hideLoggedData = 0;
  BOOL v24 = [v7 authenticationState] == 4;

  return v24;
}

- (BOOL)connectUsingAccount:(id)a3
{
  id v4 = a3;
  if (![(MFSMTPConnection *)self _connectUsingAccount:v4]
    || [(MFSMTPConnection *)self _doHandshakeUsingAccount:v4] != 2)
  {
    goto LABEL_16;
  }
  if (![v4 usesSSL]
    || ([(MFNWConnectionWrapper *)self->super._socket securityProtocol],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:*MEMORY[0x1E4F1D4C0]],
        v5,
        !v6))
  {
    BOOL v9 = 1;
    goto LABEL_17;
  }
  if (![(MFSMTPConnection *)self _hasParameter:0 forKeyword:@"STARTTLS"])
  {
    v10 = NSString;
    v11 = MFLookupLocalizedString(@"FAILED_SEND_SSL_NEEDED", @"Check the SSL setting for the outgoing server “%@”.", @"Delayed");
    unint64_t v12 = [v4 hostname];
    long long v13 = objc_msgSend(v10, "stringWithFormat:", v11, v12);

    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v13 forKey:@"UserFriendlyErrorDescription"];
    v15 = +[MFActivityMonitor currentMonitor];
    v16 = MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed");
    v17 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1034 localizedDescription:v13 title:v16 userInfo:v14];
    [v15 setError:v17];
LABEL_15:

LABEL_16:
    BOOL v9 = 0;
    goto LABEL_17;
  }
  if ([(MFSMTPConnection *)self _sendCommand:"STARTTLS" length:8 argument:0 trailer:0] != 2|| [(MFSMTPConnection *)self _getReply] != 2)
  {
    v18 = NSString;
    id v19 = MFLookupLocalizedString(@"FAILED_SEND_SSL_NEEDED", @"Check the SSL setting for the outgoing server “%@”.", @"Delayed");
    v20 = [v4 hostname];
    long long v13 = objc_msgSend(v18, "stringWithFormat:", v19, v20);

    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v13 forKey:@"UserFriendlyErrorDescription"];
    v15 = +[MFActivityMonitor currentMonitor];
    v16 = MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed");
    v17 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1033 localizedDescription:v13 title:v16 userInfo:v14];
    [v15 setError:v17];
    goto LABEL_15;
  }
  id v7 = [v4 clientCertificates];
  if (v7) {
    [(MFNWConnectionWrapper *)self->super._socket setClientCertificates:v7];
  }
  BOOL v8 = [(MFConnection *)self enableSSL];

  if (!v8) {
    goto LABEL_16;
  }
  BOOL v9 = [(MFSMTPConnection *)self _doHandshakeUsingAccount:v4] == 2;
LABEL_17:

  return v9;
}

- (unint64_t)rcptTo:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MFSMTPConnection *)self _sendCommand:"RCPT TO:<" length:9 argument:v4 trailer:">"];
  if (v5 == 2) {
    unint64_t v5 = [(MFSMTPConnection *)self _getReply];
  }

  return v5;
}

- (unint64_t)noop
{
  unint64_t result = [(MFSMTPConnection *)self _sendCommand:"NOOP" length:4 argument:0 trailer:0];
  if (result == 2)
  {
    return [(MFSMTPConnection *)self _getReply];
  }
  return result;
}

- (unint64_t)sendBData:(id)a3
{
  id v4 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 5;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = [v4 length];
  unint64_t v30 = [v4 numberOfNewlinesNeedingConversion:0] + v5;
  int originalSocketTimeout = self->_originalSocketTimeout;
  if (originalSocketTimeout >= 1)
  {
    if (originalSocketTimeout <= 180) {
      uint64_t v7 = 180;
    }
    else {
      uint64_t v7 = originalSocketTimeout;
    }
    [(MFNWConnectionWrapper *)self->super._socket setTimeout:v7];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F28E78]);
  BOOL v9 = objc_msgSend(v8, "initWithFormat:", @"BDAT %lu LAST\r\n", v28[3]);
  v10 = [v9 dataUsingEncoding:4];
  BOOL v11 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", v10, 0x7FFFFFFFFFFFFFFFLL, 0);

  if (v11)
  {
    unint64_t v12 = v28[3] / 0x50uLL;
    if (v12 <= 0x2000) {
      unint64_t v12 = 0x2000;
    }
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v26[3] = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __30__MFSMTPConnection_sendBData___block_invoke;
    aBlock[3] = &unk_1E5D40920;
    aBlock[4] = self;
    aBlock[5] = v26;
    aBlock[6] = &v27;
    aBlock[7] = v12;
    long long v13 = _Block_copy(aBlock);
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F73540]) initWithCapacity:0x10000];
    v32[3] = 2;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __30__MFSMTPConnection_sendBData___block_invoke_2;
    v20[3] = &unk_1E5D40948;
    id v15 = v14;
    BOOL v24 = &v31;
    id v21 = v15;
    id v22 = self;
    id v16 = v13;
    id v23 = v16;
    [v4 enumerateConvertingNewlinesUsingBlock:v20];
    if (v32[3] == 2)
    {
      unint64_t v17 = [(MFSMTPConnection *)self _sendData:v15 progressHandler:v16];
      v32[3] = v17;
    }

    _Block_object_dispose(v26, 8);
  }
  unint64_t v18 = v32[3];
  if (v18 == 2)
  {
    [(MFSMTPConnection *)self _getReply];
    unint64_t v18 = [(MFSMTPConnection *)self state];
    v32[3] = v18;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v18;
}

uint64_t __30__MFSMTPConnection_sendBData___block_invoke(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) += a2;
  double v3 = (double)*(unint64_t *)(*(void *)(a1[5] + 8) + 24)
     / (double)*(unint64_t *)(*(void *)(a1[6] + 8) + 24)
     * 0.800000012;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained setPercentDone:v3 + 0.200000003];

  return a1[7];
}

BOOL __30__MFSMTPConnection_sendBData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)[*(id *)(a1 + 32) length] >= 0x10000)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) _sendData:*(void *)(a1 + 32) progressHandler:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setLength:0];
  }
  return *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 2;
}

- (unint64_t)sendData:(id)a3
{
  id v4 = a3;
  int originalSocketTimeout = self->_originalSocketTimeout;
  if (originalSocketTimeout >= 1)
  {
    if (originalSocketTimeout <= 120) {
      uint64_t v6 = 120;
    }
    else {
      uint64_t v6 = originalSocketTimeout;
    }
    [(MFNWConnectionWrapper *)self->super._socket setTimeout:v6];
  }
  uint64_t v7 = +[MFActivityMonitor currentMonitor];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  unint64_t v8 = ([v4 length] / 0x14uLL) & 0xFFFFFFFFFFFE000;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __29__MFSMTPConnection_sendData___block_invoke;
  aBlock[3] = &unk_1E5D40970;
  uint64_t v27 = v29;
  id v9 = v4;
  id v25 = v9;
  long long v26 = self;
  unint64_t v28 = v8;
  v10 = _Block_copy(aBlock);
  [(NSMutableData *)self->_mdata setLength:0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __29__MFSMTPConnection_sendData___block_invoke_2;
  v19[3] = &unk_1E5D40998;
  v19[4] = self;
  id v11 = v7;
  id v20 = v11;
  id v22 = &v30;
  id v23 = v29;
  id v12 = v10;
  id v21 = v12;
  [v9 enumerateConvertingNewlinesUsingBlock:v19];
  if (!*((unsigned char *)v31 + 24))
  {
    int v13 = self->_originalSocketTimeout;
    if (v13 >= 1)
    {
      if (v13 <= 600) {
        uint64_t v14 = 600;
      }
      else {
        uint64_t v14 = v13;
      }
      [(MFNWConnectionWrapper *)self->super._socket setTimeout:v14];
    }
    [(MFSMTPConnection *)self _getReply];
    int v15 = self->_originalSocketTimeout;
    if (v15 >= 1)
    {
      if (v15 <= 300) {
        uint64_t v16 = 300;
      }
      else {
        uint64_t v16 = v15;
      }
      [(MFNWConnectionWrapper *)self->super._socket setTimeout:v16];
    }
  }
  unint64_t v17 = [(MFSMTPConnection *)self state];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v30, 8);

  return v17;
}

uint64_t __29__MFSMTPConnection_sendData___block_invoke(uint64_t a1)
{
  float v2 = (float)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) * 0.8;
  double v3 = (float)(v2 / (float)(unint64_t)[*(id *)(a1 + 32) length]);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 168));
  [WeakRetained setPercentDone:v3 + 0.200000003];

  return *(void *)(a1 + 56);
}

BOOL __29__MFSMTPConnection_sendData___block_invoke_2(uint64_t a1, unsigned char *a2, uint64_t a3, int a4, int a5)
{
  if (*a2 == 46) {
    [*(id *)(*(void *)(a1 + 32) + 136) appendBytes:a2 length:1];
  }
  [*(id *)(*(void *)(a1 + 32) + 136) appendBytes:a2 length:a3];
  if (a5 && (a4 & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 136) appendBytes:"\r\n" length:2];
  }
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 136) length] >> 13) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = a5 == 0;
  }
  if (!v10)
  {
    if ([*(id *)(a1 + 40) shouldCancel])
    {
      [*(id *)(*(void *)(a1 + 32) + 120) setStatus:550];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      [*(id *)(a1 + 32) disconnect];
    }
    else
    {
      if (a5)
      {
        [*(id *)(*(void *)(a1 + 32) + 136) appendBytes:"." length:1];
        [*(id *)(*(void *)(a1 + 32) + 136) appendBytes:"\r\n" length:2];
      }
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += a3;
      if (a4) {
        --*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _sendData:*(void *)(*(void *)(a1 + 32) + 136) progressHandler:*(void *)(a1 + 48)] != 2;
    }
    [*(id *)(*(void *)(a1 + 32) + 136) setLength:0];
  }
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0;
}

- (unint64_t)quit
{
  unint64_t v3 = [(MFSMTPConnection *)self _sendCommand:"QUIT" length:4 argument:0 trailer:0];
  if (v3 == 2) {
    [(MFConnection *)self disconnect];
  }
  return v3;
}

- (const)_trailerForMailFromWithEmailAddressFormatStyle:(int64_t)a3
{
  if (a3) {
    return ">";
  }
  else {
    return "> SMTPUTF8";
  }
}

- (unint64_t)mailFrom:(id)a3 emailFormatStyle:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(MFSMTPConnection *)self _sendCommand:"MAIL FROM:<" length:11 argument:v6 trailer:[(MFSMTPConnection *)self _trailerForMailFromWithEmailAddressFormatStyle:a4]];
  if (v7 == 2) {
    unint64_t v7 = [(MFSMTPConnection *)self _getReply];
  }

  return v7;
}

- (id)dataForMailFrom:(id)a3 emailFormatStyle:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(MFSMTPConnection *)self _dataForCommand:"MAIL FROM:<" length:11 argument:v6 trailer:[(MFSMTPConnection *)self _trailerForMailFromWithEmailAddressFormatStyle:a4]];

  return v7;
}

- (id)dataForRcptTo:(id)a3
{
  unint64_t v3 = [(MFSMTPConnection *)self _dataForCommand:"RCPT TO:<" length:9 argument:a3 trailer:">"];
  return v3;
}

- (id)dataForDataCmd
{
  return [(MFSMTPConnection *)self _dataForCommand:"DATA" length:4 argument:0 trailer:0];
}

- (int64_t)mailFrom:(id)a3 recipients:(id)a4 withData:(id)a5 host:(id)a6 emailFormatStyle:(int64_t)a7 errorTitle:(id *)a8 errorMessage:(id *)a9 serverResponse:(id *)a10 displayError:(BOOL *)a11 errorCode:(int *)a12 errorUserInfo:(id *)a13
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v91 = a5;
  id v89 = a6;
  v90 = +[MFActivityMonitor currentMonitor];
  if (a11) {
    *a11 = 0;
  }
  BOOL v96 = [(MFSMTPConnection *)self supportsChunking];
  v86 = (void *)[objc_alloc(MEMORY[0x1E4F60808]) initWithStyle:a7];
  v95 = [v86 stringFromEmailAddressConvertible:v18];

  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __147__MFSMTPConnection_mailFrom_recipients_withData_host_emailFormatStyle_errorTitle_errorMessage_serverResponse_displayError_errorCode_errorUserInfo___block_invoke;
  v106[3] = &unk_1E5D3BDC0;
  id v88 = v86;
  id v107 = v88;
  v92 = objc_msgSend(v19, "ef_map:", v106);

  if ([(MFSMTPConnection *)self supportsPipelining])
  {
    [(NSMutableData *)self->_mdata setLength:0];
    mdata = self->_mdata;
    id v21 = [(MFSMTPConnection *)self dataForMailFrom:v95 emailFormatStyle:a7];
    [(NSMutableData *)mdata appendData:v21];

    long long v104 = 0u;
    long long v105 = 0u;
    if (v96) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = 2;
    }
    long long v102 = 0uLL;
    long long v103 = 0uLL;
    id v23 = v92;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v102 objects:v115 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v103 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = self->_mdata;
          unint64_t v28 = [(MFSMTPConnection *)self dataForRcptTo:*(void *)(*((void *)&v102 + 1) + 8 * i)];
          [(NSMutableData *)v27 appendData:v28];
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v102 objects:v115 count:16];
      }
      while (v24);
    }

    uint64_t v29 = [v23 count];
    if (!v96)
    {
      uint64_t v30 = self->_mdata;
      uint64_t v31 = [(MFSMTPConnection *)self dataForDataCmd];
      [(NSMutableData *)v30 appendData:v31];
    }
    [(MFSMTPConnection *)self _sendData:self->_mdata];
    uint64_t v32 = v29 + v22;
    if (v32)
    {
      uint64_t v33 = 0;
      int64_t v34 = 0;
      uint64_t v93 = *MEMORY[0x1E4F60D00];
      char v35 = 1;
      do
      {
        unint64_t v36 = [(MFSMTPConnection *)self _getReply];
        if ((v35 & ((v36 & 0xFFFFFFFFFFFFFFFELL) != 2)) == 1)
        {
          if (v33)
          {
            char v37 = v96;
            if (v32 - 1 != v33) {
              char v37 = 1;
            }
            if (v37)
            {
              if (a11) {
                *a11 = 1;
              }
              *a12 = 1049;
              lastResponse = self->_lastResponse;
              v39 = [v23 objectAtIndex:v33 - 1];
              v40 = MFLookupLocalizedString(@"SMTP_1_BAD_RECIPIENT", @"The recipient “%@” was rejected by the server.", @"Delayed");
              *a9 = [(MFSMTPResponse *)lastResponse errorMessageWithAddress:v39 defaultMessage:v40];
            }
            else
            {
              v42 = self->_lastResponse;
              v39 = MFLookupLocalizedString(@"SMTP_SENDING_CONTENT_FAILED", @"Sending the message content to the server failed.", @"Delayed");
              *a9 = [(MFSMTPResponse *)v42 errorMessageWithAddress:0 defaultMessage:v39];
            }
          }
          else
          {
            *a12 = 1047;
            v41 = self->_lastResponse;
            v39 = MFLookupLocalizedString(@"SMTP_INVALID_SENDER_ADDRESS", @"The sender address “%@” was rejected by the server.", @"Delayed");
            *a9 = [(MFSMTPResponse *)v41 errorMessageWithAddress:v95 defaultMessage:v39];
          }

          *a10 = [(MFSMTPConnection *)self lastResponseLine];
          if (a13)
          {
            uint64_t v113 = v93;
            v111 = @"MFSMTPFailureReason";
            v43 = MFMFSMTPFailureReasonString([(MFSMTPResponse *)self->_lastResponse failureReason]);
            v112 = v43;
            v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
            v114 = v44;
            *a13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
          }
          char v35 = 0;
          int64_t v34 = 1;
        }
        ++v33;
      }
      while (v32 != v33);
      char v45 = v96;
      if (v36 == 3) {
        char v45 = 1;
      }
      if ((v35 & 1) == 0) {
        goto LABEL_83;
      }
    }
    else
    {
      int64_t v34 = 0;
      char v45 = v96;
    }
    if ((v45 & 1) == 0) {
      goto LABEL_83;
    }
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    [WeakRetained setPercentDone:0.2];

    unint64_t v68 = v96
        ? [(MFSMTPConnection *)self sendBData:v91]
        : [(MFSMTPConnection *)self sendData:v91];
    unint64_t v69 = v68;
    if (v68 == 2) {
      goto LABEL_83;
    }
    if ([v90 shouldCancel])
    {
LABEL_70:
      int64_t v34 = 4;
      goto LABEL_83;
    }
    if (v69 == 4)
    {
      v77 = self->_lastResponse;
      v78 = MFLookupLocalizedString(@"SMTP_SENDING_CONTENT_LATER", @"Mail will try to send the message again later.", @"Delayed");
      v79 = [(MFSMTPResponse *)v77 errorMessageWithAddress:v95 defaultMessage:v78];
      int64_t v34 = 2;
    }
    else
    {
      if (v69 == 5) {
        int64_t v34 = 7;
      }
      else {
        int64_t v34 = 1;
      }
      v80 = self->_lastResponse;
      v78 = MFLookupLocalizedString(@"SMTP_SENDING_CONTENT_FAILED", @"Sending the message content to the server failed.", @"Delayed");
      v79 = [(MFSMTPResponse *)v80 errorMessageWithAddress:v95 defaultMessage:v78];
    }
    *a9 = v79;

    id v81 = [(MFSMTPConnection *)self lastResponseLine];
LABEL_99:
    *a10 = v81;
    goto LABEL_83;
  }
  if ([(MFSMTPConnection *)self mailFrom:v95 emailFormatStyle:a7] != 2)
  {
    *a12 = 1047;
    v64 = self->_lastResponse;
    v65 = MFLookupLocalizedString(@"SMTP_INVALID_SENDER_ADDRESS", @"The sender address “%@” was rejected by the server.", @"Delayed");
    *a9 = [(MFSMTPResponse *)v64 errorMessageWithAddress:v95 defaultMessage:v65];

    id v66 = [(MFSMTPConnection *)self lastResponseLine];
    goto LABEL_62;
  }
  p_delegate = &self->_delegate;
  id v47 = objc_loadWeakRetained(&self->_delegate);
  [v47 setPercentDone:0.15];

  unint64_t v48 = [v92 count];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v49 = v92;
  v50 = 0;
  int v51 = 0;
  unint64_t v52 = 0;
  uint64_t v53 = [v49 countByEnumeratingWithState:&v97 objects:v110 count:16];
  if (!v53) {
    goto LABEL_53;
  }
  uint64_t v54 = *(void *)v98;
  double v55 = (float)(0.05 / (float)v48);
  double v56 = 0.150000006;
  id v94 = v49;
  do
  {
    for (uint64_t j = 0; j != v53; ++j)
    {
      if (*(void *)v98 != v54) {
        objc_enumerationMutation(v49);
      }
      unint64_t v101 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v101 = *(void *)(*((void *)&v97 + 1) + 8 * j);
      if (-[MFSMTPConnection rcptTo:](self, "rcptTo:") == 2)
      {
        v58 = objc_loadWeakRetained(p_delegate);
        double v56 = v56 + v55;
        [v58 setPercentDone:v56];
        ++v51;
        goto LABEL_51;
      }
      if (v50)
      {
        [v50 addObject:v101];
        if (v52) {
          goto LABEL_49;
        }
      }
      else
      {
        v50 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) initWithObjects:&v101 count:1];
        if (v52) {
          goto LABEL_49;
        }
      }
      unint64_t v52 = [(MFSMTPResponse *)self->_lastResponse status];
      *a10 = [(MFSMTPConnection *)self lastResponseLine];
LABEL_49:
      v58 = +[MFSMTPConnection log];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        unint64_t v59 = v101;
        v60 = [(MFSMTPConnection *)self lastResponseLine];
        *(_DWORD *)buf = 138412546;
        *(void *)v109 = v59;
        *(_WORD *)&v109[8] = 2112;
        *(void *)&v109[10] = v60;
        _os_log_error_impl(&dword_1A7EFF000, v58, OS_LOG_TYPE_ERROR, "SMTP error for recipient %@: %@", buf, 0x16u);

        p_delegate = &self->_delegate;
        id v49 = v94;
      }
LABEL_51:
    }
    uint64_t v53 = [v49 countByEnumeratingWithState:&v97 objects:v110 count:16];
  }
  while (v53);
LABEL_53:

  v61 = +[MFSMTPConnection log];
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v109 = v51;
    *(_WORD *)&v109[4] = 2112;
    *(void *)&v109[6] = v50;
    _os_log_impl(&dword_1A7EFF000, v61, OS_LOG_TYPE_DEFAULT, "SMTP delivery:%d valid recipients; invalid recipients = %@",
      buf,
      0x12u);
  }

  if (!v52)
  {

    if (v96)
    {
      unint64_t v70 = [(MFSMTPConnection *)self sendBData:v91];
LABEL_73:
      unint64_t v71 = v70;
      if (v70 == 2)
      {
        int64_t v34 = 0;
        goto LABEL_83;
      }
      if ([v90 shouldCancel]) {
        goto LABEL_70;
      }
      if (v71 == 4)
      {
        v82 = self->_lastResponse;
        v83 = MFLookupLocalizedString(@"SMTP_SENDING_CONTENT_LATER", @"Mail will try to send the message again later.", @"Delayed");
        v84 = [(MFSMTPResponse *)v82 errorMessageWithAddress:v95 defaultMessage:v83];
        int64_t v34 = 2;
      }
      else
      {
        if (v71 == 5) {
          int64_t v34 = 7;
        }
        else {
          int64_t v34 = 1;
        }
        v85 = self->_lastResponse;
        v83 = MFLookupLocalizedString(@"SMTP_SENDING_CONTENT_FAILED", @"Sending the message content to the server failed.", @"Delayed");
        v84 = [(MFSMTPResponse *)v85 errorMessageWithAddress:v95 defaultMessage:v83];
      }
      *a9 = v84;

      id v81 = [(MFSMTPConnection *)self lastResponseLine];
      goto LABEL_99;
    }
    if ([(MFSMTPConnection *)self _sendCommand:"DATA" length:4 argument:0 trailer:0] == 2&& [(MFSMTPConnection *)self _getReply] == 3)
    {
      unint64_t v70 = [(MFSMTPConnection *)self sendData:v91];
      goto LABEL_73;
    }
    [(MFSMTPResponse *)self->_lastResponse setStatus:550];
    v75 = self->_lastResponse;
    v76 = MFLookupLocalizedString(@"SMTP_SENDING_CONTENT_FAILED", @"Sending the message content to the server failed.", @"Delayed");
    *a9 = [(MFSMTPResponse *)v75 errorMessageWithAddress:0 defaultMessage:v76];

    id v66 = [(MFSMTPConnection *)self lastResponseLine];
LABEL_62:
    *a10 = v66;
    goto LABEL_82;
  }
  if ([v50 count])
  {
    if (a11) {
      *a11 = 1;
    }
    *a12 = 1049;
    v62 = self->_lastResponse;
    v63 = [v50 lastObject];
    if ((unint64_t)[v50 count] < 2) {
      MFLookupLocalizedString(@"SMTP_1_BAD_RECIPIENT", @"The recipient “%@” was rejected by the server.", @"Delayed");
    }
    else {
    v73 = MFLookupLocalizedString(@"SMTP_BAD_RECIPIENTS", @"The recipients were rejected by the server.", @"Delayed");
    }
    *a9 = [(MFSMTPResponse *)v62 errorMessageWithAddress:v63 defaultMessage:v73];
  }
  else
  {
    *a12 = 1049;
    v72 = self->_lastResponse;
    v63 = MFLookupLocalizedString(@"SMTP_RECIPIENTS_UNRECOGNIZED", @"Verify that you have addressed this message correctly. Check your SMTP server settings in Mail Preferences and verify any advanced settings with your system administrator.", @"Delayed");
    *a9 = [(MFSMTPResponse *)v72 errorMessageWithAddress:0 defaultMessage:v63];
  }

LABEL_82:
  int64_t v34 = 1;
LABEL_83:
  if (*a9 && !*a8)
  {
    MFLookupLocalizedString(@"SMTP_SENDING_FAILED_TITLE", @"Unable to Send Email", @"Delayed");
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v34;
}

id __147__MFSMTPConnection_mailFrom_recipients_withData_host_emailFormatStyle_errorTitle_errorMessage_serverResponse_displayError_errorCode_errorUserInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  float v2 = [*(id *)(a1 + 32) stringFromEmailAddressConvertible:a2];
  return v2;
}

- (int64_t)timeLastCommandWasSent
{
  return self->_lastCommandTimestamp;
}

- (unint64_t)_sendBytes:(const char *)a3 length:(unint64_t)a4 progressHandler:(id)a5
{
  id v8 = a5;
  id v9 = (uint64_t (**)(void, void))v8;
  unint64_t v10 = a4;
  if (v8)
  {
    unint64_t v11 = (*((uint64_t (**)(id, void))v8 + 2))(v8, 0);
    if (v11 >= a4 || v11 == 0) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = v11;
    }
  }
  if (a4)
  {
    unint64_t v13 = 4;
    while (1)
    {
      uint64_t v14 = self->_hideLoggedData ? 0 : 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v15 = self->_hideLoggedData ? v10 : 0;
      if (!-[MFConnection writeBytes:length:dontLogBytesInRange:](self, "writeBytes:length:dontLogBytesInRange:", a3, v10, v14, v15))break; {
      a4 -= v10;
      }
      if (v9)
      {
        unint64_t v16 = v9[2](v9, v10);
        if (v16 >= a4) {
          unint64_t v17 = a4;
        }
        else {
          unint64_t v17 = v16;
        }
        if (!v16) {
          unint64_t v17 = a4;
        }
      }
      else if (v10 >= a4)
      {
        unint64_t v17 = a4;
      }
      else
      {
        unint64_t v17 = v10;
      }
      a3 += v10;
      unint64_t v10 = v17;
      if (!a4) {
        goto LABEL_28;
      }
    }
  }
  else
  {
LABEL_28:
    unint64_t v13 = 2;
  }
  [(MFSMTPConnection *)self _setLastResponse:0];

  return v13;
}

- (unint64_t)_sendData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[MFSMTPConnection _sendBytes:length:progressHandler:](self, "_sendBytes:length:progressHandler:", [v4 bytes], objc_msgSend(v4, "length"), 0);

  return v5;
}

- (unint64_t)_sendData:(id)a3 progressHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  unint64_t v9 = -[MFSMTPConnection _sendBytes:length:progressHandler:](self, "_sendBytes:length:progressHandler:", [v8 bytes], objc_msgSend(v8, "length"), v7);

  return v9;
}

- (id)_dataForCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6
{
  id v9 = a5;
  unint64_t v10 = [MEMORY[0x1E4F73540] data];
  unint64_t v11 = v10;
  if (a3) {
    [v10 appendBytes:a3 length:a4];
  }
  id v12 = [v9 precomposedStringWithCanonicalMapping];
  uint64_t v13 = [v12 UTF8String];

  if (v13) {
    objc_msgSend(v11, "mf_appendCString:", v13);
  }
  if (a6) {
    [v11 appendBytes:a6 length:strlen(a6)];
  }
  [v11 appendBytes:"\r\n" length:2];

  return v11;
}

- (unint64_t)_sendCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6
{
  id v10 = a5;
  self->_lastCommandTimestamp = time(0);
  [(NSMutableData *)self->_mdata setLength:0];
  mdata = self->_mdata;
  id v12 = [(MFSMTPConnection *)self _dataForCommand:a3 length:a4 argument:v10 trailer:a6];
  [(NSMutableData *)mdata appendData:v12];

  unint64_t v13 = [(MFSMTPConnection *)self _sendData:self->_mdata];
  return v13;
}

- (unint64_t)_getReply
{
  unint64_t v3 = 0;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  char v13 = 1;
  while (1)
  {
    unint64_t v4 = [(MFSMTPConnection *)self _readResponseRange:&v14 isContinuation:&v13];
    unint64_t v5 = v4 > 0x257
       ? 6
       : *(void *)((char *)&unk_1A8AC66E8
                   + ((2 * (((v4 >> 2) * (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64)) & 0x1FFFFFFFFFFFFFF8));
    id v6 = [[MFSMTPResponse alloc] initWithStatus:v4];
    id v7 = v6;
    if (v5 == 2)
    {
      [(MFSMTPResponse *)v6 setLastResponseLine:0];
    }
    else
    {
      if (v14 == 0x7FFFFFFFFFFFFFFFLL || !v15)
      {
        id v9 = [NSString alloc];
        id v10 = MFLookupLocalizedString(@"SMTP_GENERIC_ERROR_FORMAT", @"An error occurred while delivering this message via the SMTP server “%@”", @"Delayed");
        unint64_t v11 = [(MFNWConnectionWrapper *)self->super._socket remoteHostname];
        id v8 = objc_msgSend(v9, "initWithFormat:", v10, v11);

        [(MFSMTPResponse *)v7 setLastResponseLine:v8];
      }
      else
      {
        id v8 = -[NSMutableData subdataWithRange:](self->_mdata, "subdataWithRange:");
        [(MFSMTPResponse *)v7 setLastResponseLine:v8];
      }
    }
    if (!v13) {
      break;
    }
    if (v3) {
      [v3 addObject:v7];
    }
    else {
      unint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, 0);
    }

    if (!v13)
    {
      id v7 = 0;
      break;
    }
  }
  [(MFSMTPResponse *)v7 setContinuationResponses:v3];
  [(MFSMTPConnection *)self _setLastResponse:v7];

  return v5;
}

- (unint64_t)_readResponseRange:(_NSRange *)a3 isContinuation:(BOOL *)a4
{
  *a3 = (_NSRange)xmmword_1A8AC6500;
  [(NSMutableData *)self->_mdata setLength:0];
  if (![(MFConnection *)self readLineIntoData:self->_mdata])
  {
    LOBYTE(v16) = 0;
    unint64_t v21 = 0;
    if (!a4) {
      return v21;
    }
LABEL_12:
    *a4 = v16;
    return v21;
  }
  uint64_t v26 = [(NSMutableData *)self->_mdata bytes];
  NSUInteger v8 = [(NSMutableData *)self->_mdata length];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MFSMTPConnection__readResponseRange_isContinuation___block_invoke;
  block[3] = &unk_1E5D3C388;
  block[4] = self;
  void block[5] = a2;
  if (_readResponseRange_isContinuation__once != -1) {
    dispatch_once(&_readResponseRange_isContinuation__once, block);
  }
  uint64_t v25 = (void *)[[NSString alloc] initWithBytesNoCopy:v26 length:v8 encoding:1 freeWhenDone:0];
  id v9 = objc_msgSend((id)_readResponseRange_isContinuation___responseRegex, "firstMatchInString:options:range:", v25, 0, 0, v8);
  id v10 = v9;
  if (v9)
  {
    if ([v9 numberOfRanges] != 4) {
      __assert_rtn("-[MFSMTPConnection _readResponseRange:isContinuation:]", "MFSMTPConnection.m", 894, "[match numberOfRanges] == 4");
    }
    [v10 range];
    uint64_t v12 = v11;
    uint64_t v24 = [v10 rangeAtIndex:1];
    uint64_t v14 = v13;
    uint64_t v23 = [v10 rangeAtIndex:2];
    BOOL v16 = v15;
    uint64_t v17 = [v10 rangeAtIndex:3];
    if (v12 && v14 && (NSUInteger v19 = v17, v17 != 0x7FFFFFFFFFFFFFFFLL))
    {
      NSUInteger v20 = v18;
      unint64_t v21 = strtoul((const char *)(v26 + v24), 0, 10);
      if (v16) {
        LOBYTE(v16) = *(unsigned char *)(v26 + v23) == 45;
      }
    }
    else
    {
      NSUInteger v20 = [(NSMutableData *)self->_mdata length];
      NSUInteger v19 = 0;
      LOBYTE(v16) = 0;
      unint64_t v21 = 550;
    }
    a3->location = v19;
    a3->length = v20;
  }
  else
  {
    LOBYTE(v16) = 0;
    unint64_t v21 = 0;
  }

  if (a4) {
    goto LABEL_12;
  }
  return v21;
}

void __54__MFSMTPConnection__readResponseRange_isContinuation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^([0-9]+)([- ])?(.*)$" options:16 error:0];
  unint64_t v3 = (void *)_readResponseRange_isContinuation___responseRegex;
  _readResponseRange_isContinuation___responseRegex = v2;

  if (!_readResponseRange_isContinuation___responseRegex)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"MFSMTPConnection.m", 887, @"Unable to init regular expression from %@", @"^([0-9]+)([- ])?(.*)$" object file lineNumber description];
  }
}

- (BOOL)_connectUsingAccount:(id)a3
{
  id v4 = a3;
  [(MFSMTPConnection *)self _setLastResponse:0];
  v21.receiver = self;
  v21.super_class = (Class)MFSMTPConnection;
  unsigned __int8 v5 = [(MFConnection *)&v21 connectUsingAccount:v4];
  socket = self->super._socket;
  if (v5)
  {
    int v7 = [(MFNWConnectionWrapper *)socket timeout];
    self->_int originalSocketTimeout = v7;
    if (v7 >= 1)
    {
      if (v7 <= 300) {
        uint64_t v8 = 300;
      }
      else {
        uint64_t v8 = v7;
      }
      [(MFNWConnectionWrapper *)self->super._socket setTimeout:v8];
    }
    if ([(MFSMTPConnection *)self _getReply] == 2)
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    self->super._socket = 0;
  }
  id v10 = +[MFActivityMonitor currentMonitor];
  uint64_t v11 = [v10 error];

  if (v11 && [v11 code] != 1029)
  {
    uint64_t v17 = v11;
  }
  else
  {
    uint64_t v12 = NSString;
    uint64_t v13 = MFLookupLocalizedString(@"FAILED_SEND", @"Check the account settings for the outgoing server “%@”.", @"Delayed");
    uint64_t v14 = [v4 hostname];
    BOOL v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);

    BOOL v16 = MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed");
    uint64_t v17 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1031 localizedDescription:v15 title:v16 userInfo:0];

    NSUInteger v18 = +[MFActivityMonitor currentMonitor];
    [v18 setError:v17];
  }
  NSUInteger v19 = self->super._socket;
  self->super._socket = 0;

  BOOL v9 = 0;
LABEL_15:

  return v9;
}

- (unint64_t)_doHandshakeUsingAccount:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  char v41 = 1;
  id v4 = +[MFSMTPConnection log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v43 = self;
    __int16 v44 = 2114;
    char v45 = @"smtpclient.apple";
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: Trying EHLO using clientDomainName [%{public}@]", buf, 0x16u);
  }

  unint64_t v37 = [(MFSMTPConnection *)self _sendCommand:"EHLO " length:5 argument:@"smtpclient.apple" trailer:0];
  if (v37 != 2)
  {
    int v24 = 1;
    goto LABEL_41;
  }
  unsigned __int8 v5 = +[MFSMTPConnection log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v43 = self;
    __int16 v44 = 2114;
    char v45 = @"smtpclient.apple";
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: EHLO using clientDomainName [%{public}@] - Success.", buf, 0x16u);
  }

  char v6 = 1;
  *(void *)&long long v7 = 134218242;
  long long v35 = v7;
  char v8 = 1;
  while (1)
  {
    unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v40 = 0xAAAAAAAAAAAAAAAALL;
    if (-[MFSMTPConnection _readResponseRange:isContinuation:](self, "_readResponseRange:isContinuation:", &v39, &v41, v35) == 250)
    {
      if (!(v6 & 1 | (v40 == 0)))
      {
        uint64_t v9 = [(NSMutableData *)self->_mdata bytes];
        unint64_t v10 = v9 + v39;
        v38 = (const UInt8 *)(v9 + v39);
        unint64_t v11 = v9 + v39 + v40;
        if (v40 >= 6 && !strncasecmp((const char *)(v9 + v39), "AUTH=", 5uLL))
        {
          uint64_t v12 = _createParameterStringFromBytes(&v38, v10 + 5);
        }
        else
        {
          uint64_t v12 = _createParameterStringFromBytes(&v38, v11);
        }
        uint64_t v13 = (__CFString *)v12;
        uint64_t v14 = +[MFSMTPConnection log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v35;
          v43 = self;
          __int16 v44 = 2112;
          char v45 = v13;
          _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: Current keyword: %@", buf, 0x16u);
        }

        if (v13)
        {
          BOOL v15 = 0;
          BOOL v16 = 0;
          while (1)
          {
            uint64_t v17 = _createParameterStringFromBytes(&v38, v11);

            if (!v17) {
              break;
            }
            BOOL v16 = (void *)v17;
            if (!v15) {
              BOOL v15 = (__CFString *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
            }
            [(__CFString *)v15 addObject:v17];
          }
          serviceExtensions = self->_serviceExtensions;
          if (!serviceExtensions)
          {
            NSUInteger v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            NSUInteger v20 = self->_serviceExtensions;
            self->_serviceExtensions = v19;

            serviceExtensions = self->_serviceExtensions;
          }
          [(NSMutableArray *)serviceExtensions addObject:v13];
          objc_super v21 = +[MFSMTPConnection log];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v35;
            v43 = self;
            __int16 v44 = 2112;
            char v45 = v13;
            _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: Service extension added keyword: %@", buf, 0x16u);
          }

          uint64_t v22 = self->_serviceExtensions;
          if (v15)
          {
            [(NSMutableArray *)self->_serviceExtensions addObject:v15];
            uint64_t v23 = +[MFSMTPConnection log];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v35;
              v43 = self;
              __int16 v44 = 2112;
              char v45 = v15;
              _os_log_impl(&dword_1A7EFF000, v23, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: Service extension added params: %@", buf, 0x16u);
            }
          }
          else
          {
            uint64_t v23 = [MEMORY[0x1E4F1C978] array];
            [(NSMutableArray *)v22 addObject:v23];
          }
        }
      }
      char v8 = 0;
      char v6 = 0;
      goto LABEL_33;
    }
    if ([(MFSMTPResponse *)self->_lastResponse status] != 500) {
      break;
    }
LABEL_33:
    if (!v41) {
      goto LABEL_40;
    }
  }
  uint64_t v25 = +[MFSMTPConnection log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    int64_t v34 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", -[NSMutableData bytes](self->_mdata, "bytes"), -[NSMutableData length](self->_mdata, "length"), 4);
    *(_DWORD *)buf = 134218498;
    v43 = self;
    __int16 v44 = 2114;
    char v45 = @"smtpclient.apple";
    __int16 v46 = 2112;
    id v47 = v34;
    _os_log_error_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_ERROR, "MFSMTPConnection[%p]: Got unexpected EHLO response using clientDomainName [%{public}@] ESMTP params %@", buf, 0x20u);
  }
  char v41 = 0;
LABEL_40:
  int v24 = v8 & 1;
LABEL_41:
  if ([v36 usesSSL])
  {
    uint64_t v27 = +[MFActivityMonitor currentMonitor];
    unint64_t v28 = [v27 error];
    uint64_t v29 = [v28 domain];
    char v30 = [(id)*MEMORY[0x1E4F288C8] isEqualToString:v29];

    if (v30 & 1) != 0 || ((v24 ^ 1)) {
      goto LABEL_58;
    }
  }
  else if ((v24 & 1) == 0)
  {
    goto LABEL_58;
  }
  uint64_t v31 = +[MFSMTPConnection log];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v43 = self;
    __int16 v44 = 2114;
    char v45 = @"smtpclient.apple";
    _os_log_impl(&dword_1A7EFF000, v31, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: EHLO using clientDomainName [%{public}@] - Failed. Falling back to HELO", buf, 0x16u);
  }

  if (![(MFNWConnectionWrapper *)self->super._socket isWritable]) {
    goto LABEL_55;
  }
  if ([(MFSMTPConnection *)self _sendCommand:"RSET" length:4 argument:0 trailer:0] == 2)[(MFSMTPConnection *)self _getReply]; {
  if ([(MFNWConnectionWrapper *)self->super._socket isWritable]
  }
    && [(MFSMTPConnection *)self _sendCommand:"HELO " length:5 argument:@"smtpclient.apple" trailer:0] == 2&& (unint64_t v37 = [(MFSMTPConnection *)self _getReply], v37 == 2))
  {
    unint64_t v37 = 2;
  }
  else
  {
LABEL_55:
    [(MFNWConnectionWrapper *)self->super._socket close];
    socket = self->super._socket;
    self->super._socket = 0;

    if ([(MFSMTPConnection *)self _connectUsingAccount:v36])
    {
      unint64_t v37 = [(MFSMTPConnection *)self _sendCommand:"HELO " length:5 argument:@"smtpclient.apple" trailer:0];
      if (v37 == 2) {
        unint64_t v37 = [(MFSMTPConnection *)self _getReply];
      }
    }
  }
LABEL_58:

  return v37;
}

- (BOOL)_hasParameter:(id)a3 forKeyword:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(NSMutableArray *)self->_serviceExtensions count];
  uint64_t v9 = [v6 uppercaseString];

  if (v8 >= 2)
  {
    unint64_t v11 = 1;
    do
    {
      uint64_t v12 = [(NSMutableArray *)self->_serviceExtensions objectAtIndex:v11 - 1];
      uint64_t v13 = [v12 caseInsensitiveCompare:v7];
      BOOL v10 = v13 == 0;

      if (v13) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v9 == 0;
      }
      if (!v14)
      {
        BOOL v15 = [(NSMutableArray *)self->_serviceExtensions objectAtIndex:v11];
        BOOL v10 = [v15 indexOfObject:v9] != 0x7FFFFFFFFFFFFFFFLL;
      }
      v11 += 2;
    }
    while (v11 < v8 && !v10);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_supportsExtension:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(NSMutableArray *)self->_serviceExtensions count];
  id v6 = +[MFSMTPConnection log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MFSMTPConnection _supportsExtension:]((uint64_t)self, v19, [(NSMutableArray *)self->_serviceExtensions count], v6);
  }

  if (v5)
  {
    uint64_t v8 = 0;
    *(void *)&long long v7 = 134218242;
    long long v14 = v7;
    do
    {
      uint64_t v9 = -[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v8, v14);
      BOOL v10 = +[MFSMTPConnection log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v14;
        BOOL v16 = self;
        __int16 v17 = 2114;
        NSUInteger v18 = v9;
        _os_log_error_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_ERROR, "MFSMTPConnection[%p]: current keyword %{public}@", buf, 0x16u);
      }

      BOOL v11 = [v9 caseInsensitiveCompare:v4] == 0;
      char v12 = v8 + 3 > v5 || v11;
      v8 += 2;
    }
    while ((v12 & 1) == 0);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_setLastResponse:(id)a3
{
}

- (id)lastResponseLine
{
  uint64_t v2 = [(MFSMTPResponse *)self->_lastResponse lastResponseLine];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v3 = v2;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v2;
      unint64_t v5 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)[v4 bytes], objc_msgSend(v4, "length"), 0x600u, 0);

      goto LABEL_7;
    }
    unint64_t v3 = [v2 description];
  }
  unint64_t v5 = v3;
LABEL_7:

  return v5;
}

- (BOOL)_supportsSaveSentExtension
{
  return [(MFSMTPConnection *)self _supportsExtension:@"SSNT"];
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_mdata, 0);
  objc_storeStrong((id *)&self->_serviceExtensions, 0);
  objc_storeStrong((id *)&self->_lastResponse, 0);
}

- (void)_supportsExtension:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "MFSMTPConnection[%p]: extensions count %lu", buf, 0x16u);
}

@end