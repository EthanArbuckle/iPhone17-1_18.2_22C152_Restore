@interface PDRequestPassesTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 issuerBindingData:(id)a4;
- (BOOL)_matchesRequestPassesTask:(id)a3;
- (BOOL)backoffComplete;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (PDRequestPassesTask)initWithCoder:(id)a3;
- (PKIssuerBindingData)issuerBindingData;
- (id)_initTaskWithWebService:(id)a3 issuerBindingData:(id)a4;
- (id)_resultFromResponseData:(id)a3 multiplePasses:(BOOL)a4;
- (id)bodyDictionary;
- (id)description;
- (id)method;
- (id)queryFields;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
@end

@implementation PDRequestPassesTask

+ (id)taskWithWebService:(id)a3 issuerBindingData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) _initTaskWithWebService:v7 issuerBindingData:v6];

  return v8;
}

- (id)_initTaskWithWebService:(id)a3 issuerBindingData:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDRequestPassesTask;
  id v8 = [(PDWebServiceConnectionTask *)&v11 initWithWebService:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_issuerBindingData, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDRequestPassesTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDRequestPassesTask;
  v5 = [(PDWebServiceConnectionTask *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuerBindingData"];
    issuerBindingData = v5->_issuerBindingData;
    v5->_issuerBindingData = (PKIssuerBindingData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDRequestPassesTask;
  id v4 = a3;
  [(PDWebServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_issuerBindingData, @"issuerBindingData", v5.receiver, v5.super_class);
}

- (BOOL)isValid
{
  return self->_issuerBindingData != 0;
}

- (id)method
{
  return @"POST";
}

- (id)queryFields
{
  v2 = [(PKIssuerBindingData *)self->_issuerBindingData sessionIdentifier];
  if (v2)
  {
    v3 = +[NSDictionary dictionaryWithObject:v2 forKey:@"sessionIdentifier"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)backoffComplete
{
  return 1;
}

- (id)bodyDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(PKIssuerBindingData *)self->_issuerBindingData signedData];
  objc_super v5 = [v4 hexEncoding];
  [v3 safelySetObject:v5 forKey:@"issuerBindingData"];

  uint64_t v6 = [(PKIssuerBindingData *)self->_issuerBindingData createdKeyHash];
  id v7 = [v6 hexEncoding];
  [v3 safelySetObject:v7 forKey:@"keyHash"];

  return v3;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 statusCode];
  if (PKDeveloperLoggingEnabled() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100517080();
  }
  objc_super v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    v15 = self;
    __int16 v16 = 2048;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ got response with code %ld", (uint8_t *)&v14, 0x16u);
  }

  if (v8 != (id)200)
  {
    if (v8 == (id)401) {
      [(PDWebServiceConnectionTask *)self reportAuthenticationFailure];
    }
    else {
      [(PDWebServiceConnectionTask *)self reportUnexpectedResponseCode:v8];
    }
    goto LABEL_12;
  }
  v10 = [v6 MIMEType];
  id v11 = [v10 isEqualToString:@"application/vnd.apple.pkpasses"];

  uint64_t v12 = [(PDRequestPassesTask *)self _resultFromResponseData:v7 multiplePasses:v11];
  if (!v12)
  {
LABEL_12:
    [(PDNetworkTask *)self fail];
    goto LABEL_13;
  }
  v13 = (void *)v12;
  [(PDNetworkTask *)self deliverResult:v12];
  [(PDNetworkTask *)self succeed];

LABEL_13:
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  uint64_t v4 = objc_opt_class();
  return [(objc_class *)a3 isSubclassOfClass:v4];
}

- (int64_t)actionForInactiveTask:(id)a3
{
  if ([(PDRequestPassesTask *)self _matchesRequestPassesTask:a3]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (int64_t)actionForActiveTask:(id)a3
{
  if ([(PDRequestPassesTask *)self _matchesRequestPassesTask:a3]) {
    return 5;
  }
  else {
    return 0;
  }
}

- (BOOL)_matchesRequestPassesTask:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 webService];
  id v6 = [v5 serviceURL];
  id v7 = [(PDWebServiceConnectionTask *)self webService];
  id v8 = [v7 serviceURL];
  if ([v6 isEqual:v8])
  {
    objc_super v9 = [v4 issuerBindingData];
    v10 = [(PDRequestPassesTask *)self issuerBindingData];
    unsigned __int8 v11 = [v9 isEqual:v10];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)_resultFromResponseData:(id)a3 multiplePasses:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    if (v4)
    {
      id v8 = NSTemporaryDirectory();
      objc_super v9 = [(PKIssuerBindingData *)self->_issuerBindingData sessionIdentifier];
      id v10 = [v8 stringByAppendingPathComponent:v9];

      unsigned __int8 v11 = +[NSFileManager defaultManager];
      [v11 removeItemAtPath:v10 error:0];

      [v6 writeToFile:v10 atomically:1];
      id v12 = objc_alloc((Class)PKPassesXPCContainer);
      v13 = +[NSURL fileURLWithPath:v10];
      id v14 = [v12 initWithFileURL:v13];

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1002E6F9C;
      v29[3] = &unk_100747408;
      id v15 = v7;
      id v30 = v15;
      [v14 unarchivePassesWithBlock:v29];
      __int16 v16 = [[PDRequestPassesResult alloc] initWithPassesData:v15 error:0];
    }
    else
    {
      id v28 = 0;
      id v10 = +[PKPass createWithData:v6 warnings:0 error:&v28];
      id v14 = v28;
      if (v10)
      {
        v22 = [v10 archiveData];
        [v7 safelyAddObject:v22];

        v23 = [PDRequestPassesResult alloc];
        id v24 = v7;
        id v25 = 0;
      }
      else
      {
        v26 = PDTaskError(4, self, v14, @"Received invalid pass data", v18, v19, v20, v21, (uint64_t)v28);
        [(PDNetworkTask *)self reportError:v26];

        v23 = [PDRequestPassesResult alloc];
        id v24 = 0;
        id v25 = v14;
      }
      __int16 v16 = [(PDRequestPassesResult *)v23 initWithPassesData:v24 error:v25];
    }
  }
  else
  {
    id v17 = PDBasicError();
    [(PDWebServiceConnectionTask *)self reportMalformedResponseError:v17];

    __int16 v16 = 0;
  }

  return v16;
}

- (void)handleError:(id)a3
{
  [(PDWebServiceConnectionTask *)self reportNSURLConnectionError:a3];
  [(PDNetworkTask *)self fail];
}

- (id)description
{
  v3 = [(PDRequestPassesTask *)self issuerBindingData];
  BOOL v4 = [v3 description];
  objc_super v5 = [(PDWebServiceConnectionTask *)self webService];
  id v6 = [v5 serviceURL];
  +[NSString stringWithFormat:@"Request pass task (issuerData: %@); with web service url %@"],
    v4,
  id v7 = v6);

  return v7;
}

- (PKIssuerBindingData)issuerBindingData
{
  return self->_issuerBindingData;
}

- (void).cxx_destruct
{
}

@end