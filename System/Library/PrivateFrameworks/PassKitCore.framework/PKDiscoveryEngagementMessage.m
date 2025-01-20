@interface PKDiscoveryEngagementMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)canReportIdentifierToAggd;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)iconURLs;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
- (NSString)messageKey;
- (NSString)titleKey;
- (PKDiscoveryEngagementMessage)initWithCoder:(id)a3;
- (PKDiscoveryEngagementMessage)initWithDictionary:(id)a3;
- (PKDiscoveryEngagementMessageAction)action;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)passQualifier;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)localizeWithBundle:(id)a3;
- (void)setAction:(id)a3;
- (void)setIconURLs:(id)a3;
- (void)setMessageKey:(id)a3;
- (void)setPassQualifier:(int64_t)a3;
- (void)setReportIdentifierToAggd:(BOOL)a3;
- (void)setTitleKey:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateForRuleResult:(BOOL)a3;
- (void)updateWithDiscoveryEngagementMessage:(id)a3;
@end

@implementation PKDiscoveryEngagementMessage

- (PKDiscoveryEngagementMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKDiscoveryEngagementMessage;
  v5 = [(PKDiscoveryObject *)&v19 initWithDictionary:v4];
  if (v5)
  {
    id v6 = [v4 PKStringForKey:@"type"];
    if ([v6 isEqualToString:@"promotion"])
    {
      uint64_t v7 = 2;
    }
    else if ([v6 isEqualToString:@"feature"])
    {
      uint64_t v7 = 1;
    }
    else if ([v6 isEqualToString:@"welcome"])
    {
      uint64_t v7 = 0;
    }
    else if ([v6 isEqualToString:@"accountStatus"])
    {
      uint64_t v7 = 3;
    }
    else
    {
      uint64_t v7 = 2;
    }

    v5->_type = v7;
    v8 = [v4 PKStringForKey:@"passQualifier"];
    v5->_passQualifier = PKDiscoveryPassQualifierFromString(v8);

    uint64_t v9 = [v4 PKStringForKey:@"titleKey"];
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v9;

    uint64_t v11 = [v4 PKStringForKey:@"messageKey"];
    messageKey = v5->_messageKey;
    v5->_messageKey = (NSString *)v11;

    uint64_t v13 = [v4 PKDictionaryForKey:@"iconURLs"];
    iconURLs = v5->_iconURLs;
    v5->_iconURLs = (NSDictionary *)v13;

    v5->_reportIdentifierToAggd = [v4 PKBoolForKey:@"canReportIdentifier"];
    v15 = [v4 PKDictionaryForKey:@"action"];
    if (v15)
    {
      v16 = [[PKDiscoveryEngagementMessageAction alloc] initWithDictionary:v15];
      action = v5->_action;
      v5->_action = v16;
    }
  }

  return v5;
}

- (void)localizeWithBundle:(id)a3
{
  titleKey = self->_titleKey;
  id v9 = a3;
  v5 = [v9 localizedStringForKey:titleKey value:&stru_1EE0F5368 table:@"localizable"];
  localizedTitle = self->_localizedTitle;
  self->_localizedTitle = v5;

  uint64_t v7 = [v9 localizedStringForKey:self->_messageKey value:&stru_1EE0F5368 table:@"localizable"];
  localizedMessage = self->_localizedMessage;
  self->_localizedMessage = v7;

  [(PKDiscoveryEngagementMessageAction *)self->_action localizeWithBundle:v9];
}

- (void)updateWithDiscoveryEngagementMessage:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDiscoveryEngagementMessage;
  if ([(PKDiscoveryObject *)&v13 updateWithDiscoveryObject:v4])
  {
    self->_type = [v4 type];
    self->_passQualifier = [v4 passQualifier];
    v5 = [v4 titleKey];
    titleKey = self->_titleKey;
    self->_titleKey = v5;

    uint64_t v7 = [v4 messageKey];
    messageKey = self->_messageKey;
    self->_messageKey = v7;

    id v9 = [v4 iconURLs];
    iconURLs = self->_iconURLs;
    self->_iconURLs = v9;

    uint64_t v11 = [v4 action];
    action = self->_action;
    self->_action = v11;

    self->_reportIdentifierToAggd = [v4 canReportIdentifierToAggd];
  }
}

- (void)updateForRuleResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(PKDiscoveryObject *)self isTerminalStatus])
  {
    v5 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(PKDiscoveryObject *)self identifier];
      int v12 = 138412290;
      objc_super v13 = v6;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Discovery Message with identifier: %@ is in terminal state and won't be updated based on rule result", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v3) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 6;
    }
    v8 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(PKDiscoveryObject *)self identifier];
      int64_t v10 = [(PKDiscoveryObject *)self status];
      uint64_t v11 = "NO";
      int v12 = 138413058;
      objc_super v13 = v9;
      __int16 v14 = 2048;
      if (v3) {
        uint64_t v11 = "YES";
      }
      int64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      objc_super v19 = v11;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Updating status of Discovery Message with identifier: %@ from %ld to %ld for result %s", (uint8_t *)&v12, 0x2Au);
    }
    [(PKDiscoveryObject *)self setStatus:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiscoveryEngagementMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKDiscoveryEngagementMessage;
  v5 = [(PKDiscoveryObject *)&v22 initWithCoder:v4];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_passQualifier = [v4 decodeIntegerForKey:@"passQualifier"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleKey"];
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageKey"];
    messageKey = v5->_messageKey;
    v5->_messageKey = (NSString *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    int v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"iconURLs"];
    iconURLs = v5->_iconURLs;
    v5->_iconURLs = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (PKDiscoveryEngagementMessageAction *)v15;

    v5->_reportIdentifierToAggd = [v4 decodeBoolForKey:@"canReportIdentifier"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedMessage"];
    localizedMessage = v5->_localizedMessage;
    v5->_localizedMessage = (NSString *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryEngagementMessage;
  id v4 = a3;
  [(PKDiscoveryObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_passQualifier forKey:@"passQualifier"];
  [v4 encodeObject:self->_titleKey forKey:@"titleKey"];
  [v4 encodeObject:self->_messageKey forKey:@"messageKey"];
  [v4 encodeObject:self->_iconURLs forKey:@"iconURLs"];
  [v4 encodeObject:self->_action forKey:@"action"];
  [v4 encodeBool:self->_reportIdentifierToAggd forKey:@"canReportIdentifier"];
  [v4 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v4 encodeObject:self->_localizedMessage forKey:@"localizedMessage"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PKDiscoveryEngagementMessage;
  objc_super v5 = -[PKDiscoveryObject copyWithZone:](&v19, sel_copyWithZone_);
  v5[13] = self->_type;
  v5[14] = self->_passQualifier;
  uint64_t v6 = [(NSString *)self->_titleKey copyWithZone:a3];
  uint64_t v7 = (void *)v5[15];
  v5[15] = v6;

  uint64_t v8 = [(NSString *)self->_messageKey copyWithZone:a3];
  id v9 = (void *)v5[16];
  v5[16] = v8;

  uint64_t v10 = [(NSDictionary *)self->_iconURLs copyWithZone:a3];
  uint64_t v11 = (void *)v5[17];
  v5[17] = v10;

  id v12 = [(PKDiscoveryEngagementMessageAction *)self->_action copyWithZone:a3];
  uint64_t v13 = (void *)v5[18];
  v5[18] = v12;

  *((unsigned char *)v5 + 96) = self->_reportIdentifierToAggd;
  uint64_t v14 = [(NSString *)self->_localizedTitle copyWithZone:a3];
  uint64_t v15 = (void *)v5[19];
  v5[19] = v14;

  uint64_t v16 = [(NSString *)self->_localizedMessage copyWithZone:a3];
  uint64_t v17 = (void *)v5[20];
  v5[20] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKDiscoveryEngagementMessage;
  if (![(PKDiscoveryObject *)&v20 isEqual:v4]) {
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_type != v4[13] || self->_passQualifier != v4[14]) {
    goto LABEL_36;
  }
  titleKey = self->_titleKey;
  uint64_t v6 = (NSString *)v4[15];
  if (titleKey) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (titleKey != v6) {
      goto LABEL_36;
    }
  }
  else if ((-[NSString isEqual:](titleKey, "isEqual:") & 1) == 0)
  {
    goto LABEL_36;
  }
  messageKey = self->_messageKey;
  id v9 = (NSString *)v4[16];
  if (messageKey && v9)
  {
    if ((-[NSString isEqual:](messageKey, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (messageKey != v9)
  {
    goto LABEL_36;
  }
  iconURLs = self->_iconURLs;
  uint64_t v11 = (NSDictionary *)v4[17];
  if (iconURLs && v11)
  {
    if ((-[NSDictionary isEqual:](iconURLs, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (iconURLs != v11)
  {
    goto LABEL_36;
  }
  action = self->_action;
  uint64_t v13 = (PKDiscoveryEngagementMessageAction *)v4[18];
  if (action && v13)
  {
    if (!-[PKDiscoveryEngagementMessageAction isEqual:](action, "isEqual:")) {
      goto LABEL_36;
    }
  }
  else if (action != v13)
  {
    goto LABEL_36;
  }
  if (self->_reportIdentifierToAggd != *((unsigned __int8 *)v4 + 96)) {
    goto LABEL_36;
  }
  localizedTitle = self->_localizedTitle;
  uint64_t v15 = (NSString *)v4[19];
  if (!localizedTitle || !v15)
  {
    if (localizedTitle == v15) {
      goto LABEL_32;
    }
LABEL_36:
    char v18 = 0;
    goto LABEL_37;
  }
  if ((-[NSString isEqual:](localizedTitle, "isEqual:") & 1) == 0) {
    goto LABEL_36;
  }
LABEL_32:
  localizedMessage = self->_localizedMessage;
  uint64_t v17 = (NSString *)v4[20];
  if (localizedMessage && v17) {
    char v18 = -[NSString isEqual:](localizedMessage, "isEqual:");
  }
  else {
    char v18 = localizedMessage == v17;
  }
LABEL_37:

  return v18;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)PKDiscoveryEngagementMessage;
  id v3 = [(PKDiscoveryObject *)&v10 hash];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [v4 safelyAddObject:self->_titleKey];
  [v4 safelyAddObject:self->_messageKey];
  [v4 safelyAddObject:self->_iconURLs];
  [v4 safelyAddObject:self->_action];
  [v4 safelyAddObject:self->_localizedTitle];
  [v4 safelyAddObject:self->_localizedMessage];
  uint64_t v5 = PKCombinedHash((uint64_t)v3, v4);
  int64_t v6 = self->_type - v5 + 32 * v5;
  int64_t v7 = self->_passQualifier - v6 + 32 * v6;
  unint64_t v8 = self->_reportIdentifierToAggd - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryEngagementMessage;
  id v4 = [(PKDiscoveryObject *)&v9 description];
  [v3 appendFormat:@" %@ ", v4];

  unint64_t type = self->_type;
  if (type > 3) {
    int64_t v6 = @"unkown";
  }
  else {
    int64_t v6 = off_1E56E0298[type];
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  objc_msgSend(v3, "appendFormat:", @"passQualifier: '%ld'; ", self->_passQualifier);
  [v3 appendFormat:@"titleKey: '%@'; ", self->_titleKey];
  [v3 appendFormat:@"messageKey: '%@'; ", self->_messageKey];
  [v3 appendFormat:@"iconURLs: '%@'; ", self->_iconURLs];
  [v3 appendFormat:@"action: '%@'; ", self->_action];
  [v3 appendFormat:@"title: '%@'; ", self->_localizedTitle];
  [v3 appendFormat:@"message: '%@'; ", self->_localizedMessage];
  if (self->_reportIdentifierToAggd) {
    int64_t v7 = @"YES";
  }
  else {
    int64_t v7 = @"NO";
  }
  [v3 appendFormat:@"canReportIdentifier: '%@'; ", v7];
  [v3 appendFormat:@">"];
  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (int64_t)passQualifier
{
  return self->_passQualifier;
}

- (void)setPassQualifier:(int64_t)a3
{
  self->_passQualifier = a3;
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
}

- (NSString)messageKey
{
  return self->_messageKey;
}

- (void)setMessageKey:(id)a3
{
}

- (NSDictionary)iconURLs
{
  return self->_iconURLs;
}

- (void)setIconURLs:(id)a3
{
}

- (PKDiscoveryEngagementMessageAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)canReportIdentifierToAggd
{
  return self->_reportIdentifierToAggd;
}

- (void)setReportIdentifierToAggd:(BOOL)a3
{
  self->_reportIdentifierToAggd = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_iconURLs, 0);
  objc_storeStrong((id *)&self->_messageKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
}

@end