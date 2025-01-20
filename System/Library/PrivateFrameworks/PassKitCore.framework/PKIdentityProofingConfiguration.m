@interface PKIdentityProofingConfiguration
+ (BOOL)supportsSecureCoding;
- (NSString)accountKeyIdentifier;
- (NSString)country;
- (NSString)credentialIdentifier;
- (NSString)productIdentifier;
- (NSString)state;
- (NSURL)learnMoreURL;
- (PKIdentityProofingConfiguration)init;
- (PKIdentityProofingConfiguration)initWithCIDVUIProofingConfiguration:(id)a3;
- (PKIdentityProofingConfiguration)initWithCoder:(id)a3;
- (PKIdentityProofingConfiguration)initWithDictionary:(id)a3;
- (PKIdentityProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 credentialIdentifier:(id)a6 status:(int64_t)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10;
- (PKIdentityProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 credentialIdentifier:(id)a6 status:(int64_t)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10 learnMoreURL:(id)a11;
- (id)_mutableDictionaryRepresentation;
- (id)dictionaryRepresentation;
- (int64_t)idType;
- (int64_t)status;
- (int64_t)target;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountKeyIdentifier:(id)a3;
- (void)setCountry:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setIdType:(int64_t)a3;
- (void)setLearnMoreURL:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setState:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTarget:(int64_t)a3;
@end

@implementation PKIdentityProofingConfiguration

- (PKIdentityProofingConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKIdentityProofingConfiguration;
  return [(PKIdentityProofingConfiguration *)&v3 init];
}

- (PKIdentityProofingConfiguration)initWithCIDVUIProofingConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [v3 state];
  v5 = [v3 country];
  uint64_t v6 = [v3 target];
  v7 = [v3 credentialIdentifier];
  unint64_t v8 = [v3 status];
  if (v8 > 0xC) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = qword_191673B70[v8];
  }
  if (v6 == 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2 * (v6 == 2);
  }
  v11 = [v3 productIdentifier];
  v12 = [v3 accountKeyIdentifier];
  BOOL v13 = [v3 idType] == 0;
  v14 = [v3 extendedReviewURL];
  v15 = [(PKIdentityProofingConfiguration *)self initWithState:v4 country:v5 target:v10 credentialIdentifier:v7 status:v9 productIdentifier:v11 accountKeyIdentifier:v12 idType:v13 learnMoreURL:v14];

  return v15;
}

- (PKIdentityProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 credentialIdentifier:(id)a6 status:(int64_t)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10
{
  return [(PKIdentityProofingConfiguration *)self initWithState:a3 country:a4 target:a5 credentialIdentifier:a6 status:a7 productIdentifier:a8 accountKeyIdentifier:a9 idType:a10 learnMoreURL:0];
}

- (PKIdentityProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 credentialIdentifier:(id)a6 status:(int64_t)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10 learnMoreURL:(id)a11
{
  id v16 = a3;
  id v26 = a4;
  id v25 = a6;
  id v24 = a8;
  id v17 = a9;
  id v18 = a11;
  v19 = [(PKIdentityProofingConfiguration *)self init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_state, a3);
    objc_storeStrong((id *)&v20->_country, a4);
    v20->_target = a5;
    objc_storeStrong((id *)&v20->_credentialIdentifier, a6);
    v20->_status = a7;
    objc_storeStrong((id *)&v20->_productIdentifier, a8);
    objc_storeStrong((id *)&v20->_accountKeyIdentifier, a9);
    v20->_idType = a10;
    objc_storeStrong((id *)&v20->_learnMoreURL, a11);
  }

  return v20;
}

- (PKIdentityProofingConfiguration)initWithDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v18 = [v4 PKStringForKey:@"state"];
    v5 = [v4 PKStringForKey:@"country"];
    uint64_t v6 = [v4 PKStringForKey:@"target"];
    uint64_t v7 = PKIdentityProofingConfigurationTargetDeviceTypeFromString(v6);

    unint64_t v8 = [v4 PKStringForKey:@"credentialIdentifier"];
    uint64_t v9 = [v4 PKStringForKey:@"status"];
    uint64_t v10 = PKIdentityProofingStatusFromString(v9);

    v11 = [v4 PKStringForKey:@"productIdentifier"];
    v12 = [v4 PKStringForKey:@"accountKeyIdentifier"];
    BOOL v13 = [v4 PKStringForKey:@"idType"];
    uint64_t v14 = PKSecureElementIdentityPassTypeFromString(v13);

    v15 = [v4 PKURLForKey:@"learnMoreURL"];

    self = [(PKIdentityProofingConfiguration *)self initWithState:v18 country:v5 target:v7 credentialIdentifier:v8 status:v10 productIdentifier:v11 accountKeyIdentifier:v12 idType:v14 learnMoreURL:v15];
    id v16 = self;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  state = self->_state;
  id v10 = a3;
  [v10 encodeObject:state forKey:@"state"];
  [v10 encodeObject:self->_country forKey:@"country"];
  int64_t target = self->_target;
  uint64_t v6 = @"phone";
  if (target != 1) {
    uint64_t v6 = 0;
  }
  if (target == 2) {
    uint64_t v7 = @"watch";
  }
  else {
    uint64_t v7 = v6;
  }
  [v10 encodeObject:v7 forKey:@"target"];
  [v10 encodeObject:self->_credentialIdentifier forKey:@"credentialIdentifier"];
  unint64_t v8 = PKIdentityProofingStatusToString(self->_status);
  [v10 encodeObject:v8 forKey:@"status"];

  [v10 encodeObject:self->_productIdentifier forKey:@"productIdentifier"];
  [v10 encodeObject:self->_accountKeyIdentifier forKey:@"accountKeyIdentifier"];
  uint64_t v9 = PKSecureElementIdentityPassTypeToString(self->_idType);
  [v10 encodeObject:v9 forKey:@"idType"];

  [v10 encodeObject:self->_learnMoreURL forKey:@"learnMoreURL"];
}

- (PKIdentityProofingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKIdentityProofingConfiguration;
  v5 = [(PKIdentityProofingConfiguration *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    state = v5->_state;
    v5->_state = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"country"];
    country = v5->_country;
    v5->_country = (NSString *)v8;

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"target"];
    v5->_int64_t target = PKIdentityProofingConfigurationTargetDeviceTypeFromString(v10);

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentifier"];
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v11;

    BOOL v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    v5->_status = PKIdentityProofingStatusFromString(v13);

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productIdentifier"];
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountKeyIdentifier"];
    accountKeyIdentifier = v5->_accountKeyIdentifier;
    v5->_accountKeyIdentifier = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idType"];
    v5->_idType = PKSecureElementIdentityPassTypeFromString(v18);

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"learnMoreURL"];
    learnMoreURL = v5->_learnMoreURL;
    v5->_learnMoreURL = (NSURL *)v19;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v2 = [(PKIdentityProofingConfiguration *)self _mutableDictionaryRepresentation];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)_mutableDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_state forKeyedSubscript:@"state"];
  [v3 setObject:self->_country forKeyedSubscript:@"country"];
  int64_t target = self->_target;
  v5 = @"phone";
  if (target != 1) {
    v5 = 0;
  }
  if (target == 2) {
    uint64_t v6 = @"watch";
  }
  else {
    uint64_t v6 = v5;
  }
  [v3 setObject:v6 forKeyedSubscript:@"target"];
  [v3 setObject:self->_credentialIdentifier forKeyedSubscript:@"credentialIdentifier"];
  uint64_t v7 = PKIdentityProofingStatusToString(self->_status);
  [v3 setObject:v7 forKeyedSubscript:@"status"];

  [v3 setObject:self->_productIdentifier forKeyedSubscript:@"productIdentifier"];
  [v3 setObject:self->_accountKeyIdentifier forKeyedSubscript:@"accountKeyIdentifier"];
  uint64_t v8 = PKSecureElementIdentityPassTypeToString(self->_idType);
  [v3 setObject:v8 forKeyedSubscript:@"idType"];

  uint64_t v9 = [(NSURL *)self->_learnMoreURL absoluteString];
  [v3 setObject:v9 forKeyedSubscript:@"learnMoreURL"];

  return v3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (int64_t)target
{
  return self->_target;
}

- (void)setTarget:(int64_t)a3
{
  self->_int64_t target = a3;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSString)accountKeyIdentifier
{
  return self->_accountKeyIdentifier;
}

- (void)setAccountKeyIdentifier:(id)a3
{
}

- (int64_t)idType
{
  return self->_idType;
}

- (void)setIdType:(int64_t)a3
{
  self->_idType = a3;
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_accountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end