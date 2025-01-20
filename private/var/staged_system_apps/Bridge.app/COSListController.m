@interface COSListController
- (BOOL)reloadingSpecifiersUpdatesSearchModel;
- (void)reloadSpecifiers;
@end

@implementation COSListController

- (void)reloadSpecifiers
{
  if (![(COSListController *)self reloadingSpecifiersUpdatesSearchModel])
  {
    v28.receiver = self;
    v28.super_class = (Class)COSListController;
    [(COSListController *)&v28 reloadSpecifiers];
    return;
  }
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers] mutableCopy];
  v37.receiver = self;
  v37.super_class = (Class)COSListController;
  [(COSListController *)&v37 reloadSpecifiers];
  if (!v4) {
    goto LABEL_27;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = *(id *)&self->BPSListController_opaque[v3];
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (!v6) {
    goto LABEL_17;
  }
  id v8 = v6;
  uint64_t v9 = *(void *)v34;
  *(void *)&long long v7 = 138412290;
  long long v26 = v7;
  do
  {
    v10 = 0;
    do
    {
      if (*(void *)v34 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v10);
      v12 = [v11 identifier:v26];
      v13 = [v4 specifierForID:v12];

      if (v13)
      {
        [v4 removeObject:v13];
        v14 = +[PSSearchModel sharedInstance];
        [v14 reloadRootSpecifier:v13];
LABEL_10:

        goto LABEL_11;
      }
      if ([v11 cellType])
      {
        v15 = +[PSSearchModel sharedInstance];
        [v15 addRootSpecifier:v11];

        v14 = pbb_bridge_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          v40 = v11;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ADD: %@", buf, 0xCu);
        }
        goto LABEL_10;
      }
LABEL_11:

      v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    id v16 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
    id v8 = v16;
  }
  while (v16);
LABEL_17:

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v4;
  id v18 = [v17 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v18)
  {
    id v20 = v18;
    uint64_t v21 = *(void *)v30;
    *(void *)&long long v19 = 138412290;
    long long v27 = v19;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v24 = +[PSSearchModel sharedInstance];
        [v24 removeRootSpecifier:v23];

        v25 = pbb_bridge_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v27;
          v40 = v23;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "REMOVE: %@", buf, 0xCu);
        }
      }
      id v20 = [v17 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v20);
  }

LABEL_27:
}

- (BOOL)reloadingSpecifiersUpdatesSearchModel
{
  return 0;
}

@end