@interface PDLogTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 error:(id)a4;
+ (id)taskWithWebService:(id)a3 warnings:(id)a4;
- (BOOL)_hasRoomForAdditionalLogs;
- (BOOL)_matchesLogTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (NSArray)logs;
- (PDLogTask)initWithCoder:(id)a3;
- (PDLogTask)initWithWebService:(id)a3 logs:(id)a4;
- (const)backoffLevels;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (unint64_t)numberOfBackoffLevels;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)mergeWithNewerTask:(id)a3;
- (void)setLogs:(id)a3;
@end

@implementation PDLogTask

+ (id)taskWithWebService:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = sub_1002E7B1C(v6, 0);

  v13 = v9;
  v10 = +[NSArray arrayWithObjects:&v13 count:1];
  id v11 = [v8 initWithWebService:v7 logs:v10];

  return v11;
}

+ (id)taskWithWebService:(id)a3 warnings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002E7D1C;
  v11[3] = &unk_100747430;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v12;
  [v6 enumerateObjectsUsingBlock:v11];

  id v9 = [objc_alloc((Class)a1) initWithWebService:v7 logs:v8];
  return v9;
}

- (PDLogTask)initWithWebService:(id)a3 logs:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDLogTask;
  id v7 = [(PDWebServiceConnectionTask *)&v11 initWithWebService:a3];
  if (v7)
  {
    id v8 = (NSArray *)[v6 copy];
    logs = v7->_logs;
    v7->_logs = v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDLogTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDLogTask;
  v5 = [(PDWebServiceConnectionTask *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"logs"];
    logs = v5->_logs;
    v5->_logs = (NSArray *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDLogTask;
  id v4 = a3;
  [(PDWebServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_logs, @"logs", v5.receiver, v5.super_class);
}

- (id)method
{
  return @"POST";
}

- (id)endpointComponents
{
  return &off_10078C4C8;
}

- (id)bodyDictionary
{
  CFStringRef v5 = @"logs";
  v2 = [(PDLogTask *)self logs];
  uint64_t v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v5 = [a3 statusCode];
  if (PKDeveloperLoggingEnabled() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100517080();
  }
  uint64_t v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = self;
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
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  id v4 = [(PDWebServiceConnectionTask *)self webService];
  id v5 = [v4 serviceURL];
  uint64_t v6 = +[NSString stringWithFormat:@"Log task (pass type %@, web service url %@)", v3, v5];

  return v6;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  uint64_t v4 = objc_opt_class();
  return [(objc_class *)a3 isSubclassOfClass:v4];
}

- (int64_t)actionForInactiveTask:(id)a3
{
  id v4 = a3;
  if ([(PDLogTask *)self _matchesLogTask:v4])
  {
    if ([v4 _hasRoomForAdditionalLogs]) {
      int64_t v5 = 4;
    }
    else {
      int64_t v5 = 5;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)actionForActiveTask:(id)a3
{
  if ([(PDLogTask *)self _matchesLogTask:a3]) {
    return 5;
  }
  else {
    return 0;
  }
}

- (void)mergeWithNewerTask:(id)a3
{
  logs = self->_logs;
  id v6 = [a3 logs];
  int64_t v5 = [(NSArray *)logs arrayByAddingObjectsFromArray:v6];
  [(PDLogTask *)self setLogs:v5];
}

- (const)backoffLevels
{
  return (const $82EDB067EE6F192B39F18594CC8676AD *)&_FasterBackoffLevels;
}

- (unint64_t)numberOfBackoffLevels
{
  return 7;
}

- (BOOL)_matchesLogTask:(id)a3
{
  id v4 = [a3 webService];
  int64_t v5 = [v4 serviceURL];
  id v6 = [(PDWebServiceConnectionTask *)self webService];
  int v7 = [v6 serviceURL];
  unsigned __int8 v8 = [v5 isEqual:v7];

  return v8;
}

- (BOOL)_hasRoomForAdditionalLogs
{
  return [(NSArray *)self->_logs count] < 0x32;
}

- (NSArray)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end