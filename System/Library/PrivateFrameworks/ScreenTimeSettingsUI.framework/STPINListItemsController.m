@interface STPINListItemsController
- (STRootViewModelCoordinator)coordinator;
- (void)didCancelEnteringPIN;
- (void)listItemSelected:(id)a3;
- (void)loadView;
- (void)prepareSpecifiersMetadata;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateFooter;
@end

@implementation STPINListItemsController

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)STPINListItemsController;
  [(STPINListItemsController *)&v7 loadView];
  uint64_t v3 = (int)*MEMORY[0x263F5FE98];
  uint64_t v4 = *MEMORY[0x263F60048];
  v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) objectForKeyedSubscript:*MEMORY[0x263F60048]];

  if (v5)
  {
    v6 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) objectForKeyedSubscript:v4];
    [(STPINListItemsController *)self setTitle:v6];
  }
}

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)[*(id *)((char *)&self->super.super.super.super.super.super.isa+ (int)*MEMORY[0x263F5FE98]) objectForKeyedSubscript:0x26D940528];
}

- (void)prepareSpecifiersMetadata
{
  v3.receiver = self;
  v3.super_class = (Class)STPINListItemsController;
  [(PSListItemsController *)&v3 prepareSpecifiersMetadata];
  [(STPINListItemsController *)self updateFooter];
}

- (void)listItemSelected:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STPINListItemsController;
  [(PSListItemsController *)&v4 listItemSelected:a3];
  [(STPINListItemsController *)self updateFooter];
}

- (void)updateFooter
{
  objc_super v3 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) properties];
  id v11 = [v3 objectForKeyedSubscript:@"STValueToGroupFootersKey"];

  if (v11)
  {
    objc_super v4 = [(STPINListItemsController *)self specifierAtIndex:*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDE0])];
    v5 = [v4 values];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      objc_super v7 = [v4 values];
      v8 = [v7 firstObject];
      v9 = [v11 objectForKeyedSubscript:v8];

      v10 = [(STPINListItemsController *)self getGroupSpecifierForSpecifier:v4];
      [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x263F600F8]];
      [(STPINListItemsController *)self reloadSpecifier:v10 animated:1];
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PSListController *)self st_shouldShowPINSheetForPINSpecifier])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__STPINListItemsController_tableView_didSelectRowAtIndexPath___block_invoke;
    v9[3] = &unk_264767278;
    id v10 = v6;
    id v11 = v7;
    v12 = self;
    [(PSListController *)self st_showPINSheetWithCompletion:v9];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STPINListItemsController;
    [(PSListItemsController *)&v8 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

id __62__STPINListItemsController_tableView_didSelectRowAtIndexPath___block_invoke(id result, int a2)
{
  if (a2)
  {
    uint64_t v2 = *((void *)result + 5);
    uint64_t v3 = *((void *)result + 4);
    v4.receiver = (id)*((void *)result + 6);
    v4.super_class = (Class)STPINListItemsController;
    return objc_msgSendSuper2(&v4, sel_tableView_didSelectRowAtIndexPath_, v3, v2);
  }
  return result;
}

- (void)didCancelEnteringPIN
{
  [(PSListController *)self st_didCancelEnteringPIN];

  [(STPINListItemsController *)self reloadSpecifiers];
}

@end