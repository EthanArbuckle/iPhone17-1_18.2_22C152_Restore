@interface WFAQIScaleDAQI
- (NSString)name;
- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4;
@end

@implementation WFAQIScaleDAQI

- (NSString)name
{
  return (NSString *)@"DAQI";
}

- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4
{
  id v5 = a4;
  v6 = [[WFAQIScaleCategoryDAQI alloc] initWithCategoryIndex:a3 localizedCategoryDescription:v5];

  return v6;
}

@end