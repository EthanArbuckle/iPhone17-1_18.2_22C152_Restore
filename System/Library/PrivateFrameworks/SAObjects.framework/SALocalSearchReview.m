@interface SALocalSearchReview
+ (id)review;
- (NSString)author;
- (NSString)comment;
- (NSString)identifier;
- (NSString)publication;
- (SACalendar)lastUpdated;
- (SALocalSearchRating)reviewRating;
- (SAUIAppPunchOut)reviewPunchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAuthor:(id)a3;
- (void)setComment:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setPublication:(id)a3;
- (void)setReviewPunchOut:(id)a3;
- (void)setReviewRating:(id)a3;
@end

@implementation SALocalSearchReview

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"Review";
}

+ (id)review
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)author
{
  return (NSString *)[(AceObject *)self propertyForKey:@"author"];
}

- (void)setAuthor:(id)a3
{
}

- (NSString)comment
{
  return (NSString *)[(AceObject *)self propertyForKey:@"comment"];
}

- (void)setComment:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"identifier"];
}

- (void)setIdentifier:(id)a3
{
}

- (SACalendar)lastUpdated
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, @"lastUpdated");
}

- (void)setLastUpdated:(id)a3
{
}

- (NSString)publication
{
  return (NSString *)[(AceObject *)self propertyForKey:@"publication"];
}

- (void)setPublication:(id)a3
{
}

- (SAUIAppPunchOut)reviewPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"reviewPunchOut");
}

- (void)setReviewPunchOut:(id)a3
{
}

- (SALocalSearchRating)reviewRating
{
  return (SALocalSearchRating *)AceObjectAceObjectForProperty(self, @"reviewRating");
}

- (void)setReviewRating:(id)a3
{
}

@end