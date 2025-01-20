@interface SearchUIContactButtonItem
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (CNContactQuickActionsController)quickActionsController;
- (NSMutableArray)menuElements;
- (NSString)actionType;
- (id)command;
- (id)previewMenu;
- (unint64_t)hash;
- (void)buttonPressed;
- (void)quickActionsControllerDidUpdateActionModels;
- (void)setActionType:(id)a3;
- (void)setMenuElements:(id)a3;
- (void)setQuickActionsController:(id)a3;
@end

@implementation SearchUIContactButtonItem

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v18.receiver = self,
        v18.super_class = (Class)SearchUIContactButtonItem,
        [(SearchUIButtonItem *)&v18 isEqual:v4]))
  {
    id v5 = v4;
    v6 = [(SearchUIContactButtonItem *)self quickActionsController];
    v7 = [v6 contact];
    v8 = [v5 quickActionsController];
    v9 = [v8 contact];
    if (v7 == v9)
    {
      char v15 = 1;
    }
    else
    {
      v17 = [(SearchUIContactButtonItem *)self quickActionsController];
      v10 = [v17 contact];
      v11 = [v5 quickActionsController];
      [v11 contact];
      v12 = v7;
      v14 = v13 = v6;
      char v15 = [v10 isEqual:v14];

      v6 = v13;
      v7 = v12;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v3 = [(SearchUIContactButtonItem *)self quickActionsController];
  id v4 = [v3 contact];

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIContactButtonItem;
    unint64_t v5 = [(SearchUIButtonItem *)&v9 hash];
    unint64_t v6 = [v4 hash] ^ v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUIContactButtonItem;
    unint64_t v6 = [(SearchUIButtonItem *)&v8 hash];
  }

  return v6;
}

- (BOOL)hasState
{
  return 0;
}

- (void)buttonPressed
{
  v3 = [(SearchUIContactButtonItem *)self quickActionsController];
  id v4 = [(SearchUIContactButtonItem *)self actionType];
  [v3 executeTapBehaviorWithoutDisambiguationForActionType:v4];

  unint64_t v5 = [(SearchUIContactButtonItem *)self quickActionsController];
  unint64_t v6 = [(SearchUIContactButtonItem *)self actionType];
  -[SearchUIButtonItem setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", [v5 hasDefaultActionForActionType:v6] ^ 1);

  id v7 = [(SearchUIButtonItem *)self delegate];
  [v7 stateDidChangeForButtonItem:self];
}

- (void)quickActionsControllerDidUpdateActionModels
{
  v3 = [(SearchUIContactButtonItem *)self quickActionsController];
  id v4 = [(SearchUIContactButtonItem *)self actionType];
  -[SearchUIButtonItem setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", [v3 hasDefaultActionForActionType:v4] ^ 1);

  id v5 = [(SearchUIButtonItem *)self delegate];
  [v5 stateDidChangeForButtonItem:self];
}

- (id)previewMenu
{
  v3 = [(SearchUIContactButtonItem *)self quickActionsController];
  id v4 = [(SearchUIContactButtonItem *)self actionType];
  id v5 = [v3 disambiguationMenuForActionType:v4];

  unint64_t v6 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F40279D8 image:0 identifier:0 options:1 children:v5];

  return v6;
}

- (id)command
{
  v3 = [(SearchUIContactButtonItem *)self actionType];
  if ([v3 isEqualToString:*MEMORY[0x1E4F1AD78]])
  {
    uint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1AD48]])
  {
    uint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1AD20]])
  {
    uint64_t v4 = 4;
  }
  else
  {
    uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F1AD38]];
  }
  id v5 = objc_opt_new();
  [v5 setContactActionType:v4];
  unint64_t v6 = [(SearchUIContactButtonItem *)self quickActionsController];
  objc_msgSend(v5, "setDidDisplayHandleOptions:", objc_msgSend(v6, "hasDefaultActionForActionType:", v3) ^ 1);

  return v5;
}

- (CNContactQuickActionsController)quickActionsController
{
  return self->_quickActionsController;
}

- (void)setQuickActionsController:(id)a3
{
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
}

- (NSMutableArray)menuElements
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMenuElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuElements, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_quickActionsController, 0);
}

@end