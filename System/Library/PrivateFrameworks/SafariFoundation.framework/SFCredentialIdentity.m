@interface SFCredentialIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternal;
- (NSDate)creationDate;
- (NSString)externalRecordIdentifier;
- (NSString)password;
- (NSString)serviceIdentifier;
- (NSString)site;
- (NSString)user;
- (SFCredentialIdentity)init;
- (SFCredentialIdentity)initWithCoder:(id)a3;
- (SFCredentialIdentity)initWithRowIdentifier:(int64_t)a3 serviceIdentifier:(id)a4 serviceIdentifierType:(int64_t)a5 externalRecordIdentifier:(id)a6 user:(id)a7 rank:(int64_t)a8;
- (SFCredentialIdentity)initWithRowIdentifier:(int64_t)a3 serviceIdentifier:(id)a4 serviceIdentifierType:(int64_t)a5 externalRecordIdentifier:(id)a6 user:(id)a7 rank:(int64_t)a8 owningExtensionState:(id)a9;
- (SFCredentialIdentity)initWithServiceIdentifier:(id)a3 serviceIdentifierType:(int64_t)a4 externalRecordIdentifier:(id)a5 user:(id)a6 rank:(int64_t)a7;
- (SFCredentialProviderExtensionState)owningExtensionState;
- (id)_domainWithoutWWWDot;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compareForQuickTypeBar:(id)a3;
- (int64_t)rank;
- (int64_t)rowIdentifier;
- (int64_t)serviceIdentifierType;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setOwningExtensionState:(id)a3;
- (void)setRowIdentifier:(int64_t)a3;
@end

@implementation SFCredentialIdentity

- (SFCredentialIdentity)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCredentialIdentity)initWithRowIdentifier:(int64_t)a3 serviceIdentifier:(id)a4 serviceIdentifierType:(int64_t)a5 externalRecordIdentifier:(id)a6 user:(id)a7 rank:(int64_t)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SFCredentialIdentity;
  v17 = [(SFCredentialIdentity *)&v27 init];
  v18 = v17;
  if (v17)
  {
    v17->_rowIdentifier = a3;
    uint64_t v19 = [v14 copy];
    serviceIdentifier = v18->_serviceIdentifier;
    v18->_serviceIdentifier = (NSString *)v19;

    v18->_serviceIdentifierType = a5;
    uint64_t v21 = [v15 copy];
    externalRecordIdentifier = v18->_externalRecordIdentifier;
    v18->_externalRecordIdentifier = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    user = v18->_user;
    v18->_user = (NSString *)v23;

    v18->_rank = a8;
    v25 = v18;
  }

  return v18;
}

- (SFCredentialIdentity)initWithServiceIdentifier:(id)a3 serviceIdentifierType:(int64_t)a4 externalRecordIdentifier:(id)a5 user:(id)a6 rank:(int64_t)a7
{
  return [(SFCredentialIdentity *)self initWithRowIdentifier:-1 serviceIdentifier:a3 serviceIdentifierType:a4 externalRecordIdentifier:a5 user:a6 rank:a7];
}

- (SFCredentialIdentity)initWithRowIdentifier:(int64_t)a3 serviceIdentifier:(id)a4 serviceIdentifierType:(int64_t)a5 externalRecordIdentifier:(id)a6 user:(id)a7 rank:(int64_t)a8 owningExtensionState:(id)a9
{
  id v16 = a9;
  v17 = [(SFCredentialIdentity *)self initWithRowIdentifier:a3 serviceIdentifier:a4 serviceIdentifierType:a5 externalRecordIdentifier:a6 user:a7 rank:a8];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_owningExtensionState, a9);
    uint64_t v19 = v18;
  }

  return v18;
}

- (int64_t)type
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t rowIdentifier = self->_rowIdentifier;
  id v5 = a3;
  [v5 encodeInt64:rowIdentifier forKey:@"rowIdentifier"];
  [v5 encodeObject:self->_serviceIdentifier forKey:@"serviceIdentifier"];
  [v5 encodeInt64:self->_serviceIdentifierType forKey:@"serviceIdentifierType"];
  [v5 encodeObject:self->_externalRecordIdentifier forKey:@"externalRecordIdentifier"];
  [v5 encodeObject:self->_user forKey:@"user"];
  [v5 encodeInt64:self->_rank forKey:@"rank"];
  [v5 encodeObject:self->_owningExtensionState forKey:@"owningExtensionState"];
}

- (SFCredentialIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 decodeInt64ForKey:@"rowIdentifier"];
  uint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:@"serviceIdentifier"];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = &stru_26CA7A2D0;
  }
  v10 = v9;

  unint64_t v11 = [v4 decodeInt64ForKey:@"serviceIdentifierType"];
  if (v11 >= 2) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = v11;
  }
  uint64_t v13 = [v4 decodeObjectOfClass:v5 forKey:@"externalRecordIdentifier"];
  id v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = &stru_26CA7A2D0;
  }
  id v16 = v15;

  uint64_t v17 = [v4 decodeObjectOfClass:v5 forKey:@"user"];
  v18 = (void *)v17;
  if (v17) {
    uint64_t v19 = (__CFString *)v17;
  }
  else {
    uint64_t v19 = &stru_26CA7A2D0;
  }
  v20 = v19;

  uint64_t v21 = [v4 decodeInt64ForKey:@"rank"];
  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"owningExtensionState"];

  uint64_t v23 = [(SFCredentialIdentity *)self initWithRowIdentifier:v6 serviceIdentifier:v10 serviceIdentifierType:v12 externalRecordIdentifier:v16 user:v20 rank:v21 owningExtensionState:v22];
  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3 = self->_serviceIdentifierType ^ [(NSString *)self->_serviceIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_user hash];
  return v3 ^ v4 ^ [(NSString *)self->_externalRecordIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SFCredentialIdentity *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(SFCredentialIdentity *)v5 serviceIdentifier];
      uint64_t v7 = [(SFCredentialIdentity *)v5 user];
      v8 = [(SFCredentialIdentity *)v5 externalRecordIdentifier];
      int64_t serviceIdentifierType = self->_serviceIdentifierType;
      if (serviceIdentifierType == [(SFCredentialIdentity *)v5 serviceIdentifierType]
        && ((serviceIdentifier = self->_serviceIdentifier, serviceIdentifier == v6)
         || [(NSString *)serviceIdentifier isEqualToString:v6])
        && ((user = self->_user, user == v7) || [(NSString *)user isEqualToString:v7]))
      {
        externalRecordIdentifier = self->_externalRecordIdentifier;
        if (externalRecordIdentifier == v8) {
          char v13 = 1;
        }
        else {
          char v13 = [(NSString *)externalRecordIdentifier isEqualToString:v8];
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (id)_domainWithoutWWWDot
{
  domainWithoutWWWDot = self->_domainWithoutWWWDot;
  if (!domainWithoutWWWDot)
  {
    int64_t serviceIdentifierType = self->_serviceIdentifierType;
    if (serviceIdentifierType == 1)
    {
      uint64_t v6 = [MEMORY[0x263F08BA0] componentsWithString:self->_serviceIdentifier];
      uint64_t v7 = [v6 host];
      objc_msgSend(v7, "safari_stringByRemovingWwwDotPrefix");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = self->_domainWithoutWWWDot;
      self->_domainWithoutWWWDot = v8;
    }
    else
    {
      if (serviceIdentifierType)
      {
LABEL_7:
        domainWithoutWWWDot = self->_domainWithoutWWWDot;
        goto LABEL_8;
      }
      uint64_t v5 = [(NSString *)self->_serviceIdentifier safari_stringByRemovingWwwDotPrefix];
      uint64_t v6 = self->_domainWithoutWWWDot;
      self->_domainWithoutWWWDot = v5;
    }

    goto LABEL_7;
  }
LABEL_8:
  v10 = domainWithoutWWWDot;
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t rowIdentifier = self->_rowIdentifier;
  int64_t serviceIdentifierType = self->_serviceIdentifierType;
  serviceIdentifier = self->_serviceIdentifier;
  externalRecordIdentifier = self->_externalRecordIdentifier;
  user = self->_user;
  int64_t rank = self->_rank;
  return (id)[v4 initWithRowIdentifier:rowIdentifier serviceIdentifier:serviceIdentifier serviceIdentifierType:serviceIdentifierType externalRecordIdentifier:externalRecordIdentifier user:user rank:rank];
}

- (int64_t)compareForQuickTypeBar:(id)a3
{
  id v4 = a3;
  if (-[SFCredentialIdentity type](self, "type") == 2 && [v4 type] != 2)
  {
    int64_t v5 = -1;
  }
  else if (-[SFCredentialIdentity type](self, "type") == 2 || [v4 type] != 2)
  {
    int64_t serviceIdentifierType = self->_serviceIdentifierType;
    if (serviceIdentifierType == [v4 serviceIdentifierType])
    {
      uint64_t v7 = [(SFCredentialIdentity *)self _domainWithoutWWWDot];
      v8 = [v4 _domainWithoutWWWDot];
      char v9 = objc_msgSend(v7, "safari_isCaseInsensitiveEqualToString:", v8);

      if (v9) {
        goto LABEL_12;
      }
    }
    v10 = [(SFCredentialIdentity *)self _domainWithoutWWWDot];
    unint64_t v11 = objc_msgSend(v10, "safari_countOfString:", @".");

    unint64_t v12 = [v4 _domainWithoutWWWDot];
    unint64_t v13 = objc_msgSend(v12, "safari_countOfString:", @".");

    int64_t v5 = v11 < v13 ? -1 : 1;
    if (v11 == v13)
    {
LABEL_12:
      uint64_t v14 = [v4 rank];
      int64_t rank = self->_rank;
      BOOL v16 = rank == v14;
      BOOL v17 = rank <= v14;
      uint64_t v18 = -1;
      if (v17) {
        uint64_t v18 = 1;
      }
      if (v16) {
        int64_t v5 = 0;
      }
      else {
        int64_t v5 = v18;
      }
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (NSString)site
{
  if ([(SFCredentialIdentity *)self serviceIdentifierType] == 1)
  {
    NSUInteger v3 = (void *)MEMORY[0x263F08BA0];
    id v4 = [(SFCredentialIdentity *)self serviceIdentifier];
    int64_t v5 = [v3 componentsWithString:v4];
    uint64_t v6 = [v5 host];
  }
  else
  {
    uint64_t v6 = [(SFCredentialIdentity *)self serviceIdentifier];
  }
  return (NSString *)v6;
}

- (NSString)password
{
  return 0;
}

- (NSDate)creationDate
{
  return (NSDate *)[MEMORY[0x263EFF910] distantPast];
}

- (BOOL)isExternal
{
  return 1;
}

- (int64_t)rowIdentifier
{
  return self->_rowIdentifier;
}

- (void)setRowIdentifier:(int64_t)a3
{
  self->_int64_t rowIdentifier = a3;
}

- (int64_t)serviceIdentifierType
{
  return self->_serviceIdentifierType;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)externalRecordIdentifier
{
  return self->_externalRecordIdentifier;
}

- (NSString)user
{
  return self->_user;
}

- (int64_t)rank
{
  return self->_rank;
}

- (SFCredentialProviderExtensionState)owningExtensionState
{
  return self->_owningExtensionState;
}

- (void)setOwningExtensionState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningExtensionState, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_externalRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_domainWithoutWWWDot, 0);
}

@end