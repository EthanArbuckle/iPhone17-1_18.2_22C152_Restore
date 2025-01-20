@interface CalendarUsageBundleDetailController
- (id)specifiers;
- (void)loadView;
@end

@implementation CalendarUsageBundleDetailController

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CalendarUsageBundleDetailController;
  [(CalendarUsageBundleDetailController *)&v3 loadView];
  [(CalendarUsageBundleDetailController *)self setEditingButtonHidden:1 animated:0];
}

- (id)specifiers
{
  objc_super v3 = *(void **)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v26 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = [(CalendarUsageBundleDetailController *)self specifier];
    v6 = [v5 propertyForKey:PSUsageBundleAppKey];

    v7 = [v6 name];
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v8 setProperty:@"PSUsageSizeHeader" forKey:PSHeaderCellClassGroupKey];
    v29 = self;
    v9 = [(CalendarUsageBundleDetailController *)self specifier];
    v10 = [v9 propertyForKey:@"TOTAL_SIZE"];
    [v8 setProperty:v10 forKey:@"SIZE"];

    v28 = v4;
    v24 = v8;
    [v4 insertObject:v8 atIndex:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v25 = v6;
    id obj = [v6 categories];
    id v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v31;
      uint64_t v14 = PSUsageBundleCategoryKey;
      uint64_t v15 = PSIDKey;
      uint64_t v16 = PSCellClassKey;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v19 = [v18 name];
          v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:v29 set:0 get:"sizeForSpecifier:" detail:0 cell:4 edit:0];

          [v20 setProperty:v18 forKey:v14];
          v21 = [v18 name];
          [v20 setProperty:v21 forKey:v15];

          [v20 setProperty:objc_opt_class() forKey:v16];
          [v28 addObject:v20];
        }
        id v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v12);
    }

    v22 = *(void **)&v29->PSUsageBundleDetailController_opaque[v26];
    *(void *)&v29->PSUsageBundleDetailController_opaque[v26] = v28;

    objc_super v3 = *(void **)&v29->PSUsageBundleDetailController_opaque[v26];
  }

  return v3;
}

@end