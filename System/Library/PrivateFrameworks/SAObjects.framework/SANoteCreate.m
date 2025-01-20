@interface SANoteCreate
+ (id)create;
- (BOOL)requiresResponse;
- (NSString)contents;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContents:(id)a3;
@end

@implementation SANoteCreate

- (id)groupIdentifier
{
  return @"com.apple.ace.note";
}

- (id)encodedClassName
{
  return @"Create";
}

+ (id)create
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)contents
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contents"];
}

- (void)setContents:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end