@interface RWIProtocolNetworkRequest
- (NSString)integrity;
- (NSString)method;
- (NSString)postData;
- (NSString)url;
- (RWIProtocolNetworkHeaders)headers;
- (RWIProtocolNetworkRequest)initWithUrl:(id)a3 method:(id)a4 headers:(id)a5;
- (int64_t)referrerPolicy;
- (void)setHeaders:(id)a3;
- (void)setIntegrity:(id)a3;
- (void)setMethod:(id)a3;
- (void)setPostData:(id)a3;
- (void)setReferrerPolicy:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation RWIProtocolNetworkRequest

- (RWIProtocolNetworkRequest)initWithUrl:(id)a3 method:(id)a4 headers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkRequest;
  v11 = [(RWIProtocolJSONObject *)&v14 init];
  if (v11)
  {
    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"url" format];
    }
    if (!v9) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"method" format];
    }
    if (!v10) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"headers" format];
    }
    [(RWIProtocolNetworkRequest *)v11 setUrl:v8];
    [(RWIProtocolNetworkRequest *)v11 setMethod:v9];
    [(RWIProtocolNetworkRequest *)v11 setHeaders:v10];
    v12 = v11;
  }

  return v11;
}

- (void)setUrl:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkRequest;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"url"];
}

- (NSString)url
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkRequest;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"url"];
  return (NSString *)v2;
}

- (void)setMethod:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkRequest;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"method"];
}

- (NSString)method
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkRequest;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"method"];
  return (NSString *)v2;
}

- (void)setHeaders:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkRequest;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"headers"];
}

- (RWIProtocolNetworkHeaders)headers
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkRequest;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"headers"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolNetworkHeaders alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkRequest;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"headers"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    id v8 = v13;
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

- (void)setPostData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkRequest;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"postData"];
}

- (NSString)postData
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkRequest;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"postData"];
  return (NSString *)v2;
}

- (void)setReferrerPolicy:(int64_t)a3
{
  Inspector::toProtocolString(&v7);
  if (v7) {
    objc_super v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    objc_super v4 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolNetworkRequest;
  [(RWIProtocolJSONObject *)&v6 setString:v4 forKey:@"referrerPolicy"];

  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
}

- (int64_t)referrerPolicy
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolNetworkRequest;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"referrerPolicy"];
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
  for (uint64_t i = 0; i != 27; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkReferrerPolicy>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkReferrerPolicy>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 27);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolNetworkReferrerPolicy>(WTF::String const&)::mappings)[i + 2];
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

- (void)setIntegrity:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkRequest;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"integrity"];
}

- (NSString)integrity
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkRequest;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"integrity"];
  return (NSString *)v2;
}

@end