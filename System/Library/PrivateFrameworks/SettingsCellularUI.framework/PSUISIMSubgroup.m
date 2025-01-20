@interface PSUISIMSubgroup
- (NSMutableArray)bundleControllers;
- (PSListController)listController;
- (PSSpecifier)parentSpecifier;
- (PSUISIMSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (PSUISIMSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5;
- (id)specifiers;
- (void)setBundleControllers:(id)a3;
- (void)setListController:(id)a3;
- (void)setParentSpecifier:(id)a3;
@end

@implementation PSUISIMSubgroup

- (PSUISIMSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PSUISIMSubgroup;
  v9 = [(PSUISIMSubgroup *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_listController, v7);
    objc_storeWeak((id *)&v10->_parentSpecifier, v8);
  }

  return v10;
}

- (PSUISIMSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer called" reason:@"Unsupported initializer called" userInfo:0]);
}

- (id)specifiers
{
  v33[1] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = (NSMutableArray *)objc_opt_new();
  bundleControllers = self->_bundleControllers;
  self->_bundleControllers = v4;

  uint64_t v32 = *MEMORY[0x263F5FF68];
  v33[0] = @"SIMSettings";
  uint64_t v29 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  v30 = @"items";
  v22 = (void *)v29;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
  v31 = v6;
  id v7 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  id v9 = objc_loadWeakRetained((id *)&self->_listController);
  v10 = [v9 bundle];
  id v11 = objc_loadWeakRetained((id *)&self->_listController);
  id v27 = 0;
  objc_super v12 = SpecifiersFromPlist();

  id v13 = v27;
  -[NSMutableArray addObjectsFromArray:](self->_bundleControllers, "addObjectsFromArray:", v13, &v27);
  [v3 addObjectsFromArray:v12];
  v14 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v3;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    v19 = (int *)MEMORY[0x263F5FE10];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        if (!*(void *)(*(void *)(*((void *)&v23 + 1) + 8 * i) + *v19)) {
          objc_msgSend(v14, "addObject:");
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }

  if ([v14 count]) {
    [v15 removeObjectsInArray:v14];
  }

  return v15;
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (PSSpecifier)parentSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setParentSpecifier:(id)a3
{
}

- (NSMutableArray)bundleControllers
{
  return self->_bundleControllers;
}

- (void)setBundleControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleControllers, 0);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_listController);
}

@end