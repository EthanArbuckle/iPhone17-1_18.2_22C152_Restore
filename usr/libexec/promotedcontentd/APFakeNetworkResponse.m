@interface APFakeNetworkResponse
- (BOOL)loadConfig:(id)a3;
- (NSString)headerName;
- (NSString)headerValue;
- (id)addFakeResponseHeadersToHeaders:(id)a3;
- (void)setHeaderName:(id)a3;
- (void)setHeaderValue:(id)a3;
@end

@implementation APFakeNetworkResponse

- (BOOL)loadConfig:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = @"debug-http-status";
  uint64_t v6 = [v4 objectForKey:@"debug-http-status"];
  if (v6
    || (CFStringRef v5 = @"debug-communication-code",
        [v4 objectForKey:@"debug-communication-code"],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    [(APFakeNetworkResponse *)self setHeaderName:v5];
    v8 = [v7 stringValue];
    [(APFakeNetworkResponse *)self setHeaderValue:v8];

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)addFakeResponseHeadersToHeaders:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CFStringRef v5 = [(APFakeNetworkResponse *)self headerName];
    if ([v5 length])
    {
      uint64_t v6 = [(APFakeNetworkResponse *)self headerValue];
      id v7 = [v6 length];

      if (v7)
      {
        id v8 = [v4 mutableCopy];
        BOOL v9 = [(APFakeNetworkResponse *)self headerValue];
        v10 = [(APFakeNetworkResponse *)self headerName];
        [v8 setObject:v9 forKeyedSubscript:v10];

        id v11 = [v8 copy];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v11 = v4;
LABEL_7:

  return v11;
}

- (NSString)headerName
{
  return self->_headerName;
}

- (void)setHeaderName:(id)a3
{
}

- (NSString)headerValue
{
  return self->_headerValue;
}

- (void)setHeaderValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerValue, 0);

  objc_storeStrong((id *)&self->_headerName, 0);
}

@end