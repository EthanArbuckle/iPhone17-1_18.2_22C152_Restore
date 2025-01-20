@interface SearchController
- (UISearchBar)searchBar;
- (_TtC8VideosUI16SearchController)initWithCoder:(id)a3;
- (_TtC8VideosUI16SearchController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8VideosUI16SearchController)initWithSearchResultsController:(id)a3;
@end

@implementation SearchController

- (UISearchBar)searchBar
{
  id v2 = sub_1E2C49AEC();
  return (UISearchBar *)v2;
}

- (_TtC8VideosUI16SearchController)initWithCoder:(id)a3
{
}

- (_TtC8VideosUI16SearchController)initWithSearchResultsController:(id)a3
{
  id v3 = a3;
  sub_1E374DFC8();
}

- (_TtC8VideosUI16SearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E374E00C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16SearchController_customSearchBar));
}

@end