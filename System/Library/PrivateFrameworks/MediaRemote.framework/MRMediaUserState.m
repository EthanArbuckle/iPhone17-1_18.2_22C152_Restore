@interface MRMediaUserState
+ (BOOL)supportsSecureCoding;
- (BOOL)groupSessionsSupportedForAccountRegion;
- (BOOL)hasAcceptedDisplayNameAcknowledgement;
- (BOOL)hasAcceptedPrivacyAcknowledgement;
- (BOOL)identitySupportsCollaboration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFullSubscriber;
- (BOOL)isMinor;
- (MRMediaUserState)initWithCoder:(id)a3;
- (MRUserIdentity)userIdentity;
- (NSString)identifier;
- (NSString)storefrontCountryCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupSessionsSupportedForAccountRegion:(BOOL)a3;
- (void)setHasAcceptedDisplayNameAcknowledgement:(BOOL)a3;
- (void)setHasAcceptedPrivacyAcknowledgement:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentitySupportsCollaboration:(BOOL)a3;
- (void)setIsFullSubscriber:(BOOL)a3;
- (void)setIsMinor:(BOOL)a3;
- (void)setStorefrontCountryCode:(id)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation MRMediaUserState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRMediaUserState)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRMediaUserState;
  v5 = [(MRMediaUserState *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_isMinor = [v4 decodeBoolForKey:@"min"];
    v5->_isFullSubscriber = [v4 decodeBoolForKey:@"sub"];
    v5->_hasAcceptedPrivacyAcknowledgement = [v4 decodeBoolForKey:@"prv"];
    v5->_hasAcceptedDisplayNameAcknowledgement = [v4 decodeBoolForKey:@"dsn"];
    v5->_identitySupportsCollaboration = [v4 decodeBoolForKey:@"col"];
    v5->_groupSessionsSupportedForAccountRegion = [v4 decodeBoolForKey:@"srg"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stf"];
    storefrontCountryCode = v5->_storefrontCountryCode;
    v5->_storefrontCountryCode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usr"];
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (MRUserIdentity *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MRMediaUserState *)self identifier];
  [v4 encodeObject:v5 forKey:@"id"];

  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState isMinor](self, "isMinor"), @"min");
  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState isFullSubscriber](self, "isFullSubscriber"), @"sub");
  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState hasAcceptedPrivacyAcknowledgement](self, "hasAcceptedPrivacyAcknowledgement"), @"prv");
  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState hasAcceptedDisplayNameAcknowledgement](self, "hasAcceptedDisplayNameAcknowledgement"), @"dsn");
  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState identitySupportsCollaboration](self, "identitySupportsCollaboration"), @"col");
  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState groupSessionsSupportedForAccountRegion](self, "groupSessionsSupportedForAccountRegion"), @"srg");
  uint64_t v6 = [(MRMediaUserState *)self storefrontCountryCode];
  [v4 encodeObject:v6 forKey:@"stf"];

  id v7 = [(MRMediaUserState *)self userIdentity];
  [v4 encodeObject:v7 forKey:@"usr"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MRMediaUserState);
  v5 = [(MRMediaUserState *)self identifier];
  [(MRMediaUserState *)v4 setIdentifier:v5];

  [(MRMediaUserState *)v4 setIsMinor:[(MRMediaUserState *)self isMinor]];
  [(MRMediaUserState *)v4 setIsFullSubscriber:[(MRMediaUserState *)self isFullSubscriber]];
  [(MRMediaUserState *)v4 setHasAcceptedPrivacyAcknowledgement:[(MRMediaUserState *)self hasAcceptedPrivacyAcknowledgement]];
  [(MRMediaUserState *)v4 setHasAcceptedDisplayNameAcknowledgement:[(MRMediaUserState *)self hasAcceptedDisplayNameAcknowledgement]];
  [(MRMediaUserState *)v4 setIdentitySupportsCollaboration:[(MRMediaUserState *)self identitySupportsCollaboration]];
  [(MRMediaUserState *)v4 setGroupSessionsSupportedForAccountRegion:[(MRMediaUserState *)self groupSessionsSupportedForAccountRegion]];
  uint64_t v6 = [(MRMediaUserState *)self storefrontCountryCode];
  [(MRMediaUserState *)v4 setStorefrontCountryCode:v6];

  id v7 = [(MRMediaUserState *)self userIdentity];
  [(MRMediaUserState *)v4 setUserIdentity:v7];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRMediaUserState *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      char v10 = 1;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      id v7 = [(MRMediaUserState *)self identifier];
      id v8 = [(MRMediaUserState *)v6 identifier];
      if (v7 == v8)
      {
      }
      else
      {
        int v9 = [v7 isEqual:v8];

        if (!v9)
        {
LABEL_16:
          char v10 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      BOOL v11 = [(MRMediaUserState *)self isMinor];
      if (v11 != [(MRMediaUserState *)v6 isMinor]) {
        goto LABEL_16;
      }
      BOOL v12 = [(MRMediaUserState *)self isFullSubscriber];
      if (v12 != [(MRMediaUserState *)v6 isFullSubscriber]) {
        goto LABEL_16;
      }
      BOOL v13 = [(MRMediaUserState *)self hasAcceptedPrivacyAcknowledgement];
      if (v13 != [(MRMediaUserState *)v6 hasAcceptedPrivacyAcknowledgement]) {
        goto LABEL_16;
      }
      BOOL v14 = [(MRMediaUserState *)self hasAcceptedDisplayNameAcknowledgement];
      if (v14 != [(MRMediaUserState *)v6 hasAcceptedDisplayNameAcknowledgement]) {
        goto LABEL_16;
      }
      BOOL v15 = [(MRMediaUserState *)self identitySupportsCollaboration];
      if (v15 != [(MRMediaUserState *)v6 identitySupportsCollaboration]) {
        goto LABEL_16;
      }
      BOOL v16 = [(MRMediaUserState *)self groupSessionsSupportedForAccountRegion];
      if (v16 != [(MRMediaUserState *)v6 groupSessionsSupportedForAccountRegion])goto LABEL_16; {
      id v18 = [(MRMediaUserState *)self storefrontCountryCode];
      }
      id v19 = [(MRMediaUserState *)v6 storefrontCountryCode];
      if (v18 == v19)
      {
      }
      else
      {
        int v20 = [v18 isEqual:v19];

        if (!v20)
        {
          char v10 = 0;
LABEL_27:

          goto LABEL_17;
        }
      }
      v21 = [(MRMediaUserState *)self userIdentity];
      v22 = [(MRMediaUserState *)v6 userIdentity];
      if (v21 == v22) {
        char v10 = 1;
      }
      else {
        char v10 = [v21 isEqual:v22];
      }

      goto LABEL_27;
    }
  }
  char v10 = 0;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(MRMediaUserState *)self identifier];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 ^ [(MRMediaUserState *)self isMinor];
  uint64_t v6 = [(MRMediaUserState *)self isFullSubscriber];
  uint64_t v7 = v5 ^ v6 ^ [(MRMediaUserState *)self hasAcceptedPrivacyAcknowledgement];
  uint64_t v8 = [(MRMediaUserState *)self hasAcceptedDisplayNameAcknowledgement];
  uint64_t v9 = v8 ^ [(MRMediaUserState *)self identitySupportsCollaboration];
  uint64_t v10 = v7 ^ v9 ^ [(MRMediaUserState *)self groupSessionsSupportedForAccountRegion];
  BOOL v11 = [(MRMediaUserState *)self storefrontCountryCode];
  uint64_t v12 = [v11 hash];
  BOOL v13 = [(MRMediaUserState *)self userIdentity];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: ", v5];

  uint64_t v7 = [(MRMediaUserState *)self identifier];
  [v6 appendFormat:@"id=%@", v7];

  [v6 appendFormat:@", min=%d", -[MRMediaUserState isMinor](self, "isMinor")];
  [v6 appendFormat:@", fullSub=%d", -[MRMediaUserState isFullSubscriber](self, "isFullSubscriber")];
  [v6 appendFormat:@", privacyAck=%d", -[MRMediaUserState hasAcceptedPrivacyAcknowledgement](self, "hasAcceptedPrivacyAcknowledgement")];
  [v6 appendFormat:@", displayNameAck=%d", -[MRMediaUserState hasAcceptedDisplayNameAcknowledgement](self, "hasAcceptedDisplayNameAcknowledgement")];
  [v6 appendFormat:@", supportsCollab=%d", -[MRMediaUserState identitySupportsCollaboration](self, "identitySupportsCollaboration")];
  [v6 appendFormat:@", supportedRegion=%d", -[MRMediaUserState groupSessionsSupportedForAccountRegion](self, "groupSessionsSupportedForAccountRegion")];
  uint64_t v8 = [(MRMediaUserState *)self storefrontCountryCode];
  [v6 appendFormat:@", storefront=%@", v8];

  uint64_t v9 = [(MRMediaUserState *)self userIdentity];
  [v6 appendFormat:@", userIdentity=%@", v9];

  [v6 appendString:@">"];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isMinor
{
  return self->_isMinor;
}

- (void)setIsMinor:(BOOL)a3
{
  self->_isMinor = a3;
}

- (BOOL)isFullSubscriber
{
  return self->_isFullSubscriber;
}

- (void)setIsFullSubscriber:(BOOL)a3
{
  self->_isFullSubscriber = a3;
}

- (BOOL)hasAcceptedPrivacyAcknowledgement
{
  return self->_hasAcceptedPrivacyAcknowledgement;
}

- (void)setHasAcceptedPrivacyAcknowledgement:(BOOL)a3
{
  self->_hasAcceptedPrivacyAcknowledgement = a3;
}

- (BOOL)hasAcceptedDisplayNameAcknowledgement
{
  return self->_hasAcceptedDisplayNameAcknowledgement;
}

- (void)setHasAcceptedDisplayNameAcknowledgement:(BOOL)a3
{
  self->_hasAcceptedDisplayNameAcknowledgement = a3;
}

- (BOOL)identitySupportsCollaboration
{
  return self->_identitySupportsCollaboration;
}

- (void)setIdentitySupportsCollaboration:(BOOL)a3
{
  self->_identitySupportsCollaboration = a3;
}

- (BOOL)groupSessionsSupportedForAccountRegion
{
  return self->_groupSessionsSupportedForAccountRegion;
}

- (void)setGroupSessionsSupportedForAccountRegion:(BOOL)a3
{
  self->_groupSessionsSupportedForAccountRegion = a3;
}

- (NSString)storefrontCountryCode
{
  return self->_storefrontCountryCode;
}

- (void)setStorefrontCountryCode:(id)a3
{
}

- (MRUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void)setUserIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end