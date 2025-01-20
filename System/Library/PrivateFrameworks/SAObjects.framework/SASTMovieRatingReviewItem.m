@interface SASTMovieRatingReviewItem
+ (id)movieRatingReviewItem;
- (SASTTemplatePercentageRating)templatePercentageRating;
- (SAUIDecoratedText)reviews;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setReviews:(id)a3;
- (void)setTemplatePercentageRating:(id)a3;
@end

@implementation SASTMovieRatingReviewItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"MovieRatingReviewItem";
}

+ (id)movieRatingReviewItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIDecoratedText)reviews
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"reviews");
}

- (void)setReviews:(id)a3
{
}

- (SASTTemplatePercentageRating)templatePercentageRating
{
  return (SASTTemplatePercentageRating *)AceObjectAceObjectForProperty(self, @"templatePercentageRating");
}

- (void)setTemplatePercentageRating:(id)a3
{
}

@end