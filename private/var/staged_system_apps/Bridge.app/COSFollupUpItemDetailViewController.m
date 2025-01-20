@interface COSFollupUpItemDetailViewController
- (id)specifiers;
- (void)completeTask:(id)a3;
@end

@implementation COSFollupUpItemDetailViewController

- (id)specifiers
{
  v3 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v16 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"FollowUpItemKey"];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v15 = long long v21 = 0u;
    id obj = [v15 actions];
    id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v10 = [v9 label];
          v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:13 edit:0];

          v12 = [v9 url];
          [v11 setProperty:v12 forKey:@"URLKey"];

          [v11 setButtonAction:"completeTask:"];
          [v4 addObject:v11];
        }
        id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    v13 = *(void **)&self->BPSListController_opaque[v16];
    *(void *)&self->BPSListController_opaque[v16] = v4;

    v3 = *(void **)&self->BPSListController_opaque[v16];
  }

  return v3;
}

- (void)completeTask:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.Bridge"];
  id v6 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"FollowUpItemKey"];
  uint64_t v7 = [v6 uniqueIdentifier];
  long long v18 = v7;
  v8 = +[NSArray arrayWithObjects:&v18 count:1];
  id v13 = 0;
  [v5 clearPendingFollowUpItemsWithUniqueIdentifiers:v8 error:&v13];
  id v9 = v13;

  v10 = pbb_bridge_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v6 title];
    *(_DWORD *)buf = 138412546;
    v15 = v11;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Completed Task! %@ (Error %@)", buf, 0x16u);
  }
  v12 = [v4 propertyForKey:@"URLKey"];

  if (v12) {
    BPSOpenSensitiveURLAsync();
  }
}

@end