@interface RWIProtocolNetworkMetrics
- (BOOL)isProxyConnection;
- (NSString)connectionIdentifier;
- (NSString)protocol;
- (NSString)remoteAddress;
- (RWIProtocolNetworkHeaders)requestHeaders;
- (RWIProtocolSecurityConnection)securityConnection;
- (double)requestBodyBytesSent;
- (double)requestHeaderBytesSent;
- (double)responseBodyBytesReceived;
- (double)responseBodyDecodedSize;
- (double)responseHeaderBytesReceived;
- (int64_t)priority;
- (void)setConnectionIdentifier:(id)a3;
- (void)setIsProxyConnection:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProtocol:(id)a3;
- (void)setRemoteAddress:(id)a3;
- (void)setRequestBodyBytesSent:(double)a3;
- (void)setRequestHeaderBytesSent:(double)a3;
- (void)setRequestHeaders:(id)a3;
- (void)setResponseBodyBytesReceived:(double)a3;
- (void)setResponseBodyDecodedSize:(double)a3;
- (void)setResponseHeaderBytesReceived:(double)a3;
- (void)setSecurityConnection:(id)a3;
@end

@implementation RWIProtocolNetworkMetrics

- (void)setProtocol:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"protocol"];
}

- (NSString)protocol
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkMetrics;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"protocol"];
  return (NSString *)v2;
}

- (void)setPriority:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  objc_super v4 = v7;
  if (v7) {
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"priority"];

  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
}

- (int64_t)priority
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolNetworkMetrics;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"priority"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 9; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkMetricsPriority>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkMetricsPriority>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 9);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolNetworkMetricsPriority>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (*v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v7 -= 2;
    }
  }
  return (int64_t)v6;
}

- (void)setConnectionIdentifier:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"connectionIdentifier"];
}

- (NSString)connectionIdentifier
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkMetrics;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"connectionIdentifier"];
  return (NSString *)v2;
}

- (void)setRemoteAddress:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"remoteAddress"];
}

- (NSString)remoteAddress
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkMetrics;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"remoteAddress"];
  return (NSString *)v2;
}

- (void)setRequestHeaders:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"requestHeaders"];
}

- (RWIProtocolNetworkHeaders)requestHeaders
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkMetrics;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"requestHeaders"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolNetworkHeaders alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkMetrics;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"requestHeaders"];
    [v5 toJSONObject];
    objc_super v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    objc_super v9 = v12;
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

- (void)setRequestHeaderBytesSent:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"requestHeaderBytesSent" forKey:a3];
}

- (double)requestHeaderBytesSent
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"requestHeaderBytesSent"];
  return result;
}

- (void)setRequestBodyBytesSent:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"requestBodyBytesSent" forKey:a3];
}

- (double)requestBodyBytesSent
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"requestBodyBytesSent"];
  return result;
}

- (void)setResponseHeaderBytesReceived:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"responseHeaderBytesReceived" forKey:a3];
}

- (double)responseHeaderBytesReceived
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"responseHeaderBytesReceived"];
  return result;
}

- (void)setResponseBodyBytesReceived:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"responseBodyBytesReceived" forKey:a3];
}

- (double)responseBodyBytesReceived
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"responseBodyBytesReceived"];
  return result;
}

- (void)setResponseBodyDecodedSize:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"responseBodyDecodedSize" forKey:a3];
}

- (double)responseBodyDecodedSize
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"responseBodyDecodedSize"];
  return result;
}

- (void)setSecurityConnection:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"securityConnection"];
}

- (RWIProtocolSecurityConnection)securityConnection
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkMetrics;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"securityConnection"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolSecurityConnection alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkMetrics;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"securityConnection"];
    [v5 toJSONObject];
    objc_super v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    objc_super v9 = v12;
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

- (void)setIsProxyConnection:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isProxyConnection"];
}

- (BOOL)isProxyConnection
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkMetrics;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isProxyConnection"];
}

@end