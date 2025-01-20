@interface RWIProtocolNetworkResponse
- (NSString)mimeType;
- (NSString)statusText;
- (NSString)url;
- (RWIProtocolNetworkHeaders)headers;
- (RWIProtocolNetworkHeaders)requestHeaders;
- (RWIProtocolNetworkResourceTiming)timing;
- (RWIProtocolNetworkResponse)initWithUrl:(id)a3 status:(int)a4 statusText:(id)a5 headers:(id)a6 mimeType:(id)a7 source:(int64_t)a8;
- (RWIProtocolSecurity)security;
- (int)status;
- (int64_t)source;
- (void)setHeaders:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setRequestHeaders:(id)a3;
- (void)setSecurity:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setStatus:(int)a3;
- (void)setStatusText:(id)a3;
- (void)setTiming:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation RWIProtocolNetworkResponse

- (RWIProtocolNetworkResponse)initWithUrl:(id)a3 status:(int)a4 statusText:(id)a5 headers:(id)a6 mimeType:(id)a7 source:(int64_t)a8
{
  uint64_t v12 = *(void *)&a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)RWIProtocolNetworkResponse;
  v18 = [(RWIProtocolJSONObject *)&v21 init];
  if (v18)
  {
    if (!v14) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"url" format];
    }
    if (!v15) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"statusText" format];
    }
    if (!v16) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"headers" format];
    }
    if (!v17) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"mimeType" format];
    }
    [(RWIProtocolNetworkResponse *)v18 setUrl:v14];
    [(RWIProtocolNetworkResponse *)v18 setStatus:v12];
    [(RWIProtocolNetworkResponse *)v18 setStatusText:v15];
    [(RWIProtocolNetworkResponse *)v18 setHeaders:v16];
    [(RWIProtocolNetworkResponse *)v18 setMimeType:v17];
    [(RWIProtocolNetworkResponse *)v18 setSource:a8];
    v19 = v18;
  }

  return v18;
}

- (void)setUrl:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"url"];
}

- (NSString)url
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkResponse;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"url"];
  return (NSString *)v2;
}

- (void)setStatus:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"status"];
}

- (int)status
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"status"];
}

- (void)setStatusText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"statusText"];
}

- (NSString)statusText
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkResponse;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"statusText"];
  return (NSString *)v2;
}

- (void)setHeaders:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"headers"];
}

- (RWIProtocolNetworkHeaders)headers
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkResponse;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"headers"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolNetworkHeaders alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkResponse;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"headers"];
    [v5 toJSONObject];
    v6 = v12;
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
    v9 = v12;
    uint64_t v12 = 0;
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

- (void)setMimeType:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"mimeType"];
}

- (NSString)mimeType
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkResponse;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"mimeType"];
  return (NSString *)v2;
}

- (void)setSource:(int64_t)a3
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
  v6.super_class = (Class)RWIProtocolNetworkResponse;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"source"];

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

- (int64_t)source
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolNetworkResponse;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"source"];
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
  for (uint64_t i = 0; i != 18; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkResponseSource>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkResponseSource>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 18);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolNetworkResponseSource>(WTF::String const&)::mappings)[i + 2];
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

- (void)setRequestHeaders:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"requestHeaders"];
}

- (RWIProtocolNetworkHeaders)requestHeaders
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkResponse;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"requestHeaders"];
  if (v3)
  {
    unint64_t v4 = [RWIProtocolNetworkHeaders alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkResponse;
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
    uint64_t v12 = 0;
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

- (void)setTiming:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"timing"];
}

- (RWIProtocolNetworkResourceTiming)timing
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkResponse;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"timing"];
  if (v3)
  {
    unint64_t v4 = [RWIProtocolNetworkResourceTiming alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkResponse;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"timing"];
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
    uint64_t v12 = 0;
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

- (void)setSecurity:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResponse;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"security"];
}

- (RWIProtocolSecurity)security
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkResponse;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"security"];
  if (v3)
  {
    unint64_t v4 = [RWIProtocolSecurity alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkResponse;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"security"];
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
    uint64_t v12 = 0;
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