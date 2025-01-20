@interface SUSearchDisplayController
- (BOOL)isNavigationBarHidingEnabled;
- (id)_createPopoverController;
- (void)_noEventSetSearchFieldText:(id)a3;
- (void)setActive:(BOOL)a3 animated:(BOOL)a4;
- (void)setNavigationBarHidingEnabled:(BOOL)a3;
@end

@implementation SUSearchDisplayController

- (void)_noEventSetSearchFieldText:(id)a3
{
  v5 = [(UISearchDisplayController *)self searchBar];
  uint64_t v6 = [(UISearchBar *)v5 delegate];
  [(UISearchBar *)v5 setDelegate:0];
  [(UISearchBar *)v5 setController:0];
  [(UISearchBar *)v5 setText:a3];
  [(UISearchBar *)v5 setController:self];
  [(UISearchBar *)v5 setDelegate:v6];
  if (![a3 length])
  {
    [(UISearchBar *)v5 setShowsSearchResultsButton:0];
  }
}

- (id)_createPopoverController
{
  v4.receiver = self;
  v4.super_class = (Class)SUSearchDisplayController;
  id v2 = [(UISearchDisplayController *)&v4 _createPopoverController];
  [v2 _setPopoverBackgroundStyle:3];
  return v2;
}

- (BOOL)isNavigationBarHidingEnabled
{
  return self->_store_navigationBarHidingEnabled;
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v4 = a4;
  BOOL v5 = a3;
  if (![(UISearchDisplayController *)self displaysSearchBarInNavigationBar]) {
    uint64_t v4 = _UIApplicationUsesLegacyUI() & v4;
  }
  v7 = [(UISearchBar *)[(UISearchDisplayController *)self searchBar] text];
  v11.receiver = self;
  v11.super_class = (Class)SUSearchDisplayController;
  [(UISearchDisplayController *)&v11 setActive:v5 animated:v4];
  [(SUSearchDisplayController *)self _noEventSetSearchFieldText:v7];
  if (v5)
  {
    if (v4) {
      int64_t v8 = 300000000;
    }
    else {
      int64_t v8 = 0;
    }
    dispatch_time_t v9 = dispatch_time(0, v8);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__SUSearchDisplayController_setActive_animated___block_invoke;
    v10[3] = &unk_264812158;
    v10[4] = self;
    v10[5] = v7;
    dispatch_after(v9, MEMORY[0x263EF83A0], v10);
  }
}

uint64_t __48__SUSearchDisplayController_setActive_animated___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) searchBar];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setText:v3];
}

- (void)setNavigationBarHidingEnabled:(BOOL)a3
{
  self->_store_navigationBarHidingEnabled = a3;
  v3.receiver = self;
  v3.super_class = (Class)SUSearchDisplayController;
  -[UISearchDisplayController setNavigationBarHidingEnabled:](&v3, sel_setNavigationBarHidingEnabled_);
}

@end