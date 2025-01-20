@interface PKLongTermPrivacyKey
- (NSData)publicKey;
- (NSDate)creationDate;
- (NSString)groupIdentifier;
- (NSString)keyIdentifier;
- (PKLongTermPrivacyKey)initWithSESPrivacyKey:(id)a3;
- (id)description;
- (void)setCreationDate:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setKeyIdentifier:(id)a3;
- (void)setPublicKey:(id)a3;
@end

@implementation PKLongTermPrivacyKey

- (PKLongTermPrivacyKey)initWithSESPrivacyKey:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKLongTermPrivacyKey;
  v5 = [(PKLongTermPrivacyKey *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 keyIdentifier];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 publicKey];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v8;

    uint64_t v10 = [v4 creationDate];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    uint64_t v12 = [v4 groupIdentifier];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"keyIdentifier: '%@'; ", self->_keyIdentifier];
  [v3 appendFormat:@"publicKey: '%@'; ", self->_publicKey];
  [v3 appendFormat:@"creationDate: '%@'; ", self->_creationDate];
  [v3 appendFormat:@"groupIdentifier: '%@'; ", self->_groupIdentifier];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end