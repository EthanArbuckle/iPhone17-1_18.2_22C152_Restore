@interface WFAQIScaleCAQI
- (NSString)name;
- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4;
@end

@implementation WFAQIScaleCAQI

- (NSString)name
{
  return (NSString *)@"CAQI";
}

- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4
{
  id v5 = a4;
  v6 = [[WFAQIScaleCategoryCAQI alloc] initWithCategoryIndex:a3 localizedCategoryDescription:v5];

  return v6;
}

@end