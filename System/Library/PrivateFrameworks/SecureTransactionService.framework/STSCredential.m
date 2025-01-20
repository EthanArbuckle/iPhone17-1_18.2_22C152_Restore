@interface STSCredential
+ (BOOL)supportsSecureCoding;
+ (STSCredential)credentialWithType:(unsigned __int8)a3 identifier:(id)a4 subIdentifier:(id)a5;
+ (id)unifiedAccessCredentialWithAID:(id)a3 publicKeyIdentifier:(id)a4;
+ (id)unifiedAccessCredentialWithAIDs:(id)a3 primaryPublicKeyIdentifier:(id)a4 secondaryAid:(id)a5 secondaryPublicKeyIdentifier:(id)a6;
- (NSString)identifier;
- (NSString)secondaryIdentifier;
- (NSString)secondarySubIdentifier;
- (NSString)subIdentifier;
- (STSCredential)initWithCoder:(id)a3;
- (STSCredential)initWithType:(unsigned __int8)a3 identifier:(id)a4 subIdentifier:(id)a5;
- (STSCredential)initWithType:(unsigned __int8)a3 identifier:(id)a4 subIdentifier:(id)a5 secondaryIdentifier:(id)a6 secondarySubIdentifier:(id)a7;
- (id)description;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSCredential

+ (STSCredential)credentialWithType:(unsigned __int8)a3 identifier:(id)a4 subIdentifier:(id)a5
{
  uint64_t v6 = a3;
  id v7 = a5;
  id v8 = a4;
  v9 = [[STSCredential alloc] initWithType:v6 identifier:v8 subIdentifier:v7];

  return v9;
}

+ (id)unifiedAccessCredentialWithAID:(id)a3 publicKeyIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[STSCredential alloc] initWithType:3 identifier:v6 subIdentifier:v5];

  return v7;
}

+ (id)unifiedAccessCredentialWithAIDs:(id)a3 primaryPublicKeyIdentifier:(id)a4 secondaryAid:(id)a5 secondaryPublicKeyIdentifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[STSCredential alloc] initWithType:3 identifier:v12 subIdentifier:v11 secondaryIdentifier:v10 secondarySubIdentifier:v9];

  return v13;
}

- (STSCredential)initWithType:(unsigned __int8)a3 identifier:(id)a4 subIdentifier:(id)a5 secondaryIdentifier:(id)a6 secondarySubIdentifier:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)STSCredential;
  v17 = [(STSCredential *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_type = a3;
    objc_storeStrong((id *)&v17->_identifier, a4);
    objc_storeStrong((id *)&v18->_subIdentifier, a5);
    objc_storeStrong((id *)&v18->_secondaryIdentifier, a6);
    objc_storeStrong((id *)&v18->_secondarySubIdentifier, a7);
  }

  return v18;
}

- (STSCredential)initWithType:(unsigned __int8)a3 identifier:(id)a4 subIdentifier:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [[STSCredential alloc] initWithType:v6 identifier:v9 subIdentifier:v8 secondaryIdentifier:0 secondarySubIdentifier:0];

  return v10;
}

- (STSCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STSCredential;
  id v5 = [(STSCredential *)&v15 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntForKey:@"STSCredentialType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSCredentialIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSCredentialSubIdentifier"];
    subIdentifier = v5->_subIdentifier;
    v5->_subIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSCredentialSecondaryIdentifier"];
    secondaryIdentifier = v5->_secondaryIdentifier;
    v5->_secondaryIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"STSCredentialSecondarySubIdentifier"];
    secondarySubIdentifier = v5->_secondarySubIdentifier;
    v5->_secondarySubIdentifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt:type forKey:@"STSCredentialType"];
  [v5 encodeObject:self->_identifier forKey:@"STSCredentialIdentifier"];
  [v5 encodeObject:self->_subIdentifier forKey:@"STSCredentialSubIdentifier"];
  [v5 encodeObject:self->_secondaryIdentifier forKey:@"STSCredentialSecondaryIdentifier"];
  [v5 encodeObject:self->_secondarySubIdentifier forKey:@"STSCredentialSecondarySubIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  unint64_t type = (char)self->_type;
  if (type > 5) {
    v3 = @"Unknown";
  }
  else {
    v3 = off_264594CA8[type];
  }
  subIdentifier = self->_subIdentifier;
  if (self->_secondaryIdentifier) {
    [NSString stringWithFormat:@"Credential { Type=%@ primary identifier=%@ primary subIdentifier=%@ secondary Identifier=%@, secondary subIdentifier = %@}", v3, self->_identifier, subIdentifier, self->_secondaryIdentifier, self->_secondarySubIdentifier];
  }
  else {
  id v5 = [NSString stringWithFormat:@"Credential { Type=%@ identifier=%@ subIdentifier=%@}", v3, self->_identifier, subIdentifier, v7, v8];
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)subIdentifier
{
  return self->_subIdentifier;
}

- (NSString)secondaryIdentifier
{
  return self->_secondaryIdentifier;
}

- (NSString)secondarySubIdentifier
{
  return self->_secondarySubIdentifier;
}

- (unsigned)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySubIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_subIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end