@interface DictionaryWordSelectionController
- (_TtC17SequoiaTranslator33DictionaryWordSelectionController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator33DictionaryWordSelectionController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DictionaryWordSelectionController

- (_TtC17SequoiaTranslator33DictionaryWordSelectionController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000CD5BC();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DictionaryWordSelectionController();
  id v2 = v3.receiver;
  [(DictionaryWordSelectionController *)&v3 viewDidLoad];
  sub_1000CB9E0();
  sub_1000CBD44();
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3 = self;
  sub_1000CD744();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1000CAC10(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1000CC55C((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC17SequoiaTranslator33DictionaryWordSelectionController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17SequoiaTranslator33DictionaryWordSelectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController____lazy_storage___cardCell));
  sub_1000324E4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_translationAlternativeSelectedHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_dictionaryController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_translation));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_cardBackgroundView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator33DictionaryWordSelectionController_highlightedView);
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

@end