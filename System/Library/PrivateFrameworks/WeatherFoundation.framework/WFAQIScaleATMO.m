@interface WFAQIScaleATMO
- (NSString)name;
- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4;
@end

@implementation WFAQIScaleATMO

- (NSString)name
{
  return (NSString *)@"ATMO";
}

- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4
{
  id v5 = a4;
  v6 = [[WFAQIScaleCategoryATMO alloc] initWithCategoryIndex:a3 localizedCategoryDescription:v5];

  return v6;
}

@end