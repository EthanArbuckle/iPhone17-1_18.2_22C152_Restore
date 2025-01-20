@interface ACCHTTPHandler
+ (id)handlerWithContext:(id)a3;
- (ACCAuthContextProtocol)context;
- (ACCHTTPHandler)initWithContext:(id)a3;
- (ACFHTTPTransportProtocol)transport;
- (BOOL)installCertificateWithString:(id)a3 version:(id)a4 forRealm:(id)a5;
- (BOOL)isCanceled;
- (BOOL)isConnectionError:(id)a3;
- (BOOL)isUknownServerError:(id)a3;
- (BOOL)shouldIgnoreInvalidDSPublicKey;
- (BOOL)shouldIgnoreInvalidToken;
- (BOOL)shouldReturnResponse:(id)a3 orReportError:(id *)a4;
- (BOOL)shouldTryOtherServers:(id)a3 error:(id)a4;
- (BOOL)updatePublicKeyWithResponse:(id)a3;
- (NSArray)serverAttemptsDelays;
- (NSArray)serverHosts;
- (NSDictionary)httpRequestDictionary;
- (NSDictionary)requestBody;
- (NSDictionary)requestHeader;
- (NSString)iForgotURL;
- (id)convertErrorToACMError:(id)a3;
- (id)finalizeBlock;
- (id)iForgotString;
- (id)invalidPublicKeyErrorForReponse:(id)a3 error:(id)a4;
- (id)realm;
- (id)responseWithData:(id)a3 error:(id *)a4;
- (void)cancelRequest;
- (void)dealloc;
- (void)performRequestWithCompletionBlock:(id)a3;
- (void)setContext:(id)a3;
- (void)setFinalizeBlock:(id)a3;
- (void)setShouldIgnoreInvalidDSPublicKey:(BOOL)a3;
- (void)setShouldIgnoreInvalidToken:(BOOL)a3;
- (void)setTransport:(id)a3;
- (void)uninstallPublicKeyForRealm:(id)a3;
- (void)updateTransport;
@end

@implementation ACCHTTPHandler

+ (id)handlerWithContext:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithContext:a3];

  return v3;
}

- (ACCHTTPHandler)initWithContext:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ACCHTTPHandler;
  v4 = [(ACCHTTPHandler *)&v9 init];
  v5 = v4;
  if (v4)
  {
    [(ACCHTTPHandler *)v4 setContext:a3];
    [(ACFHTTPTransportProtocol *)[(ACCHTTPHandler *)v5 transport] setHttpMethod:@"POST"];
    [-[ACCHTTPHandler transport](v5, "transport") setHttpHeader:[NSDictionary dictionaryWithObjectsAndKeys:@"text/x-xml-plist", @"Content-Type", 0]];
    [(ACFHTTPTransportProtocol *)[(ACCHTTPHandler *)v5 transport] setServerHosts:[(ACCHTTPHandler *)v5 serverHosts]];
    [(ACFHTTPTransportProtocol *)[(ACCHTTPHandler *)v5 transport] setServerAttemptsDelays:[(ACCHTTPHandler *)v5 serverAttemptsDelays]];
    v6 = [((id)objc_msgSend(a3, "request")) serverResponseTimeout];
    if (v6)
    {
      [v6 floatValue];
      [(ACFHTTPTransportProtocol *)[(ACCHTTPHandler *)v5 transport] setTimeout:v7];
    }
    [((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter")) addObserver:v5 selector:sel_cancelRequest name:@"CancelRequests" object:0];
  }
  return v5;
}

- (void)dealloc
{
  [objc_msgSend(MEMORY[0x263F08A00], "defaultCenter") removeObserver:self];
  [(ACCHTTPHandler *)self setTransport:0];
  [(ACCHTTPHandler *)self setFinalizeBlock:0];
  [(ACCHTTPHandler *)self setContext:0];
  v3.receiver = self;
  v3.super_class = (Class)ACCHTTPHandler;
  [(ACCHTTPHandler *)&v3 dealloc];
}

- (id)realm
{
  v2 = (void *)[(ACCAuthContextProtocol *)[(ACCHTTPHandler *)self context] request];

  return (id)[v2 realm];
}

- (ACFHTTPTransportProtocol)transport
{
  result = self->_transport;
  if (!result)
  {
    v4 = (ACFHTTPTransportProtocol *)[+[ACFComponents components](ACFComponents, "components") createTransport];
    self->_transport = v4;
    char v5 = [(ACFHTTPTransportProtocol *)v4 conformsToProtocol:&unk_26F29DAB0];
    result = self->_transport;
    if ((v5 & 1) == 0)
    {

      result = 0;
      self->_transport = 0;
    }
  }
  return result;
}

- (BOOL)isCanceled
{
  v2 = [(ACCHTTPHandler *)self transport];

  return [(ACFHTTPTransportProtocol *)v2 isCanceled];
}

- (NSDictionary)requestHeader
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = [NSString stringWithFormat:@"%d", 3, @"Version"];
  return (NSDictionary *)[NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
}

- (NSDictionary)requestBody
{
  return (NSDictionary *)[NSDictionary dictionary];
}

- (NSDictionary)httpRequestDictionary
{
  return (NSDictionary *)[NSDictionary dictionaryWithObjectsAndKeys:-[ACCHTTPHandler requestHeader](self, "requestHeader"), @"Header", -[ACCHTTPHandler requestBody](self, "requestBody"), @"Request", 0];
}

- (void)updateTransport
{
  uint64_t v5 = 0;
  uint64_t v3 = [[MEMORY[0x263F08AC0] dataWithPropertyList:-[ACCHTTPHandler httpRequestDictionary](self, "httpRequestDictionary") format:100 options:0 error:&v5];
  if (v5) {
    BOOL v4 = ACFLog == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4 && (ACFLogSettingsGetLevelMask() & 8) != 0) {
    ACFLog(3, (uint64_t)"-[ACCHTTPHandler updateTransport]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 125, 0, "Error while creating request content: %@", v5);
  }
  [(ACFHTTPTransportProtocol *)[(ACCHTTPHandler *)self transport] setHttpPOSTBody:v3];
}

- (void)performRequestWithCompletionBlock:(id)a3
{
  [(ACCHTTPHandler *)self updateTransport];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__ACCHTTPHandler_performRequestWithCompletionBlock___block_invoke;
  v8[3] = &unk_2650441D0;
  v8[4] = self;
  [(ACFHTTPTransportProtocol *)[(ACCHTTPHandler *)self transport] setRetryCheckBlock:v8];
  uint64_t v5 = [a3 copy];
  v6 = [(ACCHTTPHandler *)self transport];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__ACCHTTPHandler_performRequestWithCompletionBlock___block_invoke_2;
  v7[3] = &unk_2650441F8;
  v7[4] = self;
  v7[5] = v5;
  [(ACFHTTPTransportProtocol *)v6 performRequestWithCompletionBlock:v7];
}

uint64_t __52__ACCHTTPHandler_performRequestWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) shouldTryOtherServers:a2 error:a3];
}

uint64_t __52__ACCHTTPHandler_performRequestWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = a3;
  if (a3)
  {
    uint64_t v4 = 0;
  }
  else if ([*(id *)(a1 + 32) isCanceled])
  {
    v6 = (void *)MEMORY[0x263F087E8];
    float v7 = NSDictionary;
    id v8 = +[ACMBaseLocale localizedString:@"Oops, an error occurred. Thanks for your patience, please try again later."];
    uint64_t v4 = 0;
    uint64_t v12 = [v6 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200200 userInfo:[v7 dictionaryWithObject:v8 forKey:MEMORY[0x263F08320]]];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) responseWithData:a2 error:&v12];
  }
  uint64_t v9 = [*(id *)(a1 + 32) shouldReturnResponse:v4 orReportError:&v12];
  if (v9)
  {
    if (v12) {
      uint64_t v12 = [*(id *)(a1 + 32) convertErrorToACMError:];
    }
    v10 = (void (**)(id, void))(id)[*(id *)(a1 + 32) finalizeBlock];
    [*(id *)(a1 + 32) setFinalizeBlock:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    if (v10) {
      v10[2](v10, *(void *)(a1 + 32));
    }
  }
  else
  {
    [*(id *)(a1 + 32) updateTransport];
  }
  return v9;
}

- (void)cancelRequest
{
  [(ACFHTTPTransportProtocol *)[(ACCHTTPHandler *)self transport] cancelRequest];
  if ([(ACCHTTPHandler *)self finalizeBlock])
  {
    uint64_t v3 = (id)[-[ACCHTTPHandler finalizeBlock](self, "finalizeBlock") copy];
    [(ACCHTTPHandler *)self setFinalizeBlock:0];
    uint64_t v4 = (void (*)(void *, ACCHTTPHandler *))v3[2];
    v4(v3, self);
  }
}

- (id)invalidPublicKeyErrorForReponse:(id)a3 error:(id)a4
{
  id v6 = (id)objc_opt_new();
  if ([a4 userInfo]) {
    [v6 addEntriesFromDictionary:[a4 userInfo]];
  }
  if ([a3 objectForKey:@"dp"]) {
    [v6 setObject:[a3 objectForKey:@"dp"] forKey:@"dp"];
  }
  if ([a3 objectForKey:@"t"]) {
    [v6 setObject:[a3 objectForKey:@"t"] forKey:@"t"];
  }
  float v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = [a4 domain];
  uint64_t v9 = [a4 code];
  id v10 = (id)[v6 copy];

  return (id)[v7 errorWithDomain:v8 code:v9 userInfo:v10];
}

- (id)convertErrorToACMError:(id)a3
{
  id v5 = a3;
  id v6 = (void *)[a3 domain];
  if ([v6 isEqualToString:@"ACCAppleConnectErrorDomain"]) {
    return v5;
  }
  uint64_t v8 = [a3 localizedFailureReason];
  id v9 = (id)[a3 localizedDescription];
  int v10 = [v6 isEqualToString:@"HTTPServerErrorDomain"];
  uint64_t v11 = -200200;
  if (!v10)
  {
    v14 = (void *)[a3 domain];
    if ([v14 isEqualToString:*MEMORY[0x263F08570]])
    {
      uint64_t v15 = [a3 code];
      if ((unint64_t)(v15 + 1009) <= 8)
      {
        if (((1 << (v15 - 15)) & 0x17A) != 0)
        {
          id v9 = +[ACMBaseLocale localizedString:@"Oops, an error occurred. Thanks for your patience, please try again later."];
          uint64_t v11 = -100401;
        }
        else if (v15 == -1009)
        {
          id v9 = +[ACMBaseLocale localizedString:@"You appear to be offline. Please connect to the Internet and try again."];
          uint64_t v11 = -100400;
        }
      }
    }
    goto LABEL_39;
  }
  uint64_t v12 = [a3 code];
  if (v12 <= -21094)
  {
    if (v12 <= -80004)
    {
      if ((unint64_t)(v12 + 90003) >= 4)
      {
        if (v12 != -90005) {
          goto LABEL_39;
        }
        goto LABEL_32;
      }
      id v9 = +[ACMBaseLocale localizedString:@"Can not verify token."];
      uint64_t v11 = -100360;
      goto LABEL_39;
    }
    if (v12 != -80003)
    {
      if (v12 != -21515)
      {
        if (v12 == -21096)
        {
          id v9 = +[ACMBaseLocale localizedString:@"The current time on this device seems to be incorrect. You can fix it by going to Settings > General > Date & Time, then try again."];
          uint64_t v11 = -100125;
        }
        goto LABEL_39;
      }
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  if (v12 > -20201)
  {
    if (v12 <= -20102)
    {
      if ((unint64_t)(v12 + 20105) >= 2)
      {
        uint64_t v13 = -20200;
        goto LABEL_19;
      }
LABEL_32:
      id v17 = [(ACCHTTPHandler *)self iForgotString];
      id v18 = +[ACMBaseLocale localizedString:@"To protect your security, it’s time to reset your password. It’s easy, just go to %@."];
      id v9 = v18;
      uint64_t v11 = -100104;
      if (v17 && v18)
      {
        uint64_t v19 = [[[v17 stringByReplacingOccurrencesOfString:@"https://" withString:@"/"] stringByReplacingOccurrencesOfString:@"/" withString:@"/"];
        id v9 = [NSString stringWithFormat:v9, v19];
        uint64_t v11 = -100104;
      }
      goto LABEL_39;
    }
    if (v12 != -20101)
    {
      if (v12 == -1)
      {
        id v16 = +[ACMBaseLocale localizedString:@"Oops, an error occurred. Thanks for your patience, please try again later."];
LABEL_38:
        id v9 = v16;
        goto LABEL_39;
      }
      goto LABEL_39;
    }
LABEL_28:
    id v9 = +[ACMBaseLocale localizedString:@"Your Apple ID or password was entered incorrectly."];
    uint64_t v11 = -100102;
    goto LABEL_39;
  }
  if ((unint64_t)(v12 + 21093) < 2) {
    goto LABEL_32;
  }
  if (v12 != -20209)
  {
    uint64_t v13 = -20206;
LABEL_19:
    if (v12 != v13) {
      goto LABEL_39;
    }
    goto LABEL_28;
  }
  uint64_t v11 = -100118;
  id v20 = [(ACCHTTPHandler *)self iForgotString];
  id v21 = +[ACMBaseLocale localizedString:@"This Apple ID has been disabled for security reasons. You can reset your password at %@."];
  id v9 = v21;
  if (v20 && v21)
  {
    uint64_t v22 = [[[v20 stringByReplacingOccurrencesOfString:@"https://" withString:@"/"] stringByReplacingOccurrencesOfString:@"/" withString:@"/"];
    id v16 = [NSString stringWithFormat:v9, v22];
    goto LABEL_38;
  }
LABEL_39:
  v23 = (void *)MEMORY[0x263F087E8];
  uint64_t v24 = [NSDictionary dictionaryWithObjectsAndKeys:a3, *MEMORY[0x263F08608], v9, *MEMORY[0x263F08320], v8, *MEMORY[0x263F08338], 0];

  return (id)[v23 errorWithDomain:@"ACCAppleConnectErrorDomain" code:v11 userInfo:v24];
}

- (id)responseWithData:(id)a3 error:(id *)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACCHTTPHandler responseWithData:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 330, 0, "Converting response data to dictionary...");
  }
  id v17 = 0;
  uint64_t v18 = 0;
  id v6 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:&v18 error:&v17];
  float v7 = v17;
  if (v17)
  {
    if (ACFLog)
    {
      char LevelMask = ACFLogSettingsGetLevelMask();
      float v7 = v17;
      if ((LevelMask & 8) != 0)
      {
        ACFLog(3, (uint64_t)"-[ACCHTTPHandler responseWithData:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 339, 0, "Error while creating dictionary: %@", v17);
        float v7 = v17;
      }
    }
    id v9 = (void *)MEMORY[0x263F087E8];
    int v10 = NSDictionary;
    uint64_t v11 = [v7 localizedDescription];
    uint64_t v12 = [v9 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-100360 userInfo:[v10 dictionaryWithObjectsAndKeys:v11, *MEMORY[0x263F08320], v17, *MEMORY[0x263F08608], 0]];
    if (!a4) {
      return v6;
    }
LABEL_16:
    if (v12) {
      *a4 = v12;
    }
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (id v6 = (void *)[v6 objectForKey:@"Response"]) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    v14 = NSDictionary;
    id v15 = +[ACMBaseLocale localizedString:@"Response from server is malformed"];
    uint64_t v12 = [v13 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-100360 userInfo:[v14 dictionaryWithObjectsAndKeys:v15, *MEMORY[0x263F08320], 0]];
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCHTTPHandler responseWithData:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 348, 0, "Response from server is malformed or has inappropriate type: %@", 0);
    }
    id v6 = 0;
    if (a4) {
      goto LABEL_16;
    }
  }
  return v6;
}

- (BOOL)shouldReturnResponse:(id)a3 orReportError:(id *)a4
{
  id v6 = self;
  if (!a4) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACCHTTPHandler.m" lineNumber:364 description:@"the error should not be nil!"];
  }
  if (*a4)
  {
    LOBYTE(v6) = 1;
    return (char)v6;
  }
  float v7 = (void *)[a3 objectForKey:@"ec"];
  uint64_t v8 = [v7 integerValue];
  if (v8 != -21074)
  {
    if (v8 == -21065 && ![(ACCHTTPHandler *)v6 shouldIgnoreInvalidDSPublicKey])
    {
      [(ACCHTTPHandler *)v6 setShouldIgnoreInvalidDSPublicKey:1];
      LODWORD(v6) = ![(ACCHTTPHandler *)v6 updatePublicKeyWithResponse:a3];
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ([(ACCHTTPHandler *)v6 shouldIgnoreInvalidToken])
  {
LABEL_10:
    LOBYTE(v6) = 1;
    goto LABEL_11;
  }
  [(ACCHTTPHandler *)v6 setShouldIgnoreInvalidToken:1];
  -[ACCHTTPHandler uninstallPublicKeyForRealm:](v6, "uninstallPublicKeyForRealm:", [(-[ACCAuthContextProtocol principal](-[ACCHTTPHandler context](v6, "context")) "realm")]);
  LOBYTE(v6) = 0;
LABEL_11:
  if ([v7 intValue])
  {
    uint64_t v9 = [a3 objectForKey:@"em"];
    uint64_t v10 = [a3 objectForKey:@"ed"];
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCHTTPHandler shouldReturnResponse:orReportError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 393, 0, "Detected error in response. Error: %@, Message: %@, Description: %@", v7, v9, v10);
    }
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = (int)[v7 intValue];
    *a4 = (id)[v11 errorWithDomain:@"HTTPServerErrorDomain" code:v12 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:v9, *MEMORY[0x263F08320], v10, *MEMORY[0x263F08338], 0]];
  }
  return (char)v6;
}

- (BOOL)shouldTryOtherServers:(id)a3 error:(id)a4
{
  id v8 = a4;
  if (a4)
  {
    LOBYTE(v5) = [(ACCHTTPHandler *)self isConnectionError:a4];
  }
  else
  {
    id v6 = [(ACCHTTPHandler *)self responseWithData:a3 error:&v8];
    if (v8 || (BOOL v5 = [(ACCHTTPHandler *)self isUknownServerError:v6])) {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)isConnectionError:(id)a3
{
  uint64_t v4 = (void *)[a3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F08570]])
  {
    uint64_t v5 = [a3 code];
    if ((unint64_t)(v5 + 1009) >= 7) {
      return 0;
    }
    else {
      return (0x7Bu >> (v5 - 15)) & 1;
    }
  }
  else
  {
    float v7 = (void *)[a3 domain];
    return [v7 isEqualToString:@"com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation"];
  }
}

- (BOOL)isUknownServerError:(id)a3
{
  return [[a3 objectForKey:@"ec"] intValue] == -1;
}

- (BOOL)updatePublicKeyWithResponse:(id)a3
{
  uint64_t v5 = (void *)[a3 objectForKey:@"t"];
  if ([v5 length])
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACCHTTPHandler updatePublicKeyWithResponse:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 478, 0, "New key version: %@", v5);
    }
    uint64_t v6 = [a3 objectForKey:@"dp"];
    uint64_t v7 = [[-[ACCAuthContextProtocol principal](-[ACCHTTPHandler context](self, "context")) realm];
    return [(ACCHTTPHandler *)self installCertificateWithString:v6 version:v5 forRealm:v7];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACCHTTPHandler updatePublicKeyWithResponse:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCHTTPHandler.m", 483, 0, "No new key");
    }
    return 0;
  }
}

- (BOOL)installCertificateWithString:(id)a3 version:(id)a4 forRealm:(id)a5
{
  id v8 = [[+[ACCComponents components](ACCComponents, "components") ticketManager];

  return [v8 installCertificateWithString:a3 version:a4 forRealm:a5];
}

- (void)uninstallPublicKeyForRealm:(id)a3
{
  uint64_t v4 = [[+[ACCComponents components](ACCComponents, "components") ticketManager];

  [v4 uninstallPublicKeyForRealm:a3];
}

- (id)iForgotString
{
  v2 = [NSURL URLWithString:-[ACCHTTPHandler iForgotURL](self, "iForgotURL")];

  return (id)[v2 host];
}

- (NSString)iForgotURL
{
  return 0;
}

- (NSArray)serverHosts
{
  return 0;
}

- (NSArray)serverAttemptsDelays
{
  return 0;
}

- (void)setTransport:(id)a3
{
}

- (id)finalizeBlock
{
  return self->_finalizeBlock;
}

- (void)setFinalizeBlock:(id)a3
{
}

- (ACCAuthContextProtocol)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)shouldIgnoreInvalidDSPublicKey
{
  return self->_shouldIgnoreInvalidDSPublicKey;
}

- (void)setShouldIgnoreInvalidDSPublicKey:(BOOL)a3
{
  self->_shouldIgnoreInvalidDSPublicKey = a3;
}

- (BOOL)shouldIgnoreInvalidToken
{
  return self->_shouldIgnoreInvalidToken;
}

- (void)setShouldIgnoreInvalidToken:(BOOL)a3
{
  self->_shouldIgnoreInvalidToken = a3;
}

@end