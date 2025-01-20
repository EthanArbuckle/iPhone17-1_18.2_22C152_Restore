@interface TextAlignmentViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8PaperKit27TextAlignmentViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit27TextAlignmentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TextAlignmentViewController

- (void)viewDidLoad
{
  v2 = self;
  TextAlignmentViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8PaperKit27TextAlignmentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8PaperKit27TextAlignmentViewController *)TextAlignmentViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit27TextAlignmentViewController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit27TextAlignmentViewController *)TextAlignmentViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27TextAlignmentViewController_textAlignmentControl));
}

@end