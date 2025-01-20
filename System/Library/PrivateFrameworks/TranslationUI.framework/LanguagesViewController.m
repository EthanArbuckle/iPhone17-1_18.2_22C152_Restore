@interface LanguagesViewController
- (BOOL)_canShowWhileLocked;
- (_TtC13TranslationUI23LanguagesViewController)initWithCoder:(id)a3;
- (_TtC13TranslationUI23LanguagesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)closeActionWithSender:(id)a3;
- (void)updateSelectedTarget;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LanguagesViewController

- (_TtC13TranslationUI23LanguagesViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_segmentedControl) = 0;
  uint64_t v5 = OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_selectionModel;
  type metadata accessor for LanguageSelectionModel();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1DB125B34();
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_subscriptions) = (Class)MEMORY[0x1E4FBC860];

  result = (_TtC13TranslationUI23LanguagesViewController *)sub_1DB1F1B90();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DB150FB0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1DB151BCC(a3);
}

- (void)updateSelectedTarget
{
  v2 = self;
  sub_1DB152F8C();
}

- (void)closeActionWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1DB1F1990();
  swift_unknownObjectRelease();
  [(LanguagesViewController *)v4 dismissViewControllerAnimated:1 completion:0];

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC13TranslationUI23LanguagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13TranslationUI23LanguagesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_segmentedControl));
  swift_release();
  sub_1DB154250((uint64_t)self + OBJC_IVAR____TtC13TranslationUI23LanguagesViewController_delegate);
  swift_bridgeObjectRelease();
}

@end