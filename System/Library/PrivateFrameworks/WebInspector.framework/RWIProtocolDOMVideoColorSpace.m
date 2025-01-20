@interface RWIProtocolDOMVideoColorSpace
- (BOOL)fullRange;
- (NSString)matrix;
- (NSString)primaries;
- (NSString)transfer;
- (void)setFullRange:(BOOL)a3;
- (void)setMatrix:(id)a3;
- (void)setPrimaries:(id)a3;
- (void)setTransfer:(id)a3;
@end

@implementation RWIProtocolDOMVideoColorSpace

- (void)setFullRange:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"fullRange"];
}

- (BOOL)fullRange
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"fullRange"];
}

- (void)setMatrix:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"matrix"];
}

- (NSString)matrix
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"matrix"];
  return (NSString *)v2;
}

- (void)setPrimaries:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"primaries"];
}

- (NSString)primaries
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"primaries"];
  return (NSString *)v2;
}

- (void)setTransfer:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"transfer"];
}

- (NSString)transfer
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMVideoColorSpace;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"transfer"];
  return (NSString *)v2;
}

@end