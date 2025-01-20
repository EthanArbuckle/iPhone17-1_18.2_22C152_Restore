@interface ACCTicketManager
- (ACCSSOTGTStoragePolicy)tgtStoragePolicy;
- (BOOL)hasValidPublicKeyForRealm:(id)a3;
- (BOOL)installCertificateWithString:(id)a3 version:(id)a4 forRealm:(id)a5;
- (BOOL)storeSSOToken:(id)a3;
- (Class)authContextClass;
- (Class)ssoTokenClass;
- (__SecCertificate)certificateForRealm:(id)a3;
- (__SecCertificate)certificateFromString:(id)a3;
- (__SecCertificate)defaultPublicKeyCertificateForRealm:(id)a3;
- (__SecKey)publicKeyForRealm:(id)a3;
- (id)authContextWithRequest:(id)a3;
- (id)authContextWithRequest:(id)a3 keyCode:(id)a4 authenticationType:(id)a5;
- (id)authContextWithRequest:(id)a3 sessionToken:(id)a4;
- (id)certificateLabelForRealm:(id)a3;
- (id)certificateStoragePolicy;
- (id)changePasswordContextWithRequest:(id)a3 oldPassword:(id)a4 newPassword:(id)a5;
- (id)createNonceString;
- (id)createSSOTokenWithContent:(id)a3 context:(id)a4;
- (id)cryptograph;
- (id)decryptEncryptedContent:(id)a3 withHmac:(id)a4 context:(id)a5;
- (id)defaultPublicKeyVersionForRealm:(id)a3;
- (id)deviceIdentifier;
- (id)encryptSourceTokenWithSourceTokenData:(id)a3 encryptionKey:(id)a4 initializationVector:(id)a5;
- (id)encryptionKeyWithRandomKey:(id)a3;
- (id)envelopEncryptedSourceToken:(id)a3 dsKeyVersion:(id)a4 encryptedRandomKey:(id)a5 initializationVector:(id)a6 tokenDataHMAC:(id)a7 tokenVersion:(id)a8;
- (id)envelopeWithContext:(id)a3;
- (id)envelopeWithContext:(id)a3 publicKey:(__SecKey *)a4;
- (id)fetchSSOTokenForPrincipal:(id)a3;
- (id)fetchSSOTokenForPrincipal:(id)a3 agedLessThan:(double)a4;
- (id)identifier;
- (id)prepareToken:(id)a3 withTGTInfo:(id)a4;
- (id)publicKeyVersionForRealm:(id)a3;
- (id)serviceTicketPrefix;
- (id)serviceTicketStringWithRequest:(id)a3 ssoToken:(id)a4;
- (id)setPublicKeyWithCertificate:(__SecCertificate *)a3 version:(id)a4 forRealm:(id)a5;
- (id)tokenDataHMACForRandomKey:(id)a3 sourceTokenData:(id)a4;
- (id)tokenVersion;
- (id)twoSVCreateDateForPrincipal:(id)a3;
- (id)twoSVPersonIDForPrincipal:(id)a3;
- (id)twoSVSecretForPrincipal:(id)a3;
- (unint64_t)clientID;
- (void)dealloc;
- (void)prepareTokenFor2SV:(id)a3 withVerificationCode:(id)a4 tgtInfo:(id)a5;
- (void)setAuthContextClass:(Class)a3;
- (void)setPublickKeyVersion:(id)a3 label:(id)a4 forRealm:(id)a5;
- (void)setSsoTokenClass:(Class)a3;
- (void)tokenDidReceive2SVSecret:(id)a3;
- (void)uninstallPublicKeyForRealm:(id)a3;
- (void)updateContextEncryptionHash:(id)a3 withKeyCode:(id)a4;
- (void)updateContextWithClientSecretIfAny:(id)a3;
@end

@implementation ACCTicketManager

- (id)cryptograph
{
  id v2 = +[ACFComponents components];

  return (id)[v2 cryptograph];
}

- (id)certificateStoragePolicy
{
  id v2 = +[ACFComponents components];

  return (id)[v2 certificateStoragePolicy];
}

- (ACCSSOTGTStoragePolicy)tgtStoragePolicy
{
  id v2 = +[ACCComponents components];

  return (ACCSSOTGTStoragePolicy *)[v2 tgtStoragePolicy];
}

- (void)dealloc
{
  [(ACCTicketManager *)self setAuthContextClass:0];
  [(ACCTicketManager *)self setSsoTokenClass:0];
  v3.receiver = self;
  v3.super_class = (Class)ACCTicketManager;
  [(ACCTicketManager *)&v3 dealloc];
}

- (__SecCertificate)certificateFromString:(id)a3
{
  if (![a3 length]) {
    return 0;
  }
  v5 = [[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase64:a3];
  if (![v5 length])
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager certificateFromString:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 68, 0, "Failed to decode PEM data");
    }
    return 0;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];

  return SecCertificateCreateWithData(v6, (CFDataRef)v5);
}

- (BOOL)installCertificateWithString:(id)a3 version:(id)a4 forRealm:(id)a5
{
  if (![a3 length] || !objc_msgSend(a4, "length"))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager installCertificateWithString:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 98, 0, "Public key or version missing in the server response");
    }
    return 0;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACCTicketManager installCertificateWithString:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 79, 0, "Install new public key with version %@", a4);
  }
  v9 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "componentsSeparatedByString:", @"-----BEGIN CERTIFICATE-----"), "componentsJoinedByString:", &stru_26F261788), "componentsSeparatedByString:", @"-----END CERTIFICATE-----") componentsJoinedByString:&stru_26F261788];
  v10 = -[ACCTicketManager certificateFromString:](self, "certificateFromString:", [[objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet")), "componentsJoinedByString:", &stru_26F261788) stringByReplacingOccurrencesOfString:@" " withString:@""] stringByReplacingOccurrencesOfString:@"\n" withString:@""]);
  if (!v10)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager installCertificateWithString:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 93, 0, "Failed to read certificate data");
    }
    return 0;
  }
  v11 = v10;
  BOOL v12 = [(ACCTicketManager *)self setPublicKeyWithCertificate:v10 version:a4 forRealm:a5] != 0;
  CFRelease(v11);
  return v12;
}

- (void)uninstallPublicKeyForRealm:(id)a3
{
  id v5 = [(ACCTicketManager *)self certificateStoragePolicy];
  id v6 = [(ACCTicketManager *)self certificateLabelForRealm:a3];

  [v5 removeCertificateWithLabel:v6 realm:a3];
}

- (__SecCertificate)certificateForRealm:(id)a3
{
  id v5 = -[ACCTicketManager certificateLabelForRealm:](self, "certificateLabelForRealm:");
  result = (__SecCertificate *)[v5 length];
  if (result)
  {
    id v7 = [(ACCTicketManager *)self certificateStoragePolicy];
    return (__SecCertificate *)[v7 certificateWithLabel:v5 realm:a3];
  }
  return result;
}

- (__SecKey)publicKeyForRealm:(id)a3
{
  if (ACFProfileStart && (ACFLogSettingsGetLevelMask() & 0x100) != 0) {
    ACFProfileStart((uint64_t)"-[ACCTicketManager publicKeyForRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 121, 0, 0);
  }
  id v5 = [(ACCTicketManager *)self certificateForRealm:a3];
  if (v5
    || (id v5 = [(ACCTicketManager *)self defaultPublicKeyCertificateForRealm:a3]) != 0)
  {
    id v6 = (const void *)[MEMORY[0x263EFF8C0] arrayWithObject:v5];
    SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
    SecTrustRef trust = 0;
    OSStatus v8 = SecTrustCreateWithCertificates(v6, BasicX509, &trust);
    if (trust)
    {
      v9 = (void *)MEMORY[0x23ED0DF70]();
      if (v9) {
        goto LABEL_13;
      }
      int v14 = 0;
      int v10 = MEMORY[0x23ED0DF90](trust, &v14);
      if (v10)
      {
        if (ACFLog)
        {
          int v11 = v10;
          if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
            ACFLog(3, (uint64_t)"-[ACCTicketManager publicKeyForRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 155, 0, "Trust evaluate failed with code: %d", v11);
          }
        }
      }
      v9 = (void *)MEMORY[0x23ED0DF70](trust);
      if (v9)
      {
LABEL_13:
        id v12 = v9;
      }
      else
      {
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
          ACFLog(3, (uint64_t)"-[ACCTicketManager publicKeyForRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 167, 0, "Failed create public key");
        }
        v9 = 0;
      }
      CFRelease(trust);
    }
    else
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACCTicketManager publicKeyForRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 173, 0, "Failed to create trust instance with error: %d", v8);
      }
      v9 = 0;
    }
    CFRelease(BasicX509);
  }
  else
  {
    v9 = 0;
  }
  if (ACFProfileEnd && (ACFLogSettingsGetLevelMask() & 0x100) != 0) {
    ACFProfileEnd((uint64_t)"-[ACCTicketManager publicKeyForRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 178, 0, 0);
  }
  return (__SecKey *)v9;
}

- (BOOL)hasValidPublicKeyForRealm:(id)a3
{
  if (a3)
  {
    uint64_t v5 = [[-[ACCTicketManager publicKeyVersionForRealm:](self, "publicKeyVersionForRealm:") compare:-[ACCTicketManager defaultPublicKeyVersionForRealm:](self, "defaultPublicKeyVersionForRealm:", a3)];
    if (v5) {
      LOBYTE(v5) = [(ACCTicketManager *)self publicKeyForRealm:a3] != 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)setPublicKeyWithCertificate:(__SecCertificate *)a3 version:(id)a4 forRealm:(id)a5
{
  id v9 = [(ACCTicketManager *)self certificateStoragePolicy];
  int v10 = (id)SecCertificateCopySubjectSummary(a3);
  id v11 = [(ACCTicketManager *)self certificateLabelForRealm:a5];
  if ([v11 length])
  {
    [(ACCTicketManager *)self uninstallPublicKeyForRealm:a5];
  }
  else if (!v11 || ([(__CFString *)v10 isEqualToString:v11] & 1) == 0)
  {
    if ([v9 removeCertificateWithLabel:v10 realm:a5])
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
        ACFLog(6, (uint64_t)"-[ACCTicketManager setPublicKeyWithCertificate:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 219, 0, "Removed previous certificate");
      }
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACCTicketManager setPublicKeyWithCertificate:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 223, 0, "Error trying to remove certificate %@", v10);
    }
  }
  if ([v9 storeCertificate:a3 realm:a5])
  {
    [(ACCTicketManager *)self setPublickKeyVersion:a4 label:v10 forRealm:a5];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager setPublicKeyWithCertificate:version:forRealm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 229, 0, "Error trying to store certificate");
    }
    return 0;
  }
  return v10;
}

- (void)setPublickKeyVersion:(id)a3 label:(id)a4 forRealm:(id)a5
{
}

- (__SecCertificate)defaultPublicKeyCertificateForRealm:(id)a3
{
  return 0;
}

- (id)defaultPublicKeyVersionForRealm:(id)a3
{
  return @"0.0";
}

- (id)publicKeyVersionForRealm:(id)a3
{
  return 0;
}

- (id)certificateLabelForRealm:(id)a3
{
  return 0;
}

- (id)createNonceString
{
  id v2 = [(ACCTicketManager *)self cryptograph];

  return (id)[v2 randomStringOfLength:32];
}

- (id)envelopeWithContext:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v5 = [objc_msgSend((id)objc_msgSend(a3, "principal"), "realm")
    id v6 = [(ACCTicketManager *)self publicKeyForRealm:v5];
    [v3 setDsKeyVersion:-[ACCTicketManager publicKeyVersionForRealm:](self, "publicKeyVersionForRealm:", v5)];
    id v3 = [(ACCTicketManager *)self envelopeWithContext:v3 publicKey:v6];
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACCTicketManager envelopeWithContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 293, 0, "Created token envelope");
  }
  return v3;
}

- (id)envelopeWithContext:(id)a3 publicKey:(__SecKey *)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  id v7 = [(ACCTicketManager *)self cryptograph];
  [a3 setEncryptionKey:[v7 randomDataOfLength:kACFAES128KeySize]];
  id v8 = [(ACCTicketManager *)self cryptograph];
  [a3 setInitializationVector:[v8 randomDataOfLength:kACFAES128KeySize]];
  uint64_t v9 = [[(id)objc_msgSend(a3, "tokenSourceString") dataUsingEncoding:4];
  id v10 = [[-[ACCTicketManager encryptSourceTokenWithSourceTokenData:encryptionKey:initializationVector:](self, "encryptSourceTokenWithSourceTokenData:encryptionKey:initializationVector:", objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "compressData:", v9), -[ACCTicketManager encryptionKeyWithRandomKey:](self, "encryptionKeyWithRandomKey:", objc_msgSend(a3, "encryptionKey")), objc_msgSend(a3, "initializationVector"))
  uint64_t v11 = [[-[ACCTicketManager cryptograph](self, "cryptograph") encryptData:objc_msgSend(a3, "encryptionKey") withKey:a4];
  id v12 = -[ACCTicketManager tokenDataHMACForRandomKey:sourceTokenData:](self, "tokenDataHMACForRandomKey:sourceTokenData:", [a3 encryptionKey], v9);
  uint64_t v13 = [a3 dsKeyVersion];
  uint64_t v14 = [a3 initializationVector];
  id v15 = [(ACCTicketManager *)self tokenVersion];

  return [(ACCTicketManager *)self envelopEncryptedSourceToken:v10 dsKeyVersion:v13 encryptedRandomKey:v11 initializationVector:v14 tokenDataHMAC:v12 tokenVersion:v15];
}

- (id)encryptSourceTokenWithSourceTokenData:(id)a3 encryptionKey:(id)a4 initializationVector:(id)a5
{
  if ([a3 length] && objc_msgSend(a4, "length") && objc_msgSend(a5, "length"))
  {
    id v9 = [(ACCTicketManager *)self cryptograph];
    return (id)[v9 encryptAES128CBCData:a3 withKey:a4 initializationVector:a5 pading:1];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager encryptSourceTokenWithSourceTokenData:encryptionKey:initializationVector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 343, 0, "Invalid parameters");
    }
    return 0;
  }
}

- (id)decryptEncryptedContent:(id)a3 withHmac:(id)a4 context:(id)a5
{
  if (![a3 length])
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACCTicketManager decryptEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 391, 0, "Nothing to decrypt");
    }
    return 0;
  }
  if (!a4)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager decryptEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 386, 0, "HMAC is invalid");
    }
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend(a5, "encryptionKey"), "length"))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager decryptEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 381, 0, "Key is empty");
    }
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encodeBase16:", -[ACCTicketManager tokenDataHMACForRandomKey:sourceTokenData:](self, "tokenDataHMACForRandomKey:sourceTokenData:", objc_msgSend(a5, "encryptionKey"), a3)), "lowercaseString"), "isEqualToString:", a4))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager decryptEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 376, 0, "TGT checksum does not match");
    }
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend(a5, "initializationVector"), "length"))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager decryptEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 371, 0, "Invalid initialization vector");
    }
    return 0;
  }
  id v9 = -[ACCTicketManager encryptionKeyWithRandomKey:](self, "encryptionKeyWithRandomKey:", [a5 encryptionKey]);
  id v10 = [(ACCTicketManager *)self cryptograph];
  uint64_t v11 = [a5 initializationVector];

  return (id)[v10 decryptAES128CBCData:a3 withKey:v9 initializationVector:v11 pading:0];
}

- (id)envelopEncryptedSourceToken:(id)a3 dsKeyVersion:(id)a4 encryptedRandomKey:(id)a5 initializationVector:(id)a6 tokenDataHMAC:(id)a7 tokenVersion:(id)a8
{
  if (![a3 length] || !objc_msgSend(a5, "length"))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager envelopEncryptedSourceToken:dsKeyVersion:encryptedRandomKey:initializationVector:tokenDataHMAC:tokenVersion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 429, 0, "Invalid parameters");
    }
    return 0;
  }
  if (![(ACCTicketManager *)self identifier]) {
    return (id)[NSDictionary dictionaryWithObjectsAndKeys:a4, @"t", a3, @"enc", a5, @"ek", 0];
  }
  if (![a4 length]
    || ![a6 length]
    || ![a7 length]
    || ![a8 length])
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager envelopEncryptedSourceToken:dsKeyVersion:encryptedRandomKey:initializationVector:tokenDataHMAC:tokenVersion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 423, 0, "Invalid parameters");
    }
    return 0;
  }
  id v15 = [MEMORY[0x263EFF9A0] dictionaryWithObjectsAndKeys:a4, @"t", a3, @"enc", a5, @"ek", -[ACCTicketManager identifier](self, "identifier"), @"ex", a7, @"hmac", a6, @"iv", a8, @"a", 0];
  if ([(ACCTicketManager *)self clientID] != 0x7FFFFFFFFFFFFFFFLL) {
    [v15 setObject:[NSNumber numberWithUnsignedInteger:-[ACCTicketManager clientID](self, "clientID")] forKey:@"cid"];
  }
  v16 = (void *)[v15 copy];

  return v16;
}

- (id)authContextWithRequest:(id)a3
{
  uint64_t v5 = (void *)[(objc_class *)[(ACCTicketManager *)self authContextClass] authContextWithRequest:a3];
  [v5 setNonce:-[ACCTicketManager createNonceString](self, "createNonceString")];
  [v5 setDsKeyVersion:-[ACCTicketManager publicKeyVersionForRealm:](self, "publicKeyVersionForRealm:", [objc_msgSend((id)objc_msgSend(a3, "principal"), "realm"))]];
  [v5 setTokenVersion:-[ACCTicketManager tokenVersion](self, "tokenVersion")];
  return v5;
}

- (id)authContextWithRequest:(id)a3 keyCode:(id)a4 authenticationType:(id)a5
{
  id v5 = a3;
  if (a3)
  {
    if ([a4 length])
    {
      id v5 = [(ACCTicketManager *)self authContextWithRequest:v5];
      [v5 setAuthenticationType:a5];
      [(ACCTicketManager *)self updateContextEncryptionHash:v5 withKeyCode:a4];
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (id)authContextWithRequest:(id)a3 sessionToken:(id)a4
{
  id v5 = [(ACCTicketManager *)self authContextWithRequest:a3];
  [v5 setSessionToken:a4];
  return v5;
}

- (void)updateContextEncryptionHash:(id)a3 withKeyCode:(id)a4
{
  uint64_t v5 = [[-[ACCTicketManager cryptograph](self) hashStringSHA256WithString:a4];

  [a3 setEncryptionHash:v5];
}

- (id)identifier
{
  return 0;
}

- (unint64_t)clientID
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)tokenVersion
{
  return @"3.0";
}

- (id)prepareToken:(id)a3 withTGTInfo:(id)a4
{
  id v4 = a3;
  if (a3)
  {
    id v6 = (void *)MEMORY[0x263EFF910];
    [((id)objc_msgSend(a4, "objectForKey:", @"e")) doubleValue];
    [v4 setExpirationDate:[v6 dateWithTimeIntervalSince1970:v7 / 1000.0]];
    if (![v4 expirationDate])
    {
      id v4 = 0;
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
          ACFLog(3, (uint64_t)"-[ACCTicketManager prepareToken:withTGTInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 506, 0, "Expiration date is missing");
        }
        return 0;
      }
    }
    if (v4)
    {
      [v4 setSessionToken:[a4 objectForKey:@"q"]];
      if (!objc_msgSend((id)objc_msgSend(v4, "sessionToken"), "length"))
      {
        id v4 = 0;
        if (ACFLog)
        {
          if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
            ACFLog(3, (uint64_t)"-[ACCTicketManager prepareToken:withTGTInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 516, 0, "Session token is missing");
          }
          return 0;
        }
      }
      if (v4)
      {
        id v8 = (void *)[a4 objectForKey:@"b"];
        if (![v8 length])
        {
          id v4 = 0;
          if (ACFLog)
          {
            if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
              ACFLog(3, (uint64_t)"-[ACCTicketManager prepareToken:withTGTInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 528, 0, "User name is missing");
            }
            return 0;
          }
        }
        if (v4)
        {
          id v9 = (void *)[a4 objectForKey:@"c"];
          uint64_t v10 = [v9 length];
          if (v10) {
            uint64_t v11 = v4;
          }
          else {
            uint64_t v11 = 0;
          }
          if (!v10 && ACFLog)
          {
            if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
              ACFLog(3, (uint64_t)"-[ACCTicketManager prepareToken:withTGTInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 538, 0, "Realm is missing");
            }
            return 0;
          }
          if (!v11) {
            return 0;
          }
          if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"lls"), "integerValue")) {
            [v11 setLongLiveSession:1];
          }
          [v11 setPersonID:[a4 objectForKey:@"a"]];
          [v11 setPrincipal:[+[ACFPrincipal principalWithUserName:realm:](ACFPrincipal, "principalWithUserName:realm:", v8, v9)];
          if (objc_opt_respondsToSelector()) {
            [v11 setUserPreferences:[a4 objectForKey:@"ap"]];
          }
        }
      }
    }
  }
  return v4;
}

- (void)prepareTokenFor2SV:(id)a3 withVerificationCode:(id)a4 tgtInfo:(id)a5
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 567, 0, "2SV code flow");
  }
  [a3 setPersonID:[a5 objectForKey:@"a"]];
  [a3 setIsTwoStepVerificationRequired:[a5 objectForKey:@"se"]];
  if (![a3 isTwoStepVerificationRequired]) {
    [a3 setIsTwoStepVerificationRequired:[a5 objectForKey:@"sap"]];
  }
  if (objc_opt_respondsToSelector()) {
    [a3 setIsUserEnrolledFor2SV:[a5 objectForKey:@"sac"]];
  }
  if ([a4 length])
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 582, 0, "TGT obtained on 2-step verification");
    }
    id v9 = (void *)[a5 objectForKey:@"cs"];
    uint64_t v10 = [a5 objectForKey:@"ccd"];
    if ([a3 principal] && objc_msgSend(v9, "length") && objc_msgSend(a3, "personID") && v10)
    {
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        [a3 setClientSecret:v9];
        [a3 setClientSecretCreationTimestamp:v10];
        [(ACCTicketManager *)self tokenDidReceive2SVSecret:a3];
      }
    }
    else
    {
      if (![a3 personID] && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 599, 0, "Person ID is missing");
      }
      if (![v9 length] && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 603, 0, "cSecret is missing");
      }
      if (!v10 && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 607, 0, "cSecret create date is missing");
      }
    }
  }
}

- (id)createSSOTokenWithContent:(id)a3 context:(id)a4
{
  uint64_t v7 = [a3 length];
  if (a4 && v7)
  {
    uint64_t v12 = 100;
    uint64_t v8 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:&v12 error:0];
    if (v8)
    {
      [(ACCTicketManager *)self ssoTokenClass];
      id v9 = (id)objc_opt_new();
      [v9 setNonce:[a4 nonce]];
      [v9 setCreationDate:[a4 creationDate]];
      [v9 setRecentAuthenticationDate:[a4 creationDate]];
      [v9 setInitialRequest:[a4 request]];
      if (objc_opt_respondsToSelector()) {
        [v9 setRecentUnlockDate:[a4 creationDate]];
      }
    }
    else
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACCTicketManager createSSOTokenWithContent:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 637, 0, "Failed to create SSO token");
      }
      id v9 = 0;
    }
    id v10 = [(ACCTicketManager *)self prepareToken:v9 withTGTInfo:v8];
    if (v10) {
      -[ACCTicketManager prepareTokenFor2SV:withVerificationCode:tgtInfo:](self, "prepareTokenFor2SV:withVerificationCode:tgtInfo:", v10, [a4 twoStepVerificationCode], v8);
    }
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager createSSOTokenWithContent:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 649, 0, "Invalid Parameters");
    }
    if (![a3 length] && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCTicketManager createSSOTokenWithContent:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 653, 0, "Content is empty");
    }
    id v10 = 0;
    if (!a4 && ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACCTicketManager createSSOTokenWithContent:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 657, 0, "Token is absent");
      }
      return 0;
    }
  }
  return v10;
}

- (BOOL)storeSSOToken:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (![(ACCTicketManager *)self tgtStoragePolicy]) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACCTicketManager.m" lineNumber:669 description:@"Invalid setup"];
  }
  id v6 = [(ACCTicketManager *)self tgtStoragePolicy];

  return [(ACCSSOTGTStoragePolicy *)v6 storeToken:a3];
}

- (id)fetchSSOTokenForPrincipal:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 677, 0, "Fetching token ignoring idle expiration timeout");
  }
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];

  return -[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:](self, "fetchSSOTokenForPrincipal:agedLessThan:", a3);
}

- (id)fetchSSOTokenForPrincipal:(id)a3 agedLessThan:(double)a4
{
  if (![(ACCTicketManager *)self tgtStoragePolicy]) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACCTicketManager.m" lineNumber:683 description:@"Invalid setup"];
  }
  id result = (id)[(ACCSSOTGTStoragePolicy *)[(ACCTicketManager *)self tgtStoragePolicy] searchTokenWithPrincipal:a3];
  if (result)
  {
    id v9 = result;
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0) {
        ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 688, 0, "Token principal: %@", [v9 principal]);
      }
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 0x40) != 0) {
          ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 689, 0, "Token expiration date: %@", [v9 expirationDate]);
        }
        if (ACFLog)
        {
          if ((ACFLogSettingsGetLevelMask() & 0x40) != 0) {
            ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 690, 0, "Token recent authentication date: %@", [v9 recentAuthenticationDate]);
          }
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
            ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 691, 0, "Token recent unlock date: %@", [v9 recentUnlockDate]);
          }
        }
      }
    }
    [objc_msgSend((id)objc_msgSend(v9, "expirationDate"), "timeIntervalSinceNow")];
    if (v10 < 0.0)
    {
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        {
          uint64_t v11 = [0 expirationDate];
          ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 696, 0, "Token is expired: %@. Expiration date: %@, Current date: %@", a3, v11, [MEMORY[0x263EFF910] date]);
        }
      }
      [(ACCSSOTGTStoragePolicy *)[(ACCTicketManager *)self tgtStoragePolicy] removeTokenWithPrincipal:a3];
      return 0;
    }
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 701, 0, "Token is not expired");
    }
    uint64_t v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-a4];
    if (objc_msgSend((id)objc_msgSend(v9, "recentAuthenticationDate"), "compare:", v12) != 1)
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
        ACFLog(6, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 709, 0, "Idle expiration time is out of date. Recent authentication date: %@. Reference date: %@", [v9 recentAuthenticationDate], v12);
      }
      return 0;
    }
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 714, 0, "Idle expiration did not pass. Token is valid.");
    }
    int v13 = [objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "principal"), "realm"), "isEqual:", objc_msgSend(a3, "realm")];
    char v14 = v13;
    if (v13) {
      id result = v9;
    }
    else {
      id result = 0;
    }
    if ((v14 & 1) == 0 && ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0) {
        ACFLog(7, (uint64_t)"-[ACCTicketManager fetchSSOTokenForPrincipal:agedLessThan:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 723, 0, "Token realms does not match request realm", v15);
      }
      return 0;
    }
  }
  return result;
}

- (id)changePasswordContextWithRequest:(id)a3 oldPassword:(id)a4 newPassword:(id)a5
{
  id v8 = [(ACCTicketManager *)self authContextWithRequest:a3 keyCode:a4 authenticationType:&unk_26F28F7B0];
  [v8 setOldUserKey:[-[ACCTicketManager cryptograph](self, "cryptograph") hashStringSHA256WithString:a4]];
  [v8 setCurrentUserKey:[-[ACCTicketManager cryptograph](self, "cryptograph") encodeBase64:[-[ACCTicketManager cryptograph](self, "cryptograph") encodeObscuredDataWithString:a5 length:2 * [a5 lengthOfBytesUsingEncoding:4]]]];
  return v8;
}

- (id)serviceTicketStringWithRequest:(id)a3 ssoToken:(id)a4
{
  id v6 = (id)[a3 copy];
  if (objc_msgSend((id)objc_msgSend(v6, "userName"), "length"))
  {
    if ([[(id)objc_msgSend(v6, "userName") isEqualToString:[(id)objc_msgSend(a4, "principal") userName]])goto LABEL_7; {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    }
      ACFLog(3, (uint64_t)"-[ACCTicketManager serviceTicketStringWithRequest:ssoToken:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 755, 0, "Internal inconsistency");
  }
  [v6 setUserName:[objc_msgSend((id)objc_msgSend(a4, "principal"), "userName")];
LABEL_7:
  id v7 = -[ACCTicketManager authContextWithRequest:sessionToken:](self, "authContextWithRequest:sessionToken:", v6, [a4 sessionToken]);
  if ([a4 longLiveSession]) {
    [v7 setTouchIDSupport:MEMORY[0x263EFFA88]];
  }
  if (!v7) {
    return 0;
  }
  id v8 = [(ACCTicketManager *)self envelopeWithContext:v7];
  if (!v8) {
    return 0;
  }
  id v9 = [[-[ACCTicketManager cryptograph](self, "cryptograph") compactDataFromPropertyList:v8];
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACCTicketManager serviceTicketStringWithRequest:ssoToken:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 772, 0, "SIZE TEST: Service ticket size before zipping %d", [v9 length]);
  }
  uint64_t v10 = [[-[ACCTicketManager cryptograph](self, "cryptograph") compressData:v9];
  if (!v10) {
    return 0;
  }
  uint64_t v11 = (void *)v10;
  if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACCTicketManager serviceTicketStringWithRequest:ssoToken:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 777, 0, "SIZE TEST: Service ticket size before base64 encoding %d", [v11 length]);
    }
    uint64_t v12 = (void *)[[-[ACCTicketManager serviceTicketPrefix](self, "serviceTicketPrefix") stringByAppendingString:[objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encodeBase64:", v11) stringByAppendingString:@"%@%@", -[ACCTicketManager serviceTicketPrefix](self, "serviceTicketPrefix"), objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encodeBase64:", v11)]];
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0) {
        ACFLog(6, (uint64_t)"-[ACCTicketManager serviceTicketStringWithRequest:ssoToken:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 779, 0, "SIZE TEST: Service ticket size is %d", [v12 length]);
      }
    }
    return v12;
  }
  return (id)[NSString stringWithFormat:@"%@%@", -[ACCTicketManager serviceTicketPrefix](self, "serviceTicketPrefix"), [objc_msgSend(-[ACCTicketManager cryptograph](self, "cryptograph"), "encodeBase64:", v10)];
}

- (id)serviceTicketPrefix
{
  return @"ACMTKN";
}

- (void)tokenDidReceive2SVSecret:(id)a3
{
}

- (id)twoSVPersonIDForPrincipal:(id)a3
{
  return 0;
}

- (id)twoSVSecretForPrincipal:(id)a3
{
  return 0;
}

- (id)twoSVCreateDateForPrincipal:(id)a3
{
  return 0;
}

- (id)deviceIdentifier
{
  return 0;
}

- (void)updateContextWithClientSecretIfAny:(id)a3
{
  id v5 = -[ACCTicketManager twoSVSecretForPrincipal:](self, "twoSVSecretForPrincipal:", [a3 principal]);
  if ([v5 length])
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACCTicketManager updateContextWithClientSecretIfAny:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCTicketManager.m", 826, 0, "cSecret present. Create HMAC");
    }
    id v6 = -[ACCTicketManager twoSVPersonIDForPrincipal:](self, "twoSVPersonIDForPrincipal:", [a3 principal]);
    id v7 = NSString;
    id v8 = NSNumber;
    [objc_msgSend(objc_msgSend(a3, "creationDate"), "timeIntervalSince1970")];
    [a3 setClientSecretTokenHmac:[-[ACCTicketManager cryptograph](self, "cryptograph") encodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:[-[ACCTicketManager cryptograph](self, "cryptograph") hmac256DataWithData:[-[ACCTicketManager cryptograph](self, "cryptograph") decodeBase16:v5] key:[-[ACCTicket
    id v10 = -[ACCTicketManager twoSVCreateDateForPrincipal:](self, "twoSVCreateDateForPrincipal:", [a3 principal]);
    [a3 setClientSecretCreateDate:v10];
  }
}

- (id)encryptionKeyWithRandomKey:(id)a3
{
  if (![a3 length]) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACCTicketManager.m" lineNumber:841 description:@"Invalid parameter not satisfying: %@", @"0 != randomKey.length"];
  }
  id result = (id)[a3 length];
  if (result)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF990]);
    [self cryptograph].fillEncryptionSuffix:v7;
    id v8 = objc_alloc_init(MEMORY[0x263EFF990]);
    [v8 appendData:a3];
    [v8 appendData:v7];
    [self cryptograph].clearKey:v7;
    double v9 = [[-[ACCTicketManager cryptograph](self, "cryptograph") hashDataSHA256WithData:v8];
    id v10 = [v9 subdataWithRange:0, kACFAES128KeySize];
    [self cryptograph].clearKey:v8;
    return v10;
  }
  return result;
}

- (id)tokenDataHMACForRandomKey:(id)a3 sourceTokenData:(id)a4
{
  if (![a3 length] || !objc_msgSend(a4, "length")) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACCTicketManager.m" lineNumber:862 description:@"Invalid parameter not satisfying: %@", @"0 != randomKey.length && 0 != sourceTokenData.length"];
  }
  if (![a3 length]) {
    return 0;
  }
  if (![a4 length]) {
    return 0;
  }
  id v8 = objc_alloc(MEMORY[0x263EFF990]);
  [self cryptograph].fillHMACSuffix:v8;
  id v9 = objc_alloc_init(MEMORY[0x263EFF990]);
  [v9 appendData:a3];
  [v9 appendData:v8];
  [self cryptograph].clearKey:v8;
  id v10 = [[-[ACCTicketManager cryptograph](self, "cryptograph") hashDataSHA256WithData:v9];
  [self cryptograph].clearKey:v9;
  if (![v10 length]) {
    return 0;
  }
  id v11 = [(ACCTicketManager *)self cryptograph];

  return (id)[v11 hmac256DataWithData:a4 key:v10];
}

- (Class)authContextClass
{
  return self->_authContextClass;
}

- (void)setAuthContextClass:(Class)a3
{
}

- (Class)ssoTokenClass
{
  return self->_ssoTokenClass;
}

- (void)setSsoTokenClass:(Class)a3
{
}

@end