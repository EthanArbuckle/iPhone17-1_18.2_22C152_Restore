@interface PKIssuerProvisioningExtensionPaymentPassEntry
+ (BOOL)supportsSecureCoding;
- (PKAddPaymentPassRequestConfiguration)addRequestConfiguration;
- (PKIssuerProvisioningExtensionPaymentPassEntry)initWithCoder:(id)a3;
- (PKIssuerProvisioningExtensionPaymentPassEntry)initWithIdentifier:(NSString *)identifier title:(NSString *)title art:(CGImageRef)art addRequestConfiguration:(PKAddPaymentPassRequestConfiguration *)configuration;
- (id)_initWithType:(int64_t)a3 identifier:(id)a4 title:(id)a5 art:(CGImage *)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKIssuerProvisioningExtensionPaymentPassEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithType:(int64_t)a3 identifier:(id)a4 title:(id)a5 art:(CGImage *)a6
{
  v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionPaymentPassEntry: invalid initializer.", v9, 2u);
  }

  return 0;
}

- (PKIssuerProvisioningExtensionPaymentPassEntry)initWithIdentifier:(NSString *)identifier title:(NSString *)title art:(CGImageRef)art addRequestConfiguration:(PKAddPaymentPassRequestConfiguration *)configuration
{
  v10 = identifier;
  v11 = title;
  v12 = configuration;
  v13 = v12;
  if (!v12)
  {
    v18 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "PKIssuerProvisioningExtensionPaymentPassEntry: initializer missing required parameters.";
LABEL_10:
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    }
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }
  v14 = [(PKAddPaymentPassRequestConfiguration *)v12 cardholderName];
  if (!v14)
  {
    v14 = [(PKAddPaymentPassRequestConfiguration *)v13 primaryAccountSuffix];
    if (!v14)
    {
      v21 = [(PKAddPaymentPassRequestConfiguration *)v13 cardDetails];
      uint64_t v22 = [v21 count];

      if (v22) {
        goto LABEL_5;
      }
      v18 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v19 = "PKIssuerProvisioningExtensionPaymentPassEntry: configuration missing card details.";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
  }

LABEL_5:
  v23.receiver = self;
  v23.super_class = (Class)PKIssuerProvisioningExtensionPaymentPassEntry;
  v15 = [(PKIssuerProvisioningExtensionPassEntry *)&v23 _initWithType:1 identifier:v10 title:v11 art:art];
  v16 = v15;
  if (v15) {
    objc_storeStrong(v15 + 5, configuration);
  }
  self = v16;
  v17 = self;
LABEL_12:

  return v17;
}

- (PKIssuerProvisioningExtensionPaymentPassEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKIssuerProvisioningExtensionPaymentPassEntry;
  v5 = [(PKIssuerProvisioningExtensionPassEntry *)&v10 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    [(PKIssuerProvisioningExtensionPassEntry *)v5 setType:1];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"addRequestConfiguration"];
    addRequestConfiguration = v6->_addRequestConfiguration;
    v6->_addRequestConfiguration = (PKAddPaymentPassRequestConfiguration *)v7;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKIssuerProvisioningExtensionPaymentPassEntry;
  id v4 = a3;
  [(PKIssuerProvisioningExtensionPassEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_addRequestConfiguration, @"addRequestConfiguration", v5.receiver, v5.super_class);
}

- (PKAddPaymentPassRequestConfiguration)addRequestConfiguration
{
  return self->_addRequestConfiguration;
}

- (void).cxx_destruct
{
}

@end