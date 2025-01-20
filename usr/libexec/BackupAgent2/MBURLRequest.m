@interface MBURLRequest
+ (MBURLRequest)requestWithMethod:(id)a3 URL:(id)a4;
+ (MBURLRequest)requestWithURL:(id)a3;
+ (id)request;
- (BOOL)shouldLog;
- (BOOL)useMMePreAuth;
- (MBURLRequest)init;
- (NSData)data;
- (NSDictionary)headers;
- (NSString)method;
- (NSURL)URL;
- (id)NSURLRequest;
- (void)dealloc;
- (void)setData:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setLog:(BOOL)a3;
- (void)setMMePreAuth:(BOOL)a3;
- (void)setMethod:(id)a3;
- (void)setURL:(id)a3;
- (void)setValue:(id)a3 forHeader:(id)a4;
@end

@implementation MBURLRequest

+ (id)request
{
  v2 = objc_alloc_init(MBURLRequest);

  return v2;
}

+ (MBURLRequest)requestWithURL:(id)a3
{
  v4 = +[MBURLRequest request];
  [(MBURLRequest *)v4 setURL:a3];
  return v4;
}

+ (MBURLRequest)requestWithMethod:(id)a3 URL:(id)a4
{
  v6 = +[MBURLRequest request];
  [(MBURLRequest *)v6 setMethod:a3];
  [(MBURLRequest *)v6 setURL:a4];
  return v6;
}

- (MBURLRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)MBURLRequest;
  v2 = [(MBURLRequest *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_method = (NSString *)@"GET";
    v2->_headers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v3->_log = 1;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBURLRequest;
  [(MBURLRequest *)&v3 dealloc];
}

- (NSDictionary)headers
{
  id v2 = [(NSMutableDictionary *)self->_headers copy];

  return (NSDictionary *)v2;
}

- (void)setHeaders:(id)a3
{
  self->_headers = (NSMutableDictionary *)[a3 mutableCopy];
}

- (void)setValue:(id)a3 forHeader:(id)a4
{
}

- (id)NSURLRequest
{
  objc_super v3 = +[NSMutableURLRequest requestWithURL:self->_URL];
  [(NSMutableURLRequest *)v3 setCachePolicy:1];
  [(NSMutableURLRequest *)v3 setTimeoutInterval:30.0];
  [(NSMutableURLRequest *)v3 setHTTPBody:self->_data];
  [(NSMutableURLRequest *)v3 setHTTPMethod:self->_method];
  [(NSMutableURLRequest *)v3 setHTTPShouldUsePipelining:1];
  [(NSMutableURLRequest *)v3 setAllHTTPHeaderFields:self->_headers];
  if (self->_MMePreAuth) {
    [(NSMutableURLRequest *)v3 _setProperty:&__kCFBooleanTrue forKey:kCFURLRequestPreAuthXMMeAuthToken];
  }
  if (sub_100092304() && [(NSURL *)self->_URL user] && [(NSURL *)self->_URL password])
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Basic %@", [(NSData *)[+[NSString stringWithFormat:@"%@:%@", [(NSURL *)self->_URL user], [(NSURL *)self->_URL password]] dataUsingEncoding:4] base64EncodedStringWithOptions:0]);
    [(NSMutableURLRequest *)v3 setValue:v4 forHTTPHeaderField:@"Authorization"];
    [(NSMutableDictionary *)self->_headers setObject:v4 forKeyedSubscript:@"Authorization"];
  }
  objc_super v5 = sub_10000B0F0();
  [(NSMutableURLRequest *)v3 setValue:v5 forHTTPHeaderField:@"User-Agent"];
  [(NSMutableDictionary *)self->_headers setObject:v5 forKeyedSubscript:@"User-Agent"];
  id v6 = [objc_alloc((Class)AKAppleIDSession) initWithIdentifier:@"com.apple.MobileBackup"];
  id v7 = [v6 appleIDHeadersForRequest:v3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v7 objectForKeyedSubscript:v12];
        [(NSMutableURLRequest *)v3 setValue:v13 forHTTPHeaderField:v12];
        [(NSMutableDictionary *)self->_headers setObject:v13 forKeyedSubscript:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v3;
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (BOOL)useMMePreAuth
{
  return self->_MMePreAuth;
}

- (void)setMMePreAuth:(BOOL)a3
{
  self->_MMePreAuth = a3;
}

- (BOOL)shouldLog
{
  return self->_log;
}

- (void)setLog:(BOOL)a3
{
  self->_log = a3;
}

@end