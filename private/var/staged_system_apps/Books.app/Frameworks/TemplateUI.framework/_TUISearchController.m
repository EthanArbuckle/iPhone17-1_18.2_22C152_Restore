@interface _TUISearchController
- (_TUISearchBar)_searchBar;
- (_TUISearchController)initWithSearchResultsController:(id)a3;
- (id)searchBar;
@end

@implementation _TUISearchController

- (_TUISearchController)initWithSearchResultsController:(id)a3
{
  id v4 = a3;
  v5 = -[_TUISearchBar initWithFrame:]([_TUISearchBar alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  searchBar = self->__searchBar;
  self->__searchBar = v5;

  v9.receiver = self;
  v9.super_class = (Class)_TUISearchController;
  v7 = [(_TUISearchController *)&v9 initWithSearchResultsController:v4];

  return v7;
}

- (id)searchBar
{
  return self->__searchBar;
}

- (_TUISearchBar)_searchBar
{
  return self->__searchBar;
}

- (void).cxx_destruct
{
}

@end