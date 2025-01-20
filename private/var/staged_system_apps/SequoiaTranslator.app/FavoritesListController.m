@interface FavoritesListController
- (_TtC17SequoiaTranslator23FavoritesListController)initWithCoder:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FavoritesListController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000ED640();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000EDC14(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FavoritesListController();
  v4 = (char *)v6.receiver;
  [(FavoritesListController *)&v6 viewWillDisappear:v3];
  uint64_t v5 = OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController_favoriteTranslationsTipUpdates;
  if (*(void *)&v4[OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController_favoriteTranslationsTipUpdates])
  {
    swift_retain();
    Task.cancel()();
    swift_release();
  }
  *(void *)&v4[v5] = 0;

  swift_release();
}

- (_TtC17SequoiaTranslator23FavoritesListController)initWithCoder:(id)a3
{
  return (_TtC17SequoiaTranslator23FavoritesListController *)sub_1000F1B38(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_1000324E4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController____lazy_storage___invalidateFavoriteTranslationsTip));
  sub_1000E8DD0(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController____lazy_storage___favoritesResultsController));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator23FavoritesListController____lazy_storage___recentsResultsController);

  sub_1000E8DD0(v3);
}

@end