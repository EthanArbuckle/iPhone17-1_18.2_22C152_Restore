@interface PSKeyboardNavigationSearchController
- (PSKeyboardNavigationSearchBar)searchBar;
- (PSKeyboardNavigationSearchController)initWithSearchResultsController:(id)a3;
- (PSKeyboardNavigationSearchResultsController)searchResultsController;
- (void)_downArrowKeyPressed;
- (void)_escapeKeyPressed;
- (void)_upArrowKeyPressed;
- (void)setSearchBar:(id)a3;
- (void)setSearchResultsController:(id)a3;
@end

@implementation PSKeyboardNavigationSearchController

- (PSKeyboardNavigationSearchController)initWithSearchResultsController:(id)a3
{
  id v4 = a3;
  v5 = [PSKeyboardNavigationSearchBar alloc];
  v6 = -[PSKeyboardNavigationSearchBar initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PSKeyboardNavigationSearchController *)self setSearchBar:v6];

  v7 = +[PSListController appearance];
  v8 = [v7 buttonTextColor];

  if (v8)
  {
    v9 = +[PSListController appearance];
    v10 = [v9 buttonTextColor];
    v11 = [(PSKeyboardNavigationSearchController *)self searchBar];
    [v11 setTintColor:v10];
  }
  v18.receiver = self;
  v18.super_class = (Class)PSKeyboardNavigationSearchController;
  v12 = [(PSKeyboardNavigationSearchController *)&v18 initWithSearchResultsController:v4];
  v13 = v12;
  if (v12)
  {
    [(PSKeyboardNavigationSearchController *)v12 setSearchResultsController:v4];
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v13 selector:sel__escapeKeyPressed name:@"PSSearchBarEscapeKeyPressedNotification" object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v13 selector:sel__downArrowKeyPressed name:@"PSSearchBarDownArrowKeyPressedNotification" object:0];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v13 selector:sel__upArrowKeyPressed name:@"PSSearchBarUpArrowKeyPressedNotification" object:0];

    [(PSKeyboardNavigationSearchController *)v13 setObscuresBackgroundDuringPresentation:1];
  }

  return v13;
}

- (PSKeyboardNavigationSearchBar)searchBar
{
  return self->searchBar;
}

- (void)setSearchResultsController:(id)a3
{
}

- (void)setSearchBar:(id)a3
{
}

- (void)_escapeKeyPressed
{
}

- (void)_downArrowKeyPressed
{
  id v2 = [(PSKeyboardNavigationSearchController *)self searchResultsController];
  [v2 selectNextSearchResult];
}

- (void)_upArrowKeyPressed
{
  id v2 = [(PSKeyboardNavigationSearchController *)self searchResultsController];
  [v2 selectPreviousSearchResult];
}

- (PSKeyboardNavigationSearchResultsController)searchResultsController
{
  return self->searchResultsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->searchBar, 0);
  objc_storeStrong((id *)&self->searchResultsController, 0);
}

@end