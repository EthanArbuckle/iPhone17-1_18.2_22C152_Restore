@interface SAMPReleaseInfo
+ (id)releaseInfo;
- (SACalendar)releaseDate;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)releaseYear;
- (void)setReleaseDate:(id)a3;
- (void)setReleaseYear:(int64_t)a3;
@end

@implementation SAMPReleaseInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"ReleaseInfo";
}

+ (id)releaseInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SACalendar)releaseDate
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, @"releaseDate");
}

- (void)setReleaseDate:(id)a3
{
}

- (int64_t)releaseYear
{
  return AceObjectIntegerForProperty(self, @"releaseYear");
}

- (void)setReleaseYear:(int64_t)a3
{
}

@end