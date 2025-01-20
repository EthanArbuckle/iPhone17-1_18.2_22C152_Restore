@interface SAAnswerLinkedAnswer
+ (id)linkedAnswer;
- (NSString)descriptionText;
- (NSString)name;
- (NSURL)image;
- (NSURL)link;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDescriptionText:(id)a3;
- (void)setImage:(id)a3;
- (void)setLink:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SAAnswerLinkedAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"LinkedAnswer";
}

+ (id)linkedAnswer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)descriptionText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"descriptionText"];
}

- (void)setDescriptionText:(id)a3
{
}

- (NSURL)image
{
  return (NSURL *)AceObjectURLForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (NSURL)link
{
  return (NSURL *)AceObjectURLForProperty(self, @"link");
}

- (void)setLink:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

@end