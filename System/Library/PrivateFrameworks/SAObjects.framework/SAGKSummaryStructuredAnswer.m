@interface SAGKSummaryStructuredAnswer
+ (id)summaryStructuredAnswer;
- (NSArray)answerPropertyGroups;
- (NSString)category;
- (NSString)imageCaption;
- (NSString)text;
- (NSString)title;
- (NSString)titleAnnotation;
- (NSURL)image;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAnswerPropertyGroups:(id)a3;
- (void)setCategory:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageCaption:(id)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAnnotation:(id)a3;
@end

@implementation SAGKSummaryStructuredAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"SummaryStructuredAnswer";
}

+ (id)summaryStructuredAnswer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)answerPropertyGroups
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"answerPropertyGroups", v3);
}

- (void)setAnswerPropertyGroups:(id)a3
{
}

- (NSString)category
{
  return (NSString *)[(AceObject *)self propertyForKey:@"category"];
}

- (void)setCategory:(id)a3
{
}

- (NSURL)image
{
  return (NSURL *)AceObjectURLForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (NSString)imageCaption
{
  return (NSString *)[(AceObject *)self propertyForKey:@"imageCaption"];
}

- (void)setImageCaption:(id)a3
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

- (NSString)titleAnnotation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"titleAnnotation"];
}

- (void)setTitleAnnotation:(id)a3
{
}

@end