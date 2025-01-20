@interface SBKResponse
+ (id)responseWithCode:(unint64_t)a3 headerFields:(id)a4 responseDictionary:(id)a5 MIMEType:(id)a6 error:(id)a7;
+ (id)responseWithResponse:(id)a3;
+ (id)responseWithURLResponse:(id)a3 responseDictionary:(id)a4;
- (BOOL)isAuthenticationError;
- (BOOL)isError;
- (BOOL)isGenericError;
- (BOOL)isPuntedError;
- (BOOL)isRecoverable;
- (BOOL)isSuccess;
- (BOOL)isUnsupportedClient;
- (BOOL)isValidationError;
- (BOOL)shouldFileRadar;
- (NSDictionary)responseDictionary;
- (NSDictionary)responseHeaderFields;
- (NSError)error;
- (NSError)requestError;
- (NSString)MIMEType;
- (NSString)consoleDescription;
- (SBKResponse)initWithCode:(unint64_t)a3 headerFields:(id)a4 responseDictionary:(id)a5 MIMEType:(id)a6 error:(id)a7;
- (SBKResponse)initWithURLResponse:(id)a3 responseDictionary:(id)a4;
- (SBKResponseStatus)responseStatus;
- (double)retrySeconds;
- (id)description;
- (int64_t)statusCode;
- (unint64_t)responseCode;
@end

@implementation SBKResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responseHeaderFields, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

- (SBKResponseStatus)responseStatus
{
  return self->_responseStatus;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (double)retrySeconds
{
  return self->_retrySeconds;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)responseHeaderFields
{
  return self->_responseHeaderFields;
}

- (unint64_t)responseCode
{
  return self->_responseCode;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (BOOL)isPuntedError
{
  return [(SBKResponseStatus *)self->_responseStatus isPuntedError];
}

- (BOOL)isValidationError
{
  return [(SBKResponseStatus *)self->_responseStatus isValidationError];
}

- (BOOL)isAuthenticationError
{
  return [(SBKResponseStatus *)self->_responseStatus isAuthenticationError];
}

- (BOOL)isUnsupportedClient
{
  return [(SBKResponseStatus *)self->_responseStatus isUnsupportedClient];
}

- (BOOL)isGenericError
{
  return [(SBKResponseStatus *)self->_responseStatus isGenericError];
}

- (BOOL)shouldFileRadar
{
  return [(SBKResponseStatus *)self->_responseStatus shouldFileRadar];
}

- (BOOL)isError
{
  return [(SBKResponseStatus *)self->_responseStatus isError];
}

- (BOOL)isRecoverable
{
  return [(SBKResponseStatus *)self->_responseStatus isRecoverable];
}

- (BOOL)isSuccess
{
  return [(SBKResponseStatus *)self->_responseStatus isSuccess];
}

- (NSError)requestError
{
  return [(SBKResponseStatus *)self->_responseStatus requestError];
}

- (NSString)consoleDescription
{
  return [(SBKResponseStatus *)self->_responseStatus consoleDescription];
}

- (int64_t)statusCode
{
  return [(SBKResponseStatus *)self->_responseStatus statusCode];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)SBKResponse;
  v3 = [(SBKResponse *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" [%ld]: responseDictionary = %@, (%@)\n%@", self->_responseCode, objc_opt_class(), self->_MIMEType, self->_responseHeaderFields];

  return v4;
}

- (SBKResponse)initWithCode:(unint64_t)a3 headerFields:(id)a4 responseDictionary:(id)a5 MIMEType:(id)a6 error:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)SBKResponse;
  v16 = [(SBKResponse *)&v30 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_error, a7);
    uint64_t v18 = [v14 copy];
    MIMEType = v17->_MIMEType;
    v17->_MIMEType = (NSString *)v18;

    v17->_responseCode = a3;
    uint64_t v20 = [v12 copy];
    responseHeaderFields = v17->_responseHeaderFields;
    v17->_responseHeaderFields = (NSDictionary *)v20;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [v13 copy];
      responseDictionary = v17->_responseDictionary;
      v17->_responseDictionary = (NSDictionary *)v22;

      v24 = [(NSDictionary *)v17->_responseDictionary objectForKey:@"status"];
      uint64_t v25 = +[SBKResponseStatus responseStatusForStatusCodeNumber:v24];
      responseStatus = v17->_responseStatus;
      v17->_responseStatus = (SBKResponseStatus *)v25;

      if ([(SBKResponseStatus *)v17->_responseStatus isPuntedError]) {
        v17->_retrySeconds = 30.0;
      }
    }
    else
    {
      uint64_t v27 = +[SBKResponseStatus responseStatusForStatusCodeNumber:&unk_26DF16B90];
      v28 = v17->_responseStatus;
      v17->_responseStatus = (SBKResponseStatus *)v27;
    }
  }

  return v17;
}

- (SBKResponse)initWithURLResponse:(id)a3 responseDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 allHeaderFields];
  uint64_t v9 = [v7 statusCode];
  v10 = [v7 MIMEType];

  v11 = [[SBKResponse alloc] initWithCode:v9 headerFields:v8 responseDictionary:v6 MIMEType:v10 error:0];
  return v11;
}

+ (id)responseWithResponse:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [v3 responseCode];
  id v6 = [v3 responseHeaderFields];
  id v7 = [v3 responseDictionary];
  v8 = [v3 MIMEType];
  uint64_t v9 = [v3 error];

  v10 = (void *)[v4 initWithCode:v5 headerFields:v6 responseDictionary:v7 MIMEType:v8 error:v9];
  return v10;
}

+ (id)responseWithCode:(unint64_t)a3 headerFields:(id)a4 responseDictionary:(id)a5 MIMEType:(id)a6 error:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCode:a3 headerFields:v14 responseDictionary:v13 MIMEType:v12 error:v11];

  return v15;
}

+ (id)responseWithURLResponse:(id)a3 responseDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithURLResponse:v7 responseDictionary:v6];

  return v8;
}

@end