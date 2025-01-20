@interface SAWebVideoResult
+ (id)videoResult;
- (NSNumber)runTimeInMilliseconds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRunTimeInMilliseconds:(id)a3;
@end

@implementation SAWebVideoResult

- (id)groupIdentifier
{
  return @"com.apple.ace.websearch";
}

- (id)encodedClassName
{
  return @"VideoResult";
}

+ (id)videoResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)runTimeInMilliseconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"runTimeInMilliseconds"];
}

- (void)setRunTimeInMilliseconds:(id)a3
{
}

@end