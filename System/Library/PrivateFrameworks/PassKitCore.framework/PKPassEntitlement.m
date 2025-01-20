@interface PKPassEntitlement
+ (BOOL)supportsSecureCoding;
- (BOOL)active;
- (BOOL)hasCanonicallyEquivalentRightsToPassEntitlement:(id)a3;
- (BOOL)hasRemainingShares;
- (BOOL)intraAccountSharingEnabled;
- (BOOL)isEqual:(id)a3;
- (NSArray)manageability;
- (NSArray)shareability;
- (NSArray)visibility;
- (NSDictionary)templateFields;
- (NSNumber)activeCapabilityRole;
- (NSNumber)activeManageability;
- (NSNumber)activeShareability;
- (NSNumber)activeVisibility;
- (NSNumber)value;
- (NSString)entitlementTemplate;
- (NSString)identifier;
- (NSString)subcredentialIdentifier;
- (PKPassEntitlement)initWithCarKeyProfile:(id)a3 roles:(id)a4 active:(BOOL)a5 subcredentialIdentifier:(id)a6;
- (PKPassEntitlement)initWithCoder:(id)a3;
- (PKPassEntitlement)initWithDictionary:(id)a3;
- (PKPassEntitlement)initWithSubcredentialDictionary:(id)a3 active:(BOOL)a4 subcredentialIdentifier:(id)a5;
- (PKPassShareTimeConfiguration)timeConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subcredentialDictionaryRepresentation;
- (int64_t)carKeyEntitlementType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setActiveCapabilityRole:(id)a3;
- (void)setActiveManageability:(id)a3;
- (void)setActiveShareability:(id)a3;
- (void)setActiveVisibility:(id)a3;
- (void)setEntitlementTemplate:(id)a3;
- (void)setHasRemainingShares:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setManageability:(id)a3;
- (void)setShareability:(id)a3;
- (void)setSubcredentialIdentifier:(id)a3;
- (void)setTemplateFields:(id)a3;
- (void)setTimeConfiguration:(id)a3;
- (void)setValue:(id)a3;
- (void)setVisibility:(id)a3;
@end

@implementation PKPassEntitlement

- (PKPassEntitlement)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v32.receiver = self;
    v32.super_class = (Class)PKPassEntitlement;
    self = [(PKPassEntitlement *)&v32 init];
    if (!self)
    {
LABEL_12:
      self = self;
      v15 = self;
      goto LABEL_13;
    }
    v5 = [v4 PKStringForKey:@"entitlementIdentifier"];
    identifier = self->_identifier;
    self->_identifier = v5;

    if (self->_identifier)
    {
      v7 = [PKPassShareTimeConfiguration alloc];
      v8 = [v4 PKDictionaryForKey:@"timeConfiguration"];
      v9 = [(PKPassShareTimeConfiguration *)v7 initWithDictionary:v8];
      timeConfiguration = self->_timeConfiguration;
      self->_timeConfiguration = v9;

      v11 = [v4 PKStringForKey:@"entitlementTemplateType"];
      entitlementTemplate = self->_entitlementTemplate;
      self->_entitlementTemplate = v11;

      self->_active = [v4 PKBoolForKey:@"active"];
      v13 = [v4 objectForKeyedSubscript:@"hasRemainingShares"];
      if (v13) {
        char v14 = [v4 PKBoolForKey:@"hasRemainingShares"];
      }
      else {
        char v14 = 1;
      }
      self->_hasRemainingShares = v14;

      v16 = [v4 PKDictionaryForKey:@"templateFields"];
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v18 = [v16 PKDictionaryForKey:@"title"];
      [v17 setObject:v18 forKeyedSubscript:@"title"];

      v19 = [v16 PKDictionaryForKey:@"description"];
      [v17 setObject:v19 forKeyedSubscript:@"description"];

      if ([v17 count])
      {
        v20 = (NSDictionary *)[v17 copy];
        templateFields = self->_templateFields;
        self->_templateFields = v20;
      }
      else
      {
        templateFields = self->_templateFields;
        self->_templateFields = 0;
      }

      v22 = [v4 PKArrayContaining:objc_opt_class() forKey:@"shareability"];
      PKSharingCapabilityShareabilitiesFromStringArray(v22);
      v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
      shareability = self->_shareability;
      self->_shareability = v23;

      v25 = [v4 PKArrayContaining:objc_opt_class() forKey:@"manageability"];
      PKSharingCapabilityVisibilitiesFromStringArray(v25);
      v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
      manageability = self->_manageability;
      self->_manageability = v26;

      v28 = [v4 PKArrayContaining:objc_opt_class() forKey:@"visibility"];
      PKSharingCapabilityVisibilitiesFromStringArray(v28);
      v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
      visibility = self->_visibility;
      self->_visibility = v29;

      goto LABEL_12;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (PKPassEntitlement)initWithSubcredentialDictionary:(id)a3 active:(BOOL)a4 subcredentialIdentifier:(id)a5
{
  BOOL v6 = a4;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = [v8 PKNumberForKey:@"accessProfile"];
    uint64_t v11 = [v8 PKStringForKey:@"accountRole"];
    v12 = (void *)v11;
    v13 = @"0000";
    if (v11) {
      v13 = (__CFString *)v11;
    }
    char v14 = v13;

    if (v10)
    {
      v41[0] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
      self = [(PKPassEntitlement *)self initWithCarKeyProfile:v10 roles:v15 active:v6 subcredentialIdentifier:v9];
    }
    else
    {
      v40.receiver = self;
      v40.super_class = (Class)PKPassEntitlement;
      id v17 = [(PKPassEntitlement *)&v40 init];
      if (v17)
      {
        v18 = [v8 PKNumberForKey:@"value"];
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          v20 = [v8 PKNumberForKey:@"rights"];
        }
        value = v17->_value;
        v17->_value = v20;

        uint64_t v22 = [[NSString alloc] initWithFormat:@"%@%@", @"CarKeyEntitlement-", v17->_value];
        identifier = v17->_identifier;
        v17->_identifier = (NSString *)v22;

        objc_storeStrong((id *)&v17->_subcredentialIdentifier, a5);
        id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v25 = [v8 PKStringForKey:@"description"];
        [v24 setObject:v25 forKeyedSubscript:@"title"];

        v26 = [v8 PKStringForKey:@"longDescription"];
        [v24 setObject:v26 forKeyedSubscript:@"description"];

        if ([v24 count]) {
          v27 = v24;
        }
        else {
          v27 = 0;
        }
        objc_storeStrong((id *)&v17->_templateFields, v27);
        objc_storeStrong((id *)&v17->_entitlementTemplate, @"legacyCarKeyEntitlementTemplate");
        char v28 = 1;
        if (!v6) {
          char v28 = [v8 PKBoolForKey:@"active"];
        }
        v17->_active = v28;
        v29 = [v8 PKArrayContaining:objc_opt_class() forKey:@"shareability"];
        uint64_t v30 = PKSharingCapabilityShareabilitiesFromStringArray(v29);
        shareability = v17->_shareability;
        v17->_shareability = (NSArray *)v30;

        objc_super v32 = [v8 PKArrayContaining:objc_opt_class() forKey:@"manageability"];
        uint64_t v33 = PKSharingCapabilityVisibilitiesFromStringArray(v32);
        manageability = v17->_manageability;
        v17->_manageability = (NSArray *)v33;

        v35 = [v8 PKArrayContaining:objc_opt_class() forKey:@"visibility"];
        uint64_t v36 = PKSharingCapabilityVisibilitiesFromStringArray(v35);
        visibility = v17->_visibility;
        v17->_visibility = (NSArray *)v36;

        activeCapabilityRole = v17->_activeCapabilityRole;
        v17->_activeCapabilityRole = 0;

        v17->_hasRemainingShares = 1;
      }
      self = v17;
    }

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (PKPassEntitlement)initWithCarKeyProfile:(id)a3 roles:(id)a4 active:(BOOL)a5 subcredentialIdentifier:(id)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    uint64_t v30 = 0;
    goto LABEL_25;
  }
  v63.receiver = self;
  v63.super_class = (Class)PKPassEntitlement;
  char v14 = [(PKPassEntitlement *)&v63 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_24;
  }
  id v53 = v13;
  id v55 = v11;
  objc_storeStrong((id *)&v14->_value, a3);
  uint64_t v16 = [[NSString alloc] initWithFormat:@"%@%@", @"CarKeyEntitlement-", v15->_value];
  identifier = v15->_identifier;
  v15->_identifier = (NSString *)v16;

  objc_storeStrong((id *)&v15->_subcredentialIdentifier, a6);
  objc_storeStrong((id *)&v15->_entitlementTemplate, @"carKeyEntitlementTemplateV2");
  v15->_active = a5;
  v52 = v15;
  objc_storeStrong((id *)&v15->_rawRoles, a4);
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v54 = v12;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (!v19)
  {
    v21 = 0;
    char v23 = 1;
    goto LABEL_19;
  }
  uint64_t v20 = v19;
  v21 = 0;
  uint64_t v22 = *(void *)v60;
  char v23 = 1;
  do
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v60 != v22) {
        objc_enumerationMutation(v18);
      }
      v25 = [[PKPassEntitlementCapabilitySet alloc] initWithRole:*(void *)(*((void *)&v59 + 1) + 8 * i)];
      v26 = v25;
      if (v25)
      {
        v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPassEntitlementCapabilitySet shareability](v25, "shareability"));
        [v58 addObject:v27];

        char v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPassEntitlementCapabilitySet visibility](v26, "visibility"));
        [v57 addObject:v28];

        v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPassEntitlementCapabilitySet manageability](v26, "manageability"));
        [v56 addObject:v29];

        if (v23)
        {
          char v23 = [(PKPassEntitlementCapabilitySet *)v26 intraAccountSharingEnabled];
          if (v21) {
            goto LABEL_14;
          }
        }
        else
        {
          char v23 = 0;
          if (v21) {
            goto LABEL_14;
          }
        }
        v21 = [(PKPassEntitlementCapabilitySet *)v26 capabilityRoleValue];
      }
LABEL_14:
    }
    uint64_t v20 = [v18 countByEnumeratingWithState:&v59 objects:v64 count:16];
  }
  while (v20);
LABEL_19:

  v31 = [v58 allObjects];
  uint64_t v32 = [v31 sortedArrayUsingSelector:sel_compare_];
  v15 = v52;
  shareability = v52->_shareability;
  v52->_shareability = (NSArray *)v32;

  v34 = [v56 allObjects];
  uint64_t v35 = [v34 sortedArrayUsingSelector:sel_compare_];
  manageability = v52->_manageability;
  v52->_manageability = (NSArray *)v35;

  v37 = [v57 allObjects];
  uint64_t v38 = [v37 sortedArrayUsingSelector:sel_compare_];
  visibility = v52->_visibility;
  v52->_visibility = (NSArray *)v38;

  activeCapabilityRole = v52->_activeCapabilityRole;
  v52->_activeCapabilityRole = (NSNumber *)&unk_1EE22C800;

  id v12 = v54;
  if (v52->_active)
  {
    if (v23)
    {
      uint64_t v41 = [(NSArray *)v52->_shareability lastObject];
      activeShareability = v52->_activeShareability;
      v52->_activeShareability = (NSNumber *)v41;

      uint64_t v43 = [(NSArray *)v52->_manageability lastObject];
      activeManageability = v52->_activeManageability;
      v52->_activeManageability = (NSNumber *)v43;

      uint64_t v45 = [(NSArray *)v52->_visibility lastObject];
      activeVisibility = v52->_activeVisibility;
      v52->_activeVisibility = (NSNumber *)v45;

      objc_storeStrong((id *)&v52->_activeCapabilityRole, v21);
    }
    v47 = v52->_shareability;
    v48 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v52->_shareability = (NSArray *)MEMORY[0x1E4F1CBF0];

    v49 = v52->_manageability;
    v52->_manageability = v48;

    v50 = v52->_visibility;
    v52->_visibility = v48;
  }
  v52->_hasRemainingShares = 1;

  id v11 = v55;
  id v13 = v53;
LABEL_24:
  self = v15;
  uint64_t v30 = self;
LABEL_25:

  return v30;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"entitlementIdentifier"];
  id v4 = [(PKPassShareTimeConfiguration *)self->_timeConfiguration dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"timeConfiguration"];

  [v3 setObject:self->_entitlementTemplate forKeyedSubscript:@"entitlementTemplateType"];
  [v3 setObject:self->_templateFields forKeyedSubscript:@"templateFields"];
  v5 = PKSharingCapabilityShareabilitiesToStringArray(self->_shareability);
  [v3 setObject:v5 forKeyedSubscript:@"shareability"];

  BOOL v6 = PKSharingCapabilityManageabilitiesToStringArray(self->_manageability);
  [v3 setObject:v6 forKeyedSubscript:@"manageability"];

  v7 = PKSharingCapabilityVisibilitiesToStringArray(self->_visibility);
  [v3 setObject:v7 forKeyedSubscript:@"visibility"];

  id v8 = [NSNumber numberWithBool:self->_active];
  [v3 setObject:v8 forKeyedSubscript:@"active"];

  id v9 = [NSNumber numberWithBool:self->_hasRemainingShares];
  [v3 setObject:v9 forKeyedSubscript:@"hasRemainingShares"];

  v10 = (void *)[v3 copy];
  return v10;
}

- (id)subcredentialDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_value forKeyedSubscript:@"value"];
  id v4 = [(NSDictionary *)self->_templateFields objectForKeyedSubscript:@"title"];
  [v3 setObject:v4 forKeyedSubscript:@"description"];

  v5 = [(NSDictionary *)self->_templateFields objectForKeyedSubscript:@"description"];
  [v3 setObject:v5 forKeyedSubscript:@"longDescription"];

  BOOL v6 = [(NSArray *)self->_rawRoles firstObject];
  [v3 setObject:v6 forKeyedSubscript:@"accountRole"];

  v7 = self->_entitlementTemplate;
  id v8 = @"carKeyEntitlementTemplateV2";
  if (v7 == (NSString *)v8)
  {

    goto LABEL_7;
  }
  id v9 = v8;
  if (!v7 || !v8)
  {

    goto LABEL_9;
  }
  BOOL v10 = [(NSString *)v7 isEqualToString:v8];

  if (v10) {
LABEL_7:
  }
    [v3 setObject:self->_value forKeyedSubscript:@"accessProfile"];
LABEL_9:
  id v11 = (void *)[v3 copy];

  return v11;
}

- (BOOL)intraAccountSharingEnabled
{
  if (!self->_activeCapabilityRole) {
    return 1;
  }
  v2 = [[PKPassEntitlementCapabilitySet alloc] initWithIntRole:[(NSNumber *)self->_activeCapabilityRole unsignedShortValue]];
  BOOL v3 = [(PKPassEntitlementCapabilitySet *)v2 intraAccountSharingEnabled];

  return v3;
}

- (int64_t)carKeyEntitlementType
{
  int64_t result = [(NSNumber *)self->_value unsignedIntegerValue];
  if ((unint64_t)result >= 6) {
    return 6;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassEntitlement)initWithCoder:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PKPassEntitlement;
  v5 = [(PKPassEntitlement *)&v61 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeConfiguration"];
    timeConfiguration = v5->_timeConfiguration;
    v5->_timeConfiguration = (PKPassShareTimeConfiguration *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entitlementTemplate"];
    entitlementTemplate = v5->_entitlementTemplate;
    v5->_entitlementTemplate = (NSString *)v10;

    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"templateFields"];
    templateFields = v5->_templateFields;
    v5->_templateFields = (NSDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"active"];
    v5->_active = [v19 BOOLValue];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasRemainingShares"];
    v5->_hasRemainingShares = [v20 BOOLValue];

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    char v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    id v24 = [v4 decodeObjectOfClasses:v23 forKey:@"shareability"];
    uint64_t v25 = PKSharingCapabilityShareabilitiesFromStringArray(v24);
    shareability = v5->_shareability;
    v5->_shareability = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"manageability"];
    uint64_t v31 = PKSharingCapabilityManageabilitiesFromStringArray(v30);
    manageability = v5->_manageability;
    v5->_manageability = (NSArray *)v31;

    uint64_t v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"visibility"];
    uint64_t v37 = PKSharingCapabilityVisibilitiesFromStringArray(v36);
    visibility = v5->_visibility;
    v5->_visibility = (NSArray *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSNumber *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subcredentialIdentifier"];
    subcredentialIdentifier = v5->_subcredentialIdentifier;
    v5->_subcredentialIdentifier = (NSString *)v41;

    uint64_t v43 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"rawRoles"];
    rawRoles = v5->_rawRoles;
    v5->_rawRoles = (NSArray *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeCapabilityRole"];
    activeCapabilityRole = v5->_activeCapabilityRole;
    v5->_activeCapabilityRole = (NSNumber *)v48;

    v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeShareability"];
    v51 = v50;
    if (v50)
    {
      uint64_t v52 = [NSNumber numberWithUnsignedInteger:PKSharingCapabilityShareabilityFromString(v50)];
      activeShareability = v5->_activeShareability;
      v5->_activeShareability = (NSNumber *)v52;
    }
    id v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeManageability"];

    if (v54)
    {
      uint64_t v55 = [NSNumber numberWithUnsignedInteger:PKSharingCapabilityManageabilityFromString(v54)];
      activeManageability = v5->_activeManageability;
      v5->_activeManageability = (NSNumber *)v55;
    }
    id v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeVisibility"];

    if (v57)
    {
      uint64_t v58 = [NSNumber numberWithUnsignedInteger:PKSharingCapabilityVisibilityFromString(v57)];
      activeVisibility = v5->_activeVisibility;
      v5->_activeVisibility = (NSNumber *)v58;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_timeConfiguration forKey:@"timeConfiguration"];
  [v5 encodeObject:self->_entitlementTemplate forKey:@"entitlementTemplate"];
  [v5 encodeObject:self->_templateFields forKey:@"templateFields"];
  uint64_t v6 = [NSNumber numberWithBool:self->_active];
  [v5 encodeObject:v6 forKey:@"active"];

  v7 = [NSNumber numberWithBool:self->_hasRemainingShares];
  [v5 encodeObject:v7 forKey:@"hasRemainingShares"];

  uint64_t v8 = PKSharingCapabilityShareabilitiesToStringArray(self->_shareability);
  [v5 encodeObject:v8 forKey:@"shareability"];

  id v9 = PKSharingCapabilityManageabilitiesToStringArray(self->_manageability);
  [v5 encodeObject:v9 forKey:@"manageability"];

  uint64_t v10 = PKSharingCapabilityVisibilitiesToStringArray(self->_visibility);
  [v5 encodeObject:v10 forKey:@"visibility"];

  [v5 encodeObject:self->_value forKey:@"value"];
  [v5 encodeObject:self->_subcredentialIdentifier forKey:@"subcredentialIdentifier"];
  [v5 encodeObject:self->_rawRoles forKey:@"rawRoles"];
  [v5 encodeObject:self->_activeCapabilityRole forKey:@"activeCapabilityRole"];
  id v11 = PKSharingCapabilityShareabilityToString([(NSNumber *)self->_activeShareability unsignedIntegerValue]);
  [v5 encodeObject:v11 forKey:@"activeShareability"];

  id v12 = PKSharingCapabilityManageabilityToString([(NSNumber *)self->_activeManageability unsignedIntegerValue]);
  [v5 encodeObject:v12 forKey:@"activeManageability"];

  PKSharingCapabilityVisibilityToString([(NSNumber *)self->_activeVisibility unsignedIntegerValue]);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v13 forKey:@"activeVisibility"];
}

- (id)description
{
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v6 appendFormat:@"timeConfiguration: '%@'; ", self->_timeConfiguration];
  [v6 appendFormat:@"entitlementTemplate: '%@'; ", self->_entitlementTemplate];
  [v6 appendFormat:@"templateFields: '%@'; ", self->_templateFields];
  v7 = [NSNumber numberWithBool:self->_active];
  [v6 appendFormat:@"active: '%@'; ", v7];

  uint64_t v8 = [NSNumber numberWithBool:self->_hasRemainingShares];
  [v6 appendFormat:@"hasRemainingShares: '%@'; ", v8];

  id v9 = PKSharingCapabilityShareabilitiesToStringArray(self->_shareability);
  uint64_t v10 = [v9 componentsJoinedByString:@", "];
  [v6 appendFormat:@"shareability: '%@'; ", v10];

  id v11 = PKSharingCapabilityManageabilitiesToStringArray(self->_manageability);
  id v12 = [v11 componentsJoinedByString:@", "];
  [v6 appendFormat:@"manageability: '%@'; ", v12];

  id v13 = PKSharingCapabilityVisibilitiesToStringArray(self->_visibility);
  uint64_t v14 = [v13 componentsJoinedByString:@", "];
  [v6 appendFormat:@"visibility: '%@'; ", v14];

  [v6 appendFormat:@"value: '%@'; ", self->_value];
  [v6 appendFormat:@"subcredentialIdentifier: '%@'; ", self->_subcredentialIdentifier];
  if (self->_active)
  {
    [v6 appendFormat:@"activeCapabilityRole: '%@'; ", self->_activeCapabilityRole];
    activeShareability = self->_activeShareability;
    if (activeShareability)
    {
      uint64_t v16 = PKSharingCapabilityShareabilityToString([(NSNumber *)activeShareability unsignedIntegerValue]);
      [v6 appendFormat:@"activeShareability: '%@'; ", v16];
    }
    else
    {
      [v6 appendFormat:@"activeShareability: '%@'; ", @"nil"];
    }
    activeManageability = self->_activeManageability;
    if (activeManageability)
    {
      id v18 = PKSharingCapabilityManageabilityToString([(NSNumber *)activeManageability unsignedIntegerValue]);
      [v6 appendFormat:@"activeManageability: '%@'; ", v18];
    }
    else
    {
      [v6 appendFormat:@"activeManageability: '%@'; ", @"nil"];
    }
    activeVisibility = self->_activeVisibility;
    if (activeVisibility)
    {
      uint64_t v20 = PKSharingCapabilityVisibilityToString([(NSNumber *)activeVisibility unsignedIntegerValue]);
      [v6 appendFormat:@"activeVisibility: '%@'; ", v20];
    }
    else
    {
      [v6 appendFormat:@"activeVisibility: '%@'; ", @"nil"];
    }
  }
  [v6 appendFormat:@">"];
  v21 = [NSString stringWithString:v6];

  return v21;
}

- (unint64_t)hash
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_identifier) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_timeConfiguration) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_entitlementTemplate) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_templateFields) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_shareability) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_manageability) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_visibility) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_value) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_activeCapabilityRole) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_subcredentialIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_activeShareability) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_activeManageability) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_activeVisibility) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  uint64_t v6 = self->_active - v5 + 32 * v5;
  unint64_t v7 = self->_hasRemainingShares - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassEntitlement *)a3;
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
        uint64_t v6 = v5;
        if (!self)
        {
LABEL_76:

          goto LABEL_77;
        }
        identifier = self->_identifier;
        uint64_t v8 = v6->_identifier;
        if (identifier && v8)
        {
          if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
            goto LABEL_75;
          }
        }
        else if (identifier != v8)
        {
          goto LABEL_75;
        }
        timeConfiguration = self->_timeConfiguration;
        uint64_t v10 = v6->_timeConfiguration;
        if (timeConfiguration && v10)
        {
          if (!-[PKPassShareTimeConfiguration isEqual:](timeConfiguration, "isEqual:")) {
            goto LABEL_75;
          }
        }
        else if (timeConfiguration != v10)
        {
          goto LABEL_75;
        }
        entitlementTemplate = self->_entitlementTemplate;
        id v12 = v6->_entitlementTemplate;
        if (entitlementTemplate && v12)
        {
          if ((-[NSString isEqual:](entitlementTemplate, "isEqual:") & 1) == 0) {
            goto LABEL_75;
          }
        }
        else if (entitlementTemplate != v12)
        {
          goto LABEL_75;
        }
        templateFields = self->_templateFields;
        uint64_t v14 = v6->_templateFields;
        if (templateFields && v14)
        {
          if ((-[NSDictionary isEqual:](templateFields, "isEqual:") & 1) == 0) {
            goto LABEL_75;
          }
        }
        else if (templateFields != v14)
        {
          goto LABEL_75;
        }
        shareability = self->_shareability;
        uint64_t v16 = v6->_shareability;
        if (shareability && v16)
        {
          if ((-[NSArray isEqual:](shareability, "isEqual:") & 1) == 0) {
            goto LABEL_75;
          }
        }
        else if (shareability != v16)
        {
          goto LABEL_75;
        }
        manageability = self->_manageability;
        id v18 = v6->_manageability;
        if (manageability && v18)
        {
          if ((-[NSArray isEqual:](manageability, "isEqual:") & 1) == 0) {
            goto LABEL_75;
          }
        }
        else if (manageability != v18)
        {
          goto LABEL_75;
        }
        visibility = self->_visibility;
        uint64_t v20 = v6->_visibility;
        if (visibility && v20)
        {
          if ((-[NSArray isEqual:](visibility, "isEqual:") & 1) == 0) {
            goto LABEL_75;
          }
        }
        else if (visibility != v20)
        {
          goto LABEL_75;
        }
        value = self->_value;
        uint64_t v22 = v6->_value;
        if (value && v22)
        {
          if ((-[NSNumber isEqual:](value, "isEqual:") & 1) == 0) {
            goto LABEL_75;
          }
        }
        else if (value != v22)
        {
          goto LABEL_75;
        }
        subcredentialIdentifier = v6->_subcredentialIdentifier;
        id v24 = self->_subcredentialIdentifier;
        uint64_t v25 = subcredentialIdentifier;
        if (v24 == v25)
        {
        }
        else
        {
          v26 = v25;
          if (!v24 || !v25)
          {

            goto LABEL_75;
          }
          BOOL v27 = [(NSString *)v24 isEqualToString:v25];

          if (!v27) {
            goto LABEL_75;
          }
        }
        if (self->_active == v6->_active)
        {
          activeCapabilityRole = self->_activeCapabilityRole;
          v29 = v6->_activeCapabilityRole;
          if (activeCapabilityRole && v29)
          {
            if ((-[NSNumber isEqual:](activeCapabilityRole, "isEqual:") & 1) == 0) {
              goto LABEL_75;
            }
          }
          else if (activeCapabilityRole != v29)
          {
            goto LABEL_75;
          }
          activeShareability = self->_activeShareability;
          uint64_t v31 = v6->_activeShareability;
          if (activeShareability && v31)
          {
            if ((-[NSNumber isEqual:](activeShareability, "isEqual:") & 1) == 0) {
              goto LABEL_75;
            }
          }
          else if (activeShareability != v31)
          {
            goto LABEL_75;
          }
          activeManageability = self->_activeManageability;
          uint64_t v33 = v6->_activeManageability;
          if (activeManageability && v33)
          {
            if ((-[NSNumber isEqual:](activeManageability, "isEqual:") & 1) == 0) {
              goto LABEL_75;
            }
          }
          else if (activeManageability != v33)
          {
            goto LABEL_75;
          }
          activeVisibility = self->_activeVisibility;
          uint64_t v35 = v6->_activeVisibility;
          if (activeVisibility && v35)
          {
            if (-[NSNumber isEqual:](activeVisibility, "isEqual:"))
            {
LABEL_73:
              LOBYTE(self) = self->_hasRemainingShares == v6->_hasRemainingShares;
              goto LABEL_76;
            }
          }
          else if (activeVisibility == v35)
          {
            goto LABEL_73;
          }
        }
LABEL_75:
        LOBYTE(self) = 0;
        goto LABEL_76;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_77:

  return (char)self;
}

- (BOOL)hasCanonicallyEquivalentRightsToPassEntitlement:(id)a3
{
  id v4 = a3;
  timeConfiguration = self->_timeConfiguration;
  uint64_t v6 = (PKPassShareTimeConfiguration *)v4[4];
  if (timeConfiguration) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (timeConfiguration != v6) {
      goto LABEL_25;
    }
  }
  else if (!-[PKPassShareTimeConfiguration isEqual:](timeConfiguration, "isEqual:"))
  {
    goto LABEL_25;
  }
  if (self->_active == (*((unsigned char *)v4 + 16) == 0)) {
    goto LABEL_25;
  }
  activeShareability = self->_activeShareability;
  uint64_t v10 = (NSNumber *)v4[7];
  if (activeShareability && v10)
  {
    if ((-[NSNumber isEqual:](activeShareability, "isEqual:") & 1) == 0) {
      goto LABEL_25;
    }
  }
  else if (activeShareability != v10)
  {
    goto LABEL_25;
  }
  activeManageability = self->_activeManageability;
  id v12 = (NSNumber *)v4[8];
  if (activeManageability && v12)
  {
    if ((-[NSNumber isEqual:](activeManageability, "isEqual:") & 1) == 0) {
      goto LABEL_25;
    }
  }
  else if (activeManageability != v12)
  {
    goto LABEL_25;
  }
  activeVisibility = self->_activeVisibility;
  uint64_t v14 = (NSNumber *)v4[9];
  if (activeVisibility && v14)
  {
    if ((-[NSNumber isEqual:](activeVisibility, "isEqual:") & 1) == 0) {
      goto LABEL_25;
    }
  }
  else if (activeVisibility != v14)
  {
    goto LABEL_25;
  }
  shareability = self->_shareability;
  id v18 = (NSArray *)v4[11];
  if (shareability != v18)
  {
    char v15 = 0;
    if (!shareability || !v18) {
      goto LABEL_26;
    }
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_shareability];
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4[11]];
    v21 = v20;
    if (v19 && v20)
    {
      char v22 = [v19 isEqual:v20];

      if ((v22 & 1) == 0) {
        goto LABEL_25;
      }
    }
    else
    {

      if (v19 != v21) {
        goto LABEL_25;
      }
    }
  }
  manageability = self->_manageability;
  id v24 = (NSArray *)v4[12];
  if (manageability == v24) {
    goto LABEL_43;
  }
  char v15 = 0;
  if (!manageability || !v24) {
    goto LABEL_26;
  }
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_manageability];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4[12]];
  BOOL v27 = v26;
  if (!v25 || !v26)
  {

    if (v25 == v27) {
      goto LABEL_43;
    }
LABEL_25:
    char v15 = 0;
    goto LABEL_26;
  }
  char v28 = [v25 isEqual:v26];

  if ((v28 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_43:
  visibility = self->_visibility;
  uint64_t v30 = (NSArray *)v4[13];
  if (visibility == v30)
  {
    char v15 = 1;
  }
  else
  {
    char v15 = 0;
    if (visibility && v30)
    {
      uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_visibility];
      uint64_t v32 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4[13]];
      uint64_t v33 = (void *)v32;
      if (v31 && v32) {
        char v15 = [v31 isEqual:v32];
      }
      else {
        char v15 = v31 == (void *)v32;
      }
    }
  }
LABEL_26:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PKPassEntitlement allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_identifier copy];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  uint64_t v7 = [(PKPassShareTimeConfiguration *)self->_timeConfiguration copy];
  timeConfiguration = v4->_timeConfiguration;
  v4->_timeConfiguration = (PKPassShareTimeConfiguration *)v7;

  uint64_t v9 = [(NSString *)self->_entitlementTemplate copy];
  entitlementTemplate = v4->_entitlementTemplate;
  v4->_entitlementTemplate = (NSString *)v9;

  uint64_t v11 = [(NSDictionary *)self->_templateFields copy];
  templateFields = v4->_templateFields;
  v4->_templateFields = (NSDictionary *)v11;

  uint64_t v13 = [(NSArray *)self->_shareability copy];
  shareability = v4->_shareability;
  v4->_shareability = (NSArray *)v13;

  uint64_t v15 = [(NSArray *)self->_manageability copy];
  manageability = v4->_manageability;
  v4->_manageability = (NSArray *)v15;

  uint64_t v17 = [(NSArray *)self->_visibility copy];
  visibility = v4->_visibility;
  v4->_visibility = (NSArray *)v17;

  uint64_t v19 = [(NSNumber *)self->_value copy];
  value = v4->_value;
  v4->_value = (NSNumber *)v19;

  v4->_active = self->_active;
  v4->_hasRemainingShares = self->_hasRemainingShares;
  uint64_t v21 = [(NSString *)self->_subcredentialIdentifier copy];
  subcredentialIdentifier = v4->_subcredentialIdentifier;
  v4->_subcredentialIdentifier = (NSString *)v21;

  uint64_t v23 = [(NSArray *)self->_rawRoles copy];
  rawRoles = v4->_rawRoles;
  v4->_rawRoles = (NSArray *)v23;

  uint64_t v25 = [(NSNumber *)self->_activeCapabilityRole copy];
  activeCapabilityRole = v4->_activeCapabilityRole;
  v4->_activeCapabilityRole = (NSNumber *)v25;

  objc_storeStrong((id *)&v4->_activeShareability, self->_activeShareability);
  objc_storeStrong((id *)&v4->_activeManageability, self->_activeManageability);
  objc_storeStrong((id *)&v4->_activeVisibility, self->_activeVisibility);
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (PKPassShareTimeConfiguration)timeConfiguration
{
  return self->_timeConfiguration;
}

- (void)setTimeConfiguration:(id)a3
{
}

- (NSString)entitlementTemplate
{
  return self->_entitlementTemplate;
}

- (void)setEntitlementTemplate:(id)a3
{
}

- (NSDictionary)templateFields
{
  return self->_templateFields;
}

- (void)setTemplateFields:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (NSNumber)activeShareability
{
  return self->_activeShareability;
}

- (void)setActiveShareability:(id)a3
{
}

- (NSNumber)activeManageability
{
  return self->_activeManageability;
}

- (void)setActiveManageability:(id)a3
{
}

- (NSNumber)activeVisibility
{
  return self->_activeVisibility;
}

- (void)setActiveVisibility:(id)a3
{
}

- (NSNumber)activeCapabilityRole
{
  return self->_activeCapabilityRole;
}

- (void)setActiveCapabilityRole:(id)a3
{
}

- (BOOL)hasRemainingShares
{
  return self->_hasRemainingShares;
}

- (void)setHasRemainingShares:(BOOL)a3
{
  self->_hasRemainingShares = a3;
}

- (NSArray)shareability
{
  return self->_shareability;
}

- (void)setShareability:(id)a3
{
}

- (NSArray)manageability
{
  return self->_manageability;
}

- (void)setManageability:(id)a3
{
}

- (NSArray)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)subcredentialIdentifier
{
  return self->_subcredentialIdentifier;
}

- (void)setSubcredentialIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_visibility, 0);
  objc_storeStrong((id *)&self->_manageability, 0);
  objc_storeStrong((id *)&self->_shareability, 0);
  objc_storeStrong((id *)&self->_activeCapabilityRole, 0);
  objc_storeStrong((id *)&self->_activeVisibility, 0);
  objc_storeStrong((id *)&self->_activeManageability, 0);
  objc_storeStrong((id *)&self->_activeShareability, 0);
  objc_storeStrong((id *)&self->_templateFields, 0);
  objc_storeStrong((id *)&self->_entitlementTemplate, 0);
  objc_storeStrong((id *)&self->_timeConfiguration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rawRoles, 0);
}

@end