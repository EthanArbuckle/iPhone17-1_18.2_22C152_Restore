@interface TranslationListController
- (_TtC17SequoiaTranslator25TranslationListController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator25TranslationListController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TranslationListController

- (_TtC17SequoiaTranslator25TranslationListController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002289BC();
}

- (void)loadView
{
  v2 = self;
  sub_10021AD6C();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranslationListController();
  id v2 = v3.receiver;
  [(TranslationListController *)&v3 viewDidLoad];
  sub_10021CA0C();
  sub_10021DE4C(1);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10021AF18(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_10021B0D0((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranslationListController();
  id v2 = v3.receiver;
  [(TranslationListController *)&v3 viewDidLayoutSubviews];
  sub_10021B790();
}

- (_TtC17SequoiaTranslator25TranslationListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17SequoiaTranslator25TranslationListController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryTextView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  v9 = self;
  sub_100224474(v8, a4, a5);

  swift_unknownObjectRelease();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100228B38();
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100224DB4(v4);
}

@end