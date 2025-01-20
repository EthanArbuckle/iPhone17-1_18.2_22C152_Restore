@interface RWIProtocolNetworkCachedResource
- (NSString)sourceMapURL;
- (NSString)url;
- (RWIProtocolNetworkCachedResource)initWithUrl:(id)a3 type:(int64_t)a4 bodySize:(double)a5;
- (RWIProtocolNetworkResponse)response;
- (double)bodySize;
- (int64_t)type;
- (void)setBodySize:(double)a3;
- (void)setResponse:(id)a3;
- (void)setSourceMapURL:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation RWIProtocolNetworkCachedResource

- (RWIProtocolNetworkCachedResource)initWithUrl:(id)a3 type:(int64_t)a4 bodySize:(double)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RWIProtocolNetworkCachedResource;
  v9 = [(RWIProtocolJSONObject *)&v12 init];
  if (v9)
  {
    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"url" format];
    }
    [(RWIProtocolNetworkCachedResource *)v9 setUrl:v8];
    [(RWIProtocolNetworkCachedResource *)v9 setType:a4];
    [(RWIProtocolNetworkCachedResource *)v9 setBodySize:a5];
    v10 = v9;
  }

  return v9;
}

- (void)setUrl:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"url"];
}

- (NSString)url
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkCachedResource;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"url"];
  return (NSString *)v2;
}

- (void)setType:(int64_t)a3
{
  Inspector::toProtocolString(&v7);
  if (v7) {
    objc_super v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    objc_super v4 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolNetworkCachedResource;
  [(RWIProtocolJSONObject *)&v6 setString:v4 forKey:@"type"];

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

- (int64_t)type
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolNetworkCachedResource;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"type"];
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
  for (uint64_t i = 0; i != 36; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageResourceType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageResourceType>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 36);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolPageResourceType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setResponse:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"response"];
}

- (RWIProtocolNetworkResponse)response
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkCachedResource;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"response"];
  if (v3)
  {
    unint64_t v4 = [RWIProtocolNetworkResponse alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolNetworkCachedResource;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"response"];
    [v5 toJSONObject];
    objc_super v6 = v12;
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
    objc_super v9 = v12;
    objc_super v12 = 0;
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

- (void)setBodySize:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"bodySize" forKey:a3];
}

- (double)bodySize
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"bodySize"];
  return result;
}

- (void)setSourceMapURL:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkCachedResource;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"sourceMapURL"];
}

- (NSString)sourceMapURL
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolNetworkCachedResource;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"sourceMapURL"];
  return (NSString *)v2;
}

@end