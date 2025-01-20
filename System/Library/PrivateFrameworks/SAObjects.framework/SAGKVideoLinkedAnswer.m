@interface SAGKVideoLinkedAnswer
+ (id)videoLinkedAnswer;
- (NSNumber)runtimeInMilliseconds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRuntimeInMilliseconds:(id)a3;
@end

@implementation SAGKVideoLinkedAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"VideoLinkedAnswer";
}

+ (id)videoLinkedAnswer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)runtimeInMilliseconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"runtimeInMilliseconds"];
}

- (void)setRuntimeInMilliseconds:(id)a3
{
}

@end