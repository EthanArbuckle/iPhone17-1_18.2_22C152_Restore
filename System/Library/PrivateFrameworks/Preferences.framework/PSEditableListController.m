@interface PSEditableListController
- (BOOL)editable;
- (BOOL)performDeletionActionForSpecifier:(id)a3;
- (NSArray)previousRightBarButtonItems;
- (PSEditableListController)init;
- (UIBarButtonItem)editBarButtonItem;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_setEditable:(BOOL)a3 animated:(BOOL)a4;
- (void)didLock;
- (void)editDoneTapped;
- (void)setEditButtonEnabled:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEditingButtonHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setPreviousRightBarButtonItems:(id)a3;
- (void)suspend;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
@end

@implementation PSEditableListController

- (PSEditableListController)init
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PSEditableListController;
  v2 = [(PSListController *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
    v4 = PS_LocalizedString(@"EDIT");
    uint64_t v5 = [v3 initWithTitle:v4 style:0 target:v2 action:sel_editDoneTapped];
    editBarButtonItem = v2->_editBarButtonItem;
    v2->_editBarButtonItem = (UIBarButtonItem *)v5;

    v7 = [(PSEditableListController *)v2 navigationItem];
    v8 = [(PSEditableListController *)v2 editBarButtonItem];
    v12[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v7 setRightBarButtonItems:v9];
  }
  return v2;
}

- (void)setEditingButtonHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(PSEditableListController *)self setEditable:0];
    if (self->_editingDisabled != v5)
    {
      self->_editingDisabled = v5;
      v7 = [(PSEditableListController *)self navigationItem];
      [v7 setRightBarButtonItems:self->_previousRightBarButtonItems animated:v4];

      previousRightBarButtonItems = self->_previousRightBarButtonItems;
      self->_previousRightBarButtonItems = 0;
    }
  }
  else if (self->_editingDisabled)
  {
    self->_editingDisabled = 0;
    v9 = [(PSEditableListController *)self navigationItem];
    v10 = [v9 rightBarButtonItems];
    objc_super v11 = self->_previousRightBarButtonItems;
    self->_previousRightBarButtonItems = v10;

    v12 = [(PSEditableListController *)self navigationItem];
    v13 = [(PSEditableListController *)self editBarButtonItem];
    v15[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v12 setRightBarButtonItems:v14 animated:v4];
  }
}

- (void)setEditButtonEnabled:(BOOL)a3
{
}

- (void)editDoneTapped
{
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)_setEditable:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_BOOL editable = a3;
  v6 = [(PSEditableListController *)self navigationItem];
  [v6 setHidesBackButton:self->_editable animated:v4];

  if (self->_editable) {
    v7 = @"DONE";
  }
  else {
    v7 = @"EDIT";
  }
  v8 = PS_LocalizedString(v7);
  [(UIBarButtonItem *)self->_editBarButtonItem setTitle:v8];

  [(UIBarButtonItem *)self->_editBarButtonItem setStyle:2 * self->_editable];
  table = self->super._table;
  BOOL editable = self->_editable;
  [(UITableView *)table setEditing:editable animated:v4];
}

- (void)setEditable:(BOOL)a3
{
  if (self->_editable != a3) {
    -[PSEditableListController _setEditable:animated:](self, "_setEditable:animated:");
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(PSListController *)self indexForIndexPath:v5];
  if (self->_editable)
  {
    v7 = 0;
  }
  else
  {
    v8 = [(NSArray *)self->super._specifiers objectAtIndex:v6];
    v9 = [v8 propertyForKey:@"cellObject"];
    int v10 = [v9 isUserInteractionEnabled];

    if (v10) {
      v7 = v5;
    }
    else {
      v7 = 0;
    }
  }
  id v11 = v7;

  return v11;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  BOOL v4 = [(NSArray *)self->super._specifiers objectAtIndex:[(PSListController *)self indexForIndexPath:a4]];
  uint64_t v5 = v4[7];
  int64_t v7 = v5 == 1 || (unint64_t)(v5 - 3) < 2;

  return v7;
}

- (BOOL)performDeletionActionForSpecifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 propertyForKey:@"deletionAction"];
  if (NSSelectorFromString(v4))
  {
    uint64_t v5 = [v3 target];
    id v6 = (id)SFPerformSelector();

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)suspend
{
  v3.receiver = self;
  v3.super_class = (Class)PSEditableListController;
  [(PSViewController *)&v3 suspend];
  [(PSEditableListController *)self _setEditable:0 animated:0];
}

- (void)didLock
{
  v3.receiver = self;
  v3.super_class = (Class)PSEditableListController;
  [(PSViewController *)&v3 didLock];
  [(PSEditableListController *)self _setEditable:0 animated:0];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v6 = -[PSListController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5, a4);
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = v6;
    [(PSEditableListController *)self performDeletionActionForSpecifier:v6];
    uint64_t v6 = [(PSListController *)self removeSpecifier:v8 animated:1];
    uint64_t v7 = v8;
  }
  MEMORY[0x1F41817F8](v6, v7);
}

- (UIBarButtonItem)editBarButtonItem
{
  return self->_editBarButtonItem;
}

- (NSArray)previousRightBarButtonItems
{
  return self->_previousRightBarButtonItems;
}

- (void)setPreviousRightBarButtonItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_editBarButtonItem, 0);
}

@end