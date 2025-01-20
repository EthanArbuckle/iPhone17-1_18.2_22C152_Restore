@interface PKPaymentPassActionGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)hasRemoteContent;
- (BOOL)remoteContentRequiresAppletData;
- (NSArray)actionIdentifiers;
- (NSArray)actions;
- (NSDictionary)appletData;
- (NSString)actionGroupDescription;
- (NSString)identifier;
- (NSString)title;
- (PKPaymentPassActionGroup)initWithCoder:(id)a3;
- (PKPaymentPassActionGroup)initWithDictionary:(id)a3 localizations:(id)a4;
- (PKPaymentPassActionRemoteConfiguration)remoteContentConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActionGroupDescription:(id)a3;
- (void)setActionIdentifiers:(id)a3;
- (void)setActions:(id)a3;
- (void)setAppletData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPaymentPassActionGroup

- (PKPaymentPassActionGroup)initWithDictionary:(id)a3 localizations:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)PKPaymentPassActionGroup;
  v8 = [(PKPaymentPassActionGroup *)&v50 init];
  if (v8)
  {
    v9 = [v6 PKStringForKey:@"identifier"];
    uint64_t v10 = [v9 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    v12 = [v6 PKStringForKey:@"title"];
    uint64_t v13 = [v12 copy];
    title = v8->_title;
    v8->_title = (NSString *)v13;

    v15 = [v6 PKStringForKey:@"description"];
    uint64_t v16 = [v15 copy];
    actionGroupDescription = v8->_actionGroupDescription;
    v8->_actionGroupDescription = (NSString *)v16;

    v18 = [v6 PKArrayContaining:objc_opt_class() forKey:@"actionIdentifiers"];
    uint64_t v19 = [v18 copy];
    actionIdentifiers = v8->_actionIdentifiers;
    v8->_actionIdentifiers = (NSArray *)v19;

    v21 = [PKPaymentPassActionRemoteConfiguration alloc];
    v22 = [v6 PKDictionaryForKey:@"remoteContentConfiguration"];
    uint64_t v23 = [(PKPaymentPassActionRemoteConfiguration *)v21 initWithDictionary:v22];
    remoteContentConfiguration = v8->_remoteContentConfiguration;
    v8->_remoteContentConfiguration = (PKPaymentPassActionRemoteConfiguration *)v23;

    if (!v8->_remoteContentConfiguration && [v6 PKBoolForKey:@"hasRemoteContent"])
    {
      v25 = -[PKPaymentPassActionRemoteConfiguration initWithRequiresAppletData:appletDataRequiresEncryption:]([PKPaymentPassActionRemoteConfiguration alloc], "initWithRequiresAppletData:appletDataRequiresEncryption:", [v6 PKBoolForKey:@"remoteContentRequiresAppletData"], 1);
      v26 = v8->_remoteContentConfiguration;
      v8->_remoteContentConfiguration = v25;
    }
    v27 = [v6 PKArrayContaining:objc_opt_class() forKey:@"actions"];
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v27 count])
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v45 = v27;
      id v29 = v27;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v47;
        do
        {
          uint64_t v33 = 0;
          do
          {
            if (*(void *)v47 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = [[PKPaymentPassAction alloc] initWithDictionary:*(void *)(*((void *)&v46 + 1) + 8 * v33) localizations:v7];
            [v28 safelyAddObject:v34];

            ++v33;
          }
          while (v31 != v33);
          uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v31);
      }

      v27 = v45;
    }
    uint64_t v35 = [v28 copy];
    actions = v8->_actions;
    v8->_actions = (NSArray *)v35;

    v37 = v8->_actionGroupDescription;
    v38 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v39 = [(NSString *)v37 stringByTrimmingCharactersInSet:v38];
    v40 = v39;
    if (!v39 || (uint64_t v41 = [(NSString *)v39 length], v40, !v41))
    {
      uint64_t v42 = [(NSArray *)v8->_actions count];

      if (v42 != 1)
      {
LABEL_19:

        goto LABEL_20;
      }
      v38 = [(NSArray *)v8->_actions firstObject];
      uint64_t v43 = [v38 actionDescription];
      v40 = v8->_actionGroupDescription;
      v8->_actionGroupDescription = (NSString *)v43;
    }

    goto LABEL_19;
  }
LABEL_20:

  return v8;
}

- (BOOL)hasRemoteContent
{
  return self->_remoteContentConfiguration != 0;
}

- (BOOL)remoteContentRequiresAppletData
{
  remoteContentConfiguration = self->_remoteContentConfiguration;
  if (remoteContentConfiguration) {
    LOBYTE(remoteContentConfiguration) = [(PKPaymentPassActionRemoteConfiguration *)remoteContentConfiguration requiresAppletData];
  }
  return (char)remoteContentConfiguration;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_actionGroupDescription forKey:@"description"];
  [v5 encodeObject:self->_actionIdentifiers forKey:@"actionIdentifiers"];
  [v5 encodeObject:self->_actions forKey:@"actions"];
  [v5 encodeObject:self->_appletData forKey:@"appletData"];
  [v5 encodeObject:self->_remoteContentConfiguration forKey:@"remoteContentConfiguration"];
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentPassActionGroup hasRemoteContent](self, "hasRemoteContent"), @"hasRemoteContent");
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentPassActionGroup remoteContentRequiresAppletData](self, "remoteContentRequiresAppletData"), @"remoteContentRequiresAppletData");
}

- (PKPaymentPassActionGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PKPaymentPassActionGroup;
  id v5 = [(PKPaymentPassActionGroup *)&v33 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    uint64_t v10 = [v9 copy];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
    uint64_t v13 = [v12 copy];
    actionGroupDescription = v5->_actionGroupDescription;
    v5->_actionGroupDescription = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"actionIdentifiers"];
    uint64_t v19 = [v18 copy];
    actionIdentifiers = v5->_actionIdentifiers;
    v5->_actionIdentifiers = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletData"];
    appletData = v5->_appletData;
    v5->_appletData = (NSDictionary *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteContentConfiguration"];
    remoteContentConfiguration = v5->_remoteContentConfiguration;
    v5->_remoteContentConfiguration = (PKPaymentPassActionRemoteConfiguration *)v28;

    if (!v5->_remoteContentConfiguration)
    {
      if ([v4 decodeBoolForKey:@"hasRemoteContent"])
      {
        uint64_t v30 = -[PKPaymentPassActionRemoteConfiguration initWithRequiresAppletData:appletDataRequiresEncryption:]([PKPaymentPassActionRemoteConfiguration alloc], "initWithRequiresAppletData:appletDataRequiresEncryption:", [v4 decodeBoolForKey:@"remoteContentRequiresAppletData"], 1);
        uint64_t v31 = v5->_remoteContentConfiguration;
        v5->_remoteContentConfiguration = v30;
      }
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_actionGroupDescription copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSArray *)self->_actionIdentifiers copyWithZone:a3];
  uint64_t v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSArray *)self->_actions copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(PKPaymentPassActionRemoteConfiguration *)self->_remoteContentConfiguration copyWithZone:a3];
  v17 = (void *)v5[7];
  v5[7] = v16;

  uint64_t v18 = [(NSDictionary *)self->_appletData copyWithZone:a3];
  uint64_t v19 = (void *)v5[6];
  v5[6] = v18;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)actionGroupDescription
{
  return self->_actionGroupDescription;
}

- (void)setActionGroupDescription:(id)a3
{
}

- (NSArray)actionIdentifiers
{
  return self->_actionIdentifiers;
}

- (void)setActionIdentifiers:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSDictionary)appletData
{
  return self->_appletData;
}

- (void)setAppletData:(id)a3
{
}

- (PKPaymentPassActionRemoteConfiguration)remoteContentConfiguration
{
  return self->_remoteContentConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteContentConfiguration, 0);
  objc_storeStrong((id *)&self->_appletData, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_actionIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionGroupDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end