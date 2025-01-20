@interface PKAppletSubcredentialSharingConfirguration
+ (BOOL)supportsSecureCoding;
- (BOOL)sharingRequiresPassword;
- (PKAppletSubcredentialSharingConfirguration)initWithCoder:(id)a3;
- (PKAppletSubcredentialSharingConfirguration)initWithDictionary:(id)a3;
- (PKPassShareActivationOptions)activationOptions;
- (id)asDictionary;
- (id)description;
- (unint64_t)maxNumberOfSharedCredentials;
- (unint64_t)numberOfShareableCredentials;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationOptions:(id)a3;
- (void)setMaxNumberOfSharedCredentials:(unint64_t)a3;
- (void)setNumberOfShareableCredentials:(unint64_t)a3;
- (void)setSharingRequiresPassword:(BOOL)a3;
@end

@implementation PKAppletSubcredentialSharingConfirguration

- (PKAppletSubcredentialSharingConfirguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(PKAppletSubcredentialSharingConfirguration *)self init];
  if (!v5) {
    goto LABEL_7;
  }
  v6 = [v4 objectForKey:@"maxNumberOfSharedCredentials"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Received invalid credential entitlement dictionary - maxNumberOfSharedCredentials", buf, 2u);
    }
    goto LABEL_13;
  }
  v5->_maxNumberOfSharedCredentials = [v6 unsignedIntegerValue];
  v7 = [v4 objectForKey:@"numberOfShareableCredentials"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Received invalid credential entitlement dictionary - numberOfShareableCredentials", v16, 2u);
    }

LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  v5->_numberOfShareableCredentials = [v7 unsignedIntegerValue];
  v5->_sharingRequiresPassword = [v4 PKBoolForKey:@"sharingRequiresPassword"];
  v8 = [v4 PKArrayContaining:objc_opt_class() forKey:@"shareActivationOptions"];
  v9 = [[PKPassShareActivationOptions alloc] initWithCarKeyIdentifiers:v8];
  activationOptions = v5->_activationOptions;
  v5->_activationOptions = v9;

  uint64_t v11 = [v4 PKArrayForKey:@"entitlements"];
  entitlements = v5->_entitlements;
  v5->_entitlements = (NSArray *)v11;

LABEL_7:
  v13 = v5;
LABEL_14:

  return v13;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [NSNumber numberWithUnsignedInteger:self->_maxNumberOfSharedCredentials];
  [v3 setObject:v4 forKeyedSubscript:@"maxNumberOfSharedCredentials"];

  v5 = [NSNumber numberWithUnsignedInteger:self->_numberOfShareableCredentials];
  [v3 setObject:v5 forKeyedSubscript:@"numberOfShareableCredentials"];

  v6 = [NSNumber numberWithBool:self->_sharingRequiresPassword];
  [v3 setObject:v6 forKeyedSubscript:@"sharingRequiresPassword"];

  v7 = [(PKPassShareActivationOptions *)self->_activationOptions identifiers];
  [v3 setObject:v7 forKeyedSubscript:@"shareActivationOptions"];

  [v3 setObject:self->_entitlements forKeyedSubscript:@"entitlements"];
  v8 = (void *)[v3 copy];

  return v8;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  objc_msgSend(v6, "appendFormat:", @"shareableCredentials: '%ld' (%ld); ",
    self->_numberOfShareableCredentials,
    self->_maxNumberOfSharedCredentials);
  if (self->_sharingRequiresPassword) {
    v7 = @"Yes";
  }
  else {
    v7 = @"No";
  }
  [v6 appendFormat:@"sharingRequiresPassword: '%@'; ", v7];
  [v6 appendFormat:@"activationOptions: '%@'; ", self->_activationOptions];
  [v6 appendFormat:@">"];
  v8 = [NSString stringWithString:v6];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t maxNumberOfSharedCredentials = self->_maxNumberOfSharedCredentials;
  id v5 = a3;
  [v5 encodeInteger:maxNumberOfSharedCredentials forKey:@"maxNumberOfSharedCredentials"];
  [v5 encodeInteger:self->_numberOfShareableCredentials forKey:@"numberOfShareableCredentials"];
  [v5 encodeInteger:self->_sharingRequiresPassword forKey:@"sharingRequiresPassword"];
  [v5 encodeObject:self->_activationOptions forKey:@"shareActivationOptions"];
  [v5 encodeObject:self->_entitlements forKey:@"entitlements"];
}

- (PKAppletSubcredentialSharingConfirguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAppletSubcredentialSharingConfirguration *)self init];
  if (v5)
  {
    v5->_unint64_t maxNumberOfSharedCredentials = [v4 decodeIntegerForKey:@"maxNumberOfSharedCredentials"];
    v5->_numberOfShareableCredentials = [v4 decodeIntegerForKey:@"numberOfShareableCredentials"];
    v5->_sharingRequiresPassword = [v4 decodeIntegerForKey:@"sharingRequiresPassword"] != 0;
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareActivationOptions"];
    activationOptions = v5->_activationOptions;
    v5->_activationOptions = (PKPassShareActivationOptions *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"entitlements"];
    entitlements = v5->_entitlements;
    v5->_entitlements = (NSArray *)v13;
  }
  return v5;
}

- (unint64_t)maxNumberOfSharedCredentials
{
  return self->_maxNumberOfSharedCredentials;
}

- (void)setMaxNumberOfSharedCredentials:(unint64_t)a3
{
  self->_unint64_t maxNumberOfSharedCredentials = a3;
}

- (unint64_t)numberOfShareableCredentials
{
  return self->_numberOfShareableCredentials;
}

- (void)setNumberOfShareableCredentials:(unint64_t)a3
{
  self->_numberOfShareableCredentials = a3;
}

- (BOOL)sharingRequiresPassword
{
  return self->_sharingRequiresPassword;
}

- (void)setSharingRequiresPassword:(BOOL)a3
{
  self->_sharingRequiresPassword = a3;
}

- (PKPassShareActivationOptions)activationOptions
{
  return self->_activationOptions;
}

- (void)setActivationOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationOptions, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
}

@end