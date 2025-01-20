@interface SAEmailSearchCompleted
+ (id)searchCompleted;
+ (id)searchCompletedWithEmailResults:(id)a3;
- (BOOL)requiresResponse;
- (NSArray)emailResults;
- (SAEmailSearchCompleted)initWithEmailResults:(id)a3;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEmailResults:(id)a3;
@end

@implementation SAEmailSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.email";
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

+ (id)searchCompletedWithEmailResults:(id)a3
{
  id v3 = a3;
  v4 = [[SAEmailSearchCompleted alloc] initWithEmailResults:v3];

  return v4;
}

- (SAEmailSearchCompleted)initWithEmailResults:(id)a3
{
  id v4 = a3;
  v5 = [(AceObject *)self init];
  v6 = v5;
  if (v5) {
    [(SAEmailSearchCompleted *)v5 setEmailResults:v4];
  }

  return v6;
}

- (NSArray)emailResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"emailResults", v3);
}

- (void)setEmailResults:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end