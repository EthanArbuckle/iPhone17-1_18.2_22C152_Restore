@interface SAAnswerSocialComment
+ (id)socialComment;
- (NSDate)date;
- (NSString)author;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAuthor:(id)a3;
- (void)setDate:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SAAnswerSocialComment

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"SocialComment";
}

+ (id)socialComment
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

- (NSDate)date
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"date"];
}

- (void)setDate:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end