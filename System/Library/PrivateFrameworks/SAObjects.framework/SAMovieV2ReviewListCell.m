@interface SAMovieV2ReviewListCell
+ (id)reviewListCell;
- (NSDate)reviewDate;
- (NSString)reviewAuthor;
- (NSString)reviewText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setReviewAuthor:(id)a3;
- (void)setReviewDate:(id)a3;
- (void)setReviewText:(id)a3;
@end

@implementation SAMovieV2ReviewListCell

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
}

- (id)encodedClassName
{
  return @"ReviewListCell";
}

+ (id)reviewListCell
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)reviewAuthor
{
  return (NSString *)[(AceObject *)self propertyForKey:@"reviewAuthor"];
}

- (void)setReviewAuthor:(id)a3
{
}

- (NSDate)reviewDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"reviewDate"];
}

- (void)setReviewDate:(id)a3
{
}

- (NSString)reviewText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"reviewText"];
}

- (void)setReviewText:(id)a3
{
}

@end