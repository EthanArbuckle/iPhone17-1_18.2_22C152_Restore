@interface SAAnswerAbstractSocialPost
+ (id)abstractSocialPost;
- (NSArray)comments;
- (NSDate)dateCreated;
- (NSDate)dateModified;
- (NSString)author;
- (NSString)authorTitle;
- (NSString)text;
- (NSString)title;
- (NSURL)icon;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)rank;
- (void)setAuthor:(id)a3;
- (void)setAuthorTitle:(id)a3;
- (void)setComments:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateModified:(id)a3;
- (void)setIcon:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAAnswerAbstractSocialPost

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"AbstractSocialPost";
}

+ (id)abstractSocialPost
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

- (NSString)authorTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"authorTitle"];
}

- (void)setAuthorTitle:(id)a3
{
}

- (NSArray)comments
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"comments", v3);
}

- (void)setComments:(id)a3
{
}

- (NSDate)dateCreated
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"dateCreated"];
}

- (void)setDateCreated:(id)a3
{
}

- (NSDate)dateModified
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"dateModified"];
}

- (void)setDateModified:(id)a3
{
}

- (NSURL)icon
{
  return (NSURL *)AceObjectURLForProperty(self, @"icon");
}

- (void)setIcon:(id)a3
{
}

- (int64_t)rank
{
  return AceObjectIntegerForProperty(self, @"rank");
}

- (void)setRank:(int64_t)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end