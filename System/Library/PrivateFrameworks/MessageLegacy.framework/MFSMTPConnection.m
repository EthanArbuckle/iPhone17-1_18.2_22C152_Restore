@interface MFSMTPConnection
- (BOOL)_connectUsingAccount:(id)a3;
- (BOOL)_hasParameter:(id)a3 forKeyword:(id)a4;
- (BOOL)_supportsExtension:(id)a3;
- (BOOL)_supportsSaveSentExtension;
- (BOOL)authenticateUsingAccount:(id)a3;
- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4;
- (BOOL)connectUsingAccount:(id)a3;
- (BOOL)supports8BitMime;
- (BOOL)supportsBinaryMime;
- (BOOL)supportsChunking;
- (BOOL)supportsEnhancedStatusCodes;
- (BOOL)supportsOutboxCopy;
- (BOOL)supportsPipelining;
- (MFSMTPConnection)init;
- (id)_dataForCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6;
- (id)authenticationMechanisms;
- (id)dataForDataCmd;
- (id)dataForMailFrom:(id)a3;
- (id)dataForRcptTo:(id)a3;
- (id)domainName;
- (id)lastResponse;
- (id)lastResponseLine;
- (int)_doHandshakeUsingAccount:(id)a3;
- (int)_getReply;
- (int)_readResponseRange:(_NSRange *)a3 isContinuation:(BOOL *)a4;
- (int)_sendBytes:(const char *)a3 length:(unint64_t)a4 progressHandler:(id)a5;
- (int)_sendCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6;
- (int)_sendData:(id)a3;
- (int)_sendData:(id)a3 progressHandler:(id)a4;
- (int)mailFrom:(id)a3;
- (int)noop;
- (int)quit;
- (int)rcptTo:(id)a3;
- (int)sendBData:(id)a3;
- (int)sendData:(id)a3;
- (int)state;
- (int64_t)mailFrom:(id)a3 recipients:(id)a4 withData:(id)a5 host:(id)a6 errorTitle:(id *)a7 errorMessage:(id *)a8 serverResponse:(id *)a9 displayError:(BOOL *)a10 errorCode:(int *)a11 errorUserInfo:(id *)a12;
- (int64_t)timeLastCommandWasSent;
- (unint64_t)maximumMessageBytes;
- (void)_setLastResponse:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setUseSaveSent:(BOOL)a3 toFolder:(id)a4;
@end

@implementation MFSMTPConnection

- (MFSMTPConnection)init
{
  v4.receiver = self;
  v4.super_class = (Class)MFSMTPConnection;
  v2 = [(MFConnection *)&v4 init];
  if (v2) {
    v2->_mdata = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F73540]) initWithCapacity:128];
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFSMTPConnection;
  [(MFConnection *)&v3 dealloc];
}

- (int)state
{
  unsigned int v2 = [(MFSMTPResponse *)self->_lastResponse status];
  if (v2 > 0x257) {
    return 6;
  }
  else {
    return *(_DWORD *)((char *)&unk_1CFD6F840 + ((v2 / 0x19uLL) & 0xFFFFFFC));
  }
}

- (id)lastResponse
{
  unsigned int v2 = (void *)[(MFSMTPResponse *)self->_lastResponse copy];
  return v2;
}

- (id)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
  objc_super v4 = (NSString *)objc_msgSend(a3, "copyWithZone:", -[MFSMTPConnection zone](self, "zone"));

  self->_domainName = v4;
}

- (BOOL)supportsOutboxCopy
{
  if ([(MFSMTPConnection *)self _hasParameter:0 forKeyword:@"X-AOL-OUTBOX-COPY"]) {
    return 1;
  }
  if (self->_dislikesSaveSentMbox) {
    return 0;
  }
  return [(MFSMTPConnection *)self _supportsSaveSentExtension];
}

- (BOOL)supportsPipelining
{
  return [(MFSMTPConnection *)self _supportsExtension:@"PIPELINING"];
}

- (BOOL)supports8BitMime
{
  int v2 = [(MFSMTPConnection *)self _supportsExtension:@"8BITMIME"];
  if (v2)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    LOBYTE(v2) = [v3 BOOLForKey:@"Enable8BITMIME"];
  }
  return v2;
}

- (BOOL)supportsBinaryMime
{
  int v2 = [(MFSMTPConnection *)self _supportsExtension:@"BINARYMIME"];
  if (v2)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    LOBYTE(v2) = [v3 BOOLForKey:@"EnableBINARYMIME"];
  }
  return v2;
}

- (BOOL)supportsEnhancedStatusCodes
{
  return [(MFSMTPConnection *)self _supportsExtension:@"ENHANCEDSTATUSCODES"];
}

- (BOOL)supportsChunking
{
  int v2 = [(MFSMTPConnection *)self _supportsExtension:@"CHUNKING"];
  if (v2) {
    LOBYTE(v2) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"DisableCHUNKING") ^ 1;
  }
  return v2;
}

- (unint64_t)maximumMessageBytes
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t result = [(NSMutableArray *)self->_serviceExtensions count];
  if (result)
  {
    unint64_t v4 = result;
    unint64_t v5 = 1;
    do
    {
      if (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v5 - 1), "caseInsensitiveCompare:", @"SIZE")|| (v7 = (void *)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v5), !objc_msgSend(v7, "count")))
      {
        v6 = 0;
      }
      else
      {
        v6 = (void *)[v7 objectAtIndex:0];
      }
      v5 += 2;
    }
    while (v5 <= v4 && !v6);
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v8 = [v6 length];
      uint64_t Bytes = MFStringGetBytes();
      unint64_t result = 0;
      if (v8 == Bytes)
      {
        __str[0] = 0;
        return strtoull(__str, 0, 10);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)authenticationMechanisms
{
  uint64_t v3 = [(NSMutableArray *)self->_serviceExtensions count];
  if (v3)
  {
    unint64_t v4 = v3;
    unint64_t v5 = 0;
    for (unint64_t i = 1; i <= v4; i += 2)
    {
      if (!objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", i - 1), "caseInsensitiveCompare:", @"AUTH"))
      {
        v7 = (void *)[(NSMutableArray *)self->_serviceExtensions objectAtIndex:i];
        if ([v7 count])
        {
          if (v5) {
            [v5 addObjectsFromArray:v7];
          }
          else {
            unint64_t v5 = (void *)[v7 mutableCopyWithZone:0];
          }
        }
      }
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (BOOL)authenticateUsingAccount:(id)a3
{
  if (![a3 preferredAuthScheme]) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MFSMTPConnection;
  return [(MFConnection *)&v6 authenticateUsingAccount:a3];
}

- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4
{
  v7 = (void *)[a4 saslName];
  int v8 = [a4 base64EncodeResponseData];
  [a4 setAuthenticationState:1];
  v9 = (void *)[a4 responseForServerData:0];
  self->_hideLoggedData = [a4 justSentPlainTextPassword];
  if (v9)
  {
    if (v8) {
      objc_msgSend(v9, "mf_encodeBase64WithoutLineBreaks");
    }
    v10 = (void *)[v7 mutableCopyWithZone:0];
    uint64_t v11 = (void *)MFCreateStringWithData();
    [v10 appendString:@" "];
    [v10 appendString:v11];

    int v12 = [(MFSMTPConnection *)self _sendCommand:"AUTH " length:5 argument:v10 trailer:0];
  }
  else
  {
    int v12 = [(MFSMTPConnection *)self _sendCommand:"AUTH " length:5 argument:v7 trailer:0];
  }
  if (v12 == 2) {
    int v12 = [(MFSMTPConnection *)self _getReply];
  }
  else {
    [a4 setAuthenticationState:3];
  }
  if ([a4 authenticationState] == 1)
  {
    while ((v12 - 4) >= 2)
    {
      if (v12 == 2)
      {
        id v17 = a4;
        uint64_t v18 = 4;
        goto LABEL_27;
      }
      if (v12 != 3) {
        goto LABEL_26;
      }
      id v13 = [(MFSMTPResponse *)self->_lastResponse lastResponseLine];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        id v13 = (id)[MEMORY[0x1E4F1C9B8] data];
      }
      if (v8) {
        id v13 = (id)objc_msgSend(v13, "mf_decodeBase64");
      }
      v14 = (void *)[a4 responseForServerData:v13];
      self->_hideLoggedData = [a4 justSentPlainTextPassword];
      if (v14)
      {
        if (v8) {
          v14 = objc_msgSend(v14, "mf_encodeBase64WithoutLineBreaks");
        }
        int v15 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", [v14 bytes], objc_msgSend(v14, "length"), 0, 0);
        if (v15 != 2)
        {
          int v12 = v15;
LABEL_26:
          id v17 = a4;
          uint64_t v18 = 3;
LABEL_27:
          [v17 setAuthenticationState:v18];
          goto LABEL_28;
        }
        int v12 = [(MFSMTPConnection *)self _getReply];
      }
      else
      {
        [a4 setAuthenticationState:2];
        int v12 = 3;
      }
LABEL_28:
      if ([a4 authenticationState] != 1) {
        goto LABEL_29;
      }
    }
    v16 = (void *)[a3 errorForResponse:self->_lastResponse];
    objc_msgSend(v16, "setMoreInfo:", -[MFSMTPConnection lastResponseLine](self, "lastResponseLine"));
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", v16);
    id v17 = a4;
    uint64_t v18 = 2;
    goto LABEL_27;
  }
LABEL_29:
  self->_hideLoggedData = 0;
  return [a4 authenticationState] == 4;
}

- (BOOL)connectUsingAccount:(id)a3
{
  BOOL v5 = -[MFSMTPConnection _connectUsingAccount:](self, "_connectUsingAccount:");
  if (!v5) {
    return v5;
  }
  if ([(MFSMTPConnection *)self _doHandshakeUsingAccount:a3] != 2)
  {
LABEL_16:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (![a3 usesSSL]
    || !objc_msgSend((id)*MEMORY[0x1E4F1D4C0], "isEqualToString:", -[_MFSocket securityProtocol](self->super._socket, "securityProtocol")))
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (![(MFSMTPConnection *)self _hasParameter:0 forKeyword:@"STARTTLS"])
  {
    uint64_t v7 = [NSString stringWithFormat:MFLookupLocalizedString(@"FAILED_SEND_SSL_NEEDED", @"Check the SSL setting for the outgoing server “%@”.", @"Delayed", objc_msgSend(a3, "hostname")];
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:@"UserFriendlyErrorDescription"];
    id v9 = +[MFActivityMonitor currentMonitor];
    uint64_t v10 = MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed");
    uint64_t v11 = 1034;
LABEL_15:
    objc_msgSend(v9, "setError:", +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", @"MFMessageErrorDomain", v11, v7, v10, v8));
    goto LABEL_16;
  }
  if ([(MFSMTPConnection *)self _sendCommand:"STARTTLS" length:8 argument:0 trailer:0] != 2|| [(MFSMTPConnection *)self _getReply] != 2)
  {
    uint64_t v7 = [NSString stringWithFormat:MFLookupLocalizedString(@"FAILED_SEND_SSL_NEEDED", @"Check the SSL setting for the outgoing server “%@”.", @"Delayed", objc_msgSend(a3, "hostname")];
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:@"UserFriendlyErrorDescription"];
    id v9 = +[MFActivityMonitor currentMonitor];
    uint64_t v10 = MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed");
    uint64_t v11 = 1033;
    goto LABEL_15;
  }
  uint64_t v6 = [a3 clientCertificates];
  if (v6) {
    [(_MFSocket *)self->super._socket setClientCertificates:v6];
  }
  BOOL v5 = [(_MFSocket *)self->super._socket setSecurityProtocol:*MEMORY[0x1E4F1D4B8]];
  if (v5) {
    LOBYTE(v5) = [(MFSMTPConnection *)self _doHandshakeUsingAccount:a3] == 2;
  }
  return v5;
}

- (int)mailFrom:(id)a3
{
  if ([(MFSMTPConnection *)self supportsBinaryMime])
  {
    BOOL v5 = "> BODY=BINARYMIME";
  }
  else if ([(MFSMTPConnection *)self supports8BitMime])
  {
    BOOL v5 = "> BODY=8BITMIME";
  }
  else
  {
    BOOL v5 = ">";
  }
  uint64_t v6 = objc_msgSend(a3, "mf_copyIDNAEncodedEmailAddress");
  int v7 = [(MFSMTPConnection *)self _sendCommand:"MAIL FROM:<" length:11 argument:v6 trailer:v5];
  if (v7 == 2) {
    int v7 = [(MFSMTPConnection *)self _getReply];
  }

  return v7;
}

- (int)rcptTo:(id)a3
{
  unint64_t v4 = objc_msgSend(a3, "mf_copyIDNAEncodedEmailAddress");
  int v5 = [(MFSMTPConnection *)self _sendCommand:"RCPT TO:<" length:9 argument:v4 trailer:">"];
  if (v5 == 2) {
    int v5 = [(MFSMTPConnection *)self _getReply];
  }

  return v5;
}

- (int)noop
{
  int result = [(MFSMTPConnection *)self _sendCommand:"NOOP" length:4 argument:0 trailer:0];
  if (result == 2)
  {
    return [(MFSMTPConnection *)self _getReply];
  }
  return result;
}

- (int)sendBData:(id)a3
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v5 = [a3 length];
  uint64_t v21 = [a3 numberOfNewlinesNeedingConversion:0] + v5;
  int originalSocketTimeout = self->_originalSocketTimeout;
  if (originalSocketTimeout >= 1)
  {
    if (originalSocketTimeout <= 180) {
      uint64_t v7 = 180;
    }
    else {
      uint64_t v7 = originalSocketTimeout;
    }
    [(_MFSocket *)self->super._socket setTimeout:v7];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v9 = objc_msgSend(v8, "initWithFormat:", @"BDAT %lu LAST\r\n", v19[3]);
  if (-[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", [v9 dataUsingEncoding:4], 0x7FFFFFFFFFFFFFFFLL, 0))
  {
    unint64_t v10 = v19[3] / 0x50uLL;
    if (v10 <= 0x2000) {
      unint64_t v10 = 0x2000;
    }
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __30__MFSMTPConnection_sendBData___block_invoke;
    v16[3] = &unk_1E6867B70;
    v16[4] = self;
    v16[5] = v17;
    v16[6] = &v18;
    v16[7] = v10;
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F73540]) initWithCapacity:0x10000];
    *((_DWORD *)v23 + 6) = 2;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __30__MFSMTPConnection_sendBData___block_invoke_2;
    v15[3] = &unk_1E6867B98;
    v15[4] = v11;
    v15[5] = self;
    v15[6] = v16;
    v15[7] = &v22;
    [a3 enumerateConvertingNewlinesUsingBlock:v15];
    if (*((_DWORD *)v23 + 6) == 2)
    {
      int v12 = [(MFSMTPConnection *)self _sendData:v11 progressHandler:v16];
      *((_DWORD *)v23 + 6) = v12;
    }

    _Block_object_dispose(v17, 8);
  }

  int v13 = *((_DWORD *)v23 + 6);
  if (v13 == 2)
  {
    [(MFSMTPConnection *)self _getReply];
    int v13 = [(MFSMTPConnection *)self state];
    *((_DWORD *)v23 + 6) = v13;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t __30__MFSMTPConnection_sendBData___block_invoke(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) += a2;
  [*(id *)(a1[4] + 168) setPercentDone:(double)*(unint64_t *)(*(void *)(a1[5] + 8) + 24)/ (double)*(unint64_t *)(*(void *)(a1[6] + 8) + 24)* 0.800000012+ 0.200000003];
  return a1[7];
}

BOOL __30__MFSMTPConnection_sendBData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)[*(id *)(a1 + 32) length] >= 0x10000)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) _sendData:*(void *)(a1 + 32) progressHandler:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setLength:0];
  }
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 2;
}

- (int)sendData:(id)a3
{
  int originalSocketTimeout = self->_originalSocketTimeout;
  if (originalSocketTimeout >= 1)
  {
    socket = self->super._socket;
    if (originalSocketTimeout <= 120) {
      uint64_t v7 = 120;
    }
    else {
      uint64_t v7 = originalSocketTimeout;
    }
    [(_MFSocket *)socket setTimeout:v7];
  }
  id v8 = +[MFActivityMonitor currentMonitor];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  unint64_t v9 = [a3 length];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __29__MFSMTPConnection_sendData___block_invoke;
  v17[3] = &unk_1E6867BC0;
  v17[6] = v18;
  v17[7] = v19;
  void v17[4] = a3;
  v17[5] = self;
  v17[8] = (v9 / 0x14) & 0xFFFFFFFFFFFE000;
  [(NSMutableData *)self->_mdata setLength:0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __29__MFSMTPConnection_sendData___block_invoke_2;
  v16[3] = &unk_1E6867BE8;
  v16[4] = self;
  v16[5] = v8;
  v16[7] = &v20;
  void v16[8] = v19;
  v16[6] = v17;
  [a3 enumerateConvertingNewlinesUsingBlock:v16];
  if (!*((unsigned char *)v21 + 24))
  {
    int v10 = self->_originalSocketTimeout;
    if (v10 >= 1)
    {
      if (v10 <= 600) {
        uint64_t v11 = 600;
      }
      else {
        uint64_t v11 = v10;
      }
      [(_MFSocket *)self->super._socket setTimeout:v11];
    }
    [(MFSMTPConnection *)self _getReply];
    int v12 = self->_originalSocketTimeout;
    if (v12 >= 1)
    {
      if (v12 <= 300) {
        uint64_t v13 = 300;
      }
      else {
        uint64_t v13 = v12;
      }
      [(_MFSocket *)self->super._socket setTimeout:v13];
    }
  }
  int v14 = [(MFSMTPConnection *)self state];
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);
  return v14;
}

uint64_t __29__MFSMTPConnection_sendData___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 168), "setPercentDone:", (float)((float)((float)*(unint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) * 0.8)/ (float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))+ 0.200000003);
  return *(void *)(a1 + 64);
}

BOOL __29__MFSMTPConnection_sendData___block_invoke_2(uint64_t a1, unsigned char *a2, uint64_t a3, int a4, int a5)
{
  if (*a2 == 46) {
    [*(id *)(*(void *)(a1 + 32) + 128) appendBytes:a2 length:1];
  }
  [*(id *)(*(void *)(a1 + 32) + 128) appendBytes:a2 length:a3];
  if (a5 && (a4 & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 128) appendBytes:"\r\n" length:2];
  }
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 128) length] >> 13) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = a5 == 0;
  }
  if (!v10)
  {
    if ([*(id *)(a1 + 40) shouldCancel])
    {
      [*(id *)(*(void *)(a1 + 32) + 112) setStatus:550];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      [*(id *)(a1 + 32) disconnect];
    }
    else
    {
      if (a5)
      {
        [*(id *)(*(void *)(a1 + 32) + 128) appendBytes:"." length:1];
        [*(id *)(*(void *)(a1 + 32) + 128) appendBytes:"\r\n" length:2];
      }
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += a3;
      if (a4) {
        --*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _sendData:*(void *)(*(void *)(a1 + 32)+ 128) progressHandler:*(void *)(a1 + 48)] != 2;
    }
    [*(id *)(*(void *)(a1 + 32) + 128) setLength:0];
  }
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0;
}

- (int)quit
{
  int v3 = [(MFSMTPConnection *)self _sendCommand:"QUIT" length:4 argument:0 trailer:0];
  if (v3 == 2) {
    [(MFConnection *)self disconnect];
  }
  return v3;
}

- (id)dataForMailFrom:(id)a3
{
  if ([(MFSMTPConnection *)self supportsBinaryMime])
  {
    uint64_t v5 = "> BODY=BINARYMIME";
  }
  else if ([(MFSMTPConnection *)self supports8BitMime])
  {
    uint64_t v5 = "> BODY=8BITMIME";
  }
  else
  {
    uint64_t v5 = ">";
  }
  uint64_t v6 = objc_msgSend(a3, "mf_copyIDNAEncodedEmailAddress");
  id v7 = [(MFSMTPConnection *)self _dataForCommand:"MAIL FROM:<" length:11 argument:v6 trailer:v5];

  return v7;
}

- (id)dataForRcptTo:(id)a3
{
  unint64_t v4 = objc_msgSend(a3, "mf_copyIDNAEncodedEmailAddress");
  id v5 = [(MFSMTPConnection *)self _dataForCommand:"RCPT TO:<" length:9 argument:v4 trailer:">"];

  return v5;
}

- (id)dataForDataCmd
{
  return [(MFSMTPConnection *)self _dataForCommand:"DATA" length:4 argument:0 trailer:0];
}

- (int64_t)mailFrom:(id)a3 recipients:(id)a4 withData:(id)a5 host:(id)a6 errorTitle:(id *)a7 errorMessage:(id *)a8 serverResponse:(id *)a9 displayError:(BOOL *)a10 errorCode:(int *)a11 errorUserInfo:(id *)a12
{
  id v17 = a9;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v18 = +[MFActivityMonitor currentMonitor];
  if (a10) {
    *a10 = 0;
  }
  BOOL v19 = [(MFSMTPConnection *)self supportsChunking];
  if (![(MFSMTPConnection *)self supportsPipelining])
  {
    if ([(MFSMTPConnection *)self mailFrom:a3] != 2)
    {
      *a11 = 1047;
      lastResponse = self->_lastResponse;
      uint64_t v44 = MFLookupLocalizedString(@"SMTP_INVALID_SENDER_ADDRESS", @"The sender address “%@” was rejected by the server.", @"Delayed");
      v45 = lastResponse;
      v46 = a9;
      *a8 = [(MFSMTPResponse *)v45 errorMessageWithAddress:a3 defaultMessage:v44];
      id v47 = [(MFSMTPConnection *)self lastResponseLine];
      int64_t v48 = 1;
      goto LABEL_117;
    }
    BOOL v85 = v19;
    id v75 = v18;
    id v78 = a5;
    id v83 = a3;
    v79 = a7;
    [self->_delegate setPercentDone:0.15];
    unint64_t v27 = [a4 count];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v28 = [a4 countByEnumeratingWithState:&v87 objects:v98 count:16];
    if (!v28)
    {
      id v30 = 0;
      int v31 = 0;
      int v32 = 0;
      goto LABEL_40;
    }
    uint64_t v29 = v28;
    id v30 = 0;
    int v31 = 0;
    int v32 = 0;
    uint64_t v33 = *(void *)v88;
    double v34 = (float)(0.05 / (float)v27);
    double v35 = 0.150000006;
LABEL_21:
    uint64_t v36 = 0;
    while (1)
    {
      if (*(void *)v88 != v33) {
        objc_enumerationMutation(a4);
      }
      uint64_t v91 = 0;
      uint64_t v91 = *(void *)(*((void *)&v87 + 1) + 8 * v36);
      if (-[MFSMTPConnection rcptTo:](self, "rcptTo:") != 2) {
        break;
      }
      ++v31;
      double v35 = v35 + v34;
      [self->_delegate setPercentDone:v35];
LABEL_31:
      if (v29 == ++v36)
      {
        uint64_t v40 = [a4 countByEnumeratingWithState:&v87 objects:v98 count:16];
        uint64_t v29 = v40;
        if (!v40)
        {
LABEL_40:
          v49 = MFLogGeneral();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v97 = v31;
            *(_WORD *)&v97[4] = 2112;
            *(void *)&v97[6] = v30;
            _os_log_impl(&dword_1CFCFE000, v49, OS_LOG_TYPE_INFO, "SMTP delivery:%d valid recipients; invalid recipients = %@",
              buf,
              0x12u);
          }
          id v50 = v83;
          if (v32)
          {
            if ([v30 count])
            {
              a7 = v79;
              if (a10) {
                *a10 = 1;
              }
              *a11 = 1049;
              v51 = self->_lastResponse;
              uint64_t v52 = [v30 lastObject];
              if ((unint64_t)[v30 count] < 2)
              {
                v53 = @"SMTP_1_BAD_RECIPIENT";
                v54 = @"The recipient “%@” was rejected by the server.";
              }
              else
              {
                v53 = @"SMTP_BAD_RECIPIENTS";
                v54 = @"The recipients were rejected by the server.";
              }
              id v71 = [(MFSMTPResponse *)v51 errorMessageWithAddress:v52 defaultMessage:MFLookupLocalizedString((uint64_t)v53, (uint64_t)v54, @"Delayed")];
              *a8 = v71;
              int64_t v48 = 1;
            }
            else
            {
              *a11 = 1049;
              id v71 = [(MFSMTPResponse *)self->_lastResponse errorMessageWithAddress:0 defaultMessage:MFLookupLocalizedString(@"SMTP_RECIPIENTS_UNRECOGNIZED", @"Verify that you have addressed this message correctly. Check your SMTP server settings in Mail Preferences and verify any advanced settings with your system administrator.", @"Delayed")];
              *a8 = v71;
              int64_t v48 = 1;
              a7 = v79;
            }
            goto LABEL_119;
          }
          if (self->_useSaveSent && [(MFSMTPConnection *)self _supportsSaveSentExtension])
          {
            if (self->_saveSentMbox) {
              v55 = (void *)[[NSString alloc] initWithFormat:@" imapmailbox=\"%@\"", self->_saveSentMbox];
            }
            else {
              v55 = 0;
            }
            BOOL v73 = [(MFSMTPConnection *)self _sendCommand:"SSNT" length:4 argument:v55 trailer:0] != 2|| [(MFSMTPConnection *)self _getReply] != 2;
            self->_dislikesSaveSentMbox = v73;
          }
          if (v85)
          {
            int v69 = [(MFSMTPConnection *)self sendBData:v78];
            a7 = v79;
            goto LABEL_113;
          }
          a7 = v79;
          if ([(MFSMTPConnection *)self _sendCommand:"DATA" length:4 argument:0 trailer:0] == 2&& [(MFSMTPConnection *)self _getReply] == 3)
          {
            int v69 = [(MFSMTPConnection *)self sendData:v78];
LABEL_113:
            if (v69 == 2)
            {
              int64_t v48 = 0;
              goto LABEL_118;
            }
            v70 = v75;
LABEL_91:
            if ([v70 shouldCancel])
            {
              int64_t v48 = 4;
              goto LABEL_118;
            }
            if (v69 == 4)
            {
              id v72 = [(MFSMTPResponse *)self->_lastResponse errorMessageWithAddress:v50 defaultMessage:MFLookupLocalizedString(@"SMTP_SENDING_CONTENT_LATER", @"Mail will try to send the message again later.", @"Delayed")];
              int64_t v48 = 2;
            }
            else
            {
              if (v69 == 5) {
                int64_t v48 = 7;
              }
              else {
                int64_t v48 = 1;
              }
              id v72 = [(MFSMTPResponse *)self->_lastResponse errorMessageWithAddress:v50 defaultMessage:MFLookupLocalizedString(@"SMTP_SENDING_CONTENT_FAILED", @"Sending the message content to the server failed.", @"Delayed")];
            }
            *a8 = v72;
            id v47 = [(MFSMTPConnection *)self lastResponseLine];
          }
          else
          {
            [(MFSMTPResponse *)self->_lastResponse setStatus:550];
            *a8 = [(MFSMTPResponse *)self->_lastResponse errorMessageWithAddress:0 defaultMessage:MFLookupLocalizedString(@"SMTP_SENDING_CONTENT_FAILED", @"Sending the message content to the server failed.", @"Delayed")];
            id v47 = [(MFSMTPConnection *)self lastResponseLine];
            int64_t v48 = 1;
          }
          v46 = a9;
LABEL_117:
          id *v46 = v47;
          goto LABEL_118;
        }
        goto LABEL_21;
      }
    }
    if (v30)
    {
      [v30 addObject:v91];
      if (v32) {
        goto LABEL_29;
      }
    }
    else
    {
      id v30 = (id)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) initWithObjects:&v91 count:1];
      if (v32)
      {
LABEL_29:
        v37 = MFLogGeneral();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = v91;
          id v39 = [(MFSMTPConnection *)self lastResponseLine];
          *(_DWORD *)buf = 138412546;
          *(void *)v97 = v38;
          id v17 = a9;
          *(_WORD *)&v97[8] = 2112;
          *(void *)&v97[10] = v39;
          _os_log_error_impl(&dword_1CFCFE000, v37, OS_LOG_TYPE_ERROR, "SMTP error for recipient %@: %@", buf, 0x16u);
        }
        goto LABEL_31;
      }
    }
    int v32 = [(MFSMTPResponse *)self->_lastResponse status];
    *id v17 = [(MFSMTPConnection *)self lastResponseLine];
    goto LABEL_29;
  }
  id v77 = a5;
  [(NSMutableData *)self->_mdata setLength:0];
  id v82 = a3;
  [(NSMutableData *)self->_mdata appendData:[(MFSMTPConnection *)self dataForMailFrom:a3]];
  BOOL v84 = v19;
  long long v94 = 0u;
  long long v95 = 0u;
  if (v19) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = 2;
  }
  long long v92 = 0uLL;
  long long v93 = 0uLL;
  uint64_t v21 = [a4 countByEnumeratingWithState:&v92 objects:v103 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v93 != v23) {
          objc_enumerationMutation(a4);
        }
        [(NSMutableData *)self->_mdata appendData:[(MFSMTPConnection *)self dataForRcptTo:*(void *)(*((void *)&v92 + 1) + 8 * i)]];
      }
      uint64_t v22 = [a4 countByEnumeratingWithState:&v92 objects:v103 count:16];
    }
    while (v22);
  }
  uint64_t v25 = [a4 count] + v20;
  if (self->_useSaveSent && [(MFSMTPConnection *)self _supportsSaveSentExtension])
  {
    if (self->_saveSentMbox) {
      v26 = (void *)[[NSString alloc] initWithFormat:@" imapmailbox=\"%@\"", self->_saveSentMbox];
    }
    else {
      v26 = 0;
    }
    [(NSMutableData *)self->_mdata appendData:[(MFSMTPConnection *)self _dataForCommand:"SSNT" length:4 argument:v26 trailer:0]];

    uint64_t v42 = v25 + 1;
    int v41 = 1;
  }
  else
  {
    int v41 = 0;
    uint64_t v42 = v25;
  }
  if (!v84) {
    [(NSMutableData *)self->_mdata appendData:[(MFSMTPConnection *)self dataForDataCmd]];
  }
  id v76 = v18;
  [(MFSMTPConnection *)self _sendData:self->_mdata];
  if (!v42)
  {
    int64_t v48 = 0;
    char v59 = 1;
    BOOL v66 = v84;
    char v67 = v84;
    goto LABEL_84;
  }
  v80 = a7;
  uint64_t v56 = 0;
  int64_t v48 = 0;
  uint64_t v57 = v25 - 1;
  v58 = &OBJC_IVAR___MFMessageLibrary__path;
  uint64_t v81 = *MEMORY[0x1E4F60D00];
  char v59 = 1;
  do
  {
    int v60 = [(MFSMTPConnection *)self _getReply];
    int v61 = v60;
    if (v57 == v56) {
      int v62 = v41;
    }
    else {
      int v62 = 0;
    }
    if (v62 == 1)
    {
      *((unsigned char *)&self->super.super.isa + v58[285]) = v60 != 2;
      goto LABEL_78;
    }
    if ((v59 & ((v60 & 0xFFFFFFFE) != 2)) == 1)
    {
      if (v56)
      {
        char v63 = v84;
        if (v42 - 1 != v56) {
          char v63 = 1;
        }
        v64 = a12;
        if ((v63 & 1) == 0)
        {
          id v65 = [(MFSMTPResponse *)self->_lastResponse errorMessageWithAddress:0 defaultMessage:MFLookupLocalizedString(@"SMTP_SENDING_CONTENT_FAILED", @"Sending the message content to the server failed.", @"Delayed")];
          goto LABEL_74;
        }
        if (a10) {
          *a10 = 1;
        }
        *a11 = 1049;
        id v65 = -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](self->_lastResponse, "errorMessageWithAddress:defaultMessage:", [a4 objectAtIndex:v56 - 1], MFLookupLocalizedString(@"SMTP_1_BAD_RECIPIENT", @"The recipient “%@” was rejected by the server.", @"Delayed"));
      }
      else
      {
        *a11 = 1047;
        id v65 = [(MFSMTPResponse *)self->_lastResponse errorMessageWithAddress:v82 defaultMessage:MFLookupLocalizedString(@"SMTP_INVALID_SENDER_ADDRESS", @"The sender address “%@” was rejected by the server.", @"Delayed")];
      }
      v64 = a12;
LABEL_74:
      *a8 = v65;
      *a9 = [(MFSMTPConnection *)self lastResponseLine];
      if (v64)
      {
        uint64_t v101 = v81;
        v99 = @"SMTPFailureReason";
        v100 = MFSMTPFailureReasonString([(MFSMTPResponse *)self->_lastResponse failureReason]);
        uint64_t v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
        char v59 = 0;
        id *v64 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      }
      else
      {
        char v59 = 0;
      }
      int64_t v48 = 1;
      v58 = &OBJC_IVAR___MFMessageLibrary__path;
    }
LABEL_78:
    ++v56;
  }
  while (v42 != v56);
  BOOL v66 = v84;
  char v67 = v61 == 3 || v84;
  a7 = v80;
LABEL_84:
  id v50 = v82;
  if (v59 & 1) != 0 && (v67)
  {
    [self->_delegate setPercentDone:0.2];
    unsigned int v68 = v66
        ? [(MFSMTPConnection *)self sendBData:v77]
        : [(MFSMTPConnection *)self sendData:v77];
    int v69 = v68;
    if (v68 != 2)
    {
      v70 = v76;
      goto LABEL_91;
    }
  }
LABEL_118:
  id v71 = *a8;
LABEL_119:
  if (v71 && !*a7) {
    *a7 = (id)MFLookupLocalizedString(@"SMTP_SENDING_FAILED_TITLE", @"Unable to Send Email", @"Delayed");
  }
  return v48;
}

- (int64_t)timeLastCommandWasSent
{
  return self->_lastCommandTimestamp;
}

- (int)_sendBytes:(const char *)a3 length:(unint64_t)a4 progressHandler:(id)a5
{
  unint64_t v6 = a4;
  unint64_t v9 = a4;
  if (a5)
  {
    unint64_t v10 = (*((uint64_t (**)(id, void))a5 + 2))(a5, 0);
    if (v10 >= v6 || v10 == 0) {
      unint64_t v9 = v6;
    }
    else {
      unint64_t v9 = v10;
    }
  }
  if (v6)
  {
    while (1)
    {
      uint64_t v12 = self->_hideLoggedData ? 0 : 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v13 = self->_hideLoggedData ? v9 : 0;
      if (!-[MFConnection writeBytes:length:dontLogBytesInRange:](self, "writeBytes:length:dontLogBytesInRange:", a3, v9, v12, v13))break; {
      v6 -= v9;
      }
      if (a5)
      {
        unint64_t v14 = (*((uint64_t (**)(id, unint64_t))a5 + 2))(a5, v9);
        if (v14 >= v6) {
          unint64_t v15 = v6;
        }
        else {
          unint64_t v15 = v14;
        }
        if (!v14) {
          unint64_t v15 = v6;
        }
      }
      else if (v9 >= v6)
      {
        unint64_t v15 = v6;
      }
      else
      {
        unint64_t v15 = v9;
      }
      a3 += v9;
      unint64_t v9 = v15;
      if (!v6) {
        goto LABEL_27;
      }
    }
    [(MFSMTPConnection *)self _setLastResponse:0];
    return 4;
  }
  else
  {
LABEL_27:
    [(MFSMTPConnection *)self _setLastResponse:0];
    return 2;
  }
}

- (int)_sendData:(id)a3
{
  uint64_t v5 = [a3 bytes];
  uint64_t v6 = [a3 length];
  return [(MFSMTPConnection *)self _sendBytes:v5 length:v6 progressHandler:0];
}

- (int)_sendData:(id)a3 progressHandler:(id)a4
{
  uint64_t v7 = [a3 bytes];
  uint64_t v8 = [a3 length];
  return [(MFSMTPConnection *)self _sendBytes:v7 length:v8 progressHandler:a4];
}

- (id)_dataForCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6
{
  uint64_t v12 = (void *)[MEMORY[0x1E4F73540] data];
  unint64_t v13 = v12;
  if (a3) {
    [v12 appendBytes:a3 length:a4];
  }
  if (a5)
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a5, 0x600u);
    if (CStringPtr)
    {
      [v13 appendBytes:CStringPtr length:strlen(CStringPtr)];
      if (!a6) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    CFIndex Length = CFStringGetLength((CFStringRef)a5);
    BOOL v19 = &v20;
    uint64_t v20 = 0;
    if (Length != MFStringGetBytes()) {
      [(id)objc_msgSend(MEMORY[0x1E4F28B00] currentHandler:&v20), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SMTPConnection.m", 896, @"Invalid argument %@", a5];
    }
    uint64_t v16 = objc_msgSend(v13, "length", v19);
    [v13 setLength:v20 + v16];
    [v13 mutableBytes];
    uint64_t v18 = 0;
    if (Length != MFStringGetBytes())
    {
      [(id)objc_msgSend(MEMORY[0x1E4F28B00] currentHandler:0), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SMTPConnection.m", 901, @"Invalid argument %@", a5];
      if (!a6) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  if (a6) {
LABEL_11:
  }
    [v13 appendBytes:a6 length:strlen(a6)];
LABEL_12:
  objc_msgSend(v13, "appendBytes:length:", "\r\n", 2, v18);
  return v13;
}

- (int)_sendCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6
{
  self->_lastCommandTimestamp = time(0);
  [(NSMutableData *)self->_mdata setLength:0];
  [(NSMutableData *)self->_mdata appendData:[(MFSMTPConnection *)self _dataForCommand:a3 length:a4 argument:a5 trailer:a6]];
  mdata = self->_mdata;
  return [(MFSMTPConnection *)self _sendData:mdata];
}

- (int)_getReply
{
  int v3 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  char v11 = 1;
  do
  {
    uint64_t v4 = [(MFSMTPConnection *)self _readResponseRange:&v12 isContinuation:&v11];
    if (v4 > 0x257) {
      int v5 = 6;
    }
    else {
      int v5 = *(_DWORD *)((char *)&unk_1CFD6F840 + ((v4 / 0x19uLL) & 0xFFFFFFC));
    }
    uint64_t v6 = [[MFSMTPResponse alloc] initWithStatus:v4];
    uint64_t v7 = v6;
    if (v5 == 2)
    {
      uint64_t v8 = 0;
LABEL_10:
      [(MFSMTPResponse *)v6 setLastResponseLine:v8];
      goto LABEL_12;
    }
    if (v12 != 0x7FFFFFFFFFFFFFFFLL && v13)
    {
      uint64_t v8 = -[NSMutableData subdataWithRange:](self->_mdata, "subdataWithRange:");
      uint64_t v6 = v7;
      goto LABEL_10;
    }
    unint64_t v9 = (void *)[[NSString alloc] initWithFormat:MFLookupLocalizedString(@"SMTP_GENERIC_ERROR_FORMAT", @"An error occurred while delivering this message via the SMTP server “%@”", @"Delayed", -[_MFSocket remoteHostname](self->super._socket, "remoteHostname")];
    [(MFSMTPResponse *)v7 setLastResponseLine:v9];

LABEL_12:
    if (!v11) {
      goto LABEL_18;
    }
    if (v3) {
      [v3 addObject:v7];
    }
    else {
      int v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, 0);
    }
  }
  while (v11);
  uint64_t v7 = 0;
LABEL_18:
  [(MFSMTPResponse *)v7 setContinuationResponses:v3];
  [(MFSMTPConnection *)self _setLastResponse:v7];

  return v5;
}

- (int)_readResponseRange:(_NSRange *)a3 isContinuation:(BOOL *)a4
{
  *a3 = (_NSRange)xmmword_1CFD6F7E0;
  [(NSMutableData *)self->_mdata setLength:0];
  if (![(MFConnection *)self readLineIntoData:self->_mdata])
  {
    BOOL v23 = 0;
    int v24 = 0;
    if (!a4) {
      return v24;
    }
LABEL_16:
    *a4 = v23;
    return v24;
  }
  uint64_t v8 = [(NSMutableData *)self->_mdata bytes];
  NSUInteger v9 = [(NSMutableData *)self->_mdata length];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MFSMTPConnection__readResponseRange_isContinuation___block_invoke;
  block[3] = &unk_1E6866FC0;
  block[4] = self;
  block[5] = a2;
  if (_readResponseRange_isContinuation__once != -1) {
    dispatch_once(&_readResponseRange_isContinuation__once, block);
  }
  unint64_t v10 = (void *)[[NSString alloc] initWithBytesNoCopy:v8 length:v9 encoding:1 freeWhenDone:0];
  char v11 = objc_msgSend((id)_readResponseRange_isContinuation___responseRegex, "firstMatchInString:options:range:", v10, 0, 0, v9);
  if (v11)
  {
    uint64_t v12 = v11;
    if ([v11 numberOfRanges] != 4) {
      -[MFSMTPConnection _readResponseRange:isContinuation:]();
    }
    uint64_t v30 = v8;
    [v12 range];
    uint64_t v14 = v13;
    uint64_t v28 = [v12 rangeAtIndex:1];
    uint64_t v16 = v15;
    uint64_t v17 = [v12 rangeAtIndex:2];
    uint64_t v29 = v18;
    uint64_t v19 = [v12 rangeAtIndex:3];
    if (v14) {
      BOOL v21 = v16 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21 || v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v27 = [(NSMutableData *)self->_mdata length];
      NSUInteger v26 = 0;
      BOOL v23 = 0;
      int v24 = 550;
    }
    else
    {
      NSUInteger v26 = v19;
      NSUInteger v27 = v20;
      int v24 = strtoul((const char *)(v30 + v28), 0, 10);
      if (v29) {
        BOOL v23 = *(unsigned char *)(v30 + v17) == 45;
      }
      else {
        BOOL v23 = 0;
      }
    }
    a3->location = v26;
    a3->length = v27;
  }
  else
  {
    BOOL v23 = 0;
    int v24 = 0;
  }

  if (a4) {
    goto LABEL_16;
  }
  return v24;
}

uint64_t __54__MFSMTPConnection__readResponseRange_isContinuation___block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^([0-9]+)([- ])?(.*)$" options:16 error:0];
  _readResponseRange_isContinuation___responseRegex = result;
  if (!result) {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"SMTPConnection.m", 990, @"Unable to init regular expression from %@", @"^([0-9]+)([- ])?(.*)$");
  }
  return result;
}

- (BOOL)_connectUsingAccount:(id)a3
{
  [(MFSMTPConnection *)self _setLastResponse:0];
  v12.receiver = self;
  v12.super_class = (Class)MFSMTPConnection;
  unsigned __int8 v5 = [(MFConnection *)&v12 connectUsingAccount:a3];
  socket = self->super._socket;
  if (v5)
  {
    int v7 = [(_MFSocket *)socket timeout];
    self->_int originalSocketTimeout = v7;
    if (v7 >= 1)
    {
      if (v7 <= 300) {
        uint64_t v8 = 300;
      }
      else {
        uint64_t v8 = v7;
      }
      [(_MFSocket *)self->super._socket setTimeout:v8];
    }
    if ([(MFSMTPConnection *)self _getReply] == 2) {
      return 1;
    }
  }
  else
  {

    self->super._socket = 0;
  }
  unint64_t v10 = objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error");
  if (!v10 || [v10 code] == 1029)
  {
    uint64_t v11 = [NSString stringWithFormat:MFLookupLocalizedString(@"FAILED_SEND", @"Check the account settings for the outgoing server “%@”.", @"Delayed", objc_msgSend(a3, "hostname")];
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", @"MFMessageErrorDomain", 1031, v11, MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed"), 0));
  }
  return 0;
}

- (int)_doHandshakeUsingAccount:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v5 = [(_MFSocket *)self->super._socket sourceIPAddress];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [(NSData *)v5 bytes];
  uint64_t v7 = v6;
  uint64_t v8 = &cStr[1];
  memset(v41, 0, sizeof(v41));
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  *(_OWORD *)&cStr[1] = 0u;
  cStr[0] = 91;
  int v9 = *(unsigned __int8 *)(v6 + 1);
  if (v9 == 2)
  {
    unint64_t v10 = (const void *)(v6 + 4);
    int v11 = 2;
  }
  else
  {
    if (v9 != 30)
    {
LABEL_8:
      CFStringRef v12 = 0;
      goto LABEL_9;
    }
    __strlcat_chk();
    uint64_t v8 = &cStr[strlen(&cStr[1]) + 1];
    unint64_t v10 = (const void *)(v7 + 8);
    int v11 = *(unsigned __int8 *)(v7 + 1);
  }
  if (!inet_ntop(v11, v10, v8, cStr - v8 + 126)) {
    goto LABEL_8;
  }
  __strlcat_chk();
  CFStringRef v12 = (id)CFStringCreateWithCString(0, cStr, 0x600u);
  [(MFSMTPConnection *)self setDomainName:v12];
LABEL_9:
  char v33 = 1;
  if (v12) {
    uint64_t v13 = (__CFString *)v12;
  }
  else {
    uint64_t v13 = @"localhost";
  }
  int v14 = [(MFSMTPConnection *)self _sendCommand:"EHLO " length:5 argument:v13 trailer:0];
  if (v14 != 2)
  {
    if (![a3 usesSSL]) {
      goto LABEL_50;
    }
    char v27 = 1;
LABEL_46:
    if (!objc_msgSend((id)*MEMORY[0x1E4F288C8], "isEqualToString:", objc_msgSend((id)objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error"), "domain"))&& (v27 & 1) != 0)
    {
      goto LABEL_50;
    }
    return v14;
  }
  id v32 = a3;
  char v15 = 1;
  char v16 = 1;
  while (1)
  {
    *(void *)cStr = 0;
    *(void *)&cStr[8] = 0;
    if (-[MFSMTPConnection _readResponseRange:isContinuation:](self, "_readResponseRange:isContinuation:", cStr, &v33, v32) == 250)
    {
      if (!(v15 & 1 | (*(void *)&cStr[8] == 0)))
      {
        uint64_t v17 = [(NSMutableData *)self->_mdata bytes];
        uint64_t v18 = v17 + *(void *)cStr;
        *(void *)buf = v17 + *(void *)cStr;
        unint64_t v19 = v17 + *(void *)cStr + *(void *)&cStr[8];
        if (*(void *)&cStr[8] >= 6uLL && !strncasecmp((const char *)(v17 + *(void *)cStr), "AUTH=", 5uLL)) {
          unint64_t v20 = v18 + 5;
        }
        else {
          unint64_t v20 = v19;
        }
        ParameterStringFromuint64_t Bytes = _createParameterStringFromBytes((const UInt8 **)buf, v20);
        if (ParameterStringFromBytes)
        {
          uint64_t v22 = _createParameterStringFromBytes((const UInt8 **)buf, v19);
          if (v22)
          {
            BOOL v23 = v22;
            int v24 = 0;
            do
            {
              if (!v24) {
                int v24 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
              }
              [v24 addObject:v23];

              BOOL v23 = _createParameterStringFromBytes((const UInt8 **)buf, v19);
            }
            while (v23);
          }
          else
          {
            int v24 = 0;
          }
          serviceExtensions = self->_serviceExtensions;
          if (!serviceExtensions)
          {
            serviceExtensions = (NSMutableArray *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
            self->_serviceExtensions = serviceExtensions;
          }
          [(NSMutableArray *)serviceExtensions addObject:ParameterStringFromBytes];
          NSUInteger v26 = self->_serviceExtensions;
          if (v24)
          {
            [(NSMutableArray *)v26 addObject:v24];
          }
          else
          {
            -[NSMutableArray addObject:](v26, "addObject:", [MEMORY[0x1E4F1C978] array]);
          }
        }
      }
      char v16 = 0;
      char v15 = 0;
      goto LABEL_36;
    }
    if ([(MFSMTPResponse *)self->_lastResponse status] != 500) {
      break;
    }
LABEL_36:
    if (!v33) {
      goto LABEL_44;
    }
  }
  uint64_t v28 = MFLogGeneral();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    id v30 = (id)objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", -[NSMutableData bytes](self->_mdata, "bytes"), -[NSMutableData length](self->_mdata, "length"), 4);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v30;
    _os_log_impl(&dword_1CFCFE000, v28, OS_LOG_TYPE_INFO, "--- Got unexpected EHLO response ESMTP params %@", buf, 0xCu);
  }
  char v33 = 0;
LABEL_44:
  a3 = v32;
  if (objc_msgSend(v32, "usesSSL", v32))
  {
    char v27 = v16 & 1;
    goto LABEL_46;
  }
  if (v16)
  {
LABEL_50:
    if (![(_MFSocket *)self->super._socket isWritable]) {
      goto LABEL_56;
    }
    if ([(MFSMTPConnection *)self _sendCommand:"RSET" length:4 argument:0 trailer:0] == 2)[(MFSMTPConnection *)self _getReply]; {
    if (![(_MFSocket *)self->super._socket isWritable]
    }
      || [(MFSMTPConnection *)self _sendCommand:"HELO " length:5 argument:v13 trailer:0] != 2|| (int v14 = [(MFSMTPConnection *)self _getReply], v14 != 2))
    {
LABEL_56:
      [(_MFSocket *)self->super._socket abort];

      self->super._socket = 0;
      if ([(MFSMTPConnection *)self _connectUsingAccount:a3])
      {
        int v14 = [(MFSMTPConnection *)self _sendCommand:"HELO " length:5 argument:v13 trailer:0];
        if (v14 == 2) {
          return [(MFSMTPConnection *)self _getReply];
        }
      }
    }
  }
  return v14;
}

- (BOOL)_hasParameter:(id)a3 forKeyword:(id)a4
{
  unint64_t v7 = [(NSMutableArray *)self->_serviceExtensions count];
  uint64_t v8 = [a3 uppercaseString];
  if (v7 >= 2)
  {
    uint64_t v10 = v8;
    unint64_t v11 = 1;
    do
    {
      BOOL v12 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v11 - 1), "caseInsensitiveCompare:", a4) == 0;
      BOOL v9 = v12;
      BOOL v12 = !v12 || v10 == 0;
      if (!v12) {
        BOOL v9 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v11), "indexOfObject:", v10) != 0x7FFFFFFFFFFFFFFFLL;
      }
      v11 += 2;
    }
    while (v11 < v7 && !v9);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)_supportsExtension:(id)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_serviceExtensions count];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v7), "caseInsensitiveCompare:", a3);
      LOBYTE(v5) = v8 == 0;
      if (v7 + 3 > v6) {
        break;
      }
      v7 += 2;
    }
    while (v8);
  }
  return v5;
}

- (void)_setLastResponse:(id)a3
{
  lastResponse = self->_lastResponse;
  if (lastResponse != a3)
  {

    self->_lastResponse = (MFSMTPResponse *)a3;
  }
}

- (id)lastResponseLine
{
  id v2 = [(MFSMTPResponse *)self->_lastResponse lastResponseLine];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v3 = (__CFString *)v2;
LABEL_5:
    return v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v3 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)[v2 bytes], objc_msgSend(v2, "length"), 0x600u, 0);
    goto LABEL_5;
  }
  return (id)[v2 description];
}

- (BOOL)_supportsSaveSentExtension
{
  return [(MFSMTPConnection *)self _supportsExtension:@"SSNT"];
}

- (void)setUseSaveSent:(BOOL)a3 toFolder:(id)a4
{
  self->_useSaveSent = a3;
  if (([a4 isEqualToString:self->_saveSentMbox] & 1) == 0)
  {
    self->_dislikesSaveSentMbox = 0;

    self->_saveSentMbox = (NSString *)[a4 copy];
  }
}

- (void)_readResponseRange:isContinuation:.cold.1()
{
  __assert_rtn("-[MFSMTPConnection _readResponseRange:isContinuation:]", "SMTPConnection.m", 997, "[match numberOfRanges] == 4");
}

@end