@interface SANoteSearchCompleted
+ (id)searchCompleted;
- (BOOL)requiresResponse;
- (NSArray)notes;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNotes:(id)a3;
@end

@implementation SANoteSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.note";
}

- (id)encodedClassName
{
  return @"SearchCompleted";
}

+ (id)searchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)notes
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"notes", v3);
}

- (void)setNotes:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end