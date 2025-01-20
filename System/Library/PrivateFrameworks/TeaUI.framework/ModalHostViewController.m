@interface ModalHostViewController
- (NSArray)keyCommands;
- (_TtC5TeaUI23ModalHostViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI23ModalHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (int64_t)preferredStatusBarStyle;
- (void)closeButtonPressedWithSender:(id)a3;
- (void)dismissKeyCommand;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ModalHostViewController

- (_TtC5TeaUI23ModalHostViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B61819C8();
}

- (void)closeButtonPressedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B6181AE0();
}

- (_TtC5TeaUI23ModalHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  ModalHostViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI23ModalHostViewController_delegate);
  id v3 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5TeaUI23ModalHostViewController_styler);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI23ModalHostViewController_viewController));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI23ModalHostViewController_transitionEffectView));
  sub_1B61845E4((uint64_t)self + OBJC_IVAR____TtC5TeaUI23ModalHostViewController_session, &qword_1EB640CB8, (void (*)(uint64_t))type metadata accessor for ModalViewSession);
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)viewDidLoad
{
  v2 = self;
  ModalHostViewController.viewDidLoad()();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  ModalHostViewController.viewWillLayoutSubviews()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  ModalHostViewController.viewDidLayoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  ModalHostViewController.traitCollectionDidChange(_:)(v9);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  ModalHostViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  ModalHostViewController.viewDidDisappear(_:)(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  ModalHostViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (NSArray)keyCommands
{
  v2 = self;
  uint64_t v3 = ModalHostViewController.keyCommands.getter();

  if (v3)
  {
    sub_1B5DFF760(0, (unint64_t *)&qword_1EB647B78);
    id v4 = (void *)sub_1B61B24D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)dismissKeyCommand
{
  v2 = self;
  sub_1B61839AC();
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = ModalHostViewController.animationController(forPresented:presenting:source:)((int)v11, v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = ModalHostViewController.animationController(forDismissed:)();

  return v6;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ModalHostViewController.presentationControllerDidDismiss(_:)((UIPresentationController)v5);
}

@end