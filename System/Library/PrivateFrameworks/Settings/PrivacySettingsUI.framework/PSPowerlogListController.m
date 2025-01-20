@interface PSPowerlogListController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PSPowerlogListController

- (id)specifiers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PSPowerlogListController;
  v2 = [(PSListItemsController *)&v13 specifiers];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 cellType])
        {
          [v7 setCellType:2];
          [v7 setDetailControllerClass:objc_opt_class()];
          [v7 setEditPaneClass:objc_opt_class()];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v4);
  }
  return v2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [(PSPowerlogListController *)self specifierAtIndex:[(PSPowerlogListController *)self indexForIndexPath:v6]];
  v8 = [v7 values];
  long long v9 = [v8 firstObject];

  long long v10 = [(PSPowerlogListController *)self selectSpecifier:v7];
  [v10 setTitle:v9];
  [v10 loadPane];
  long long v11 = [v10 pane];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[PSPowerlogListController tableView:didSelectRowAtIndexPath:]();
  }
  long long v12 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) propertyForKey:@"powerlogReader"];
  objc_super v13 = [v12 stringValueOfTable:v9];
  [v11 setText:v13];

  [(PSPowerlogListController *)self showController:v10 animate:1];
}

- (void)tableView:didSelectRowAtIndexPath:.cold.1()
{
}

@end