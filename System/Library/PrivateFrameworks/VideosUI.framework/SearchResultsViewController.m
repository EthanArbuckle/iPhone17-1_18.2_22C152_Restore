@interface SearchResultsViewController
- (_TtC8VideosUI27SearchResultsViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI27SearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_willMoveToParentViewController:(id)a3;
@end

@implementation SearchResultsViewController

- (_TtC8VideosUI27SearchResultsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3316648();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E331679C();
}

- (void)vui_willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E3316ABC();
}

- (_TtC8VideosUI27SearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E3318F10();
}

- (void).cxx_destruct
{
  sub_1E2BEA314((uint64_t)self + OBJC_IVAR____TtC8VideosUI27SearchResultsViewController_collectionImpressioner, &qword_1EBF8B120);
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI27SearchResultsViewController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27SearchResultsViewController_stackViewController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27SearchResultsViewController____lazy_storage___noContentView));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end