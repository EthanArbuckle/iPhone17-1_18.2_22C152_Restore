@interface PKDiscoveryEngagementMessageAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)actionInfo;
- (NSString)localizedTitle;
- (NSString)titleKey;
- (PKDiscoveryEngagementMessageAction)initWithCoder:(id)a3;
- (PKDiscoveryEngagementMessageAction)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)localizeWithBundle:(id)a3;
- (void)setActionInfo:(id)a3;
- (void)setTitleKey:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKDiscoveryEngagementMessageAction

- (PKDiscoveryEngagementMessageAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDiscoveryEngagementMessageAction;
  v5 = [(PKDiscoveryEngagementMessageAction *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"titleKey"];
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    id v8 = [v4 PKStringForKey:@"type"];
    if ([@"passDetails" isEqualToString:v8])
    {
      uint64_t v9 = 1;
    }
    else if ([@"openURL" isEqualToString:v8])
    {
      uint64_t v9 = 2;
    }
    else if ([@"cardNumbers" isEqualToString:v8])
    {
      uint64_t v9 = 3;
    }
    else if ([@"setDefaultWallet" isEqualToString:v8])
    {
      uint64_t v9 = 4;
    }
    else if ([@"setDefaultApple" isEqualToString:v8])
    {
      uint64_t v9 = 5;
    }
    else if ([@"setDefaultWalletAndApple" isEqualToString:v8])
    {
      uint64_t v9 = 6;
    }
    else
    {
      uint64_t v9 = 0;
    }

    v5->_type = v9;
    uint64_t v10 = [v4 PKDictionaryForKey:@"actionInfo"];
    actionInfo = v5->_actionInfo;
    v5->_actionInfo = (NSDictionary *)v10;
  }
  return v5;
}

- (void)localizeWithBundle:(id)a3
{
  id v4 = [a3 localizedStringForKey:self->_titleKey value:&stru_1EE0F5368 table:@"localizable"];
  localizedTitle = self->_localizedTitle;
  self->_localizedTitle = v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiscoveryEngagementMessageAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDiscoveryEngagementMessageAction;
  v5 = [(PKDiscoveryEngagementMessageAction *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleKey"];
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"actionInfo"];
    actionInfo = v5->_actionInfo;
    v5->_actionInfo = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  titleKey = self->_titleKey;
  id v5 = a3;
  [v5 encodeObject:titleKey forKey:@"titleKey"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_actionInfo forKey:@"actionInfo"];
  [v5 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKDiscoveryEngagementMessageAction allocWithZone:](PKDiscoveryEngagementMessageAction, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_titleKey copyWithZone:a3];
  titleKey = v5->_titleKey;
  v5->_titleKey = (NSString *)v6;

  v5->_type = self->_type;
  uint64_t v8 = [(NSDictionary *)self->_actionInfo copyWithZone:a3];
  actionInfo = v5->_actionInfo;
  v5->_actionInfo = (NSDictionary *)v8;

  uint64_t v10 = [(NSString *)self->_localizedTitle copyWithZone:a3];
  localizedTitle = v5->_localizedTitle;
  v5->_localizedTitle = (NSString *)v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  titleKey = self->_titleKey;
  uint64_t v6 = (NSString *)v4[1];
  if (titleKey && v6)
  {
    if ((-[NSString isEqual:](titleKey, "isEqual:") & 1) == 0) {
      goto LABEL_15;
    }
  }
  else if (titleKey != v6)
  {
    goto LABEL_15;
  }
  if (self->_type != v4[2]) {
    goto LABEL_15;
  }
  actionInfo = self->_actionInfo;
  uint64_t v8 = (NSDictionary *)v4[3];
  if (!actionInfo || !v8)
  {
    if (actionInfo == v8) {
      goto LABEL_11;
    }
LABEL_15:
    char v11 = 0;
    goto LABEL_16;
  }
  if ((-[NSDictionary isEqual:](actionInfo, "isEqual:") & 1) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  localizedTitle = self->_localizedTitle;
  uint64_t v10 = (NSString *)v4[4];
  if (localizedTitle && v10) {
    char v11 = -[NSString isEqual:](localizedTitle, "isEqual:");
  }
  else {
    char v11 = localizedTitle == v10;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_titleKey];
  [v3 safelyAddObject:self->_actionInfo];
  [v3 safelyAddObject:self->_localizedTitle];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"titleKey: '%@'; ", self->_titleKey];
  objc_msgSend(v3, "appendFormat:", @"type: '%ld'; ", self->_type);
  [v3 appendFormat:@"actionInfo: '%@'; ", self->_actionInfo];
  [v3 appendFormat:@"title: '%@'; ", self->_localizedTitle];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDictionary)actionInfo
{
  return self->_actionInfo;
}

- (void)setActionInfo:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_actionInfo, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
}

@end