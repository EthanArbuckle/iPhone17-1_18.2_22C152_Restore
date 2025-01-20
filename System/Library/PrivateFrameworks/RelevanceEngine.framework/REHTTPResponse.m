@interface REHTTPResponse
- (NSData)body;
- (NSDate)date;
- (NSDictionary)headerFields;
- (NSString)contentType;
- (REHTTPResponse)initWithRequest:(id)a3 statusCode:(int64_t)a4;
- (_CFHTTPServerResponse)response;
- (id)_dateFormatter;
- (id)headerValueForKey:(id)a3;
- (int64_t)statusCode;
- (void)dealloc;
- (void)setBody:(id)a3;
- (void)setContentType:(id)a3;
- (void)setDate:(id)a3;
- (void)setHeaderValue:(id)a3 forKey:(id)a4;
@end

@implementation REHTTPResponse

- (REHTTPResponse)initWithRequest:(id)a3 statusCode:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REHTTPResponse;
  v8 = [(REHTTPResponse *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_request, a3);
    v9->_statusCode = a4;
    [v7 request];
    v9->_message = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage();
  }

  return v9;
}

- (void)dealloc
{
  message = self->_message;
  if (message) {
    CFRelease(message);
  }
  v4.receiver = self;
  v4.super_class = (Class)REHTTPResponse;
  [(REHTTPResponse *)&v4 dealloc];
}

- (NSString)contentType
{
  return (NSString *)[(REHTTPResponse *)self headerValueForKey:@"Content-Type"];
}

- (void)setContentType:(id)a3
{
}

- (id)_dateFormatter
{
  if (_dateFormatter_onceToken_0 != -1) {
    dispatch_once(&_dateFormatter_onceToken_0, &__block_literal_global_19);
  }
  v2 = (void *)_dateFormatter_dateFormatter;
  return v2;
}

void __32__REHTTPResponse__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_dateFormatter_dateFormatter;
  _dateFormatter_dateFormatter = (uint64_t)v0;

  [(id)_dateFormatter_dateFormatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss z"];
  v2 = (void *)_dateFormatter_dateFormatter;
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];

  objc_super v4 = (void *)_dateFormatter_dateFormatter;
  id v5 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"GMT"];
  [v4 setTimeZone:v5];
}

- (NSDate)date
{
  v3 = [(REHTTPResponse *)self _dateFormatter];
  objc_super v4 = [(REHTTPResponse *)self headerValueForKey:@"Date"];
  id v5 = [v3 dateFromString:v4];

  return (NSDate *)v5;
}

- (void)setDate:(id)a3
{
  id v4 = a3;
  id v6 = [(REHTTPResponse *)self _dateFormatter];
  id v5 = [v6 stringFromDate:v4];

  [(REHTTPResponse *)self setHeaderValue:v5 forKey:@"Date"];
}

- (NSDictionary)headerFields
{
  CFDictionaryRef v2 = CFHTTPMessageCopyAllHeaderFields(self->_message);
  return (NSDictionary *)v2;
}

- (NSData)body
{
  CFDataRef v2 = CFHTTPMessageCopyBody(self->_message);
  return (NSData *)v2;
}

- (void)setBody:(id)a3
{
  message = self->_message;
  CFDataRef v5 = (const __CFData *)a3;
  CFHTTPMessageSetBody(message, v5);
  id v6 = NSString;
  uint64_t v7 = [(__CFData *)v5 length];

  objc_msgSend(v6, "stringWithFormat:", @"%lu", v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(REHTTPResponse *)self setHeaderValue:v8 forKey:@"Content-Length"];
}

- (void)setHeaderValue:(id)a3 forKey:(id)a4
{
}

- (id)headerValueForKey:(id)a3
{
  v3 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(self->_message, (CFStringRef)a3);
  return v3;
}

- (_CFHTTPServerResponse)response
{
  [(REHTTPRequest *)self->_request request];
  [(REHTTPResponse *)self body];
  v3 = (_CFHTTPServerResponse *)_CFHTTPServerResponseCreateWithData();
  _CFHTTPServerResponseSetClient();
  return v3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void).cxx_destruct
{
}

@end