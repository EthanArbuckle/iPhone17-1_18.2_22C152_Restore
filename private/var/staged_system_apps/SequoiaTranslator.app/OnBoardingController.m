@interface OnBoardingController
- (NSArray)keyCommands;
- (_TtC17SequoiaTranslator20OnBoardingController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator20OnBoardingController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC17SequoiaTranslator20OnBoardingController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC17SequoiaTranslator20OnBoardingController)initWithRootViewController:(id)a3;
- (void)_primaryActionKeyTriggered;
- (void)continueButtonPressed;
- (void)viewDidLoad;
@end

@implementation OnBoardingController

- (_TtC17SequoiaTranslator20OnBoardingController)initWithCoder:(id)a3
{
  uint64_t v5 = type metadata accessor for TranslationTaskHint();
  __chkstk_darwin(v5);
  uint64_t v7 = OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController_languagesService;
  (*(void (**)(char *, void))(v8 + 104))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for TranslationTaskHint.speech(_:));
  type metadata accessor for LanguagesService();
  swift_allocObject();
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v7) = (Class)LanguagesService.init(task:)();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController____lazy_storage___onBoardingController) = 0;
  *(void *)&self->languagesService[OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController_oBDelegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC17SequoiaTranslator20OnBoardingController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OnBoardingController();
  id v2 = v5.receiver;
  [(OnBoardingController *)&v5 viewDidLoad];
  [v2 setNavigationBarHidden:1];
  sub_100007620((uint64_t *)&unk_1002F0270);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10024CE10;
  *(void *)(v3 + 32) = sub_10017D0B0();
  specialized Array._endMutation()();
  sub_10000B0CC(0, (unint64_t *)&unk_1002F96C0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 setViewControllers:isa];
}

- (NSArray)keyCommands
{
  sub_100007620((uint64_t *)&unk_1002F0270);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10024CE10;
  v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [self keyCommandWithInput:v5 modifierFlags:0 action:"_primaryActionKeyTriggered"];

  *(void *)(v3 + 32) = v6;
  specialized Array._endMutation()();

  sub_10000B0CC(0, (unint64_t *)&qword_1002FBDA0);
  v7.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

- (void)_primaryActionKeyTriggered
{
  id v2 = self;
  sub_10017E510();
}

- (void)continueButtonPressed
{
  char v2 = *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController_whatsNew);
  uint64_t v3 = self;
  if ((v2 & 1) == 0) {
    sub_10017E714();
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_1001806A8(v3);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC17SequoiaTranslator20OnBoardingController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC17SequoiaTranslator20OnBoardingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC17SequoiaTranslator20OnBoardingController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC17SequoiaTranslator20OnBoardingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC17SequoiaTranslator20OnBoardingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17SequoiaTranslator20OnBoardingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController____lazy_storage___onBoardingController));
  id v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator20OnBoardingController_oBDelegate;

  sub_100013384((uint64_t)v3);
}

@end