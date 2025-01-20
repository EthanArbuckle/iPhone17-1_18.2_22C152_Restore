@interface FavoritesDetailListController
- (_TtC17SequoiaTranslator29FavoritesDetailListController)initWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation FavoritesDetailListController

- (_TtC17SequoiaTranslator29FavoritesDetailListController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator29FavoritesDetailListController____lazy_storage___favoritesLocalePairResultsController) = (Class)1;
  id v4 = a3;

  result = (_TtC17SequoiaTranslator29FavoritesDetailListController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FavoritesDetailListController();
  id v2 = v6.receiver;
  [(FavoritesCardListController *)&v6 viewDidLoad];
  id v3 = [v2 navigationItem];
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 setTitle:v4];

  id v5 = [v2 navigationItem];
  [v5 setLargeTitleDisplayMode:2];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator29FavoritesDetailListController____lazy_storage___favoritesLocalePairResultsController);

  sub_1000E8DD0(v3);
}

@end