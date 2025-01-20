@interface RWIProtocolNetworkWebSocketResponse
- (NSString)statusText;
- (RWIProtocolNetworkHeaders)headers;
- (RWIProtocolNetworkWebSocketResponse)initWithStatus:(int)a3 statusText:(id)a4 headers:(id)a5;
- (int)status;
- (void)setHeaders:(id)a3;
- (void)setStatus:(int)a3;
- (void)setStatusText:(id)a3;
@end

@implementation RWIProtocolNetworkWebSocketResponse

- (RWIProtocolNetworkWebSocketResponse)initWithStatus:(int)a3 statusText:(id)a4 headers:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  v10 = [(RWIProtocolJSONObject *)&v13 init];
  if (v10)
  {
    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"statusText" format];
    }
    if (!v9) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"headers" format];
    }
    [(RWIProtocolNetworkWebSocketResponse *)v10 setStatus:v6];
    [(RWIProtocolNetworkWebSocketResponse *)v10 setStatusText:v8];
    [(RWIProtocolNetworkWebSocketResponse *)v10 setHeaders:v9];
    v11 = v10;
  }

  return v10;
}

- (void)setStatus:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"status"];
}

- (int)status
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"status"];
}

- (void)setStatusText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"statusText"];
}

- (NSString)statusText
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"statusText"];
  return (NSString *)v2;
}

- (void)setHeaders:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"headers"];
}

- (RWIProtocolNetworkHeaders)headers
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"headers"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolNetworkHeaders alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkWebSocketResponse;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"headers"];
    [v5 toJSONObject];
    uint64_t v6 = v12;
    ++*v12;
    objc_super v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    id v8 = v13;
    objc_super v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    id v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v9;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end