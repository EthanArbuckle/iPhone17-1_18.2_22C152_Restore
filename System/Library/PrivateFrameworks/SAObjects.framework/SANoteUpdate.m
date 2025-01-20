@interface SANoteUpdate
+ (id)update;
- (BOOL)requiresResponse;
- (NSString)contentsToAppend;
- (NSURL)identifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContentsToAppend:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation SANoteUpdate

- (id)groupIdentifier
{
  return @"com.apple.ace.note";
}

- (id)encodedClassName
{
  return @"Update";
}

+ (id)update
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)contentsToAppend
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentsToAppend"];
}

- (void)setContentsToAppend:(id)a3
{
}

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"identifier");
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end