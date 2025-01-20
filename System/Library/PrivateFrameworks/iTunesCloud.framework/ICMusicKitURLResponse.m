@interface ICMusicKitURLResponse
- (ICMusicKitURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyData:(id)a5 performanceMetrics:(id)a6;
- (ICMusicKitURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyDataURL:(id)a5 performanceMetrics:(id)a6;
- (NSError)serverError;
- (NSString)serverCorrelationKey;
- (NSString)serverEnvironment;
- (id)_parseServerError;
- (id)_parseServerErrorDictionary:(id)a3;
- (id)description;
- (void)_initializeMusicKitURLResponse;
@end

@implementation ICMusicKitURLResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverError, 0);
  objc_storeStrong((id *)&self->_serverEnvironment, 0);

  objc_storeStrong((id *)&self->_serverCorrelationKey, 0);
}

- (NSError)serverError
{
  return self->_serverError;
}

- (NSString)serverEnvironment
{
  return self->_serverEnvironment;
}

- (NSString)serverCorrelationKey
{
  return self->_serverCorrelationKey;
}

- (void)_initializeMusicKitURLResponse
{
  id v9 = [(ICURLResponse *)self urlResponse];
  objc_msgSend(v9, "ic_valueForHTTPHeaderField:", @"x-apple-jingle-correlation-key");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  serverCorrelationKey = self->_serverCorrelationKey;
  self->_serverCorrelationKey = v3;

  objc_msgSend(v9, "ic_valueForHTTPHeaderField:", @"X-Apple-Application-Site");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  serverEnvironment = self->_serverEnvironment;
  self->_serverEnvironment = v5;

  v7 = [(ICMusicKitURLResponse *)self _parseServerError];
  serverError = self->_serverError;
  self->_serverError = v7;
}

- (id)_parseServerErrorDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "ic_stringValueForKey:", @"id");
  uint64_t v6 = objc_msgSend(v4, "ic_integerValueForKey:", @"status");
  uint64_t v7 = objc_msgSend(v4, "ic_integerValueForKey:", @"code");
  v8 = objc_msgSend(v4, "ic_stringValueForKey:", @"title");
  uint64_t v9 = objc_msgSend(v4, "ic_stringValueForKey:", @"detail");
  v10 = (void *)v9;
  if (v5 && v6 && v7 && v8 && v9)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICMusicKitServerError", v7, @"%@ (%ld). %@ (%ld). id=%@", v8, v6, v9, v7, v5);
  }
  else
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "Failed to parse server error for %{public}@. Raw error dictionary: %{public}@.", buf, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

- (id)_parseServerError
{
  v3 = [(ICURLResponse *)self urlResponse];
  if ([v3 statusCode] < 400)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v4 = [(ICURLResponse *)self parsedBodyDictionary];
    v5 = objc_msgSend(v4, "ic_arrayValueForKey:", @"errors");
    uint64_t v6 = [v5 firstObject];
    if (_NSIsNSDictionary())
    {
      uint64_t v7 = [(ICMusicKitURLResponse *)self _parseServerErrorDictionary:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  uint64_t v7 = [(ICURLResponse *)self statusCode];
  if (v7)
  {
    v8 = ICURLResponseStatusCodeGetDebuggingDescription(v7);
    [v6 appendFormat:@"; statusCode = %@", v8];
  }
  if (self->_serverCorrelationKey) {
    [v6 appendFormat:@"; serverCorrelationKey = \"%@\"", self->_serverCorrelationKey];
  }
  if (self->_serverEnvironment) {
    [v6 appendFormat:@"; serverEnvironment = \"%@\"", self->_serverEnvironment];
  }
  if (self->_serverError) {
    [v6 appendFormat:@"; serverError = %@", self->_serverError];
  }
  [v6 appendString:@">"];

  return v6;
}

- (ICMusicKitURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyDataURL:(id)a5 performanceMetrics:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)ICMusicKitURLResponse;
  uint64_t v6 = [(ICURLResponse *)&v9 initWithURLResponse:a3 urlRequest:a4 bodyDataURL:a5 performanceMetrics:a6];
  uint64_t v7 = v6;
  if (v6) {
    [(ICMusicKitURLResponse *)v6 _initializeMusicKitURLResponse];
  }
  return v7;
}

- (ICMusicKitURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyData:(id)a5 performanceMetrics:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)ICMusicKitURLResponse;
  uint64_t v6 = [(ICURLResponse *)&v9 initWithURLResponse:a3 urlRequest:a4 bodyData:a5 performanceMetrics:a6];
  uint64_t v7 = v6;
  if (v6) {
    [(ICMusicKitURLResponse *)v6 _initializeMusicKitURLResponse];
  }
  return v7;
}

@end