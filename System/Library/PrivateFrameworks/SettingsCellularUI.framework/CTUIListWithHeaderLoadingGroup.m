@interface CTUIListWithHeaderLoadingGroup
- (CTUIListWithHeaderLoadingGroup)initWithHostController:(id)a3;
- (NSArray)contentSpecifiers;
- (NSArray)headerSpecifiers;
- (PSListController)hostController;
- (PSSpecifier)spinnerSpecifier;
- (id)specifiers;
- (void)setContentSpecifiers:(id)a3;
- (void)setHeaderSpecifiers:(id)a3;
- (void)setHostController:(id)a3;
- (void)setSpinnerSpecifier:(id)a3;
@end

@implementation CTUIListWithHeaderLoadingGroup

- (CTUIListWithHeaderLoadingGroup)initWithHostController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTUIListWithHeaderLoadingGroup;
  v5 = [(CTUIListWithHeaderLoadingGroup *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_hostController, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x263F5FC40]) initWithName:&stru_26D410CA0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    spinnerSpecifier = v6->_spinnerSpecifier;
    v6->_spinnerSpecifier = (PSSpecifier *)v7;
  }
  return v6;
}

- (void)setContentSpecifiers:(id)a3
{
  id v13 = a3;
  if (v13)
  {
    p_hostController = &self->_hostController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
    [WeakRetained beginUpdates];

    p_contentSpecifiers = &self->_contentSpecifiers;
    contentSpecifiers = self->_contentSpecifiers;
    id v9 = objc_loadWeakRetained((id *)&self->_hostController);
    id v10 = v9;
    if (contentSpecifiers)
    {
      [v9 updateSpecifiers:*p_contentSpecifiers withSpecifiers:v13];
    }
    else
    {
      [v9 removeSpecifier:self->_spinnerSpecifier animated:1];

      id v10 = objc_loadWeakRetained((id *)&self->_hostController);
      v12 = [(NSArray *)self->_headerSpecifiers lastObject];
      [v10 insertContiguousSpecifiers:v13 afterSpecifier:v12 animated:1];
    }
    objc_storeStrong((id *)p_contentSpecifiers, a3);
    v11 = objc_loadWeakRetained((id *)p_hostController);
    [v11 endUpdates];
  }
  else
  {
    v11 = self->_contentSpecifiers;
    self->_contentSpecifiers = 0;
  }
}

- (id)specifiers
{
  v3 = [MEMORY[0x263EFF980] arrayWithArray:self->_headerSpecifiers];
  id v4 = v3;
  if (self->_contentSpecifiers) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  else {
    [v3 addObject:self->_spinnerSpecifier];
  }
  return v4;
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (NSArray)headerSpecifiers
{
  return self->_headerSpecifiers;
}

- (void)setHeaderSpecifiers:(id)a3
{
}

- (NSArray)contentSpecifiers
{
  return self->_contentSpecifiers;
}

- (PSSpecifier)spinnerSpecifier
{
  return self->_spinnerSpecifier;
}

- (void)setSpinnerSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerSpecifier, 0);
  objc_storeStrong((id *)&self->_contentSpecifiers, 0);
  objc_storeStrong((id *)&self->_headerSpecifiers, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end