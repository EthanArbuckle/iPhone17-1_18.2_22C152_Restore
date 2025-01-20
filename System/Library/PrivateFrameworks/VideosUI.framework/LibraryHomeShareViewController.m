@interface LibraryHomeShareViewController
- (UINavigationItem)navigationItem;
- (_TtC8VideosUI30LibraryHomeShareViewController)init;
- (_TtC8VideosUI30LibraryHomeShareViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI30LibraryHomeShareViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)homeShareViewController:(id)a3 didSelectHomeShare:(id)a4;
- (void)homeShareViewController:(id)a3 didUpdateWith:(id)a4;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
@end

@implementation LibraryHomeShareViewController

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_1E30CFB68();

  return (UINavigationItem *)v3;
}

- (_TtC8VideosUI30LibraryHomeShareViewController)init
{
  return (_TtC8VideosUI30LibraryHomeShareViewController *)sub_1E30CFBA8();
}

- (_TtC8VideosUI30LibraryHomeShareViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E30CFCA0();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E30CFD28();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E30CFE44();
}

- (_TtC8VideosUI30LibraryHomeShareViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E30CFF70();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30LibraryHomeShareViewController_homeController));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI30LibraryHomeShareViewController_lastSelectedMediaLibrary);
}

- (void)homeShareViewController:(id)a3 didSelectHomeShare:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1E30D0048((uint64_t)v8, v7);
}

- (void)homeShareViewController:(id)a3 didUpdateWith:(id)a4
{
  sub_1E30D0408();
  unint64_t v6 = sub_1E387CC98();
  id v7 = a3;
  v8 = self;
  sub_1E30D0190((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

@end