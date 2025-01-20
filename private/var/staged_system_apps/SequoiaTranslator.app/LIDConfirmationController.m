@interface LIDConfirmationController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC17SequoiaTranslator25LIDConfirmationController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator25LIDConfirmationController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)backgroundTappedWithRecognizer:(id)a3;
- (void)hintTapped;
- (void)optionButtonPressedWithSender:(id)a3;
- (void)viewDidLoad;
@end

@implementation LIDConfirmationController

- (_TtC17SequoiaTranslator25LIDConfirmationController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC17SequoiaTranslator25LIDConfirmationController *)sub_100134F3C(v5, v7, a4);
}

- (_TtC17SequoiaTranslator25LIDConfirmationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001367A0();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LIDConfirmationController();
  id v2 = v3.receiver;
  [(LIDConfirmationController *)&v3 viewDidLoad];
  sub_100135270();
  sub_100135BC4();
}

- (void)optionButtonPressedWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100135F18();
}

- (void)backgroundTappedWithRecognizer:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    id v7 = a3;
    id v8 = self;
    [v6 cancelConfirmation];

    swift_unknownObjectRelease();
  }
}

- (void)hintTapped
{
  id v2 = self;
  sub_1001363B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_confirmationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_hintButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_layoutContainer));
  sub_100013384((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_delegate);
  sub_100013384((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_languageDownloadPresenter);
  sub_1000CA304((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_sourceLocale);
  objc_super v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_targetLocale;

  sub_1000CA304((uint64_t)v3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = [v7 view];
  if (v9)
  {
    v10 = v9;
    unsigned __int8 v11 = [v9 isDescendantOfView:*(Class *)((char *)&v8->super.super.super.isa+ OBJC_IVAR____TtC17SequoiaTranslator25LIDConfirmationController_layoutContainer)];

    char v12 = v11 ^ 1;
  }
  else
  {

    char v12 = 1;
  }

  return v12;
}

@end