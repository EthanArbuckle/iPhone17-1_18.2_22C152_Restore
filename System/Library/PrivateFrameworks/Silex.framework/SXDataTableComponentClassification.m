@interface SXDataTableComponentClassification
+ (id)typeString;
- (Class)componentModelClass;
- (id)textRules;
@end

@implementation SXDataTableComponentClassification

+ (id)typeString
{
  return @"data_table";
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

- (id)textRules
{
  return +[SXComponentTextRules bodyTextRules];
}

@end