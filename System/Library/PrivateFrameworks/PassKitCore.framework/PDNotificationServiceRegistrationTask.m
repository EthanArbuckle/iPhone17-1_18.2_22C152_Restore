@interface PDNotificationServiceRegistrationTask
+ (BOOL)supportsSecureCoding;
+ (id)deregisterTaskWithNotificationService:(id)a3;
+ (id)registerTaskWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 completionTask:(id)a8;
- (BOOL)backoffComplete;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (BOOL)matchesTask:(id)a3;
- (NSDictionary)certificates;
- (NSString)registrationData;
- (NSString)signature;
- (PDNetworkConnectionTask)completionTask;
- (PDNotificationServiceRegistrationTask)initWithCoder:(id)a3;
- (PDNotificationServiceRegistrationTask)initWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 requestedStatus:(unint64_t)a8 completionTask:(id)a9;
- (id)_authenticationTokenFromResponseData:(id)a3;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (int64_t)actionForInactiveTask:(id)a3;
- (int64_t)taskType;
- (unint64_t)certificateVersion;
- (unint64_t)requestedStatus;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setCertificateVersion:(unint64_t)a3;
- (void)setCertificates:(id)a3;
- (void)setCompletionTask:(id)a3;
- (void)setRegistrationData:(id)a3;
- (void)setRequestedStatus:(unint64_t)a3;
- (void)setSignature:(id)a3;
@end

@implementation PDNotificationServiceRegistrationTask

+ (id)registerTaskWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 completionTask:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [objc_alloc((Class)a1) initWithNotificationService:v18 registrationData:v17 signature:v16 certificates:v15 certificateVersion:a7 requestedStatus:1 completionTask:v14];

  return v19;
}

+ (id)deregisterTaskWithNotificationService:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithNotificationService:v4 registrationData:0 signature:0 certificates:0 certificateVersion:0 requestedStatus:2 completionTask:0];

  return v5;
}

- (PDNotificationServiceRegistrationTask)initWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 requestedStatus:(unint64_t)a8 completionTask:(id)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)PDNotificationServiceRegistrationTask;
  id v18 = [(PDNotificationServiceConnectionTask *)&v23 initWithNotificationService:a3];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_registrationData, a4);
    objc_storeStrong((id *)&v19->_signature, a5);
    objc_storeStrong((id *)&v19->_certificates, a6);
    v19->_certificateVersion = a7;
    v19->_requestedStatus = a8;
    objc_storeStrong((id *)&v19->_completionTask, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceRegistrationTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PDNotificationServiceRegistrationTask;
  id v5 = [(PDNotificationServiceConnectionTask *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registrationData"];
    registrationData = v5->_registrationData;
    v5->_registrationData = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completionTask"];
    completionTask = v5->_completionTask;
    v5->_completionTask = (PDNetworkConnectionTask *)v16;

    v5->_requestedStatus = (unint64_t)[v4 decodeIntegerForKey:@"requestedStatus"];
    v5->_certificateVersion = (unint64_t)[v4 decodeIntegerForKey:@"certificateVersion"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDNotificationServiceRegistrationTask;
  id v4 = a3;
  [(PDNotificationServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_registrationData, @"registrationData", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_signature forKey:@"signature"];
  [v4 encodeObject:self->_certificates forKey:@"certificates"];
  [v4 encodeObject:self->_completionTask forKey:@"completionTask"];
  [v4 encodeInteger:self->_requestedStatus forKey:@"requestedStatus"];
  [v4 encodeInteger:self->_certificateVersion forKey:@"certificateVersion"];
}

- (BOOL)isValid
{
  v2 = [(PDNotificationServiceConnectionTask *)self notificationService];
  v3 = [v2 deviceIdentifier];

  return v3 != 0;
}

- (int64_t)taskType
{
  return 1;
}

- (id)method
{
  if ((id)[(PDNotificationServiceRegistrationTask *)self requestedStatus] == (id)1) {
    v2 = @"POST";
  }
  else {
    v2 = @"DELETE";
  }
  return v2;
}

- (id)endpointComponents
{
  v2 = [(PDNotificationServiceConnectionTask *)self notificationService];
  v3 = [v2 deviceIdentifier];

  if (v3)
  {
    v6[0] = @"devices";
    v6[1] = v3;
    v6[2] = @"registrations";
    id v4 = +[NSArray arrayWithObjects:v6 count:3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)bodyDictionary
{
  if ((id)[(PDNotificationServiceRegistrationTask *)self requestedStatus] == (id)1)
  {
    v3 = +[NSMutableDictionary dictionary];
    id v4 = [(PDNotificationServiceRegistrationTask *)self signature];

    if (v4)
    {
      objc_super v5 = [(PDNotificationServiceRegistrationTask *)self signature];
      [v3 setObject:v5 forKey:@"signature"];
    }
    uint64_t v6 = [(PDNotificationServiceRegistrationTask *)self registrationData];

    if (v6)
    {
      v7 = [(PDNotificationServiceRegistrationTask *)self registrationData];
      [v3 setObject:v7 forKey:@"registrationData"];
    }
    uint64_t v8 = [(PDNotificationServiceRegistrationTask *)self certificates];
    id v9 = [v8 count];

    if (v9)
    {
      id v10 = objc_alloc((Class)PKSecureElementCertificateSet);
      uint64_t v11 = [(PDNotificationServiceRegistrationTask *)self certificates];
      id v12 = [v10 initWithDictionary:v11];

      [v12 setSupportsLegacyFormats:1];
      v13 = [v12 certificateOfType:0];
      if (!v13)
      {
        v13 = [v12 certificateOfType:1];
      }
      [v3 setObject:v13 forKey:@"casdCertificate"];
    }
    if ([(PDNotificationServiceRegistrationTask *)self certificateVersion])
    {
      uint64_t v14 = +[NSNumber numberWithUnsignedInteger:[(PDNotificationServiceRegistrationTask *)self certificateVersion]];
      [v3 setObject:v14 forKey:@"version"];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = [a3 statusCode];
  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2048;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ got response with code %ld", (uint8_t *)&v10, 0x16u);
  }

  if (v7 != (id)200)
  {
    if (v7 == (id)401)
    {
      PKAnalyticsSendEvent();
      [(PDNetworkTask *)self setCanRequestReauthentication:0];
      [(PDNetworkTask *)self failForAuthentication];
      goto LABEL_14;
    }
    if (v7 != (id)204)
    {
      PKAnalyticsSendEvent();
      [(PDNetworkTask *)self fail];
      goto LABEL_14;
    }
  }
  PKAnalyticsSendEvent();
  if ((id)[(PDNotificationServiceRegistrationTask *)self requestedStatus] == (id)1)
  {
    id v9 = [(PDNotificationServiceRegistrationTask *)self _authenticationTokenFromResponseData:v6];
    if (v9)
    {
      [(PDNetworkTask *)self deliverResult:v9];
      [(PDNetworkTask *)self succeed];
    }
    else
    {
      [(PDNetworkTask *)self fail];
    }
  }
  else
  {
    [(PDNetworkTask *)self succeed];
  }
LABEL_14:
}

- (void)handleError:(id)a3
{
  objc_super v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection Error for Task: %@ (%@)", (uint8_t *)&v6, 0x16u);
  }

  [(PDNetworkTask *)self fail];
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
  int v6 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v7 = [v6 deviceIdentifier];
  __int16 v8 = [(PDNotificationServiceConnectionTask *)self notificationService];
  id v9 = [v8 serviceURL];
  int v10 = [(PDNotificationServiceConnectionTask *)self notificationService];
  uint64_t v11 = [v10 registrationURL];
  __int16 v12 = +[NSString stringWithFormat:@"%@ %@ Task (Device ID: %@, Service URL: %@, Registration URL: %@)", v3, v5, v7, v9, v11];

  return v12;
}

- (BOOL)backoffComplete
{
  if ((id)[(PDNotificationServiceRegistrationTask *)self requestedStatus] != (id)1) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PDNotificationServiceRegistrationTask;
  return [(PDNetworkTask *)&v4 backoffComplete];
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  unsigned int v4 = [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  if (v4) {
    LOBYTE(v4) = [(objc_class *)a3 isSubclassOfClass:objc_opt_class()] ^ 1;
  }
  return v4;
}

- (int64_t)actionForInactiveTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDNotificationServiceRegistrationTask;
  int64_t v5 = [(PDNetworkTask *)&v9 actionForInactiveTask:v4];
  if (sub_100302700(self, v4))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v4 requestedStatus];
      uint64_t v7 = objc_opt_class();
      if (v7 == objc_opt_class()
        || (id)[(PDNotificationServiceRegistrationTask *)self requestedStatus] != v6)
      {
        int64_t v5 = 1;
        goto LABEL_11;
      }
LABEL_10:
      int64_t v5 = 5;
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    if ((id)[(PDNotificationServiceRegistrationTask *)self requestedStatus] == (id)2) {
      int64_t v5 = 1;
    }
    else {
      int64_t v5 = 6;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)matchesTask:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PDNotificationServiceRegistrationTask;
  if ([(PDNotificationServiceConnectionTask *)&v8 matchesTask:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [v4 requestedStatus];
    BOOL v6 = (id)[(PDNotificationServiceRegistrationTask *)self requestedStatus] == v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_authenticationTokenFromResponseData:(id)a3
{
  if (!a3)
  {
    id v7 = 0;
    goto LABEL_10;
  }
  id v9 = 0;
  id v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v9];
  id v5 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = 0;
LABEL_7:
    if (v5) {
      [(PDNetworkTask *)self reportError:v5];
    }
    goto LABEL_9;
  }
  objc_opt_class();
  uint64_t v6 = PDTypecheckObjectForKey();
  id v7 = 0;

  id v5 = (id)v6;
  if (!v7) {
    goto LABEL_7;
  }
LABEL_9:

LABEL_10:
  return v7;
}

- (unint64_t)requestedStatus
{
  return self->_requestedStatus;
}

- (void)setRequestedStatus:(unint64_t)a3
{
  self->_requestedStatus = a3;
}

- (NSString)registrationData
{
  return self->_registrationData;
}

- (void)setRegistrationData:(id)a3
{
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSDictionary)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (PDNetworkConnectionTask)completionTask
{
  return self->_completionTask;
}

- (void)setCompletionTask:(id)a3
{
}

- (unint64_t)certificateVersion
{
  return self->_certificateVersion;
}

- (void)setCertificateVersion:(unint64_t)a3
{
  self->_certificateVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionTask, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_registrationData, 0);
}

@end