@interface COSBridgeRootController
- (COSPreferencesListController)rootListController;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)setupControllerForToolbar:(id)a3;
@end

@implementation COSBridgeRootController

- (void)setupControllerForToolbar:(id)a3
{
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [(COSBridgeRootController *)self setupControllerForToolbar:*(void *)(*((void *)&v14 + 1) + 8 * (void)v10)];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  v13.receiver = self;
  v13.super_class = (Class)COSBridgeRootController;
  [(COSBridgeRootController *)&v13 setViewControllers:v6 animated:v4];
  v11 = [v6 firstObject];
  if ([v11 conformsToProtocol:&OBJC_PROTOCOL___PSController])
  {
    v12 = [(COSBridgeRootController *)self rootListController];
    [v11 setParentController:v12];
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(COSBridgeRootController *)self setupControllerForToolbar:v6];
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)COSBridgeRootController;
    [(COSBridgeRootController *)&v10 pushViewController:v6 animated:1];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009D3AC;
    v7[3] = &unk_100243908;
    id v8 = v6;
    uint64_t v9 = self;
    +[UIViewController _performWithoutDeferringTransitions:v7];
  }
}

- (COSPreferencesListController)rootListController
{
  return self->_rootListController;
}

- (void).cxx_destruct
{
}

@end