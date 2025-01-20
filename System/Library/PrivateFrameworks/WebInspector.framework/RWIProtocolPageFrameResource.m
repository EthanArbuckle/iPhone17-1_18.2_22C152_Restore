@interface RWIProtocolPageFrameResource
- (BOOL)canceled;
- (BOOL)failed;
- (NSString)mimeType;
- (NSString)sourceMapURL;
- (NSString)targetId;
- (NSString)url;
- (RWIProtocolPageFrameResource)initWithUrl:(id)a3 type:(int64_t)a4 mimeType:(id)a5;
- (int64_t)type;
- (void)setCanceled:(BOOL)a3;
- (void)setFailed:(BOOL)a3;
- (void)setMimeType:(id)a3;
- (void)setSourceMapURL:(id)a3;
- (void)setTargetId:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation RWIProtocolPageFrameResource

- (RWIProtocolPageFrameResource)initWithUrl:(id)a3 type:(int64_t)a4 mimeType:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RWIProtocolPageFrameResource;
  v10 = [(RWIProtocolJSONObject *)&v13 init];
  if (v10)
  {
    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"url" format];
    }
    if (!v9) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"mimeType" format];
    }
    [(RWIProtocolPageFrameResource *)v10 setUrl:v8];
    [(RWIProtocolPageFrameResource *)v10 setType:a4];
    [(RWIProtocolPageFrameResource *)v10 setMimeType:v9];
    v11 = v10;
  }

  return v10;
}

- (void)setUrl:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"url"];
}

- (NSString)url
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageFrameResource;
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
  v6.super_class = (Class)RWIProtocolPageFrameResource;
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
  v9.super_class = (Class)RWIProtocolPageFrameResource;
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

- (void)setMimeType:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"mimeType"];
}

- (NSString)mimeType
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageFrameResource;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"mimeType"];
  return (NSString *)v2;
}

- (void)setFailed:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"failed"];
}

- (BOOL)failed
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"failed"];
}

- (void)setCanceled:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"canceled"];
}

- (BOOL)canceled
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"canceled"];
}

- (void)setSourceMapURL:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"sourceMapURL"];
}

- (NSString)sourceMapURL
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageFrameResource;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"sourceMapURL"];
  return (NSString *)v2;
}

- (void)setTargetId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"targetId"];
}

- (NSString)targetId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageFrameResource;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"targetId"];
  return (NSString *)v2;
}

@end