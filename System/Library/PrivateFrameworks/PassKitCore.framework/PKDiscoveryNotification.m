@interface PKDiscoveryNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isDelivered;
- (BOOL)isEqualForDisplayToNotification:(id)a3;
- (NSDate)scheduledDeliveryDate;
- (NSDictionary)actionInfo;
- (NSString)actionTitleKey;
- (NSString)discoveryCardIdentifier;
- (NSString)localizedActionTitle;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
- (NSString)messageKey;
- (NSString)titleKey;
- (NSURL)url;
- (PKDiscoveryNotification)initWithCoder:(id)a3;
- (PKDiscoveryNotification)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)actionType;
- (int64_t)passQualifier;
- (void)encodeWithCoder:(id)a3;
- (void)localizeWithBundle:(id)a3;
- (void)scheduleDeliveryForCurrentDate:(id)a3;
- (void)setActionInfo:(id)a3;
- (void)setActionTitleKey:(id)a3;
- (void)setActionType:(int64_t)a3;
- (void)setDelivered:(BOOL)a3;
- (void)setMessageKey:(id)a3;
- (void)setScheduledDeliveryDate:(id)a3;
- (void)setTitleKey:(id)a3;
- (void)updateForRuleResult:(BOOL)a3;
- (void)updateWithNotification:(id)a3;
@end

@implementation PKDiscoveryNotification

- (PKDiscoveryNotification)initWithDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKDiscoveryNotification;
  v5 = [(PKDiscoveryObject *)&v27 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_16;
  }
  v6 = [v4 PKStringForKey:@"action"];
  if ([@"none" isEqualToString:v6])
  {
    uint64_t v7 = 1;
  }
  else if ([@"pass" isEqualToString:v6])
  {
    uint64_t v7 = 2;
  }
  else if ([@"passDetails" isEqualToString:v6])
  {
    uint64_t v7 = 3;
  }
  else if ([@"openURL" isEqualToString:v6])
  {
    uint64_t v7 = 4;
  }
  else
  {
    if (([@"discoveryCard" isEqualToString:v6] & 1) == 0)
    {

      v5->_actionType = 0;
      v17 = PKLogFacilityTypeGetObject(0x10uLL);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v29 = v26;
      __int16 v30 = 2112;
      v31 = v6;
      v22 = v26;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "%@: Unknown action type in initWithDictionary: %@", buf, 0x16u);
LABEL_19:

LABEL_20:
      v21 = 0;
      goto LABEL_21;
    }
    uint64_t v7 = 5;
  }

  v5->_actionType = v7;
  uint64_t v8 = [v4 PKStringForKey:@"titleKey"];
  titleKey = v5->_titleKey;
  v5->_titleKey = (NSString *)v8;

  uint64_t v10 = [v4 PKStringForKey:@"messageKey"];
  messageKey = v5->_messageKey;
  v5->_messageKey = (NSString *)v10;

  uint64_t v12 = [v4 PKStringForKey:@"actionTitleKey"];
  actionTitleKey = v5->_actionTitleKey;
  v5->_actionTitleKey = (NSString *)v12;

  uint64_t v14 = [v4 PKDictionaryForKey:@"actionInfo"];
  actionInfo = v5->_actionInfo;
  v5->_actionInfo = (NSDictionary *)v14;

  v16 = [(PKDiscoveryObject *)v5 relevantDateRange];
  v17 = v16;
  if (!v16
    || ([v16 startDate], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v19 = (void *)v18,
        [v17 endDate],
        v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        !v20))
  {
    v22 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      __int16 v30 = 2112;
      v31 = v5;
      id v24 = v23;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "%@: Invalid PKDiscoveryNotification doesn't have relevant date range: %@", buf, 0x16u);
    }
    goto LABEL_19;
  }

LABEL_16:
  v21 = v5;
LABEL_21:

  return v21;
}

- (int64_t)passQualifier
{
  v2 = [(NSDictionary *)self->_actionInfo PKStringForKey:@"passQualifier"];
  v3 = v2;
  if (v2) {
    int64_t v4 = PKDiscoveryPassQualifierFromString(v2);
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (NSURL)url
{
  return (NSURL *)[(NSDictionary *)self->_actionInfo PKURLForKey:@"url"];
}

- (NSString)discoveryCardIdentifier
{
  return (NSString *)[(NSDictionary *)self->_actionInfo PKStringForKey:@"discoveryCardIdentifier"];
}

- (void)localizeWithBundle:(id)a3
{
  titleKey = self->_titleKey;
  id v5 = a3;
  v6 = [v5 localizedStringForKey:titleKey value:&stru_1EE0F5368 table:@"localizable"];
  localizedTitle = self->_localizedTitle;
  self->_localizedTitle = v6;

  uint64_t v8 = [v5 localizedStringForKey:self->_messageKey value:&stru_1EE0F5368 table:@"localizable"];
  localizedMessage = self->_localizedMessage;
  self->_localizedMessage = v8;

  uint64_t v10 = [v5 localizedStringForKey:self->_actionTitleKey value:&stru_1EE0F5368 table:@"localizable"];

  localizedActionTitle = self->_localizedActionTitle;
  self->_localizedActionTitle = v10;
}

- (void)updateWithNotification:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKDiscoveryNotification;
  if ([(PKDiscoveryObject *)&v23 updateWithDiscoveryObject:v4])
  {
    self->_actionType = [v4 actionType];
    id v5 = [v4 titleKey];
    titleKey = self->_titleKey;
    self->_titleKey = v5;

    uint64_t v7 = [v4 messageKey];
    messageKey = self->_messageKey;
    self->_messageKey = v7;

    v9 = [v4 actionTitleKey];
    actionTitleKey = self->_actionTitleKey;
    self->_actionTitleKey = v9;

    v11 = [v4 actionInfo];
    uint64_t v12 = (NSDictionary *)[v11 copy];
    actionInfo = self->_actionInfo;
    self->_actionInfo = v12;

    uint64_t v14 = [(PKDiscoveryObject *)self relevantDateRange];
    v15 = v14;
    if (!v14
      || ([v14 startDate], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v17 = (void *)v16,
          [v15 endDate],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          v18,
          v17,
          !v18))
    {
      v19 = PKLogFacilityTypeGetObject(0x10uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v25 = v20;
        __int16 v26 = 2112;
        objc_super v27 = self;
        id v21 = v20;
        _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "%@: Invalid PKDiscoveryNotification doesn't have relevant date range: %@", buf, 0x16u);
      }
    }
    if (!self->_delivered && self->_scheduledDeliveryDate && (objc_msgSend(v15, "isValidForTime:") & 1) == 0)
    {
      scheduledDeliveryDate = self->_scheduledDeliveryDate;
      self->_scheduledDeliveryDate = 0;
    }
  }
}

- (void)scheduleDeliveryForCurrentDate:(id)a3
{
  id v4 = a3;
  id v15 = [(PKDiscoveryObject *)self relevantDateRange];
  id v5 = [v15 startDate];
  if ([v4 compare:v5] == 1) {
    v6 = v4;
  }
  else {
    v6 = v5;
  }
  id v7 = v6;
  uint64_t v8 = [v15 endDate];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [v7 timeIntervalSinceReferenceDate];
  double v12 = v10 - v11;

  v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v7 sinceDate:(double)arc4random_uniform(v12)];

  scheduledDeliveryDate = self->_scheduledDeliveryDate;
  self->_scheduledDeliveryDate = v13;
}

- (void)updateForRuleResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(PKDiscoveryObject *)self isTerminalStatus])
  {
    id v5 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(PKDiscoveryObject *)self identifier];
      int v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Discovery Notification with identifier: %@ is in terminal state and won't be updated based on rule result", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v3)
    {
      uint64_t v7 = 2;
    }
    else
    {
      [(PKDiscoveryNotification *)self setScheduledDeliveryDate:0];
      uint64_t v7 = 6;
    }
    uint64_t v8 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = [(PKDiscoveryObject *)self identifier];
      int64_t v10 = [(PKDiscoveryObject *)self status];
      double v11 = "NO";
      int v12 = 138413058;
      v13 = v9;
      __int16 v14 = 2048;
      if (v3) {
        double v11 = "YES";
      }
      int64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Updating status of Discovery Notification with identifier: %@ from %ld to %ld for result %s", (uint8_t *)&v12, 0x2Au);
    }
    [(PKDiscoveryObject *)self setStatus:v7];
  }
}

- (BOOL)isEqualForDisplayToNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDiscoveryObject *)self identifier];
  v6 = [v4 identifier];
  if ([v5 isEqualToString:v6]
    && (int64_t v7 = -[PKDiscoveryObject version](self, "version"), v7 == [v4 version])
    && (int64_t actionType = self->_actionType, actionType == [v4 actionType]))
  {
    actionInfo = self->_actionInfo;
    int64_t v10 = [v4 actionInfo];
    if ([(NSDictionary *)actionInfo isEqualToDictionary:v10])
    {
      localizedTitle = self->_localizedTitle;
      int v12 = [v4 localizedTitle];
      if ([(NSString *)localizedTitle isEqualToString:v12])
      {
        localizedMessage = self->_localizedMessage;
        __int16 v14 = [v4 localizedMessage];
        if ([(NSString *)localizedMessage isEqualToString:v14])
        {
          localizedActionTitle = self->_localizedActionTitle;
          __int16 v16 = [v4 localizedActionTitle];
          BOOL v17 = [(NSString *)localizedActionTitle isEqualToString:v16];
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiscoveryNotification)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKDiscoveryNotification;
  id v5 = [(PKDiscoveryObject *)&v26 initWithCoder:v4];
  if (v5)
  {
    v5->_int64_t actionType = (int)[v4 decodeIntForKey:@"action"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleKey"];
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageKey"];
    messageKey = v5->_messageKey;
    v5->_messageKey = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionTitleKey"];
    actionTitleKey = v5->_actionTitleKey;
    v5->_actionTitleKey = (NSString *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    __int16 v14 = (void *)[v12 initWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"actionInfo"];
    actionInfo = v5->_actionInfo;
    v5->_actionInfo = (NSDictionary *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheduledDeliveryDate"];
    scheduledDeliveryDate = v5->_scheduledDeliveryDate;
    v5->_scheduledDeliveryDate = (NSDate *)v17;

    v5->_delivered = [v4 decodeBoolForKey:@"delivered"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedMessage"];
    localizedMessage = v5->_localizedMessage;
    v5->_localizedMessage = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedActionTitle"];
    localizedActionTitle = v5->_localizedActionTitle;
    v5->_localizedActionTitle = (NSString *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryNotification;
  id v4 = a3;
  [(PKDiscoveryObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_actionType, @"action", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_titleKey forKey:@"titleKey"];
  [v4 encodeObject:self->_messageKey forKey:@"messageKey"];
  [v4 encodeObject:self->_actionTitleKey forKey:@"actionTitleKey"];
  [v4 encodeObject:self->_actionInfo forKey:@"actionInfo"];
  [v4 encodeObject:self->_scheduledDeliveryDate forKey:@"delivered"];
  [v4 encodeBool:self->_delivered forKey:@"delivered"];
  [v4 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v4 encodeObject:self->_localizedMessage forKey:@"localizedMessage"];
  [v4 encodeObject:self->_localizedActionTitle forKey:@"localizedActionTitle"];
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryNotification;
  id v4 = [(PKDiscoveryObject *)&v9 description];
  [v3 appendFormat:@" %@ ", v4];

  unint64_t v5 = self->_actionType - 1;
  if (v5 > 4) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_1E56DDB68[v5];
  }
  [v3 appendFormat:@"%@: '%@'; ", @"action", v6];
  [v3 appendFormat:@"%@: '%@'; ", @"titleKey", self->_titleKey];
  [v3 appendFormat:@"%@: '%@'; ", @"messageKey", self->_messageKey];
  [v3 appendFormat:@"%@: '%@'; ", @"actionTitleKey", self->_actionTitleKey];
  [v3 appendFormat:@"%@: '%@'; ", @"actionInfo", self->_actionInfo];
  [v3 appendFormat:@"%@: '%@'; ", @"scheduledDeliveryDate", self->_scheduledDeliveryDate];
  if (self->_delivered) {
    int64_t v7 = @"YES";
  }
  else {
    int64_t v7 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"delivered", v7];
  [v3 appendFormat:@"%@: '%@'; ", @"localizedTitle", self->_localizedTitle];
  [v3 appendFormat:@"%@: '%@'; ", @"localizedMessage", self->_localizedMessage];
  [v3 appendFormat:@"%@: '%@'; ", @"localizedActionTitle", self->_localizedActionTitle];
  [v3 appendFormat:@">"];
  return v3;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_int64_t actionType = a3;
}

- (NSDictionary)actionInfo
{
  return self->_actionInfo;
}

- (void)setActionInfo:(id)a3
{
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

- (NSString)actionTitleKey
{
  return self->_actionTitleKey;
}

- (void)setActionTitleKey:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (NSString)localizedActionTitle
{
  return self->_localizedActionTitle;
}

- (NSDate)scheduledDeliveryDate
{
  return self->_scheduledDeliveryDate;
}

- (void)setScheduledDeliveryDate:(id)a3
{
}

- (BOOL)isDelivered
{
  return self->_delivered;
}

- (void)setDelivered:(BOOL)a3
{
  self->_delivered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledDeliveryDate, 0);
  objc_storeStrong((id *)&self->_localizedActionTitle, 0);
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_actionTitleKey, 0);
  objc_storeStrong((id *)&self->_messageKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_actionInfo, 0);
}

@end