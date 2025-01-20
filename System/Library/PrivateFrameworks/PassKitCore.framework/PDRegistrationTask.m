@interface PDRegistrationTask
+ (BOOL)supportsSecureCoding;
+ (id)_taskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5 requestedStatus:(unint64_t)a6;
+ (id)registerTaskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5;
+ (id)unregisterTaskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5;
- (BOOL)_matchesPersonalizePassTask:(id)a3;
- (BOOL)_matchesRegistrationTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (BOOL)pertainsToPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (NSString)authenticationToken;
- (NSString)serialNumber;
- (PDRegistrationTask)initWithCoder:(id)a3;
- (PDRegistrationTask)initWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5 requestedStatus:(unint64_t)a6;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (unint64_t)requestedStatus;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setAuthenticationToken:(id)a3;
- (void)setRequestedStatus:(unint64_t)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation PDRegistrationTask

+ (id)registerTaskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5
{
  return _[a1 _taskWithWebService:a3 serialNumber:a4 authToken:a5 requestedStatus:1];
}

+ (id)unregisterTaskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5
{
  return _[a1 _taskWithWebService:a3 serialNumber:a4 authToken:a5 requestedStatus:2];
}

+ (id)_taskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5 requestedStatus:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithWebService:v12 serialNumber:v11 authToken:v10 requestedStatus:a6];

  return v13;
}

- (PDRegistrationTask)initWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5 requestedStatus:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PDRegistrationTask;
  id v12 = [(PDWebServiceConnectionTask *)&v18 initWithWebService:a3];
  if (v12)
  {
    id v13 = (NSString *)[v10 copy];
    serialNumber = v12->_serialNumber;
    v12->_serialNumber = v13;

    v15 = (NSString *)[v11 copy];
    authenticationToken = v12->_authenticationToken;
    v12->_authenticationToken = v15;

    v12->_requestedStatus = a6;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDRegistrationTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDRegistrationTask;
  v5 = [(PDWebServiceConnectionTask *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationToken"];
    authenticationToken = v5->_authenticationToken;
    v5->_authenticationToken = (NSString *)v8;

    v5->_requestedStatus = (unint64_t)[v4 decodeIntegerForKey:@"requestedStatus"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDRegistrationTask;
  id v4 = a3;
  [(PDWebServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_serialNumber, @"serialNumber", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_authenticationToken forKey:@"authenticationToken"];
  [v4 encodeInteger:self->_requestedStatus forKey:@"requestedStatus"];
}

- (BOOL)isValid
{
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  id v4 = [(PDRegistrationTask *)self serialNumber];
  objc_super v5 = [(PDWebServiceConnectionTask *)self webService];
  uint64_t v6 = [v5 deviceIdentifier];

  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v9 = !v7 && v6 != 0;

  return v9;
}

- (BOOL)pertainsToPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = [(PDRegistrationTask *)self serialNumber];
    unsigned __int8 v11 = [v6 isEqualToString:v10];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)method
{
  if ((id)[(PDRegistrationTask *)self requestedStatus] == (id)1) {
    v2 = @"POST";
  }
  else {
    v2 = @"DELETE";
  }
  return v2;
}

- (id)endpointComponents
{
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  id v4 = [(PDRegistrationTask *)self serialNumber];
  objc_super v5 = [(PDWebServiceConnectionTask *)self webService];
  id v6 = [v5 deviceIdentifier];

  id v7 = 0;
  if (v6 && v3 && v4)
  {
    v9[0] = @"v1";
    v9[1] = @"devices";
    v9[2] = v6;
    v9[3] = @"registrations";
    v9[4] = v3;
    v9[5] = v4;
    id v7 = +[NSArray arrayWithObjects:v9 count:6];
  }

  return v7;
}

- (id)headerFields
{
  v2 = [(PDRegistrationTask *)self authenticationToken];
  v3 = +[NSString stringWithFormat:@"ApplePass %@", v2];

  id v4 = +[NSDictionary dictionaryWithObject:v3 forKey:@"Authorization"];

  return v4;
}

- (id)bodyDictionary
{
  if ((id)[(PDRegistrationTask *)self requestedStatus] == (id)1)
  {
    v3 = [(PDWebServiceConnectionTask *)self webService];
    id v4 = [v3 pushToken];
    objc_super v5 = +[NSDictionary dictionaryWithObject:v4 forKey:@"pushToken"];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  unint64_t v5 = (unint64_t)[a3 statusCode];
  if (PKDeveloperLoggingEnabled() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100517080();
  }
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ got response with code %ld", (uint8_t *)&v7, 0x16u);
  }

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 0xC8)
  {
    [(PDNetworkTask *)self succeed];
  }
  else
  {
    if (v5 == 401) {
      [(PDWebServiceConnectionTask *)self reportAuthenticationFailure];
    }
    else {
      [(PDWebServiceConnectionTask *)self reportUnexpectedResponseCode:v5];
    }
    [(PDNetworkTask *)self fail];
  }
}

- (void)handleError:(id)a3
{
  [(PDWebServiceConnectionTask *)self reportNSURLConnectionError:a3];
  [(PDNetworkTask *)self fail];
}

- (id)description
{
  if ((id)[(PDRegistrationTask *)self requestedStatus] == (id)1) {
    CFStringRef v3 = @"Register";
  }
  else {
    CFStringRef v3 = @"Unregister";
  }
  id v4 = [(PDWebServiceConnectionTask *)self webService];
  unint64_t v5 = [v4 deviceIdentifier];
  id v6 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  int v7 = [(PDRegistrationTask *)self serialNumber];
  uint64_t v8 = [(PDWebServiceConnectionTask *)self webService];
  __int16 v9 = [v8 serviceURL];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ task (for device %@, pass type %@, serial number %@; with web service url %@)",
    v3,
    v5,
    v6,
    v7,
  unint64_t v10 = v9);

  return v10;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()]) {
    return 1;
  }
  uint64_t v5 = objc_opt_class();
  return [(objc_class *)a3 isSubclassOfClass:v5];
}

- (int64_t)actionForInactiveTask:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(PDRegistrationTask *)self _matchesRegistrationTask:v4])
  {
    int64_t v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(PDRegistrationTask *)self _matchesPersonalizePassTask:v4]) {
        int64_t v5 = 6;
      }
      else {
        int64_t v5 = 0;
      }
    }
    else
    {
      int64_t v5 = 0;
    }
  }

  return v5;
}

- (int64_t)actionForActiveTask:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(PDRegistrationTask *)self _matchesRegistrationTask:v4])
  {
    id v5 = [(PDRegistrationTask *)self requestedStatus];
    if (v5 == [v4 requestedStatus]) {
      int64_t v6 = 3;
    }
    else {
      int64_t v6 = 5;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(PDRegistrationTask *)self _matchesPersonalizePassTask:v4]) {
        int64_t v6 = 6;
      }
      else {
        int64_t v6 = 0;
      }
    }
    else
    {
      int64_t v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_matchesPersonalizePassTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 webService];
  int64_t v6 = [v5 serviceURL];
  int v7 = [(PDWebServiceConnectionTask *)self webService];
  uint64_t v8 = [v7 serviceURL];
  if ([v6 isEqual:v8])
  {
    __int16 v9 = [v4 passTypeIdentifier];
    unint64_t v10 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
    if ([v9 isEqualToString:v10])
    {
      unsigned __int8 v11 = [v4 serialNumber];
      id v12 = [(PDRegistrationTask *)self serialNumber];
      unsigned __int8 v13 = [v11 isEqualToString:v12];
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (BOOL)_matchesRegistrationTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 webService];
  int64_t v6 = [v5 serviceURL];
  int v7 = [(PDWebServiceConnectionTask *)self webService];
  uint64_t v8 = [v7 serviceURL];
  if ([v6 isEqual:v8])
  {
    __int16 v9 = [v4 passTypeIdentifier];
    unint64_t v10 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
    if ([v9 isEqualToString:v10])
    {
      unsigned __int8 v11 = [v4 serialNumber];
      id v12 = [(PDRegistrationTask *)self serialNumber];
      unsigned __int8 v13 = [v11 isEqualToString:v12];
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (unint64_t)requestedStatus
{
  return self->_requestedStatus;
}

- (void)setRequestedStatus:(unint64_t)a3
{
  self->_requestedStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end