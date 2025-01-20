@interface AEAssetTextActivityItemProvider
+ (id)textItemWithPropertySource:(id)a3;
- (AEAssetTextActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4;
- (BOOL)supportsActivityType:(id)a3;
- (id)item;
- (id)placeholderItem;
@end

@implementation AEAssetTextActivityItemProvider

+ (id)textItemWithPropertySource:(id)a3
{
  id v3 = a3;
  v4 = [[AEAssetActivityPropertyProvider alloc] initWithPropertySource:v3];

  v5 = _generateText(v4);

  return v5;
}

- (AEAssetTextActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v12.receiver = self;
  v12.super_class = (Class)AEAssetTextActivityItemProvider;
  v10 = [(AEAssetBaseActivityItemProvider *)&v12 initWithDelegate:v7 placeholderItem:v9 propertySource:v6];

  return v10;
}

- (BOOL)supportsActivityType:(id)a3
{
  return 1;
}

- (id)placeholderItem
{
  return &stru_2CE418;
}

- (id)item
{
  id v3 = [(AEAssetTextActivityItemProvider *)self activityType];
  v4 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
  [v4 setActivityType:v3];

  v5 = [(AEAssetTextActivityItemProvider *)self activityType];
  if ([(AEAssetBaseActivityItemProvider *)self shouldShareActivityType:v5])
  {
    id v6 = [(AEAssetBaseActivityItemProvider *)self propertyProvider];
    id v7 = _generateText(v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end