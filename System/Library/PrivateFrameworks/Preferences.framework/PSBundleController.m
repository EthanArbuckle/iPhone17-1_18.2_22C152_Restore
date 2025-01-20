@interface PSBundleController
- (PSBundleController)init;
- (PSBundleController)initWithParentListController:(id)a3;
- (id)specifiersWithSpecifier:(id)a3;
@end

@implementation PSBundleController

- (id)specifiersWithSpecifier:(id)a3
{
  return 0;
}

- (PSBundleController)init
{
  return [(PSBundleController *)self initWithParentListController:0];
}

- (PSBundleController)initWithParentListController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PSBundleController;
  v5 = [(PSBundleController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_parent, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end