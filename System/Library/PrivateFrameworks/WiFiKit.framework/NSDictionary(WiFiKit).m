@interface NSDictionary(WiFiKit)
- (id)plistString;
@end

@implementation NSDictionary(WiFiKit)

- (id)plistString
{
  v1 = [MEMORY[0x263F08AC0] dataWithPropertyList:a1 format:100 options:0 error:0];
  v2 = (void *)[[NSString alloc] initWithData:v1 encoding:4];

  return v2;
}

@end