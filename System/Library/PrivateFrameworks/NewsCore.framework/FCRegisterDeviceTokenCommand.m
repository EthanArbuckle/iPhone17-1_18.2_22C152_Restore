@interface FCRegisterDeviceTokenCommand
+ (BOOL)supportsSecureCoding;
- (FCRegisterDeviceTokenCommand)initWithCoder:(id)a3;
- (FCRegisterDeviceTokenCommand)initWithUserID:(id)a3 deviceToken:(id)a4 storefrontID:(id)a5 deviceDigestMode:(int)a6;
- (NSString)deviceToken;
- (NSString)storefrontID;
- (NSString)userID;
- (int)deviceDigestMode;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
- (void)setDeviceDigestMode:(int)a3;
- (void)setDeviceToken:(id)a3;
- (void)setStorefrontID:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation FCRegisterDeviceTokenCommand

- (FCRegisterDeviceTokenCommand)initWithUserID:(id)a3 deviceToken:(id)a4 storefrontID:(id)a5 deviceDigestMode:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = v13;
  v15 = 0;
  if (v11 && v12 && v13)
  {
    v19.receiver = self;
    v19.super_class = (Class)FCRegisterDeviceTokenCommand;
    v16 = [(FCRegisterDeviceTokenCommand *)&v19 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_userID, a3);
      objc_storeStrong((id *)&v17->_deviceToken, a4);
      objc_storeStrong((id *)&v17->_storefrontID, a5);
      v17->_deviceDigestMode = a6;
    }
    self = v17;
    v15 = self;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(FCRegisterDeviceTokenCommand *)self userID];
  [v7 encodeObject:v4 forKey:@"UserIDKey"];

  v5 = [(FCRegisterDeviceTokenCommand *)self deviceToken];
  [v7 encodeObject:v5 forKey:@"DeviceTokenKey"];

  v6 = [(FCRegisterDeviceTokenCommand *)self storefrontID];
  [v7 encodeObject:v6 forKey:@"StorefrontIDKey"];

  objc_msgSend(v7, "encodeInt:forKey:", -[FCRegisterDeviceTokenCommand deviceDigestMode](self, "deviceDigestMode"), @"DigestModeKey");
}

- (NSString)userID
{
  return self->_userID;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (int)deviceDigestMode
{
  return self->_deviceDigestMode;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCRegisterDeviceTokenCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserIDKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceTokenKey"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StorefrontIDKey"];
  uint64_t v8 = [v4 decodeIntForKey:@"DigestModeKey"];

  v9 = [(FCRegisterDeviceTokenCommand *)self initWithUserID:v5 deviceToken:v6 storefrontID:v7 deviceDigestMode:v8];
  return v9;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v7 = a4;
  uint64_t v8 = [a3 notificationsEndpointConnection];
  v9 = [(FCRegisterDeviceTokenCommand *)self userID];
  v10 = [(FCRegisterDeviceTokenCommand *)self deviceToken];
  id v11 = [(FCRegisterDeviceTokenCommand *)self storefrontID];
  uint64_t v12 = [(FCRegisterDeviceTokenCommand *)self deviceDigestMode];
  id v13 = dispatch_get_global_queue(-2, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__FCRegisterDeviceTokenCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v15[3] = &unk_1E5B4D168;
  id v16 = v7;
  v17 = self;
  id v14 = v7;
  [v8 registerDeviceWithUserID:v9 deviceToken:v10 storefrontID:v11 deviceDigestMode:v12 callbackQueue:v13 completion:v15];
}

void __77__FCRegisterDeviceTokenCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v10 = v5;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = 0;
  }
  else if (objc_msgSend(v5, "fc_isNetworkUnavailableError"))
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = 1;
  }
  else
  {
    int v9 = objc_msgSend(v10, "fc_shouldRetry");
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    if (v9) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 3;
    }
  }
  [v6 command:v7 didFinishWithStatus:v8];
}

- (void)setUserID:(id)a3
{
}

- (void)setDeviceToken:(id)a3
{
}

- (void)setStorefrontID:(id)a3
{
}

- (void)setDeviceDigestMode:(int)a3
{
  self->_deviceDigestMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end