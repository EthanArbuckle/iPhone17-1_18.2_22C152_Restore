@interface SignatureCreationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)prefersStatusBarHidden;
- (_TtC8PaperKit31SignatureCreationViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit31SignatureCreationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelAction:(id)a3;
- (void)canvasViewDrawingDidChange:(id)a3;
- (void)clearAction;
- (void)descriptionAction;
- (void)doneAction:(id)a3;
- (void)updateDoneButtonState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SignatureCreationViewController

- (_TtC8PaperKit31SignatureCreationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC8PaperKit31SignatureCreationViewController *)SignatureCreationViewController.init(nibName:bundle:)((uint64_t)a4, v6, a4);
}

- (_TtC8PaperKit31SignatureCreationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized SignatureCreationViewController.init(coder:)();
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  SignatureCreationViewController.viewDidLoad()();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  v2 = self;
  Swift::Bool v3 = SignatureCreationViewController.becomeFirstResponder()();

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  SignatureCreationViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  SignatureCreationViewController.viewDidDisappear(_:)(a3);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SignatureCreationViewController();
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = v10.receiver;
  [(SignatureCreationViewController *)&v10 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  id v8 = objc_msgSend(v7, sel_traitCollection, v10.receiver, v10.super_class);
  id v9 = objc_msgSend(v8, sel_horizontalSizeClass);

  if (v9 != objc_msgSend(v6, sel_horizontalSizeClass)) {
    SignatureCreationViewController.clearSignature(with:)(a4);
  }
  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for SignatureCreationViewController();
  swift_unknownObjectRetain();
  id v7 = v15.receiver;
  -[SignatureCreationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  id v8 = objc_msgSend(v7, sel_view, v15.receiver, v15.super_class);
  if (v8)
  {
    id v9 = v8;
    objc_msgSend(v8, sel_bounds);
    double v11 = v10;
    double v13 = v12;

    if (width != v11 || height != v13) {
      SignatureCreationViewController.clearSignature(with:)(a4);
    }
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)doneAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  specialized SignatureCreationViewController.doneAction(_:)();
}

- (void)cancelAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  specialized SignatureCreationViewController.cancelAction(_:)();
}

- (void)clearAction
{
  v2 = self;
  SignatureCreationViewController.clearAction()();
}

- (void)descriptionAction
{
  v2 = self;
  SignatureCreationViewController.descriptionAction()();
}

- (void)updateDoneButtonState:(id)a3
{
  id v4 = (UITextField *)a3;
  uint64_t v5 = self;
  SignatureCreationViewController.updateDoneButtonState(_:)(v4);
}

- (void)canvasViewDrawingDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  specialized SignatureCreationViewController.canvasViewDrawingDidChange(_:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_signatureLineColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_buttonImageConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_xmarkImageConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_navigationBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_signatureView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_signatureLineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_doneItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_clearButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_savedFirstResponder));
  outlined consume of SignatureDescription(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_signatureDescription), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_signatureDescription));
  swift_release();
  Swift::Bool v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit31SignatureCreationViewController_customLabelDoneAction);
}

@end