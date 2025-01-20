@interface _MFSocket
- (BOOL)_certificateIsTrustedForAccount:(id)a3;
- (BOOL)_evaluateTrust:(__SecTrust *)a3 errorPtr:(id *)a4;
- (BOOL)_startSSLHandshakeWithProtocol:(id)a3 errorPtr:(id *)a4;
- (BOOL)_waitForSocketOpenAndFlag:(BOOL *)a3;
- (BOOL)allowsTrustPrompt;
- (BOOL)connectToHost:(id)a3 withPort:(unsigned int)a4 service:(id)a5;
- (BOOL)disableEphemeralDiffieHellmanCiphers;
- (BOOL)isCellularConnection;
- (BOOL)isReadable;
- (BOOL)isValid;
- (BOOL)isWritable;
- (BOOL)setSecurityProtocol:(id)a3;
- (BOOL)usesOpportunisticSockets;
- (MFStream)stream;
- (NSArray)clientCertificates;
- (NSArray)serverCertificates;
- (NSData)sourceIPAddress;
- (NSString)accountIdentifier;
- (NSString)networkAccountIdentifier;
- (NSString)remoteHostname;
- (NSString)sourceApplicationBundleIdentifier;
- (_MFSocket)init;
- (id)_negotiatedProtocolVersion;
- (id)securityProtocol;
- (int)timeout;
- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4;
- (int64_t)writeBytes:(const char *)a3 length:(unint64_t)a4;
- (unsigned)_bufferedByteCount;
- (unsigned)remotePortNumber;
- (void)_setCertificateIsTrusted:(BOOL)a3 forAccount:(id)a4;
- (void)abort;
- (void)dealloc;
- (void)enableThroughputMonitoring:(BOOL)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAllowsTrustPrompt:(BOOL)a3;
- (void)setClientCertificates:(id)a3;
- (void)setConnectionServiceType:(__CFString *)a3;
- (void)setDisableEphemeralDiffieHellmanCiphers:(BOOL)a3;
- (void)setEventHandler:(id)a3;
- (void)setNetworkAccountIdentifier:(id)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setStream:(id)a3;
- (void)setTimeout:(int)a3;
- (void)setUsesOpportunisticSockets:(BOOL)a3;
@end

@implementation _MFSocket

- (BOOL)_certificateIsTrustedForAccount:(id)a3
{
  v3 = (void *)[a3 valueInAccountPropertiesForKey:@"MFServerSSLCertificateIsTrusted"];
  return [v3 BOOLValue];
}

- (void)_setCertificateIsTrusted:(BOOL)a3 forAccount:(id)a4
{
  objc_msgSend(a4, "setValueInAccountProperties:forKey:", objc_msgSend(NSNumber, "numberWithBool:", a3), @"MFServerSSLCertificateIsTrusted");
  [a4 savePersistentAccount];
}

- (BOOL)_evaluateTrust:(__SecTrust *)a3 errorPtr:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(id)objc_opt_class() existingAccountForUniqueID:self->_accountIdentifier];
  BOOL v8 = [(_MFSocket *)self _certificateIsTrustedForAccount:v7];
  int v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F58108], "defaultTrustManager"), "rawTrustResultForSSLTrust:hostname:service:", a3, self->_host, self->_service);
  v10 = MFLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    uint64_t v30 = objc_opt_class();
    __int16 v31 = 2048;
    v32 = self;
    __int16 v33 = 1024;
    int v34 = v9;
    __int16 v35 = 2112;
    uint64_t v36 = v7;
    _os_log_impl(&dword_1CFCFE000, v10, OS_LOG_TYPE_INFO, "#Network <%{public}@:%p> Got SecTrustResultType %u for %@", buf, 0x26u);
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  switch(v9)
  {
    case 1:
      char v26 = 1;
      break;
    case 5:
      if ([(_MFSocket *)self allowsTrustPrompt])
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F58100]);
        [v12 setHost:self->_host];
        [v12 setService:self->_service];
        [v12 setTrust:a3];
        if (v8)
        {
          uint64_t v13 = *MEMORY[0x1E4F58128];
          v27[0] = *MEMORY[0x1E4F58130];
          v27[1] = v13;
          v28[0] = MEMORY[0x1E4F1CC28];
          v28[1] = MEMORY[0x1E4F1CC28];
          uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
        }
        else
        {
          uint64_t v14 = 0;
        }
        v19 = dispatch_semaphore_create(0);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __37___MFSocket__evaluateTrust_errorPtr___block_invoke;
        v22[3] = &unk_1E6866208;
        v22[8] = &v23;
        v22[9] = a4;
        v22[4] = self;
        v22[5] = v7;
        v22[10] = a3;
        v22[6] = v12;
        v22[7] = v19;
        [v12 showPromptWithOptions:v14 responseBlock:v22];
        dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v19);
      }
      else
      {
        v17 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:0];
        if (!v17) {
          v17 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
        }
        *a4 = v17;
        v18 = MFLogGeneral();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[_MFSocket _evaluateTrust:errorPtr:]((uint64_t)self, [(MFError *)v17 domain], buf);
        }
      }
      break;
    case 4:
      if (v8)
      {
        v11 = &v26;
      }
      else
      {
        [(_MFSocket *)self _setCertificateIsTrusted:1 forAccount:v7];
        v11 = (char *)(v24 + 3);
      }
      char *v11 = 1;
      break;
    default:
      v15 = +[MFError errorWithDomain:*MEMORY[0x1E4F288C8] code:-9825 localizedDescription:0];
      if (!v15) {
        v15 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
      }
      *a4 = v15;
      v16 = MFLogGeneral();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[_MFSocket _evaluateTrust:errorPtr:]((uint64_t)self, [(MFError *)v15 domain], buf);
      }
      break;
  }
  char v20 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  return v20;
}

- (id)_negotiatedProtocolVersion
{
  SSLProtocol protocol = kSSLProtocolUnknown;
  v2 = [(_MFSocket *)self stream];
  if (SSLGetNegotiatedProtocolVersion((SSLContextRef)[(MFStream *)v2 propertyForKey:*MEMORY[0x1E4F19100]], &protocol))
  {
    return @"kSSLProtocolUnknown";
  }
  if (protocol >= kTLSProtocol13) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"unknown-protocol-version(%d)", protocol);
  }
  return off_1E6866298[protocol];
}

- (BOOL)_startSSLHandshakeWithProtocol:(id)a3 errorPtr:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(_MFSocket *)self stream];
  if (!v7)
  {
    v18 = +[MFError errorWithDomain:*MEMORY[0x1E4F28798] code:54 localizedDescription:0];
    if (!v18) {
      v18 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
    }
    *a4 = v18;
    v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_MFSocket _startSSLHandshakeWithProtocol:errorPtr:]();
    }
    return 0;
  }
  BOOL v8 = v7;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if ([a3 isEqualToString:*MEMORY[0x1E4F1D4B8]]) {
    id v10 = (id)*MEMORY[0x1E4F19148];
  }
  else {
    id v10 = a3;
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F19130], v10);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F18F18], (const void *)[NSNumber numberWithBool:self->_disableEphemeralDiffieHellmanCiphers]);
  v11 = [(_MFSocket *)self clientCertificates];
  if (v11) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F19128], v11);
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F19140], (const void *)*MEMORY[0x1E4F1CFC8]);
  *(_WORD *)&self->_socketCanRead = 0;
  uint64_t v12 = *MEMORY[0x1E4F19110];
  BOOL v13 = [(MFStream *)v8 setProperty:Mutable forKey:*MEMORY[0x1E4F19110]];
  CFRelease(Mutable);
  if (!v13)
  {
    char v20 = +[MFError errorWithDomain:*MEMORY[0x1E4F288C8] code:1029 localizedDescription:0];
    if (!v20) {
      char v20 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
    }
    *a4 = v20;
    v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[_MFSocket _startSSLHandshakeWithProtocol:errorPtr:].cold.4();
    }
    v22 = 0;
    goto LABEL_35;
  }
  BOOL v14 = [(_MFSocket *)self _waitForSocketOpenAndFlag:&self->_socketCanWrite];
  if (!self->_socketCanWrite || ![(MFStream *)v8 isOpen])
  {
    v22 = [(MFStream *)v8 streamError];
    uint64_t v23 = [(NSError *)v22 domain];
    uint64_t v24 = *MEMORY[0x1E4F288C8];
    if ([(NSString *)v23 isEqualToString:*MEMORY[0x1E4F288C8]])
    {
      uint64_t v25 = +[MFError errorWithDomain:v24 code:[(NSError *)v22 code] localizedDescription:0];
      if (!v25) {
        uint64_t v25 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
      }
      *a4 = v25;
      char v26 = MFLogGeneral();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int v36 = 136315906;
        uint64_t v37 = "SSL negotiation failed";
        __int16 v38 = 2048;
        v39 = self;
        __int16 v40 = 2112;
        id v41 = (id)[(MFError *)v25 domain];
        __int16 v42 = 2048;
        id v43 = [(NSError *)v22 code];
        _os_log_error_impl(&dword_1CFCFE000, v26, OS_LOG_TYPE_ERROR, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
          (uint8_t *)&v36,
          0x2Au);
      }
      goto LABEL_35;
    }
    if (!v14)
    {
      v27 = +[MFError errorWithDomain:*MEMORY[0x1E4F28798] code:60 localizedDescription:0];
      if (!v27) {
        v27 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
      }
      *a4 = v27;
      v28 = MFLogGeneral();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[_MFSocket _startSSLHandshakeWithProtocol:errorPtr:]();
      }
      goto LABEL_35;
    }
LABEL_34:
    if (!a4) {
      return 0;
    }
LABEL_35:
    if (!*a4)
    {
      if (v22)
      {
        v29 = +[MFError errorWithDomain:[(NSError *)v22 domain] code:[(NSError *)v22 code] localizedDescription:0];
        if (!v29) {
          v29 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
        }
        *a4 = v29;
        uint64_t v30 = MFLogGeneral();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = [(MFError *)v29 domain];
          uint64_t v32 = [(NSError *)v22 code];
          int v36 = 136315906;
          uint64_t v37 = "CFReadStreamSetProperty()";
          __int16 v38 = 2048;
          v39 = self;
          __int16 v40 = 2112;
          id v41 = (id)v31;
          __int16 v42 = 2048;
          id v43 = (id)v32;
          _os_log_error_impl(&dword_1CFCFE000, v30, OS_LOG_TYPE_ERROR, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
            (uint8_t *)&v36,
            0x2Au);
        }
      }
      else
      {
        __int16 v33 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
        if (!v33) {
          __int16 v33 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
        }
        *a4 = v33;
        int v34 = MFLogGeneral();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[_MFSocket _startSSLHandshakeWithProtocol:errorPtr:]();
        }
      }
    }
    return 0;
  }
  uint64_t v15 = [(MFStream *)v8 propertyForKey:*MEMORY[0x1E4F19108]];
  if (!v15 || ![(_MFSocket *)self _evaluateTrust:v15 errorPtr:a4])
  {
    v22 = 0;
    goto LABEL_34;
  }
  v16 = MFLogGeneral();
  BOOL v17 = 1;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v36 = 138544386;
    uint64_t v37 = (const char *)objc_opt_class();
    __int16 v38 = 2048;
    v39 = self;
    __int16 v40 = 2114;
    id v41 = [(_MFSocket *)self securityProtocol];
    __int16 v42 = 2114;
    id v43 = [(_MFSocket *)self _negotiatedProtocolVersion];
    __int16 v44 = 2112;
    uint64_t v45 = [(MFStream *)v8 propertyForKey:v12];
    BOOL v17 = 1;
    _os_log_impl(&dword_1CFCFE000, v16, OS_LOG_TYPE_INFO, "#Network <%{public}@:%p> SSL handshake completed successfully: %{public}@ %{public}@, %@", (uint8_t *)&v36, 0x34u);
  }
  return v17;
}

- (BOOL)_waitForSocketOpenAndFlag:(BOOL *)a3
{
  [(NSCondition *)self->_condition lock];
  while (!*a3 && [(MFStream *)[(_MFSocket *)self stream] isOpen])
  {
    if (!-[NSCondition waitUntilDate:](self->_condition, "waitUntilDate:", [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:30.0]))
    {
      BOOL v5 = 0;
      goto LABEL_7;
    }
  }
  BOOL v5 = 1;
LABEL_7:
  [(NSCondition *)self->_condition unlock];
  return v5;
}

- (id)securityProtocol
{
  v2 = [(_MFSocket *)self stream];
  uint64_t v3 = [(MFStream *)v2 propertyForKey:*MEMORY[0x1E4F1D4A0]];
  if (!v3) {
    return (id)*MEMORY[0x1E4F1D4C0];
  }
  v4 = (void *)v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return (id)*MEMORY[0x1E4F1D4C0];
  }
  return v4;
}

- (BOOL)setSecurityProtocol:(id)a3
{
  _MFLockGlobalLock();
  if ([(NSString *)self->_protocol isEqualToString:a3])
  {
    SSLProtocol protocol = 0;
  }
  else
  {
    SSLProtocol protocol = self->_protocol;
    self->_SSLProtocol protocol = (NSString *)a3;
  }
  _MFUnlockGlobalLock();
  BOOL v6 = 1;
  if ([(_MFSocket *)self stream]
    && a3
    && protocol != a3
    && ([a3 isEqualToString:*MEMORY[0x1E4F1D4C0]] & 1) == 0)
  {
    v11 = 0;
    BOOL v6 = [(_MFSocket *)self _startSSLHandshakeWithProtocol:a3 errorPtr:&v11];
    if (!v6)
    {
      if (!v11)
      {
        uint64_t v7 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
        if (!v7) {
          uint64_t v7 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
        }
        v11 = v7;
        BOOL v8 = MFLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[_MFSocket setSecurityProtocol:]();
        }
      }
      id v9 = +[MFActivityMonitor currentMonitor];
      [v9 setError:v11];
    }
  }
  return v6;
}

- (NSArray)serverCertificates
{
  v2 = [(_MFSocket *)self stream];
  uint64_t v3 = [(MFStream *)v2 propertyForKey:*MEMORY[0x1E4F19108]];
  if (!v3) {
    return 0;
  }
  v4 = v3;
  CFIndex CertificateCount = SecTrustGetCertificateCount(v3);
  BOOL v6 = (NSArray *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:CertificateCount];
  if (CertificateCount >= 1)
  {
    for (CFIndex i = 0; i != CertificateCount; ++i)
      [(NSArray *)v6 addObject:SecTrustGetCertificateAtIndex(v4, i)];
  }
  return v6;
}

- (void)setConnectionServiceType:(__CFString *)a3
{
  [(_MFSocket *)self mf_lock];
  connectionServiceType = self->_connectionServiceType;
  if (connectionServiceType != a3)
  {
    if (connectionServiceType) {
      CFRelease(connectionServiceType);
    }
    if (a3) {
      BOOL v6 = (__CFString *)CFRetain(a3);
    }
    else {
      BOOL v6 = 0;
    }
    self->_connectionServiceType = v6;
  }
  [(_MFSocket *)self mf_unlock];
}

- (_MFSocket)init
{
  v4.receiver = self;
  v4.super_class = (Class)_MFSocket;
  v2 = [(_MFSocket *)&v4 init];
  if (v2)
  {
    if (init_once != -1) {
      dispatch_once(&init_once, &__block_literal_global_247);
    }
    v2->_numTimeoutSecs = _DefaultTimeout;
    v2->_condition = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
  }
  return v2;
}

- (void)dealloc
{
  connectionServiceType = self->_connectionServiceType;
  if (connectionServiceType) {
    CFRelease(connectionServiceType);
  }
  [(_MFSocket *)self abort];

  v4.receiver = self;
  v4.super_class = (Class)_MFSocket;
  [(_MFSocket *)&v4 dealloc];
}

- (void)abort
{
  uint64_t v3 = [(_MFSocket *)self stream];
  [(_MFSocket *)self setStream:0];
  [(MFStream *)v3 close];
  [(NSCondition *)self->_condition lock];
  *(_WORD *)&self->_socketCanRead = 0;
  [(NSCondition *)self->_condition broadcast];
  [(NSCondition *)self->_condition unlock];
  objc_super v4 = (void *)MFUserAgent();
  [v4 networkActivityEnded:self];
}

- (BOOL)isReadable
{
  return self->_socketCanRead;
}

- (BOOL)isWritable
{
  return self->_socketCanWrite;
}

- (BOOL)isValid
{
  v2 = [(_MFSocket *)self stream];
  return [(MFStream *)v2 isOpen];
}

- (BOOL)connectToHost:(id)a3 withPort:(unsigned int)a4 service:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([+[MFNetworkController sharedInstance] inAirplaneMode])
  {
    return 0;
  }
  [(id)MFUserAgent() networkActivityStarted:self];
  if (![(NSString *)self->_host isEqualToString:a3])
  {

    self->_host = (NSString *)[a3 copy];
  }
  if (![(NSString *)self->_service isEqualToString:a5])
  {

    self->_service = (NSString *)[a5 copy];
  }
  v28 = 0;
  MFAssertNetworkActivityAllowed();
  id v10 = [MFStream alloc];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __44___MFSocket_connectToHost_withPort_service___block_invoke;
  v27[3] = &unk_1E6866250;
  v27[4] = self;
  id v11 = [(MFStream *)v10 initCallBack:v27 onDispatchQueue:+[MFStream _networkDispatchQueue]];
  [(_MFSocket *)self setStream:v11];

  connectionServiceType = self->_connectionServiceType;
  BOOL v13 = (void *)MEMORY[0x1E4F1CFD0];
  if (connectionServiceType)
  {
    [v11 setProperty:connectionServiceType forKey:*MEMORY[0x1E4F190B0]];
    [v11 setProperty:*v13 forKey:*MEMORY[0x1E4F190B8]];
  }
  if (self->_usesOpportunisticSockets) {
    [v11 setProperty:*v13 forKey:*MEMORY[0x1E4F190F8]];
  }
  id v14 = +[MFActivityMonitor currentMonitor];
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __44___MFSocket_connectToHost_withPort_service___block_invoke_2;
  v24[3] = &unk_1E6866278;
  objc_copyWeak(&v25, &location);
  v24[4] = v14;
  id v15 = (id)[v24 copy];
  [v11 setProperty:v15 forKey:*MEMORY[0x1E4F18EF0]];
  sourceApplicationBundleIdentifier = self->_sourceApplicationBundleIdentifier;
  if (sourceApplicationBundleIdentifier) {
    [v11 setProperty:sourceApplicationBundleIdentifier forKey:*MEMORY[0x1E4F19120]];
  }
  networkAccountIdentifier = self->_networkAccountIdentifier;
  if (networkAccountIdentifier) {
    [v11 setProperty:networkAccountIdentifier forKey:*MEMORY[0x1E4F19068]];
  }
  v18 = MFLogGeneral();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = self->_networkAccountIdentifier;
    *(_DWORD *)buf = 134218754;
    uint64_t v30 = self;
    __int16 v31 = 2048;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = a3;
    __int16 v35 = 2112;
    int v36 = v19;
    _os_log_impl(&dword_1CFCFE000, v18, OS_LOG_TYPE_INFO, "#Streams socket %p (stream %p) opening connection to %@ (network account id: %@)", buf, 0x2Au);
  }
  objc_msgSend(v11, "openToHostName:port:", objc_msgSend(MEMORY[0x1E4F60850], "stringByEncodingDomainName:", a3), a4);
  _MFLockGlobalLock();
  char v20 = self->_protocol;
  _MFUnlockGlobalLock();
  BOOL v9 = !v20
    || [(NSString *)v20 isEqualToString:*MEMORY[0x1E4F1D4C0]]
    || [(_MFSocket *)self _startSSLHandshakeWithProtocol:v20 errorPtr:&v28];

  if (!v9 && ![v14 error])
  {
    if (!v28)
    {
      v21 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
      if (!v21) {
        v21 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
      }
      v28 = v21;
      v22 = MFLogGeneral();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[_MFSocket connectToHost:withPort:service:]((uint64_t)self, [(MFError *)v21 domain], buf);
      }
    }
    [v14 setError:v28];
  }

  [(id)MFUserAgent() networkActivityEnded:self];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  return v9;
}

- (unsigned)_bufferedByteCount
{
  int v8 = 0;
  v2 = [(_MFSocket *)self stream];
  uint64_t v3 = [(MFStream *)v2 propertyForKey:*MEMORY[0x1E4F1D488]];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v4 length] == 4
      && (int v5 = *(_DWORD *)[v4 bytes], v5 != -1))
    {
      socklen_t v7 = 4;
      getsockopt(v5, 0xFFFF, 4132, &v8, &v7);
      LODWORD(v3) = v8;
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  return v3;
}

- (int64_t)writeBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(id)MFUserAgent() networkActivityStarted:self];
  MFAssertNetworkActivityAllowed();
  unsigned int v7 = [(_MFSocket *)self _bufferedByteCount];
  [(NSCondition *)self->_condition lock];
  int v8 = [(_MFSocket *)self stream];
  while (!self->_socketCanWrite && [(MFStream *)v8 isOpen])
  {
    int numTimeoutSecs = self->_numTimeoutSecs;
    double v10 = (double)numTimeoutSecs;
    if (!numTimeoutSecs) {
      double v10 = 1.79769313e308;
    }
    if (!-[NSCondition waitUntilDate:](self->_condition, "waitUntilDate:", [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v10]))
    {
      unsigned int v11 = [(_MFSocket *)self _bufferedByteCount];
      BOOL v12 = v7 == v11;
      unsigned int v7 = v11;
      if (v12) {
        break;
      }
    }
  }
  [(NSCondition *)self->_condition unlock];
  if (self->_socketCanWrite && [(MFStream *)v8 isOpen])
  {
    self->_socketCanWrite = 0;
    int64_t v13 = [(MFStream *)v8 write:a3 maxLength:a4];
    if ((v13 & 0x8000000000000000) == 0) {
      goto LABEL_21;
    }
  }
  else
  {
    int64_t v13 = -1;
  }
  id v14 = [(MFStream *)v8 streamError];
  if (!v14) {
    id v14 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:60 userInfo:0];
  }
  id v15 = +[MFError errorWithDomain:[(NSError *)v14 domain] code:[(NSError *)v14 code] localizedDescription:0];
  if (!v15) {
    id v15 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
  }
  v16 = v15;
  BOOL v17 = MFLogGeneral();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315906;
    char v20 = "";
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = [(MFError *)v15 domain];
    __int16 v25 = 2048;
    uint64_t v26 = [(NSError *)v14 code];
    _os_log_error_impl(&dword_1CFCFE000, v17, OS_LOG_TYPE_ERROR, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
      (uint8_t *)&v19,
      0x2Au);
  }
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", v16);

LABEL_21:
  [(id)MFUserAgent() networkActivityEnded:self];
  return v13;
}

- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = +[MFActivityMonitor currentMonitor];
  if ([v7 shouldCancel])
  {
    int v8 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1028 localizedDescription:0];
    if (!v8) {
      int v8 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
    }
    BOOL v9 = v8;
    double v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_MFSocket readBytes:length:]();
    }
    [v7 setError:v9];

    return -1;
  }
  else
  {
    [(id)MFUserAgent() networkActivityStarted:self];
    MFAssertNetworkActivityAllowed();
    unsigned int v12 = [(_MFSocket *)self _bufferedByteCount];
    [(NSCondition *)self->_condition lock];
    int64_t v13 = [(_MFSocket *)self stream];
    while (!self->_socketCanRead && [(MFStream *)v13 isOpen])
    {
      int numTimeoutSecs = self->_numTimeoutSecs;
      double v15 = (double)numTimeoutSecs;
      if (!numTimeoutSecs) {
        double v15 = 1.79769313e308;
      }
      if (!-[NSCondition waitUntilDate:](self->_condition, "waitUntilDate:", [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v15]))
      {
        unsigned int v16 = [(_MFSocket *)self _bufferedByteCount];
        BOOL v17 = v12 == v16;
        unsigned int v12 = v16;
        if (v17) {
          break;
        }
      }
    }
    [(NSCondition *)self->_condition unlock];
    if (!self->_socketCanRead
      || ![(MFStream *)v13 isOpen]
      || (self->_socketCanRead = 0, int64_t v11 = [(MFStream *)v13 read:a3 maxLength:a4], v11 == -1))
    {
      v18 = [(MFStream *)v13 streamError];
      if (!v18) {
        v18 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:60 userInfo:0];
      }
      int v19 = +[MFError errorWithDomain:[(NSError *)v18 domain] code:[(NSError *)v18 code] localizedDescription:0];
      if (!v19) {
        int v19 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1029 localizedDescription:0];
      }
      char v20 = v19;
      __int16 v21 = MFLogGeneral();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v23 = 136315906;
        uint64_t v24 = "";
        __int16 v25 = 2048;
        uint64_t v26 = self;
        __int16 v27 = 2112;
        uint64_t v28 = [(MFError *)v19 domain];
        __int16 v29 = 2048;
        uint64_t v30 = [(NSError *)v18 code];
        _os_log_error_impl(&dword_1CFCFE000, v21, OS_LOG_TYPE_ERROR, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
          (uint8_t *)&v23,
          0x2Au);
      }
      objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", v20);

      int64_t v11 = -1;
    }
    [(id)MFUserAgent() networkActivityEnded:self];
  }
  return v11;
}

- (void)setEventHandler:(id)a3
{
  [(_MFSocket *)self mf_lock];
  eventHandler = self->_eventHandler;
  if (eventHandler != a3)
  {

    self->_eventHandler = (NSInvocation *)a3;
  }
  [(_MFSocket *)self mf_unlock];
}

- (NSString)remoteHostname
{
  v2 = [(_MFSocket *)self stream];
  uint64_t v3 = *MEMORY[0x1E4F1D490];
  return (NSString *)[(MFStream *)v2 propertyForKey:v3];
}

- (unsigned)remotePortNumber
{
  v2 = [(_MFSocket *)self stream];
  id v3 = [(MFStream *)v2 propertyForKey:*MEMORY[0x1E4F1D498]];
  if (v3)
  {
    LODWORD(v3) = [v3 unsignedIntValue];
  }
  return v3;
}

- (NSData)sourceIPAddress
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(_MFSocket *)self stream];
  uint64_t v3 = [(MFStream *)v2 propertyForKey:*MEMORY[0x1E4F1D488]];
  if (v3
    && (objc_super v4 = (void *)v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v4 length] == 4
    && (v5 = *(_DWORD *)[v4 bytes], socklen_t v8 = 255, (v5 & 0x80000000) == 0)
    && (!getsockname(v5, &v9, &v8) ? (BOOL v6 = v8 == 0) : (BOOL v6 = 1), !v6))
  {
    return (NSData *)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v9);
  }
  else
  {
    return 0;
  }
}

- (BOOL)isCellularConnection
{
  v2 = (void *)*MEMORY[0x1E4F1CFD0];
  uint64_t v3 = [(_MFSocket *)self stream];
  return v2 == [(MFStream *)v3 propertyForKey:*MEMORY[0x1E4F190A8]];
}

- (void)enableThroughputMonitoring:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((_LowThroughputThreshold & 1) == 0)
  {
    BOOL v3 = a3;
    int v5 = [(_MFSocket *)self stream];
    BOOL v6 = v5;
    if (!v3)
    {
      [(MFStream *)v5 setProperty:&unk_1F2675490 forKey:*MEMORY[0x1E4F18EF8]];
      self->_lowThroughputCounter = 0;
      sockaddr v9 = MFLogGeneral();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        return;
      }
      int v11 = 138412290;
      unsigned int v12 = v6;
      uint64_t v10 = "#Streams throughput monitoring OFF for stream %@";
      goto LABEL_10;
    }
    if (_LowThroughputThreshold) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = 512;
    }
    uint64_t v8 = [NSNumber numberWithInt:v7];
    [(MFStream *)v6 setProperty:v8 forKey:*MEMORY[0x1E4F18EF8]];
    sockaddr v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      unsigned int v12 = v6;
      uint64_t v10 = "#Streams throughput monitoring ON for stream %@";
LABEL_10:
      _os_log_impl(&dword_1CFCFE000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0xCu);
    }
  }
}

- (int)timeout
{
  return self->_numTimeoutSecs;
}

- (void)setTimeout:(int)a3
{
  self->_int numTimeoutSecs = a3;
}

- (BOOL)allowsTrustPrompt
{
  return self->_allowsTrustPrompt;
}

- (void)setAllowsTrustPrompt:(BOOL)a3
{
  self->_allowsTrustPrompt = a3;
}

- (BOOL)usesOpportunisticSockets
{
  return self->_usesOpportunisticSockets;
}

- (void)setUsesOpportunisticSockets:(BOOL)a3
{
  self->_usesOpportunisticSockets = a3;
}

- (BOOL)disableEphemeralDiffieHellmanCiphers
{
  return self->_disableEphemeralDiffieHellmanCiphers;
}

- (void)setDisableEphemeralDiffieHellmanCiphers:(BOOL)a3
{
  self->_disableEphemeralDiffieHellmanCiphers = a3;
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (void)setClientCertificates:(id)a3
{
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)networkAccountIdentifier
{
  return self->_networkAccountIdentifier;
}

- (void)setNetworkAccountIdentifier:(id)a3
{
}

- (MFStream)stream
{
  return (MFStream *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStream:(id)a3
{
}

- (void)_evaluateTrust:(_DWORD *)a3 errorPtr:.cold.1(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315906;
  OUTLINED_FUNCTION_3(a1, a2, (uint64_t)a3);
  *(void *)(v3 + 34) = -9825;
  OUTLINED_FUNCTION_11(&dword_1CFCFE000, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)", v4, v5);
}

- (void)_evaluateTrust:(_DWORD *)a3 errorPtr:.cold.2(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315906;
  OUTLINED_FUNCTION_3(a1, a2, (uint64_t)a3);
  *(void *)(v3 + 34) = 1030;
  OUTLINED_FUNCTION_11(&dword_1CFCFE000, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)", v4, v5);
}

- (void)_startSSLHandshakeWithProtocol:errorPtr:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1CFCFE000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
}

- (void)_startSSLHandshakeWithProtocol:errorPtr:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CFCFE000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
}

- (void)_startSSLHandshakeWithProtocol:errorPtr:.cold.3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CFCFE000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
}

- (void)_startSSLHandshakeWithProtocol:errorPtr:.cold.4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CFCFE000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
}

- (void)setSecurityProtocol:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CFCFE000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
}

- (void)connectToHost:(uint64_t)a1 withPort:(uint64_t)a2 service:(_DWORD *)a3 .cold.1(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315906;
  OUTLINED_FUNCTION_3(a1, a2, (uint64_t)a3);
  *(void *)(v3 + 34) = 1029;
  OUTLINED_FUNCTION_11(&dword_1CFCFE000, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)", v4, v5);
}

- (void)readBytes:length:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1CFCFE000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
}

@end