@interface ArtistViewController
- (_TtC16MusicApplication20ArtistViewController)initWithCoder:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ArtistViewController

- (_TtC16MusicApplication20ArtistViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_215654();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20EE3C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  [(VerticalStackViewController *)&v6 viewWillAppear:v3];
  char v5 = v4[OBJC_IVAR____TtC16MusicApplication20ArtistViewController__visible];
  v4[OBJC_IVAR____TtC16MusicApplication20ArtistViewController__visible] = 1;
  if ((v5 & 1) == 0) {
    sub_210C5C();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  [(VerticalStackViewController *)&v6 viewWillDisappear:v3];
  int v5 = v4[OBJC_IVAR____TtC16MusicApplication20ArtistViewController__visible];
  v4[OBJC_IVAR____TtC16MusicApplication20ArtistViewController__visible] = 0;
  if (v5 == 1) {
    sub_210C5C();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = type metadata accessor for MetricsEvent.Page(0);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v9 = self;
  [(VerticalStackViewController *)&v12 viewDidAppear:v3];
  v10 = (id)*MetricsReportingController.shared.unsafeMutableAddressor();
  uint64_t v11 = MetricsEvent.Page.libraryArtistDetail.unsafeMutableAddressor();
  sub_215FF0(v11, (uint64_t)v8, type metadata accessor for MetricsEvent.Page);
  (*(void (**)(char *, void, void, void, void, void))((char *)&stru_68.reloff
                                                                         + (swift_isaMask & *v10)))(v8, 0, 0, 0, 0, 0);
  sub_216058((uint64_t)v8, type metadata accessor for MetricsEvent.Page);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_2102CC();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  int v5 = self;
  sub_215880();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_210700((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_artist));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController____lazy_storage___artistHeaderViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_playIntentControlsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_albumsTitleViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_albumsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_albumsMusicVideosSpacingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_musicVideosTitleViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_musicVideosViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController____lazy_storage___musicVideosPickerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_artistHeaderResponse));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_albumsResponse));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_musicVideosResponse));
  swift_release();
  swift_release();

  swift_release();
}

@end