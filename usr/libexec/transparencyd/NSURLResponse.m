@interface NSURLResponse
- (BOOL)hasStatusCode:(int64_t)a3;
- (BOOL)requiresAuthorization;
- (BOOL)successful;
- (id)metadata;
- (id)responseValueForHeader:(id)a3;
@end

@implementation NSURLResponse

- (BOOL)hasStatusCode:(int64_t)a3
{
  return [(NSURLResponse *)self statusCode] == (id)a3;
}

- (BOOL)successful
{
  return [(NSURLResponse *)self hasStatusCode:200];
}

- (BOOL)requiresAuthorization
{
  return [(NSURLResponse *)self hasStatusCode:401];
}

- (id)metadata
{
  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = [(NSURLResponse *)v2 allHeaderFields];
    id v5 = [v4 mutableCopy];

    if (!v5) {
      id v5 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v6 = [(NSURLResponse *)v3 valueForHTTPHeaderField:@"X-Apple-Server-Hint"];
    if (v6) {
      [v5 setObject:v6 forKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)responseValueForHeader:(id)a3
{
  if (self)
  {
    self = [(NSURLResponse *)self valueForHTTPHeaderField:a3];
    uint64_t v3 = vars8;
  }
  return self;
}

@end