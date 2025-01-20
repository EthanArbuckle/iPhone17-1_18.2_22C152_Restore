@interface PSUIDataUsageCategoryListController
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)shouldShowSpinner;
- (PSSpecifier)spinnerSpecifier;
- (PSUIDataUsageCategoryListController)init;
- (PSUIDataUsageCategorySpecifier)parentSpecifier;
- (id)specifiers;
- (void)setParentSpecifier:(id)a3;
- (void)setSpinnerSpecifier:(id)a3;
@end

@implementation PSUIDataUsageCategoryListController

- (PSUIDataUsageCategoryListController)init
{
  v9.receiver = self;
  v9.super_class = (Class)PSUIDataUsageCategoryListController;
  v2 = [(PSUIDataUsageCategoryListController *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F5FC40]) initWithName:&stru_26D410CA0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    spinnerSpecifier = v2->_spinnerSpecifier;
    v2->_spinnerSpecifier = (PSSpecifier *)v3;

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_reloadSpecifiers name:*MEMORY[0x263F67F08] object:0];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_reloadSpecifiers name:*MEMORY[0x263F67F20] object:0];

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_reloadSpecifiers name:*MEMORY[0x263F67F18] object:0];
  }
  return v2;
}

- (id)specifiers
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if ([(PSUIDataUsageCategoryListController *)self shouldShowSpinner])
    {
      v14[0] = self->_spinnerSpecifier;
      v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
      v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      v8 = [(PSUIDataUsageCategoryListController *)self parentSpecifier];
      objc_super v9 = [v8 subcategorySpecifiers];
      v10 = (void *)[v9 mutableCopy];

      v11 = +[CTUIDataUsageSorting userSelectedComparator];
      [v10 sortUsingComparator:v11];

      [v7 addObjectsFromArray:v10];
      [MEMORY[0x263F67F00] logSpecifiers:v7 origin:@"[PSUIDataUsageCategoryListController specifiers] end"];
      v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v7;
    }
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (BOOL)shouldShowSpinner
{
  uint64_t v3 = [(PSUIDataUsageCategoryListController *)self parentSpecifier];
  if ([v3 type] != 2)
  {

    goto LABEL_5;
  }
  v4 = [(PSUIDataUsageCategoryListController *)self parentSpecifier];
  v5 = [v4 subcategorySpecifiers];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
LABEL_5:
    v8 = [(PSUIDataUsageCategoryListController *)self parentSpecifier];
    BOOL v7 = [v8 dataUsage] == 0;

    return v7;
  }
  return 0;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (PSUIDataUsageCategorySpecifier)parentSpecifier
{
  return self->_parentSpecifier;
}

- (void)setParentSpecifier:(id)a3
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
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
}

@end