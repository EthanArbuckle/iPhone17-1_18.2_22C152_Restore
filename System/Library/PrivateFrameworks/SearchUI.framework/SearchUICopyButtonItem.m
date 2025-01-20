@interface SearchUICopyButtonItem
- (BOOL)allowsContextMenu;
- (BOOL)hasState;
- (SearchUICopyButtonItem)initWithSFButtonItem:(id)a3;
- (id)onStateSymbolName;
- (void)didUpdatePasteboard;
@end

@implementation SearchUICopyButtonItem

- (SearchUICopyButtonItem)initWithSFButtonItem:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUICopyButtonItem;
  v3 = [(SearchUIButtonItem *)&v7 initWithSFButtonItem:a3];
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x1E4FB2E20];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v3 selector:sel_didUpdatePasteboard name:v4 object:0];
  }
  return v3;
}

- (BOOL)hasState
{
  return 0;
}

- (void)didUpdatePasteboard
{
  v3 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v10 = [v3 string];

  uint64_t v4 = [(SearchUIButtonItem *)self command];
  v5 = [v4 copyableItem];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 copyableString];
    unsigned int v7 = [v6 isEqualToString:v10];

    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(SearchUIButtonItem *)self setStatus:v8];
  v9 = [(SearchUIButtonItem *)self delegate];
  [v9 stateDidChangeForButtonItem:self];
}

- (id)onStateSymbolName
{
  return @"checkmark";
}

- (BOOL)allowsContextMenu
{
  return 0;
}

@end