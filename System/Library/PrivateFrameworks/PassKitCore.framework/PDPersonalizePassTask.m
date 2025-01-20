@interface PDPersonalizePassTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 updateContext:(id)a4 contact:(id)a5 personalizationToken:(id)a6 requiredPersonalizationFields:(unint64_t)a7 personalizationSource:(unint64_t)a8;
- (BOOL)_matchesGetPassTask:(id)a3;
- (BOOL)_matchesPersonalizePassTask:(id)a3;
- (BOOL)_matchesRegistrationTask:(id)a3;
- (BOOL)backoffComplete;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (BOOL)pertainsToPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (NSString)personalizationToken;
- (NSString)serialNumber;
- (PDPassUpdateContext)context;
- (PDPersonalizePassTask)initWithCoder:(id)a3;
- (PDPersonalizePassTask)initWithWebService:(id)a3 updateContext:(id)a4 contact:(id)a5 personalizationToken:(id)a6 requiredPersonalizationFields:(unint64_t)a7 personalizationSource:(unint64_t)a8;
- (PKContact)contact;
- (id)_resultFromResponseData:(id)a3;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (unint64_t)personalizationSource;
- (unint64_t)requiredPersonalizationFields;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
@end

@implementation PDPersonalizePassTask

+ (id)taskWithWebService:(id)a3 updateContext:(id)a4 contact:(id)a5 personalizationToken:(id)a6 requiredPersonalizationFields:(unint64_t)a7 personalizationSource:(unint64_t)a8
{
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [objc_alloc((Class)a1) initWithWebService:v17 updateContext:v16 contact:v15 personalizationToken:v14 requiredPersonalizationFields:a7 personalizationSource:a8];

  return v18;
}

- (PDPersonalizePassTask)initWithWebService:(id)a3 updateContext:(id)a4 contact:(id)a5 personalizationToken:(id)a6 requiredPersonalizationFields:(unint64_t)a7 personalizationSource:(unint64_t)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PDPersonalizePassTask;
  id v18 = [(PDWebServiceConnectionTask *)&v23 initWithWebService:a3];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_context, a4);
    objc_storeStrong((id *)&v19->_contact, a5);
    v20 = (NSString *)[v17 copy];
    personalizationToken = v19->_personalizationToken;
    v19->_personalizationToken = v20;

    v19->_requiredPersonalizationFields = a7;
    v19->_personalizationSource = a8;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPersonalizePassTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDPersonalizePassTask;
  v5 = [(PDWebServiceConnectionTask *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (PDPassUpdateContext *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
    contact = v5->_contact;
    v5->_contact = (PKContact *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personalizationToken"];
    personalizationToken = v5->_personalizationToken;
    v5->_personalizationToken = (NSString *)v10;

    v5->_requiredPersonalizationFields = (unint64_t)[v4 decodeIntegerForKey:@"requiredPersonalizationFields"];
    v5->_personalizationSource = (unint64_t)[v4 decodeIntegerForKey:@"personalizationSource"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPersonalizePassTask;
  id v4 = a3;
  [(PDWebServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, @"context", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_contact forKey:@"contact"];
  [v4 encodeObject:self->_personalizationToken forKey:@"personalizationToken"];
  [v4 encodeInteger:self->_requiredPersonalizationFields forKey:@"requiredPersonalizationFields"];
  [v4 encodeInteger:self->_personalizationSource forKey:@"personalizationSource"];
}

- (BOOL)isValid
{
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  id v4 = [(PDPersonalizePassTask *)self serialNumber];
  objc_super v5 = [(PDPersonalizePassTask *)self contact];
  uint64_t v6 = [(PDPersonalizePassTask *)self personalizationToken];
  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v10 = !v7 && v5 != 0 && v6 != 0;

  return v10;
}

- (NSString)serialNumber
{
  v2 = [(PDPersonalizePassTask *)self context];
  v3 = [v2 serialNumber];

  return (NSString *)v3;
}

- (BOOL)pertainsToPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    BOOL v10 = [(PDPersonalizePassTask *)self serialNumber];
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
  return @"POST";
}

- (id)endpointComponents
{
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  uint64_t v4 = [(PDPersonalizePassTask *)self serialNumber];
  objc_super v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    v8[0] = @"v1";
    v8[1] = @"passes";
    v8[2] = v3;
    v8[3] = v4;
    v8[4] = @"personalize";
    id v6 = +[NSArray arrayWithObjects:v8 count:5];
  }

  return v6;
}

- (BOOL)backoffComplete
{
  return 1;
}

- (id)bodyDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = +[NSMutableDictionary dictionary];
  unint64_t requiredPersonalizationFields = self->_requiredPersonalizationFields;
  if (requiredPersonalizationFields)
  {
    id v11 = objc_alloc_init((Class)NSPersonNameComponentsFormatter);
    v12 = [(PDPersonalizePassTask *)self contact];
    objc_super v13 = [v12 name];

    id v14 = [v11 stringFromPersonNameComponents:v13];
    [v4 safelySetObject:v14 forKey:@"fullName"];
    id v15 = [v13 givenName];
    [v4 safelySetObject:v15 forKey:@"givenName"];

    id v16 = [v13 familyName];
    [v4 safelySetObject:v16 forKey:@"familyName"];

    unint64_t requiredPersonalizationFields = self->_requiredPersonalizationFields;
    if ((requiredPersonalizationFields & 2) == 0)
    {
LABEL_3:
      if ((requiredPersonalizationFields & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((requiredPersonalizationFields & 2) == 0)
  {
    goto LABEL_3;
  }
  id v17 = [(PDPersonalizePassTask *)self contact];
  id v18 = [v17 postalAddress];

  v19 = [v18 ISOCountryCode];
  v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [v18 suggestedCountryCode];
  }
  v22 = v21;

  objc_super v23 = [v18 postalCode];
  [v4 safelySetObject:v23 forKey:@"postalCode"];

  [v4 safelySetObject:v22 forKey:@"ISOCountryCode"];
  unint64_t requiredPersonalizationFields = self->_requiredPersonalizationFields;
  if ((requiredPersonalizationFields & 4) == 0)
  {
LABEL_4:
    if ((requiredPersonalizationFields & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_14:
  v24 = [(PDPersonalizePassTask *)self contact];
  v25 = [v24 emailAddress];
  [v4 safelySetObject:v25 forKey:@"emailAddress"];

  if ((self->_requiredPersonalizationFields & 8) != 0)
  {
LABEL_5:
    id v6 = [(PDPersonalizePassTask *)self contact];
    id v7 = [v6 phoneNumber];

    uint64_t v8 = [v7 digits];
    [v4 safelySetObject:v8 forKey:@"phoneNumber"];
  }
LABEL_6:
  [v3 safelySetObject:v4 forKey:@"requiredPersonalizationInfo"];
  unsigned int v9 = [(PDPersonalizePassTask *)self personalizationToken];
  [v3 safelySetObject:v9 forKey:@"personalizationToken"];

  return v3;
}

- (id)headerFields
{
  v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(PDPersonalizePassTask *)self context];
  objc_super v5 = [v4 authenticationToken];
  id v6 = +[NSString stringWithFormat:@"ApplePass %@", v5];

  [v3 setObject:v6 forKey:@"Authorization"];
  id v7 = [(PDPersonalizePassTask *)self context];
  uint64_t v8 = [v7 lastModifiedTag];

  if (v8) {
    [v3 setObject:v8 forKey:@"If-Modified-Since"];
  }

  return v3;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = [a3 statusCode];
  if (PKDeveloperLoggingEnabled() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100517080();
  }
  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    v12 = self;
    __int16 v13 = 2048;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ got response with code %ld", (uint8_t *)&v11, 0x16u);
  }

  if (v7 != (id)200)
  {
    if (v7 == (id)401) {
      [(PDWebServiceConnectionTask *)self reportAuthenticationFailure];
    }
    else {
      [(PDWebServiceConnectionTask *)self reportUnexpectedResponseCode:v7];
    }
    goto LABEL_12;
  }
  uint64_t v9 = [(PDPersonalizePassTask *)self _resultFromResponseData:v6];
  if (!v9)
  {
LABEL_12:
    [(PDNetworkTask *)self fail];
    goto LABEL_13;
  }
  BOOL v10 = (void *)v9;
  [(PDNetworkTask *)self deliverResult:v9];
  [(PDNetworkTask *)self succeed];

LABEL_13:
}

- (void)handleError:(id)a3
{
  [(PDWebServiceConnectionTask *)self reportNSURLConnectionError:a3];
  [(PDNetworkTask *)self fail];
}

- (id)description
{
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  uint64_t v4 = [(PDPersonalizePassTask *)self serialNumber];
  objc_super v5 = [(PDPersonalizePassTask *)self context];
  id v6 = [v5 lastModifiedTag];
  id v7 = [(PDWebServiceConnectionTask *)self webService];
  uint64_t v8 = [v7 serviceURL];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Personalize pass task (pass type %@, serial number %@, if-modified-since %@; with web service url %@)",
    v3,
    v4,
    v6,
  uint64_t v9 = v8);

  return v9;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) != 0)
  {
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
    && [(PDPersonalizePassTask *)self _matchesPersonalizePassTask:v4])
  {
    int64_t v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(PDPersonalizePassTask *)self _matchesRegistrationTask:v4])
    {
      int64_t v5 = 5;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([(PDPersonalizePassTask *)self _matchesGetPassTask:v4]) {
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
  }

  return v5;
}

- (int64_t)actionForActiveTask:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(PDPersonalizePassTask *)self _matchesPersonalizePassTask:v4])
  {
    int64_t v5 = 3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(PDPersonalizePassTask *)self _matchesRegistrationTask:v4])
    {
      int64_t v5 = 5;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([(PDPersonalizePassTask *)self _matchesGetPassTask:v4]) {
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
  }

  return v5;
}

- (BOOL)_matchesPersonalizePassTask:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 webService];
  id v6 = [v5 serviceURL];
  id v7 = [(PDWebServiceConnectionTask *)self webService];
  uint64_t v8 = [v7 serviceURL];
  if ([v6 isEqual:v8])
  {
    uint64_t v9 = [v4 passTypeIdentifier];
    BOOL v10 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
    if ([v9 isEqualToString:v10])
    {
      int v11 = [v4 serialNumber];
      v12 = [(PDPersonalizePassTask *)self serialNumber];
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
  uint64_t v8 = [v7 serviceURL];
  if ([v6 isEqual:v8])
  {
    uint64_t v9 = [v4 passTypeIdentifier];
    BOOL v10 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
    if ([v9 isEqualToString:v10])
    {
      int v11 = [v4 serialNumber];
      v12 = [(PDPersonalizePassTask *)self serialNumber];
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
  int64_t v5 = [v4 webService];
  id v6 = [v5 serviceURL];
  id v7 = [(PDWebServiceConnectionTask *)self webService];
  uint64_t v8 = [v7 serviceURL];
  if ([v6 isEqual:v8])
  {
    uint64_t v9 = [v4 passTypeIdentifier];
    BOOL v10 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
    if ([v9 isEqualToString:v10])
    {
      int v11 = [v4 serialNumber];
      v12 = [(PDPersonalizePassTask *)self serialNumber];
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
  id v4 = a3;
  if (v4)
  {
    int64_t v5 = [[PDPersonalizePassResult alloc] initWithSignatureData:v4];
    id v6 = [(PDPersonalizePassTask *)self personalizationToken];
    id v7 = [v6 dataUsingEncoding:4];
    uint64_t v8 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
    uint64_t v9 = [(PDWebServiceConnectionTask *)self teamIdentifier];
    PKValidateIssuerDataSignature();
    id v10 = 0;

    if (v10)
    {
      id v15 = PDTaskWarning(0, self, v10, @"Received invalid personalizaiton token signature", v11, v12, v13, v14, v19);
      v20 = v15;
      id v16 = +[NSArray arrayWithObjects:&v20 count:1];
      [(PDNetworkTask *)self reportWarnings:v16];
    }
  }
  else
  {
    id v17 = PDBasicError();
    [(PDWebServiceConnectionTask *)self reportMalformedResponseError:v17];

    int64_t v5 = 0;
  }

  return v5;
}

- (PDPassUpdateContext)context
{
  return self->_context;
}

- (PKContact)contact
{
  return self->_contact;
}

- (NSString)personalizationToken
{
  return self->_personalizationToken;
}

- (unint64_t)requiredPersonalizationFields
{
  return self->_requiredPersonalizationFields;
}

- (unint64_t)personalizationSource
{
  return self->_personalizationSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationToken, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end