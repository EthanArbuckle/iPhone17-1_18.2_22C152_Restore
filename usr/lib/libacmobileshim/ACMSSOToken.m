@interface ACMSSOToken
+ (id)tokenWithKeychainTokenInfo:(id)a3;
+ (id)tokenWithToken:(id)a3 data:(id)a4;
- (ACFMessage)initialRequest;
- (BOOL)longLiveSession;
- (NSDate)recentAuthenticationDate;
- (NSDate)recentUnlockDate;
- (NSDictionary)tokenDictionary;
- (NSNumber)clientSecretCreationTimestamp;
- (NSNumber)personID;
- (NSString)clientSecret;
- (NSString)sessionToken;
- (void)dealloc;
- (void)setClientSecret:(id)a3;
- (void)setClientSecretCreationTimestamp:(id)a3;
- (void)setInitialRequest:(id)a3;
- (void)setLongLiveSession:(BOOL)a3;
- (void)setPersonID:(id)a3;
- (void)setRecentAuthenticationDate:(id)a3;
- (void)setRecentUnlockDate:(id)a3;
- (void)setSessionToken:(id)a3;
@end

@implementation ACMSSOToken

+ (id)tokenWithKeychainTokenInfo:(id)a3
{
  v3 = (void *)[a3 generic];
  if ([v3 length])
  {
    id v4 = (id)objc_opt_new();
    [v4 setTokenData:v3];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"+[ACMSSOToken tokenWithKeychainTokenInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMSSOToken.m", 56, 0, "Invalid keychain token info");
    }
    return 0;
  }
  return v4;
}

+ (id)tokenWithToken:(id)a3 data:(id)a4
{
  id v6 = (id)objc_opt_new();
  [v6 setNonce:[a3 nonce]];
  [v6 setSessionToken:[a3 sessionToken]];
  [v6 setCreationDate:[a3 creationDate]];
  [v6 setExpirationDate:[a3 expirationDate]];
  [v6 setRecentAuthenticationDate:[a3 recentAuthenticationDate]];
  [v6 setRecentUnlockDate:[a3 recentUnlockDate]];
  [v6 setPrincipal:[a3 principal]];
  [v6 setTokenData:a4];
  return v6;
}

- (void)dealloc
{
  [(ACMSSOToken *)self setSessionToken:0];
  [(ACMSSOToken *)self setRecentAuthenticationDate:0];
  [(ACMSSOToken *)self setRecentUnlockDate:0];
  [(ACMSSOToken *)self setInitialRequest:0];
  [(ACMSSOToken *)self setPersonID:0];
  v3.receiver = self;
  v3.super_class = (Class)ACMSSOToken;
  [(ACMToken *)&v3 dealloc];
}

- (NSDictionary)tokenDictionary
{
  objc_super v3 = NSDictionary;
  id v4 = [(ACFPrincipal *)[(ACMToken *)self principal] userName];
  v5 = [(ACFPrincipal *)[(ACMToken *)self principal] realm];
  id v6 = NSNumber;
  [(NSDate *)[(ACMToken *)self expirationDate] timeIntervalSince1970];
  return (NSDictionary *)[v3 dictionaryWithObjectsAndKeys:v4, @"b", v5, @"c", [objc_msgSend(v6, "numberWithLongLong:", (uint64_t)(v7 * 1000.0))], @"e", -[ACMToken nonce](self, "nonce"), @"o", -[ACMSSOToken sessionToken](self, "sessionToken"), @"q", 0];
}

- (ACFMessage)initialRequest
{
  return self->_initialRequest;
}

- (void)setInitialRequest:(id)a3
{
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (NSDate)recentAuthenticationDate
{
  return self->_recentAuthenticationDate;
}

- (void)setRecentAuthenticationDate:(id)a3
{
}

- (NSNumber)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
}

- (NSDate)recentUnlockDate
{
  return self->_recentUnlockDate;
}

- (void)setRecentUnlockDate:(id)a3
{
}

- (NSString)clientSecret
{
  return self->_clientSecret;
}

- (void)setClientSecret:(id)a3
{
}

- (NSNumber)clientSecretCreationTimestamp
{
  return self->_clientSecretCreationTimestamp;
}

- (void)setClientSecretCreationTimestamp:(id)a3
{
}

- (BOOL)longLiveSession
{
  return self->_longLiveSession;
}

- (void)setLongLiveSession:(BOOL)a3
{
  self->_longLiveSession = a3;
}

@end