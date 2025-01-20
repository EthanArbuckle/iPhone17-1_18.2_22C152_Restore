@interface RWIProtocolSecurityConnection
- (NSString)cipher;
- (NSString)protocol;
- (void)setCipher:(id)a3;
- (void)setProtocol:(id)a3;
@end

@implementation RWIProtocolSecurityConnection

- (void)setProtocol:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityConnection;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"protocol"];
}

- (NSString)protocol
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolSecurityConnection;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"protocol"];
  return (NSString *)v2;
}

- (void)setCipher:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolSecurityConnection;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"cipher"];
}

- (NSString)cipher
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolSecurityConnection;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"cipher"];
  return (NSString *)v2;
}

@end