@interface RCEndpointError
+ (id)endpointErrorWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)errorCode;
- (NSString)message;
- (NSString)stacktrace;
- (RCEndpointError)initWithErrorCode:(id)a3 message:(id)a4 stacktrace:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation RCEndpointError

+ (id)endpointErrorWithDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = RCJSONStringValue(v3, @"errorCode", @"UnknownServerError");
  v5 = RCJSONStringValue(v3, @"message", 0);
  v6 = RCJSONStringValue(v3, @"stacktrace", 0);

  v7 = RCSharedLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    v11 = v4;
    __int16 v12 = 2112;
    v13 = v5;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1A4AB3000, v7, OS_LOG_TYPE_DEFAULT, "creating endpoint error with code: %@ message: %@ stacktrace: %@", (uint8_t *)&v10, 0x20u);
  }

  v8 = [[RCEndpointError alloc] initWithErrorCode:v4 message:v5 stacktrace:v6];

  return v8;
}

- (RCEndpointError)initWithErrorCode:(id)a3 message:(id)a4 stacktrace:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RCEndpointError;
  v11 = [(RCEndpointError *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    errorCode = v11->_errorCode;
    v11->_errorCode = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    message = v11->_message;
    v11->_message = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    stacktrace = v11->_stacktrace;
    v11->_stacktrace = (NSString *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(RCEndpointError *)self errorCode];
    v7 = [v5 errorCode];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(RCEndpointError *)self message];
      id v9 = [v5 message];
      if ([v8 isEqualToString:v9])
      {
        id v10 = [(RCEndpointError *)self stacktrace];
        v11 = [v5 stacktrace];
        char v12 = [v10 isEqualToString:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(RCEndpointError *)self errorCode];
  uint64_t v4 = [v3 hash];
  id v5 = [(RCEndpointError *)self message];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RCEndpointError *)self stacktrace];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = [(RCEndpointError *)self errorCode];
  id v5 = [(RCEndpointError *)self message];
  uint64_t v6 = [(RCEndpointError *)self stacktrace];
  v7 = [v3 stringWithFormat:@"<code: %@ message: %@ stacktrace: %@>", v4, v5, v6];

  return v7;
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)stacktrace
{
  return self->_stacktrace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stacktrace, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end