@interface FormatPuzzleEmbedViewController
- (_TtC8NewsFeed31FormatPuzzleEmbedViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed31FormatPuzzleEmbedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)keyboardWillHideWithNotification:(id)a3;
- (void)keyboardWillShowWithNotification:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FormatPuzzleEmbedViewController

- (_TtC8NewsFeed31FormatPuzzleEmbedViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C02CD430();
}

- (_TtC8NewsFeed31FormatPuzzleEmbedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed31FormatPuzzleEmbedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatPuzzleEmbedViewController_puzzleEmbedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatPuzzleEmbedViewController_onReuse));
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed31FormatPuzzleEmbedViewController_onKeyboardWillShow));
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed31FormatPuzzleEmbedViewController_onKeyboardWillHide));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatPuzzleEmbedViewController_currentAccessoryView));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  FormatPuzzleEmbedViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  FormatPuzzleEmbedViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  FormatPuzzleEmbedViewController.viewWillDisappear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  FormatPuzzleEmbedViewController.viewWillLayoutSubviews()();
}

- (void)keyboardWillShowWithNotification:(id)a3
{
}

- (void)keyboardWillHideWithNotification:(id)a3
{
}

@end