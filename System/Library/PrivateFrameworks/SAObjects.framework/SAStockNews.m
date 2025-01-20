@interface SAStockNews
+ (id)news;
- (NSDate)timeStamp;
- (NSString)title;
- (NSString)url;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTimeStamp:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SAStockNews

- (id)groupIdentifier
{
  return @"com.apple.ace.stock";
}

- (id)encodedClassName
{
  return @"News";
}

+ (id)news
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)timeStamp
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"timeStamp"];
}

- (void)setTimeStamp:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (NSString)url
{
  return (NSString *)[(AceObject *)self propertyForKey:@"url"];
}

- (void)setUrl:(id)a3
{
}

@end