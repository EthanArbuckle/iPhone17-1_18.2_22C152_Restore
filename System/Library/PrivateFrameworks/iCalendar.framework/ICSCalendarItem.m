@interface ICSCalendarItem
- (NSData)x_apple_structuredData;
- (void)setX_apple_structuredData:(id)a3;
@end

@implementation ICSCalendarItem

- (void)setX_apple_structuredData:(id)a3
{
}

- (NSData)x_apple_structuredData
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-STRUCTURED-DATA"];
  v3 = [v2 lastObject];
  v4 = [v3 value];

  return (NSData *)v4;
}

@end