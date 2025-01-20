@interface SASTRatingItem
+ (id)ratingItem;
- (SASTTemplateRating)rating;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRating:(id)a3;
@end

@implementation SASTRatingItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"RatingItem";
}

+ (id)ratingItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASTTemplateRating)rating
{
  return (SASTTemplateRating *)AceObjectAceObjectForProperty(self, @"rating");
}

- (void)setRating:(id)a3
{
}

@end