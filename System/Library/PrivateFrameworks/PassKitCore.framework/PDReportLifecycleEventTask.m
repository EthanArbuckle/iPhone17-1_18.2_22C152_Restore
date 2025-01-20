@interface PDReportLifecycleEventTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 serialNumber:(id)a4 state:(unint64_t)a5;
- (BOOL)_matchesPassLifecycleTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (NSString)serialNumber;
- (PDReportLifecycleEventTask)initWithCoder:(id)a3;
- (const)backoffLevels;
- (id)_initTaskWithWebService:(id)a3 serialNumber:(id)a4 state:(unint64_t)a5;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (unint64_t)numberOfBackoffLevels;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
@end

@implementation PDReportLifecycleEventTask

+ (id)taskWithWebService:(id)a3 serialNumber:(id)a4 state:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) _initTaskWithWebService:v9 serialNumber:v8 state:a5];

  return v10;
}

- (id)_initTaskWithWebService:(id)a3 serialNumber:(id)a4 state:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PDReportLifecycleEventTask;
  id v10 = [(PDWebServiceConnectionTask *)&v13 initWithWebService:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_serialNumber, a4);
    v11->_state = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDReportLifecycleEventTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDReportLifecycleEventTask;
  v5 = [(PDWebServiceConnectionTask *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v6;

    v5->_state = (unint64_t)[v4 decodeIntegerForKey:@"state"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDReportLifecycleEventTask;
  id v4 = a3;
  [(PDWebServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_serialNumber, @"serialNumber", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_state forKey:@"state"];
}

- (BOOL)isValid
{
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  id v4 = [(PDWebServiceConnectionTask *)self webService];
  if (v3)
  {
    if (self->_serialNumber) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    BOOL v6 = !v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)method
{
  return @"POST";
}

- (id)endpointComponents
{
  uint64_t v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  id v4 = (void *)v3;
  if (v3 && (serialNumber = self->_serialNumber) != 0)
  {
    v8[0] = @"v1";
    v8[1] = @"passes";
    v8[2] = v3;
    v8[3] = serialNumber;
    v8[4] = @"passLifecycleUpdate";
    BOOL v6 = +[NSArray arrayWithObjects:v8 count:5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)bodyDictionary
{
  CFStringRef v5 = @"passState";
  v2 = PKPassLifecycleStateToString();
  BOOL v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v5 = [a3 statusCode];
  if (PKDeveloperLoggingEnabled() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100517080();
  }
  BOOL v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2048;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ got response with code %ld", (uint8_t *)&v7, 0x16u);
  }

  if (v5 == (id)200)
  {
    [(PDNetworkTask *)self succeed];
  }
  else
  {
    [(PDWebServiceConnectionTask *)self reportUnexpectedResponseCode:v5];
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
  uint64_t v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  serialNumber = self->_serialNumber;
  unint64_t state = self->_state;
  BOOL v6 = [(PDWebServiceConnectionTask *)self webService];
  int v7 = [v6 serviceURL];
  id v8 = +[NSString stringWithFormat:@"Pass Lifecycle Event (pass type %@, serial number %@, pass lifecycle state %ld, web service url %@)", v3, serialNumber, state, v7];

  return v8;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  uint64_t v4 = objc_opt_class();
  return [(objc_class *)a3 isSubclassOfClass:v4];
}

- (int64_t)actionForInactiveTask:(id)a3
{
  if ([(PDReportLifecycleEventTask *)self _matchesPassLifecycleTask:a3]) {
    return 4;
  }
  else {
    return 0;
  }
}

- (int64_t)actionForActiveTask:(id)a3
{
  if ([(PDReportLifecycleEventTask *)self _matchesPassLifecycleTask:a3]) {
    return 5;
  }
  else {
    return 0;
  }
}

- (const)backoffLevels
{
  return (const $82EDB067EE6F192B39F18594CC8676AD *)&_FasterBackoffLevels;
}

- (unint64_t)numberOfBackoffLevels
{
  return 7;
}

- (BOOL)_matchesPassLifecycleTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 webService];
  BOOL v6 = [v5 serviceURL];
  int v7 = [(PDWebServiceConnectionTask *)self webService];
  id v8 = [v7 serviceURL];
  unsigned int v9 = [v6 isEqual:v8];

  id v10 = [v4 serialNumber];
  v11 = [(PDReportLifecycleEventTask *)self serialNumber];
  unsigned __int8 v12 = [v10 isEqualToString:v11];

  id v13 = [v4 state];
  if (v13 == (id)[(PDReportLifecycleEventTask *)self state]) {
    BOOL v14 = v12;
  }
  else {
    BOOL v14 = 0;
  }
  return v9 && v14;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end