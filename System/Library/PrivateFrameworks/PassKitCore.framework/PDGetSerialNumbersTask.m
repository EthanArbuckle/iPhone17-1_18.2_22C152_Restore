@interface PDGetSerialNumbersTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 lastUpdatedTag:(id)a4 tagLastUpdateDate:(id)a5;
- (BOOL)_matchesGetSerialNumbersTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (NSDate)tagLastUpdateDate;
- (NSString)lastUpdatedTag;
- (PDGetSerialNumbersTask)initWithCoder:(id)a3;
- (PDGetSerialNumbersTask)initWithWebService:(id)a3 lastUpdatedTag:(id)a4 tagLastUpdateDate:(id)a5;
- (id)_resultFromResponseData:(id)a3;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (id)queryFields;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setLastUpdatedTag:(id)a3;
- (void)setTagLastUpdateDate:(id)a3;
@end

@implementation PDGetSerialNumbersTask

+ (id)taskWithWebService:(id)a3 lastUpdatedTag:(id)a4 tagLastUpdateDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithWebService:v10 lastUpdatedTag:v9 tagLastUpdateDate:v8];

  return v11;
}

- (PDGetSerialNumbersTask)initWithWebService:(id)a3 lastUpdatedTag:(id)a4 tagLastUpdateDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PDGetSerialNumbersTask;
  id v10 = [(PDWebServiceConnectionTask *)&v16 initWithWebService:a3];
  if (v10)
  {
    id v11 = (NSString *)[v8 copy];
    lastUpdatedTag = v10->_lastUpdatedTag;
    v10->_lastUpdatedTag = v11;

    v13 = (NSDate *)[v9 copy];
    tagLastUpdateDate = v10->_tagLastUpdateDate;
    v10->_tagLastUpdateDate = v13;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDGetSerialNumbersTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDGetSerialNumbersTask;
  v5 = [(PDWebServiceConnectionTask *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedTag"];
    lastUpdatedTag = v5->_lastUpdatedTag;
    v5->_lastUpdatedTag = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tagLastUpdateDate"];
    tagLastUpdateDate = v5->_tagLastUpdateDate;
    v5->_tagLastUpdateDate = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDGetSerialNumbersTask;
  id v4 = a3;
  [(PDWebServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastUpdatedTag, @"lastUpdatedTag", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_tagLastUpdateDate forKey:@"tagLastUpdateDate"];
}

- (BOOL)isValid
{
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  id v4 = [(PDWebServiceConnectionTask *)self webService];
  objc_super v5 = [v4 deviceIdentifier];

  if (v3) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

- (id)method
{
  return @"GET";
}

- (id)endpointComponents
{
  v3 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
  id v4 = [(PDWebServiceConnectionTask *)self webService];
  objc_super v5 = [v4 deviceIdentifier];

  BOOL v6 = 0;
  if (v5 && v3)
  {
    v8[0] = @"v1";
    v8[1] = @"devices";
    v8[2] = v5;
    v8[3] = @"registrations";
    v8[4] = v3;
    BOOL v6 = +[NSArray arrayWithObjects:v8 count:5];
  }

  return v6;
}

- (id)queryFields
{
  v2 = [(PDGetSerialNumbersTask *)self lastUpdatedTag];
  if (v2)
  {
    v3 = +[NSDictionary dictionaryWithObject:v2 forKey:@"passesUpdatedSince"];
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

  if (v7 == (id)204)
  {
    id v9 = objc_alloc_init(PDGetSerialNumbersResult);
  }
  else
  {
    if (v7 != (id)200)
    {
      [(PDWebServiceConnectionTask *)self reportUnexpectedResponseCode:v7];
      goto LABEL_13;
    }
    id v9 = [(PDGetSerialNumbersTask *)self _resultFromResponseData:v6];
  }
  id v10 = v9;
  if (!v9)
  {
LABEL_13:
    [(PDNetworkTask *)self fail];
    goto LABEL_14;
  }
  [(PDNetworkTask *)self deliverResult:v9];
  [(PDNetworkTask *)self succeed];

LABEL_14:
}

- (void)handleError:(id)a3
{
  [(PDWebServiceConnectionTask *)self reportNSURLConnectionError:a3];
  [(PDNetworkTask *)self fail];
}

- (id)description
{
  v3 = [(PDWebServiceConnectionTask *)self webService];
  id v4 = [v3 deviceIdentifier];
  objc_super v5 = [v3 passTypeIdentifier];
  id v6 = [(PDGetSerialNumbersTask *)self lastUpdatedTag];
  id v7 = [v3 serviceURL];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Get serial #s task (for device %@, pass type %@, last updated %@; with web service url %@)",
    v4,
    v5,
    v6,
  uint64_t v8 = v7);

  return v8;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  uint64_t v4 = objc_opt_class();
  return [(objc_class *)a3 isSubclassOfClass:v4];
}

- (int64_t)actionForInactiveTask:(id)a3
{
  if ([(PDGetSerialNumbersTask *)self _matchesGetSerialNumbersTask:a3]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (int64_t)actionForActiveTask:(id)a3
{
  if ([(PDGetSerialNumbersTask *)self _matchesGetSerialNumbersTask:a3]) {
    return 5;
  }
  else {
    return 0;
  }
}

- (BOOL)_matchesGetSerialNumbersTask:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 webService];
  id v6 = [v5 serviceURL];
  id v7 = [(PDWebServiceConnectionTask *)self webService];
  uint64_t v8 = [v7 serviceURL];
  if ([v6 isEqual:v8])
  {
    id v9 = [v4 passTypeIdentifier];
    id v10 = [(PDWebServiceConnectionTask *)self passTypeIdentifier];
    unsigned __int8 v11 = [v9 isEqualToString:v10];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)_resultFromResponseData:(id)a3
{
  if (a3)
  {
    id v14 = 0;
    id v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v14];
    id v5 = v14;
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        uint64_t v6 = PDTypecheckArrayOfObjectsForKey();
        id v7 = 0;

        if (v6)
        {
          [(PDWebServiceConnectionTask *)self reportMalformedResponseError:v6];
          uint64_t v8 = 0;
          id v5 = (id)v6;
        }
        else
        {
          objc_opt_class();
          PDTypecheckObjectForKey();
          id v5 = (id)objc_claimAutoreleasedReturnValue();
          id v11 = 0;
          if (v5)
          {
            [(PDWebServiceConnectionTask *)self reportMalformedResponseError:v5];
            uint64_t v8 = 0;
          }
          else
          {
            uint64_t v8 = objc_alloc_init(PDGetSerialNumbersResult);
            [(PDGetSerialNumbersResult *)v8 setSerialNumbers:v7];
            [(PDGetSerialNumbersResult *)v8 setLastUpdatedTag:v11];
          }
        }
      }
      else
      {
        uint64_t v13 = objc_opt_class();
        uint64_t v10 = PDBasicError();

        -[PDWebServiceConnectionTask reportMalformedResponseError:](self, "reportMalformedResponseError:", v10, v13);
        uint64_t v8 = 0;
        id v5 = (id)v10;
      }
    }
    else
    {
      [(PDWebServiceConnectionTask *)self reportMalformedResponseError:v5];
      uint64_t v8 = 0;
    }
  }
  else
  {
    id v9 = PDBasicError();
    [(PDWebServiceConnectionTask *)self reportMalformedResponseError:v9];

    uint64_t v8 = 0;
  }
  return v8;
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (void)setLastUpdatedTag:(id)a3
{
}

- (NSDate)tagLastUpdateDate
{
  return self->_tagLastUpdateDate;
}

- (void)setTagLastUpdateDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagLastUpdateDate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTag, 0);
}

@end