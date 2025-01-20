@interface PDNotificationService
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNotificationService:(id)a3;
- (NSDate)lastUpdatedDate;
- (NSDate)lastUpdatedTagDate;
- (NSString)appLaunchToken;
- (NSString)authenticationToken;
- (NSString)deviceIdentifier;
- (NSString)lastUpdatedTag;
- (NSString)pushToken;
- (NSString)pushTopic;
- (NSURL)registrationURL;
- (NSURL)serviceURL;
- (PDNotificationService)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)serviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setAppLaunchToken:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setLastUpdatedTag:(id)a3;
- (void)setLastUpdatedTagDate:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setPushTopic:(id)a3;
- (void)setRegistrationURL:(id)a3;
- (void)setServiceType:(unint64_t)a3;
- (void)setServiceURL:(id)a3;
@end

@implementation PDNotificationService

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (id v5 = -[PDNotificationService serviceType](self, "serviceType"), v5 == [v4 serviceType]))
  {
    v6 = [(PDNotificationService *)self serviceURL];
    v7 = [v4 serviceURL];
    if (PKEqualObjects())
    {
      v8 = [(PDNotificationService *)self registrationURL];
      v9 = [v4 registrationURL];
      if (PKEqualObjects())
      {
        v10 = [(PDNotificationService *)self pushTopic];
        v11 = [v4 pushTopic];
        if (PKEqualObjects())
        {
          v12 = [(PDNotificationService *)self pushToken];
          v13 = [v4 pushToken];
          if (PKEqualObjects())
          {
            v31 = v12;
            uint64_t v14 = [(PDNotificationService *)self authenticationToken];
            v32 = [v4 authenticationToken];
            v33 = (void *)v14;
            if (PKEqualObjects())
            {
              uint64_t v15 = [(PDNotificationService *)self appLaunchToken];
              v29 = [v4 appLaunchToken];
              v30 = (void *)v15;
              if (PKEqualObjects())
              {
                uint64_t v16 = [(PDNotificationService *)self deviceIdentifier];
                v27 = [v4 deviceIdentifier];
                v28 = (void *)v16;
                if (PKEqualObjects())
                {
                  uint64_t v17 = [(PDNotificationService *)self lastUpdatedDate];
                  v25 = [v4 lastUpdatedDate];
                  v26 = (void *)v17;
                  if (PKEqualObjects())
                  {
                    uint64_t v18 = [(PDNotificationService *)self lastUpdatedTag];
                    v23 = [v4 lastUpdatedTag];
                    v24 = (void *)v18;
                    if (PKEqualObjects())
                    {
                      v19 = [(PDNotificationService *)self lastUpdatedTagDate];
                      v22 = [v4 lastUpdatedTagDate];
                      char v20 = PKEqualObjects();
                    }
                    else
                    {
                      char v20 = 0;
                    }
                    v12 = v31;
                  }
                  else
                  {
                    char v20 = 0;
                    v12 = v31;
                  }
                }
                else
                {
                  char v20 = 0;
                  v12 = v31;
                }
              }
              else
              {
                char v20 = 0;
                v12 = v31;
              }
            }
            else
            {
              char v20 = 0;
              v12 = v31;
            }
          }
          else
          {
            char v20 = 0;
          }
        }
        else
        {
          char v20 = 0;
        }
      }
      else
      {
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (BOOL)matchesNotificationService:(id)a3
{
  id v4 = a3;
  id v5 = [(PDNotificationService *)self serviceType];
  if (v5 == [v4 serviceType])
  {
    v6 = [(PDNotificationService *)self serviceURL];
    v7 = [v4 serviceURL];
    if (PKEqualObjects())
    {
      v8 = [(PDNotificationService *)self registrationURL];
      v9 = [v4 registrationURL];
      if (PKEqualObjects())
      {
        v10 = [(PDNotificationService *)self pushTopic];
        v11 = [v4 pushTopic];
        char v12 = PKEqualObjects();
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = [(PDNotificationService *)self serviceType];
  id v4 = @"Message";
  if (!v3) {
    id v4 = @"Transaction";
  }
  id v5 = v4;
  v6 = [(PDNotificationService *)self serviceURL];
  v7 = [(PDNotificationService *)self registrationURL];
  v8 = +[NSString stringWithFormat:@"Service Type: %@, Service URL: %@, Registration URL: %@", v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationService)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PDNotificationService;
  id v5 = [(PDNotificationService *)&v27 init];
  if (v5)
  {
    v5->_serviceType = (unint64_t)[v4 decodeIntegerForKey:@"serviceType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceURL"];
    serviceURL = v5->_serviceURL;
    v5->_serviceURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registrationURL"];
    registrationURL = v5->_registrationURL;
    v5->_registrationURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushTopic"];
    pushTopic = v5->_pushTopic;
    v5->_pushTopic = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushToken"];
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationToken"];
    authenticationToken = v5->_authenticationToken;
    v5->_authenticationToken = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appLaunchToken"];
    appLaunchToken = v5->_appLaunchToken;
    v5->_appLaunchToken = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedTag"];
    lastUpdatedTag = v5->_lastUpdatedTag;
    v5->_lastUpdatedTag = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedTagDate"];
    lastUpdatedTagDate = v5->_lastUpdatedTagDate;
    v5->_lastUpdatedTagDate = (NSDate *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t serviceType = self->_serviceType;
  id v5 = a3;
  [v5 encodeInteger:serviceType forKey:@"serviceType"];
  [v5 encodeObject:self->_serviceURL forKey:@"serviceURL"];
  [v5 encodeObject:self->_registrationURL forKey:@"registrationURL"];
  [v5 encodeObject:self->_pushTopic forKey:@"pushTopic"];
  [v5 encodeObject:self->_pushToken forKey:@"pushToken"];
  [v5 encodeObject:self->_authenticationToken forKey:@"authenticationToken"];
  [v5 encodeObject:self->_appLaunchToken forKey:@"appLaunchToken"];
  [v5 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v5 encodeObject:self->_lastUpdatedDate forKey:@"lastUpdatedDate"];
  [v5 encodeObject:self->_lastUpdatedTag forKey:@"lastUpdatedTag"];
  [v5 encodeObject:self->_lastUpdatedTagDate forKey:@"lastUpdatedTagDate"];
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unint64_t)a3
{
  self->_unint64_t serviceType = a3;
}

- (NSURL)serviceURL
{
  return self->_serviceURL;
}

- (void)setServiceURL:(id)a3
{
}

- (NSURL)registrationURL
{
  return self->_registrationURL;
}

- (void)setRegistrationURL:(id)a3
{
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (NSString)appLaunchToken
{
  return self->_appLaunchToken;
}

- (void)setAppLaunchToken:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (void)setLastUpdatedTag:(id)a3
{
}

- (NSDate)lastUpdatedTagDate
{
  return self->_lastUpdatedTagDate;
}

- (void)setLastUpdatedTagDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedTagDate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTag, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_appLaunchToken, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
  objc_storeStrong((id *)&self->_registrationURL, 0);
  objc_storeStrong((id *)&self->_serviceURL, 0);
}

@end