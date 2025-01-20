@interface PDGetPassTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 updateContext:(id)a4 source:(int64_t)a5;
- (BOOL)_matchesGetPassTask:(id)a3;
- (BOOL)_matchesPersonalizePassTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (BOOL)pertainsToPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (BOOL)serverRequested;
- (BOOL)userRequested;
- (NSString)serialNumber;
- (PDGetPassTask)initWithCoder:(id)a3;
- (PDGetPassTask)initWithWebService:(id)a3 updateContext:(id)a4 source:(int64_t)a5;
- (PDPassUpdateContext)context;
- (id)_resultFromResponseData:(id)a3;
- (id)description;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (int64_t)source;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setServerRequested:(BOOL)a3;
- (void)setUserRequested:(BOOL)a3;
@end

@implementation PDGetPassTask

+ (id)taskWithWebService:(id)a3 updateContext:(id)a4 source:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithWebService:v9 updateContext:v8 source:a5];

  return v10;
}

- (PDGetPassTask)initWithWebService:(id)a3 updateContext:(id)a4 source:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PDGetPassTask;
  id v10 = [(PDWebServiceConnectionTask *)&v13 initWithWebService:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_context, a4);
    v11->_source = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDGetPassTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDGetPassTask;
  v5 = [(PDWebServiceConnectionTask *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (PDPassUpdateContext *)v6;

    v5->_source = (int64_t)[v4 decodeIntegerForKey:@"source"];
    v5->_userRequested = [v4 decodeBoolForKey:@"userRequested"];
    v5->_serverRequested = [v4 decodeBoolForKey:@"serverRequested"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDGetPassTask;
  id v4 = a3;
  [(PDWebServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, @"context", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_source forKey:@"source"];
  [v4 encodeBool:self->_userRequested forKey:@"userRequested"];
  [v4 encodeBool:self->_serverRequested forKey:@"serverRequested"];
}

- (BOOL)isValid
{
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  id v4 = [(PDGetPassTask *)self serialNumber];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;

  return v6;
}

- (NSString)serialNumber
{
  v2 = [(PDGetPassTask *)self context];
  v3 = [v2 serialNumber];

  return (NSString *)v3;
}

- (BOOL)pertainsToPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = [(PDGetPassTask *)self serialNumber];
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
  return @"GET";
}

- (id)endpointComponents
{
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  uint64_t v4 = [(PDGetPassTask *)self serialNumber];
  BOOL v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    v8[0] = @"v1";
    v8[1] = @"passes";
    v8[2] = v3;
    v8[3] = v4;
    id v6 = +[NSArray arrayWithObjects:v8 count:4];
  }

  return v6;
}

- (id)headerFields
{
  v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(PDGetPassTask *)self context];
  BOOL v5 = [v4 authenticationToken];
  id v6 = +[NSString stringWithFormat:@"ApplePass %@", v5];

  [v3 setObject:v6 forKey:@"Authorization"];
  id v7 = [(PDGetPassTask *)self context];
  id v8 = [v7 lastModifiedTag];

  if (v8) {
    [v3 setObject:v8 forKey:@"If-Modified-Since"];
  }

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
  unsigned int v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    v14 = self;
    __int16 v15 = 2048;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ got response with code %ld", (uint8_t *)&v13, 0x16u);
  }

  if (v8 == (id)401)
  {
    [(PDWebServiceConnectionTask *)self reportAuthenticationFailure];
    goto LABEL_15;
  }
  if (v8 == (id)304)
  {
    id v10 = objc_alloc_init(PDGetPassResult);
  }
  else
  {
    if (v8 != (id)200)
    {
      [(PDWebServiceConnectionTask *)self reportUnexpectedResponseCode:v8];
      goto LABEL_15;
    }
    id v10 = [(PDGetPassTask *)self _resultFromResponseData:v7];
  }
  unsigned __int8 v11 = v10;
  if (!v10)
  {
LABEL_15:
    [(PDNetworkTask *)self fail];
    goto LABEL_16;
  }
  v12 = objc_msgSend(v6, "pk_valueForHTTPHeaderField:", @"Last-Modified");
  [(PDGetPassResult *)v11 setLastModified:v12];

  [(PDNetworkTask *)self deliverResult:v11];
  [(PDNetworkTask *)self succeed];

LABEL_16:
}

- (void)handleError:(id)a3
{
  [(PDWebServiceConnectionTask *)self reportNSURLConnectionError:a3];
  [(PDNetworkTask *)self fail];
}

- (id)description
{
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  uint64_t v4 = [(PDGetPassTask *)self serialNumber];
  BOOL v5 = [(PDGetPassTask *)self context];
  id v6 = [v5 lastModifiedTag];
  id v7 = [(PDWebServiceConnectionTask *)self webService];
  id v8 = [v7 serviceURL];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Get pass task (pass type %@, serial number %@, if-modified-since %@; with web service url %@)",
    v3,
    v4,
    v6,
  unsigned int v9 = v8);

  return v9;
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
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(PDGetPassTask *)self _matchesGetPassTask:v4])
  {
    if ([(PDGetPassTask *)self userRequested])
    {
      int64_t v5 = 1;
    }
    else if (self->_source == 2)
    {
      int64_t v5 = 5;
    }
    else
    {
      int64_t v5 = 2;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(PDGetPassTask *)self _matchesPersonalizePassTask:v4]) {
        int64_t v5 = 5;
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
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(PDGetPassTask *)self _matchesGetPassTask:v4])
  {
    int64_t v5 = 5;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(PDGetPassTask *)self _matchesPersonalizePassTask:v4]) {
        int64_t v5 = 5;
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

- (BOOL)_matchesPersonalizePassTask:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 webService];
  id v6 = [v5 serviceURL];
  id v7 = [(PDWebServiceConnectionTask *)self webService];
  id v8 = [v7 serviceURL];
  if ([v6 isEqual:v8])
  {
    unsigned int v9 = [v4 passTypeIdentifier];
    id v10 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
    if ([v9 isEqualToString:v10])
    {
      unsigned __int8 v11 = [v4 serialNumber];
      v12 = [(PDGetPassTask *)self serialNumber];
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

- (BOOL)_matchesGetPassTask:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 webService];
  id v6 = [v5 serviceURL];
  id v7 = [(PDWebServiceConnectionTask *)self webService];
  id v8 = [v7 serviceURL];
  if ([v6 isEqual:v8])
  {
    unsigned int v9 = [v4 passTypeIdentifier];
    id v10 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
    if ([v9 isEqualToString:v10])
    {
      unsigned __int8 v11 = [v4 serialNumber];
      v12 = [(PDGetPassTask *)self serialNumber];
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

- (id)_resultFromResponseData:(id)a3
{
  if (!a3)
  {
    v19 = PDBasicError();
    [(PDWebServiceConnectionTask *)self reportMalformedResponseError:v19];

    v18 = 0;
    goto LABEL_15;
  }
  id v36 = 0;
  id v37 = 0;
  id v4 = +[PKPass createWithData:a3 warnings:&v37 error:&v36];
  id v5 = v37;
  id v10 = v36;
  if (v4)
  {
    unsigned __int8 v11 = [v4 passTypeIdentifier];
    v12 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
    unsigned __int8 v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      v14 = [v4 serialNumber];
      __int16 v15 = [(PDGetPassTask *)self serialNumber];
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if (v16)
      {
        if (v5)
        {
          +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_1002E5014;
          v33[3] = &unk_1007473E0;
          id v34 = (id)objc_claimAutoreleasedReturnValue();
          v35 = self;
          id v17 = v34;
          [v5 enumerateObjectsUsingBlock:v33];
          [(PDNetworkTask *)self reportWarnings:v17];
        }
        v18 = objc_alloc_init(PDGetPassResult);
        [(PDGetPassResult *)v18 setPass:v4];
        goto LABEL_14;
      }
      v20 = [(PDGetPassTask *)self serialNumber];
      v21 = [v4 serialNumber];
      PDTaskError(5, self, 0, @"Requested serial number %@, received serial number %@", v26, v27, v28, v29, (uint64_t)v20);
    }
    else
    {
      v20 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
      v21 = [v4 passTypeIdentifier];
      PDTaskError(5, self, 0, @"Requested pass of type %@, received pass of type %@", v22, v23, v24, v25, (uint64_t)v20);
    v30 = };
    [(PDNetworkTask *)self reportError:v30];
  }
  else
  {
    v20 = PDTaskError(4, self, v10, @"Received invalid pass data", v6, v7, v8, v9, v32);
    [(PDNetworkTask *)self reportError:v20];
  }

  v18 = 0;
LABEL_14:

LABEL_15:
  return v18;
}

- (PDPassUpdateContext)context
{
  return self->_context;
}

- (int64_t)source
{
  return self->_source;
}

- (BOOL)userRequested
{
  return self->_userRequested;
}

- (void)setUserRequested:(BOOL)a3
{
  self->_userRequested = a3;
}

- (BOOL)serverRequested
{
  return self->_serverRequested;
}

- (void)setServerRequested:(BOOL)a3
{
  self->_serverRequested = a3;
}

- (void).cxx_destruct
{
}

@end