@interface ACCAuthContext
+ (id)authContextWithRequest:(id)a3;
- (ACCAuthContext)initWithRequest:(id)a3;
- (ACFMessage)request;
- (ACFPrincipal)principal;
- (NSData)encryptionKey;
- (NSData)initializationVector;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSMutableDictionary)parametersDictionary;
- (NSNumber)appID;
- (NSNumber)authenticationType;
- (NSNumber)clientSecretCreateDate;
- (NSNumber)personID;
- (NSNumber)touchIDSupport;
- (NSString)appIDKey;
- (NSString)clientSecretTokenHmac;
- (NSString)currentUserKey;
- (NSString)dsKeyVersion;
- (NSString)encryptionHash;
- (NSString)nonce;
- (NSString)oldUserKey;
- (NSString)recoveryKey;
- (NSString)selectedDeviceId;
- (NSString)selectedDeviceType;
- (NSString)serviceName;
- (NSString)sessionToken;
- (NSString)tokenVersion;
- (NSString)twoStepVerificationCode;
- (NSString)xmlTokenSourceString;
- (id)strippedPropertyListString:(id)a3;
- (void)dealloc;
- (void)setAppID:(id)a3;
- (void)setAppIDKey:(id)a3;
- (void)setAuthenticationType:(id)a3;
- (void)setClientSecretCreateDate:(id)a3;
- (void)setClientSecretTokenHmac:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCurrentUserKey:(id)a3;
- (void)setDsKeyVersion:(id)a3;
- (void)setEncryptionHash:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setInitializationVector:(id)a3;
- (void)setNonce:(id)a3;
- (void)setOldUserKey:(id)a3;
- (void)setPersonID:(id)a3;
- (void)setPrincipal:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSelectedDeviceId:(id)a3;
- (void)setSelectedDeviceType:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setTokenVersion:(id)a3;
- (void)setTouchIDSupport:(id)a3;
- (void)setTwoStepVerificationCode:(id)a3;
@end

@implementation ACCAuthContext

+ (id)authContextWithRequest:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"+[ACCAuthContext authContextWithRequest:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCAuthContext.m", 47, 0, "Creating initial token");
  }
  v5 = (void *)[objc_alloc((Class)a1) initWithRequest:a3];

  return v5;
}

- (ACCAuthContext)initWithRequest:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ACCAuthContext;
  v4 = [(ACCAuthContext *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(ACCAuthContext *)v4 setDsKeyVersion:@"0.0"];
    -[ACCAuthContext setPrincipal:](v5, "setPrincipal:", [a3 principal]);
    -[ACCAuthContext setAppID:](v5, "setAppID:", [a3 appID]);
    -[ACCAuthContext setAppIDKey:](v5, "setAppIDKey:", [a3 appIDKey]);
    -[ACCAuthContext setCreationDate:](v5, "setCreationDate:", [MEMORY[0x263EFF910] date]);
    -[ACCAuthContext setServiceName:](v5, "setServiceName:", [a3 serviceName]);
    [(ACCAuthContext *)v5 setRequest:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(ACCAuthContext *)self setDsKeyVersion:0];
  [(ACCAuthContext *)self setAppID:0];
  [(ACCAuthContext *)self setAppIDKey:0];
  [(ACCAuthContext *)self setRequest:0];
  [(ACCAuthContext *)self setNonce:0];
  [(ACCAuthContext *)self setEncryptionHash:0];
  [(ACCAuthContext *)self setOldUserKey:0];
  [(ACCAuthContext *)self setCurrentUserKey:0];
  [(ACCAuthContext *)self setPrincipal:0];
  [(ACCAuthContext *)self setCreationDate:0];
  [(ACCAuthContext *)self setExpirationDate:0];
  [(ACCAuthContext *)self setSessionToken:0];
  [(ACCAuthContext *)self setTokenVersion:0];
  [(ACCAuthContext *)self setTwoStepVerificationCode:0];
  [(ACCAuthContext *)self setPersonID:0];
  [(ACCAuthContext *)self setSelectedDeviceId:0];
  [(ACCAuthContext *)self setSelectedDeviceType:0];
  [(ACCAuthContext *)self setServiceName:0];
  [(ACCAuthContext *)self setRecoveryKey:0];
  [(ACCAuthContext *)self setClientSecretTokenHmac:0];
  [(ACCAuthContext *)self setClientSecretCreateDate:0];
  [(ACCAuthContext *)self setTouchIDSupport:0];
  v3.receiver = self;
  v3.super_class = (Class)ACCAuthContext;
  [(ACCAuthContext *)&v3 dealloc];
}

- (NSDate)expirationDate
{
  if (self->_expirationDate) {
    return self->_expirationDate;
  }
  objc_super v3 = [(ACCAuthContext *)self creationDate];

  return [(NSDate *)v3 dateByAddingTimeInterval:300.0];
}

- (void)setExpirationDate:(id)a3
{
  expirationDate = self->_expirationDate;
  if (expirationDate != a3)
  {
    v6 = expirationDate;
    self->_expirationDate = (NSDate *)a3;
  }
}

- (NSMutableDictionary)parametersDictionary
{
  objc_super v3 = (NSMutableDictionary *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSString *)[(ACFPrincipal *)[(ACCAuthContext *)self principal] realm] length])
  {
    [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self tokenVersion] forKey:@"a"];
    if ([(NSString *)[(ACFPrincipal *)[(ACCAuthContext *)self principal] userName] length])
    {
      [(NSMutableDictionary *)v3 setValue:[(ACFPrincipal *)[(ACCAuthContext *)self principal] userName] forKey:@"b"];
    }
    [(NSMutableDictionary *)v3 setValue:[(ACFPrincipal *)[(ACCAuthContext *)self principal] realm] forKey:@"c"];
    v4 = NSNumber;
    [(NSDate *)[(ACCAuthContext *)self creationDate] timeIntervalSince1970];
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", [v4 numberWithUnsignedLongLong:(unint64_t)(v5 * 1000.0)], @"d");
    v6 = NSNumber;
    [(NSDate *)[(ACCAuthContext *)self expirationDate] timeIntervalSince1970];
    -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", [v6 numberWithUnsignedLongLong:(unint64_t)(v7 * 1000.0)], @"e");
    if ([(ACCAuthContext *)self appID]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self appID] forKey:@"m"];
    }
    if ([(NSString *)[(ACCAuthContext *)self appIDKey] length]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self appIDKey] forKey:@"n"];
    }
    [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self nonce] forKey:@"o"];
    [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self dsKeyVersion] forKey:@"t"];
    if ([(ACCAuthContext *)self encryptionHash]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self encryptionHash] forKey:@"sh"];
    }
    [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self authenticationType] forKey:@"s"];
    if ([(ACCAuthContext *)self sessionToken]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self sessionToken] forKey:@"q"];
    }
    if ([(ACCAuthContext *)self currentUserKey]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self currentUserKey] forKey:@"nv"];
    }
    if ([(ACCAuthContext *)self oldUserKey]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self oldUserKey] forKey:@"ov"];
    }
    if ([(ACCAuthContext *)self personID]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self personID] forKey:@"pid"];
    }
    if ([(ACCAuthContext *)self serviceName]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self serviceName] forKey:@"sn"];
    }
    if ([(ACCAuthContext *)self selectedDeviceId]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self selectedDeviceId] forKey:@"di"];
    }
    if ([(ACCAuthContext *)self selectedDeviceType]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self selectedDeviceType] forKey:@"dk"];
    }
    if ([(ACCAuthContext *)self twoStepVerificationCode]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self twoStepVerificationCode] forKey:@"sc"];
    }
    if ([(ACCAuthContext *)self clientSecretTokenHmac])
    {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self clientSecretTokenHmac] forKey:@"ho"];
      if ([(ACCAuthContext *)self clientSecretCreateDate]) {
        [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self clientSecretCreateDate] forKey:@"ccd"];
      }
    }
    if ([(ACCAuthContext *)self recoveryKey]) {
      [(NSMutableDictionary *)v3 setValue:[(ACCAuthContext *)self recoveryKey] forKey:@"rk"];
    }
    v8 = (void *)[MEMORY[0x263EFF960] currentLocale];
    uint64_t v9 = [v8 objectForKey:*MEMORY[0x263EFF508]];
    uint64_t v10 = [v8 objectForKey:*MEMORY[0x263EFF4D0]];
    uint64_t v11 = [[(id)objc_msgSend(MEMORY[0x263EFFA18], "systemTimeZone") name];
    if (v9) {
      [(NSMutableDictionary *)v3 setValue:v9 forKey:@"lc"];
    }
    if (v10) {
      [(NSMutableDictionary *)v3 setValue:v10 forKey:@"lr"];
    }
    if (v11) {
      [(NSMutableDictionary *)v3 setValue:v11 forKey:@"tz"];
    }
  }
  return v3;
}

- (NSString)xmlTokenSourceString
{
  objc_super v3 = [(ACCAuthContext *)self parametersDictionary];
  uint64_t v8 = 0;
  uint64_t v4 = [MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:100 options:0 error:&v8];
  if (v8)
  {
    if (!ACFLog)
    {
      id v5 = (id)[[NSString alloc] initWithData:v4 encoding:4];
      goto LABEL_10;
    }
    if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACCAuthContext xmlTokenSourceString]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCAuthContext.m", 230, 0, "Failed to create plist: %@", v8);
    }
  }
  id v5 = (id)[[NSString alloc] initWithData:v4 encoding:4];
  if (!ACFLog) {
    return (NSString *)[(ACCAuthContext *)self strippedPropertyListString:v5];
  }
  if ((ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACCAuthContext xmlTokenSourceString]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCAuthContext.m", 233, 0, "SIZE TEST: Token source string size is %d", [v5 length]);
  }
LABEL_10:
  id v6 = [(ACCAuthContext *)self strippedPropertyListString:v5];
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACCAuthContext xmlTokenSourceString]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACCAuthContext.m", 235, 0, "SIZE TEST: Stripped token source string size is %d", [v6 length]);
  }
  return (NSString *)v6;
}

- (id)strippedPropertyListString:(id)a3
{
  objc_super v3 = [objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", @"\n"), "componentsJoinedByString:", &stru_26F261788), "componentsSeparatedByString:", @"\t");

  return (id)[v3 componentsJoinedByString:&stru_26F261788];
}

- (NSString)dsKeyVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDsKeyVersion:(id)a3
{
}

- (NSNumber)appID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAppID:(id)a3
{
}

- (NSString)appIDKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppIDKey:(id)a3
{
}

- (ACFMessage)request
{
  return (ACFMessage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSString)nonce
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNonce:(id)a3
{
}

- (NSString)encryptionHash
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEncryptionHash:(id)a3
{
}

- (NSNumber)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
  self->_authenticationType = (NSNumber *)a3;
}

- (NSString)oldUserKey
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOldUserKey:(id)a3
{
}

- (NSString)currentUserKey
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentUserKey:(id)a3
{
}

- (ACFPrincipal)principal
{
  return (ACFPrincipal *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrincipal:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)sessionToken
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSessionToken:(id)a3
{
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSString)tokenVersion
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTokenVersion:(id)a3
{
}

- (NSString)twoStepVerificationCode
{
  return self->_twoStepVerificationCode;
}

- (void)setTwoStepVerificationCode:(id)a3
{
}

- (NSNumber)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
}

- (NSString)selectedDeviceId
{
  return self->_selectedDeviceId;
}

- (void)setSelectedDeviceId:(id)a3
{
}

- (NSString)selectedDeviceType
{
  return self->_selectedDeviceType;
}

- (void)setSelectedDeviceType:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (NSString)clientSecretTokenHmac
{
  return self->_clientSecretTokenHmac;
}

- (void)setClientSecretTokenHmac:(id)a3
{
}

- (NSNumber)clientSecretCreateDate
{
  return self->_clientSecretCreateDate;
}

- (void)setClientSecretCreateDate:(id)a3
{
}

- (NSNumber)touchIDSupport
{
  return self->_touchIDSupport;
}

- (void)setTouchIDSupport:(id)a3
{
}

@end