@interface TextStyleViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8PaperKit23TextStyleViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit23TextStyleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TextStyleViewController

- (_TtC8PaperKit23TextStyleViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit23TextStyleViewController_contentViewMargin) = (Class)0x4028000000000000;
  *(_OWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC8PaperKit23TextStyleViewController_preferredPopoverSize) = xmmword_20C837350;
  id v4 = a3;

  result = (_TtC8PaperKit23TextStyleViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  TextStyleViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8PaperKit23TextStyleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8PaperKit23TextStyleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23TextStyleViewController_textStyleView));
}

@end