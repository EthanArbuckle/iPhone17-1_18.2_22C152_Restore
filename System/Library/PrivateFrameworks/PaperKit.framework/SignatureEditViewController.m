@interface SignatureEditViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8PaperKit27SignatureEditViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit27SignatureEditViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)addAction:(id)a3;
- (void)doneAction:(id)a3;
- (void)viewDidLoad;
@end

@implementation SignatureEditViewController

- (_TtC8PaperKit27SignatureEditViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8PaperKit27SignatureEditViewController *)SignatureEditViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit27SignatureEditViewController)initWithCoder:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit27SignatureEditViewController_panelSize) = xmmword_20C837AA0;
  uint64_t v5 = OBJC_IVAR____TtC8PaperKit27SignatureEditViewController_navigationBar;
  id v6 = objc_allocWithZone(MEMORY[0x263F829A0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  id v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit27SignatureEditViewController_completion);
  *id v8 = UnknownCanvasElementView.flags.modify;
  v8[1] = 0;

  result = (_TtC8PaperKit27SignatureEditViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  SignatureEditViewController.viewDidLoad()();
}

- (void)addAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  specialized SignatureEditViewController.addAction(_:)();
}

- (void)doneAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  specialized SignatureEditViewController.doneAction(_:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27SignatureEditViewController_navigationBar));
  swift_release();
}

@end