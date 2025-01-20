@interface PKPassSharedEntitlement
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCanonicallyEquivalentRightsToPassEntitlement:(id)a3;
- (BOOL)hasCanonicallyEquivalentRoleToPassEntitlement:(id)a3;
- (BOOL)hasCanonicallyEquivalentRoleToPassSharedEntitlement:(id)a3;
- (BOOL)hasCanonicallyEquivalentSharingCapabilityToPassEntitlement:(id)a3;
- (BOOL)intraAccountSharingEnabled;
- (BOOL)isEqual:(id)a3;
- (NSNumber)recipientCapabilityRole;
- (NSString)entitlementIdentifier;
- (PKPassShareTimeConfiguration)timeConfiguration;
- (PKPassSharedEntitlement)initWithCarKeyEntitlementValue:(unint64_t)a3;
- (PKPassSharedEntitlement)initWithCarKeyEntitlementValue:(unint64_t)a3 role:(id)a4;
- (PKPassSharedEntitlement)initWithCoder:(id)a3;
- (PKPassSharedEntitlement)initWithDictionary:(id)a3;
- (PKPassSharedEntitlement)initWithEntitlement:(id)a3;
- (PKPassSharedEntitlement)initWithSubcredentialDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)creationVersion;
- (unint64_t)carKeyEntitlementValue;
- (unint64_t)hash;
- (unint64_t)recipientManageability;
- (unint64_t)recipientShareability;
- (unint64_t)recipientVisibility;
- (void)_recalculateRecipientCapabilityRole;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationVersion:(int64_t)a3;
- (void)setEntitlementIdentifier:(id)a3;
- (void)setIntraAccountSharingEnabled:(BOOL)a3;
- (void)setRecipientCapabilityRole:(id)a3;
- (void)setRecipientManageability:(unint64_t)a3;
- (void)setRecipientShareability:(unint64_t)a3;
- (void)setRecipientVisibility:(unint64_t)a3;
- (void)setTimeConfiguration:(id)a3;
@end

@implementation PKPassSharedEntitlement

- (PKPassSharedEntitlement)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_16;
  }
  v22.receiver = self;
  v22.super_class = (Class)PKPassSharedEntitlement;
  self = [(PKPassSharedEntitlement *)&v22 init];
  if (!self)
  {
LABEL_13:
    self = self;
    v12 = self;
    goto LABEL_17;
  }
  v5 = [v4 PKStringForKey:@"entitlementIdentifier"];
  entitlementIdentifier = self->_entitlementIdentifier;
  self->_entitlementIdentifier = v5;

  if (!self->_entitlementIdentifier)
  {
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  v7 = [PKPassShareTimeConfiguration alloc];
  v8 = [v4 PKDictionaryForKey:@"timeConfiguration"];
  v9 = [(PKPassShareTimeConfiguration *)v7 initWithDictionary:v8];
  timeConfiguration = self->_timeConfiguration;
  self->_timeConfiguration = v9;

  v11 = [v4 PKStringForKey:@"recipientShareability"];
  v12 = v11;
  if (v11)
  {
    self->_recipientShareability = PKSharingCapabilityShareabilityFromString(v11);
    v13 = [v4 PKStringForKey:@"recipientManageability"];
    if (v13)
    {
      v14 = v13;
      self->_recipientManageability = PKSharingCapabilityManageabilityFromString(v13);
      v15 = [v4 PKStringForKey:@"recipientVisibility"];
      v16 = v15;
      if (v15)
      {
        self->_recipientVisibility = PKSharingCapabilityVisibilityFromString(v15);
        v17 = [v4 objectForKeyedSubscript:@"version"];
        int64_t v18 = v17 ? [v4 PKIntegerForKey:@"version"] : 1;
        self->_creationVersion = v18;

        if (self->_creationVersion < 2
          || ([v4 PKNumberForKey:@"recipientCapabilityRole"],
              v19 = (NSNumber *)objc_claimAutoreleasedReturnValue(),
              recipientCapabilityRole = self->_recipientCapabilityRole,
              self->_recipientCapabilityRole = v19,
              recipientCapabilityRole,
              self->_recipientCapabilityRole))
        {
          -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)self);

          goto LABEL_13;
        }
      }
    }
    goto LABEL_16;
  }
LABEL_17:

  return v12;
}

- (void)_recalculateRecipientCapabilityRole
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    v3 = [PKMutablePassEntitlementCapabilitySet alloc];
    if (v2)
    {
      v6 = -[PKPassEntitlementCapabilitySet initWithIntRole:](v3, "initWithIntRole:", [*(id *)(a1 + 48) unsignedShortValue]);
      [(PKMutablePassEntitlementCapabilitySet *)v6 setShareability:*(void *)(a1 + 24)];
      [(PKMutablePassEntitlementCapabilitySet *)v6 setVisibility:*(void *)(a1 + 40)];
      [(PKMutablePassEntitlementCapabilitySet *)v6 setManageability:*(void *)(a1 + 32)];
    }
    else
    {
      v6 = [(PKPassEntitlementCapabilitySet *)v3 initWithLocalizedName:&stru_1EE0F5368 shareability:*(void *)(a1 + 24) manageability:*(void *)(a1 + 32) visibility:*(void *)(a1 + 40)];
    }
    if (*(uint64_t *)(a1 + 56) < 2)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [(PKPassEntitlementCapabilitySet *)v6 capabilityRoleValue];
    }
    v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v4;
  }
}

- (PKPassSharedEntitlement)initWithSubcredentialDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 PKStringForKey:@"accountRole"];
    v6 = [v4 PKNumberForKey:@"accessProfile"];

    v7 = 0;
    if (v5 && v6)
    {
      v16.receiver = self;
      v16.super_class = (Class)PKPassSharedEntitlement;
      v8 = [(PKPassSharedEntitlement *)&v16 init];
      if (v8)
      {
        uint64_t v9 = [[NSString alloc] initWithFormat:@"%@%@", @"CarKeyEntitlement-", v6];
        entitlementIdentifier = v8->_entitlementIdentifier;
        v8->_entitlementIdentifier = (NSString *)v9;

        v8->_creationVersion = 2;
        v11 = [[PKPassEntitlementCapabilitySet alloc] initWithRole:v5];
        v12 = v11;
        if (v11)
        {
          v8->_recipientShareability = [(PKPassEntitlementCapabilitySet *)v11 shareability];
          v8->_recipientVisibility = [(PKPassEntitlementCapabilitySet *)v12 visibility];
          v8->_recipientManageability = [(PKPassEntitlementCapabilitySet *)v12 manageability];
          if (v8->_creationVersion <= 1)
          {
            recipientCapabilityRole = v8->_recipientCapabilityRole;
            v8->_recipientCapabilityRole = 0;
          }
          else
          {
            uint64_t v13 = [(PKPassEntitlementCapabilitySet *)v12 capabilityRoleValue];
            recipientCapabilityRole = v8->_recipientCapabilityRole;
            v8->_recipientCapabilityRole = (NSNumber *)v13;
          }
        }
        -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)v8);
      }
      self = v8;
      v7 = self;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PKPassSharedEntitlement)initWithCarKeyEntitlementValue:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPassSharedEntitlement;
  id v4 = [(PKPassSharedEntitlement *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [[NSString alloc] initWithFormat:@"%@%lu", @"CarKeyEntitlement-", a3];
    entitlementIdentifier = v4->_entitlementIdentifier;
    v4->_entitlementIdentifier = (NSString *)v5;

    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)v4);
  }
  return v4;
}

- (PKPassSharedEntitlement)initWithCarKeyEntitlementValue:(unint64_t)a3 role:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKPassSharedEntitlement;
  v7 = [(PKPassSharedEntitlement *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [[NSString alloc] initWithFormat:@"%@%lu", @"CarKeyEntitlement-", a3];
    entitlementIdentifier = v7->_entitlementIdentifier;
    v7->_entitlementIdentifier = (NSString *)v8;

    v7->_creationVersion = 2;
    v10 = [[PKPassEntitlementCapabilitySet alloc] initWithRole:v6];
    v11 = v10;
    if (v10)
    {
      v7->_recipientShareability = [(PKPassEntitlementCapabilitySet *)v10 shareability];
      v7->_recipientVisibility = [(PKPassEntitlementCapabilitySet *)v11 visibility];
      v7->_recipientManageability = [(PKPassEntitlementCapabilitySet *)v11 manageability];
      uint64_t v12 = [(PKPassEntitlementCapabilitySet *)v11 capabilityRoleValue];
      recipientCapabilityRole = v7->_recipientCapabilityRole;
      v7->_recipientCapabilityRole = (NSNumber *)v12;
    }
    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)v7);
  }
  return v7;
}

- (PKPassSharedEntitlement)initWithEntitlement:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassSharedEntitlement;
  uint64_t v5 = [(PKPassSharedEntitlement *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    entitlementIdentifier = v5->_entitlementIdentifier;
    v5->_entitlementIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 activeCapabilityRole];

    if (v8) {
      v5->_creationVersion = 2;
    }
    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)v5);
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_entitlementIdentifier forKeyedSubscript:@"entitlementIdentifier"];
  id v4 = [(PKPassShareTimeConfiguration *)self->_timeConfiguration dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"timeConfiguration"];

  uint64_t v5 = PKSharingCapabilityShareabilityToString(self->_recipientShareability);
  [v3 setObject:v5 forKeyedSubscript:@"recipientShareability"];

  uint64_t v6 = PKSharingCapabilityVisibilityToString(self->_recipientVisibility);
  [v3 setObject:v6 forKeyedSubscript:@"recipientVisibility"];

  v7 = PKSharingCapabilityManageabilityToString(self->_recipientManageability);
  [v3 setObject:v7 forKeyedSubscript:@"recipientManageability"];

  [v3 setObject:self->_recipientCapabilityRole forKeyedSubscript:@"recipientCapabilityRole"];
  uint64_t v8 = [NSNumber numberWithInteger:self->_creationVersion];
  [v3 setObject:v8 forKeyedSubscript:@"version"];

  uint64_t v9 = (void *)[v3 copy];
  return v9;
}

- (unint64_t)carKeyEntitlementValue
{
  uint64_t v2 = [(NSString *)self->_entitlementIdentifier stringByReplacingOccurrencesOfString:@"CarKeyEntitlement-" withString:&stru_1EE0F5368];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)intraAccountSharingEnabled
{
  if (!self->_recipientCapabilityRole) {
    return 0;
  }
  uint64_t v2 = [[PKPassEntitlementCapabilitySet alloc] initWithIntRole:[(NSNumber *)self->_recipientCapabilityRole unsignedShortValue]];
  BOOL v3 = [(PKPassEntitlementCapabilitySet *)v2 intraAccountSharingEnabled];

  return v3;
}

- (void)setRecipientShareability:(unint64_t)a3
{
  if (self->_recipientShareability != a3)
  {
    self->_recipientShareability = a3;
    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)self);
  }
}

- (void)setRecipientVisibility:(unint64_t)a3
{
  if (self->_recipientVisibility != a3)
  {
    self->_recipientVisibility = a3;
    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)self);
  }
}

- (void)setRecipientManageability:(unint64_t)a3
{
  if (self->_recipientManageability != a3)
  {
    self->_recipientManageability = a3;
    -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)self);
  }
}

- (void)setIntraAccountSharingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[PKPassSharedEntitlement _recalculateRecipientCapabilityRole]((uint64_t)self);
  v7 = [(PKPassEntitlementCapabilitySet *)[PKMutablePassEntitlementCapabilitySet alloc] initWithIntRole:[(NSNumber *)self->_recipientCapabilityRole unsignedShortValue]];
  [(PKMutablePassEntitlementCapabilitySet *)v7 setIntraAccountSharingEnabled:v3];
  if (self->_creationVersion < 2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(PKPassEntitlementCapabilitySet *)v7 capabilityRoleValue];
  }
  recipientCapabilityRole = self->_recipientCapabilityRole;
  self->_recipientCapabilityRole = v5;
}

- (BOOL)hasCanonicallyEquivalentRightsToPassEntitlement:(id)a3
{
  id v4 = a3;
  timeConfiguration = self->_timeConfiguration;
  uint64_t v6 = (PKPassShareTimeConfiguration *)v4[2];
  if (timeConfiguration) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (timeConfiguration == v6)
    {
LABEL_9:
      BOOL v8 = [(PKPassSharedEntitlement *)self hasCanonicallyEquivalentSharingCapabilityToPassEntitlement:v4];
      goto LABEL_10;
    }
  }
  else if (-[PKPassShareTimeConfiguration isEqual:](timeConfiguration, "isEqual:"))
  {
    goto LABEL_9;
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)hasCanonicallyEquivalentSharingCapabilityToPassEntitlement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_recipientShareability == v4[3]
    && self->_recipientVisibility == v4[5]
    && self->_recipientManageability == v4[4])
  {
    BOOL v6 = [(PKPassSharedEntitlement *)self intraAccountSharingEnabled];
    int v7 = v6 ^ [v5 intraAccountSharingEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)hasCanonicallyEquivalentRoleToPassEntitlement:(id)a3
{
  id v4 = [a3 activeCapabilityRole];
  if (v4) {
    BOOL v5 = [(NSNumber *)self->_recipientCapabilityRole isEqualToNumber:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasCanonicallyEquivalentRoleToPassSharedEntitlement:(id)a3
{
  id v4 = [a3 recipientCapabilityRole];
  if (v4) {
    BOOL v5 = [(NSNumber *)self->_recipientCapabilityRole isEqualToNumber:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassSharedEntitlement)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassSharedEntitlement;
  BOOL v5 = [(PKPassSharedEntitlement *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entitlementIdentifier"];
    entitlementIdentifier = v5->_entitlementIdentifier;
    v5->_entitlementIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeConfiguration"];
    timeConfiguration = v5->_timeConfiguration;
    v5->_timeConfiguration = (PKPassShareTimeConfiguration *)v8;

    objc_super v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientShareability"];
    v5->_recipientShareability = PKSharingCapabilityShareabilityFromString(v10);

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientManageability"];
    v5->_recipientManageability = PKSharingCapabilityManageabilityFromString(v11);

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientVisibility"];
    v5->_recipientVisibility = PKSharingCapabilityVisibilityFromString(v12);

    uint64_t v13 = [v4 decodeIntegerForKey:@"version"];
    v5->_creationVersion = v13;
    if (v13 >= 2)
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientCapabilityRole"];
      recipientCapabilityRole = v5->_recipientCapabilityRole;
      v5->_recipientCapabilityRole = (NSNumber *)v14;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  entitlementIdentifier = self->_entitlementIdentifier;
  id v8 = a3;
  [v8 encodeObject:entitlementIdentifier forKey:@"entitlementIdentifier"];
  [v8 encodeObject:self->_timeConfiguration forKey:@"timeConfiguration"];
  BOOL v5 = PKSharingCapabilityShareabilityToString(self->_recipientShareability);
  [v8 encodeObject:v5 forKey:@"recipientShareability"];

  uint64_t v6 = PKSharingCapabilityManageabilityToString(self->_recipientManageability);
  [v8 encodeObject:v6 forKey:@"recipientManageability"];

  int v7 = PKSharingCapabilityVisibilityToString(self->_recipientVisibility);
  [v8 encodeObject:v7 forKey:@"recipientVisibility"];

  [v8 encodeObject:self->_recipientCapabilityRole forKey:@"recipientCapabilityRole"];
  [v8 encodeInteger:self->_creationVersion forKey:@"version"];
}

- (id)description
{
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"entitlementIdentifier: '%@'; ", self->_entitlementIdentifier];
  [v6 appendFormat:@"timeConfiguration: '%@'; ", self->_timeConfiguration];
  int v7 = PKSharingCapabilityShareabilityToString(self->_recipientShareability);
  [v6 appendFormat:@"recipientShareability: '%@'; ", v7];

  id v8 = PKSharingCapabilityManageabilityToString(self->_recipientManageability);
  [v6 appendFormat:@"recipientManageability: '%@'; ", v8];

  uint64_t v9 = PKSharingCapabilityVisibilityToString(self->_recipientVisibility);
  [v6 appendFormat:@"recipientVisibility: '%@'; ", v9];

  if (self->_recipientCapabilityRole) {
    [v6 appendFormat:@"recipientCapabilityRole: '%@'; ", self->_recipientCapabilityRole];
  }
  objc_msgSend(v6, "appendFormat:", @"version: '%lu'; ", self->_creationVersion);
  [v6 appendFormat:@">"];
  objc_super v10 = [NSString stringWithString:v6];

  return v10;
}

- (unint64_t)hash
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_entitlementIdentifier) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_timeConfiguration) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_recipientCapabilityRole) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->_recipientShareability - v5 + 32 * v5;
  unint64_t v7 = self->_recipientManageability - v6 + 32 * v6;
  unint64_t v8 = self->_recipientVisibility - v7 + 32 * v7;
  unint64_t v9 = self->_creationVersion - v8 + 32 * v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassSharedEntitlement *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v6 = v5;
        if (!self) {
          goto LABEL_27;
        }
        entitlementIdentifier = self->_entitlementIdentifier;
        unint64_t v8 = v6->_entitlementIdentifier;
        if (entitlementIdentifier && v8)
        {
          if ((-[NSString isEqual:](entitlementIdentifier, "isEqual:") & 1) == 0) {
            goto LABEL_26;
          }
        }
        else if (entitlementIdentifier != v8)
        {
          goto LABEL_26;
        }
        timeConfiguration = self->_timeConfiguration;
        objc_super v10 = v6->_timeConfiguration;
        if (timeConfiguration && v10)
        {
          if (!-[PKPassShareTimeConfiguration isEqual:](timeConfiguration, "isEqual:")) {
            goto LABEL_26;
          }
        }
        else if (timeConfiguration != v10)
        {
          goto LABEL_26;
        }
        recipientCapabilityRole = self->_recipientCapabilityRole;
        uint64_t v12 = v6->_recipientCapabilityRole;
        if (recipientCapabilityRole && v12)
        {
          if ((-[NSNumber isEqual:](recipientCapabilityRole, "isEqual:") & 1) == 0) {
            goto LABEL_26;
          }
          goto LABEL_22;
        }
        if (recipientCapabilityRole == v12)
        {
LABEL_22:
          if (self->_recipientShareability != v6->_recipientShareability
            || self->_recipientManageability != v6->_recipientManageability
            || self->_recipientVisibility != v6->_recipientVisibility)
          {
            goto LABEL_26;
          }
          LOBYTE(self) = self->_creationVersion == v6->_creationVersion;
LABEL_27:

          goto LABEL_28;
        }
LABEL_26:
        LOBYTE(self) = 0;
        goto LABEL_27;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_28:

  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PKPassSharedEntitlement allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_entitlementIdentifier copy];
  entitlementIdentifier = v4->_entitlementIdentifier;
  v4->_entitlementIdentifier = (NSString *)v5;

  uint64_t v7 = [(PKPassShareTimeConfiguration *)self->_timeConfiguration copy];
  timeConfiguration = v4->_timeConfiguration;
  v4->_timeConfiguration = (PKPassShareTimeConfiguration *)v7;

  v4->_recipientShareability = self->_recipientShareability;
  v4->_recipientManageability = self->_recipientManageability;
  v4->_recipientVisibility = self->_recipientVisibility;
  objc_storeStrong((id *)&v4->_recipientCapabilityRole, self->_recipientCapabilityRole);
  v4->_creationVersion = self->_creationVersion;
  return v4;
}

- (NSString)entitlementIdentifier
{
  return self->_entitlementIdentifier;
}

- (void)setEntitlementIdentifier:(id)a3
{
}

- (PKPassShareTimeConfiguration)timeConfiguration
{
  return self->_timeConfiguration;
}

- (void)setTimeConfiguration:(id)a3
{
}

- (unint64_t)recipientShareability
{
  return self->_recipientShareability;
}

- (unint64_t)recipientManageability
{
  return self->_recipientManageability;
}

- (unint64_t)recipientVisibility
{
  return self->_recipientVisibility;
}

- (NSNumber)recipientCapabilityRole
{
  return self->_recipientCapabilityRole;
}

- (void)setRecipientCapabilityRole:(id)a3
{
}

- (int64_t)creationVersion
{
  return self->_creationVersion;
}

- (void)setCreationVersion:(int64_t)a3
{
  self->_creationVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientCapabilityRole, 0);
  objc_storeStrong((id *)&self->_timeConfiguration, 0);
  objc_storeStrong((id *)&self->_entitlementIdentifier, 0);
}

@end