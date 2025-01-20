@interface RWIProtocolPageFrame
- (NSString)identifier;
- (NSString)loaderId;
- (NSString)mimeType;
- (NSString)name;
- (NSString)parentId;
- (NSString)securityOrigin;
- (NSString)url;
- (RWIProtocolPageFrame)initWithIdentifier:(id)a3 loaderId:(id)a4 url:(id)a5 securityOrigin:(id)a6 mimeType:(id)a7;
- (void)setIdentifier:(id)a3;
- (void)setLoaderId:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setName:(id)a3;
- (void)setParentId:(id)a3;
- (void)setSecurityOrigin:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation RWIProtocolPageFrame

- (RWIProtocolPageFrame)initWithIdentifier:(id)a3 loaderId:(id)a4 url:(id)a5 securityOrigin:(id)a6 mimeType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RWIProtocolPageFrame;
  v17 = [(RWIProtocolJSONObject *)&v20 init];
  if (v17)
  {
    if (!v12) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"identifier" format];
    }
    if (!v13) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"loaderId" format];
    }
    if (!v14) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"url" format];
    }
    if (!v15) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"securityOrigin" format];
    }
    if (!v16) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"mimeType" format];
    }
    [(RWIProtocolPageFrame *)v17 setIdentifier:v12];
    [(RWIProtocolPageFrame *)v17 setLoaderId:v13];
    [(RWIProtocolPageFrame *)v17 setUrl:v14];
    [(RWIProtocolPageFrame *)v17 setSecurityOrigin:v15];
    [(RWIProtocolPageFrame *)v17 setMimeType:v16];
    v18 = v17;
  }

  return v17;
}

- (void)setIdentifier:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"id"];
}

- (NSString)identifier
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"id"];
  return (NSString *)v2;
}

- (void)setParentId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"parentId"];
}

- (NSString)parentId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"parentId"];
  return (NSString *)v2;
}

- (void)setLoaderId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"loaderId"];
}

- (NSString)loaderId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"loaderId"];
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"name"];
}

- (NSString)name
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"name"];
  return (NSString *)v2;
}

- (void)setUrl:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"url"];
}

- (NSString)url
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"url"];
  return (NSString *)v2;
}

- (void)setSecurityOrigin:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"securityOrigin"];
}

- (NSString)securityOrigin
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"securityOrigin"];
  return (NSString *)v2;
}

- (void)setMimeType:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"mimeType"];
}

- (NSString)mimeType
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolPageFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"mimeType"];
  return (NSString *)v2;
}

@end