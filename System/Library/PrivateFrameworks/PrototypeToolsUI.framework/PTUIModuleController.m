@interface PTUIModuleController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (PTSettings)settings;
- (PTUIModuleController)initWithSettings:(id)a3;
- (PTUIModuleController)initWithSettings:(id)a3 presentingRow:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_initWithModule:(id)a3 presentingRow:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reloadWithModule:(id)a3;
- (void)_updateTitle;
- (void)module:(id)a3 didInsertRows:(id)a4 deleteRows:(id)a5;
- (void)module:(id)a3 didInsertSections:(id)a4 deleteSections:(id)a5;
- (void)moduleDidReload:(id)a3;
- (void)showActionsForRowTableViewCell:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PTUIModuleController

- (PTUIModuleController)initWithSettings:(id)a3
{
  return [(PTUIModuleController *)self initWithSettings:a3 presentingRow:0];
}

- (PTUIModuleController)initWithSettings:(id)a3 presentingRow:(id)a4
{
  v6 = (void *)MEMORY[0x263F622D8];
  id v7 = a4;
  v8 = [v6 moduleWithSettings:a3];
  v9 = [(PTUIModuleController *)self _initWithModule:v8 presentingRow:v7];

  return v9;
}

- (id)_initWithModule:(id)a3 presentingRow:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PTUIModuleController;
  v9 = [(PTUIModuleController *)&v15 initWithStyle:2];
  p_isa = (id *)&v9->super.super.super.super.isa;
  if (v9)
  {
    p_module = (id *)&v9->_module;
    objc_storeStrong((id *)&v9->_module, a3);
    [*p_module addObserver:p_isa];
    v12 = [v8 title];
    v13 = v12;
    if (!v12)
    {
      v13 = [*p_module title];
    }
    objc_storeStrong(p_isa + 129, v13);
    if (!v12) {

    }
    [p_isa _updateTitle];
  }

  return p_isa;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PTUIModuleController;
  [(PTUIModuleController *)&v3 viewDidLayoutSubviews];
  [(PTUIModuleController *)self _updateTitle];
}

- (PTSettings)settings
{
  return (PTSettings *)[(PTModule *)self->_module settings];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PTUIModuleController;
  [(PTUIModuleController *)&v4 viewDidDisappear:a3];
  [(PTUIModuleController *)self setEditing:0 animated:0];
}

- (void)_reloadWithModule:(id)a3
{
  objc_super v4 = (PTModule *)a3;
  [(PTModule *)self->_module removeObserver:self];
  module = self->_module;
  self->_module = v4;
  v6 = v4;

  id v7 = [(PTModule *)self->_module title];
  title = self->_title;
  self->_title = v7;

  [(PTUIModuleController *)self _updateTitle];
  [(PTModule *)self->_module addObserver:self];

  id v9 = [(PTUIModuleController *)self tableView];
  [v9 reloadData];
}

- (void)_updateTitle
{
  objc_super v3 = [(PTUIModuleController *)self navigationItem];
  [v3 setTitle:self->_title];

  objc_super v4 = [(PTUIModuleController *)self view];
  v5 = [v4 window];
  id v7 = [v5 windowScene];

  v6 = v7;
  if (v7)
  {
    [v7 setTitle:self->_title];
    v6 = v7;
  }
}

- (void)module:(id)a3 didInsertSections:(id)a4 deleteSections:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PTUIModuleController *)self tableView];
  [v9 beginUpdates];

  v10 = [(PTUIModuleController *)self tableView];
  [v10 insertSections:v8 withRowAnimation:100];

  v11 = [(PTUIModuleController *)self tableView];
  [v11 deleteSections:v7 withRowAnimation:100];

  id v12 = [(PTUIModuleController *)self tableView];
  [v12 endUpdates];
}

- (void)module:(id)a3 didInsertRows:(id)a4 deleteRows:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PTUIModuleController *)self tableView];
  [v9 beginUpdates];

  v10 = [(PTUIModuleController *)self tableView];
  [v10 insertRowsAtIndexPaths:v8 withRowAnimation:100];

  v11 = [(PTUIModuleController *)self tableView];
  [v11 deleteRowsAtIndexPaths:v7 withRowAnimation:100];

  id v12 = [(PTUIModuleController *)self tableView];
  [v12 endUpdates];
}

- (void)moduleDidReload:(id)a3
{
  id v3 = [(PTUIModuleController *)self tableView];
  [v3 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(PTModule *)self->_module numberOfSections];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(PTModule *)self->_module sectionAtIndex:a4];
  int64_t v5 = [v4 numberOfRows];

  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  objc_super v4 = [(PTModule *)self->_module sectionAtIndex:a4];
  int64_t v5 = [v4 title];

  if ([v5 length])
  {
    v6 = objc_opt_new();
    id v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
    [v6 setFont:v7];

    [v6 setText:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  objc_super v4 = [(PTModule *)self->_module sectionAtIndex:a4];
  int64_t v5 = [v4 footerTextGetter];

  if (v5)
  {
    v6 = v5[2](v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  module = self->_module;
  id v6 = a3;
  id v7 = [(PTModule *)module rowAtIndexPath:a4];
  id v8 = (void *)[v7 tableViewCellClass];
  id v9 = [v8 reuseIdentifierForRow:v7];
  v10 = [v6 dequeueReusableCellWithIdentifier:v9];

  if (!v10) {
    v10 = objc_msgSend(objc_alloc((Class)v8), "initWithStyle:reuseIdentifier:", objc_msgSend(v8, "cellStyleForRow:", v7), v9);
  }
  [v10 setRow:v7];

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  objc_super v4 = [(PTModule *)self->_module rowAtIndexPath:a4];
  objc_msgSend((id)objc_msgSend(v4, "tableViewCellClass"), "cellHeightForRow:", v4);
  double v6 = v5;

  return v6;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(PTModule *)self->_module rowAtIndexPath:v6];
  id v8 = [v7 action];
  if (!v8)
  {
    id v8 = [v7 defaultUIAction];
    if (!v8) {
      goto LABEL_6;
    }
  }
  id v9 = [v14 cellForRowAtIndexPath:v6];
  char v10 = [v9 isEditing];

  if ((v10 & 1) != 0
    || ([v8 handler],
        v11 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue(),
        int v12 = ((uint64_t (**)(void, void *, PTUIModuleController *))v11)[2](v11, v7, self),
        v11,
        !v12)
    || [v8 deselectsRowOnSuccess])
  {
LABEL_6:
    v13 = [(PTModule *)self->_module indexPathForRow:v7];
    [v14 deselectRowAtIndexPath:v13 animated:1];
  }
}

- (void)showActionsForRowTableViewCell:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [MEMORY[0x263EFF980] array];
  if ([v5 count])
  {
    id v6 = objc_alloc(MEMORY[0x263F1C3E8]);
    id v7 = [v4 row];
    v10[0] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    id v9 = (void *)[v6 initWithActivityItems:v8 applicationActivities:v5];

    [(PTUIModuleController *)self presentViewController:v9 animated:1 completion:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_module, 0);
}

@end