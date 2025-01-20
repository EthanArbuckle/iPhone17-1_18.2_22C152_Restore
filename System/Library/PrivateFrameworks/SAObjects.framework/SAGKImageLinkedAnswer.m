@interface SAGKImageLinkedAnswer
+ (id)imageLinkedAnswer;
- (NSNumber)fileSize;
- (SAUIImageResource)imageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFileSize:(id)a3;
- (void)setImageResource:(id)a3;
@end

@implementation SAGKImageLinkedAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"ImageLinkedAnswer";
}

+ (id)imageLinkedAnswer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)fileSize
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"fileSize"];
}

- (void)setFileSize:(id)a3
{
}

- (SAUIImageResource)imageResource
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"imageResource");
}

- (void)setImageResource:(id)a3
{
}

@end