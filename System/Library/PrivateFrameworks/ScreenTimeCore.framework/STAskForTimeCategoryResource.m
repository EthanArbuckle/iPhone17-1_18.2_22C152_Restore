@interface STAskForTimeCategoryResource
- (STAskForTimeCategoryResource)initWithCategoryIdentifier:(id)a3 changeHandler:(id)a4;
@end

@implementation STAskForTimeCategoryResource

- (STAskForTimeCategoryResource)initWithCategoryIdentifier:(id)a3 changeHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = STCategoryNameWithIdentifier((uint64_t)v7);
  v11.receiver = self;
  v11.super_class = (Class)STAskForTimeCategoryResource;
  v9 = [(STAskForTimeResource *)&v11 initWithResourceIdentifier:v7 resourceDisplayName:v8 usageType:2 changeHandler:v6];

  return v9;
}

@end