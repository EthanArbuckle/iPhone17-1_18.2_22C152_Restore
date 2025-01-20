@interface SASTMovieStatItem
+ (id)movieStatItem;
- (NSString)contentRating;
- (SASTTemplatePercentageRating)reviewerRating;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContentRating:(id)a3;
- (void)setReviewerRating:(id)a3;
@end

@implementation SASTMovieStatItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"MovieStatItem";
}

+ (id)movieStatItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)contentRating
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentRating"];
}

- (void)setContentRating:(id)a3
{
}

- (SASTTemplatePercentageRating)reviewerRating
{
  return (SASTTemplatePercentageRating *)AceObjectAceObjectForProperty(self, @"reviewerRating");
}

- (void)setReviewerRating:(id)a3
{
}

@end