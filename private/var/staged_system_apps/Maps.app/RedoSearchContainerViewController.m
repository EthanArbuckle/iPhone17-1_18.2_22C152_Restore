@interface RedoSearchContainerViewController
- (BOOL)_canShowWhileLocked;
- (_TtC4Maps33RedoSearchContainerViewController)initWithCoder:(id)a3;
- (_TtC4Maps33RedoSearchContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)redoSearchButtonClicked:(id)a3;
- (void)viewDidLoad;
@end

@implementation RedoSearchContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100087938();
}

- (_TtC4Maps33RedoSearchContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10033F3A4();
}

- (_TtC4Maps33RedoSearchContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Maps33RedoSearchContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006C5D8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController_buttonActionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController_cardView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController____lazy_storage___redoSearchButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController____lazy_storage___stackView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController____lazy_storage___activityIndicator);
}

- (void)redoSearchButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10033F484();
}

@end