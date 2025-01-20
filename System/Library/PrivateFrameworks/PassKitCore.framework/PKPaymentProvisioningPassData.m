@interface PKPaymentProvisioningPassData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)suppressMakeDefaultPaymentPassOffer;
- (BOOL)willProvisionWithAuthenticationDisabled;
- (NSString)ownershipToken;
- (NSString)ownershipTokenIdentifier;
- (NSURL)passURL;
- (PKAppletSubcredential)deviceCredential;
- (PKPaymentProvisioningPassData)init;
- (PKPaymentProvisioningPassData)initWithCoder:(id)a3;
- (PKPaymentProvisioningPassData)initWithDictionary:(id)a3;
- (PKPaymentProvisioningPassData)initWithPassURL:(id)a3;
- (PKPaymentProvisioningPassData)initWithSecureElementPass:(id)a3;
- (PKSecureElementPass)secureElementPass;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceCredential:(id)a3;
- (void)setSecureElementPass:(id)a3;
- (void)setWillProvisionWithAuthenticationDisabled:(BOOL)a3;
@end

@implementation PKPaymentProvisioningPassData

- (PKPaymentProvisioningPassData)init
{
  return 0;
}

- (PKPaymentProvisioningPassData)initWithSecureElementPass:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    p_super = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[PKPaymentProvisioningPassData initWithSecureElementPass:]";
      _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "%s called with nil pass. Returning self as nil.", buf, 0xCu);
    }
    goto LABEL_6;
  }
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentProvisioningPassData;
  self = [(PKPaymentProvisioningPassData *)&v8 init];
  if (self)
  {
    v5 = (PKSecureElementPass *)v4;
    p_super = &self->_secureElementPass->super.super.super;
    self->_secureElementPass = v5;
LABEL_6:
  }
  return self;
}

- (PKPaymentProvisioningPassData)initWithDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentProvisioningPassData;
  v5 = [(PKPaymentProvisioningPassData *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"passURL"];
    if (v6)
    {
      v7 = (void *)v6;
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
      passURL = v5->_passURL;
      v5->_passURL = (NSURL *)v8;

      v5->_willProvisionWithAuthenticationDisabled = [v4 PKBoolForKey:@"willProvisionWithAuthenticationDisabled"];
      uint64_t v10 = [v4 PKStringForKey:@"ownershipToken"];
      ownershipToken = v5->_ownershipToken;
      v5->_ownershipToken = (NSString *)v10;

      uint64_t v12 = [v4 PKStringForKey:@"ownershipTokenIdentifier"];
      ownershipTokenIdentifier = v5->_ownershipTokenIdentifier;
      v5->_ownershipTokenIdentifier = (NSString *)v12;

      v5->_suppressMakeDefaultPaymentPassOffer = [v4 PKBoolForKey:@"suppressMakeDefaultPaymentPassOffer"];
    }
    else
    {
      v14 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        id v16 = v15;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Malformed response: Missing passURL when creating %@", buf, 0xCu);
      }
      v7 = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (PKPaymentProvisioningPassData)initWithPassURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentProvisioningPassData;
  uint64_t v6 = [(PKPaymentProvisioningPassData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_passURL, a3);
  }

  return v7;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  v7 = [(PKObject *)self->_secureElementPass uniqueID];
  [v6 appendFormat:@"pass identifier: '%@'; ", v7];

  uint64_t v8 = [(NSURL *)self->_passURL absoluteString];
  [v6 appendFormat:@"pass url: '%@'; ", v8];

  [v6 appendFormat:@"deviceCredential: %@; ", self->_deviceCredential];
  if (self->_willProvisionWithAuthenticationDisabled) {
    objc_super v9 = @"YES";
  }
  else {
    objc_super v9 = @"NO";
  }
  [v6 appendFormat:@"willProvisionWithAuthenticationDisabled: '%@'; ", v9];
  if (self->_suppressMakeDefaultPaymentPassOffer) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  [v6 appendFormat:@"suppressMakeDefaultPaymentPassOffer: '%@'; ", v10];
  [v6 appendFormat:@"ownershipToken: '%@'; ", self->_ownershipToken];
  [v6 appendFormat:@"ownershipTokenIdentifier: '%@'; ", self->_ownershipTokenIdentifier];
  [v6 appendFormat:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentProvisioningPassData *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(PKObject *)self->_secureElementPass uniqueID];
      uint64_t v6 = [(PKObject *)v4->_secureElementPass uniqueID];
      id v7 = v5;
      id v8 = v6;
      objc_super v9 = v8;
      if (v7 == v8)
      {
        char v10 = 1;
      }
      else
      {
        char v10 = 0;
        if (v7 && v8) {
          char v10 = [v7 isEqualToString:v8];
        }
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_passURL)
  {
    v7[0] = self->_passURL;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v3 = [(PKObject *)self->_secureElementPass uniqueID];
    uint64_t v6 = v3;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  }
  unint64_t v4 = PKCombinedHash(17, v2);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentProvisioningPassData)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentProvisioningPassData;
  id v5 = [(PKPaymentProvisioningPassData *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passURL"];
    passURL = v5->_passURL;
    v5->_passURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureElementPass"];
    secureElementPass = v5->_secureElementPass;
    v5->_secureElementPass = (PKSecureElementPass *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceCredential"];
    deviceCredential = v5->_deviceCredential;
    v5->_deviceCredential = (PKAppletSubcredential *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownershipToken"];
    ownershipToken = v5->_ownershipToken;
    v5->_ownershipToken = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownershipTokenIdentifier"];
    ownershipTokenIdentifier = v5->_ownershipTokenIdentifier;
    v5->_ownershipTokenIdentifier = (NSString *)v14;

    v5->_willProvisionWithAuthenticationDisabled = [v4 decodeBoolForKey:@"willProvisionWithAuthenticationDisabled"];
    v5->_suppressMakeDefaultPaymentPassOffer = [v4 decodeBoolForKey:@"suppressMakeDefaultPaymentPassOffer"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  passURL = self->_passURL;
  id v5 = a3;
  [v5 encodeObject:passURL forKey:@"passURL"];
  [v5 encodeObject:self->_secureElementPass forKey:@"secureElementPass"];
  [v5 encodeObject:self->_deviceCredential forKey:@"deviceCredential"];
  [v5 encodeObject:self->_ownershipToken forKey:@"ownershipToken"];
  [v5 encodeObject:self->_ownershipTokenIdentifier forKey:@"ownershipTokenIdentifier"];
  [v5 encodeBool:self->_willProvisionWithAuthenticationDisabled forKey:@"willProvisionWithAuthenticationDisabled"];
  [v5 encodeBool:self->_suppressMakeDefaultPaymentPassOffer forKey:@"suppressMakeDefaultPaymentPassOffer"];
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (PKSecureElementPass)secureElementPass
{
  return self->_secureElementPass;
}

- (void)setSecureElementPass:(id)a3
{
}

- (PKAppletSubcredential)deviceCredential
{
  return self->_deviceCredential;
}

- (void)setDeviceCredential:(id)a3
{
}

- (BOOL)willProvisionWithAuthenticationDisabled
{
  return self->_willProvisionWithAuthenticationDisabled;
}

- (void)setWillProvisionWithAuthenticationDisabled:(BOOL)a3
{
  self->_willProvisionWithAuthenticationDisabled = a3;
}

- (BOOL)suppressMakeDefaultPaymentPassOffer
{
  return self->_suppressMakeDefaultPaymentPassOffer;
}

- (NSString)ownershipToken
{
  return self->_ownershipToken;
}

- (NSString)ownershipTokenIdentifier
{
  return self->_ownershipTokenIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownershipTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);
  objc_storeStrong((id *)&self->_deviceCredential, 0);
  objc_storeStrong((id *)&self->_secureElementPass, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
}

@end