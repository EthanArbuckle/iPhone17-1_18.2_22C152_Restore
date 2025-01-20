@interface SASTUserReviewItem
+ (id)userReviewItem;
- (SAUIDecoratedText)reviewDate;
- (SAUIDecoratedText)reviewText;
- (SAUIDecoratedText)reviewer;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setReviewDate:(id)a3;
- (void)setReviewText:(id)a3;
- (void)setReviewer:(id)a3;
@end

@implementation SASTUserReviewItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"UserReviewItem";
}

+ (id)userReviewItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIDecoratedText)reviewDate
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"reviewDate");
}

- (void)setReviewDate:(id)a3
{
}

- (SAUIDecoratedText)reviewText
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"reviewText");
}

- (void)setReviewText:(id)a3
{
}

- (SAUIDecoratedText)reviewer
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"reviewer");
}

- (void)setReviewer:(id)a3
{
}

@end