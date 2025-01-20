@interface SESPrivacyKey
+ (BOOL)supportsSecureCoding;
+ (id)withGroupIdentifier:(id)a3 keyIdentifier:(id)a4 publicKey:(id)a5 creationDate:(id)a6;
- (NSData)publicKey;
- (NSDate)creationDate;
- (NSString)groupIdentifier;
- (NSString)keyIdentifier;
- (SESPrivacyKey)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SESPrivacyKey

+ (id)withGroupIdentifier:(id)a3 keyIdentifier:(id)a4 publicKey:(id)a5 creationDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_opt_new();
  v14 = (void *)v13[3];
  v13[3] = v9;
  id v15 = v9;

  v16 = (void *)v13[2];
  v13[2] = v10;
  id v17 = v10;

  v18 = (void *)v13[1];
  v13[1] = v11;
  id v19 = v11;

  v20 = (void *)v13[4];
  v13[4] = v12;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  groupIdentifier = self->_groupIdentifier;
  id v5 = a3;
  [v5 encodeObject:groupIdentifier forKey:@"groupIdentifier"];
  [v5 encodeObject:self->_keyIdentifier forKey:@"keyIdentifier"];
  [v5 encodeObject:self->_publicKey forKey:@"publicKey"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
}

- (SESPrivacyKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SESPrivacyKey;
  id v5 = [(SESPrivacyKey *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyIdentifier"];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v12;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"SESPrivacyKey: Group %@ Identifier %@ PublicKey %@ CreationDate %@", self->_groupIdentifier, self->_keyIdentifier, self->_publicKey, self->_creationDate];
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end