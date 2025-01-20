@interface RWIProtocolDOMStorageStorageId
- (BOOL)isLocalStorage;
- (NSString)securityOrigin;
- (RWIProtocolDOMStorageStorageId)initWithSecurityOrigin:(id)a3 isLocalStorage:(BOOL)a4;
- (void)setIsLocalStorage:(BOOL)a3;
- (void)setSecurityOrigin:(id)a3;
@end

@implementation RWIProtocolDOMStorageStorageId

- (RWIProtocolDOMStorageStorageId)initWithSecurityOrigin:(id)a3 isLocalStorage:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolDOMStorageStorageId;
  v7 = [(RWIProtocolJSONObject *)&v10 init];
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"securityOrigin" format];
    }
    [(RWIProtocolDOMStorageStorageId *)v7 setSecurityOrigin:v6];
    [(RWIProtocolDOMStorageStorageId *)v7 setIsLocalStorage:v4];
    v8 = v7;
  }

  return v7;
}

- (void)setSecurityOrigin:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMStorageStorageId;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"securityOrigin"];
}

- (NSString)securityOrigin
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMStorageStorageId;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"securityOrigin"];
  return (NSString *)v2;
}

- (void)setIsLocalStorage:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMStorageStorageId;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isLocalStorage"];
}

- (BOOL)isLocalStorage
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMStorageStorageId;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isLocalStorage"];
}

@end