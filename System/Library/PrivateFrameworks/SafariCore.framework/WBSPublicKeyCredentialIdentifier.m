@interface WBSPublicKeyCredentialIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)credentialID;
- (NSString)groupID;
- (WBSPublicKeyCredentialIdentifier)initWithCoder:(id)a3;
- (WBSPublicKeyCredentialIdentifier)initWithCredentialID:(id)a3 groupID:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSPublicKeyCredentialIdentifier

- (WBSPublicKeyCredentialIdentifier)initWithCredentialID:(id)a3 groupID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSPublicKeyCredentialIdentifier;
  v8 = [(WBSPublicKeyCredentialIdentifier *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    credentialID = v8->_credentialID;
    v8->_credentialID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    groupID = v8->_groupID;
    v8->_groupID = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@, %@>", self->_credentialID, self->_groupID];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSPublicKeyCredentialIdentifier *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      groupID = self->_groupID;
      id v7 = [(WBSPublicKeyCredentialIdentifier *)v5 groupID];
      LODWORD(groupID) = WBSIsEqual(groupID, v7);

      if (groupID)
      {
        credentialID = self->_credentialID;
        uint64_t v9 = [(WBSPublicKeyCredentialIdentifier *)v5 credentialID];
        char v10 = WBSIsEqual(credentialID, v9);
      }
      else
      {
        char v10 = 0;
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
  NSUInteger v3 = [(NSString *)self->_credentialID hash];
  return [(NSString *)self->_groupID hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSPublicKeyCredentialIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];

  id v7 = [(WBSPublicKeyCredentialIdentifier *)self initWithCredentialID:v5 groupID:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  credentialID = self->_credentialID;
  id v5 = a3;
  [v5 encodeObject:credentialID forKey:@"credentialID"];
  [v5 encodeObject:self->_groupID forKey:@"groupID"];
}

- (NSString)credentialID
{
  return self->_credentialID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end