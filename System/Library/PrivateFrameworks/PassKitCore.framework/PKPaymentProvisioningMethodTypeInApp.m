@interface PKPaymentProvisioningMethodTypeInApp
- (NSArray)associatedStoreIdentifiers;
- (NSArray)cardTypeSupport;
- (NSURL)appLaunchURL;
- (PKPaymentProvisioningMethodTypeInApp)init;
- (PKPaymentProvisioningMethodTypeInApp)initWithCoder:(id)a3;
- (PKPaymentProvisioningMethodTypeInApp)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_decorateDescription:(id)a3;
- (void)encodeWithCode:(id)a3;
@end

@implementation PKPaymentProvisioningMethodTypeInApp

- (PKPaymentProvisioningMethodTypeInApp)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentProvisioningMethodTypeInApp;
  return [(PKPaymentProvisioningMethod *)&v3 initWithType:16];
}

- (PKPaymentProvisioningMethodTypeInApp)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentProvisioningMethodTypeInApp;
  v5 = [(PKPaymentProvisioningMethod *)&v19 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"appLaunchURLScheme"];
    v7 = [v4 PKStringForKey:@"appLaunchURLPath"];
    uint64_t v8 = [(PKPaymentProvisioningMethod *)v5 _inAppProvisioningURLWthScheme:v6 path:v7];
    appLaunchURL = v5->_appLaunchURL;
    v5->_appLaunchURL = (NSURL *)v8;

    uint64_t v10 = [v4 PKArrayContaining:objc_opt_class() forKey:@"associatedStoreIdentifiers"];
    associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
    v5->_associatedStoreIdentifiers = (NSArray *)v10;

    v12 = [v4 PKArrayContaining:objc_opt_class() forKey:@"cardTypeSupport"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__PKPaymentProvisioningMethodTypeInApp_initWithDictionary___block_invoke;
    v17[3] = &unk_1E56E3538;
    v13 = v5;
    v18 = v13;
    uint64_t v14 = objc_msgSend(v12, "pk_arrayByApplyingBlock:", v17);
    cardTypeSupport = v13->_cardTypeSupport;
    v13->_cardTypeSupport = (NSArray *)v14;
  }
  return v5;
}

uint64_t __59__PKPaymentProvisioningMethodTypeInApp_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _displayNameForCardType:a2];
}

- (void)_decorateDescription:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningMethodTypeInApp;
  id v4 = a3;
  [(PKPaymentProvisioningMethod *)&v5 _decorateDescription:v4];
  [v4 appendFormat:@"appLaunchURL: '%@'; ", self->_appLaunchURL];
  [v4 appendFormat:@"associatedStoreIdentifiers: '%@'; ", self->_associatedStoreIdentifiers];
  [v4 appendFormat:@"cardTypeSupport: '%@'; ", self->_cardTypeSupport];
}

- (PKPaymentProvisioningMethodTypeInApp)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentProvisioningMethodTypeInApp;
  objc_super v5 = [(PKPaymentProvisioningMethod *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appLaunchURL"];
    appLaunchURL = v5->_appLaunchURL;
    v5->_appLaunchURL = (NSURL *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    uint64_t v10 = (void *)[v8 initWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"associatedStoreIdentifiers"];
    associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
    v5->_associatedStoreIdentifiers = (NSArray *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v15 = (void *)[v13 initWithArray:v14];
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"cardTypeSupport"];
    cardTypeSupport = v5->_cardTypeSupport;
    v5->_cardTypeSupport = (NSArray *)v16;
  }
  return v5;
}

- (void)encodeWithCode:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningMethodTypeInApp;
  id v4 = a3;
  [(PKPaymentProvisioningMethod *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_appLaunchURL, @"appLaunchURL", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_associatedStoreIdentifiers forKey:@"associatedStoreIdentifiers"];
  [v4 encodeObject:self->_cardTypeSupport forKey:@"cardTypeSupport"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_alloc_init(PKPaymentProvisioningMethodTypeInApp);
  [(PKPaymentProvisioningMethod *)self _copyInto:v5];
  uint64_t v6 = [(NSURL *)self->_appLaunchURL copyWithZone:a3];
  appLaunchURL = v5->_appLaunchURL;
  v5->_appLaunchURL = (NSURL *)v6;

  uint64_t v8 = [(NSArray *)self->_associatedStoreIdentifiers copyWithZone:a3];
  associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
  v5->_associatedStoreIdentifiers = (NSArray *)v8;

  uint64_t v10 = [(NSArray *)self->_cardTypeSupport copyWithZone:a3];
  cardTypeSupport = v5->_cardTypeSupport;
  v5->_cardTypeSupport = (NSArray *)v10;

  return v5;
}

- (NSURL)appLaunchURL
{
  return self->_appLaunchURL;
}

- (NSArray)cardTypeSupport
{
  return self->_cardTypeSupport;
}

- (NSArray)associatedStoreIdentifiers
{
  return self->_associatedStoreIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_cardTypeSupport, 0);
  objc_storeStrong((id *)&self->_appLaunchURL, 0);
}

@end