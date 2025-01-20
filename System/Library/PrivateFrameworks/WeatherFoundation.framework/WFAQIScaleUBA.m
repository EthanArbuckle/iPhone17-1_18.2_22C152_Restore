@interface WFAQIScaleUBA
- (NSString)name;
- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4;
@end

@implementation WFAQIScaleUBA

- (NSString)name
{
  return (NSString *)@"UBA";
}

- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4
{
  id v5 = a4;
  v6 = [[WFAQIScaleCategoryUBA alloc] initWithCategoryIndex:a3 localizedCategoryDescription:v5];

  return v6;
}

@end