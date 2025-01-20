@interface PDNotificationServiceGetSpecificUpdatesTask
+ (BOOL)supportsSecureCoding;
+ (id)getSpecificUpdatesTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 credentialType:(int64_t)a5 lastUpdatedTag:(id)a6 accountIdentifier:(id)a7 webServiceConfiguration:(id)a8;
- (BOOL)isValid;
- (BOOL)matchesTask:(id)a3;
- (BOOL)networkForcesDPANEndpoint;
- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4;
- (NSString)dpanIdentifier;
- (NSString)lastUpdatedTag;
- (PDNotificationServiceGetSpecificUpdatesTask)initWithCoder:(id)a3;
- (PDNotificationServiceGetSpecificUpdatesTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 credentialType:(int64_t)a5 lastUpdatedTag:(id)a6 accountIdentifier:(id)a7 webServiceConfiguration:(id)a8;
- (PKPaymentWebServiceConfiguration)webServiceConfiguration;
- (id)description;
- (id)endpointComponents;
- (id)panEndpoint;
- (id)panIdentifierName;
- (id)queryFields;
- (int64_t)credentialType;
- (int64_t)taskType;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentialType:(int64_t)a3;
- (void)setDPANIdentifier:(id)a3;
- (void)setLastUpdatedTag:(id)a3;
- (void)setWebServiceConfiguration:(id)a3;
@end

@implementation PDNotificationServiceGetSpecificUpdatesTask

+ (id)getSpecificUpdatesTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 credentialType:(int64_t)a5 lastUpdatedTag:(id)a6 accountIdentifier:(id)a7 webServiceConfiguration:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  id v19 = [objc_alloc((Class)a1) initWithNotificationService:v18 dpanIdentifier:v17 credentialType:a5 lastUpdatedTag:v16 accountIdentifier:v15 webServiceConfiguration:v14];

  return v19;
}

- (PDNotificationServiceGetSpecificUpdatesTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 credentialType:(int64_t)a5 lastUpdatedTag:(id)a6 accountIdentifier:(id)a7 webServiceConfiguration:(id)a8
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)PDNotificationServiceGetSpecificUpdatesTask;
  id v18 = [(PDNotificationServiceGetUpdatesTask *)&v21 initWithNotificationService:a3 accountIdentifier:a7];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dpanIdentifier, a4);
    v19->_credentialType = a5;
    objc_storeStrong((id *)&v19->_lastUpdatedTag, a6);
    objc_storeStrong((id *)&v19->_webServiceConfiguration, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceGetSpecificUpdatesTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDNotificationServiceGetSpecificUpdatesTask;
  v5 = [(PDNotificationServiceGetUpdatesTask *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpanIdentifier"];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedTag"];
    lastUpdatedTag = v5->_lastUpdatedTag;
    v5->_lastUpdatedTag = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDNotificationServiceGetSpecificUpdatesTask;
  id v4 = a3;
  [(PDNotificationServiceGetUpdatesTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_dpanIdentifier, @"dpanIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_lastUpdatedTag forKey:@"lastUpdatedTag"];
}

- (BOOL)isValid
{
  v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 deviceIdentifier];

  objc_super v5 = [(PDNotificationServiceGetSpecificUpdatesTask *)self dpanIdentifier];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

- (int64_t)taskType
{
  return 2;
}

- (id)queryFields
{
  uint64_t v2 = [(PDNotificationServiceGetSpecificUpdatesTask *)self lastUpdatedTag];
  v3 = (void *)v2;
  if (v2)
  {
    CFStringRef v6 = @"tag";
    uint64_t v7 = v2;
    id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)endpointComponents
{
  v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 deviceIdentifier];

  uint64_t v5 = [(PDNotificationServiceGetSpecificUpdatesTask *)self dpanIdentifier];
  CFStringRef v6 = (void *)v5;
  uint64_t v7 = 0;
  if (v4 && v5)
  {
    uint64_t v8 = [(PDNotificationServiceConnectionTask *)self notificationService];
    id v9 = [v8 serviceType];

    if (v9 == (id)1)
    {
      v10 = @"dpan";
      CFStringRef v11 = @"messages";
    }
    else if (v9)
    {
      CFStringRef v11 = 0;
      v10 = @"dpan";
    }
    else
    {
      v10 = [(PDNotificationServiceGetSpecificUpdatesTask *)self panEndpoint];
      CFStringRef v11 = @"transactions";
    }
    v13[0] = @"devices";
    v13[1] = v4;
    v13[2] = v10;
    v13[3] = v6;
    v13[4] = v11;
    uint64_t v7 = +[NSArray arrayWithObjects:v13 count:5];
  }
  return v7;
}

- (id)panEndpoint
{
  uint64_t v3 = [(PDNotificationServiceGetUpdatesTask *)self accountIdentifier];
  CFStringRef v4 = @"dpan";
  if (v3)
  {
    uint64_t v5 = (void *)v3;
    unsigned int v6 = [(PDNotificationServiceGetSpecificUpdatesTask *)self networkForcesDPANEndpoint];

    if (!v6) {
      return @"pan";
    }
  }
  return (id)v4;
}

- (BOOL)networkForcesDPANEndpoint
{
  uint64_t v3 = [(PKPaymentWebServiceConfiguration *)self->_webServiceConfiguration credentialTypesRequiringDPANNotifications];
  CFStringRef v4 = +[NSString pk_stringWithInteger:self->_credentialType];
  unsigned int v5 = [v3 containsObject:v4];

  if (v5)
  {
    unsigned int v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v3 debugDescription];
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Using /dpan/ endpoint due to config.json override: %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return 0;
}

- (id)panIdentifierName
{
  uint64_t v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 serviceType];

  unsigned int v5 = @"DPAN";
  if (!v4)
  {
    unsigned int v6 = [(PDNotificationServiceGetUpdatesTask *)self accountIdentifier];
    uint64_t v7 = @"PAN";
    if (!v6) {
      uint64_t v7 = @"DPAN";
    }
    unsigned int v5 = v7;
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  if ([v3 serviceType]) {
    CFStringRef v4 = @"Messages";
  }
  else {
    CFStringRef v4 = @"Transactions";
  }
  unsigned int v5 = [(PDNotificationServiceConnectionTask *)self notificationService];
  unsigned int v6 = [v5 deviceIdentifier];
  uint64_t v7 = [(PDNotificationServiceGetSpecificUpdatesTask *)self panIdentifierName];
  uint64_t v8 = [(PDNotificationServiceGetSpecificUpdatesTask *)self dpanIdentifier];
  int v9 = [(PDNotificationServiceConnectionTask *)self notificationService];
  v10 = [v9 serviceURL];
  CFStringRef v11 = [(PDNotificationServiceConnectionTask *)self notificationService];
  v12 = [v11 registrationURL];
  v13 = +[NSString stringWithFormat:@"Get %@ Notifications Task (Device ID: %@, %@ ID: %@, Service URL: %@, Registration URL: %@)", v4, v6, v7, v8, v10, v12];

  return v13;
}

- (BOOL)matchesTask:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDNotificationServiceGetSpecificUpdatesTask;
  if ([(PDNotificationServiceConnectionTask *)&v11 matchesTask:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v5 = [v4 dpanIdentifier];
    unsigned int v6 = [v4 accountIdentifier];
    uint64_t v7 = [(PDNotificationServiceGetSpecificUpdatesTask *)self dpanIdentifier];
    if ([v7 isEqualToString:v5])
    {
      uint64_t v8 = [(PDNotificationServiceGetUpdatesTask *)self accountIdentifier];
      char v9 = PKEqualObjects();
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PDNotificationServiceConnectionTask *)self notificationService];
  unsigned int v9 = [v8 isEqual:v7];

  if (v9)
  {
    v10 = [(PDNotificationServiceGetSpecificUpdatesTask *)self dpanIdentifier];
    unsigned __int8 v11 = [v10 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDPANIdentifier:(id)a3
{
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (void)setLastUpdatedTag:(id)a3
{
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (PKPaymentWebServiceConfiguration)webServiceConfiguration
{
  return self->_webServiceConfiguration;
}

- (void)setWebServiceConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webServiceConfiguration, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTag, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end