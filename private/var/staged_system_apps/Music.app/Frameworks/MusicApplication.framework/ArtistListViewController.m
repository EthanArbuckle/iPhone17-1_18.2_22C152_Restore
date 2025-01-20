@interface ArtistListViewController
- (_TtC16MusicApplication24ArtistListViewController)init;
- (_TtC16MusicApplication24ArtistListViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication24ArtistListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)music_viewInheritedLayoutInsetsDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ArtistListViewController

- (_TtC16MusicApplication24ArtistListViewController)init
{
  return (_TtC16MusicApplication24ArtistListViewController *)sub_13B6A8();
}

- (_TtC16MusicApplication24ArtistListViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_143760();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_13BABC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_13E134(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ArtistListViewController(0);
  id v4 = v5.receiver;
  [(ArtistListViewController *)&v5 viewWillDisappear:v3];
  RequestResponse.Controller.isAutomaticReloadingEnabled.setter(0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_13E390((uint64_t)a3);
}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  v2 = self;
  sub_13E5B0();
}

- (_TtC16MusicApplication24ArtistListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication24ArtistListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController_selectedArtistIdentifier, (uint64_t *)&unk_DC8460);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController_dataSource));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24ArtistListViewController_filterOptionsController));
  swift_release();

  swift_release();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  sub_143FD0();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end