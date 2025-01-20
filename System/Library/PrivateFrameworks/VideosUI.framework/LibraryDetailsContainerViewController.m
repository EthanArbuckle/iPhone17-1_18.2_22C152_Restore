@interface LibraryDetailsContainerViewController
- (_TtC8VideosUI37LibraryDetailsContainerViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI37LibraryDetailsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation LibraryDetailsContainerViewController

- (_TtC8VideosUI37LibraryDetailsContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E30CB0F0();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E30CB1D8();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E30CB5D4(v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E30CB70C(v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E30CB850();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1E30CBE68();
}

- (_TtC8VideosUI37LibraryDetailsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E30CD4D8();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8VideosUI37LibraryDetailsContainerViewController_source);
  objc_release(*(id *)((char *)&self->super._tab
                     + OBJC_IVAR____TtC8VideosUI37LibraryDetailsContainerViewController_navigationBarTraits));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI37LibraryDetailsContainerViewController_detailsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI37LibraryDetailsContainerViewController____lazy_storage___contentPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI37LibraryDetailsContainerViewController_contentView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end