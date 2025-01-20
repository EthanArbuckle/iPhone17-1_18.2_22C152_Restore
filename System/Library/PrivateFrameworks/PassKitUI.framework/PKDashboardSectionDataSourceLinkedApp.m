@interface PKDashboardSectionDataSourceLinkedApp
- (BOOL)isContentLoaded;
- (NSArray)sectionIdentifiers;
- (PKDashboardSectionDataSourceDelegate)delegate;
- (PKDashboardSectionDataSourceLinkedApp)initWithStoreIDs:(id)a3 applicationBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5;
- (id)footerTextItemForSectionIdentifier:(id)a3;
- (id)itemForSectionIdentifier:(id)a3 atIndex:(unint64_t)a4;
- (id)titleForSectionIdentifier:(id)a3;
- (unint64_t)numberOfItemsInSection:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKDashboardSectionDataSourceLinkedApp

- (PKDashboardSectionDataSourceLinkedApp)initWithStoreIDs:(id)a3 applicationBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardSectionDataSourceLinkedApp;
  v11 = [(PKDashboardSectionDataSourceLinkedApp *)&v15 init];
  if (v11)
  {
    if ([v8 count] || objc_msgSend(v9, "count"))
    {
      v12 = [[PKLinkedApplication alloc] initWithApplicationIdentifiers:v9 storeIDs:v8 defaultLaunchURL:v10];
      linkedApplication = v11->_linkedApplication;
      v11->_linkedApplication = v12;

      [(PKLinkedApplication *)v11->_linkedApplication reloadApplicationStateIfNecessary];
    }
    v11->_isContentLoaded = 1;
  }

  return v11;
}

- (id)itemForSectionIdentifier:(id)a3 atIndex:(unint64_t)a4
{
  v5 = objc_alloc_init(PKDashboardPassLinkedAppItem);
  [(PKDashboardPassLinkedAppItem *)v5 setLinkedApplication:self->_linkedApplication];

  return v5;
}

- (unint64_t)numberOfItemsInSection:(id)a3
{
  return self->_isContentLoaded && self->_linkedApplication != 0;
}

- (NSArray)sectionIdentifiers
{
  return (NSArray *)&unk_1EF2BA200;
}

- (id)titleForSectionIdentifier:(id)a3
{
  return 0;
}

- (id)footerTextItemForSectionIdentifier:(id)a3
{
  return 0;
}

- (PKDashboardSectionDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDashboardSectionDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isContentLoaded
{
  return self->_isContentLoaded;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_linkedApplication, 0);
}

@end