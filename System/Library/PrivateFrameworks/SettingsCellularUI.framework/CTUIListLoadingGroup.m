@interface CTUIListLoadingGroup
- (CTUIListLoadingGroup)initWithHostController:(id)a3 groupSpecifier:(id)a4;
- (NSArray)specifiers;
- (PSListController)hostController;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)spinnerSpecifier;
- (void)setGroupSpecifier:(id)a3;
- (void)setHostController:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setSpinnerSpecifier:(id)a3;
@end

@implementation CTUIListLoadingGroup

- (CTUIListLoadingGroup)initWithHostController:(id)a3 groupSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CTUIListLoadingGroup;
  v8 = [(CTUIListLoadingGroup *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_hostController, v6);
    objc_storeWeak((id *)&v9->_groupSpecifier, v7);
    uint64_t v10 = [objc_alloc(MEMORY[0x263F5FC40]) initWithName:&stru_26D410CA0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    spinnerSpecifier = v9->_spinnerSpecifier;
    v9->_spinnerSpecifier = (PSSpecifier *)v10;
  }
  return v9;
}

- (void)setSpecifiers:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  if (v5 | (unint64_t)self->_specifiers)
  {
    id v15 = (id)v5;
    p_hostController = &self->_hostController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
    [WeakRetained beginUpdates];

    specifiers = self->_specifiers;
    id v9 = objc_loadWeakRetained((id *)&self->_hostController);
    uint64_t v10 = v9;
    if (specifiers) {
      [v9 removeContiguousSpecifiers:self->_specifiers animated:1];
    }
    else {
      [v9 removeSpecifier:self->_spinnerSpecifier animated:1];
    }

    objc_storeStrong((id *)&self->_specifiers, a3);
    id v11 = objc_loadWeakRetained((id *)&self->_hostController);
    if (v15)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      [v11 insertContiguousSpecifiers:v15 afterSpecifier:v12 animated:1];
    }
    else
    {
      spinnerSpecifier = self->_spinnerSpecifier;
      id v12 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      [v11 insertSpecifier:spinnerSpecifier afterSpecifier:v12 animated:1];
    }

    id v14 = objc_loadWeakRetained((id *)p_hostController);
    [v14 endUpdates];

    unint64_t v5 = (unint64_t)v15;
  }
}

- (NSArray)specifiers
{
  v3 = objc_opt_new();
  v4 = v3;
  if (self->_specifiers) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  else {
    [v3 addObject:self->_spinnerSpecifier];
  }
  return (NSArray *)v4;
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setGroupSpecifier:(id)a3
{
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
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end