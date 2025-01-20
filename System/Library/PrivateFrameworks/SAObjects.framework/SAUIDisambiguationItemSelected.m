@interface SAUIDisambiguationItemSelected
+ (id)disambiguationItemSelected;
- (BOOL)requiresResponse;
- (NSString)selectedAceId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSelectedAceId:(id)a3;
@end

@implementation SAUIDisambiguationItemSelected

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"DisambiguationItemSelected";
}

+ (id)disambiguationItemSelected
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)selectedAceId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selectedAceId"];
}

- (void)setSelectedAceId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end