@interface PDNotificationServiceSpecificRegistrationTask
+ (BOOL)supportsSecureCoding;
+ (id)deregisterTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4;
+ (id)registerTaskWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 dpanIdentifier:(id)a8 completionTask:(id)a9;
- (BOOL)isValid;
- (BOOL)matchesTask:(id)a3;
- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4;
- (NSString)dpanIdentifier;
- (PDNotificationServiceSpecificRegistrationTask)initWithCoder:(id)a3;
- (PDNotificationServiceSpecificRegistrationTask)initWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 dpanIdentifier:(id)a8 requestedStatus:(unint64_t)a9 completionTask:(id)a10;
- (id)description;
- (id)endpointComponents;
- (int64_t)actionForInactiveTask:(id)a3;
- (int64_t)taskType;
- (void)encodeWithCoder:(id)a3;
- (void)setDPANIdentifier:(id)a3;
@end

@implementation PDNotificationServiceSpecificRegistrationTask

+ (id)registerTaskWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 dpanIdentifier:(id)a8 completionTask:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = [objc_alloc((Class)a1) initWithNotificationService:v21 registrationData:v20 signature:v19 certificates:v18 certificateVersion:a7 dpanIdentifier:v17 requestedStatus:1 completionTask:v16];

  return v22;
}

+ (id)deregisterTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithNotificationService:v7 registrationData:0 signature:0 certificates:0 certificateVersion:0 dpanIdentifier:v6 requestedStatus:2 completionTask:0];

  return v8;
}

- (PDNotificationServiceSpecificRegistrationTask)initWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 dpanIdentifier:(id)a8 requestedStatus:(unint64_t)a9 completionTask:(id)a10
{
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)PDNotificationServiceSpecificRegistrationTask;
  id v18 = [(PDNotificationServiceRegistrationTask *)&v21 initWithNotificationService:a3 registrationData:a4 signature:a5 certificates:a6 certificateVersion:a7 requestedStatus:a9 completionTask:a10];
  id v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_dpanIdentifier, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceSpecificRegistrationTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDNotificationServiceSpecificRegistrationTask;
  v5 = [(PDNotificationServiceRegistrationTask *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpanIdentifier"];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDNotificationServiceSpecificRegistrationTask;
  id v4 = a3;
  [(PDNotificationServiceRegistrationTask *)&v6 encodeWithCoder:v4];
  v5 = [(PDNotificationServiceSpecificRegistrationTask *)self dpanIdentifier];
  [v4 encodeObject:v5 forKey:@"dpanIdentifier"];
}

- (BOOL)isValid
{
  v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 deviceIdentifier];

  v5 = [(PDNotificationServiceSpecificRegistrationTask *)self dpanIdentifier];
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
  return 1;
}

- (id)endpointComponents
{
  v3 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v4 = [v3 deviceIdentifier];

  uint64_t v5 = [(PDNotificationServiceSpecificRegistrationTask *)self dpanIdentifier];
  BOOL v6 = (void *)v5;
  BOOL v7 = 0;
  if (v4 && v5)
  {
    v9[0] = @"devices";
    v9[1] = v4;
    v9[2] = @"registrations";
    v9[3] = @"dpan";
    v9[4] = v5;
    BOOL v7 = +[NSArray arrayWithObjects:v9 count:5];
  }

  return v7;
}

- (id)description
{
  if ((id)[(PDNotificationServiceRegistrationTask *)self requestedStatus] == (id)1) {
    CFStringRef v3 = @"Register";
  }
  else {
    CFStringRef v3 = @"Unregister";
  }
  id v4 = [(PDNotificationServiceConnectionTask *)self notificationService];
  if ([v4 serviceType]) {
    CFStringRef v5 = @"Messages";
  }
  else {
    CFStringRef v5 = @"Transactions";
  }
  BOOL v6 = [(PDNotificationServiceConnectionTask *)self notificationService];
  BOOL v7 = [v6 deviceIdentifier];
  id v8 = [(PDNotificationServiceSpecificRegistrationTask *)self dpanIdentifier];
  objc_super v9 = [(PDNotificationServiceConnectionTask *)self notificationService];
  v10 = [v9 serviceURL];
  v11 = [(PDNotificationServiceConnectionTask *)self notificationService];
  v12 = [v11 registrationURL];
  v13 = +[NSString stringWithFormat:@"%@ %@ Task (Device ID: %@, DPAN ID: %@, Service URL: %@, Registration URL: %@)", v3, v5, v7, v8, v10, v12];

  return v13;
}

- (int64_t)actionForInactiveTask:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PDNotificationServiceSpecificRegistrationTask;
  int64_t v5 = [(PDNotificationServiceRegistrationTask *)&v8 actionForInactiveTask:v4];
  if (sub_100302700(self, v4))
  {
    uint64_t v6 = objc_opt_class();
    if (v6 == objc_opt_class()
      && (id)[(PDNotificationServiceRegistrationTask *)self requestedStatus] == (id)2)
    {
      int64_t v5 = 5;
    }
  }

  return v5;
}

- (BOOL)matchesTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDNotificationServiceSpecificRegistrationTask;
  if ([(PDNotificationServiceRegistrationTask *)&v9 matchesTask:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v5 = [v4 dpanIdentifier];
    uint64_t v6 = [(PDNotificationServiceSpecificRegistrationTask *)self dpanIdentifier];
    unsigned __int8 v7 = [v6 isEqualToString:v5];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(PDNotificationServiceConnectionTask *)self notificationService];
  unsigned int v9 = [v8 isEqual:v7];

  if (v9)
  {
    v10 = [(PDNotificationServiceSpecificRegistrationTask *)self dpanIdentifier];
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

- (void).cxx_destruct
{
}

@end