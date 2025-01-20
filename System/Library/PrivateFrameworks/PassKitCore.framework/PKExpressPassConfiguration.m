@interface PKExpressPassConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNFCExpressEnabled;
- (BOOL)isUWBExpressEnabled;
- (NSString)passUniqueIdentifier;
- (PKExpressPassConfiguration)initWithCoder:(id)a3;
- (PKExpressPassConfiguration)initWithPassInformation:(id)a3 forPaymentApplications:(id)a4;
- (PKExpressPassConfiguration)initWithPassInformation:(id)a3 forSecureElementPass:(id)a4;
- (PKExpressPassConfiguration)initWithPassInformation:(id)a3 isNFCExpressEnabled:(BOOL)a4 isUWBExpressEnabled:(BOOL)a5;
- (PKExpressPassInformation)passInformation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForPaymentPass:(id)a3 isNFCExpressEnabled:(BOOL)a4 isUWBExpressEnabled:(BOOL)a5 withTechologyTest:(id)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKExpressPassConfiguration

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passInformation, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

- (PKExpressPassConfiguration)initWithPassInformation:(id)a3 forSecureElementPass:(id)a4
{
  id v6 = a3;
  v7 = [a4 devicePaymentApplications];
  v8 = [(PKExpressPassConfiguration *)self initWithPassInformation:v6 forPaymentApplications:v7];

  return v8;
}

- (PKExpressPassConfiguration)initWithPassInformation:(id)a3 forPaymentApplications:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v21 = self;
    v8 = [v6 paymentApplicationIdentifiers];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v12 = 0;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "applicationIdentifier", v20);
          int v17 = [v8 containsObject:v16];

          if (v17) {
            v12 |= [v15 supportedRadioTechnologies];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
    else
    {
      unint64_t v12 = 0;
    }

    self = [(PKExpressPassConfiguration *)v21 initWithPassInformation:v6 isNFCExpressEnabled:v12 & 1 isUWBExpressEnabled:(v12 >> 1) & 1];
    v18 = self;
    id v7 = v20;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (PKExpressPassConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passInformation"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isNFCExpressEnabled"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isUWBExpressEnabled"];

  v8 = [(PKExpressPassConfiguration *)self initWithPassInformation:v5 isNFCExpressEnabled:v6 isUWBExpressEnabled:v7];
  return v8;
}

- (PKExpressPassConfiguration)initWithPassInformation:(id)a3 isNFCExpressEnabled:(BOOL)a4 isUWBExpressEnabled:(BOOL)a5
{
  result = (PKExpressPassConfiguration *)a3;
  if (result)
  {
    uint64_t v10 = result;
    v14.receiver = self;
    v14.super_class = (Class)PKExpressPassConfiguration;
    uint64_t v11 = [(PKExpressPassConfiguration *)&v14 init];
    if (v11)
    {
      uint64_t v12 = [(PKExpressPassConfiguration *)v10 passUniqueIdentifier];
      passUniqueIdentifier = v11->_passUniqueIdentifier;
      v11->_passUniqueIdentifier = (NSString *)v12;

      objc_storeStrong((id *)&v11->_passInformation, a3);
      v11->_isNFCExpressEnabled = a4;
      v11->_isUWBExpressEnabled = a5;
      if (!a4 && !a5)
      {

        uint64_t v11 = 0;
      }
    }

    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  passUniqueIdentifier = self->_passUniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:passUniqueIdentifier forKey:@"passUniqueIdentifier"];
  [v5 encodeObject:self->_passInformation forKey:@"passInformation"];
  [v5 encodeBool:self->_isNFCExpressEnabled forKey:@"isNFCExpressEnabled"];
  [v5 encodeBool:self->_isUWBExpressEnabled forKey:@"isUWBExpressEnabled"];
}

- (id)initForPaymentPass:(id)a3 isNFCExpressEnabled:(BOOL)a4 isUWBExpressEnabled:(BOOL)a5 withTechologyTest:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [[PKExpressPassInformation alloc] initForPaymentPass:v11 withTechologyTest:v10];

  if (v12)
  {
    uint64_t v13 = [(PKExpressPassConfiguration *)self initWithPassInformation:v12 isNFCExpressEnabled:v7 isUWBExpressEnabled:v6];
  }
  else
  {

    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKExpressPassConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      BOOL v6 = v4;
    }
    else {
      BOOL v6 = 0;
    }
    BOOL v7 = v6;
    if ((isKindOfClass & 1) != 0
      && [(NSString *)self->_passUniqueIdentifier isEqualToString:v4->_passUniqueIdentifier]
      && [(PKExpressPassInformation *)self->_passInformation isEqual:v4->_passInformation]
      && self->_isNFCExpressEnabled != !v4->_isNFCExpressEnabled)
    {
      BOOL v8 = self->_isUWBExpressEnabled ^ !v4->_isUWBExpressEnabled;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passUniqueIdentifier hash];
  unint64_t v4 = [(PKExpressPassInformation *)self->_passInformation hash];
  uint64_t v5 = self->_isNFCExpressEnabled - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return self->_isUWBExpressEnabled - v5 + 32 * v5 + 15699857;
}

- (id)description
{
  id v3 = [NSString alloc];
  unint64_t v4 = @"YES";
  if (self->_isNFCExpressEnabled) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  if (!self->_isUWBExpressEnabled) {
    unint64_t v4 = @"NO";
  }
  BOOL v6 = objc_msgSend(v3, "initWithFormat:", @"<PKExpressPassConfiguration: %p; Pass %@; NFC Express Enabled: %@; UWB Express Enabled: %@; Information: %@>",
                 self,
                 self->_passUniqueIdentifier,
                 v5,
                 v4,
                 self->_passInformation);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[PKExpressPassInformation allocWithZone:](PKExpressPassInformation, "allocWithZone:") initWithExpressPassInformation:self->_passInformation];
  BOOL v6 = [+[PKExpressPassConfiguration allocWithZone:a3] initWithPassInformation:v5 isNFCExpressEnabled:self->_isNFCExpressEnabled isUWBExpressEnabled:self->_isUWBExpressEnabled];

  return v6;
}

- (PKExpressPassInformation)passInformation
{
  return self->_passInformation;
}

- (BOOL)isNFCExpressEnabled
{
  return self->_isNFCExpressEnabled;
}

- (BOOL)isUWBExpressEnabled
{
  return self->_isUWBExpressEnabled;
}

@end