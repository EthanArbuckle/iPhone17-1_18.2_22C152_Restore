@interface UNCRemoteNotificationClient
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (NSData)lastKnownDeviceToken;
- (NSString)environment;
- (NSString)tokenIdentifier;
- (UNCRemoteNotificationClient)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setLastKnownDeviceToken:(id)a3;
- (void)setTokenIdentifier:(id)a3;
@end

@implementation UNCRemoteNotificationClient

+ (void)initialize
{
  [MEMORY[0x263F08928] setClass:objc_opt_class() forClassName:@"UNRemoteNotificationClient"];
  v2 = (void *)MEMORY[0x263F08928];
  uint64_t v3 = objc_opt_class();

  [v2 setClass:v3 forClassName:@"SBRemoteNotificationClient"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCRemoteNotificationClient)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UNCRemoteNotificationClient;
  v5 = [(UNCRemoteNotificationClient *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SBEnvironment"];
    [(UNCRemoteNotificationClient *)v5 setEnvironment:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SBLastKnownDeviceToken"];
    [(UNCRemoteNotificationClient *)v5 setLastKnownDeviceToken:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SBTokenId"];
    [(UNCRemoteNotificationClient *)v5 setTokenIdentifier:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UNCRemoteNotificationClient *)self environment];
  [v4 encodeObject:v5 forKey:@"SBEnvironment"];

  v6 = [(UNCRemoteNotificationClient *)self lastKnownDeviceToken];
  [v4 encodeObject:v6 forKey:@"SBLastKnownDeviceToken"];

  id v7 = [(UNCRemoteNotificationClient *)self tokenIdentifier];
  [v4 encodeObject:v7 forKey:@"SBTokenId"];
}

- (NSString)tokenIdentifier
{
  return self->_tokenIdentifier;
}

- (void)setTokenIdentifier:(id)a3
{
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSData)lastKnownDeviceToken
{
  return self->_lastKnownDeviceToken;
}

- (void)setLastKnownDeviceToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownDeviceToken, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_tokenIdentifier, 0);
}

@end