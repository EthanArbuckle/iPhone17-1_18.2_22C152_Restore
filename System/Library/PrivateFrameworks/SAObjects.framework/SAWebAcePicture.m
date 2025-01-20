@interface SAWebAcePicture
+ (id)acePicture;
- (NSNumber)height;
- (NSNumber)width;
- (NSString)format;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFormat:(id)a3;
- (void)setHeight:(id)a3;
- (void)setWidth:(id)a3;
@end

@implementation SAWebAcePicture

- (id)groupIdentifier
{
  return @"com.apple.ace.websearch";
}

- (id)encodedClassName
{
  return @"AcePicture";
}

+ (id)acePicture
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)format
{
  return (NSString *)[(AceObject *)self propertyForKey:@"format"];
}

- (void)setFormat:(id)a3
{
}

- (NSNumber)height
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"height"];
}

- (void)setHeight:(id)a3
{
}

- (NSNumber)width
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"width"];
}

- (void)setWidth:(id)a3
{
}

@end