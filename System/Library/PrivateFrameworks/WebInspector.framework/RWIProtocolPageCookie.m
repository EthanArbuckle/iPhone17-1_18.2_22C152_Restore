@interface RWIProtocolPageCookie
- (BOOL)httpOnly;
- (BOOL)secure;
- (BOOL)session;
- (NSString)domain;
- (NSString)name;
- (NSString)path;
- (NSString)value;
- (RWIProtocolPageCookie)initWithName:(id)a3 value:(id)a4 domain:(id)a5 path:(id)a6 expires:(double)a7 session:(BOOL)a8 httpOnly:(BOOL)a9 secure:(BOOL)a10 sameSite:(int64_t)a11;
- (double)expires;
- (int64_t)sameSite;
- (void)setDomain:(id)a3;
- (void)setExpires:(double)a3;
- (void)setHttpOnly:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPath:(id)a3;
- (void)setSameSite:(int64_t)a3;
- (void)setSecure:(BOOL)a3;
- (void)setSession:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation RWIProtocolPageCookie

- (RWIProtocolPageCookie)initWithName:(id)a3 value:(id)a4 domain:(id)a5 path:(id)a6 expires:(double)a7 session:(BOOL)a8 httpOnly:(BOOL)a9 secure:(BOOL)a10 sameSite:(int64_t)a11
{
  BOOL v11 = a9;
  BOOL v12 = a8;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  v25.receiver = self;
  v25.super_class = (Class)RWIProtocolPageCookie;
  v22 = [(RWIProtocolJSONObject *)&v25 init];
  if (v22)
  {
    if (!v18) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"name" format];
    }
    if (!v19) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"value" format];
    }
    if (!v20) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"domain" format];
    }
    if (!v21) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"path" format];
    }
    [(RWIProtocolPageCookie *)v22 setName:v18];
    [(RWIProtocolPageCookie *)v22 setValue:v19];
    [(RWIProtocolPageCookie *)v22 setDomain:v20];
    [(RWIProtocolPageCookie *)v22 setPath:v21];
    [(RWIProtocolPageCookie *)v22 setExpires:a7];
    [(RWIProtocolPageCookie *)v22 setSession:v12];
    [(RWIProtocolPageCookie *)v22 setHttpOnly:v11];
    [(RWIProtocolPageCookie *)v22 setSecure:a10];
    [(RWIProtocolPageCookie *)v22 setSameSite:a11];
    v23 = v22;
  }

  return v22;
}

- (void)setName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"name"];
}

- (NSString)name
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageCookie;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"name"];
  return (NSString *)v2;
}

- (void)setValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"value"];
}

- (NSString)value
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageCookie;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"value"];
  return (NSString *)v2;
}

- (void)setDomain:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"domain"];
}

- (NSString)domain
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageCookie;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"domain"];
  return (NSString *)v2;
}

- (void)setPath:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"path"];
}

- (NSString)path
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageCookie;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"path"];
  return (NSString *)v2;
}

- (void)setExpires:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"expires" forKey:a3];
}

- (double)expires
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"expires"];
  return result;
}

- (void)setSession:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"session"];
}

- (BOOL)session
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"session"];
}

- (void)setHttpOnly:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"httpOnly"];
}

- (BOOL)httpOnly
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"httpOnly"];
}

- (void)setSecure:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"secure"];
}

- (BOOL)secure
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageCookie;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"secure"];
}

- (void)setSameSite:(int64_t)a3
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
  v6.super_class = (Class)RWIProtocolPageCookie;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"sameSite"];

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

- (int64_t)sameSite
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolPageCookie;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"sameSite"];
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
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageCookieSameSitePolicy>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageCookieSameSitePolicy>(WTF::String const&)::mappings)[i + 1]))
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
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolPageCookieSameSitePolicy>(WTF::String const&)::mappings)[i + 2];
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

@end