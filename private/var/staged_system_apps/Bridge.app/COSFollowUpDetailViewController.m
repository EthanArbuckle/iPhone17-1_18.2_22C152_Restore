@interface COSFollowUpDetailViewController
- (id)specifiers;
@end

@implementation COSFollowUpDetailViewController

- (id)specifiers
{
  v3 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v18 = OBJC_IVAR___PSListController__specifiers;
    v19 = self;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v25 = 0;
    id v17 = [objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.Bridge"];
    v5 = [v17 pendingFollowUpItems:&v25];
    id v16 = v25;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v11 = [v10 title];
          v12 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, 0, 0, 0, objc_opt_class(), 2, 0, v16);

          [v12 setProperty:v10 forKey:@"FollowUpItemKey"];
          [v4 addObject:v12];
        }
        id v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    v13 = *(void **)&v19->BPSListController_opaque[v18];
    *(void *)&v19->BPSListController_opaque[v18] = v4;
    id v14 = v4;

    v3 = *(void **)&v19->BPSListController_opaque[v18];
  }

  return v3;
}

@end