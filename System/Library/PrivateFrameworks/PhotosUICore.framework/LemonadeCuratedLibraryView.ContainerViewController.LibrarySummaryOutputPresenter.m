@interface LemonadeCuratedLibraryView.ContainerViewController.LibrarySummaryOutputPresenter
- (BOOL)wantsLocationNames;
- (NSString)title;
- (_TtCCV12PhotosUICore26LemonadeCuratedLibraryView23ContainerViewControllerP33_3214E6D65D1AA0606897629850A43E8429LibrarySummaryOutputPresenter)init;
- (void)setTitle:(id)a3;
@end

@implementation LemonadeCuratedLibraryView.ContainerViewController.LibrarySummaryOutputPresenter

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1AB23A76C();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_1A9C7D744(v4, v6);
}

- (_TtCCV12PhotosUICore26LemonadeCuratedLibraryView23ContainerViewControllerP33_3214E6D65D1AA0606897629850A43E8429LibrarySummaryOutputPresenter)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCCV12PhotosUICore26LemonadeCuratedLibraryView23ContainerViewControllerP33_3214E6D65D1AA0606897629850A43E8429LibrarySummaryOutputPresenter_title);
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCCV12PhotosUICore26LemonadeCuratedLibraryView23ContainerViewControllerP33_3214E6D65D1AA0606897629850A43E8429LibrarySummaryOutputPresenter_onChange);
  uint64_t v5 = (objc_class *)type metadata accessor for LemonadeCuratedLibraryView.ContainerViewController.LibrarySummaryOutputPresenter();
  *uint64_t v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return [(LemonadeCuratedLibraryView.ContainerViewController.LibrarySummaryOutputPresenter *)&v7 init];
}

- (BOOL)wantsLocationNames
{
  return 0;
}

- (NSString)title
{
  if (*(void *)&self->title[OBJC_IVAR____TtCCV12PhotosUICore26LemonadeCuratedLibraryView23ContainerViewControllerP33_3214E6D65D1AA0606897629850A43E8429LibrarySummaryOutputPresenter_title]) {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  }
  return (NSString *)0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCCV12PhotosUICore26LemonadeCuratedLibraryView23ContainerViewControllerP33_3214E6D65D1AA0606897629850A43E8429LibrarySummaryOutputPresenter_onChange);
  sub_1A9BB8934(v3);
}

@end