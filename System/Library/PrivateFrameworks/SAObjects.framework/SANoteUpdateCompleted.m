@interface SANoteUpdateCompleted
+ (id)updateCompleted;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SANoteUpdateCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.note";
}

- (id)encodedClassName
{
  return @"UpdateCompleted";
}

+ (id)updateCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end