@interface TCCDCodeIdentity
+ (id)shortStringForAuthority:(int64_t)a3;
- (NSData)verifierData;
- (NSString)verifierDescription;
- (TCCDAccessIdentity)accessIdentity;
- (TCCDCodeIdentity)initWithAccessIdentity:(id)a3;
- (TCCDCodeIdentity)initWithIdentifier:(id)a3 authority:(int64_t)a4 displayNamePolicyIdentifier:(int64_t)a5 verifierType:(int64_t)a6 verifierData:(id)a7;
- (id)description;
- (int64_t)displayNamePolicyIdentifier;
- (int64_t)identifierAuthority;
- (int64_t)verifierType;
- (void)setDisplayNamePolicyIdentifier:(int64_t)a3;
- (void)setIdentifierAuthority:(int64_t)a3;
- (void)setVerifierData:(id)a3;
- (void)setVerifierType:(int64_t)a3;
@end

@implementation TCCDCodeIdentity

+ (id)shortStringForAuthority:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"<Unknown>";
  }
  else {
    return *(&off_100095AE0 + a3);
  }
}

- (TCCDCodeIdentity)initWithIdentifier:(id)a3 authority:(int64_t)a4 displayNamePolicyIdentifier:(int64_t)a5 verifierType:(int64_t)a6 verifierData:(id)a7
{
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)TCCDCodeIdentity;
  v13 = [(TCCDIdentity *)&v16 initWithIdentifier:a3 type:0];
  v14 = v13;
  if (v13)
  {
    [(TCCDCodeIdentity *)v13 setIdentifierAuthority:a4];
    if ((id)[(TCCDCodeIdentity *)v14 identifierAuthority] == (id)2) {
      [(TCCDCodeIdentity *)v14 setDisplayNamePolicyIdentifier:a5];
    }
    [(TCCDCodeIdentity *)v14 setVerifierType:a6];
    [(TCCDCodeIdentity *)v14 setVerifierData:v12];
  }

  return v14;
}

- (TCCDCodeIdentity)initWithAccessIdentity:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (int)objc_msgSend(v5, "client_type");
  v7 = [v5 identifier];
  v8 = objc_msgSend(v5, "policy_id");
  v9 = -[TCCDCodeIdentity initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:](self, "initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:", v7, v6, [v8 unsignedLongLongValue], 0, 0);

  if (v9) {
    objc_storeStrong((id *)&v9->_resolvedAccessIdentity, a3);
  }

  return v9;
}

- (TCCDAccessIdentity)accessIdentity
{
  v2 = self;
  objc_sync_enter(v2);
  resolvedAccessIdentity = v2->_resolvedAccessIdentity;
  if (!resolvedAccessIdentity)
  {
    v4 = [TCCDAccessIdentity alloc];
    id v5 = [(TCCDIdentity *)v2 identifier];
    uint64_t v6 = [(TCCDAccessIdentity *)v4 initWithIdentifier:v5 type:[(TCCDCodeIdentity *)v2 identifierAuthority] executableURL:0 SDKVersion:0 platformType:0];
    v7 = v2->_resolvedAccessIdentity;
    v2->_resolvedAccessIdentity = v6;

    resolvedAccessIdentity = v2->_resolvedAccessIdentity;
  }
  v8 = resolvedAccessIdentity;
  objc_sync_exit(v2);

  return v8;
}

- (NSString)verifierDescription
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_verifierDescription)
  {
    if ([(TCCDCodeIdentity *)v2 verifierType])
    {
      CFStringRef v3 = +[NSString stringWithFormat:@"Unexpected verifier tyype (%ld) on iOS", [(TCCDCodeIdentity *)v2 verifierType]];
    }
    else
    {
      CFStringRef v3 = @"None";
    }
    verifierDescription = v2->_verifierDescription;
    v2->_verifierDescription = &v3->isa;
  }
  objc_sync_exit(v2);

  id v5 = v2->_verifierDescription;
  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v4 = +[TCCDCodeIdentity shortStringForAuthority:[(TCCDCodeIdentity *)self identifierAuthority]];
  id v5 = [(TCCDIdentity *)self identifier];
  [v3 appendFormat:@"%@:%@", v4, v5];

  if ([(TCCDCodeIdentity *)self verifierType])
  {
    uint64_t v6 = [(TCCDCodeIdentity *)self verifierDescription];
    [v3 appendFormat:@", V:'%@'", v6];
  }
  if ((id)[(TCCDCodeIdentity *)self identifierAuthority] == (id)2) {
    [v3 appendFormat:@", ID:%lld", -[TCCDCodeIdentity displayNamePolicyIdentifier](self, "displayNamePolicyIdentifier")];
  }
  id v7 = [v3 copy];

  return v7;
}

- (int64_t)identifierAuthority
{
  return self->_identifierAuthority;
}

- (void)setIdentifierAuthority:(int64_t)a3
{
  self->_identifierAuthority = a3;
}

- (int64_t)displayNamePolicyIdentifier
{
  return self->_displayNamePolicyIdentifier;
}

- (void)setDisplayNamePolicyIdentifier:(int64_t)a3
{
  self->_displayNamePolicyIdentifier = a3;
}

- (int64_t)verifierType
{
  return self->_verifierType;
}

- (void)setVerifierType:(int64_t)a3
{
  self->_verifierType = a3;
}

- (NSData)verifierData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVerifierData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifierData, 0);
  objc_storeStrong((id *)&self->_resolvedAccessIdentity, 0);
  objc_storeStrong((id *)&self->_verifierDescription, 0);
}

@end