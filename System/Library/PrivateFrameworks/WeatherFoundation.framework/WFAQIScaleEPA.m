@interface WFAQIScaleEPA
- (NSString)name;
- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4;
@end

@implementation WFAQIScaleEPA

- (NSString)name
{
  return (NSString *)@"EPA";
}

- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4
{
  id v5 = a4;
  v6 = [[WFAQIScaleCategoryEPA alloc] initWithCategoryIndex:a3 localizedCategoryDescription:v5];

  return v6;
}

@end