@interface SAAnswerObjectLine
+ (id)objectLine;
- (NSNumber)imageInverted;
- (NSString)text;
- (NSURL)image;
- (SAUIImageResource)imageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setImage:(id)a3;
- (void)setImageInverted:(id)a3;
- (void)setImageResource:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SAAnswerObjectLine

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"ObjectLine";
}

+ (id)objectLine
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)image
{
  return (NSURL *)AceObjectURLForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (NSNumber)imageInverted
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"imageInverted"];
}

- (void)setImageInverted:(id)a3
{
}

- (SAUIImageResource)imageResource
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"imageResource");
}

- (void)setImageResource:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end