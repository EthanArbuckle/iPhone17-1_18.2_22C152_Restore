@interface SAMediaContentRatingRestrictions
+ (id)mediaContentRatingRestrictions;
- (NSString)countryCode;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)appRestriction;
- (int64_t)movieRestriction;
- (int64_t)tvRestriction;
- (void)setAppRestriction:(int64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setMovieRestriction:(int64_t)a3;
- (void)setTvRestriction:(int64_t)a3;
@end

@implementation SAMediaContentRatingRestrictions

- (int64_t)movieRestriction
{
  return AceObjectIntegerForProperty(self, @"movieRestriction");
}

- (int64_t)tvRestriction
{
  return AceObjectIntegerForProperty(self, @"tvRestriction");
}

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"MediaContentRatingRestrictions";
}

+ (id)mediaContentRatingRestrictions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)appRestriction
{
  return AceObjectIntegerForProperty(self, @"appRestriction");
}

- (void)setAppRestriction:(int64_t)a3
{
}

- (NSString)countryCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"countryCode"];
}

- (void)setCountryCode:(id)a3
{
}

- (void)setMovieRestriction:(int64_t)a3
{
}

- (void)setTvRestriction:(int64_t)a3
{
}

@end