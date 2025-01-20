@interface NBUsageDetailController
- (NSArray)deleteButtonSpecifiers;
- (UIAlertController)deleteAllAlertController;
- (id)specifiers;
- (void)deleteAllBackups;
- (void)loadView;
- (void)setDeleteAllAlertController:(id)a3;
- (void)setDeleteButtonSpecifiers:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)showDeleteAllAlert;
@end

@implementation NBUsageDetailController

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)NBUsageDetailController;
  [(NBUsageDetailController *)&v3 loadView];
  [(NBUsageDetailController *)self setEditingButtonHidden:0 animated:0];
}

- (id)specifiers
{
  objc_super v3 = *(void **)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v30 = OBJC_IVAR___PSListController__specifiers;
    v31 = self;
    v36.receiver = self;
    v36.super_class = (Class)NBUsageDetailController;
    v4 = [(NBUsageDetailController *)&v36 specifiers];
    id v5 = [v4 mutableCopy];

    v6 = [v5 firstObject];
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"NANO_BACKUPS" value:&stru_8480 table:@"Localization"];
    v29 = v6;
    [v6 setName:v8];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v33;
      uint64_t v13 = PSUsageBundleCategoryKey;
      uint64_t v14 = PSCellClassKey;
      do
      {
        v15 = v9;
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v15);
          }
          v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v18 = [v17 propertyForKey:v13];
          if (v18)
          {
            [v17 setProperty:objc_opt_class() forKey:v14];
            v19 = [v18 nanoBackup];
            [v17 setProperty:v19 forKey:@"NBBackup"];
          }
        }
        id v9 = v15;
        id v11 = [v15 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v11);
    }

    deleteButtonSpecifiers = v31->_deleteButtonSpecifiers;
    if (!deleteButtonSpecifiers)
    {
      v21 = +[NSBundle bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"REMOVE_ALL_BUTTON" value:&stru_8480 table:@"Localization"];
      v23 = +[PSSpecifier deleteButtonSpecifierWithName:v22 target:v31 action:"showDeleteAllAlert"];

      [v23 setProperty:@"DELETE_BUTTON" forKey:PSIDKey];
      v24 = +[PSSpecifier groupSpecifierWithName:0];
      v37[0] = v24;
      v37[1] = v23;
      uint64_t v25 = +[NSArray arrayWithObjects:v37 count:2];
      v26 = v31->_deleteButtonSpecifiers;
      v31->_deleteButtonSpecifiers = (NSArray *)v25;

      deleteButtonSpecifiers = v31->_deleteButtonSpecifiers;
    }
    [v9 addObjectsFromArray:deleteButtonSpecifiers];
    v27 = *(void **)&v31->PSUsageBundleDetailController_opaque[v30];
    *(void *)&v31->PSUsageBundleDetailController_opaque[v30] = v9;

    objc_super v3 = *(void **)&v31->PSUsageBundleDetailController_opaque[v30];
  }

  return v3;
}

- (void)showDeleteAllAlert
{
  objc_super v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"REMOVE_ALL_MESSAGE" value:&stru_8480 table:@"Localization"];
  id v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:0];
  deleteAllAlertController = self->_deleteAllAlertController;
  self->_deleteAllAlertController = v5;

  v7 = self->_deleteAllAlertController;
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CANCEL" value:&stru_8480 table:@"Localization"];
  id v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:0];
  [(UIAlertController *)v7 addAction:v10];

  id v11 = self->_deleteAllAlertController;
  uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"REMOVE_ALL" value:&stru_8480 table:@"Localization"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4660;
  v15[3] = &unk_8390;
  v15[4] = self;
  uint64_t v14 = +[UIAlertAction actionWithTitle:v13 style:2 handler:v15];
  [(UIAlertController *)v11 addAction:v14];

  [(NBUsageDetailController *)self presentViewController:self->_deleteAllAlertController animated:1 completion:0];
}

- (void)setEditable:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NBUsageDetailController;
  -[NBUsageDetailController setEditable:](&v7, "setEditable:");
  id v5 = [(NBUsageDetailController *)self specifierForID:@"DELETE_BUTTON"];
  v6 = +[NSNumber numberWithBool:!v3];
  [v5 setProperty:v6 forKey:PSEnabledKey];

  [(NBUsageDetailController *)self reloadSpecifier:v5 animated:0];
}

- (void)deleteAllBackups
{
  BOOL v3 = objc_opt_new();
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_4924;
  v17 = sub_4934;
  id v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_493C;
  v12[3] = &unk_83B8;
  v12[4] = &v13;
  [v3 listBackupsOfType:1 withSynchronousCompletionHandler:v12];
  if ([(id)v14[5] count])
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = dispatch_queue_create("com.apple.nanobackup.bridgeUsage.deleteAll", v4);
    id v6 = [*(id *)&self->PSUsageBundleDetailController_opaque[OBJC_IVAR___PSListController__specifiers] count];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_494C;
    block[3] = &unk_83E0;
    block[4] = self;
    id v11 = v3;
    dispatch_apply((size_t)v6, v5, block);
  }
  objc_super v7 = [(NBUsageDetailController *)self parentController];
  [v7 reloadSpecifiers];

  v8 = [(NBUsageDetailController *)self rootController];
  id v9 = [v8 popViewControllerAnimated:1];

  _Block_object_dispose(&v13, 8);
}

- (UIAlertController)deleteAllAlertController
{
  return self->_deleteAllAlertController;
}

- (void)setDeleteAllAlertController:(id)a3
{
}

- (NSArray)deleteButtonSpecifiers
{
  return self->_deleteButtonSpecifiers;
}

- (void)setDeleteButtonSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteButtonSpecifiers, 0);

  objc_storeStrong((id *)&self->_deleteAllAlertController, 0);
}

@end