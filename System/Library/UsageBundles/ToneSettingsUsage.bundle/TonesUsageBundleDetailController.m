@interface TonesUsageBundleDetailController
- (id)specifiers;
- (void)loadView;
@end

@implementation TonesUsageBundleDetailController

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)TonesUsageBundleDetailController;
  [(TonesUsageBundleDetailController *)&v3 loadView];
  [(TonesUsageBundleDetailController *)self setEditingButtonHidden:1 animated:0];
}

- (id)specifiers
{
  objc_super v3 = *(void **)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v26 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = [(TonesUsageBundleDetailController *)self specifier];
    v6 = [v5 propertyForKey:@"USAGE_BUNDLE_APP"];

    v7 = [v6 name];
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v8 setProperty:@"PSUsageSizeHeader" forKey:PSHeaderCellClassGroupKey];
    v28 = self;
    v9 = [(TonesUsageBundleDetailController *)self specifier];
    v10 = [v9 propertyForKey:@"TOTAL_SIZE"];
    [v8 setProperty:v10 forKey:@"SIZE"];

    v11 = v4;
    v24 = v8;
    [v4 insertObject:v8 atIndex:0];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v25 = v6;
    id obj = [v6 categories];
    id v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v30;
      uint64_t v15 = PSIDKey;
      uint64_t v16 = PSCellClassKey;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v19 = [v18 name];
          v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:v28 set:0 get:"sizeForSpecifier:" detail:0 cell:4 edit:0];

          [v20 setProperty:v18 forKey:@"USAGE_BUNDLE_CATEGORY"];
          v21 = [v18 name];
          [v20 setProperty:v21 forKey:v15];

          [v20 setProperty:objc_opt_class() forKey:v16];
          [v11 addObject:v20];
        }
        id v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v13);
    }

    v22 = *(void **)&v28->PSUsageBundleDetailController_opaque[v26];
    *(void *)&v28->PSUsageBundleDetailController_opaque[v26] = v11;

    objc_super v3 = *(void **)&v28->PSUsageBundleDetailController_opaque[v26];
  }

  return v3;
}

@end