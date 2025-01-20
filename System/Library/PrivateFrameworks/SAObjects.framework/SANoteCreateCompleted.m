@interface SANoteCreateCompleted
+ (id)createCompleted;
- (BOOL)requiresResponse;
- (NSURL)identifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdentifier:(id)a3;
@end

@implementation SANoteCreateCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.note";
}

- (id)encodedClassName
{
  return @"CreateCompleted";
}

+ (id)createCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
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
  return 0;
}

@end