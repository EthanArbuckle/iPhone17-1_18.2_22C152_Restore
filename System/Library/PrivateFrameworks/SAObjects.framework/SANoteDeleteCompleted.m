@interface SANoteDeleteCompleted
+ (id)deleteCompleted;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SANoteDeleteCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.note";
}

- (id)encodedClassName
{
  return @"DeleteCompleted";
}

+ (id)deleteCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end