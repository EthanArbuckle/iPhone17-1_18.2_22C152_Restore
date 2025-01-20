@interface SAReminderListObjectWrapper
+ (id)listObjectWrapper;
- (NSNumber)generation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGeneration:(id)a3;
@end

@implementation SAReminderListObjectWrapper

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"ListObjectWrapper";
}

+ (id)listObjectWrapper
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)generation
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"generation"];
}

- (void)setGeneration:(id)a3
{
}

@end