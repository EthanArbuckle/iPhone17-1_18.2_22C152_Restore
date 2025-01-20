@interface STFooterListItemsController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation STFooterListItemsController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    uint64_t v5 = (int)*MEMORY[0x263F5FE98];
    v6 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5) objectForKeyedSubscript:@"STFooterListItemsSwitchRestrictionKey"];

    v7 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5) objectForKeyedSubscript:@"STFooterListItems"];
    v23.receiver = self;
    v23.super_class = (Class)STFooterListItemsController;
    id v8 = [(PSListItemsController *)&v23 specifiers];
    v9 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5) objectForKeyedSubscript:@"STDisabledRadioGroupIDKey"];

    if (v9)
    {
      v10 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5) objectForKeyedSubscript:@"STDisabledRadioGroupIDKey"];
      v11 = [(STFooterListItemsController *)self specifierForID:v10];

      [v11 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    }
    v12 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v5);
    id v13 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    id v14 = v12;
    v15 = [v14 objectForKeyedSubscript:@"STTitleSectionFooterTextKey"];
    if (v15)
    {
      v16 = [v13 firstObject];
      v17 = [v14 titleDictionary];

      if (v17) {
        BOOL v18 = v16 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18) {
        [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x263F600F8]];
      }
    }
    if (v7) {
      BOOL v19 = v6 == 0;
    }
    else {
      BOOL v19 = 0;
    }
    if (v19)
    {
      v20 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v3) arrayByAddingObjectsFromArray:v7];
      v21 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v20;
    }
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STFooterListItemsController *)self specifier];
  v9 = [v8 objectForKeyedSubscript:@"STFooterListItems"];

  v10 = [(STFooterListItemsController *)self specifierAtIndexPath:v7];
  if (([v9 containsObject:v10] & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)STFooterListItemsController;
    [(STPINListItemsController *)&v11 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

@end