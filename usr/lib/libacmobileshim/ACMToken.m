@interface ACMToken
+ (id)tokenWithPrincipal:(id)a3 creationDate:(id)a4 tokenData:(id)a5;
+ (id)tokenWithPrincipal:(id)a3 creationDate:(id)a4 tokenString:(id)a5;
- (ACFPrincipal)principal;
- (NSData)tokenData;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSNumber)isTwoStepVerificationRequired;
- (NSNumber)personID;
- (NSString)nonce;
- (NSString)tokenString;
- (NSString)userPreferences;
- (void)dealloc;
- (void)setCreationDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIsTwoStepVerificationRequired:(id)a3;
- (void)setNonce:(id)a3;
- (void)setPersonID:(id)a3;
- (void)setPrincipal:(id)a3;
- (void)setTokenData:(id)a3;
- (void)setTokenString:(id)a3;
- (void)setUserPreferences:(id)a3;
@end

@implementation ACMToken

+ (id)tokenWithPrincipal:(id)a3 creationDate:(id)a4 tokenData:(id)a5
{
  v8 = objc_opt_new();
  [v8 setPrincipal:a3];
  [v8 setCreationDate:a4];
  [v8 setTokenData:a5];

  return v8;
}

+ (id)tokenWithPrincipal:(id)a3 creationDate:(id)a4 tokenString:(id)a5
{
  v8 = objc_opt_new();
  [v8 setPrincipal:a3];
  [v8 setCreationDate:a4];
  [v8 setTokenString:a5];

  return v8;
}

- (void)dealloc
{
  [(ACMToken *)self setTokenData:0];
  [(ACMToken *)self setPrincipal:0];
  [(ACMToken *)self setCreationDate:0];
  [(ACMToken *)self setExpirationDate:0];
  [(ACMToken *)self setNonce:0];
  [(ACMToken *)self setUserPreferences:0];
  [(ACMToken *)self setPersonID:0];
  [(ACMToken *)self setIsTwoStepVerificationRequired:0];
  v3.receiver = self;
  v3.super_class = (Class)ACMToken;
  [(ACMToken *)&v3 dealloc];
}

- (NSDate)expirationDate
{
  if (self->_expirationDate) {
    return self->_expirationDate;
  }
  objc_super v3 = [(ACMToken *)self creationDate];

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

- (NSString)tokenString
{
  v2 = [(ACMToken *)self tokenData];

  return (NSString *)ACFEncodeBase64((uint64_t)v2);
}

- (void)setTokenString:(id)a3
{
  id v4 = ACFDecodeBase64(a3);

  [(ACMToken *)self setTokenData:v4];
}

- (NSData)tokenData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTokenData:(id)a3
{
}

- (ACFPrincipal)principal
{
  return (ACFPrincipal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrincipal:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)nonce
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNonce:(id)a3
{
}

- (NSString)userPreferences
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserPreferences:(id)a3
{
}

- (NSNumber)personID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPersonID:(id)a3
{
}

- (NSNumber)isTwoStepVerificationRequired
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIsTwoStepVerificationRequired:(id)a3
{
}

@end